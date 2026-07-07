Return-Path: <linux-gpio+bounces-39602-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R7IYB2xSTWp1yQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39602-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 21:24:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E23CA71F2DE
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 21:24:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="t/Yc7BYj";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39602-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39602-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD38C301BB86
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 19:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E335038886B;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A2382295;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452255; cv=none; b=jmLFpoMPkV7NXPVNr82PUYFG6rf8D3BhzGaLODfYealNQXGMiOppXP95G4g3L7j2spCwcXv6QomCS3XuBznqEMiXL1nIwDoYhHQbZZBxOyZvv4dLVPgfKPm23Z37XFlyHmOg0Rd3Pvn5hp7LvcDqdtuCRAg2WP2AbrZbF77NN5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452255; c=relaxed/simple;
	bh=S2JhTq7X0XzvU8Az2f6jFCP1/61DwlvqU0DEyk9oh7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Za2I7PpmQxJ9625ZBglpDw5GSHoaihDioMBax+I8RYNrV6ahyzEeWuRt5kAJyRh5GGiucUfAdEUAPH3z8cIZBjQftM5BcqERpcST6w+iHUFZyde3l6KaA9zVR02kPGYsBvXah88MnAMdrxp2Ht7qj8fl1tUINTRkJNufFVrm6V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/Yc7BYj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F776C2BCF6;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783452255;
	bh=S2JhTq7X0XzvU8Az2f6jFCP1/61DwlvqU0DEyk9oh7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t/Yc7BYjZLZSLp/yqEMm8Em4V8/0gyBhG14Bjrj7eki30UNcD0KPSbwSPyXPxDqf0
	 I/KMvLuSBaxdB0iFmTe7ReDRdLdwKuFNC1RHYuph+L4jwtP2npIF5r4tkYiUzzc1WU
	 X3+8WDFYt+AcbEXguVtZ9QPED2ubW4hl7fQZMKpiJoB1Qiv+3KglW99w6LQHYgYkrl
	 syOmI+QxM1EszLBSwbwnngIbIvZe2iEAvHU7lCCjaGbAyra8ddEmCYsh5lVl17pVID
	 EHzhrUpm2w6x/y/+Pcex+0XENXVhvuFs+JcP/SYRo64mLxzPgCnFsZd1Hl4/15tfGE
	 2RCirrHl67DPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA65C43458;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Wed, 08 Jul 2026 03:24:06 +0800
Subject: [PATCH RFC 5/5] mfd: ls2kbmc: capture the reset event of BMC
 through GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ls2kbmc-mod-v1-5-c344bf5defa3@gmail.com>
