Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3E732CC51
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 07:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbhCDGGt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 01:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233609AbhCDGGR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 01:06:17 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592B7C061761
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 22:05:37 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so99507pjb.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 22:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=16vaBi9BzoVqThTIqrJL3mXUcHy/6vtFy3wsh3+qlT8=;
        b=X838cOPDjzVEHor9a7b5sUbkiMytH23o4H1juAyRZQ6FNdMCsCEXwGizeWS5VuI664
         YE37gQsJumgrhtwXodPuRFyt2QkI+4fdjQEl+PSW2BVW9USrSB6kEPeb/t7J7aL/AwuJ
         YrNY6dg3aWU84S3oE0QNNZWPev1AcwCiWNvXSUJFsV1KH/JyObJyk9Y2EXjnKjU7mRC7
         +GAefOg7bxy7I9gs12C5jxeygmknKvk0p0UR1r4fgd2k9uqvfoIi+1f1p8deRsgewIqm
         YbomJD+59jGPAlBI5tFI/DnM/mPiOf/a8aN7C2Kxgl1Lc+rPRslTJhqdRBxrJdvwJWKM
         PHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=16vaBi9BzoVqThTIqrJL3mXUcHy/6vtFy3wsh3+qlT8=;
        b=hV4EMnlhl0A+krv+ZqBw9G8J2W3amZXVLIvoA7VMiQwkLrzCDSaCtmJWL/OKvPg6Pu
         htAvjUMWPelUP5MHAjOpi9h0P4KjQ91b3RIVHWziMo/4EfkuqZMWVeSxvPcmlozW9TsT
         jcxAvumK5XcIBDy3XHoc9tT1IYg3g9krrKhASkmLHp2ygcmkrC2DOhrxVfNCJ/E/TeIB
         iFFRCjxhPoKlLaPomteSTpm6ntofEzaqLkp05jtLmjVSMrESPcDcb7IfjWIbJaXfLsRS
         FlrGU+caTKpCpTzEXg01fJEbH09GIr9dcX5hmmnmt7E9xomaXg6i0jXmwZOg0fTfYLEY
         +2Rw==
X-Gm-Message-State: AOAM532v1ksHg11jqRyiF+rKoomsKRjgPUxWSEgScswQ9T6i3GU+2d1f
        sGoBm/DkBSZqY5lzk6OL262fwQ==
X-Google-Smtp-Source: ABdhPJzWThjcg6/XGdAPC5RnsuCrKT9Ry/YqvJLaJvOSjKtR9zn1XMOAp1n9dGZxRQwpbNTHYvd9FA==
X-Received: by 2002:a17:90a:4a8c:: with SMTP id f12mr2836821pjh.71.1614837936954;
        Wed, 03 Mar 2021 22:05:36 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id j2sm776386pgh.39.2021.03.03.22.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 22:05:36 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 2/2] pinctrl: qcom: sc8180x: add ACPI probe support
Date:   Thu,  4 Mar 2021 14:05:20 +0800
Message-Id: <20210304060520.24975-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304060520.24975-1-shawn.guo@linaro.org>
References: <20210304060520.24975-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It adds ACPI probe support for pinctrl-sc8180x driver.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig           |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 39 ++++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 3 deletions(-)

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
index 66f76ed22200..45ecb4a022ca 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -1546,6 +1546,13 @@ static const struct msm_pingroup sc8180x_groups[] = {
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
@@ -1575,13 +1582,40 @@ static struct msm_pinctrl_soc_data sc8180x_pinctrl = {
 	.nwakeirq_map = ARRAY_SIZE(sc8180x_pdc_map),
 };
 
+static const struct msm_pinctrl_soc_data sc8180x_acpi_pinctrl = {
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
@@ -1590,6 +1624,7 @@ static struct platform_driver sc8180x_pinctrl_driver = {
 	.driver = {
 		.name = "sc8180x-pinctrl",
 		.of_match_table = sc8180x_pinctrl_of_match,
+		.acpi_match_table = sc8180x_pinctrl_acpi_match,
 	},
 	.probe = sc8180x_pinctrl_probe,
 	.remove = msm_pinctrl_remove,
-- 
2.17.1

