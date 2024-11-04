Return-Path: <linux-gpio+bounces-12545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A445F9BBE37
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 20:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18B16B2173E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 19:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3EE1CC881;
	Mon,  4 Nov 2024 19:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLz5OuVk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEEA192D7D;
	Mon,  4 Nov 2024 19:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730749499; cv=none; b=jblBmS4AzRqjhHpBLT20bl3mlCZf/GkVtBASzFKWjKuSDJFDacF9g2EnZ3mwPiY5UMpKpT/qG4KHvUHnTaoVnX8pXu8YPzEnrhGYnWrMuDbVS/XrnUmRrgzb8EkMMVxnPIzFDdarsv5Q0hLBstvOxQnmtspGE7ZUre+6MX1EMx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730749499; c=relaxed/simple;
	bh=F5TDY0edd5TOHVsa9nkfCI0QHkRWt0Z3g03kUM0+sNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E19btv7SlLMYhXcZ6aeJRBeWMkVtcAlDRrB691tzhjMo1/b2vvXZzRKRHEO+uid7Uo+gOxiss6n0txyffFRCqftqx1aA1FikDfADYOj3O/mAS8DFEx6HzrLD6OQvhPlLtOQK/+tMc92lCd4OmX+ov9bi3+QVYLBQRFKiV5Pmnjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLz5OuVk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC41C4CECE;
	Mon,  4 Nov 2024 19:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730749498;
	bh=F5TDY0edd5TOHVsa9nkfCI0QHkRWt0Z3g03kUM0+sNk=;
	h=From:To:Cc:Subject:Date:From;
	b=RLz5OuVkuX++yabdrw8OTb4uivH8QsfN8MtSBZHD/UmXGolQzm9oaF8mAWREN1ReF
	 lUavWhmSllSFtUf4kUiA7qITxyI8NWuN6Zv3yr5Kf/xYa3heQv+yQ5zy/NItKasbWo
	 caJ7EaHbaemuliRdYu9yYe1la2ev1lpOZaeaE8NCVbFEdVRR2sPT6Qaicv6R5yjtfa
	 tTuemsKzoUBFNenXGj1oCHY64MS7sddDZQD1E4tdBsEKzui8MvxFH8XG2EYMBrQD5l
	 YAjNIXGifj9fCvvlle477Iabq93ni1tZzQzLJUzeG9J2lCU7bFXFbBsxOcCDTR9xlg
	 gSc0e7Oh6IVSQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] pinctrl: Use of_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:44:36 -0600
Message-ID: <20241104194437.327430-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c  | 6 +++---
 drivers/pinctrl/pinctrl-xway.c           | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c       | 2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index d05c2c478e79..842a1e6cbfc4 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -633,11 +633,11 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 static bool imx_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
 	for_each_child_of_node_scoped(np, function_np) {
-		if (of_property_read_bool(function_np, "fsl,pins"))
+		if (of_property_present(function_np, "fsl,pins"))
 			return true;
 
 		for_each_child_of_node_scoped(function_np, pinctrl_np) {
-			if (of_property_read_bool(pinctrl_np, "fsl,pins"))
+			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}
 	}
@@ -746,7 +746,7 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 		if (IS_ERR(ipctl->base))
 			return PTR_ERR(ipctl->base);
 
-		if (of_property_read_bool(dev_np, "fsl,input-sel")) {
+		if (of_property_present(dev_np, "fsl,input-sel")) {
 			np = of_parse_phandle(dev_np, "fsl,input-sel", 0);
 			if (!np) {
 				dev_err(&pdev->dev, "iomuxc fsl,input-sel property not found\n");
diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index f4256a918165..48f8aabf3bfa 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1524,7 +1524,7 @@ static int pinmux_xway_probe(struct platform_device *pdev)
 	 * files which don't set the "gpio-ranges" property or systems that
 	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
 	 */
-	if (!of_property_read_bool(pdev->dev.of_node, "gpio-ranges")) {
+	if (!of_property_present(pdev->dev.of_node, "gpio-ranges")) {
 		/* finish with registering the gpio range in pinctrl */
 		xway_gpio_range.npins = xway_chip.ngpio;
 		xway_gpio_range.base = xway_chip.base;
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index aeaf0d1958f5..ec913c2e200f 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1457,7 +1457,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	 * files which don't set the "gpio-ranges" property or systems that
 	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
 	 */
-	if (!of_property_read_bool(pctrl->dev->of_node, "gpio-ranges")) {
+	if (!of_property_present(pctrl->dev->of_node, "gpio-ranges")) {
 		ret = gpiochip_add_pin_range(&pctrl->chip,
 			dev_name(pctrl->dev), 0, 0, chip->ngpio);
 		if (ret) {
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index d2dd66769aa8..33384f52f55a 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1169,7 +1169,7 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	 * files which don't set the "gpio-ranges" property or systems that
 	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
 	 */
-	if (!of_property_read_bool(dev->of_node, "gpio-ranges")) {
+	if (!of_property_present(dev->of_node, "gpio-ranges")) {
 		ret = gpiochip_add_pin_range(&state->chip, dev_name(dev), 0, 0,
 					     npins);
 		if (ret) {
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index 9cd5247ea574..87301a2445ac 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -832,7 +832,7 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 	 * files which don't set the "gpio-ranges" property or systems that
 	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
 	 */
-	if (!of_property_read_bool(pctrl->dev->of_node, "gpio-ranges")) {
+	if (!of_property_present(pctrl->dev->of_node, "gpio-ranges")) {
 		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
 					     0, 0, pctrl->chip.ngpio);
 		if (ret) {
-- 
2.45.2


