terraform {
	source = "../../../modules/gcp/gke"
}

include {
	path = find_in_parent_folders()
}

inputs = {
	env_name = "example-gkecluster-com"
	node_pool_name = "example-gkecluster-com-nodepool"
	project_id     = "example-gkecluster-com"
	region		= "europe-west1"
	network		= "gke-network"
	subnetwork	= "gke-subnet"
	ip_range_pods_name = "ip-range-pods"
	ip_range_services_name = "ip-range-services-name"
}
