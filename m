Return-Path: <linux-gpio+bounces-36882-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEnQFpV0BmrpjwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36882-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 03:19:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6291548567
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 03:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54F123074BE6
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 01:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D765371890;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdhWWJJb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A8A36897C;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807893; cv=none; b=YzqKef9gOLv1mbiY1Cj+yq1nf1dHgI8awXbu6jzgjz3sKzF8dGHYAxMsSBKkSFfl0IeT71D2g+ukVZiw4c1HG1ONGl2qhzs5A0fOIDhgQdtun6J6HSWxD+4cYEwBcy6i1PQ+FfT+w5nNxj01pmUNOm8f/ezWzsQeyZDjEFdbKXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807893; c=relaxed/simple;
	bh=b8yptDVQSHGri2ZUbpzPa2qxnxvKyKRTAGQwdeE6dmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBtztTbSJn1XcFD9IhfV4OZ9qhA8zl03/kw2Bda8H0Oy5W4GkmpeckdUFDwZ3rRMROmGSuYAXgOpXj1ZGPBtpNtqqrVnA5dVolVzKHwnQZYiOzQgypYv8LdQmrYewzjnVzZsv8QuekHWvdrAcUIr4FgTLTSJvYyP07olXy9zLqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdhWWJJb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F8D2C2BCFA;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778807893;
	bh=b8yptDVQSHGri2ZUbpzPa2qxnxvKyKRTAGQwdeE6dmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kdhWWJJbkN7l8bVUxBtesHmIxahTPemosAtwTXXaDmhE7Xj0bXdaTPTBvjeUQhlTS
	 r2oRT7HT44NyMtbTbIldOBXmNvhjBTUI2FcznLKTYl/9WO90EQ213BuXv6Xq2T8v0c
	 1cmfjAolRmL10jMiU9N2JL2BREo36TH6WtkYw/wl9RilBITnMIm6nES+YRoCVsp1m0
	 RQJDpKOPgAONVt/Lz9B6JhodkaK0LYWcDoxZu92tKlaRTZoxEQWFMLRIkJDhAQyXyq
	 WV4GYBwMwlzixHe3TtwnJJ7a2jYf/Iaw7htJnocvd/MEP2V9QgkH2azdD8GO1ngotB
	 wf6r65mglzvHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F09CD4F25;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Fri, 15 May 2026 09:18:02 +0800
Subject: [PATCH 6/9] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778807890; l=29980;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=8drpWySj4LGM4a6wP0yAw40A5piAI3o4i67FqENQcw0=;
 b=iULDG55BK0A/HETCfUkm4hsy7BYFADem6KTGqb0FNUuOfba63JYTU4LkiUhtAOLYmCPfrX4jW
 fYZreQ2DlPEDDJh3Zm2F69EfD1SPGpEcxsf1NkbyGvHO4SyIlaEGn5L
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Rspamd-Queue-Id: D6291548567
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36882-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ultrarisc.com:email,ultrarisc.com:mid,ultrarisc.com:replyto,pin_val.pin:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Jia Wang <wangjia@ultrarisc.com>

Add pinctrl driver for UltraRISC DP1000 pinctrl controller.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 MAINTAINERS                                   |   1 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/ultrarisc/Kconfig             |  23 +
 drivers/pinctrl/ultrarisc/Makefile            |   4 +
 drivers/pinctrl/ultrarisc/pinctrl-dp1000.c    | 112 ++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c | 746 ++++++++++++++++++++++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h |  71 +++
 8 files changed, 959 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 832e01898ae5..ecd87d58f28c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27364,6 +27364,7 @@ M:	Jia Wang <wangjia@ultrarisc.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
