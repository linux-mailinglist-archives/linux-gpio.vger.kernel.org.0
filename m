Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1E764DCA7
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2019 23:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfFTVhj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 20 Jun 2019 17:37:39 -0400
Received: from mail.sensor-technik.de ([80.150.181.156]:1266 "EHLO
        mail.sensor-technik.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfFTVhj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jun 2019 17:37:39 -0400
Received: from stwz1.stww2k.local (HELO stwz1.sensor-technik.de) ([172.25.209.3])
  by mail.sensor-technik.de with ESMTP; 20 Jun 2019 23:37:37 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
        by stwz1.sensor-technik.de (Postfix) with ESMTP id 35BEEB5ABC;
        Thu, 20 Jun 2019 23:37:37 +0200 (CEST)
Received: from mail.sensor-technik.de (stwex1.stww2k.local [172.25.2.103])
        by stwz1.sensor-technik.de (Postfix) with ESMTP id CE94AB5AAC;
        Thu, 20 Jun 2019 23:37:09 +0200 (CEST)
Received: from STWEX1.stww2k.local (172.25.2.106) by STWEX1.stww2k.local
 (172.25.2.106) with Microsoft SMTP Server (TLS) id 15.0.1263.5; Thu, 20 Jun
 2019 23:37:09 +0200
Received: from STWEX1.stww2k.local ([172.25.5.24]) by STWEX1.stww2k.local
 ([172.25.5.24]) with mapi id 15.00.1263.000; Thu, 20 Jun 2019 23:37:09 +0200
From:   Waibel Georg <Georg.Waibel@sensor-technik.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "Mark Brown" <broonie@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        "Bartlomiej Zolnierkiewicz" <b.zolnierkie@samsung.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH V2] gpio: Fix return value mismatch of function
 gpiod_get_from_of_node()
Thread-Topic: [PATCH V2] gpio: Fix return value mismatch of function
 gpiod_get_from_of_node()
Thread-Index: AQHVJ6/07q3ULJnab0GDzhHQsxxhyg==
Date:   Thu, 20 Jun 2019 21:37:08 +0000
Message-ID: <1561066629320.13520@sensor-technik.de>
References: <1560938081892.33415@sensor-technik.de>,<CAJKOXPej57MJKe6ShinG+VJdG+XM4qhpeD3rQ2ZHzRTmO43+GA@mail.gmail.com>
In-Reply-To: <CAJKOXPej57MJKe6ShinG+VJdG+XM4qhpeD3rQ2ZHzRTmO43+GA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.25.209.16]
x-c2processedorg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-TBoneOriginalFrom: Waibel Georg <Georg.Waibel@sensor-technik.de>
X-TBoneOriginalTo: Krzysztof Kozlowski <krzk@kernel.org>
X-TBoneOriginalCC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
        <bgolaszewski@baylibre.com>, Support Opensource
        <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, "Bartlomiej
 Zolnierkiewicz" <b.zolnierkie@samsung.com>, "linux-gpio@vger.kernel.org"
        <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
        <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>
X-TBoneDomainSigned: false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In case the requested gpio property is not found in the device tree, some
callers of gpiod_get_from_of_node() expect a return value of NULL, others
expect -ENOENT.
In particular devm_fwnode_get_index_gpiod_from_child() expects -ENOENT.
Currently it gets a NULL, which breaks the loop that tries all
gpio_suffixes. The result is that a gpio property is not found, even
though it is there.

This patch changes gpiod_get_from_of_node() to return -ENOENT instead
of NULL when the requested gpio property is not found in the device
tree. Additionally it modifies all calling functions to properly
evaluate the return value.

Another approach would be to leave the return value of
gpiod_get_from_of_node() as is and fix the bug in
devm_fwnode_get_index_gpiod_from_child(). Other callers would still need
to be reworked. The effort would be the same as with the chosen solution.

Signed-off-by: Georg Waibel <georg.waibel@sensor-technik.de>
---

