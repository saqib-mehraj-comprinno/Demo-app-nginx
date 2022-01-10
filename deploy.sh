aws eks update-kubeconfig --region us-east-1 --name dev-eks-cluster
#kubectl create ns test
kubectl get pods --all-namespaces
#kubectl create deployment nginx --image nginx -n test
#kubectl get namespaces
kubectl create -f k8nginx.yaml -n jenkins
