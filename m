Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE517190F3
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 05:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjFADIW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 23:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjFADHz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 23:07:55 -0400
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B99A0;
        Wed, 31 May 2023 20:07:01 -0700 (PDT)
X-QQ-mid: bizesmtp86t1685588667ta4lhd4v
Received: from wxdbg.localdomain.com ( [183.159.96.128])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 01 Jun 2023 11:04:24 +0800 (CST)
X-QQ-SSF: 01400000000000J0Z000000A0000000
X-QQ-FEAT: H7ipuM2k/9qP30VANI5Kooe8M78jq8YngFqyzUhTlRUkI5htd5g0cxhelH65j
        RuEmd1Q8Ri3IV7sWkvmcRHp28+rNRttKU/+l8pl0qtVvm0zUV4QcDnrix/lx0srmz61WVmb
        bEggFGFk0ZzviKeojafXfFoPt/ZE/JFtynvKcEQ7m6TomeT0BBgijM/0CQ1wDdoDffjj9Fk
        hwy38UbAj4rx4SzWF+VY9JG89jHsJVsY9fKJl8IvmubMIFvCijLJ8iOl6mNPuOWxIYO8Xk0
        xjjJE4Zwf6PctX6iYatroAe7bFk1taZbsXlICB8UofrX+x0+eQJtu0FiSz6fcrYaUY4O1ER
        sD8FNGHNhkfVdYNf1KG2kYMiR4PEjmGI6Rm1uLfQgb0E05Z5Ms4Nth/0bEP6H8ei378+x2m
        s9DGDNLkDZfJ0AuyyPsOcw==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 16444273069455434631
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com, Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v10 6/9] net: txgbe: Support GPIO to SFP socket
Date:   Thu,  1 Jun 2023 11:01:37 +0800
Message-Id: <20230601030140.687493-7-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230601030140.687493-1-jiawenwu@trustnetic.com>
References: <20230601030140.687493-1-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Register GPIO chip and handle GPIO IRQ for SFP socket.

Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
---
 drivers/net/ethernet/wangxun/Kconfig          |   2 +
 drivers/net/ethernet/wangxun/libwx/wx_lib.c   |   3 +-
 drivers/net/ethernet/wangxun/libwx/wx_type.h  |   3 +
 .../net/ethernet/wangxun/txgbe/txgbe_main.c   |  20 +-
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    | 248 ++++++++++++++++++
 .../net/ethernet/wangxun/txgbe/txgbe_type.h   |  23 ++
 6 files changed, 280 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/Kconfig b/drivers/net/ethernet/wangxun/Kconfig
index 59f3a3f492cf..3744735fa708 100644
--- a/drivers/net/ethernet/wangxun/Kconfig
+++ b/drivers/net/ethernet/wangxun/Kconfig
@@ -47,6 +47,8 @@ config TXGBE
 	select PHYLINK
 	select HWMON if TXGBE=y
 	select SFP
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
 	select LIBWX
 	help
 	  This driver supports Wangxun(R) 10GbE PCI Express family of
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_lib.c b/drivers/net/ethernet/wangxun/libwx/wx_lib.c
index 1e8d8b7b0c62..590215303d45 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_lib.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_lib.c
@@ -1348,7 +1348,8 @@ void wx_free_irq(struct wx *wx)
 		free_irq(entry->vector, q_vector);
 	}
 
-	free_irq(wx->msix_entries[vector].vector, wx);
+	if (wx->mac.type == wx_mac_em)
+		free_irq(wx->msix_entries[vector].vector, wx);
 }
 EXPORT_SYMBOL(wx_free_irq);
 
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_type.h b/drivers/net/ethernet/wangxun/libwx/wx_type.h
index f59066d7375c..297c389fa890 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_type.h
+++ b/drivers/net/ethernet/wangxun/libwx/wx_type.h
@@ -79,7 +79,9 @@
 #define WX_GPIO_INTMASK              0x14834
 #define WX_GPIO_INTTYPE_LEVEL        0x14838
 #define WX_GPIO_POLARITY             0x1483C
+#define WX_GPIO_INTSTATUS            0x14844
 #define WX_GPIO_EOI                  0x1484C
+#define WX_GPIO_EXT                  0x14850
 
 /*********************** Transmit DMA registers **************************/
 /* transmit global control */
