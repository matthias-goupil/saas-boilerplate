import React from "react";
import type { Metadata } from "next";
import { DM_Sans, Inter, Lato } from "next/font/google";
import "../globals.css";
import { Toaster } from "@/components/ui/toaster";
import { NuqsAdapter } from "nuqs/adapters/next/app";
import { I18nProviderClient } from "@/locales/client";

const lato = Lato({
  subsets: ["latin"],
  weight: ["100", "300", "400", "700", "900"],
  variable: "--font-lato",
});

const DMSans = DM_Sans({
  subsets: ["latin"],
  weight: ["100", "200", "300", "400", "500", "600", "700", "800", "900"],
  variable: "--font-dm-sans",
});

const inter = Inter({
  subsets: ["latin"],
  weight: ["100", "200", "300", "400", "500", "600", "700", "800", "900"],
  variable: "--font-inter",
});

export const metadata: Metadata = {
  title: "Create Next App",
  description: "Generated by create next app",
};

export default async function RootLayout(
  props: Readonly<{
    children: React.ReactNode;
    params: Promise<{ locale: string }>;
  }>
) {
  const { locale } = await props.params;

  return (
    <html lang={locale}>
      <body
        className={`${DMSans.variable} ${lato.variable} ${inter.variable} antialiased bg-[#F4F7FE]`}
      >
        <I18nProviderClient locale={locale}>
          <NuqsAdapter>{props.children}</NuqsAdapter>
          <Toaster />
        </I18nProviderClient>
      </body>
    </html>
  );
}
