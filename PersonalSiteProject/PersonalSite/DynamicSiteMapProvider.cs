using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Xml;

namespace PersonalSite
{
    public class DynamicSiteMapProvider : StaticSiteMapProvider
    {
        private String _siteMapFileName;
        private SiteMapNode _rootNode = null;
        private const String SiteMapNodeName = "siteMapNode";

        public override SiteMapNode RootNode
        {
            get { return BuildSiteMap(); }
        }

        public override void Initialize(string name, NameValueCollection attributes)
        {
            base.Initialize(name, attributes);
            _siteMapFileName = attributes["siteMapFile"];
        }


        protected override void Clear()
        {
            lock (this)
            {
                _rootNode = null;
                base.Clear();
            }
        }
        private XmlDocument LoadSiteMapXml()
        {
            XmlDocument siteMapXml = new XmlDocument();
            siteMapXml.Load(AppDomain.CurrentDomain.BaseDirectory + _siteMapFileName);
            return siteMapXml;
        }

        private void AddDynamicNodes(XmlElement rootElement)
        {
            // Add some football teams
            XmlElement teams = AddDynamicChildElement(rootElement, "", "Football Teams", "List of football teams created dynamically");
            AddDynamicChildElement(teams, "~/teams.aspx?name=Watford", "Watford", "Watford's team details");
            AddDynamicChildElement(teams, "~/teams.aspx?name=Reading", "Reading", "Reading's team details");
            AddDynamicChildElement(teams, "~/teams.aspx?name=Liverpool", "Liverpool", "Liverpool's team details");

            XmlElement sheffield = AddDynamicChildElement(teams, "", "Sheffield", "There is more than one team in Sheffield");
            AddDynamicChildElement(sheffield, "~/teams.aspx?name=SheffieldUnited", "Sheffield United", "Sheffield United's team details");
            AddDynamicChildElement(sheffield, "~/teams.aspx?name=SheffieldWednesday", "Sheffield Wednesday", "Sheffield Wednesday's team details");

            XmlElement manchester = AddDynamicChildElement(teams, "", "Manchester", "There is more than one team in Manchester");
            AddDynamicChildElement(manchester, "~/teams.aspx?name=ManchesterUnited", "Manchester United", "Manchester United's team details");
            AddDynamicChildElement(manchester, "~/teams.aspx?name=ManchesterCity", "Manchester City", "Manchester City's team details");
        }

        private static XmlElement AddDynamicChildElement(XmlElement parentElement, String url, String title, String description)
        {
            // Create new element from the parameters
            XmlElement childElement = parentElement.OwnerDocument.CreateElement(SiteMapNodeName);
            childElement.SetAttribute("url", url);
            childElement.SetAttribute("title", title);
            childElement.SetAttribute("description", description);

            // Add it to the parent
            parentElement.AppendChild(childElement);
            return childElement;
        }
        private void GenerateSiteMapNodes(XmlElement rootElement)
        {
            _rootNode = GetSiteMapNodeFromElement(rootElement);
            AddNode(_rootNode);
            CreateChildNodes(rootElement, _rootNode);
        }

        private void CreateChildNodes(XmlElement parentElement, SiteMapNode parentNode)
        {
            foreach (XmlNode xmlElement in parentElement.ChildNodes)
            {
                if (xmlElement.Name == SiteMapNodeName)
                {
                    SiteMapNode childNode = GetSiteMapNodeFromElement((XmlElement)xmlElement);
                    AddNode(childNode, parentNode);
                    CreateChildNodes((XmlElement)xmlElement, childNode);
                }
            }
        }
        private SiteMapNode GetSiteMapNodeFromElement(XmlElement rootElement)
        {
            SiteMapNode newSiteMapNode;
            String url = rootElement.GetAttribute("url");
            String title = rootElement.GetAttribute("title");
            String description = rootElement.GetAttribute("description");

            // The key needs to be unique, so hash the url and title.
            newSiteMapNode = new SiteMapNode(this,
                (url + title).GetHashCode().ToString(), url, title, description);

            return newSiteMapNode;
        }

        public override SiteMapNode BuildSiteMap()
        {
            lock (this)
            {
                if (null == _rootNode)
                {
                    Clear();
                    // Load the sitemap's xml from the file.
                    XmlDocument siteMapXml = LoadSiteMapXml();
                    // Create the first site map item from the top node in the xml.
                    XmlElement rootElement = (XmlElement)siteMapXml.GetElementsByTagName(
                        SiteMapNodeName)[0];
                    // This is the key method - add the dynamic nodes to the xml
                    AddDynamicNodes(rootElement);
                    // Now build up the site map structure from the xml
                    GenerateSiteMapNodes(rootElement);
                }
            }
            return _rootNode;
        }

        protected override SiteMapNode GetRootNodeCore()
        {
            return RootNode;
        }
    }
}
