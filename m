Return-Path: <linux-gpio+bounces-24869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEB8B332C6
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 23:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25D93480F77
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 21:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F084248F5A;
	Sun, 24 Aug 2025 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYVc8ShE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D800921C9F4;
	Sun, 24 Aug 2025 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756069526; cv=none; b=cm/nY+ccRhnInqyCJm0EsB6r1e8dBWWqT20RyDnukdKEqK7+BX4FqSYMXUu2To3yv/oGRDVWdGqgRBbAGwcsSEJmIJBYZ35d4GJDUT9y0vvl/uYhjzg5iArGIiS+xCdqEd5xsv1WITRIJ5kPDUaGxgg1z9RmjrUR24nwvdmGPbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756069526; c=relaxed/simple;
	bh=ph9ffH30N+NzvbH2WvGZvTnNfPrK3EVCkcK6fsHnlEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAaSUTJFSh8KySdMIMEoWqtc8GxRXy4z/xQJ+bK+Xcm07KevywiglL2uLMRXlupXUNxGhyx2+x4p8X3xSZdvOBzy/KISOjbGfsxgwPPvwHPEKDfDEMu8rESdpRe5hZrvcwb8jWk0UnmNtX4RjPGalIH4u6ZIBoZen+Vy+oBm+uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYVc8ShE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86816C19423;
	Sun, 24 Aug 2025 21:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756069525;
	bh=ph9ffH30N+NzvbH2WvGZvTnNfPrK3EVCkcK6fsHnlEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZYVc8ShEJTKDX/6lO6VFxWamWgkBikv6Vhrlgtn6E1OvI/xSPxNk+lUZApKFAjDk4
	 QV+4pZkAL8cV2oWi+rYf2SE13Hq99Sy4XiNaS3Jbtv9XTtaejh3OIy0gbFwVxtojxj
	 zzbizzx58Dxn3md+wDn4ybv1b6YxPXvIQ0EPQjWKr5QwJrtLNLJylq19Jy+DQdgONj
	 3zWVNcOkyrbo9Ts0VmDkkMgfNUlu0Y63QCDO2xPkpGGzxJw9OJFqICdjQZos/0ZjZk
	 pLXHHT6XmPifbOEcJBTw6+bt2EqUW8vnHlqjnDLU/92Wcuwt0IFP6cpEsxNbtPO5PW
	 nd68lb3S8LhMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D234CA0FEB;
	Sun, 24 Aug 2025 21:05:25 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Date: Mon, 25 Aug 2025 00:05:26 +0300
Subject: [PATCH v2 3/3] pinctrl: qcom: Add SDM660 LPASS LPI TLMM
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250825-sdm660-lpass-lpi-v2-3-af7739f5c27e@yandex.ru>
References: <20250825-sdm660-lpass-lpi-v2-0-af7739f5c27e@yandex.ru>
In-Reply-To: <20250825-sdm660-lpass-lpi-v2-0-af7739f5c27e@yandex.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nickolay Goppen <setotau@yandex.ru>, 
 Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756069524; l=8944;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=iyxdllbI86cI8x+KSx5OX3m+3v2NCtGvLWudj6RLcQs=;
 b=bUI+5NmYbFgfw6Tn4lZA1WdmX/CScSnUfCj6h7dafxLv4wFC/DrFzneWa9TlmlKnrEt8skZMi
 pTQoRBcx6VbDFh2ykfYgWeadFU0DajpqLO5I9sRY6UvMg6jYX69oLpJ
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Endpoint-Received: by B4 Relay for setotau@yandex.ru/20250815 with
 auth_id=492
X-Original-From: Nickolay Goppen <setotau@yandex.ru>
Reply-To: setotau@yandex.ru

From: Richard Acayan <mailingradian@gmail.com>

The Snapdragon 660 has a Low-Power Island (LPI) TLMM for configuring
pins related to audio. Add the driver for this.
Also, this driver uses it's own quirky pin_offset function like downstream
driver does, which does not follow the usual 0x1000 distance between pins
and uses an array with predefined offsets that do not follow any regular
pattern [1].

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Co-developed-by: Nickolay Goppen <setotau@yandex.ru>
Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/pinctrl/qcom/Kconfig                    |  10 ++
 drivers/pinctrl/qcom/Makefile                   |   1 +
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c | 196 ++++++++++++++++++++++++
 3 files changed, 207 insertions(+)

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
index 0000000000000000000000000000000000000000..788e1c019b0b7a22360d8c32180b5abf4d0fc0dc
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
@@ -0,0 +1,196 @@
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
+static const u32 sdm660_lpi_offset[] = {
+	0x00000000,
+	0x00001000,
+	0x00002000,
+	0x00002010,
+	0x00003000,
+	0x00003010,
+	0x00004000,
+	0x00004010,
+	0x00005000,
+	0x00005010,
+	0x00005020,
+	0x00005030,
+	0x00006000,
+	0x00006010,
+	0x00007000,
+	0x00007010,
+	0x00005040,
+	0x00005050,
+	0x00008000,
+	0x00008010,
+	0x00008020,
+	0x00008030,
+	0x00008040,
+	0x00008050,
+	0x00008060,
+	0x00008070,
+	0x00009000,
+	0x00009010,
+	0x0000A000,
+	0x0000A010,
+	0x0000B000,
+	0x0000B010,
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
+	LPI_PINGROUP(0, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(1, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(2, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(3, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(4, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(5, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(10, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(11, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(14, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(15, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(16, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
+
+	/* The function names of the PDM GPIOs are derived from SDM670 */
+	LPI_PINGROUP(18, LPI_NO_SLEW, pdm_clk, mclk0, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, pdm_sync, _, _, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, pdm_2_gpios, _, _, _),
+	LPI_PINGROUP(21, LPI_NO_SLEW, pdm_rx, _, _, _),
+	LPI_PINGROUP(22, LPI_NO_SLEW, comp_rx, _, _, _),
+	LPI_PINGROUP(23, LPI_NO_SLEW, pdm_rx, _, _, _),
+	LPI_PINGROUP(24, LPI_NO_SLEW, comp_rx, _, _, _),
+	LPI_PINGROUP(25, LPI_NO_SLEW, pdm_rx, _, _, _),
+	LPI_PINGROUP(26, LPI_NO_SLEW, dmic12, _, _, _),
+	LPI_PINGROUP(27, LPI_NO_SLEW, dmic34, _, _, _),
+	LPI_PINGROUP(28, LPI_NO_SLEW, dmic12, _, _, _),
+	LPI_PINGROUP(29, LPI_NO_SLEW, dmic34, _, _, _),
+
+	LPI_PINGROUP(30, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(31, LPI_NO_SLEW, _, _, _, _),
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
+static u32 pin_offset_sdm660(int pin_id)
+{
+	return sdm660_lpi_offset[pin_id];
+}
+
+static const struct lpi_pinctrl_variant_data sdm660_lpi_pinctrl_data = {
+	.pins = sdm660_lpi_pinctrl_pins,
+	.npins = ARRAY_SIZE(sdm660_lpi_pinctrl_pins),
+	.groups = sdm660_lpi_pinctrl_groups,
+	.ngroups = ARRAY_SIZE(sdm660_lpi_pinctrl_groups),
+	.functions = sdm660_lpi_pinctrl_functions,
+	.nfunctions = ARRAY_SIZE(sdm660_lpi_pinctrl_functions),
+	.flags = LPI_FLAG_SLEW_RATE_SAME_REG,
+	.pin_offset = pin_offset_sdm660,
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



