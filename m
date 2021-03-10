Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D07F333B27
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 12:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbhCJLMa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 06:12:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbhCJLMY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 06:12:24 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D297DC06174A
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 03:12:24 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id t18so1427391pjs.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 03:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=t910xUfCo6T+ccp2jGbLlVuf2Stz9bRKAHK4MexjvP4=;
        b=JrhHNXK8eRDOMg1GJwNvuWVcLKbP8SoaSrHwtAa6PX2twCsHLRa67HP5tdaxuNbTQ5
         3rUD6VOCBg3ov2hsic3zdCHUbbYmGlX79fBGf0zNcSp7v0IehcYP+8HXq3HkCbYRAgh6
         uNaR1WRZ1yGbgIPDmjGOBy+L5mgVjxdMVJWy5JKfJAR1HCj95VI4qUCmQpUrNJLy5ABS
         QFCjXyj8VZN8oc/tmxDGg0tyruoi/5niM2eKNL5kKYLen96quxK2Nz4Ji+c/5vcoIKzi
         GdfaIUS6hTTYHp8UaWRfgCY0xXHSXaE/gLC97eigYbyv80xOI5SMHJ6kLo5VLoAWmhTY
         rELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=t910xUfCo6T+ccp2jGbLlVuf2Stz9bRKAHK4MexjvP4=;
        b=nNpYuCYf220GWgpXS7toCuca+0NerE79sAZCuizD7HkKwVder0jcovE/UQk1n3fd6i
         QfjGOFTYQ1J4ytniiABILaelUAqNqvzXOXKdZGuWUHKZUx0INVve/bPZPXtOmWlb8M58
         BoGt66fJpLiSinyfPblx7/yLstf/0wl39WRR/QwxqslszDg1wcSfUzoS46u/VxIt4024
         E6kmoFMIwBF7FPVDKPo7v6uf0WwMl2Bz8LofPDgRMwq1Roxr6Dj91Oz4M0TD+8Vx1fgl
         FLP2R8oTbLw+lWUAt+0fhQ3QPmoUu+J7aBNqG7NeuzV093mNQPPHyMEW2Nqaccz254Ll
         T7hg==
X-Gm-Message-State: AOAM530f6vCvEQSwZgtMr82Qrb71QoBhN9geqLS1/q1TOR/aspO1tHU6
        Y7vHrRK8UXOJQmkQedNmtCzGTg==
X-Google-Smtp-Source: ABdhPJxwulw1rtb3ToIDxi3BzfVOPmCIGJWC9rRqF/XqaPik8kekfVkVyQDfS4Q7DsxA8d+uwkNhxw==
X-Received: by 2002:a17:903:31c4:b029:e1:8840:8ab9 with SMTP id v4-20020a17090331c4b02900e188408ab9mr2543712ple.70.1615374744416;
        Wed, 10 Mar 2021 03:12:24 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id i20sm15446949pgg.65.2021.03.10.03.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 03:12:23 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v4] pinctrl: qcom: sc8180x: add ACPI probe support
Date:   Wed, 10 Mar 2021 19:12:10 +0800
Message-Id: <20210310111210.1232-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It adds ACPI probe support for pinctrl-sc8180x driver.  We have one
problem with ACPI table, i.e. GIO0 (TLMM) block has one single memory
resource to cover 3 tiles defined by SC8180X.  To follow the hardware
layout of 3 tiles which is already supported DT probe, it adds one
function to replace the original single memory resource with 3 named
ones for tiles.  With that, We can map memory for ACPI in the same way
as DT.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
Changes for 4:
 - Add sc8180x_pinctrl_add_tile_resources() to massage memory resource
   for ACPI probe.

Changes for v3:
- Remove the use of tiles completely.
- Drop unneed include of acpi.h.

Changes for v2:
- Pass soc_data pointer via .driver_data.
- Drop use of CONFIG_ACPI and ACPI_PTR().
- Add comment for sc8180x_acpi_reserved_gpios[] terminator.

 drivers/pinctrl/qcom/Kconfig           |   2 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 119 ++++++++++++++++++++++++-
 2 files changed, 118 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 6853a896c476..9f0218c4f9b3 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -222,7 +222,7 @@ config PINCTRL_SC7280
 
 config PINCTRL_SC8180X
 	tristate "Qualcomm Technologies Inc SC8180x pin controller driver"
-	depends on GPIOLIB && OF
+	depends on GPIOLIB && (OF || ACPI)
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
index b765bf667574..4ff80a7a1221 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -23,6 +23,21 @@ enum {
 	WEST
 };
 
