Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2D91F03B3
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jun 2020 02:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgFFACl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 20:02:41 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:29310 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbgFFACk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jun 2020 20:02:40 -0400
X-Greylist: delayed 323 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Jun 2020 20:02:40 EDT
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id 055NvDao005470
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 5 Jun 2020 17:57:13 -0600 (CST)
Received: from eng1n65.eng.sedsystems.ca (eng1n65.eng.sedsystems.ca [172.21.1.65])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id 055NvCCU005665
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Jun 2020 17:57:12 -0600
From:   Robert Hancock <hancock@sedsystems.ca>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, srinivas.neeli@xilinx.com,
        Robert Hancock <hancock@sedsystems.ca>
Subject: [PATCH] gpio: xilinx: Add interrupt support
Date:   Fri,  5 Jun 2020 17:56:52 -0600
Message-Id: <20200605235652.2680545-1-hancock@sedsystems.ca>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adds interrupt support to the Xilinx GPIO driver so that rising and
falling edge line events can be supported. Since interrupt support is
an optional feature in the Xilinx IP, the driver continues to support
devices which have no interrupt provided.

These changes are based on a patch in the Xilinx Linux Git tree,
"gpio: xilinx: Add irq support to the driver" from Srinivas Neeli, but
include a number of fixes and improvements such as supporting both
rising and falling edge events.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
---
 drivers/gpio/Kconfig       |   1 +
 drivers/gpio/gpio-xilinx.c | 247 ++++++++++++++++++++++++++++++++++---
 2 files changed, 233 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bcacd9c74aa80..5f91e7829fb7d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -652,6 +652,7 @@ config GPIO_XGENE_SB
 
 config GPIO_XILINX
 	tristate "Xilinx GPIO support"
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device
 
diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 67f9f82e0db0e..42ae12801d0bf 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -14,6 +14,9 @@
 #include <linux/io.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
 
 /* Register Offset Definitions */
 #define XGPIO_DATA_OFFSET   (0x0)	/* Data register  */
@@ -21,6 +24,11 @@
 
 #define XGPIO_CHANNEL_OFFSET	0x8
 
+#define XGPIO_GIER_OFFSET      0x11c /* Global Interrupt Enable */
+#define XGPIO_GIER_IE          BIT(31)
+#define XGPIO_IPISR_OFFSET     0x120 /* IP Interrupt Status */
+#define XGPIO_IPIER_OFFSET     0x128 /* IP Interrupt Enable */
+
 /* Read/Write access to the GPIO registers */
 #if defined(CONFIG_ARCH_ZYNQ) || defined(CONFIG_X86)
 # define xgpio_readreg(offset)		readl(offset)
@@ -35,17 +43,27 @@
  * @gc: GPIO chip
  * @regs: register block
  * @gpio_width: GPIO width for every channel
- * @gpio_state: GPIO state shadow register
+ * @gpio_state: GPIO write state shadow register
+ * @gpio_last_irq_read: GPIO read state register from last interrupt
  * @gpio_dir: GPIO direction shadow register
  * @gpio_lock: Lock used for synchronization
+ * @irq: IRQ used by GPIO device
+ * @irq_enable: GPIO irq enable/disable bitfield
+ * @irq_rising_edge: GPIO irq rising edge enable/disable bitfield
+ * @irq_falling_edge: GPIO irq rising edge enable/disable bitfield
  */
 struct xgpio_instance {
 	struct gpio_chip gc;
 	void __iomem *regs;
 	unsigned int gpio_width[2];
 	u32 gpio_state[2];
+	u32 gpio_last_irq_read[2];
 	u32 gpio_dir[2];
-	spinlock_t gpio_lock[2];
+	spinlock_t gpio_lock;
+	int irq;
+	u32 irq_enable[2];
+	u32 irq_rising_edge[2];
+	u32 irq_falling_edge[2];
 };
 
 static inline int xgpio_index(struct xgpio_instance *chip, int gpio)
@@ -110,7 +128,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write to GPIO signal and set its direction to output */
 	if (val)
