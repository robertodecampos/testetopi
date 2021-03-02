public class RepositorioServiceTO {
    public class RepositorioTO{
        public Integer id { get; set; }
        public String name { get; set; }
        public Integer stargazers_count { get; set; }
        public Integer forks_count { get; set; }
    }

    public class BuscaRepositoriosTO {
        public List<RepositorioTO> items { get; set; }
    }
}