+/*
+ * ACPI DSDT has one single memory resource for TLMM.  The offsets below are
+ * used to locate different tiles for ACPI probe.
+ */
+struct tile_info {
+	u32 offset;
+	u32 size;
+};
+
+static const struct tile_info sc8180x_tile_info[] = {
+	{ 0x00d00000, 0x00300000, },
+	{ 0x00500000, 0x00700000, },
+	{ 0x00100000, 0x00300000, },
+};
+
 #define FUNCTION(fname)					\
 	[msm_mux_##fname] = {				\
 		.name = #fname,				\
@@ -1557,6 +1572,13 @@ static const struct msm_pingroup sc8180x_groups[] = {
 	[193] = SDC_QDSD_PINGROUP(sdc2_data, 0x4b2000, 9, 0),
 };
 
+static const int sc8180x_acpi_reserved_gpios[] = {
+	0, 1, 2, 3,
+	47, 48, 49, 50,
+	126, 127, 128, 129,
+	-1 /* terminator */
+};
+
 static const struct msm_gpio_wakeirq_map sc8180x_pdc_map[] = {
 	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 }, { 12, 104 },
 	{ 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 }, { 30, 39 }, { 36, 43 },
@@ -1588,13 +1610,105 @@ static struct msm_pinctrl_soc_data sc8180x_pinctrl = {
 	.nwakeirq_map = ARRAY_SIZE(sc8180x_pdc_map),
 };
 
+static const struct msm_pinctrl_soc_data sc8180x_acpi_pinctrl = {
+	.tiles = sc8180x_tiles,
+	.ntiles = ARRAY_SIZE(sc8180x_tiles),
+	.pins = sc8180x_pins,
+	.npins = ARRAY_SIZE(sc8180x_pins),
+	.groups = sc8180x_groups,
+	.ngroups = ARRAY_SIZE(sc8180x_groups),
+	.reserved_gpios = sc8180x_acpi_reserved_gpios,
+	.ngpios = 191,
+};
+
+static int sc8180x_pinctrl_add_tile_resources(struct platform_device *pdev)
+{
+	int nres_num = pdev->num_resources + ARRAY_SIZE(sc8180x_tiles) - 1;
+	struct resource *mres, *nres, *res;
+	int i, ret;
+
+	/*
+	 * DT already has tiles defined properly, so nothing needs to be done
+	 * for DT probe.
+	 */
+	if (pdev->dev.of_node)
+		return 0;
+
+	/* Allocate for new resources */
+	nres = devm_kzalloc(&pdev->dev, sizeof(*nres) * nres_num, GFP_KERNEL);
+	if (!nres)
+		return -ENOMEM;
+
+	res = nres;
+
+	for (i = 0; i < pdev->num_resources; i++) {
+		struct resource *r = &pdev->resource[i];
+
+		/* Save memory resource and copy others */
+		if (resource_type(r) == IORESOURCE_MEM)
+			mres = r;
+		else
+			*res++ = *r;
+	}
+
+	/* Append tile memory resources */
+	for (i = 0; i < ARRAY_SIZE(sc8180x_tiles); i++, res++) {
+		const struct tile_info *info = &sc8180x_tile_info[i];
+
+		res->start = mres->start + info->offset;
+		res->end = mres->start + info->offset + info->size - 1;
+		res->flags = mres->flags;
+		res->name = sc8180x_tiles[i];
+
+		/* Add new MEM to resource tree */
+		insert_resource(mres->parent, res);
+	}
+
+	/* Remove old MEM from resource tree */
+	remove_resource(mres);
+
+	/* Free old resources and install new ones */
+	ret = platform_device_add_resources(pdev, nres, nres_num);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to add new resources: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int sc8180x_pinctrl_probe(struct platform_device *pdev)
 {
-	return msm_pinctrl_probe(pdev, &sc8180x_pinctrl);
+	const struct msm_pinctrl_soc_data *soc_data;
+	int ret;
+
+	soc_data = device_get_match_data(&pdev->dev);
+	if (!soc_data)
+		return -EINVAL;
+
+	ret = sc8180x_pinctrl_add_tile_resources(pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to add tile resources: %d\n", ret);
+		return ret;
+	}
+
+	return msm_pinctrl_probe(pdev, soc_data);
 }
 
+static const struct acpi_device_id sc8180x_pinctrl_acpi_match[] = {
+	{
+		.id = "QCOM040D",
+		.driver_data = (kernel_ulong_t) &sc8180x_acpi_pinctrl,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, sc8180x_pinctrl_acpi_match);
+
 static const struct of_device_id sc8180x_pinctrl_of_match[] = {
-	{ .compatible = "qcom,sc8180x-tlmm", },
+	{
+		.compatible = "qcom,sc8180x-tlmm",
+		.data = &sc8180x_pinctrl,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sc8180x_pinctrl_of_match);
@@ -1603,6 +1717,7 @@ static struct platform_driver sc8180x_pinctrl_driver = {
 	.driver = {
 		.name = "sc8180x-pinctrl",
 		.of_match_table = sc8180x_pinctrl_of_match,
+		.acpi_match_table = sc8180x_pinctrl_acpi_match,
 	},
 	.probe = sc8180x_pinctrl_probe,
 	.remove = msm_pinctrl_remove,
-- 
2.17.1