@@ -643,6 +645,7 @@ struct wx {
 	bool wol_enabled;
 	bool ncsi_enabled;
 	bool gpio_ctrl;
+	raw_spinlock_t gpio_lock;
 
 	/* Tx fast path data */
 	int num_tx_queues;
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_main.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_main.c
index e10296abf5b4..ded04e9e136f 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_main.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_main.c
@@ -82,6 +82,8 @@ static int txgbe_enumerate_functions(struct wx *wx)
  **/
 static void txgbe_irq_enable(struct wx *wx, bool queues)
 {
+	wr32(wx, WX_PX_MISC_IEN, TXGBE_PX_MISC_IEN_MASK);
+
 	/* unmask interrupt */
 	wx_intr_enable(wx, TXGBE_INTR_MISC(wx));
 	if (queues)
@@ -129,17 +131,6 @@ static irqreturn_t txgbe_intr(int __always_unused irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t txgbe_msix_other(int __always_unused irq, void *data)
-{
-	struct wx *wx = data;
-
-	/* re-enable the original interrupt state */
-	if (netif_running(wx->netdev))
-		txgbe_irq_enable(wx, false);
-
-	return IRQ_HANDLED;
-}
-
 /**
  * txgbe_request_msix_irqs - Initialize MSI-X interrupts
  * @wx: board private structure
@@ -171,13 +162,6 @@ static int txgbe_request_msix_irqs(struct wx *wx)
 		}
 	}
 
-	err = request_irq(wx->msix_entries[vector].vector,
-			  txgbe_msix_other, 0, netdev->name, wx);
-	if (err) {
-		wx_err(wx, "request_irq for msix_other failed: %d\n", err);
-		goto free_queue_irqs;
-	}
-
 	return 0;
 
 free_queue_irqs:
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index d95dc131e91b..32fff693e073 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (c) 2015 - 2023 Beijing WangXun Technology Co., Ltd. */
 
+#include <linux/gpio/machine.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio/property.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
@@ -10,6 +12,7 @@
 #include <linux/regmap.h>
 
 #include "../libwx/wx_type.h"
+#include "../libwx/wx_hw.h"
 #include "txgbe_type.h"
 #include "txgbe_phy.h"
 
@@ -74,6 +77,245 @@ static int txgbe_swnodes_register(struct txgbe *txgbe)
 	return software_node_register_node_group(nodes->group);
 }
 
+static int txgbe_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct wx *wx = gpiochip_get_data(chip);
+	int val;
+
+	val = rd32m(wx, WX_GPIO_EXT, BIT(offset));
+
+	return !!(val & BIT(offset));
+}
+
+static int txgbe_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct wx *wx = gpiochip_get_data(chip);
+	u32 val;
+
+	val = rd32(wx, WX_GPIO_DDR);
+	if (BIT(offset) & val)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static int txgbe_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
+{
+	struct wx *wx = gpiochip_get_data(chip);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&wx->gpio_lock, flags);
+	wr32m(wx, WX_GPIO_DDR, BIT(offset), 0);
+	raw_spin_unlock_irqrestore(&wx->gpio_lock, flags);
+
+	return 0;
+}
+
+static int txgbe_gpio_direction_out(struct gpio_chip *chip, unsigned int offset,
+				    int val)
+{
+	struct wx *wx = gpiochip_get_data(chip);
+	unsigned long flags;
+	u32 set;
+
+	set = val ? BIT(offset) : 0;
+
+	raw_spin_lock_irqsave(&wx->gpio_lock, flags);
+	wr32m(wx, WX_GPIO_DR, BIT(offset), set);
+	wr32m(wx, WX_GPIO_DDR, BIT(offset), BIT(offset));
+	raw_spin_unlock_irqrestore(&wx->gpio_lock, flags);
+
+	return 0;
+}
+
+static void txgbe_gpio_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	struct wx *wx = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&wx->gpio_lock, flags);
+	wr32(wx, WX_GPIO_EOI, BIT(hwirq));
+	raw_spin_unlock_irqrestore(&wx->gpio_lock, flags);
+}
+
+static void txgbe_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	struct wx *wx = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	gpiochip_disable_irq(gc, hwirq);
+
+	raw_spin_lock_irqsave(&wx->gpio_lock, flags);
+	wr32m(wx, WX_GPIO_INTMASK, BIT(hwirq), BIT(hwirq));
+	raw_spin_unlock_irqrestore(&wx->gpio_lock, flags);
+}
+
+static void txgbe_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	struct wx *wx = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	gpiochip_enable_irq(gc, hwirq);
+
+	raw_spin_lock_irqsave(&wx->gpio_lock, flags);
+	wr32m(wx, WX_GPIO_INTMASK, BIT(hwirq), 0);
+	raw_spin_unlock_irqrestore(&wx->gpio_lock, flags);
+}
+
+static void txgbe_toggle_trigger(struct gpio_chip *gc, unsigned int offset)
+{
+	struct wx *wx = gpiochip_get_data(gc);
+	u32 pol, val;
+
+	pol = rd32(wx, WX_GPIO_POLARITY);
+	val = rd32(wx, WX_GPIO_EXT);
+
+	if (val & BIT(offset))
+		pol &= ~BIT(offset);
+	else
+		pol |= BIT(offset);
+
+	wr32(wx, WX_GPIO_POLARITY, pol);
+}
+
+static int txgbe_gpio_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	struct wx *wx = gpiochip_get_data(gc);
+	u32 level, polarity, mask;
+	unsigned long flags;
+
+	mask = BIT(hwirq);
+
+	if (type & IRQ_TYPE_LEVEL_MASK) {
+		level = 0;
+		irq_set_handler_locked(d, handle_level_irq);
+	} else {
+		level = mask;
+		irq_set_handler_locked(d, handle_edge_irq);
+	}
+
+	if (type == IRQ_TYPE_EDGE_RISING || type == IRQ_TYPE_LEVEL_HIGH)
+		polarity = mask;
+	else
+		polarity = 0;
+
+	raw_spin_lock_irqsave(&wx->gpio_lock, flags);
+
+	wr32m(wx, WX_GPIO_INTEN, mask, mask);
+	wr32m(wx, WX_GPIO_INTTYPE_LEVEL, mask, level);
+	if (type == IRQ_TYPE_EDGE_BOTH)
+		txgbe_toggle_trigger(gc, hwirq);
+	else
+		wr32m(wx, WX_GPIO_POLARITY, mask, polarity);
+
+	raw_spin_unlock_irqrestore(&wx->gpio_lock, flags);
+
+	return 0;
+}
+
+static const struct irq_chip txgbe_gpio_irq_chip = {
+	.name = "txgbe_gpio_irq",
+	.irq_ack = txgbe_gpio_irq_ack,
+	.irq_mask = txgbe_gpio_irq_mask,
+	.irq_unmask = txgbe_gpio_irq_unmask,
+	.irq_set_type = txgbe_gpio_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void txgbe_irq_handler(struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct wx *wx = irq_desc_get_handler_data(desc);
+	struct txgbe *txgbe = wx->priv;
+	irq_hw_number_t hwirq;
+	unsigned long gpioirq;
+	struct gpio_chip *gc;
+	unsigned long flags;
+
+	chained_irq_enter(chip, desc);
+
+	gpioirq = rd32(wx, WX_GPIO_INTSTATUS);
+
+	gc = txgbe->gpio;
+	for_each_set_bit(hwirq, &gpioirq, gc->ngpio) {
+		int gpio = irq_find_mapping(gc->irq.domain, hwirq);
+		u32 irq_type = irq_get_trigger_type(gpio);
+
+		generic_handle_domain_irq(gc->irq.domain, hwirq);
+
+		if ((irq_type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH) {
+			raw_spin_lock_irqsave(&wx->gpio_lock, flags);
+			txgbe_toggle_trigger(gc, hwirq);
+			raw_spin_unlock_irqrestore(&wx->gpio_lock, flags);
+		}
+	}
+
+	chained_irq_exit(chip, desc);
+
+	/* unmask interrupt */
+	wx_intr_enable(wx, TXGBE_INTR_MISC(wx));
+}
+
+static int txgbe_gpio_init(struct txgbe *txgbe)
+{
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+	struct device *dev;
+	struct wx *wx;
+	int ret;
+
+	wx = txgbe->wx;
+	dev = &wx->pdev->dev;
+
+	raw_spin_lock_init(&wx->gpio_lock);
+
+	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc)
+		return -ENOMEM;
+
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "txgbe_gpio-%x",
+				   (wx->pdev->bus->number << 8) | wx->pdev->devfn);
+	gc->base = -1;
+	gc->ngpio = 6;
+	gc->owner = THIS_MODULE;
+	gc->parent = dev;
+	gc->fwnode = software_node_fwnode(txgbe->nodes.group[SWNODE_GPIO]);
+	gc->get = txgbe_gpio_get;
+	gc->get_direction = txgbe_gpio_get_direction;
+	gc->direction_input = txgbe_gpio_direction_in;
+	gc->direction_output = txgbe_gpio_direction_out;
+
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &txgbe_gpio_irq_chip);
+	girq->parent_handler = txgbe_irq_handler;
+	girq->parent_handler_data = wx;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(dev, girq->num_parents,
+				     sizeof(*girq->parents), GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = wx->msix_entries[wx->num_q_vectors].vector;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+
+	ret = devm_gpiochip_add_data(dev, gc, wx);
+	if (ret)
+		return ret;
+
+	txgbe->gpio = gc;
+
+	return 0;
+}
+
 static int txgbe_clock_register(struct txgbe *txgbe)
 {
 	struct pci_dev *pdev = txgbe->wx->pdev;
@@ -187,6 +429,12 @@ int txgbe_init_phy(struct txgbe *txgbe)
 		return ret;
 	}
 