@@ -121,7 +139,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 		       xgpio_regoffset(chip, gpio), chip->gpio_state[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
 /**
@@ -141,7 +159,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	int index = xgpio_index(chip, 0);
 	int offset, i;
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write to GPIO signals */
 	for (i = 0; i < gc->ngpio; i++) {
@@ -152,9 +170,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 			xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 				       index * XGPIO_CHANNEL_OFFSET,
 				       chip->gpio_state[index]);
-			spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
 			index =  xgpio_index(chip, i);
-			spin_lock_irqsave(&chip->gpio_lock[index], flags);
 		}
 		if (__test_and_clear_bit(i, mask)) {
 			offset =  xgpio_offset(chip, i);
@@ -168,7 +184,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
 		       index * XGPIO_CHANNEL_OFFSET, chip->gpio_state[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
 /**
@@ -187,14 +203,14 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Set the GPIO bit in shadow register and set direction as input */
 	chip->gpio_dir[index] |= BIT(offset);
 	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
 		       xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
 	return 0;
 }
@@ -218,7 +234,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	int index =  xgpio_index(chip, gpio);
 	int offset =  xgpio_offset(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
+	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write state of GPIO signal */
 	if (val)
@@ -233,7 +249,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
 			xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
 
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
 	return 0;
 }
@@ -256,6 +272,186 @@ static void xgpio_save_regs(struct xgpio_instance *chip)
 		       chip->gpio_dir[1]);
 }
 
