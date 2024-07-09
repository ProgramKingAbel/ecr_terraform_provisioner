# ⚔️ Terraform Provisioners 🔨

- Should be last resort to handle side effects/additional automation steps. WHY:
 - They introduce more complexity to the Terraform code.
 - Create external dependancies therefore tf file cannot be run on any endpoint without the prerequisite tools installed.

*N.B*
- You can add provisioner blocks inside of resources. However, it's best practice to create a null resource block when possible.
