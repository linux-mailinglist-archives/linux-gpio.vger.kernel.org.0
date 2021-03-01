Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2254D3275EB
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 02:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhCABoo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Feb 2021 20:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhCABoo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Feb 2021 20:44:44 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B80C06178B
        for <linux-gpio@vger.kernel.org>; Sun, 28 Feb 2021 17:43:46 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id l7so6206486pfd.3
        for <linux-gpio@vger.kernel.org>; Sun, 28 Feb 2021 17:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z0mBMHxaT4uoBSQcFVbT2L0+EZv1w1tZ9nt7sG1lKAE=;
        b=iTqMK3mxYaalRnrW436u79qOOY0+3tfhvfkJlOeiDEVZT8Dm0bkiObfGY7PwGqaxL1
         pRAwN6jl3Zje67R6tzz+AIs0jSCtXi6WfdcK18XfL/xbuFp7rKwdAW1DRfquidKITsay
         SLQfr/oJoLkMKiaJKrPO1g7h7dMpNuH5h9m4pfkKlKLKV3FFQqejzehbb5Up6PHInsVj
         i83SKFOTx1z1RBXzrS0Wa3ZsUIIo9YXRUrOnC8Wbv9ovuhgAO2t3dvV0SsyyRp5LMbdR
         TvaR77CpInVN8R07ACq131vOKscnDRFORn+1YX+5qs565g5Bq9SSUU1Yrkq3+2423lM4
         7oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z0mBMHxaT4uoBSQcFVbT2L0+EZv1w1tZ9nt7sG1lKAE=;
        b=JNQn7+OAhoB+v4Bu+MwdCfNRQ45cFJOhReTea5l+AB1D7YNMq3kQRVhiHaWjqLRn01
         b9hvi2fCvC+ytnTBoI9M0jljSi7iuRF3DV47CaAfktZUanwZCeZnRq5t2xkrEHcbGeRn
         +0uZR0e5doJr0TFMm0Y3JGWCyEMeyS+WQ8PvSlCOMoyrwn6LnD7lqCq36oFCXD5plxlO
         Gmii6AXeC6PM8Fwu38EhpTq8gaY5tzWbDbGP+CHgVXTcBoBZ2E39J0MJbctku/8d0Zkv
         wwIz78djyMYF5CTcJsQQ8DwYjVDsqPwQgzCFFKDsmnf8p58+0tHyDm7AlU9kYL+zTXGs
         ZFLA==
X-Gm-Message-State: AOAM531HWknpYnRw+KsXL9d6x37Xb4N/vopiekvcEJdlK/DPaSHvg4L7
        Hr2Ee0XL7IwI4leVvhyjuUjgXg==
X-Google-Smtp-Source: ABdhPJz+JIopAVE1SCT8Pgx4eS/YoSS7qIkoEiQUv/aFVw7tAIVL/Td5pgMEB/6u677fhh5oR2fSTg==
X-Received: by 2002:a63:1c19:: with SMTP id c25mr11586114pgc.374.1614563025828;
        Sun, 28 Feb 2021 17:43:45 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id q95sm5641080pjq.20.2021.02.28.17.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 17:43:45 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/2] pinctrl: qcom: sc8180x: add ACPI probe support
Date:   Mon,  1 Mar 2021 09:43:29 +0800
Message-Id: <20210301014329.30104-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210301014329.30104-1-shawn.guo@linaro.org>
References: <20210301014329.30104-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It adds ACPI probe support with tile offsets passed over to msm core
driver via sc8180x_tile_offsets, as TLMM is described a single memory
region in ACPI DSDT.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig           |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 48 +++++++++++++++++++++++++-
 2 files changed, 48 insertions(+), 2 deletions(-)

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
index b765bf667574..38117ceb4d8f 100644
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
+	-1
+};
+
 static const struct msm_gpio_wakeirq_map sc8180x_pdc_map[] = {
 	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 }, { 12, 104 },
 	{ 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 }, { 30, 39 }, { 36, 43 },
@@ -1588,11 +1602,42 @@ static struct msm_pinctrl_soc_data sc8180x_pinctrl = {
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
+	int ret;
+
+	if (pdev->dev.of_node) {
+		ret = msm_pinctrl_probe(pdev, &sc8180x_pinctrl);
+	} else if (has_acpi_companion(&pdev->dev)) {
+		ret = msm_pinctrl_probe(pdev, &sc8180x_acpi_pinctrl);
+	} else {
+		dev_err(&pdev->dev, "DT and ACPI disabled\n");
+		ret = -EINVAL;
+	}
+
+	return ret;
 }
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id sc8180x_pinctrl_acpi_match[] = {
+	{ "QCOM040D"},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, sc8180x_pinctrl_acpi_match);
+#endif
+
 static const struct of_device_id sc8180x_pinctrl_of_match[] = {
 	{ .compatible = "qcom,sc8180x-tlmm", },
 	{ },
@@ -1603,6 +1648,7 @@ static struct platform_driver sc8180x_pinctrl_driver = {
 	.driver = {
 		.name = "sc8180x-pinctrl",
 		.of_match_table = sc8180x_pinctrl_of_match,
+		.acpi_match_table = ACPI_PTR(sc8180x_pinctrl_acpi_match),
 	},
 	.probe = sc8180x_pinctrl_probe,
 	.remove = msm_pinctrl_remove,
-- 
2.17.1

