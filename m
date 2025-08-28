Return-Path: <linux-gpio+bounces-25159-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5796B3AAD7
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 21:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E35DE1BA7AFE
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8340327B356;
	Thu, 28 Aug 2025 19:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j67G3Cyy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15444270EBC;
	Thu, 28 Aug 2025 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756409020; cv=none; b=kqHu8UwBfjMVUIob6RQopSsRiKoZ5+1mmpNvLeI0muX7+DAHejOi/kneCPQYRrFbt2+g8e81+6tG+hdmnMW0ZH/UOgikAQnfYZ774zzDX2KV5nDA4lfWVIw9JRXklR1/+QYTXhEgbDonIY9Oj/zB0dEpf5GLGvFrJNL8oIvcTAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756409020; c=relaxed/simple;
	bh=KT3ThlL77vylRlL0LdnhraifmjDYP6lox3AggI8ipEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EiTg//c+ZP6iuNMzf+1E2v7tr4YLYqgAXyKJdhERx1sdbM5LOG8lweGq0SBO8SRyBCGFwom/aEa5yq+52Ct7ELT2lclfqdFvqGDKJwSaz3EKNPKMqyT7PEyLqzI+EqiWRbIWJlqv72vICDu3wNRe3xabZfF9WJS+nKePa0B8Wo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j67G3Cyy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE2FBC4CEFD;
	Thu, 28 Aug 2025 19:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756409019;
	bh=KT3ThlL77vylRlL0LdnhraifmjDYP6lox3AggI8ipEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j67G3CyyAVMD/x9IX7prKr9A/ZYH0xpXThcl7jNgsCLhw2uOESQDgVz91La6OI3Ts
	 e7Vklhm37Smu+a6GJXv5PgtXH5IF2MFSePHlRGUYYxyj4lJQrHPNpBQgCgixNpURCD
	 Ctm7DhrryV6V3e2YaWQ/lzOYfTdXJMWOc2TteMVYYuKolqV9WHQJyhT2jxZURrEHhO
	 55rPjrd/051lggFzBCVrhzt+wa3zf5RycwKys4tthdfOwPWOTMRUNBst78or+JLeme
	 O26UvJBQIP5ibclkNF3OKpRdWr7zsesuOp2FcBWnRnCAi4h/q1U9dEO3KhRasju2L0
	 KvtxjLP9EsvZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D73CA0FF7;
	Thu, 28 Aug 2025 19:23:39 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Date: Thu, 28 Aug 2025 22:23:39 +0300
Subject: [PATCH v4 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-sdm660-lpass-lpi-v4-3-af4afdd52965@yandex.ru>
References: <20250828-sdm660-lpass-lpi-v4-0-af4afdd52965@yandex.ru>
In-Reply-To: <20250828-sdm660-lpass-lpi-v4-0-af4afdd52965@yandex.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nickolay Goppen <setotau@yandex.ru>, 
 Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756409018; l=8801;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=FAksBGnsZ8kDvC0bR8KQg80odraUiy0qtIYjCppkfNo=;
 b=H6FQVCwkTKEnaqCp8ClKVwTY50I120DOqK9XGjbXJpf2kN+GQv2hCdK5t+KPkOXr2182GzwJy
 LYnUEQUB67iBa+NJGR/dwvIrNTA4pE2eLRiFGR/x6UipX8V2jDcnouC
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Endpoint-Received: by B4 Relay for setotau@yandex.ru/20250815 with
 auth_id=492
X-Original-From: Nickolay Goppen <setotau@yandex.ru>
Reply-To: setotau@yandex.ru

From: Richard Acayan <mailingradian@gmail.com>

The Snapdragon 660 has a Low-Power Island (LPI) TLMM for configuring
pins related to audio. Add the driver for this.
Also, this driver uses predefined pin_offsets for each pin taken from
downstream driver, which does not follow the usual 0x1000 distance
between pins and uses an array with predefined offsets that do not
follow any regular pattern [1].

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Co-developed-by: Nickolay Goppen <setotau@yandex.ru>
Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
 drivers/pinctrl/qcom/Kconfig                    |  10 ++
 drivers/pinctrl/qcom/Makefile                   |   1 +
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c | 155 ++++++++++++++++++++++++
 3 files changed, 166 insertions(+)

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
index 954f5291cc37242baffc021e3c68d850aabd57cd..cea8617ac650ecfc75c2a0c745a53d6a1b829842 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_PINCTRL_SC7280_LPASS_LPI) += pinctrl-sc7280-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SC8180X)	+= pinctrl-sc8180x.o
 obj-$(CONFIG_PINCTRL_SC8280XP)	+= pinctrl-sc8280xp.o
 obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
