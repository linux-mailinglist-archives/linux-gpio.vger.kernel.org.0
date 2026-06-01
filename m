Return-Path: <linux-gpio+bounces-37756-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMg8HuReHWojZwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37756-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 12:28:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B0661D626
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 12:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10BD3318D89B
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 10:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E9E3ABD90;
	Mon,  1 Jun 2026 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgxHyzrh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E53ACA7C;
	Mon,  1 Jun 2026 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307881; cv=none; b=CLrjXWvGbF/yMfxdbBKF/KegZedE3EQMxgfdyENlOUCEPoLksWlrHjpaWos+2OhQAN5vl0NQBr05ER68c92bv3YkmTxRMo9GGFLq//KqYVqbKYoxRiKeh2faSPDlcd6+dbfXeaKl52tSYSo9vpdtJU4yUd7xjolD84Q6tt4zdJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307881; c=relaxed/simple;
	bh=4j2V8tTlax9syw4tENdMZux+E8c6y/POFJTRKtwPSIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRp9PYu9pMwsedex9aFH0LqTBgJ+ycfnzHj7xunWqBLQBXsV7QrsS19ac15SMTcOqyuHB0+X1pFgUXtVBBP/I1INb6CbMOZZmaMZN2yA172DTf/XSYYOYMrCmi2G6E3JaH2+D7WsQQYE5mFeD9ovBPz13zUzIwCT1x7CKYOndyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgxHyzrh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B453C2BCC7;
	Mon,  1 Jun 2026 09:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780307881;
	bh=4j2V8tTlax9syw4tENdMZux+E8c6y/POFJTRKtwPSIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VgxHyzrhz9mhVcOgCXNsSpS28xVqGFG9sg600cAPgwX1ezzu7ikSKJtC/K8mXBo5B
	 XwiuDDXRqjXB51x8ehGahDh7gQxlnmmcC0mqVm3LJbO0gud53KBkwUGEivLVra4FWp
	 qBswImmzqZt+34dd2LqNtQhfxgbh/qj7+6VHsYrbAMdX4BAGDVYE+67OeGuemG8Lhs
	 eNkkPElmrarh6a/IrKnOoQkEFBqn6P72hmZnk2MYZXE72ruHjUrQRgMwKCiGht+d5h
	 d4Y/hrkQ3/nFG2EHKFdAE1hysO+MOePWBDYoZ7XFjAx0NRdRKdfHhNjzjsxnUYxeBK
	 WtWojXxKLeQgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62B6CD6E61;
	Mon,  1 Jun 2026 09:58:00 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 01 Jun 2026 17:56:35 +0800