+F:	drivers/pinctrl/ultrarisc/*
 F:	include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
 
 ULTRATRONIK BOARD SUPPORT
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03f2e3ee065f..76105be8b395 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -711,5 +711,6 @@ source "drivers/pinctrl/ti/Kconfig"
 source "drivers/pinctrl/uniphier/Kconfig"
 source "drivers/pinctrl/visconti/Kconfig"
 source "drivers/pinctrl/vt8500/Kconfig"
+source "drivers/pinctrl/ultrarisc/Kconfig"
 
 endif
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c..4df3e52518ea 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -98,3 +98,4 @@ obj-y				+= ti/
 obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
 obj-$(CONFIG_PINCTRL_VISCONTI)	+= visconti/
 obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
+obj-$(CONFIG_ARCH_ULTRARISC)	+= ultrarisc/
diff --git a/drivers/pinctrl/ultrarisc/Kconfig b/drivers/pinctrl/ultrarisc/Kconfig
new file mode 100644
index 000000000000..ba8747b90127
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config PINCTRL_ULTRARISC
+	tristate
+	depends on OF
+	select PINMUX
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINCONF
+	select GENERIC_PINMUX_FUNCTIONS
+	select GPIOLIB
+	select IRQ_DOMAIN_HIERARCHY
+	select MFD_SYSCON
+
+config PINCTRL_ULTRARISC_DP1000
+	tristate "UltraRISC DP1000 SoC Pinctrl driver"
+	select PINCTRL_ULTRARISC
+	depends on OF && HAS_IOMEM
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
index 000000000000..23b6cc512031
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/pinctrl-dp1000.c
@@ -0,0 +1,112 @@
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
+static const struct pinctrl_pin_desc ur_dp1000_pins[] = {
+	PINCTRL_PIN(0, "PA0"),
+	PINCTRL_PIN(1, "PA1"),
+	PINCTRL_PIN(2, "PA2"),
+	PINCTRL_PIN(3, "PA3"),
+	PINCTRL_PIN(4, "PA4"),
+	PINCTRL_PIN(5, "PA5"),
+	PINCTRL_PIN(6, "PA6"),
+	PINCTRL_PIN(7, "PA7"),
+	PINCTRL_PIN(8, "PA8"),
+	PINCTRL_PIN(9, "PA9"),
+	PINCTRL_PIN(10, "PA10"),
+	PINCTRL_PIN(11, "PA11"),
+	PINCTRL_PIN(12, "PA12"),
+	PINCTRL_PIN(13, "PA13"),
+	PINCTRL_PIN(14, "PA14"),
+	PINCTRL_PIN(15, "PA15"),
+	PINCTRL_PIN(16, "PB0"),
+	PINCTRL_PIN(17, "PB1"),
+	PINCTRL_PIN(18, "PB2"),
+	PINCTRL_PIN(19, "PB3"),
+	PINCTRL_PIN(20, "PB4"),
+	PINCTRL_PIN(21, "PB5"),
+	PINCTRL_PIN(22, "PB6"),
+	PINCTRL_PIN(23, "PB7"),
+	PINCTRL_PIN(24, "PC0"),
+	PINCTRL_PIN(25, "PC1"),
+	PINCTRL_PIN(26, "PC2"),
+	PINCTRL_PIN(27, "PC3"),
+	PINCTRL_PIN(28, "PC4"),
+	PINCTRL_PIN(29, "PC5"),
+	PINCTRL_PIN(30, "PC6"),
+	PINCTRL_PIN(31, "PC7"),
+	PINCTRL_PIN(32, "PD0"),
+	PINCTRL_PIN(33, "PD1"),
+	PINCTRL_PIN(34, "PD2"),
+	PINCTRL_PIN(35, "PD3"),
+	PINCTRL_PIN(36, "PD4"),
+	PINCTRL_PIN(37, "PD5"),
+	PINCTRL_PIN(38, "PD6"),
+	PINCTRL_PIN(39, "PD7"),
+	PINCTRL_PIN(40, "LPC0"),
+	PINCTRL_PIN(41, "LPC1"),
+	PINCTRL_PIN(42, "LPC2"),
+	PINCTRL_PIN(43, "LPC3"),
+	PINCTRL_PIN(44, "LPC4"),
+	PINCTRL_PIN(45, "LPC5"),
+	PINCTRL_PIN(46, "LPC6"),
+	PINCTRL_PIN(47, "LPC7"),
+	PINCTRL_PIN(48, "LPC8"),
+	PINCTRL_PIN(49, "LPC9"),
+	PINCTRL_PIN(50, "LPC10"),
+	PINCTRL_PIN(51, "LPC11"),
+	PINCTRL_PIN(52, "LPC12"),
+};
+
+static const struct ur_function_desc ur_dp1000_functions[] = {
+	{ "gpio", UR_FUNC_DEF, true },
+	{ "func0", UR_FUNC0, false },
+	{ "func1", UR_FUNC1, false },
+};
+
+#define UR_DP1000_PORT(_name, _npins, _func, _conf, _modes) \
+	{ .name = (_name), .npins = (_npins), .func_offset = (_func), \
+	  .conf_offset = (_conf), .supported_modes = (_modes) }
+
+static const struct ur_pinctrl_match_data ur_dp1000_match_data = {
+	.pins = ur_dp1000_pins,
+	.npins = ARRAY_SIZE(ur_dp1000_pins),
+	.functions = ur_dp1000_functions,
+	.num_functions = ARRAY_SIZE(ur_dp1000_functions),
+	.num_ports = 5,
+	.ports = {
+		UR_DP1000_PORT("A", 16, 0x2c0, 0x310, UR_FUNC0 | UR_FUNC1),
+		UR_DP1000_PORT("B", 8, 0x2c4, 0x318, UR_FUNC0 | UR_FUNC1),
+		UR_DP1000_PORT("C", 8, 0x2c8, 0x31c, UR_FUNC0 | UR_FUNC1),
+		UR_DP1000_PORT("D", 8, 0x2cc, 0x320, UR_FUNC0 | UR_FUNC1),
+		UR_DP1000_PORT("LPC", 13, 0x2d0, 0x324, UR_FUNC0),
+	},
+};
+
+static const struct of_device_id ur_pinctrl_of_match[] = {
+	{ .compatible = "ultrarisc,dp1000-pinctrl", .data = &ur_dp1000_match_data, },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ur_pinctrl_of_match);
+
+static struct platform_driver ur_pinctrl_driver = {
+	.driver = {
+		.name = "ultrarisc-pinctrl-dp1000",
+		.of_match_table = ur_pinctrl_of_match,
+	},
+	.probe = ur_pinctrl_probe,
+};
+
+module_platform_driver(ur_pinctrl_driver);
+
+MODULE_DESCRIPTION("UltraRISC DP1000 pinctrl driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
new file mode 100644
index 000000000000..774746943e28
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
@@ -0,0 +1,746 @@
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
+static int ur_pin_num_to_port_pin(const struct ur_pinctrl_match_data *match_data,
+				  struct ur_pin_val *pin_val, u32 pin_num)
+{
+	for (u32 i = 0; i < match_data->num_ports; i++) {
+		if (pin_num < match_data->ports[i].npins) {
+			pin_val->port = i;
+			pin_val->pin = pin_num;
+			return 0;
+		}
+		pin_num -= match_data->ports[i].npins;
+	}
+
+	return -EINVAL;
+}
+
+static int ur_pin_to_desc(struct pinctrl_dev *pctldev, struct ur_pin_val *pin_val)
+{
+	struct ur_pinctrl *ur_pinctrl = pinctrl_dev_get_drvdata(pctldev);
+	int index = 0;
+
+	for (u32 i = 0; i < pin_val->port; i++)
+		index += ur_pinctrl->match_data->ports[i].npins;
+
+	return index + pin_val->pin;
+}
+
+static u32 ur_get_pin_conf_offset(const struct ur_port_desc *port_desc, u32 pin)
+{
+	return port_desc->conf_offset +
+	       (pin / UR_CONF_PIN_PER_REG) * sizeof(u32);
+}
+
+static u32 ur_read_pin_conf(struct ur_pinctrl *pctldata, unsigned int pin)
+{
+	const struct ur_port_desc *port_desc;
+	struct ur_pin_val pin_val;
+	u32 reg_offset;
+	u32 shift;
+	u32 conf;
+	u32 mask;
+
+	if (ur_pin_num_to_port_pin(pctldata->match_data, &pin_val, pin))
+		return 0;
+
+	port_desc = &pctldata->match_data->ports[pin_val.port];
+	reg_offset = ur_get_pin_conf_offset(port_desc, pin_val.pin);
+	shift = (pin_val.pin % UR_CONF_PIN_PER_REG) * UR_CONF_BIT_PER_PIN;
+	mask = GENMASK(UR_CONF_BIT_PER_PIN - 1, 0) << shift;
+	conf = field_get(mask, readl_relaxed(pctldata->base + reg_offset));
+
+	return conf;
+}
+
+static int ur_write_pin_conf(struct ur_pinctrl *pctldata, unsigned int pin, u32 conf)
+{
+	const struct ur_port_desc *port_desc;
+	struct ur_pin_val pin_val;
+	unsigned long flags;
+	void __iomem *reg;
+	u32 reg_offset;
+	u32 val;
+	u32 shift;
+	u32 mask;
+
+	if (ur_pin_num_to_port_pin(pctldata->match_data, &pin_val, pin))
+		return -EINVAL;
+
+	port_desc = &pctldata->match_data->ports[pin_val.port];
+	reg_offset = ur_get_pin_conf_offset(port_desc, pin_val.pin);
+	reg = pctldata->base + reg_offset;
+	shift = (pin_val.pin % UR_CONF_PIN_PER_REG) * UR_CONF_BIT_PER_PIN;
+	mask = GENMASK(UR_CONF_BIT_PER_PIN - 1, 0) << shift;
+
+	raw_spin_lock_irqsave(&pctldata->lock, flags);
+	val = readl_relaxed(reg);
+	val = (val & ~mask) | field_prep(mask, conf);
+	writel_relaxed(val, reg);
+	raw_spin_unlock_irqrestore(&pctldata->lock, flags);
+
+	return 0;
+}
+
+static int ur_set_pin_mux(struct ur_pinctrl *pctldata, struct ur_pin_val *pin_val)
+{
+	const struct ur_port_desc *port_desc = &pctldata->match_data->ports[pin_val->port];
+	void __iomem *reg = pctldata->base + port_desc->func_offset;
+	unsigned long flags;
+	u32 val;
+
+	raw_spin_lock_irqsave(&pctldata->lock, flags);
+	val = readl_relaxed(reg);
+	val &= ~((UR_FUNC0 | UR_FUNC1) << pin_val->pin);
+	val |= pin_val->mode << pin_val->pin;
+	writel_relaxed(val, reg);
+	raw_spin_unlock_irqrestore(&pctldata->lock, flags);
+
+	return 0;
+}
+
+static int ur_set_pin_mux_by_num(struct ur_pinctrl *pctldata, unsigned int pin, u32 mode)
+{
+	struct ur_pin_val pin_val = { .mode = mode };
+	const struct ur_port_desc *port_desc;
+	int ret;
+
+	ret = ur_pin_num_to_port_pin(pctldata->match_data, &pin_val, pin);
+	if (ret)
+		return ret;
+
+	port_desc = &pctldata->match_data->ports[pin_val.port];
+	if (mode != UR_FUNC_DEF && !(port_desc->supported_modes & mode))
+		return -EINVAL;
+
+	return ur_set_pin_mux(pctldata, &pin_val);
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
+		return -EOPNOTSUPP;
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
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+	case PIN_CONFIG_INPUT_ENABLE:
+	case PIN_CONFIG_OUTPUT_ENABLE:
+	case PIN_CONFIG_PERSIST_STATE:
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+struct ur_legacy_prop_data {
+	struct ur_pin_val *pin_vals;
+	unsigned int *group_pins;
+	unsigned int num_pins;
+};
+
+static int ur_legacy_parse_prop(struct pinctrl_dev *pctldev,
+				struct device_node *np,
+				const char *propname,
+				struct ur_legacy_prop_data *prop)
+{
+	struct ur_pinctrl *pctldata = pinctrl_dev_get_drvdata(pctldev);
+	int rows;
+
+	rows = pinctrl_count_index_with_args(np, propname);
+	if (rows < 0)
+		return dev_err_probe(pctldev->dev, rows, "%pOF: invalid %s count\n",
+				     np, propname);
+
+	prop->pin_vals = devm_kcalloc(pctldev->dev, rows, sizeof(*prop->pin_vals),
+				      GFP_KERNEL);
+	if (!prop->pin_vals)
+		return -ENOMEM;
+
+	prop->group_pins = devm_kcalloc(pctldev->dev, rows, sizeof(*prop->group_pins),
+					GFP_KERNEL);
+	if (!prop->group_pins)
+		return -ENOMEM;
+
+	prop->num_pins = rows;
+
+	for (int i = 0; i < rows; i++) {
+		struct of_phandle_args pin_args;
+		int ret;
+
+		ret = pinctrl_parse_index_with_args(np, propname, i, &pin_args);
+		if (ret)
+			return dev_err_probe(pctldev->dev, ret,
+					     "%pOF: failed to parse %s[%d]\n",
+					     np, propname, i);
+
+		if (pin_args.args_count != 3)
+			return dev_err_probe(pctldev->dev, -EINVAL,
+					     "%pOF: invalid %s[%d] args_count=%d\n",
+					     np, propname, i, pin_args.args_count);
+
+		prop->pin_vals[i].port = pin_args.args[0];
+		prop->pin_vals[i].pin = pin_args.args[1];
+		prop->pin_vals[i].mode = pin_args.args[2];
+
+		if (prop->pin_vals[i].port >= pctldata->match_data->num_ports)
+			return dev_err_probe(pctldev->dev, -EINVAL,
+					     "%pOF: invalid %s[%d] port=%u\n",
+					     np, propname, i, prop->pin_vals[i].port);
+
+		if (prop->pin_vals[i].pin >=
+		    pctldata->match_data->ports[prop->pin_vals[i].port].npins)
+			return dev_err_probe(pctldev->dev, -EINVAL,
+					     "%pOF: invalid %s[%d] pin=%u\n",
+					     np, propname, i, prop->pin_vals[i].pin);
+
+		prop->group_pins[i] = ur_pin_to_desc(pctldev, &prop->pin_vals[i]);
+	}
+
+	return 0;
+}
+
+static const char *ur_legacy_get_function_name(const struct ur_pinctrl_match_data *match_data,
+					       u32 mode)
+{
+	for (u32 i = 0; i < match_data->num_functions; i++) {
+		if (match_data->functions[i].mode == mode)
+			return match_data->functions[i].name;
+	}
+
+	return NULL;
+}
+
+static int ur_legacy_conf_to_configs(struct pinctrl_dev *pctldev, u32 conf,
+				     unsigned long **configs,
+				     unsigned int *num_configs)
+{
+	u32 drive = FIELD_GET(UR_DRIVE_MASK, conf);
+	u32 pull = FIELD_GET(UR_PULL_MASK, conf);
+	unsigned long config;
+	int ret;
+
+	switch (pull) {
+	case UR_PULL_DIS:
+		config = pinconf_to_config_packed(PIN_CONFIG_BIAS_DISABLE, 1);
+		break;
+	case UR_PULL_UP:
+		config = pinconf_to_config_packed(PIN_CONFIG_BIAS_PULL_UP, 1);
+		break;
+	case UR_PULL_DOWN:
+		config = pinconf_to_config_packed(PIN_CONFIG_BIAS_PULL_DOWN, 1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = pinctrl_utils_add_config(pctldev, configs, num_configs, config);
+	if (ret)
+		return ret;
+
+	if (drive >= ARRAY_SIZE(ur_drive_strengths))
+		return -EINVAL;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_DRIVE_STRENGTH,
+					  ur_drive_strengths[drive]);
+
+	return pinctrl_utils_add_config(pctldev, configs, num_configs, config);
+}
+
+static int ur_legacy_add_mux_maps(struct pinctrl_dev *pctldev,
+				  struct pinctrl_map **map,
+				  unsigned int *reserved_maps,
+				  unsigned int *num_maps,
+				  const struct ur_legacy_prop_data *prop)
+{
+	struct ur_pinctrl *pctldata = pinctrl_dev_get_drvdata(pctldev);
+
+	for (u32 i = 0; i < prop->num_pins; i++) {
+		const char *function;
+		const char *group;
+		int ret;
+
+		function = ur_legacy_get_function_name(pctldata->match_data,
+						       prop->pin_vals[i].mode);
+		if (!function)
+			return -EINVAL;
+
+		group = pctldata->match_data->pins[prop->group_pins[i]].name;
+		if (!group)
+			return -EINVAL;
+
+		ret = pinctrl_utils_add_map_mux(pctldev, map, reserved_maps,
+						num_maps, group, function);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ur_legacy_add_pinconf_maps(struct pinctrl_dev *pctldev,
+				      struct pinctrl_map **map,
+				      unsigned int *reserved_maps,
+				      unsigned int *num_maps,
+				      const struct ur_legacy_prop_data *prop)
+{
+	struct ur_pinctrl *pctldata = pinctrl_dev_get_drvdata(pctldev);
+
+	for (u32 i = 0; i < prop->num_pins; i++) {
+		unsigned long *configs = NULL;
+		unsigned int num_configs = 0;
+		const char *group;
+		int ret;
+
+		ret = ur_legacy_conf_to_configs(pctldev, prop->pin_vals[i].conf,
+						&configs, &num_configs);
+		if (ret)
+			goto err;
+
+		group = pctldata->match_data->pins[prop->group_pins[i]].name;
+		if (!group) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		ret = pinctrl_utils_add_map_configs(pctldev, map, reserved_maps,
+						    num_maps, group, configs,
+						    num_configs,
+						    PIN_MAP_TYPE_CONFIGS_PIN);
+err:
+		kfree(configs);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ur_legacy_dt_node_to_map(struct pinctrl_dev *pctldev,
+				    struct device_node *np,
+				    struct pinctrl_map **map,
+				    unsigned int *num_maps)
+{
+	struct ur_legacy_prop_data conf_prop = {};
+	struct ur_legacy_prop_data mux_prop = {};
+	struct pinctrl_map *new_map = NULL;
+	unsigned int reserved_maps = 0;
+	unsigned int total_maps = 0;
+	bool conf_present = false;
+	bool mux_present = false;
+	unsigned int map_num = 0;
+	int ret;
+
+	if (of_property_present(np, "pinctrl-pins"))
+		mux_present = true;
+	if (of_property_present(np, "pinconf-pins"))
+		conf_present = true;
+	if (!mux_present && !conf_present)
+		return -EINVAL;
+
+	if (mux_present) {
+		ret = ur_legacy_parse_prop(pctldev, np, "pinctrl-pins", &mux_prop);
+		if (ret)
+			goto err;
+		total_maps += mux_prop.num_pins;
+	}
+
+	if (conf_present) {
+		ret = ur_legacy_parse_prop(pctldev, np, "pinconf-pins", &conf_prop);
+		if (ret)
+			goto err;
+		total_maps += conf_prop.num_pins;
+	}
+
+	ret = pinctrl_utils_reserve_map(pctldev, &new_map, &reserved_maps,
+					&map_num, total_maps);
+	if (ret)
+		goto err;
+
+	if (mux_present) {
+		ret = ur_legacy_add_mux_maps(pctldev, &new_map, &reserved_maps,
+					     &map_num, &mux_prop);
+		if (ret)
+			goto err;
+	}
+
+	if (conf_present) {
+		ret = ur_legacy_add_pinconf_maps(pctldev, &new_map, &reserved_maps,
+						 &map_num, &conf_prop);
+		if (ret)
+			goto err;
+	}
+
+	*map = new_map;
+	*num_maps = map_num;
+
+	return 0;
+
+err:
+	pinctrl_utils_free_map(pctldev, new_map, map_num);
+	return ret;
+}
+
+static int ur_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
+				     struct device_node *np_config,
+				     struct pinctrl_map **map,
+				     unsigned int *num_maps)
+{
+	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
+					      PIN_MAP_TYPE_INVALID);
+}
+
+static int ur_dt_node_to_map(struct pinctrl_dev *pctldev,
+			     struct device_node *np,
+			     struct pinctrl_map **map,
+			     unsigned int *num_maps)
+{
+	bool legacy = of_property_present(np, "pinctrl-pins") ||
+		      of_property_present(np, "pinconf-pins");
+	bool generic = of_property_present(np, "pins");
+
+	if (legacy && generic) {
+		dev_err(pctldev->dev,
+			"%pOF: mixed legacy and generic pinctrl properties are not supported\n",
+			np);
+		return -EINVAL;
+	}
+
+	if (generic)
+		return ur_generic_dt_node_to_map(pctldev, np, map, num_maps);
+
+	if (legacy)
+		return ur_legacy_dt_node_to_map(pctldev, np, map, num_maps);
+
+	return -EINVAL;
+}
+
+static void ur_dt_free_map(struct pinctrl_dev *pctldev,
+			   struct pinctrl_map *map,
+			   unsigned int num_maps)
+{
+	pinctrl_utils_free_map(pctldev, map, num_maps);
+}
+
+static void ur_pin_dbg_show(struct pinctrl_dev *pctldev,
+			    struct seq_file *s, unsigned int offset)
+{
+	seq_printf(s, "%s", dev_name(pctldev->dev));
+}
+
+static const struct pinctrl_ops ur_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.dt_node_to_map = ur_dt_node_to_map,
+	.dt_free_map = ur_dt_free_map,
+	.pin_dbg_show = ur_pin_dbg_show,
+};
+
+static int ur_gpio_request_enable(struct pinctrl_dev *pctldev,
+				  struct pinctrl_gpio_range *range,
+				  unsigned int offset)
+{
+	struct ur_pinctrl *pctldata = pinctrl_dev_get_drvdata(pctldev);
+
+	(void)range;
+
+	return ur_set_pin_mux_by_num(pctldata, offset, UR_FUNC_DEF);
+}
+
+static int ur_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
+		      unsigned int group_selector)
+{
+	struct ur_pinctrl *pctldata = pinctrl_dev_get_drvdata(pctldev);
+	const struct ur_function_desc *desc;
+	const struct function_desc *func;
+	const unsigned int *pins;
+	unsigned int npins;
+	int ret;
+
+	func = pinmux_generic_get_function(pctldev, func_selector);
+	if (!func || !func->data)
+		return -EINVAL;
+
+	desc = func->data;
+	ret = pinctrl_generic_get_group_pins(pctldev, group_selector, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (u32 i = 0; i < npins; i++) {
+		ret = ur_set_pin_mux_by_num(pctldata, pins[i], desc->mode);
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
+	struct ur_pinctrl *pctldata = pinctrl_dev_get_drvdata(pctldev);
+
+	return ur_hw_to_config(config, ur_read_pin_conf(pctldata, pin));
+}
+
+static int ur_pin_config_set(struct pinctrl_dev *pctldev,
+			     unsigned int pin,
+			     unsigned long *configs,
+			     unsigned int num_configs)
+{
+	struct ur_pinctrl *pctldata = pinctrl_dev_get_drvdata(pctldev);
+	u32 conf = ur_read_pin_conf(pctldata, pin);
+	int ret;
+
+	for (u32 i = 0; i < num_configs; i++) {
+		ret = ur_config_to_hw(configs[i], &conf);
+		if (ret)
+			return ret;
+	}
+
+	return ur_write_pin_conf(pctldata, pin, conf);
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
+#endif
+};
+
+static int ur_add_pin_groups(struct ur_pinctrl *pctldata)
+{
+	for (u32 i = 0; i < pctldata->match_data->npins; i++) {
+		int ret;
+
+		pctldata->group_names[i] = pctldata->match_data->pins[i].name;
+		pctldata->group_pins[i] = pctldata->match_data->pins[i].number;
+
+		ret = pinctrl_generic_add_group(pctldata->pctl_dev, pctldata->group_names[i],
+						&pctldata->group_pins[i], 1, NULL);
+		if (ret < 0)
+			return dev_err_probe(pctldata->dev, ret,
+					     "failed to add pin group %s\n",
+					     pctldata->group_names[i]);
+	}
+
+	return 0;
+}
+
+static int ur_add_functions(struct ur_pinctrl *pctldata)
+{
+	for (u32 i = 0; i < pctldata->match_data->num_functions; i++) {
+		const struct ur_function_desc *desc = &pctldata->match_data->functions[i];
+		struct pinfunction func = desc->gpio ?
+			PINCTRL_GPIO_PINFUNCTION(desc->name, pctldata->group_names,
+						 pctldata->match_data->npins) :
+			PINCTRL_PINFUNCTION(desc->name, pctldata->group_names,
+					    pctldata->match_data->npins);
+		int ret;
+
+		ret = pinmux_generic_add_pinfunction(pctldata->pctl_dev, &func, (void *)desc);
+		if (ret < 0)
+			return dev_err_probe(pctldata->dev, ret,
+					     "failed to add function %s\n",
+					     desc->name);
+	}
+
+	return 0;
+}
+
+int ur_pinctrl_probe(struct platform_device *pdev)
+{
+	const struct ur_pinctrl_match_data *match_data;
+	struct ur_pinctrl *pctldata;
+	struct pinctrl_desc *desc;
+	int ret;
+
+	match_data = of_device_get_match_data(&pdev->dev);
+	if (!match_data)
+		return -ENODEV;
+
+	desc = devm_kzalloc(&pdev->dev, sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+
+	pctldata = devm_kzalloc(&pdev->dev, sizeof(*pctldata), GFP_KERNEL);
+	if (!pctldata)
+		return -ENOMEM;
+
+	pctldata->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pctldata->base))
+		return PTR_ERR(pctldata->base);
+	pctldata->dev = &pdev->dev;
+	pctldata->match_data = match_data;
+	pctldata->group_names = devm_kcalloc(&pdev->dev, match_data->npins,
+					     sizeof(*pctldata->group_names), GFP_KERNEL);
+	if (!pctldata->group_names)
+		return -ENOMEM;
+
+	pctldata->group_pins = devm_kcalloc(&pdev->dev, match_data->npins,
+					    sizeof(*pctldata->group_pins), GFP_KERNEL);
+	if (!pctldata->group_pins)
+		return -ENOMEM;
+
+	raw_spin_lock_init(&pctldata->lock);
+
+	desc->name = dev_name(&pdev->dev);
+	desc->owner = THIS_MODULE;
+	desc->pins = match_data->pins;
+	desc->npins = match_data->npins;
+	desc->pctlops = &ur_pinctrl_ops;
+	desc->pmxops = &ur_pinmux_ops;
+	desc->confops = &ur_pinconf_ops;
+
+	ret = devm_pinctrl_register_and_init(&pdev->dev, desc, pctldata, &pctldata->pctl_dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to register pinctrl\n");
+
+	ret = ur_add_pin_groups(pctldata);
+	if (ret)
+		return ret;
+
+	ret = ur_add_functions(pctldata);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, pctldata);
+
+	return pinctrl_enable(pctldata->pctl_dev);
+}
+EXPORT_SYMBOL_GPL(ur_pinctrl_probe);
+
+MODULE_DESCRIPTION("UltraRISC pinctrl core driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h
new file mode 100644
index 000000000000..25291f18c950
--- /dev/null
+++ b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h
@@ -0,0 +1,71 @@
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
+struct ur_pin_val {
+	u32 port;
+	u32 pin;
+	union {
+		u32 mode;
+		u32 conf;
+	};
+#define UR_FUNC_DEF		0
+#define UR_FUNC0		1
+#define UR_FUNC1		0x10000
+
+#define UR_BIAS_MASK		0x0000000F
+#define UR_PULL_MASK		0x0C
+#define UR_PULL_DIS		0
+#define UR_PULL_UP		1
+#define UR_PULL_DOWN		2
+#define UR_DRIVE_MASK		0x03
+};
+
+struct ur_port_desc {
+	const char *name;
+	u32 npins;
+	u32 func_offset;
+	u32 conf_offset;
+	u32 supported_modes;
+};
+
+struct ur_function_desc {
+	const char *name;
+	u32 mode;
+	bool gpio;
+};
+
+struct ur_pinctrl_match_data {
+	const struct pinctrl_pin_desc *pins;
+	u32 npins;
+	const struct ur_function_desc *functions;
+	u32 num_functions;
+	u32 num_ports;
+	struct ur_port_desc ports[];
+};
+
+struct ur_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctl_dev;
+	void __iomem *base;
+	const struct ur_pinctrl_match_data *match_data;
+	raw_spinlock_t lock;
+	const char **group_names;
+	unsigned int *group_pins;
+};
+
+int ur_pinctrl_probe(struct platform_device *pdev);
+
+#endif

-- 
2.34.1