+obj-$(CONFIG_PINCTRL_SDM660_LPASS_LPI) += pinctrl-sdm660-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SDM670) += pinctrl-sdm670.o
 obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
 obj-$(CONFIG_PINCTRL_SDX55) += pinctrl-sdx55.o
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
new file mode 100644
index 0000000000000000000000000000000000000000..7e7e2202c6da75f4ccc60cecc4a47655f5aa5de1
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
@@ -0,0 +1,155 @@
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
+	LPI_MUX_dmic12,
+	LPI_MUX_dmic34,
+	LPI_MUX_mclk0,
+	LPI_MUX_pdm_2_gpios,
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
+static const char * const dmic12_groups[] = { "gpio26", "gpio28" };
+static const char * const dmic34_groups[] = { "gpio27", "gpio29" };
+static const char * const mclk0_groups[] = { "gpio18" };
+static const char * const pdm_2_gpios_groups[] = { "gpio20" };
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
+	/* The function names of the PDM GPIOs are derived from SDM670 */
+	LPI_PINGROUP_OFFSET(18, LPI_NO_SLEW, pdm_clk, mclk0, _, _, 0x8000),
+	LPI_PINGROUP_OFFSET(19, LPI_NO_SLEW, pdm_sync, _, _, _, 0x8010),
+	LPI_PINGROUP_OFFSET(20, LPI_NO_SLEW, pdm_2_gpios, _, _, _, 0x8020),
+	LPI_PINGROUP_OFFSET(21, LPI_NO_SLEW, pdm_rx, _, _, _, 0x8030),
+	LPI_PINGROUP_OFFSET(22, LPI_NO_SLEW, comp_rx, _, _, _, 0x8040),
+	LPI_PINGROUP_OFFSET(23, LPI_NO_SLEW, pdm_rx, _, _, _, 0x8050),
+	LPI_PINGROUP_OFFSET(24, LPI_NO_SLEW, comp_rx, _, _, _, 0x8060),
+	LPI_PINGROUP_OFFSET(25, LPI_NO_SLEW, pdm_rx, _, _, _, 0x8070),
+	LPI_PINGROUP_OFFSET(26, LPI_NO_SLEW, dmic12, _, _, _, 0x9000),
+	LPI_PINGROUP_OFFSET(27, LPI_NO_SLEW, dmic34, _, _, _, 0x9010),
+	LPI_PINGROUP_OFFSET(28, LPI_NO_SLEW, dmic12, _, _, _, 0xa000),
+	LPI_PINGROUP_OFFSET(29, LPI_NO_SLEW, dmic34, _, _, _, 0xa010),
+
+	LPI_PINGROUP_OFFSET(30, LPI_NO_SLEW, _, _, _, _, 0xb000),
+	LPI_PINGROUP_OFFSET(31, LPI_NO_SLEW, _, _, _, _, 0xb010),
+};
+
+const struct lpi_function sdm660_lpi_pinctrl_functions[] = {
+	LPI_FUNCTION(comp_rx),
+	LPI_FUNCTION(dmic12),
+	LPI_FUNCTION(dmic34),
+	LPI_FUNCTION(mclk0),
+	LPI_FUNCTION(pdm_2_gpios),
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



