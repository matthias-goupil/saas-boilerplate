import AdminLayout from "@/components/layouts/adminLayout";
import { Card } from "@/components/ui/card";
import React from "react";

function DashboardPage() {
  return (
    <AdminLayout
      title="Dashboard"
      breadcrumb={[
        "Dashboard",
        {
          label: "Home",
          href: "/dashboard",
        },
      ]}
    >
      <Card className="p-5 h-screen">
        <p>Contenu de la page home</p>
      </Card>
    </AdminLayout>
  );
}

export default DashboardPage;
