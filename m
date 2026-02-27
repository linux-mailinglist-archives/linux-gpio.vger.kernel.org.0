Return-Path: <linux-gpio+bounces-32316-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDyqJ0mwoWmMvgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32316-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 15:55:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B841B94D7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 15:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 589C33133DAE
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 14:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EF242981B;
	Fri, 27 Feb 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vj6q2YuQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6959364936;
	Fri, 27 Feb 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203999; cv=none; b=V5WM8lxuqFxBSjGbVHfyo93b8dB8B8LfZgcngBjAS3YlJRAP2+iBIVoyaQ911t1oGwS4s4G+/85EQodOAIapy+lBlILbtu0Vf/N0qZZl5Dps2GTfshOQlpyjlzL9R/TEoDE0mzQVoiq5zceE/2hu/FcOS+zWC8P7SZ3LkmH8G8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203999; c=relaxed/simple;
	bh=P6Y6LAfEMYufUAXyMOqjmgkk1lPdlaWQiDqTaii5reo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWSk9kWhsz3ojgKjTzccy1BjdsJ2qJHQnRVH/EJd14TwWErsmPAJNFMgNAOiCSJ4T6WTMXfsA6Dq6cFrnWZ4U1qCmP9EiTyItP0UPdWY5gl/Lwv/1KPtArZJnm8DhAWYEFBX8fyV7NKIzQrB91Wqc3G8ur3wxuIMw8uZFy3HY3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vj6q2YuQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CC8C2BC86;
	Fri, 27 Feb 2026 14:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772203999;
	bh=P6Y6LAfEMYufUAXyMOqjmgkk1lPdlaWQiDqTaii5reo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vj6q2YuQk+b7hRDjOYgsRlRLit36vkVL6Mvp9j9N9tOwatPv2COF+ejnzdvFvL29Y
	 KQLyhHiBusjtkPXzAz5FSAmhZ2MVXt5MQL91jwQAG+1tn2yNQZrG4Khz/vSVMAfuGh
	 wC0w3tcqNEBBmArh5cBs1IJOw/pMsUUq2bsp+CAqkXHGJVnNg/cyUAGmGqKDT+Eiw3
	 9nZJbMXN+8rxVzX7ljr8OFAST/RBAR129saCAj+bR1d9cfzHzRBE3KbBMN4LQMwJ0t
	 oR0NPjwoLpECdM/Jiwzs/uwD6CD6q8ymx7gf4UPqMyupVh2PM0x4HR/rWzXiFwosac
	 a3YiJGX5bW1KA==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC v11 3/4] soc: microchip: add mpfs gpio interrupt mux driver
Date: Fri, 27 Feb 2026 14:52:29 +0000
Message-ID: <20260227-flashing-overcast-85ff59b2e82c@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227-ajar-wolverine-7ce1ebd79821@spud>
References: <20260227-ajar-wolverine-7ce1ebd79821@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8155; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=u5lEKiL0cHr1jSJp9L5HdwPjKGqXk6ZWpYyB9joPo0k=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkL169VWqxedOD7mk+nZ/zkkk29diPvvfmG7Fq5/iWP5 aPKxCqNOkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCR6+6MDGtCpnbFrdZ6c3Dd Cg3XvC2PJnbt7thacH3RAU9TU8ba018YGebVdH5c33Mp7cWljSV9SUf6ZYLX3j7icOeJ9twrUQZ z1ZkB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32316-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.981];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40B841B94D7
X-Rspamd-Action: no action

From: Conor Dooley <conor.dooley@microchip.com>

On PolarFire SoC there are more GPIO interrupts than there are interrupt
lines available on the PLIC, and a runtime configurable mux is used to
decide which interrupts are assigned direct connections to the PLIC &
which are relegated to sharing a line.

Add a driver so that Linux can set the mux based on the interrupt
mapping in the devicetree.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS                         |   2 +-
 drivers/soc/microchip/Kconfig       |  11 ++
 drivers/soc/microchip/Makefile      |   1 +
 drivers/soc/microchip/mpfs-irqmux.c | 167 ++++++++++++++++++++++++++++
 4 files changed, 180 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/microchip/mpfs-irqmux.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4044b28ca1818..55ed37ee53af0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22691,7 +22691,7 @@ F:	Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
 F:	Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
 F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
 F:	Documentation/devicetree/bindings/riscv/microchip.yaml