+/**
+ * xgpio_irq_ack - Acknowledge a child GPIO interrupt.
+ * This currently does nothing, but irq_ack is unconditionally called by
+ * handle_edge_irq and therefore must be defined.
+ * @irq_data: per irq and chip data passed down to chip functions
+ */
+static void xgpio_irq_ack(struct irq_data *irq_data)
+{
+}
+
+/**
+ * xgpio_irq_mask - Write the specified signal of the GPIO device.
+ * @irq_data: per irq and chip data passed down to chip functions
+ */
+static void xgpio_irq_mask(struct irq_data *irq_data)
+{
+	unsigned long flags;
+	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
+	int irq_offset = irqd_to_hwirq(irq_data);
+	int index = xgpio_index(chip, irq_offset);
+	int offset = xgpio_offset(chip, irq_offset);
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+
+	chip->irq_enable[index] &= ~BIT(offset);
+
+	dev_dbg(chip->gc.parent, "Disable %d irq, irq_enable_mask 0x%x\n",
+		irq_offset, chip->irq_enable[index]);
+
+	if (!chip->irq_enable[index]) {
+		/* Disable per channel interrupt */
+		u32 temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
+
+		temp &= ~BIT(index);
+		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, temp);
+	}
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+}
+
+/**
+ * xgpio_irq_unmask - Write the specified signal of the GPIO device.
+ * @irq_data: per irq and chip data passed down to chip functions
+ */
+static void xgpio_irq_unmask(struct irq_data *irq_data)
+{
+	unsigned long flags;
+	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
+	int irq_offset = irqd_to_hwirq(irq_data);
+	int index = xgpio_index(chip, irq_offset);
+	int offset = xgpio_offset(chip, irq_offset);
+	u32 old_enable = chip->irq_enable[index];
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+
+	chip->irq_enable[index] |= BIT(offset);
+
+	dev_dbg(chip->gc.parent, "Enable %d irq, irq_enable_mask 0x%x\n",
+		irq_offset, chip->irq_enable[index]);
+
+	if (!old_enable) {
+		/* Clear any existing per-channel interrupts */
+		u32 val = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET) &
+			BIT(index);
+
+		if (val)
+			xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, val);
+
+		/* Update GPIO IRQ read data before enabling interrupt*/
+		val = xgpio_readreg(chip->regs + XGPIO_DATA_OFFSET +
+				    index * XGPIO_CHANNEL_OFFSET);
+		chip->gpio_last_irq_read[index] = val;
+
+		/* Enable per channel interrupt */
+		val = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
+		val |= BIT(index);
+		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, val);
+	}
+
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+}
+
+/**
+ * xgpio_set_irq_type - Write the specified signal of the GPIO device.
+ * @irq_data: Per irq and chip data passed down to chip functions
+ * @type: Interrupt type that is to be set for the gpio pin
+ *
+ * Return:
+ * 0 if interrupt type is supported otherwise otherwise -EINVAL
+ */
+static int xgpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
+{
+	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
+	int irq_offset = irqd_to_hwirq(irq_data);
+	int index = xgpio_index(chip, irq_offset);
+	int offset = xgpio_offset(chip, irq_offset);
+
+	/* The Xilinx GPIO hardware provides a single interrupt status
+	 * indication for any state change in a given GPIO channel (bank).
+	 * Therefore, only rising edge or falling edge triggers are
+	 * supported.
+	 */
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_BOTH:
+		chip->irq_rising_edge[index] |= BIT(offset);
+		chip->irq_falling_edge[index] |= BIT(offset);
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		chip->irq_rising_edge[index] |= BIT(offset);
+		chip->irq_falling_edge[index] &= ~BIT(offset);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		chip->irq_rising_edge[index] &= ~BIT(offset);
+		chip->irq_falling_edge[index] |= BIT(offset);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	irq_set_handler_locked(irq_data, handle_edge_irq);
+	return 0;
+}
+
+static struct irq_chip xgpio_irqchip = {
+	.name           = "gpio-xilinx",
+	.irq_ack	= xgpio_irq_ack,
+	.irq_mask       = xgpio_irq_mask,
+	.irq_unmask     = xgpio_irq_unmask,
+	.irq_set_type   = xgpio_set_irq_type,
+};
+
+/**
+ * xgpio_irqhandler - Gpio interrupt service routine
+ * @desc: Pointer to interrupt description
+ */
+static void xgpio_irqhandler(struct irq_desc *desc)
+{
+	struct xgpio_instance *chip = irq_desc_get_handler_data(desc);
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	u32 num_channels = chip->gpio_width[1] ? 2 : 1;
+	u32 offset = 0, index;
+	u32 status = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
+
+	xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, status);
+
+	chained_irq_enter(irqchip, desc);
+
+	for (index = 0; index < num_channels; index++) {
+		if ((status & BIT(index))) {
+			unsigned long rising_events, falling_events, all_events;
+			unsigned long flags;
+			u32 data, bit;
+
+			spin_lock_irqsave(&chip->gpio_lock, flags);
+			data = xgpio_readreg(chip->regs + XGPIO_DATA_OFFSET +
+					     index * XGPIO_CHANNEL_OFFSET);
+			rising_events = data &
+					~chip->gpio_last_irq_read[index] &
+					chip->irq_enable[index] &
+					chip->irq_rising_edge[index];
+			falling_events = ~data &
+					 chip->gpio_last_irq_read[index] &
+					 chip->irq_enable[index] &
+					 chip->irq_falling_edge[index];
+			dev_dbg(chip->gc.parent, "IRQ chan %u rising 0x%lx falling 0x%lx\n",
+				index, rising_events, falling_events);
+			all_events = rising_events | falling_events;
+			chip->gpio_last_irq_read[index] = data;
+			spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+			for_each_set_bit(bit, &all_events, 32) {
+				generic_handle_irq(irq_find_mapping(
+					chip->gc.irq.domain, offset + bit));
+			}
+		}
+		offset += chip->gpio_width[index];
+	}
+
+	chained_irq_exit(irqchip, desc);
+}
+
 /**
  * xgpio_of_probe - Probe method for the GPIO device.
  * @pdev: pointer to the platform device
@@ -291,7 +487,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	if (of_property_read_u32(np, "xlnx,gpio-width", &chip->gpio_width[0]))
 		chip->gpio_width[0] = 32;
 
-	spin_lock_init(&chip->gpio_lock[0]);
+	spin_lock_init(&chip->gpio_lock);
 
 	if (of_property_read_u32(np, "xlnx,is-dual", &is_dual))
 		is_dual = 0;
@@ -313,8 +509,6 @@ static int xgpio_probe(struct platform_device *pdev)
 		if (of_property_read_u32(np, "xlnx,gpio2-width",
 					 &chip->gpio_width[1]))
 			chip->gpio_width[1] = 32;
-
-		spin_lock_init(&chip->gpio_lock[1]);
 	}
 
 	chip->gc.base = -1;
@@ -336,6 +530,29 @@ static int xgpio_probe(struct platform_device *pdev)
 
 	xgpio_save_regs(chip);
 
+	chip->irq = platform_get_irq(pdev, 0);
+	if (chip->irq <= 0) {
+		dev_info(&pdev->dev, "GPIO IRQ not set\n");
+	} else {
+		u32 temp;
+
+		/* Disable per-channel interrupts */
+		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, 0);
+		/* Clear any existing per-channel interrupts */
+		temp = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
+		xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, temp);
+		/* Enable global interrupts */
+		xgpio_writereg(chip->regs + XGPIO_GIER_OFFSET, XGPIO_GIER_IE);
+
+		chip->gc.irq.chip = &xgpio_irqchip;
+		chip->gc.irq.handler = handle_bad_irq;
+		chip->gc.irq.default_type = IRQ_TYPE_NONE;
+		chip->gc.irq.parent_handler = xgpio_irqhandler;
+		chip->gc.irq.parent_handler_data = chip;
+		chip->gc.irq.parents = &chip->irq;
+		chip->gc.irq.num_parents = 1;
+	}
+
 	status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
 	if (status) {
 		dev_err(&pdev->dev, "failed to add GPIO chip\n");
-- 
2.26.2

