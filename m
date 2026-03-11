Return-Path: <linux-gpio+bounces-33148-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGIeMgl9sWmACAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33148-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:32:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 616412656BA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E8C030164B6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7113B47E6;
	Wed, 11 Mar 2026 14:32:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C50F3B3C08;
	Wed, 11 Mar 2026 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239522; cv=none; b=jQ8s+b10xIcN4EwF4r9szJMBJ/XmxG34QNVMspocgx5fCWw5PJ2UxnN5rlEhqSFJbIhMjY8cpoHZSKdTaT9xY1nJqeALgM96so51HgwZMHbUEDin6oF6jONlu0RNepVs9XBxr2oAVW8AcaY4vs2jO/7pWy+vTK5hPssYvNs9DM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239522; c=relaxed/simple;
	bh=3fLjRvaafSLcQi5YKpaSyMkRNdXOQyeg8bJZ30btBow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JVFC4SSt8uwo6PnGYBaq7k/Y/9YruR97lO5x8chfXDmGJXcQ+cIhcBYWnRqsfcxjCUaxa849/cZ8NLEM0pJL5caIR1nEnZxe59VoVT/Ss4TFSqKMBOIBeNP3WLqjZs4lTaOSKbE3FQq/rp7MGl2xuIcMecnbZ4nt5TH+XWbLHGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from albans-vm.. (unknown [213.61.141.186])
	(Authenticated sender: albeu@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0AF4C20040F;
	Wed, 11 Mar 2026 15:31:52 +0100 (CET)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alban Bedel <alban.bedel@lht.dlh.de>
Subject: [PATCH 4/4] gpio: kempld: Implement the interrupt controller
Date: Wed, 11 Mar 2026 15:31:20 +0100
Message-Id: <20260311143120.2179347-5-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
References: <20260311143120.2179347-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[lht.dlh.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33148-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alban.bedel@lht.dlh.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lht.dlh.de:mid,dlh.de:email]
X-Rspamd-Queue-Id: 616412656BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a GPIO IRQ chip implementation for the kempld GPIO controller. Of
note is only how the parent IRQ is obtained.

The IRQ for the GPIO controller can be configured in the BIOS, along
with the IRQ for the I2C controller. These IRQ are returned by ACPI
but this information is only usable if both IRQ are configured. When
only one is configured, only one is returned making it impossible to
know which one it is.

Luckily the BIOS will set the configured IRQ in the PLD registers, so
it can be read from there instead, and that also work on platforms
without ACPI.

The vendor driver allowed to override the IRQ using a module
parameters, so there are boards in field which used this parameter
instead of properly configuring the BIOS. This implementation provides
this as well for compatibility.

Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
---
 drivers/gpio/Kconfig       |   1 +
 drivers/gpio/gpio-kempld.c | 192 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/kempld.h |   1 +
 3 files changed, 194 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c1..d665afe197097 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1440,6 +1440,7 @@ config GPIO_JANZ_TTL
 config GPIO_KEMPLD
 	tristate "Kontron ETX / COMexpress GPIO"
 	depends on MFD_KEMPLD
+	select GPIOLIB_IRQCHIP
 	help
 	  This enables support for the PLD GPIO interface on some Kontron ETX
 	  and COMexpress (ETXexpress) modules.
diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 7dd94ff6f2df4..5a63df3ea5fa7 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/bitops.h>
 #include <linux/errno.h>
+#include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/gpio/driver.h>
 #include <linux/mfd/kempld.h>
@@ -19,13 +20,26 @@
 #define KEMPLD_GPIO_MASK(x)		(BIT((x) % 8))
 #define KEMPLD_GPIO_DIR			0x40
 #define KEMPLD_GPIO_LVL			0x42
+#define KEMPLD_GPIO_STS			0x44
 #define KEMPLD_GPIO_EVT_LVL_EDGE	0x46
+#define KEMPLD_GPIO_EVT_LOW_HIGH	0x48
 #define KEMPLD_GPIO_IEN			0x4A
+#define KEMPLD_GPIO_OUT_LVL		0x4E
+
+/* The IRQ to use if none was configured in the BIOS */
+static unsigned int gpio_irq;
+module_param_hw(gpio_irq, uint, irq, 0444);
+MODULE_PARM_DESC(gpio_irq, "Set legacy GPIO IRQ (1-15)");
 
 struct kempld_gpio_data {
 	struct gpio_chip		chip;
 	struct kempld_device_data	*pld;
 	u8				out_lvl_reg;
+
+	struct mutex			irq_lock;
+	u16				ien;
+	u16				evt_low_high;
+	u16				evt_lvl_edge;
 };
 
 /*
@@ -193,6 +207,180 @@ static int kempld_gpio_pincount(struct kempld_device_data *pld)
 	return evt ? __ffs(evt) : 16;
 }
 
+static void kempld_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
+
+	gpio->ien &= ~BIT(irqd_to_hwirq(data));
+	gpiochip_disable_irq(chip, irqd_to_hwirq(data));
+}
+
+static void kempld_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
+
+	gpiochip_enable_irq(chip, irqd_to_hwirq(data));
+	gpio->ien |= BIT(irqd_to_hwirq(data));
+}
+
+static int kempld_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		gpio->evt_low_high |= BIT(data->hwirq);
+		gpio->evt_lvl_edge |= BIT(data->hwirq);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		gpio->evt_low_high &= ~BIT(data->hwirq);
+		gpio->evt_lvl_edge |= BIT(data->hwirq);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		gpio->evt_low_high |= BIT(data->hwirq);
+		gpio->evt_lvl_edge &= ~BIT(data->hwirq);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		gpio->evt_low_high &= ~BIT(data->hwirq);
+		gpio->evt_lvl_edge &= ~BIT(data->hwirq);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void kempld_irq_bus_lock(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
+
+	mutex_lock(&gpio->irq_lock);
+}
+
+static void kempld_irq_bus_sync_unlock(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct kempld_gpio_data *gpio = gpiochip_get_data(chip);
+	struct kempld_device_data *pld = gpio->pld;
+
+	kempld_get_mutex(pld);
+	kempld_write16(pld, KEMPLD_GPIO_EVT_LVL_EDGE, gpio->evt_lvl_edge);
+	kempld_write16(pld, KEMPLD_GPIO_EVT_LOW_HIGH, gpio->evt_low_high);
+	kempld_write16(pld, KEMPLD_GPIO_IEN, gpio->ien);
+	kempld_release_mutex(pld);
+
+	mutex_unlock(&gpio->irq_lock);
+}
+
+static const struct irq_chip kempld_irqchip = {
+	.name			= "kempld-gpio",
+	.irq_mask		= kempld_irq_mask,
+	.irq_unmask		= kempld_irq_unmask,
+	.irq_set_type		= kempld_irq_set_type,
+	.irq_bus_lock		= kempld_irq_bus_lock,
+	.irq_bus_sync_unlock	= kempld_irq_bus_sync_unlock,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static irqreturn_t kempld_gpio_irq_handler(int irq, void *data)
+{
+	struct kempld_gpio_data *gpio = data;
+	struct gpio_chip *chip = &gpio->chip;
+	unsigned int pin, child_irq;
+	unsigned long status;
+
+	kempld_get_mutex(gpio->pld);
+
+	status = kempld_read16(gpio->pld, KEMPLD_GPIO_STS);
+	if (status)
+		kempld_write16(gpio->pld, KEMPLD_GPIO_STS, status);
+
+	kempld_release_mutex(gpio->pld);
+
+	status &= gpio->ien;
+	if (!status)
+		return IRQ_NONE;
+
+	for_each_set_bit(pin, &status, chip->ngpio) {
+		child_irq = irq_find_mapping(chip->irq.domain, pin);
+		handle_nested_irq(child_irq);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int kempld_gpio_irq_init(struct device *dev,
+				struct kempld_gpio_data *gpio)
+{
+	struct kempld_device_data *pld = gpio->pld;
+	struct gpio_chip *chip = &gpio->chip;
+	struct gpio_irq_chip *girq;
+	unsigned int irq;
+	int ret;
+
+	/* Get the IRQ configured by the BIOS in the PLD */
+	kempld_get_mutex(pld);
+	irq = kempld_read8(pld, KEMPLD_IRQ_GPIO);
+	kempld_release_mutex(pld);
+
+	if (irq == 0xff) {
+		dev_info(dev, "GPIO controller has no IRQ support\n");
+		return 0;
+	}
+
+	/* Allow overriding the IRQ with the module parameter */
+	if (gpio_irq > 0) {
+		dev_warn(dev, "Forcing IRQ to %d\n", gpio_irq);
+		irq &= ~KEMPLD_IRQ_GPIO_MASK;
+		irq |= gpio_irq & KEMPLD_IRQ_GPIO_MASK;
+	}
+
+	if (!(irq & KEMPLD_IRQ_GPIO_MASK)) {
+		dev_warn(dev, "No IRQ configured\n");
+		return 0;
+	}
+
+	/* Get the current config, disable all child interrupts, clear them
+	 * and set the parent IRQ
+	 */
+	kempld_get_mutex(pld);
+	gpio->evt_low_high = kempld_read16(pld, KEMPLD_GPIO_EVT_LOW_HIGH);
+	gpio->evt_lvl_edge = kempld_read16(pld, KEMPLD_GPIO_EVT_LVL_EDGE);
+	kempld_write16(pld, KEMPLD_GPIO_IEN, 0);
+	kempld_write16(pld, KEMPLD_GPIO_STS, 0xFFFF);
+	kempld_write16(pld, KEMPLD_IRQ_GPIO, irq);
+	kempld_release_mutex(pld);
+
+	girq = &chip->irq;
+	gpio_irq_chip_set_chip(girq, &kempld_irqchip);
+
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+	girq->threaded = true;
+
+	mutex_init(&gpio->irq_lock);
+
+	ret = devm_request_threaded_irq(dev, irq & KEMPLD_IRQ_GPIO_MASK,
+					NULL, kempld_gpio_irq_handler,
+					IRQF_ONESHOT, chip->label,
+					gpio);
+	if (ret) {
+		dev_err(dev, "failed to request irq %d\n", irq);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int kempld_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -247,6 +435,10 @@ static int kempld_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	ret = kempld_gpio_irq_init(dev, gpio);
+	if (ret)
+		return ret;
+
 	ret = devm_gpiochip_add_data(dev, chip, gpio);
 	if (ret) {
 		dev_err(dev, "Could not register GPIO chip\n");
diff --git a/include/linux/mfd/kempld.h b/include/linux/mfd/kempld.h
index 643c096b93ace..2dbd80abfd1d2 100644
--- a/include/linux/mfd/kempld.h
+++ b/include/linux/mfd/kempld.h
@@ -37,6 +37,7 @@
 #define KEMPLD_SPEC_GET_MINOR(x)	(x & 0x0f)
 #define KEMPLD_SPEC_GET_MAJOR(x)	((x >> 4) & 0x0f)
 #define KEMPLD_IRQ_GPIO			0x35
+#define KEMPLD_IRQ_GPIO_MASK		0x0f
 #define KEMPLD_IRQ_I2C			0x36
 #define KEMPLD_CFG			0x37
 #define KEMPLD_CFG_GPIO_I2C_MUX		(1 << 0)
-- 
2.39.5


