Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDCA2C4CC8
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Nov 2020 02:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731621AbgKZBr0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Nov 2020 20:47:26 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:25409 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731763AbgKZBr0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Nov 2020 20:47:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606356394; x=1637892394;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jaazsxrVvV8tPhcRqmgPoIk7ltaGY+++dUPG/KOZ+94=;
  b=bA+ZNZPMUrbRCEwpQsYRJaalOFrZlDbucLyB36Ez20vMzhWi4ubcRvBi
   VXp/32PtH8TZhl5gUMjd6zbTYx1FWdvgA4CPmCS+N3Xr9NU+uWd7Wz2mT
   iubSScH323GHMWqYwItMkZQd/e0RWFS3KwI3ZKC8pVqDZXv1FW8+GpNwX
   HaASl5Asj4+87OXbkK5+AtWU0gmf1eoOEgv3xMpOmWyVgnBuSmjDyTW2F
   tHiDyX6OIhyNSc39qiDQpMcQELkJjIh7vDou+6SU7nbeS1vllZVUjdv0H
   Vb4NRqAOhqq63zof+O1MuMl3xpujYI9IiKXgG7h0z7a24xpCpDvFN5qYb
   g==;
IronPort-SDR: kPeMmynqB0DomEPOntIsO1C5DjefzzZI+K5Qwto5Tm+aQX5TGEEFTecRN3tUM6b+3nsOfrueTA
 yZzzzhw1F6bcvITEQJa0hfJG2i1InNE8ZZV8TuySfGHcZqweL5u+OKFuwYYY4aS/VdJUk8xvLZ
 CjILBhGfor24zUe62uLvaIHxp8OY+yinU4/Qoa8px3LQv1VVy+bBdS+tO7QnRdqF2162hRfb90
 2dROEJFN32pIt3e+OjYC2pJIwjx1c2tujExVGJdvfkDvKY/XYjUciqk6DjRUb2PIOMJofBl6AO
 Fc8=
X-IronPort-AV: E=Sophos;i="5.78,370,1599494400"; 
   d="scan'208";a="257148716"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2020 10:06:34 +0800
IronPort-SDR: FUBX6QhPYK/710wlDfWcRsDecqJJtxRnLhcCMHoGU69+4bZ3PhAcDBkM/qsNIet0UjOYRZnvum
 ac8EhPF8RB9POGgtgOibh1qp2FjZnZGZE=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 17:33:08 -0800
IronPort-SDR: Fz9r/tcQs5K5pT+XQ8Wci6I6bZGHjj/Nu2Ra56t/K7bXPaAtMuk7GoyqBx/sJj9zVSVlIfd7bz
 YZqvmOIED4+A==
WDCIronportException: Internal
Received: from 57m2vf2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.135])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Nov 2020 17:47:24 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 1/1] of: Fix gpios supplier parsing
Date:   Thu, 26 Nov 2020 10:47:16 +0900
Message-Id: <20201126014716.34545-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201126014716.34545-1-damien.lemoal@wdc.com>
References: <20201126014716.34545-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The DesignWare gpio-dwapb GPIO driver ("snps,dw-apb-gpio" or
"apm,xgene-gpio-v2" compatible string) defines the now deprecated
property "snps,nr-gpios" to specify the number of GPIOs available
on a port. However, if this property is used in a device tree, its
"-gpios" suffix causes the generic property supplier parsing code to
interpret it as a cell reference when properties are parsed in
of_link_to_suppliers(), leading to an error messages such as:

OF: /soc/bus@50200000/gpio-controller@50200000/gpio-port@0: could not
find phandle

As this deprecated property is still present in many device trees, fix
this problem by manually defining a parse_gpios() instead of using the
DEFINE_SUFFIX_PROP() macro. This new parsing function issues a warning
and then ignores the deprecated property, skipping the phandle parsing
and thus avoiding the device tree parsing error.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/of/property.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 408a7b5f06a9..304459add299 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
 DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
-DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
 
 static struct device_node *parse_iommu_maps(struct device_node *np,
 					    const char *prop_name, int index)
@@ -1319,6 +1318,25 @@ static struct device_node *parse_iommu_maps(struct device_node *np,
 	return of_parse_phandle(np, prop_name, (index * 4) + 1);
 }
 
+static struct device_node *parse_gpios(struct device_node *np,
+				       const char *prop_name, int index)
+{
+	/*
+	 * Quirk for the deprecated "snps,nr-gpios" property of the
+	 * DesignWare gpio-dwapb GPIO driver: as this property parsing
+	 * conflicts with the "xx-gpios" phandle reference property,
+	 * issue a warning and ignore it.
+	 */
+	if (strcmp(prop_name, "snps,nr-gpios") == 0) {
+		pr_warn("%pOF: \"snps,nr-gpios\" property is deprecated in favor of \"ngpios\"\n",
+			np);
+		return NULL;
+	}
+
+	return parse_suffix_prop_cells(np, prop_name, index,
+				       "-gpios", "#gpio-cells");
+}
+
 static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_clocks, },
 	{ .parse_prop = parse_interconnects, },
-- 
2.28.0