-F:	Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+F:	Documentation/devicetree/bindings/soc/microchip/microchip,mpfs*.yaml
 F:	Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
 F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
 F:	arch/riscv/boot/dts/microchip/
diff --git a/drivers/soc/microchip/Kconfig b/drivers/soc/microchip/Kconfig
index bcf5546025610..7131f1b52d1bc 100644
--- a/drivers/soc/microchip/Kconfig
+++ b/drivers/soc/microchip/Kconfig
@@ -1,3 +1,14 @@
+config POLARFIRE_SOC_IRQ_MUX
+	bool "Microchip PolarFire SoC's GPIO IRQ Mux"
+	depends on ARCH_MICROCHIP
+	select REGMAP
+	select REGMAP_MMIO
+	default y
+	help
+	  Support for the interrupt mux on Polarfire SoC. It sits between
+	  the GPIO controllers and the PLIC, as only 35 interrupts are shared
+	  between 3 GPIO controllers with 32 interrupts each.
+
 config POLARFIRE_SOC_SYS_CTRL
 	tristate "Microchip PolarFire SoC (MPFS) system controller support"
 	depends on POLARFIRE_SOC_MAILBOX
diff --git a/drivers/soc/microchip/Makefile b/drivers/soc/microchip/Makefile
index 1a3a1594b089b..55775db45ee76 100644
--- a/drivers/soc/microchip/Makefile
+++ b/drivers/soc/microchip/Makefile
@@ -1,2 +1,3 @@
+obj-$(CONFIG_POLARFIRE_SOC_IRQ_MUX)	+= mpfs-irqmux.o
 obj-$(CONFIG_POLARFIRE_SOC_SYS_CTRL)	+= mpfs-sys-controller.o
 obj-$(CONFIG_POLARFIRE_SOC_SYSCONS)	+= mpfs-control-scb.o mpfs-mss-top-sysreg.o
