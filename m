Return-Path: <linux-gpio+bounces-25741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1613BB48DA3
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 14:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE1FC172DA7
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 12:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01641221F26;
	Mon,  8 Sep 2025 12:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GEIvseuT";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WhWNXh70"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478B91E51FB;
	Mon,  8 Sep 2025 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757334915; cv=none; b=JUn4+OLCV/shq5nKNGkkzp0OZ4l26yUmsMmrJEFYVeG5cI0A/KCEYdbnWwsUgcrXzQyNb6fFmS4KhnG8YzUgKzlCa+4xnnqaJdV7dOKm+3BWFW8or6OyVOINCQmVuR1LLMruRbJ3VluGQmyC/IKoAIE3DSg9l5b2Nga2c13sUFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757334915; c=relaxed/simple;
	bh=FCRnKoFcbeqAPhZKAQ7/PdopKUazAQXYOpjuTDKcSNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HgBCAtx3XaKFhlx5d2H8DRYok74Ab/5NiG29UWtcIOhEdQeC4Q09c+7rvAfZ4Z6aKGy2q6Y5ebP9ouwQ3sY2grnZz5+8kpIeh94Dr2t0BPcVta1wR6sRCr1MKNxOm/L5AAnOPUA0wVVrSvK5acIPDaTn5ZdZmzdaJjzyVgadf4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GEIvseuT; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WhWNXh70; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1757334532; bh=4pazTYz0Pp7qfihhWMqXcPS
	pAgYlmlZpPhlyoDrwctg=; b=GEIvseuTPS2eGdUrU1n0wNgXtliN1qokzRZ0j36p4QXAmQzbtB
	MqomDbA+OKdCTlnoTRT1MDhd6ITgpdpKPxmD4YFCgweImY5p/BIDVIjm3MblnwCGgjxSN8t1PuK
	HIgisIiiwn9kzoAmkoVFnrcJWLhaWDjXTNf5Bf5+WiXz/ukhY5XUEOVLubd13LrEWJuZvJBkKwa
	8JaZbZKGetSz1lu332q0PCMA6bBX7NAuDu1z1LJ8B4vOnPiRS+nRyaUQO1XY+eZXvjKxPFmk7ID
	8YAyJXmv/oG1H1rhYoOWYZK4x2RFr8B/G3Fgjof5GLG6h5j1PaxKDgPCXNwjlHXYCPw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1757334532; bh=4pazTYz0Pp7qfihhWMqXcPS
	pAgYlmlZpPhlyoDrwctg=; b=WhWNXh70JsO2mR1tU3AFiFjhPpppnAiDO76tl40IoprJ5z86Ll
	6bWjzhB+tDbRHcRturGVQnkrhUW2gkvlJNDw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 08 Sep 2025 15:28:46 +0300
