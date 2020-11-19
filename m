Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C86B2B8B5C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 07:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgKSGJ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 01:09:29 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:38388 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726361AbgKSGJ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Nov 2020 01:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605766969; x=1637302969;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9LQhUpAqLwI0iwQKaXXkhnOVe9xcHtXkh8EKHQgj78w=;
  b=cFKRT1F5fDjjZ60NkkHhrxCBQ3jyZaHNCCRJtnRNd13PEZOH6w0EmbAV
   nBWXJEuOTV57w4jmGTZQ6m/oMQPZ7TVKQgLz+xMhNf8LjjCZ4m7aNXHJV
   5Ezag+sHIvVFxhzh8or/GPb1EzLLhb8rDIfJ0K2fDu2YLB88JQhGt1IqM
   cv0F87B1wxjpXw3ly7MDT8Mw64IM+CPwd5fJT8+mYR5qjAExaR2iovhmB
   w/Jn+KAWW1cHZvC2eJrVpMLShFD8aqWHdbWI/DJeY0oXz2fEa2C8SROyv
   CRHdazX1+XrBnLuBfoSh95gqu7pVuO4dfTLWvMuADg/kgYcWV7wAG71R4
   g==;
IronPort-SDR: rVwUG6hw9l7zPwtHMXNe3dMR4ULqkLJWc7wjO4EONFR+rZjNl7sWJQKfFm/1Rst7As5gPGtjlc
 CyddU4JjfLMk8UZWX+FmCQcrcgqQCK1aRrXMt1wv0PG+RoN+87/lGDqCdhRJQPcay0RUScPuvr
 5VTA6iKdIy8LBW1/q3B95r5YIf/khJhujEQU4La0v9lzaS8ypBwsfvXEMtRcFNAM5tBUCZZxfZ
 Ta4PQdJb61BdODaPenzXOe8D87HI7Hw3yCrkFfaJedXBoqvimmp8qLbhRV7uFktQsjxcdZGfjM
 EJA=
X-IronPort-AV: E=Sophos;i="5.77,489,1596470400"; 
   d="scan'208";a="256550941"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 14:22:48 +0800
IronPort-SDR: DoriIPzo+ZqOtG9/DfwuDp4FrpcaF//g1MDVjMQJI27nTMql+wNAVgzFb7KFsPFtGcbAelxBfQ
 pDqL0s84yVZKomfsbmt9tDq0p5a3Qgmi3ui0if54Y+ERtvq6KQGrCEg+Rd+h9xTPdRNs+HXdUQ
 m+QE/wexrMev789VG5KKiPrkLVT+adfnuDIOZn8TtPTmcdvWPtCKylzLpwKXJLQevcZ3NiJrui
 UEx1f1wPS7boKuMQWi1l7vm17sYjhpTEnyoso2drISEp8Q/9g2yc06YhrIBC+6TzccpS+mivOt
 3kU1VxTDrTuD/4p3Jp+tHG8L
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 21:53:56 -0800
IronPort-SDR: DWOJnqADCF0k++njYQPub49d6WU3HyeD5qWb4fpkZ7i31Rr/ipygxYPROhwW0HJmGkRlKGi/1Y
 t7iuEfArSBIoDcYcY5pNsbiS+3vV6WrQtnQ7CPIK//b3AIUz8d6dp2B8A9UUmAC/1y5wmo9Fyz
 kJB0wEIX3pjH2TJ1QU1Dhr1CvYwBHBjnXnSFXF0fvP+Ra6y9kVOI60CgqJZ1woAtbJydoRSuy4
 ftManNPF2hBdYJBBN4I0sDwR3KNpQ0f8v98kzlXbbJmIfGJzoWE5sGSFrUVEzgjvNwSquns2UH
 uys=
WDCIronportException: Internal
Received: from jfklab-fym3sg2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.107])
  by uls-op-cesaip02.wdc.com with ESMTP; 18 Nov 2020 22:09:25 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] of: Fix property supplier parsing
Date:   Thu, 19 Nov 2020 15:09:20 +0900
Message-Id: <20201119060921.311747-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201119060921.311747-1-damien.lemoal@wdc.com>
References: <20201119060921.311747-1-damien.lemoal@wdc.com>
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

Fix this by manually defining a parse_gpios() function which ignores
this deprecated property that is still present in many device trees,
skipping the search for the supplier and thus avoiding the device tree
parsing error.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/of/property.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 408a7b5f06a9..4eefe8efc2fe 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
 DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
-DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
 
 static struct device_node *parse_iommu_maps(struct device_node *np,
 					    const char *prop_name, int index)
@@ -1319,6 +1318,21 @@ static struct device_node *parse_iommu_maps(struct device_node *np,
 	return of_parse_phandle(np, prop_name, (index * 4) + 1);
 }
 
+static struct device_node *parse_gpios(struct device_node *np,
+				       const char *prop_name, int index)
+{
+	/*
+	 * Quirk for the deprecated "snps,nr-gpios" property of the
+	 * DesignWare gpio-dwapb GPIO driver: as this property parsing
+	 * conflicts with the "xx-gpios" phandle reference property, ignore it.
+	 */
+	if (strcmp(prop_name, "snps,nr-gpios") == 0)
+		return NULL;
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

