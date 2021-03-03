Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F6B32C7A8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380274AbhCDAc0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380352AbhCCN3m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 08:29:42 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D98DC0611C0
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 05:26:36 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id b15so4161790pjb.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 05:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oS9tdC9Z8IoMZXBDO08ijI5tila7vbTI9+MBWjUlrPE=;
        b=jN2+VCZ8qhkcG9kSkKR4Rm+4Qxby1UZ1QSj6jnzn3clp+XpQm3YybKOgRHN2zhmrKw
         egKARPxkkfAfN49nQPFzu/lXBlMMmQEIfkyMLwybVDSMvJhb6omFiByUhYjkHLg8zFIT
         YoxI/Y+On9DuZWNHP2hn+wyB2+s+J/bEoR4kVmh7wbL71ajpWwFf+Gi50xTXFwvdnFTW
         rBJAkycWvNzY4HD22IVCgLSDFrgvsT+az8+5ZbRBgxP/lG6y+mQTWLaOqyg5LpRJWptw
         j1j08YEyePo+fHh23+LVCL7aYjPZT4ko00GWAh0nyvXRgyPK5YaSE8D1mScrO9H9SMzr
         BnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oS9tdC9Z8IoMZXBDO08ijI5tila7vbTI9+MBWjUlrPE=;
        b=Fh9H8agjcGVDWIcf/PDhZCvQOJr2cHQE/Ze6+SaoLJwoYsvkVHs3fRIY1JIZtjdGhY
         hWpEtm+N6aoHbIKl9vCuPtw55T2oEN3UM/UVd1zb0g7V6w+IOTVEiomX3rtvpX4jfqp7
         TT0XcMhzwkcLCIXLQ+TMMlEcHHQUAnfrZwcF65CPls4b/WEHNIZgYDi/ICRLKnFkoF1G
         S/jXNyvIcP+ygYsliVZW6hYJTbUg7xM2bMFkCnX4qiZNYKUPM+vy0xXXxGSooo8W9H4l
         tpfza4vOjPd0YZ2EJsBCT4tZQlrtaSLuxL7w1d3madB6pU3pFcZLrTeDL6hNqbbMLuYw
         AT2A==
X-Gm-Message-State: AOAM533AA9mf4S6IDqIg8GBF2vFeHMthyog+6vyfx42H4lPS/gPfPNJy
        bZ93dDEsYhUGfZ+xfa/nRxlOyg==
X-Google-Smtp-Source: ABdhPJzB4Zh0P7iqxY8N3A/mlvmnQFHYVH5MLLvcOnf5uUMP2bFrHK/cttwIbVrFv65Y6UHjpFcfdg==
X-Received: by 2002:a17:902:e806:b029:e5:cb85:dc4d with SMTP id u6-20020a170902e806b02900e5cb85dc4dmr2024856plg.11.1614777996033;
        Wed, 03 Mar 2021 05:26:36 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y20sm24425044pfo.210.2021.03.03.05.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:26:35 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 2/2] pinctrl: qcom: sc8180x: add ACPI probe support
Date:   Wed,  3 Mar 2021 21:26:22 +0800
Message-Id: <20210303132622.4115-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303132622.4115-1-shawn.guo@linaro.org>
References: <20210303132622.4115-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It adds ACPI probe support with tile offsets passed over to msm core
driver via sc8180x_tile_offsets, as TLMM is described a single memory
region in ACPI DSDT.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig           |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 49 ++++++++++++++++++++++++--
 2 files changed, 48 insertions(+), 3 deletions(-)

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
index b765bf667574..3ec74ea37c1b 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2020-2021, Linaro Ltd.
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -17,6 +18,12 @@ static const char * const sc8180x_tiles[] = {
 	"west"
 };
 
+static const u32 sc8180x_tile_offsets[] = {
+	0x00d00000,
+	0x00500000,
+	0x00100000
+};
+
 enum {
 	SOUTH,
 	EAST,
@@ -1557,6 +1564,13 @@ static const struct msm_pingroup sc8180x_groups[] = {
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
@@ -1588,13 +1602,43 @@ static struct msm_pinctrl_soc_data sc8180x_pinctrl = {
 	.nwakeirq_map = ARRAY_SIZE(sc8180x_pdc_map),
 };
 
+static const struct msm_pinctrl_soc_data sc8180x_acpi_pinctrl = {
+	.tiles = sc8180x_tiles,
+	.ntiles = ARRAY_SIZE(sc8180x_tiles),
+	.tile_offsets = sc8180x_tile_offsets,
+	.pins = sc8180x_pins,
+	.npins = ARRAY_SIZE(sc8180x_pins),
+	.groups = sc8180x_groups,
+	.ngroups = ARRAY_SIZE(sc8180x_groups),
+	.reserved_gpios = sc8180x_acpi_reserved_gpios,
+	.ngpios = 191,
+};
+
 static int sc8180x_pinctrl_probe(struct platform_device *pdev)
 {
-	return msm_pinctrl_probe(pdev, &sc8180x_pinctrl);
+	const struct msm_pinctrl_soc_data *soc_data;
+
+	soc_data = device_get_match_data(&pdev->dev);
+	if (!soc_data)
+		return -EINVAL;
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
@@ -1603,6 +1647,7 @@ static struct platform_driver sc8180x_pinctrl_driver = {
 	.driver = {
 		.name = "sc8180x-pinctrl",
 		.of_match_table = sc8180x_pinctrl_of_match,
+		.acpi_match_table = sc8180x_pinctrl_acpi_match,
 	},
 	.probe = sc8180x_pinctrl_probe,
 	.remove = msm_pinctrl_remove,
-- 
2.17.1

