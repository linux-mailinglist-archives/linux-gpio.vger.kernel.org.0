Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD70A2B8B5F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 07:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgKSGJa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 01:09:30 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:38395 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgKSGJ2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Nov 2020 01:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605766971; x=1637302971;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=J6ZnnKxERGT9T2HPWlQm1/1v3luyme18RgBzTYVmCCE=;
  b=ocElcjjQmkPJ52BlW/yjbsbA6J6QG+DRgM03ZLSJrKLhDevYLMAuvkb2
   ZUMc/QPi1o9RNG2NjOiwSSufPXIiKfdzK5qzjc1LkwkOgJk7CI/jFsqEd
   8+ZL2int8SnBJCDARpr73i1FLmlhiikOk/jkW5MfatJzOFYt0Jogn0Yff
   MWtD6E6fIhSxA67JbBnEW5vWrbcP1N6/vOd7HZ4wV/kjlmYaUxlBq3v49
   K4CeVdUq2+kfU6EomwkeGcr1KgGNvlA3ple8uJrIrTFfreneFAKdK8kJO
   41anIf12tb0u496NmkqpeCDujhYOdRpT1DB47C/MAClEOcc6BTyI9GUys
   A==;
IronPort-SDR: 9gWhkw+0S1eCG8UskXwPgtDYG2gLwJWa7Jz649kKPX+MBlZzQ4c911B6owK/FUAq/K2boc+pEB
 YS5I4PXEqLAWirTwnKLcMBIcddXLFHMzAJABNgecNgID38MCjTeLKxzz/SpsgTM7yAzJK9c2Ji
 Hzjw2NR2HxyxM5IC2wGhsblwOxyf4J+YSWiMjnIGjkFcMABnEhT5Ozyp0p4cYTD895n5hRAbs6
 jB8t7Hfn7pL2ekLl5DrmOxnGFQiB1AAsCVq7YBcZHrTug32xHp2oqb75t6BMiBlEeGMnbdNEmF
 Dhk=
X-IronPort-AV: E=Sophos;i="5.77,489,1596470400"; 
   d="scan'208";a="256550944"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 14:22:50 +0800
IronPort-SDR: FqhVLSsVFe6YPh928UMmnPZaCBITo0ltr8HYKtIrjGEdVO1xXlKKgqiH5tgPiz8NMakMfIb19g
 5YJUwF/yxLBw9iLh2Sh1ulKA2W19GWLQBNzKSXfJcvpaoMVKDptfrm+sWUpziMkkbbVL8JDLKr
 JmfmC5DP8r7LJ4jz1+xxSH/+bt016mmGGBD3kC8im8a9r5rNBFTmaAyQ69IGprkHEG3SIZseTD
 6OoyGulGEgNzg1bvySGrltbepsLLq9Rsx4L+82mKmXJkr6+2EKMtlh6REupnmS1cSWfxkH85UW
 Iyl0SofOfNIAd8QC1rNqrIqs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 21:53:57 -0800
IronPort-SDR: d2fqserYGA+CxCt2Y9Pvc/KqW1ipO9o4yVrfBRG7obkY+o0qs8CG7LWFmPz8Ov5tGSf8xnspke
 8oSeqJ565VXfz2p/ivf+8R5D7PY6YL46yYUjzKHavsB3d9QYJPf498qVK8yiiptJipmdaneapb
 Bc73/Dj0YgJLYI/Zp6hq1A/fqlWrXOVCCb6w/pmdO1F1RD4zeBK5zXR0/SGYtOjeh6blzWRJcb
 /uFF8S7OOES2pYpBlgQfvD+l01OQleBFVeSZvBUWjaFi2K7CXviHVCVLJuHR5UgDmT2900DL0e
 1CY=
WDCIronportException: Internal
Received: from jfklab-fym3sg2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.107])
  by uls-op-cesaip02.wdc.com with ESMTP; 18 Nov 2020 22:09:27 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Serge Semin <fancer.lancer@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] gpio: dwapb: warn about deprecated property use
Date:   Thu, 19 Nov 2020 15:09:21 +0900
Message-Id: <20201119060921.311747-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201119060921.311747-1-damien.lemoal@wdc.com>
References: <20201119060921.311747-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In dwapb_gpio_get_pdata(), add a warning to signal the fact that a
device tree is using the deprecated "snps,nr-gpios" property instead of
the standard "ngpios" property.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/gpio/gpio-dwapb.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 2a9046c0fb16..242b058e6630 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -553,7 +553,7 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 	struct dwapb_platform_data *pdata;
 	struct dwapb_port_property *pp;
 	int nports;
-	int i;
+	int i, ret;
 
 	nports = device_get_child_node_count(dev);
 	if (nports == 0)
@@ -582,8 +582,16 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 			return ERR_PTR(-EINVAL);
 		}
 
-		if (fwnode_property_read_u32(fwnode, "ngpios", &pp->ngpio) &&
-		    fwnode_property_read_u32(fwnode, "snps,nr-gpios", &pp->ngpio)) {
+		ret = fwnode_property_read_u32(fwnode, "ngpios", &pp->ngpio);
+		if (ret) {
+			ret = fwnode_property_read_u32(fwnode, "snps,nr-gpios",
+						       &pp->ngpio);
+			if (!ret) {
+				dev_warn(dev,
+					 "deprecated \"snps,nr-gpios\" property, update device tree to use \"ngpios\".\n");
+			}
+		}
+		if (ret) {
 			dev_info(dev,
 				 "failed to get number of gpios for port%d\n",
 				 i);
-- 
2.28.0