+	ret = txgbe_gpio_init(txgbe);
+	if (ret) {
+		wx_err(txgbe->wx, "failed to init gpio\n");
+		goto err_unregister_swnode;
+	}
+
 	ret = txgbe_clock_register(txgbe);
 	if (ret) {
 		wx_err(txgbe->wx, "failed to register clock: %d\n", ret);
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index fc91e0fc37a6..6c903e4517c7 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -55,6 +55,28 @@
 #define TXGBE_TS_CTL                            0x10300
 #define TXGBE_TS_CTL_EVAL_MD                    BIT(31)
 
+/* GPIO register bit */
+#define TXGBE_GPIOBIT_0                         BIT(0) /* I:tx fault */
+#define TXGBE_GPIOBIT_1                         BIT(1) /* O:tx disabled */
+#define TXGBE_GPIOBIT_2                         BIT(2) /* I:sfp module absent */
+#define TXGBE_GPIOBIT_3                         BIT(3) /* I:rx signal lost */
+#define TXGBE_GPIOBIT_4                         BIT(4) /* O:rate select, 1G(0) 10G(1) */
+#define TXGBE_GPIOBIT_5                         BIT(5) /* O:rate select, 1G(0) 10G(1) */
+
+/* Extended Interrupt Enable Set */
+#define TXGBE_PX_MISC_ETH_LKDN                  BIT(8)
+#define TXGBE_PX_MISC_DEV_RST                   BIT(10)
+#define TXGBE_PX_MISC_ETH_EVENT                 BIT(17)
+#define TXGBE_PX_MISC_ETH_LK                    BIT(18)
+#define TXGBE_PX_MISC_ETH_AN                    BIT(19)
+#define TXGBE_PX_MISC_INT_ERR                   BIT(20)
+#define TXGBE_PX_MISC_GPIO                      BIT(26)
+#define TXGBE_PX_MISC_IEN_MASK                            \
+	(TXGBE_PX_MISC_ETH_LKDN | TXGBE_PX_MISC_DEV_RST | \
+	 TXGBE_PX_MISC_ETH_EVENT | TXGBE_PX_MISC_ETH_LK | \
+	 TXGBE_PX_MISC_ETH_AN | TXGBE_PX_MISC_INT_ERR |   \
+	 TXGBE_PX_MISC_GPIO)
+
 /* I2C registers */
 #define TXGBE_I2C_BASE                          0x14900
 
@@ -153,6 +175,7 @@ struct txgbe {
 	struct platform_device *i2c_dev;
 	struct clk_lookup *clock;
 	struct clk *clk;
+	struct gpio_chip *gpio;
 };
 
 #endif /* _TXGBE_TYPE_H_ */
-- 
2.27.0