Subject: [PATCH v2 2/2] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260601-ultrarisc-pinctrl-v2-2-07ac5130a96d@ultrarisc.com>
References: <20260601-ultrarisc-pinctrl-v2-0-07ac5130a96d@ultrarisc.com>
In-Reply-To: <20260601-ultrarisc-pinctrl-v2-0-07ac5130a96d@ultrarisc.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780307879; l=26871;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=ad5w4OU96E74EiLWkhhoO9/INGzc/NvWCLXb0kz9Yvw=;
 b=fsbC27Cko3qVKVjulm3EI4/XIg4f4KkCtksE8BmEsUF/K/Kd96SJI7fvf49lzd1Rzd3PJEx7Q
 TD0Chbz7F3KA535yVqBZGdJKVF01eU/gHCpvJBtzUHpPtlYlr+uYyv5
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37756-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ultrarisc.com:replyto,ultrarisc.com:mid,ultrarisc.com:email,pin_val.pin:url]
X-Rspamd-Queue-Id: C3B0661D626
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/pinctrl/ultrarisc/Kconfig             |  23 ++
 drivers/pinctrl/ultrarisc/Makefile            |   4 +
 drivers/pinctrl/ultrarisc/pinctrl-dp1000.c    | 172 +++++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c | 496 ++++++++++++++++++++++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h |  75 ++++
 8 files changed, 773 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6fd7ce6365fb..bded23fc4474 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27361,6 +27361,7 @@ M:	Jia Wang <wangjia@ultrarisc.com>
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
index 000000000000..a9257dda5d65
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config PINCTRL_ULTRARISC
+	tristate
+	depends on OF
+	depends on ARCH_ULTRARISC || COMPILE_TEST
+	select PINMUX
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINCONF
+	select GENERIC_PINMUX_FUNCTIONS
+	select GPIOLIB
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
index 000000000000..c821f7b5d065
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/pinctrl-dp1000.c
@@ -0,0 +1,172 @@
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
+#define UR_DP1000_PINS_ALL	GENMASK_ULL(52, 0)
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
+static const struct ur_function_desc ur_dp1000_functions[] = {
+	{ "gpio", UR_FUNC_DEFAULT, true, UR_DP1000_PINS_ABCD },
+	{ "i2c0", UR_FUNC_0, false, GENMASK_ULL(13, 12) },
+	{ "i2c1", UR_FUNC_0, false, GENMASK_ULL(15, 14) | GENMASK_ULL(23, 22) },
+	{ "i2c2", UR_FUNC_0, false, GENMASK_ULL(25, 24) },
+	{ "i2c3", UR_FUNC_0, false, GENMASK_ULL(27, 26) },
+	{ "pwm0", UR_FUNC_0, false, BIT_ULL(16) },
+	{ "pwm1", UR_FUNC_0, false, BIT_ULL(17) },
+	{ "pwm2", UR_FUNC_0, false, BIT_ULL(18) },
+	{ "pwm3", UR_FUNC_0, false, BIT_ULL(19) },
+	{ "spi0", UR_FUNC_1, false, GENMASK_ULL(39, 32) },
+	{ "spi1", UR_FUNC_0, false, GENMASK_ULL(6, 0) },
+	{ "uart0", UR_FUNC_1, false, GENMASK_ULL(11, 4) },
+	{ "uart1", UR_FUNC_0, false, GENMASK_ULL(21, 20) },
+	{ "uart2", UR_FUNC_0, false, GENMASK_ULL(29, 28) },
+	{ "uart3", UR_FUNC_0, false, GENMASK_ULL(31, 30) },
+	{ "lpc", UR_FUNC_DEFAULT, false, UR_DP1000_PINS_LPC },
+	{ "espi", UR_FUNC_0, false, UR_DP1000_PINS_LPC },
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
+	.functions = ur_dp1000_functions,
+	.num_functions = ARRAY_SIZE(ur_dp1000_functions),
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
index 000000000000..99bd8a80fe43
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
@@ -0,0 +1,496 @@
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
+#include <linux/of.h>
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
+#include "../pinctrl-utils.h"
+#include "../pinmux.h"
+
+#include "pinctrl-ultrarisc.h"
+
+#define UR_CONF_BIT_PER_PIN	4
+#define UR_CONF_PIN_PER_REG	(32 / UR_CONF_BIT_PER_PIN)
+static const int ur_drive_strengths[] = { 20, 27, 33, 40 };
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
+static u32 ur_read_pin_conf(struct ur_pinctrl *pctrl, unsigned int pin)
+{
+	const struct ur_port_desc *port_desc;
+	struct ur_pin_val pin_val;
+	u32 reg_offset;
+	u32 shift;
+	u32 conf;
+	u32 mask;
+
+	port_desc = ur_get_pin_port(pctrl->pctl_dev, pin);
+	if (!port_desc)
+		return 0;
+
+	pin_val.port_desc = port_desc;
+	pin_val.pin = pin - port_desc->pin_base;
+	reg_offset = ur_get_pin_conf_offset(pin_val.port_desc, pin_val.pin);
+	shift = (pin_val.pin % UR_CONF_PIN_PER_REG) * UR_CONF_BIT_PER_PIN;
+	mask = GENMASK(UR_CONF_BIT_PER_PIN - 1, 0) << shift;
+	conf = field_get(mask, readl_relaxed(pctrl->base + reg_offset));
+
+	return conf;
+}
+
+static int ur_write_pin_conf(struct ur_pinctrl *pctrl, unsigned int pin, u32 conf)
+{
+	const struct ur_port_desc *port_desc;
+	struct ur_pin_val pin_val;
+	unsigned long flags;
+	void __iomem *reg;
+	u32 reg_offset;
+	u32 shift;
+	u32 mask;
+	u32 val;
+
+	port_desc = ur_get_pin_port(pctrl->pctl_dev, pin);
+	if (!port_desc)
+		return -EINVAL;
+
+	pin_val.port_desc = port_desc;
+	pin_val.pin = pin - port_desc->pin_base;
+	reg_offset = ur_get_pin_conf_offset(pin_val.port_desc, pin_val.pin);
+	reg = pctrl->base + reg_offset;
+	shift = (pin_val.pin % UR_CONF_PIN_PER_REG) * UR_CONF_BIT_PER_PIN;
+	mask = GENMASK(UR_CONF_BIT_PER_PIN - 1, 0) << shift;
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	val = readl_relaxed(reg);
+	val = (val & ~mask) | field_prep(mask, conf);
+	writel_relaxed(val, reg);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
+}
+
+static int ur_set_pin_mux(struct ur_pinctrl *pctrl, struct ur_pin_val *pin_val)
+{
+	void __iomem *reg = pctrl->base + pin_val->port_desc->func_offset;
+	unsigned long flags;
+	u32 val;
+
+	if (WARN_ON(pin_val->pin >= UR_MAX_PINS_PER_PORT))
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	val = readl_relaxed(reg);
+	val &= ~((UR_FUNC_0 | UR_FUNC_1) << pin_val->pin);
+	val |= pin_val->mode << pin_val->pin;
+	writel_relaxed(val, reg);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
+}
+
+static int ur_set_pin_mux_by_num(struct ur_pinctrl *pctrl, unsigned int pin, u32 mode)
+{
+	const struct ur_port_desc *port_desc = ur_get_pin_port(pctrl->pctl_dev, pin);
+	struct ur_pin_val pin_val = { .mode = mode };
+
+	if (!port_desc)
+		return -EINVAL;
+
+	if (mode != UR_FUNC_DEFAULT && !(port_desc->supported_modes & mode))
+		return -EINVAL;
+
+	pin_val.port_desc = port_desc;
+	pin_val.pin = pin - port_desc->pin_base;
+
+	return ur_set_pin_mux(pctrl, &pin_val);
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
+static const struct pinctrl_ops ur_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static int ur_gpio_request_enable(struct pinctrl_dev *pctldev,
+				  struct pinctrl_gpio_range *range,
+				  unsigned int offset)
+{
+	struct ur_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct ur_port_desc *port_desc;
+
+	(void)range;
+
+	port_desc = ur_get_pin_port(pctldev, offset);
+	if (!port_desc || !port_desc->supports_gpio)
+		return -EINVAL;
+
+	return ur_set_pin_mux_by_num(pctrl, offset, UR_FUNC_DEFAULT);
+}
+
+static int ur_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
+		      unsigned int group_selector)
+{
+	struct ur_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct ur_function_desc *desc;
+	const struct function_desc *func;
+	const unsigned int *pins;
+	unsigned int npins;
+	int ret;
+
+	func = pinmux_generic_get_function(pctldev, func_selector);
+	if (!func || !func->data)
+		return -EINVAL;
+	desc = func->data;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, group_selector, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (u32 i = 0; i < npins; i++) {
+		if (!(desc->valid_pins & BIT_ULL(pins[i])))
+			return -EINVAL;
+
+		ret = ur_set_pin_mux_by_num(pctrl, pins[i], desc->mode);
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
+	.function_is_gpio = pinmux_generic_function_is_gpio,
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
+
+	return ur_hw_to_config(config, ur_read_pin_conf(pctrl, pin));
+}
+
+static int ur_pin_config_set(struct pinctrl_dev *pctldev,
+			     unsigned int pin,
+			     unsigned long *configs,
+			     unsigned int num_configs)
+{
+	struct ur_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	u32 conf = ur_read_pin_conf(pctrl, pin);
+	int ret;
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
+#ifdef CONFIG_GENERIC_PINCONF
+	.is_generic = true,
+	.pin_config_config_dbg_show = pinconf_generic_dump_config,
+#endif
+};
+
+static int ur_add_pin_groups(struct ur_pinctrl *pctrl)
+{
+	for (u32 i = 0; i < pctrl->data->npins; i++) {
+		int ret;
+
+		pctrl->group_names[i] = pctrl->data->pins[i].name;
+		pctrl->group_pins[i] = pctrl->data->pins[i].number;
+
+		ret = pinctrl_generic_add_group(pctrl->pctl_dev, pctrl->group_names[i],
+						&pctrl->group_pins[i], 1, NULL);
+		if (ret < 0)
+			return dev_err_probe(pctrl->dev, ret,
+					     "failed to add pin group %s\n",
+					     pctrl->group_names[i]);
+	}
+
+	return 0;
+}
+
+static int ur_collect_function_groups(struct ur_pinctrl *pctrl,
+				      const struct ur_function_desc *desc,
+				      const char ***groups,
+				      u32 *num_groups)
+{
+	const char **func_groups;
+	u32 count = 0;
+
+	for (u32 i = 0; i < pctrl->data->npins; i++) {
+		if (desc->valid_pins & BIT_ULL(pctrl->group_pins[i]))
+			count++;
+	}
+
+	if (!count) {
+		*groups = NULL;
+		*num_groups = 0;
+		return 0;
+	}
+
+	func_groups = devm_kcalloc(pctrl->dev, count, sizeof(*func_groups),
+				   GFP_KERNEL);
+	if (!func_groups)
+		return -ENOMEM;
+
+	*num_groups = 0;
+	for (u32 i = 0; i < pctrl->data->npins; i++) {
+		if (desc->valid_pins & BIT_ULL(pctrl->group_pins[i]))
+			func_groups[(*num_groups)++] = pctrl->group_names[i];
+	}
+
+	*groups = func_groups;
+
+	return 0;
+}
+
+static int ur_add_functions(struct ur_pinctrl *pctrl)
+{
+	for (u32 i = 0; i < pctrl->data->num_functions; i++) {
+		const struct ur_function_desc *desc = &pctrl->data->functions[i];
+		const char **func_groups;
+		struct pinfunction func;
+		u32 num_groups = 0;
+		int ret;
+
+		ret = ur_collect_function_groups(pctrl, desc, &func_groups,
+						 &num_groups);
+		if (ret)
+			return ret;
+
+		if (!num_groups)
+			continue;
+
+		func = desc->gpio ?
+			PINCTRL_GPIO_PINFUNCTION(desc->name, func_groups, num_groups) :
+			PINCTRL_PINFUNCTION(desc->name, func_groups, num_groups);
+
+		ret = pinmux_generic_add_pinfunction(pctrl->pctl_dev, &func, (void *)desc);
+		if (ret < 0)
+			return dev_err_probe(pctrl->dev, ret,
+					     "failed to add function %s\n",
+					     desc->name);
+	}
+
+	return 0;
+}
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
+	pctrl->group_names = devm_kcalloc(&pdev->dev, data->npins,
+					     sizeof(*pctrl->group_names), GFP_KERNEL);
+	if (!pctrl->group_names)
+		return -ENOMEM;
+
+	pctrl->group_pins = devm_kcalloc(&pdev->dev, data->npins,
+					    sizeof(*pctrl->group_pins), GFP_KERNEL);
+	if (!pctrl->group_pins)
+		return -ENOMEM;
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
+	ret = ur_add_pin_groups(pctrl);
+	if (ret)
+		return ret;
+
+	ret = ur_add_functions(pctrl);
+	if (ret)
+		return ret;
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
index 000000000000..9c2d31841af5
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h
@@ -0,0 +1,75 @@
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
+struct ur_function_desc {
+	const char *name;
+	u32 mode;
+	bool gpio;
+	u64 valid_pins;
+};
+
+struct ur_pin_val {
+	const struct ur_port_desc *port_desc;
+	u32 pin;
+	union {
+		u32 mode;
+		u32 conf;
+	};
+};
+
+struct ur_pinctrl_data {
+	const struct pinctrl_pin_desc *pins;
+	u32 npins;
+	const struct ur_function_desc *functions;
+	u32 num_functions;
+};
+
+struct ur_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctl_dev;
+	void __iomem *base;
+	const struct ur_pinctrl_data *data;
+	raw_spinlock_t lock;
+	const char **group_names;
+	unsigned int *group_pins;
+};
+
+int ur_pinctrl_probe(struct platform_device *pdev,
+		     const struct ur_pinctrl_data *data);
+
+#endif

-- 
2.34.1



