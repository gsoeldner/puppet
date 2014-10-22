node 'Cookbook'
{
	file {'/tmp/hello': 
		content => "Hello world\n",
	}
}