Subject: [PATCH v6 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-sdm660-lpass-lpi-v6-3-e0a2e2ffff3a@mainlining.org>
References: <20250908-sdm660-lpass-lpi-v6-0-e0a2e2ffff3a@mainlining.org>
In-Reply-To: <20250908-sdm660-lpass-lpi-v6-0-e0a2e2ffff3a@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nickolay Goppen <setotau@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Richard Acayan <mailingradian@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757334525; l=9027;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=dvvqzr2kMxtKyakoWeWTtdFM0NLGukExJkhlIlxtfmU=;
 b=LmjXHyENYp4Sc4eGwnotT9L/Xh7Q1OAJeWzfSluMVjb21oV8o3zqRFaRM18pVR232wUxYDCCM
 jF6YmlThhd6CgtG3cH6A8SngIK+HSA2CgxN462VTy/2vGq4varXGPAI
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

From: Richard Acayan <mailingradian@gmail.com>

The Snapdragon 660 has a Low-Power Island (LPI) TLMM for configuring
pins related to audio. Add the driver for this.
Also, this driver uses predefined pin_offsets for each pin taken from
downstream driver, which does not follow the usual 0x1000 distance
between pins and uses an array with predefined offsets that do not
follow any regular pattern [1].

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Co-developed-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 drivers/pinctrl/qcom/Kconfig                    |  10 ++
 drivers/pinctrl/qcom/Makefile                   |   1 +
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c | 160 ++++++++++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index dd9bbe8f3e11c37418d2143b33c21eeea10d456b..ef42520115f461302098d878cb76c6f25e55b5e4 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -68,6 +68,16 @@ config PINCTRL_SC7280_LPASS_LPI
 	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SC7280 platform.
 
+config PINCTRL_SDM660_LPASS_LPI
+	tristate "Qualcomm Technologies Inc SDM660 LPASS LPI pin controller driver"
+	depends on GPIOLIB
+	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_LPASS_LPI
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+	  (Low Power Island) found on the Qualcomm Technologies Inc SDM660 platform.
+
 config PINCTRL_SM4250_LPASS_LPI
 	tristate "Qualcomm Technologies Inc SM4250 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 2acff520a285a47a4a179f815402adaa5ce5addd..a81c1e127897a50fb2136c5eb38a076ebe5709a6 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_PINCTRL_SC7280_LPASS_LPI) += pinctrl-sc7280-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SC8180X)	+= pinctrl-sc8180x.o
 obj-$(CONFIG_PINCTRL_SC8280XP)	+= pinctrl-sc8280xp.o
 obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
+obj-$(CONFIG_PINCTRL_SDM660_LPASS_LPI) += pinctrl-sdm660-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SDM670) += pinctrl-sdm670.o
 obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
 obj-$(CONFIG_PINCTRL_SDX55) += pinctrl-sdx55.o
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
new file mode 100644
index 0000000000000000000000000000000000000000..d93af5f0e8d301ff725019859bab950b8c7b489f
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * This driver is solely based on the limited information in downstream code.
+ * Any verification with schematics would be greatly appreciated.
+ *
+ * Copyright (c) 2023, Richard Acayan. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-lpass-lpi.h"
+
+enum lpass_lpi_functions {
+	LPI_MUX_comp_rx,
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_mclk0,
+	LPI_MUX_pdm_tx,
+	LPI_MUX_pdm_clk,
+	LPI_MUX_pdm_rx,
+	LPI_MUX_pdm_sync,
+
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
+
+static const struct pinctrl_pin_desc sdm660_lpi_pinctrl_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
+	PINCTRL_PIN(15, "gpio15"),
+	PINCTRL_PIN(16, "gpio16"),
+	PINCTRL_PIN(17, "gpio17"),
+	PINCTRL_PIN(18, "gpio18"),
+	PINCTRL_PIN(19, "gpio19"),
+	PINCTRL_PIN(20, "gpio20"),
+	PINCTRL_PIN(21, "gpio21"),
+	PINCTRL_PIN(22, "gpio22"),
+	PINCTRL_PIN(23, "gpio23"),
+	PINCTRL_PIN(24, "gpio24"),
+	PINCTRL_PIN(25, "gpio25"),
+	PINCTRL_PIN(26, "gpio26"),
+	PINCTRL_PIN(27, "gpio27"),
+	PINCTRL_PIN(28, "gpio28"),
+	PINCTRL_PIN(29, "gpio29"),
+	PINCTRL_PIN(30, "gpio30"),
+	PINCTRL_PIN(31, "gpio31"),
+};
+
+static const char * const comp_rx_groups[] = { "gpio22", "gpio24" };
+static const char * const dmic1_clk_groups[] = { "gpio26" };
+static const char * const dmic1_data_groups[] = { "gpio27" };
+static const char * const dmic2_clk_groups[] = { "gpio28" };
+static const char * const dmic2_data_groups[] = { "gpio29" };
+static const char * const mclk0_groups[] = { "gpio18" };
+static const char * const pdm_tx_groups[] = { "gpio20" };
+static const char * const pdm_clk_groups[] = { "gpio18" };
+static const char * const pdm_rx_groups[] = { "gpio21", "gpio23", "gpio25" };
+static const char * const pdm_sync_groups[] = { "gpio19" };
+
+const struct lpi_pingroup sdm660_lpi_pinctrl_groups[] = {
+	LPI_PINGROUP_OFFSET(0, LPI_NO_SLEW, _, _, _, _, 0x0000),
+	LPI_PINGROUP_OFFSET(1, LPI_NO_SLEW, _, _, _, _, 0x1000),
+	LPI_PINGROUP_OFFSET(2, LPI_NO_SLEW, _, _, _, _, 0x2000),
+	LPI_PINGROUP_OFFSET(3, LPI_NO_SLEW, _, _, _, _, 0x2010),
+	LPI_PINGROUP_OFFSET(4, LPI_NO_SLEW, _, _, _, _, 0x3000),
+	LPI_PINGROUP_OFFSET(5, LPI_NO_SLEW, _, _, _, _, 0x3010),
+	LPI_PINGROUP_OFFSET(6, LPI_NO_SLEW, _, _, _, _, 0x4000),
+	LPI_PINGROUP_OFFSET(7, LPI_NO_SLEW, _, _, _, _, 0x4010),
+	LPI_PINGROUP_OFFSET(8, LPI_NO_SLEW, _, _, _, _, 0x5000),
+	LPI_PINGROUP_OFFSET(9, LPI_NO_SLEW, _, _, _, _, 0x5010),
+	LPI_PINGROUP_OFFSET(10, LPI_NO_SLEW, _, _, _, _, 0x5020),
+	LPI_PINGROUP_OFFSET(11, LPI_NO_SLEW, _, _, _, _, 0x5030),
+	LPI_PINGROUP_OFFSET(12, LPI_NO_SLEW, _, _, _, _, 0x6000),
+	LPI_PINGROUP_OFFSET(13, LPI_NO_SLEW, _, _, _, _, 0x6010),
+	LPI_PINGROUP_OFFSET(14, LPI_NO_SLEW, _, _, _, _, 0x7000),
+	LPI_PINGROUP_OFFSET(15, LPI_NO_SLEW, _, _, _, _, 0x7010),
+	LPI_PINGROUP_OFFSET(16, LPI_NO_SLEW, _, _, _, _, 0x5040),
+	LPI_PINGROUP_OFFSET(17, LPI_NO_SLEW, _, _, _, _, 0x5050),
+
+	LPI_PINGROUP_OFFSET(18, LPI_NO_SLEW, pdm_clk, mclk0, _, _, 0x8000),
+	LPI_PINGROUP_OFFSET(19, LPI_NO_SLEW, pdm_sync, _, _, _, 0x8010),
+	LPI_PINGROUP_OFFSET(20, LPI_NO_SLEW, pdm_tx, _, _, _, 0x8020),
+	LPI_PINGROUP_OFFSET(21, LPI_NO_SLEW, pdm_rx, _, _, _, 0x8030),
+	LPI_PINGROUP_OFFSET(22, LPI_NO_SLEW, comp_rx, _, _, _, 0x8040),
+	LPI_PINGROUP_OFFSET(23, LPI_NO_SLEW, pdm_rx, _, _, _, 0x8050),
+	LPI_PINGROUP_OFFSET(24, LPI_NO_SLEW, comp_rx, _, _, _, 0x8060),
+	LPI_PINGROUP_OFFSET(25, LPI_NO_SLEW, pdm_rx, _, _, _, 0x8070),
+	LPI_PINGROUP_OFFSET(26, LPI_NO_SLEW, dmic1_clk, _, _, _, 0x9000),
+	LPI_PINGROUP_OFFSET(27, LPI_NO_SLEW, dmic1_data, _, _, _, 0x9010),
+	LPI_PINGROUP_OFFSET(28, LPI_NO_SLEW, dmic2_clk, _, _, _, 0xa000),
+	LPI_PINGROUP_OFFSET(29, LPI_NO_SLEW, dmic2_data, _, _, _, 0xa010),
+
+	LPI_PINGROUP_OFFSET(30, LPI_NO_SLEW, _, _, _, _, 0xb000),
+	LPI_PINGROUP_OFFSET(31, LPI_NO_SLEW, _, _, _, _, 0xb010),
+};
+
+const struct lpi_function sdm660_lpi_pinctrl_functions[] = {
+	LPI_FUNCTION(comp_rx),
+	LPI_FUNCTION(dmic1_clk),
+	LPI_FUNCTION(dmic1_data),
+	LPI_FUNCTION(dmic2_clk),
+	LPI_FUNCTION(dmic2_data),
+	LPI_FUNCTION(mclk0),
+	LPI_FUNCTION(pdm_tx),
+	LPI_FUNCTION(pdm_clk),
+	LPI_FUNCTION(pdm_rx),
+	LPI_FUNCTION(pdm_sync),
+};
+
+static const struct lpi_pinctrl_variant_data sdm660_lpi_pinctrl_data = {
+	.pins = sdm660_lpi_pinctrl_pins,
+	.npins = ARRAY_SIZE(sdm660_lpi_pinctrl_pins),
+	.groups = sdm660_lpi_pinctrl_groups,
+	.ngroups = ARRAY_SIZE(sdm660_lpi_pinctrl_groups),
+	.functions = sdm660_lpi_pinctrl_functions,
+	.nfunctions = ARRAY_SIZE(sdm660_lpi_pinctrl_functions),
+	.flags = LPI_FLAG_SLEW_RATE_SAME_REG | LPI_FLAG_USE_PREDEFINED_PIN_OFFSET
+};
+
+static const struct of_device_id sdm660_lpi_pinctrl_of_match[] = {
+	{
+		.compatible = "qcom,sdm660-lpass-lpi-pinctrl",
+		.data = &sdm660_lpi_pinctrl_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sdm660_lpi_pinctrl_of_match);
+
+static struct platform_driver sdm660_lpi_pinctrl_driver = {
+	.driver = {
+		.name = "qcom-sdm660-lpass-lpi-pinctrl",
+		.of_match_table = sdm660_lpi_pinctrl_of_match,
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove = lpi_pinctrl_remove,
+};
+module_platform_driver(sdm660_lpi_pinctrl_driver);
+
+MODULE_AUTHOR("Richard Acayan <mailingradian@gmail.com>");
+MODULE_DESCRIPTION("QTI SDM660 LPI GPIO pin control driver");
+MODULE_LICENSE("GPL");

-- 
2.51.0


