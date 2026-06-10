Return-Path: <linux-gpio+bounces-38213-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 70MxLGb2KGoAOQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38213-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 07:30:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5131F665F36
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 07:30:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=X4+8MKwV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38213-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38213-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABF81307BA27
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 05:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE16372677;
	Wed, 10 Jun 2026 05:29:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620E42EDD6C;
	Wed, 10 Jun 2026 05:29:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781069398; cv=none; b=mKw8bqRTqZpH7zC2IHMUxulG/d9FacoYZ1B7O6MZe/FfuTTMzfG8KKgGUjqPFnMigmNtbof+UT2NNxhKWTjGxrK4/80sxP5Mlx8Srz4bK9hEhSvghHshtY/RRYZ5CXBuk0180wKAh5nYz8INcDq/n94goy7FfGQNRbBRhTs1X1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781069398; c=relaxed/simple;
	bh=2H+ePRY5tAIZsB4sDY5dZFbW2QsRiDfNz3dXjozC1RU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rtbFjMjxh2xOwNJDq59mAsn6upWW7+PQPC3q4MIHI06ZkduvbX0fqNsg0qTCmlke54/l716n4zXCbrx5ka2dUME391w+Agmw5cLQ4ZSqvaS0fckkHJ9bLUQFmatQS09RFHSwsC1fZbMlwHFH+fCDLbJryrSY+LLSmEpbQ8QSvUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4+8MKwV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24123C4AF10;
	Wed, 10 Jun 2026 05:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781069398;
	bh=2H+ePRY5tAIZsB4sDY5dZFbW2QsRiDfNz3dXjozC1RU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X4+8MKwVOB5DUVMXhesPI/nmJr3J2Rl5x4jRa0/hSHnM58BbKv7kw4BsKK/9udSvr
	 JagcpyeFlCLWrdBiRfpOVEsT7gO2X34dlR67VuNB713YqDQfKBZXcy0Kw3dGjK60jg
	 mC2OW26q7H4YlhLENy5uO0nzyZcb7ue/OjDEjHZzIxLsvQULvBX3+SAj5m7yRh8s4j
	 zMg/OoULR1gmDX3ccrlZHfV3dcsJ9UUlpJdwae6Djmn8HvOXqWGFTyR62NpdTTFIZ8
	 dzG3zlvHh2v6YGrWl2vrYYJYfG/oWgphZFjVIw5H2I0RJDlpqOmYGww+pGKwsPeOrA
	 QgdyDzPvvNmvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09125CD8CB9;
	Wed, 10 Jun 2026 05:29:58 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Wed, 10 Jun 2026 13:29:56 +0800
Subject: [PATCH v4 2/2] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260610-ultrarisc-pinctrl-v4-2-b7e9b2a8ed84@ultrarisc.com>
References: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
In-Reply-To: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781069395; l=26753;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=CKMr0nfz9lHg7FQprNpLIgLV/1LWPDGD60cZAPsXWkA=;
 b=1wGs3h2ktzlUh1+M5jhVcAqO7Jgz23VvMVkEYEisU5rXm7JostEA7FIL0jls6BxNfa1CfEY6F
 OFn7ENia+p/DcqDUsO9Ntaba1++mgxCnijxhXdAo5g/oIsxwu4GqqZR
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38213-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangjia@ultrarisc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ultrarisc.com:replyto,ultrarisc.com:email,ultrarisc.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5131F665F36

From: Jia Wang <wangjia@ultrarisc.com>

Add support for the pin controller on the UltraRISC DP1000 SoC.

The controller provides mux selection for pins in ports A, B, C, D, and
LPC. Ports A-D default to GPIO and support peripheral muxing. LPC pins
can be switched to eSPI, but are not available as GPIOs. Basic pin
configuration controls such as drive strength, pull-up, and pull-down
are also supported.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 MAINTAINERS                                   |   1 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/ultrarisc/Kconfig             |  20 +
 drivers/pinctrl/ultrarisc/Makefile            |   4 +
 drivers/pinctrl/ultrarisc/pinctrl-dp1000.c    | 168 +++++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c | 517 ++++++++++++++++++++++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h |  63 ++++
 8 files changed, 775 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ef874d342a5..04f2126d8af5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27362,6 +27362,7 @@ M:	Jia Wang <wangjia@ultrarisc.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
