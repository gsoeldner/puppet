node 'Guidos-MacBook-Air'
{
	file {'/tmp/hello': 
		content => "Hello world\n",
	}
}