V2: Rebased on top of [PATCH] regulator: s2mps11: Fix ERR_PTR dereference on GPIO lookup failure

---
 drivers/gpio/gpiolib.c                 | 6 +-----
 drivers/regulator/da9211-regulator.c   | 2 ++
 drivers/regulator/s2mps11.c            | 4 +++-
 drivers/regulator/s5m8767.c            | 4 +++-
 drivers/regulator/tps65090-regulator.c | 7 ++++---
 5 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e013d41..be1d1d2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4244,8 +4244,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_index);
  *
  * Returns:
  * On successful request the GPIO pin is configured in accordance with
- * provided @dflags. If the node does not have the requested GPIO
- * property, NULL is returned.
+ * provided @dflags.
  *
  * In case of error an ERR_PTR() is returned.
  */
@@ -4267,9 +4266,6 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
 					index, &flags);
 
 	if (!desc || IS_ERR(desc)) {
-		/* If it is not there, just return NULL */
-		if (PTR_ERR(desc) == -ENOENT)
-			return NULL;
 		return desc;
 	}
 
diff --git a/drivers/regulator/da9211-regulator.c b/drivers/regulator/da9211-regulator.c
index da37b4c..0309823 100644
--- a/drivers/regulator/da9211-regulator.c
+++ b/drivers/regulator/da9211-regulator.c
@@ -289,6 +289,8 @@ static struct da9211_pdata *da9211_parse_regulators_dt(
 				  0,
 				  GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 				  "da9211-enable");
+		if (IS_ERR(pdata->gpiod_ren[n]))
+			pdata->gpiod_ren[n] = NULL;
 		n++;
 	}
 
diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index af9bf10..209d1ff 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -821,7 +821,9 @@ static void s2mps14_pmic_dt_parse_ext_control_gpio(struct platform_device *pdev,
 				0,
 				GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 				"s2mps11-regulator");
-		if (IS_ERR(gpio[reg])) {
+		if (PTR_ERR(gpio[reg]) == -ENOENT)
+			gpio[reg] = NULL;
+		else if (IS_ERR(gpio[reg])) {
 			dev_err(&pdev->dev, "Failed to get control GPIO for %d/%s\n",
 				reg, rdata[reg].name);
 			gpio[reg] = NULL;
diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index bb9d1a0..6ca27e9 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -574,7 +574,9 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 			0,
 			GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 			"s5m8767");
-		if (IS_ERR(rdata->ext_control_gpiod))
+		if (PTR_ERR(rdata->ext_control_gpiod) == -ENOENT)
+			rdata->ext_control_gpiod = NULL;
+		else if (IS_ERR(rdata->ext_control_gpiod))
 			return PTR_ERR(rdata->ext_control_gpiod);
 
 		rdata->id = i;
diff --git a/drivers/regulator/tps65090-regulator.c b/drivers/regulator/tps65090-regulator.c
index ca39b3d..10ea4b5 100644
--- a/drivers/regulator/tps65090-regulator.c
+++ b/drivers/regulator/tps65090-regulator.c
@@ -371,11 +371,12 @@ static struct tps65090_platform_data *tps65090_parse_dt_reg_data(
 								    "dcdc-ext-control-gpios", 0,
 								    gflags,
 								    "tps65090");
-			if (IS_ERR(rpdata->gpiod))
-				return ERR_CAST(rpdata->gpiod);
-			if (!rpdata->gpiod)
+			if (PTR_ERR(rpdata->gpiod) == -ENOENT) {
 				dev_err(&pdev->dev,
 					"could not find DCDC external control GPIO\n");
+				rpdata->gpiod = NULL;
+			} else if (IS_ERR(rpdata->gpiod))
+				return ERR_CAST(rpdata->gpiod);
 		}
 
 		if (of_property_read_u32(tps65090_matches[idx].of_node,
-- 
2.7.4