diff --git a/drivers/soc/microchip/mpfs-irqmux.c b/drivers/soc/microchip/mpfs-irqmux.c
new file mode 100644
index 0000000000000..76c1afa1fe1c4
--- /dev/null
+++ b/drivers/soc/microchip/mpfs-irqmux.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Largely copied from rzn1_irqmux.c
+ */
+
+#include <linux/bitmap.h>
+#include <linux/bitops.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define MPFS_IRQMUX_CR		0x54
+#define MPFS_IRQMUX_NUM_OUTPUTS	70
+
+static int mpfs_irqmux_is_direct_mode(struct device *dev,
+				      const struct of_phandle_args *parent_args)
+{
+	if (parent_args->args_count != 1) {
+		dev_err(dev, "Invalid interrupt-map item\n");
+		return -EINVAL;
+	}
+
+	if (parent_args->args[0] < 13 || parent_args->args[0] > 53) {
+		dev_err(dev, "Invalid interrupt %u\n", parent_args->args[0]);
+		return -EINVAL;
+	}
+
+	if (parent_args->args[0] > 50)
+		return 0;
+
+	return 1;
+}
+
+static int mpfs_irqmux_probe(struct platform_device *pdev)
+{
+	DECLARE_BITMAP(line_done, MPFS_IRQMUX_NUM_OUTPUTS) = {};
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct of_imap_parser imap_parser;
+	struct of_imap_item imap_item;
+	struct regmap *regmap;
+	int ret, direct_mode, line, controller, gpio;
+	u32 tmp, val = 0, old;
+
+	regmap = device_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to find syscon regmap\n");
+
+	/* We support only #interrupt-cells = <1> and #address-cells = <0> */
+	ret = of_property_read_u32(np, "#interrupt-cells", &tmp);
+	if (ret)
+		return ret;
+	if (tmp != 1)
+		return -EINVAL;
+
+	ret = of_property_read_u32(np, "#address-cells", &tmp);
+	if (ret)
+		return ret;
+	if (tmp != 0)
+		return -EINVAL;
+
+	ret = of_imap_parser_init(&imap_parser, np, &imap_item);
+	if (ret)
+		return ret;
+
+	for_each_of_imap_item(&imap_parser, &imap_item) {
+
+		direct_mode = mpfs_irqmux_is_direct_mode(dev, &imap_item.parent_args);
+		if (direct_mode < 0) {
+			of_node_put(imap_item.parent_args.np);
+			return direct_mode;
+		}
+
+		line = imap_item.child_imap[0];
+		gpio = line % 32;
+		controller = line / 32;
+
+		if (controller > 2) {
+			of_node_put(imap_item.parent_args.np);
+			dev_err(dev, "child interrupt number too large: %d\n", line);
+			return -EINVAL;
+		}
+
+		if (test_and_set_bit(line, line_done)) {
+			of_node_put(imap_item.parent_args.np);
+			dev_err(dev, "Mux output line %d already defined in interrupt-map\n",
+				line);
+			return -EINVAL;
+		}
+
+		/*
+		 * There are 41 interrupts assigned to GPIOs, of which 38 are "direct". Since the
+		 * mux has 32 bits only, 6 of these exclusive/"direct" interrupts remain. These
+		 * are used by GPIO controller 1's lines 18 to 23. Nothing needs to be done
+		 * for these interrupts.
+		 */
+		if (controller == 1 && gpio >= 18)
+			continue;
+
+		/*
+		 * The mux has a single register, where bits 0 to 13 mux between GPIO controller
+		 * 1's 14 GPIOs and GPIO controller 2's first 14 GPIOs. The remaining bits mux
+		 * between the first 18 GPIOs of controller 1 and the last 18 GPIOS of
+		 * controller 2. If a bit in the mux's control register is set, the
+		 * corresponding interrupt line for GPIO controller 0 or 1 will be put in
+		 * "non-direct" mode. If cleared, the "fabric" controller's will.
+		 *
+		 * Register layout:
+		 *    GPIO 1 interrupt line 17 | mux bit 31 | GPIO 2 interrupt line 31
+		 *    ...                      | ...        | ...
+		 *    ...                      | ...        | ...
+		 *    GPIO 1 interrupt line  0 | mux bit 14 | GPIO 2 interrupt line 14
+		 *    GPIO 0 interrupt line 13 | mux bit 13 | GPIO 2 interrupt line 13
+		 *    ...                      | ...        | ...
+		 *    ...                      | ...        | ...
+		 *    GPIO 0 interrupt line  0 | mux bit  0 | GPIO 2 interrupt line  0
+		 *
+		 * As the binding mandates 70 items, one for each GPIO line, there's no need to
+		 * handle anything for GPIO controller 2, since the bit will be set for the
+		 * corresponding line in GPIO controller 0 or 1.
+		 */
+		if (controller == 2)
+			continue;
+
+		/*
+		 * If in direct mode, the bit is cleared, nothing needs to be done as val is zero
+		 * initialised and that's the direct mode setting for GPIO controller 0 and 1.
+		 */
+		if (direct_mode)
+			continue;
+
+		if (controller == 0)
+			val |= 1U << gpio;
+		else
+			val |= 1U << (gpio + 14);
+	}
+
+	regmap_read(regmap, MPFS_IRQMUX_CR, &old);
+	regmap_write(regmap, MPFS_IRQMUX_CR, val);
+
+	if (val != old)
+		dev_info(dev, "firmware mux setting of 0x%x overwritten to 0x%x\n", old, val);
+
+	return 0;
+}
+
+static const struct of_device_id mpfs_irqmux_of_match[] = {
+	{ .compatible = "microchip,mpfs-irqmux", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mpfs_irqmux_of_match);
+
+static struct platform_driver mpfs_irqmux_driver = {
+	.probe = mpfs_irqmux_probe,
+	.driver = {
+		.name = "mpfs_irqmux",
+		.of_match_table = mpfs_irqmux_of_match,
+	},
+};
+module_platform_driver(mpfs_irqmux_driver);
+
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_DESCRIPTION("Polarfire SoC interrupt mux driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