References: <20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com>
In-Reply-To: <20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8501;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=1+qEa9whsaP7Fxno5Msk5NZeJYeDBra1kp5kz9L+LQM=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqTVJcq1HXuggx17f0K2kWfIdcZVt+raZETKCMV
 wQ6MHOfQgCJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak1SXAAKCRCwMePKe/7Z
 bptXD/46BQldScEdY/g3RAaNrvx8jPM83A+QIJvmLwQyfl+aW+AYPIQhePINzBGwVYf3Wf3ZKDs
 jG/3WYfL2b7sl9EejWwTCDta+fnOGlNrwMx0zX8UHQpyjC7RvBgv5WT7YSnT/ONLD9gLYFE+pjo
 4Ipm5ysnL2/0/kxo4/v+s4GVRoCj8iNX1tUbDa/kEYNJhtsHrv+uX4SLJ10n4k9+BACcrh7K9FI
 gD07xXHPFmo+mtU+vHJbX27J4EvYtWw+u17+aePwW6I7ecDkZArb369zg/MtGOkFwrUjNFEo+fH
 ZIJgcGuMKevodPM/IorWjUpMS4pwSOG/iXo45qdMzQfgNirw5zAxpslhUJN87CUfbrE0slunxWv
 dfwP/WS8wS0CbQxI12dUu+9Hqog52YVYhsKTk8noF4kl5LnXFZ2wrSqCT+z6Ky6tmtrDYg/n5w7
 bI0vZAYNsW5YWv64YqxqMu8WnmbVO9t2o2hBQG0CiH8oCQs72VfwPFCkgkNQ2b0xFGfNbNOPKfy
 9mp6t0V9McN/qmeY+6bDHyu3CXvxJ+PGeyhDrD4MQPYvzeddXgX+AMpmFnA2Z1ZiiBO93Hl8xQA
 fUeZU/c9Sfc/pw29ZOwHbarwEVChTBsrV/OCxkZSLkQ6ysaltiD5KBR1evNVF2gZBqzSe+xsh3v
 3Gr+yCUVZQdHDEA==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zhoubinbin@loongson.cn,m:qiaochong@loongson.cn,m:lee@kernel.org,m:chenhuacai@kernel.org,m:corey@minyard.net,m:linusw@kernel.org,m:brgl@kernel.org,m:xry111@xry111.site,m:kernel@xen0n.name,m:zhuyinbo@loongson.cn,m:jiaxun.yang@flygoat.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:shankerwangmiao@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39602-lists,linux-gpio=lfdr.de,shankerwangmiao.gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[shankerwangmiao@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[xry111.site,xen0n.name,loongson.cn,flygoat.com,lists.linux.dev,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E23CA71F2DE

From: Miao Wang <shankerwangmiao@gmail.com>

The reset event of BMC is captured through GPIO. However, this driver
bypasses the GPIO framework and directly accesses the GPIO controller
through the fixed address. When the same GPIO controller is also
exposed through ACPI and probed by the corresponding GPIO driver,
there would be a conflict between the two drivers.

This patch will try to find the GPIO through declared GPIO pin in the
_CRS resources of the ACPI node. If no such delaration is found, the
driver will fall back to search for the correct GPIO controller and pin
according to the fixed address and pin number. A possible DSDT
declaration for the GPIO pin might be as follows:

    Device (BMC0) {
        Name (_ADR, ...) // Match the PCI address of the BMC device
        // \_SB.GPO1 is the ACPI path of the GPIO controller
        Name (_CRS, ResourceTemplate () {
            GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0,
                     "\\_SB.GPO1", 0) {
                14 // 14 is the GPIO pin number
            }
    }

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 162 +++++++++++++++++++++++++++++++-------------
 1 file changed, 115 insertions(+), 47 deletions(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 4ceae6c70fb27ae2d6a2a92f4f45a376f1cdb699..5005908802766cf855bc48a4d7d73495dea16e9c 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -26,6 +26,9 @@
 #include <linux/stop_machine.h>
 #include <linux/vt_kern.h>
 #include <linux/console.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio.h>
 
 /* LS2K BMC resources */
 #define LS2K_DISPLAY_RES_START		(SZ_16M + SZ_2M)
@@ -81,18 +84,6 @@
 
 #define PCI_REG_STRIDE			0x4
 
-#define LS2K_BMC_RESET_GPIO		14
-#define LOONGSON_GPIO_REG_BASE		0x1FE00500
-#define LOONGSON_GPIO_REG_SIZE		0x18
-#define LOONGSON_GPIO_OEN		0x0
-#define LOONGSON_GPIO_FUNC		0x4
-#define LOONGSON_GPIO_INTPOL		0x10
-#define LOONGSON_GPIO_INTEN		0x14
-
-#define LOONGSON_IO_INT_BASE		16
-#define LS2K_BMC_RESET_GPIO_INT_VEC	(LS2K_BMC_RESET_GPIO % 8)
-#define LS2K_BMC_RESET_GPIO_GSI		(LOONGSON_IO_INT_BASE + LS2K_BMC_RESET_GPIO_INT_VEC)
-
 enum {
 	LS2K_BMC_DISPLAY,
 	LS2K_BMC_IPMI0,
@@ -186,6 +177,7 @@ struct ls2k_bmc_ddata {
 	struct work_struct bmc_reset_work;
 	struct ls2k_bmc_pci_data bmc_pci_data;
 	struct ls2k_bmc_bridge_pci_data bridge_pci_data;
+	struct gpio_desc *reset_gpio;
 };
 
 static bool ls2k_bmc_bar0_addr_is_set(struct pci_dev *pdev)
@@ -334,6 +326,22 @@ static irqreturn_t ls2k_bmc_interrupt(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t ls2k_bmc_gpio_interrupt(int irq, void *arg)
+{
+	struct ls2k_bmc_ddata *ddata = arg;
+
+	int val = gpiod_get_raw_value(ddata->reset_gpio);
+
+	/*
+	 * The GPIO is active low, so when the value is 0,
+	 * it indicates a reset event.
+	 */
+	if (val == 0)
+		return ls2k_bmc_interrupt(irq, arg);
+
+	return IRQ_NONE;
+}
+
 /*
  * Saves the BMC parent device (LS7A) and its own PCI configuration space registers
  * that need to be restored after BMC reset.
@@ -375,11 +383,83 @@ static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, struct ls2k_bmc_ddata *
 	pci_read_config_dword(pdev, PCI_INTERRUPT_LINE, &ddata->bmc_pci_data.interrupt_line);
 }
 
+static int ls2k_bmc_gpiochip_find(struct gpio_chip *gc, const void *data)
+{
+	struct acpi_device *adev;
+	struct list_head resource_list;
+	struct resource_entry *rentry;
+	struct fwnode_handle *fwnode = gc->fwnode ?: gc->parent->fwnode;
+	phys_addr_t start_addr = (phys_addr_t) data;
+	int ret, found = 0;
+
+	if (!is_acpi_node(fwnode))
+		goto out;
+
+	adev = to_acpi_device_node(fwnode);
+	if (!adev)
+		goto out;
+
+	INIT_LIST_HEAD(&resource_list);
+
+	ret = acpi_dev_get_memory_resources(adev, &resource_list);
+	if (ret < 0)
+		goto out;
+	rentry = list_first_entry_or_null(&resource_list, struct resource_entry, node);
+	if (!rentry)
+		goto free_resource_list;
+	if (rentry->res->start == start_addr)
+		found = 1;
+
+free_resource_list:
+	acpi_dev_free_resource_list(&resource_list);
+out:
+	return found;
+}
+
+static struct gpio_desc *ls2k_bmc_find_gpio(struct ls2k_bmc_ddata *ddata)
+{
+	/*
+	 * In conventional way, the GPIO should be obtained through ACPI or
+	 * device tree. However, when the information is not available,
+	 * we should find the GPIO according to the convention of the server
+	 * boards with LS2K BMC, the gpio signal relelecting the reset event
+	 * of the BMC should be connected to pin 14 of the GPIO input of
+	 * the first CPU node. The address of that GPIO controller is fixed.
+	 */
+	static const phys_addr_t LOONGSON_GPIO_REG_BASE = 0x1FE00500;
+	static const unsigned int LS2K_BMC_RESET_GPIO = 14;
+	struct gpio_desc *desc;
+	unsigned int legacy_gpio;
+	int ret;
+	struct gpio_device *gdev __free(gpio_device_put) = NULL;
+
+	dev_dbg(ddata->dev, "Searching for GPIO chip at address %pa\n", &LOONGSON_GPIO_REG_BASE);
+
+	gdev = gpio_device_find((void *)LOONGSON_GPIO_REG_BASE, ls2k_bmc_gpiochip_find);
+
+	if (!gdev) {
+		dev_dbg(ddata->dev, "cannot find GPIO chip at address %pa, deferring\n",
+			&LOONGSON_GPIO_REG_BASE);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	desc = gpio_device_get_desc(gdev, LS2K_BMC_RESET_GPIO);
+	if (IS_ERR(desc))
+		return desc;
+
+	// XXX: might be better to use gpiod_request()
+	legacy_gpio = desc_to_gpio(desc);
+	ret = devm_gpio_request_one(ddata->dev, legacy_gpio, GPIOF_IN, dev_name(ddata->dev));
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return gpio_to_desc(legacy_gpio);
+}
+
 static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
 {
 	struct pci_dev *pdev = to_pci_dev(ddata->dev);
-	void __iomem *gpio_base;
-	int gpio_irq, ret, val;
+	int gpio_irq, ret;
 
 	ls2k_bmc_save_pci_data(pdev, ddata);
 
@@ -392,44 +472,32 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
 		return ret;
 	}
 
-	gpio_base = ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);
-	if (!gpio_base)
-		return -ENOMEM;
-
-	/* Disable GPIO output */
-	val = readl(gpio_base + LOONGSON_GPIO_OEN);
-	writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_OEN);
-
-	/* Enable GPIO functionality */
-	val = readl(gpio_base + LOONGSON_GPIO_FUNC);
-	writel(val & ~BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_FUNC);
-
-	/* Set GPIO interrupts to low-level active */
-	val = readl(gpio_base + LOONGSON_GPIO_INTPOL);
-	writel(val & ~BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_INTPOL);
-
-	/* Enable GPIO interrupts */
-	val = readl(gpio_base + LOONGSON_GPIO_INTEN);
-	writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_INTEN);
+	ddata->reset_gpio = devm_gpiod_get_index_optional(&pdev->dev, NULL, 0, GPIOD_IN);
+	if (IS_ERR(ddata->reset_gpio)) {
+		ret = PTR_ERR(ddata->reset_gpio);
+		ddata->reset_gpio = NULL;
+		return dev_err_probe(ddata->dev, ret, "Failed to get reset GPIO\n");
+	}
+	if (ddata->reset_gpio == NULL) {
+		ddata->reset_gpio = ls2k_bmc_find_gpio(ddata);
+		if (IS_ERR(ddata->reset_gpio)) {
+			ret = PTR_ERR(ddata->reset_gpio);
+			ddata->reset_gpio = NULL;
+			return dev_err_probe(ddata->dev, ret, "Failed to find reset GPIO\n");
+		}
+	}
 
-	iounmap(gpio_base);
+	gpio_irq = gpiod_to_irq(ddata->reset_gpio);
 
-	/*
-	 * Since gpio_chip->to_irq is not implemented in the Loongson-3 GPIO driver,
-	 * acpi_register_gsi() is used to obtain the GPIO IRQ. The GPIO interrupt is a
-	 * watchdog interrupt that is triggered when the BMC resets.
-	 */
-	gpio_irq = acpi_register_gsi(NULL, LS2K_BMC_RESET_GPIO_GSI, ACPI_EDGE_SENSITIVE,
-				     ACPI_ACTIVE_LOW);
 	if (gpio_irq < 0)
-		return gpio_irq;
+		return dev_err_probe(ddata->dev, gpio_irq, "Failed to get GPIO IRQ\n");
 
-	ret = devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
-			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", ddata);
-	if (ret)
-		dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", gpio_irq);
+	ret = devm_request_irq(&pdev->dev, gpio_irq, ls2k_bmc_gpio_interrupt,
+			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc reset", ddata);
+
+	if (ret != 0)
+		return dev_err_probe(ddata->dev, ret, "Failed to request GPIO IRQ %d.\n", gpio_irq);
 
-	acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
 	return ret;
 }
 

-- 
2.49.0