+F:	drivers/pinctrl/ultrarisc/*
 
 ULTRATRONIK BOARD SUPPORT
 M:	Goran Rađenović <goran.radni@gmail.com>
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03f2e3ee065f..2a5491e3fb47 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -708,6 +708,7 @@ source "drivers/pinctrl/sunplus/Kconfig"
 source "drivers/pinctrl/sunxi/Kconfig"
 source "drivers/pinctrl/tegra/Kconfig"
 source "drivers/pinctrl/ti/Kconfig"
+source "drivers/pinctrl/ultrarisc/Kconfig"
 source "drivers/pinctrl/uniphier/Kconfig"
 source "drivers/pinctrl/visconti/Kconfig"
 source "drivers/pinctrl/vt8500/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c..61d502ba06b9 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -95,6 +95,7 @@ obj-y				+= sunplus/
 obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
+obj-$(CONFIG_PINCTRL_ULTRARISC)	+= ultrarisc/
 obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
 obj-$(CONFIG_PINCTRL_VISCONTI)	+= visconti/
 obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
diff --git a/drivers/pinctrl/ultrarisc/Kconfig b/drivers/pinctrl/ultrarisc/Kconfig
new file mode 100644
index 000000000000..80ac997f6c51
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config PINCTRL_ULTRARISC
+	tristate
+	depends on OF
+	depends on ARCH_ULTRARISC || COMPILE_TEST
+	select GENERIC_PINCTRL
+	select PINMUX
+
+config PINCTRL_ULTRARISC_DP1000
+	tristate "UltraRISC DP1000 SoC Pinctrl driver"
+	select PINCTRL_ULTRARISC
+	depends on OF && HAS_IOMEM
+	depends on ARCH_ULTRARISC || COMPILE_TEST
+	default ARCH_ULTRARISC
+	help
+	  Say Y to select the pinctrl driver for UltraRISC DP1000 SoC.
+	  This pin controller allows selecting the mux function for
+	  each pin. This driver can also be built as a module called
+	  pinctrl-dp1000.
diff --git a/drivers/pinctrl/ultrarisc/Makefile b/drivers/pinctrl/ultrarisc/Makefile
new file mode 100644
index 000000000000..5d49ce1c0af9
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_PINCTRL_ULTRARISC)		+= pinctrl-ultrarisc.o
+obj-$(CONFIG_PINCTRL_ULTRARISC_DP1000)	+= pinctrl-dp1000.o
diff --git a/drivers/pinctrl/ultrarisc/pinctrl-dp1000.c b/drivers/pinctrl/ultrarisc/pinctrl-dp1000.c
new file mode 100644
index 000000000000..f9c85c8c4433
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/pinctrl-dp1000.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ *
+ * Author: Jia Wang <wangjia@ultrarisc.com>
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-ultrarisc.h"
+
+/* Port indices. */
+#define UR_DP1000_PORT_A_IDX		0
+#define UR_DP1000_PORT_B_IDX		1
+#define UR_DP1000_PORT_C_IDX		2
+#define UR_DP1000_PORT_D_IDX		3
+#define UR_DP1000_PORT_LPC_IDX		4
+
+/* Port mux register offsets. */
+#define UR_DP1000_PORTA_FUNC_OFFSET	0x2c0
+#define UR_DP1000_PORTB_FUNC_OFFSET	0x2c4
+#define UR_DP1000_PORTC_FUNC_OFFSET	0x2c8
+#define UR_DP1000_PORTD_FUNC_OFFSET	0x2cc
+#define UR_DP1000_PORTLPC_FUNC_OFFSET	0x2d0
+
+/* Port pinconf register offsets. */
+#define UR_DP1000_PORTA_CONF_OFFSET	0x310
+#define UR_DP1000_PORTB_CONF_OFFSET	0x318
+#define UR_DP1000_PORTC_CONF_OFFSET	0x31c
+#define UR_DP1000_PORTD_CONF_OFFSET	0x320
+#define UR_DP1000_PORTLPC_CONF_OFFSET	0x324
+
+/* Pin ranges for function descriptors. */
+#define UR_DP1000_PINS_ABCD	GENMASK_ULL(39, 0)
+#define UR_DP1000_PINS_LPC	GENMASK_ULL(52, 40)
+
+/* Static table entry helpers. */
+#define UR_DP1000_PORT(_base, _npins, _func, _conf, _modes, _gpio) \
+	{ .pin_base = (_base), .npins = (_npins), .func_offset = (_func), \
+	  .conf_offset = (_conf), .supported_modes = (_modes), \
+	  .supports_gpio = (_gpio) }
+
+#define UR_DP1000_PIN(_nr, _name, _port) \
+	{ .number = (_nr), .name = (_name), .drv_data = (void *)&ur_dp1000_ports[_port] }
+
+static const struct ur_func_route ur_dp1000_routes[] = {
+	{ "gpio", UR_FUNC_DEFAULT, UR_DP1000_PINS_ABCD },
+	{ "i2c", UR_FUNC_0, GENMASK_ULL(13, 12) },
+	{ "i2c", UR_FUNC_0, GENMASK_ULL(23, 22) },
+	{ "i2c", UR_FUNC_0, GENMASK_ULL(25, 24) },
+	{ "i2c", UR_FUNC_0, GENMASK_ULL(27, 26) },
+	{ "pwm", UR_FUNC_0, GENMASK_ULL(19, 16) },
+	{ "spi", UR_FUNC_1, GENMASK_ULL(39, 32) },
+	{ "spi", UR_FUNC_0, GENMASK_ULL(6, 0) },
+	{ "uart", UR_FUNC_1, GENMASK_ULL(9, 8) },
+	{ "uart", UR_FUNC_0, GENMASK_ULL(21, 20) },
+	{ "uart", UR_FUNC_0, GENMASK_ULL(29, 28) },
+	{ "uart", UR_FUNC_0, GENMASK_ULL(31, 30) },
+	{ "lpc", UR_FUNC_DEFAULT, UR_DP1000_PINS_LPC },
+	{ "espi", UR_FUNC_0, UR_DP1000_PINS_LPC },
+};
+
+static const struct ur_port_desc ur_dp1000_ports[] = {
+	UR_DP1000_PORT(0, 16, UR_DP1000_PORTA_FUNC_OFFSET,
+		       UR_DP1000_PORTA_CONF_OFFSET,
+		       UR_FUNC_0 | UR_FUNC_1, true),
+	UR_DP1000_PORT(16, 8, UR_DP1000_PORTB_FUNC_OFFSET,
+		       UR_DP1000_PORTB_CONF_OFFSET,
+		       UR_FUNC_0 | UR_FUNC_1, true),
+	UR_DP1000_PORT(24, 8, UR_DP1000_PORTC_FUNC_OFFSET,
+		       UR_DP1000_PORTC_CONF_OFFSET,
+		       UR_FUNC_0 | UR_FUNC_1, true),
+	UR_DP1000_PORT(32, 8, UR_DP1000_PORTD_FUNC_OFFSET,
+		       UR_DP1000_PORTD_CONF_OFFSET,
+		       UR_FUNC_0 | UR_FUNC_1, true),
+	UR_DP1000_PORT(40, 13, UR_DP1000_PORTLPC_FUNC_OFFSET,
+		       UR_DP1000_PORTLPC_CONF_OFFSET,
+		       UR_FUNC_0,             false),
+};
+
+static const struct pinctrl_pin_desc ur_dp1000_pins[] = {
+	UR_DP1000_PIN(0, "PA0", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(1, "PA1", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(2, "PA2", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(3, "PA3", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(4, "PA4", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(5, "PA5", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(6, "PA6", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(7, "PA7", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(8, "PA8", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(9, "PA9", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(10, "PA10", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(11, "PA11", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(12, "PA12", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(13, "PA13", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(14, "PA14", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(15, "PA15", UR_DP1000_PORT_A_IDX),
+	UR_DP1000_PIN(16, "PB0", UR_DP1000_PORT_B_IDX),
+	UR_DP1000_PIN(17, "PB1", UR_DP1000_PORT_B_IDX),
+	UR_DP1000_PIN(18, "PB2", UR_DP1000_PORT_B_IDX),
+	UR_DP1000_PIN(19, "PB3", UR_DP1000_PORT_B_IDX),
+	UR_DP1000_PIN(20, "PB4", UR_DP1000_PORT_B_IDX),
+	UR_DP1000_PIN(21, "PB5", UR_DP1000_PORT_B_IDX),
+	UR_DP1000_PIN(22, "PB6", UR_DP1000_PORT_B_IDX),
+	UR_DP1000_PIN(23, "PB7", UR_DP1000_PORT_B_IDX),
+	UR_DP1000_PIN(24, "PC0", UR_DP1000_PORT_C_IDX),
+	UR_DP1000_PIN(25, "PC1", UR_DP1000_PORT_C_IDX),
+	UR_DP1000_PIN(26, "PC2", UR_DP1000_PORT_C_IDX),
+	UR_DP1000_PIN(27, "PC3", UR_DP1000_PORT_C_IDX),
+	UR_DP1000_PIN(28, "PC4", UR_DP1000_PORT_C_IDX),
+	UR_DP1000_PIN(29, "PC5", UR_DP1000_PORT_C_IDX),
+	UR_DP1000_PIN(30, "PC6", UR_DP1000_PORT_C_IDX),
+	UR_DP1000_PIN(31, "PC7", UR_DP1000_PORT_C_IDX),
+	UR_DP1000_PIN(32, "PD0", UR_DP1000_PORT_D_IDX),
+	UR_DP1000_PIN(33, "PD1", UR_DP1000_PORT_D_IDX),
+	UR_DP1000_PIN(34, "PD2", UR_DP1000_PORT_D_IDX),
+	UR_DP1000_PIN(35, "PD3", UR_DP1000_PORT_D_IDX),
+	UR_DP1000_PIN(36, "PD4", UR_DP1000_PORT_D_IDX),
+	UR_DP1000_PIN(37, "PD5", UR_DP1000_PORT_D_IDX),
+	UR_DP1000_PIN(38, "PD6", UR_DP1000_PORT_D_IDX),
+	UR_DP1000_PIN(39, "PD7", UR_DP1000_PORT_D_IDX),
+	UR_DP1000_PIN(40, "LPC0", UR_DP1000_PORT_LPC_IDX),
+	UR_DP1000_PIN(41, "LPC1", UR_DP1000_PORT_LPC_IDX),
+	UR_DP1000_PIN(42, "LPC2", UR_DP1000_PORT_LPC_IDX),
+	UR_DP1000_PIN(43, "LPC3", UR_DP1000_PORT_LPC_IDX),
+	UR_DP1000_PIN(44, "LPC4", UR_DP1000_PORT_LPC_IDX),
+	UR_DP1000_PIN(45, "LPC5", UR_DP1000_PORT_LPC_IDX),
+	UR_DP1000_PIN(46, "LPC6", UR_DP1000_PORT_LPC_IDX),
+	UR_DP1000_PIN(47, "LPC7", UR_DP1000_PORT_LPC_IDX),
+	UR_DP1000_PIN(48, "LPC8", UR_DP1000_PORT_LPC_IDX),
+	UR_DP1000_PIN(49, "LPC9", UR_DP1000_PORT_LPC_IDX),
+	UR_DP1000_PIN(50, "LPC10", UR_DP1000_PORT_LPC_IDX),
+	UR_DP1000_PIN(51, "LPC11", UR_DP1000_PORT_LPC_IDX),
+	UR_DP1000_PIN(52, "LPC12", UR_DP1000_PORT_LPC_IDX),
+};
+
+static const struct ur_pinctrl_data ur_dp1000_pinctrl_data = {
+	.pins = ur_dp1000_pins,
+	.npins = ARRAY_SIZE(ur_dp1000_pins),
+	.routes = ur_dp1000_routes,
+	.num_routes = ARRAY_SIZE(ur_dp1000_routes),
+};
+
+static const struct of_device_id ur_pinctrl_of_match[] = {
+	{ .compatible = "ultrarisc,dp1000-pinctrl" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ur_pinctrl_of_match);
+
+static int ur_dp1000_pinctrl_probe(struct platform_device *pdev)
+{
+	return ur_pinctrl_probe(pdev, &ur_dp1000_pinctrl_data);
+}
+
+static struct platform_driver ur_pinctrl_driver = {
+	.driver = {
+		.name = "ultrarisc-pinctrl-dp1000",
+		.of_match_table = ur_pinctrl_of_match,
+	},
+	.probe = ur_dp1000_pinctrl_probe,
+};
+
+module_platform_driver(ur_pinctrl_driver);
+
+MODULE_DESCRIPTION("UltraRISC DP1000 pinctrl driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
new file mode 100644
index 000000000000..8fb5b0ea5b93
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
@@ -0,0 +1,517 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ *
+ * Author: Jia Wang <wangjia@ultrarisc.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+
+#include "../core.h"
+#include "../devicetree.h"
+#include "../pinconf.h"
+#include "../pinmux.h"
+
+#include "pinctrl-ultrarisc.h"
+
+#define UR_CONF_BIT_PER_PIN	4
+#define UR_CONF_PIN_PER_REG	(32 / UR_CONF_BIT_PER_PIN)
+static const u32 ur_drive_strengths[] = { 20, 27, 33, 40 };
+
+static const struct ur_port_desc *ur_get_pin_port(struct pinctrl_dev *pctldev,
+						  unsigned int pin)
+{
+	const struct pin_desc *desc = pin_desc_get(pctldev, pin);
+
+	if (!desc || !desc->drv_data)
+		return NULL;
+
+	return desc->drv_data;
+}
+
+static u32 ur_get_pin_conf_offset(const struct ur_port_desc *port_desc, u32 pin)
+{
+	return port_desc->conf_offset +
+	       (pin / UR_CONF_PIN_PER_REG) * sizeof(u32);
+}
+
+static int ur_read_pin_conf(struct ur_pinctrl *pctrl, unsigned int pin, u32 *conf)
+{
+	const struct ur_port_desc *port_desc;
+	u32 pin_offset;
+	u32 reg_offset;
+	u32 shift;
+	u32 mask;
+
+	port_desc = ur_get_pin_port(pctrl->pctl_dev, pin);
+	if (!port_desc)
+		return -EINVAL;
+
+	pin_offset = pin - port_desc->pin_base;
+	reg_offset = ur_get_pin_conf_offset(port_desc, pin_offset);
+	shift = (pin_offset % UR_CONF_PIN_PER_REG) * UR_CONF_BIT_PER_PIN;
+	mask = GENMASK(UR_CONF_BIT_PER_PIN - 1, 0) << shift;
+	*conf = field_get(mask, readl_relaxed(pctrl->base + reg_offset));
+
+	return 0;
+}
+
+static int ur_write_pin_conf(struct ur_pinctrl *pctrl, unsigned int pin, u32 conf)
+{
+	const struct ur_port_desc *port_desc;
+	void __iomem *reg;
+	u32 pin_offset;
+	u32 reg_offset;
+	u32 shift;
+	u32 mask;
+	u32 val;
+
+	port_desc = ur_get_pin_port(pctrl->pctl_dev, pin);
+	if (!port_desc)
+		return -EINVAL;
+
+	pin_offset = pin - port_desc->pin_base;
+	reg_offset = ur_get_pin_conf_offset(port_desc, pin_offset);
+	reg = pctrl->base + reg_offset;
+	shift = (pin_offset % UR_CONF_PIN_PER_REG) * UR_CONF_BIT_PER_PIN;
+	mask = GENMASK(UR_CONF_BIT_PER_PIN - 1, 0) << shift;
+
+	scoped_guard(raw_spinlock_irqsave, &pctrl->lock) {
+		val = readl_relaxed(reg);
+		val = (val & ~mask) | field_prep(mask, conf);
+		writel_relaxed(val, reg);
+	}
+
+	return 0;
+}
+
+static int ur_set_pin_mux(struct ur_pinctrl *pctrl,
+			  const struct ur_port_desc *port_desc,
+			  u32 pin_offset, u32 mode)
+{
+	void __iomem *reg = pctrl->base + port_desc->func_offset;
+	u32 val;
+
+	if (WARN_ON(pin_offset >= UR_MAX_PINS_PER_PORT))
+		return -EINVAL;
+
+	scoped_guard(raw_spinlock_irqsave, &pctrl->lock) {
+		val = readl_relaxed(reg);
+		val &= ~((UR_FUNC_0 | UR_FUNC_1) << pin_offset);
+		val |= mode << pin_offset;
+		writel_relaxed(val, reg);
+	}
+
+	return 0;
+}
+
+static int ur_set_pin_mux_by_num(struct ur_pinctrl *pctrl, unsigned int pin, u32 mode)
+{
+	const struct ur_port_desc *port_desc = ur_get_pin_port(pctrl->pctl_dev, pin);
+	u32 pin_offset;
+
+	if (!port_desc)
+		return -EINVAL;
+
+	if (mode != UR_FUNC_DEFAULT && !(port_desc->supported_modes & mode))
+		return -EINVAL;
+
+	pin_offset = pin - port_desc->pin_base;
+
+	return ur_set_pin_mux(pctrl, port_desc, pin_offset, mode);
+}
+
+static int ur_hw_to_config(unsigned long *config, u32 conf)
+{
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	u32 drive = FIELD_GET(UR_DRIVE_MASK, conf);
+	u32 pull = FIELD_GET(UR_PULL_MASK, conf);
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+		if (pull != UR_PULL_DIS)
+			return -EINVAL;
+		*config = pinconf_to_config_packed(param, 1);
+		return 0;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (pull != UR_PULL_UP)
+			return -EINVAL;
+		*config = pinconf_to_config_packed(param, 1);
+		return 0;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
+		if (pull != UR_PULL_DOWN)
+			return -EINVAL;
+		*config = pinconf_to_config_packed(param, 1);
+		return 0;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		if (drive >= ARRAY_SIZE(ur_drive_strengths))
+			return -EINVAL;
+		*config = pinconf_to_config_packed(param, ur_drive_strengths[drive]);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ur_config_to_hw(unsigned long config, u32 *conf)
+{
+	enum pin_config_param param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+		FIELD_MODIFY(UR_PULL_MASK, conf, UR_PULL_DIS);
+		return 0;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		FIELD_MODIFY(UR_PULL_MASK, conf, UR_PULL_UP);
+		return 0;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
+		FIELD_MODIFY(UR_PULL_MASK, conf, UR_PULL_DOWN);
+		return 0;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		for (u32 i = 0; i < ARRAY_SIZE(ur_drive_strengths); i++) {
+			if (ur_drive_strengths[i] != arg)
+				continue;
+			FIELD_MODIFY(UR_DRIVE_MASK, conf, i);
+			return 0;
+		}
+		return -EINVAL;
+	case PIN_CONFIG_PERSIST_STATE:
+		/*
+		 * For PIN_CONFIG_PERSIST_STATE, gpiolib only treats
+		 * -ENOTSUPP as an optional unsupported result.
+		 * Do not use -EOPNOTSUPP here.
+		 */
+		return -ENOTSUPP;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+/**
+ * ur_find_group_route() - Find the route matching a function and pin set
+ * @pctrl: pin controller instance
+ * @function: mux function name
+ * @group_mask: bitmap of pins in the selected group
+ * @route_out: returned route entry on success
+ *
+ * A mux function may be associated with multiple hardware routing options,
+ * each valid for a specific set of pins. This helper finds the unique route
+ * whose valid_pins mask covers all pins in @group_mask.
+ *
+ * The routing table must guarantee that a given function plus pin set
+ * resolves to exactly one route. If multiple routes match, the routing
+ * description is considered ambiguous and the lookup fails.
+ *
+ * Return: 0 on success, or -EINVAL if no matching route exists or if the
+ * routing table contains ambiguous entries.
+ */
+static int ur_find_group_route(struct ur_pinctrl *pctrl,
+			       const char *function,
+			       u64 group_mask,
+			       const struct ur_func_route **route_out)
+{
+	const struct ur_func_route *match = NULL;
+
+	for (u32 i = 0; i < pctrl->data->num_routes; i++) {
+		const struct ur_func_route *route = &pctrl->data->routes[i];
+
+		if (strcmp(route->function, function))
+			continue;
+
+		if ((route->valid_pins & group_mask) != group_mask)
+			continue;
+
+		if (match) {
+			dev_err(pctrl->dev,
+				"ambiguous route for function %s group_mask=%#llx\n",
+				function, (unsigned long long)group_mask);
+			return -EINVAL;
+		}
+
+		match = route;
+	}
+
+	if (match) {
+		*route_out = match;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static const char *ur_get_group_function(struct pinctrl_dev *pctldev,
+					 unsigned int group_selector,
+					 unsigned int pin_index)
+{
+	const struct group_desc *group;
+	const char * const *functions;
+
+	group = pinctrl_generic_get_group(pctldev, group_selector);
+	if (!group || pin_index >= group->grp.npins || !group->data)
+		return NULL;
+
+	functions = group->data;
+
+	return functions[pin_index];
+}
+
+static int ur_resolve_group_mux(struct pinctrl_dev *pctldev,
+				struct ur_pinctrl *pctrl,
+				unsigned int group_selector,
+				const unsigned int *pins,
+				unsigned int npins,
+				const struct ur_func_route **route_out)
+{
+	const char *function;
+	u64 group_mask = 0;
+
+	if (!npins)
+		return -EINVAL;
+
+	function = ur_get_group_function(pctldev, group_selector, 0);
+	if (!function)
+		return -EINVAL;
+
+	for (u32 i = 0; i < npins; i++)
+		group_mask |= BIT_ULL(pins[i]);
+
+	return ur_find_group_route(pctrl, function, group_mask, route_out);
+}
+
+static bool ur_function_is_gpio(struct pinctrl_dev *pctldev,
+				unsigned int selector)
+{
+	const struct function_desc *function;
+
+	function = pinmux_generic_get_function(pctldev, selector);
+	if (!function)
+		return false;
+
+	for (u32 i = 0; i < function->func->ngroups; i++) {
+		const char *func_name;
+		int group_selector;
+
+		group_selector = pinctrl_get_group_selector(pctldev,
+							    function->func->groups[i]);
+		if (group_selector < 0)
+			return false;
+
+		func_name = ur_get_group_function(pctldev, group_selector, 0);
+		if (!func_name || strcmp(func_name, "gpio"))
+			return false;
+	}
+
+	return true;
+}
+
+static const struct pinctrl_ops ur_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = pinctrl_generic_pins_function_dt_node_to_map,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static int ur_gpio_request_enable(struct pinctrl_dev *pctldev,
+				  struct pinctrl_gpio_range *range,
+				  unsigned int offset)
+{
+	struct ur_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct ur_port_desc *port_desc;
+	const struct ur_func_route *route;
+	int ret;
+
+	(void)range;
+
+	port_desc = ur_get_pin_port(pctldev, offset);
+	if (!port_desc || !port_desc->supports_gpio)
+		return -EINVAL;
+
+	ret = ur_find_group_route(pctrl, "gpio", BIT_ULL(offset), &route);
+	if (ret)
+		return ret;
+
+	return ur_set_pin_mux_by_num(pctrl, offset, route->mode);
+}
+
+static int ur_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
+		      unsigned int group_selector)
+{
+	struct ur_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct ur_func_route *route;
+	const unsigned int *pins;
+	unsigned int npins;
+	int ret;
+
+	(void)func_selector;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, group_selector, &pins, &npins);
+	if (ret)
+		return ret;
+
+	ret = ur_resolve_group_mux(pctldev, pctrl, group_selector, pins, npins,
+				   &route);
+	if (ret)
+		return ret;
+
+	for (u32 i = 0; i < npins; i++) {
+		ret = ur_set_pin_mux_by_num(pctrl, pins[i], route->mode);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinmux_ops ur_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = ur_function_is_gpio,
+	.set_mux = ur_set_mux,
+	.gpio_request_enable = ur_gpio_request_enable,
+	.strict = true,
+};
+
+static int ur_pin_config_get(struct pinctrl_dev *pctldev,
+			     unsigned int pin,
+			     unsigned long *config)
+{
+	struct ur_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	u32 conf;
+	int ret;
+
+	ret = ur_read_pin_conf(pctrl, pin, &conf);
+	if (ret)
+		return ret;
+
+	return ur_hw_to_config(config, conf);
+}
+
+static int ur_pin_config_set(struct pinctrl_dev *pctldev,
+			     unsigned int pin,
+			     unsigned long *configs,
+			     unsigned int num_configs)
+{
+	struct ur_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	u32 conf;
+	int ret;
+
+	ret = ur_read_pin_conf(pctrl, pin, &conf);
+	if (ret)
+		return ret;
+
+	for (u32 i = 0; i < num_configs; i++) {
+		ret = ur_config_to_hw(configs[i], &conf);
+		if (ret)
+			return ret;
+	}
+
+	return ur_write_pin_conf(pctrl, pin, conf);
+}
+
+static int ur_pin_config_group_get(struct pinctrl_dev *pctldev,
+				   unsigned int selector,
+				   unsigned long *config)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int ret;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, selector, &pins, &npins);
+	if (ret || !npins)
+		return ret ?: -EINVAL;
+
+	return ur_pin_config_get(pctldev, pins[0], config);
+}
+
+static int ur_pin_config_group_set(struct pinctrl_dev *pctldev,
+				   unsigned int selector,
+				   unsigned long *configs,
+				   unsigned int num_configs)
+{
+	const unsigned int *pins;
+	unsigned int npins;
+	int ret;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, selector, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (u32 i = 0; i < npins; i++) {
+		ret = ur_pin_config_set(pctldev, pins[i], configs, num_configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops ur_pinconf_ops = {
+	.pin_config_get = ur_pin_config_get,
+	.pin_config_set = ur_pin_config_set,
+	.pin_config_group_get = ur_pin_config_group_get,
+	.pin_config_group_set = ur_pin_config_group_set,
+	.is_generic = true,
+	.pin_config_config_dbg_show = pinconf_generic_dump_config,
+};
+
+int ur_pinctrl_probe(struct platform_device *pdev,
+		     const struct ur_pinctrl_data *data)
+{
+	struct pinctrl_desc *desc;
+	struct ur_pinctrl *pctrl;
+	int ret;
+
+	if (!data)
+		return -ENODEV;
+
+	desc = devm_kzalloc(&pdev->dev, sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+
+	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	pctrl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pctrl->base))
+		return PTR_ERR(pctrl->base);
+	pctrl->dev = &pdev->dev;
+	pctrl->data = data;
+
+	raw_spin_lock_init(&pctrl->lock);
+
+	desc->name = dev_name(&pdev->dev);
+	desc->owner = THIS_MODULE;
+	desc->pins = data->pins;
+	desc->npins = data->npins;
+	desc->pctlops = &ur_pinctrl_ops;
+	desc->pmxops = &ur_pinmux_ops;
+	desc->confops = &ur_pinconf_ops;
+
+	ret = devm_pinctrl_register_and_init(&pdev->dev, desc, pctrl, &pctrl->pctl_dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to register pinctrl\n");
+
+	platform_set_drvdata(pdev, pctrl);
+
+	return pinctrl_enable(pctrl->pctl_dev);
+}
+EXPORT_SYMBOL_GPL(ur_pinctrl_probe);
+
+MODULE_DESCRIPTION("UltraRISC pinctrl core driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h
new file mode 100644
index 000000000000..c874688aafca
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ *
+ * Author: Jia Wang <wangjia@ultrarisc.com>
+ */
+
+#ifndef __PINCTRL_ULTRARISC_H__
+#define __PINCTRL_ULTRARISC_H__
+
+#include <linux/io.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/spinlock.h>
+
+struct platform_device;
+
+#define UR_FUNC_DEFAULT		0U
+#define UR_FUNC_0		1U
+#define UR_FUNC_1		0x10000U
+
+#define UR_MAX_PINS_PER_PORT	16
+
+#define UR_BIAS_MASK		0x0000000F
+#define UR_PULL_MASK		0x0C
+#define UR_PULL_DIS		0
+#define UR_PULL_UP		1
+#define UR_PULL_DOWN		2
+#define UR_DRIVE_MASK		0x03
+
+struct ur_port_desc {
+	u32 pin_base;
+	u32 npins;
+	u32 func_offset;
+	u32 conf_offset;
+	u32 supported_modes;
+	bool supports_gpio;
+};
+
+struct ur_func_route {
+	const char *function;
+	u32 mode;
+	u64 valid_pins;
+};
+
+struct ur_pinctrl_data {
+	const struct pinctrl_pin_desc *pins;
+	u32 npins;
+	const struct ur_func_route *routes;
+	u32 num_routes;
+};
+
+struct ur_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctl_dev;
+	const struct ur_pinctrl_data *data;
+	void __iomem *base;
+	raw_spinlock_t lock; /* Protects mux and conf registers */
+};
+
+int ur_pinctrl_probe(struct platform_device *pdev,
+		     const struct ur_pinctrl_data *data);
+
+#endif

-- 
2.34.1



