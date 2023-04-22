Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 272636EB782
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Apr 2023 07:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjDVFAB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Apr 2023 01:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjDVE74 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Apr 2023 00:59:56 -0400
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F53E2719;
        Fri, 21 Apr 2023 21:59:48 -0700 (PDT)
X-QQ-mid: bizesmtp66t1682139552t5ncd7ho
Received: from wxdbg.localdomain.com ( [183.129.236.74])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Sat, 22 Apr 2023 12:59:11 +0800 (CST)
X-QQ-SSF: 01400000000000I0Z000000A0000000
X-QQ-FEAT: Kol1Dm0TdrA536EOhfHOWF70Gqa+U9YZqgbvs2XJue4a6Cpr6eJJCZx5uwG/Q
        xHHM7pit3mehl+J8vW3JzJhP4b2PLMpzV77tNy5IZZ9Ddvc9Sqq7mxx83pGawUW32tWaaIj
        Y/Z0zpQlTmk5CecGyOpqA7kavKLg0xZlBv2CSSl5XZ1TI0x21ABYzaBFyAroWRdWkEkncQ+
        lGj5lVk35lKWiwOiSpXaesXnSWXw1Z6Yni95zC99uVneHzQPoGNsw0VTMZs82bCdduFN0xL
        F85A8Gymatm3+iUNaujmVTFNBD988DBOu4+up6Xx1EypsFP9nUwgGxwS5JBP3+CRm6Mhtj1
        aYjt0YL3vHtVpMHcp9kw1Tr+9FIs80vgOeZ/R8q/Qr5I9tLbG4mVIewk/fBP72jsyU5EYAr
        9xU+25rGrG4+yFTjrWjPQg==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 3464235708605712805
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, andrew@lunn.ch, linux@armlinux.org.uk,
        jarkko.nikula@linux.intel.com, olteanv@gmail.com,
        andriy.shevchenko@linux.intel.com, hkallweit1@gmail.com
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com, Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v4 7/8] net: txgbe: Implement phylink pcs
Date:   Sat, 22 Apr 2023 12:56:20 +0800
Message-Id: <20230422045621.360918-8-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230422045621.360918-1-jiawenwu@trustnetic.com>
References: <20230422045621.360918-1-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:trustnetic.com:qybglogicsvr:qybglogicsvr5
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Register MDIO bus for PCS layer to use Synopsys designware XPCS, support
10GBASE-R interface to the controller.

Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
---
 drivers/net/ethernet/wangxun/Kconfig          |  1 +
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    | 91 ++++++++++++++++++-
 .../net/ethernet/wangxun/txgbe/txgbe_type.h   |  6 ++
 3 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/Kconfig b/drivers/net/ethernet/wangxun/Kconfig
index 9b69c3d53d65..dde979b623fa 100644
--- a/drivers/net/ethernet/wangxun/Kconfig
+++ b/drivers/net/ethernet/wangxun/Kconfig
@@ -43,6 +43,7 @@ config TXGBE
 	select I2C_DESIGNWARE_PLATFORM
 	select GPIOLIB_IRQCHIP
 	select GPIOLIB
+	select PCS_XPCS
 	select LIBWX
 	select SFP
 	help
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index feafac53f437..3e5be9aa3b04 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/machine.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/property.h>
+#include <linux/pcs/pcs-xpcs.h>
+#include <linux/mdio.h>
 #include <linux/i2c.h>
 #include <linux/pci.h>
 
@@ -75,6 +77,82 @@ static int txgbe_swnodes_register(struct txgbe *txgbe)
 	return software_node_register_node_group(nodes->group);
 }
 
+static int txgbe_pcs_read(struct mii_bus *bus, int addr, int devnum, int regnum)
+{
+	struct wx *wx  = bus->priv;
+	u32 offset, val;
+
+	offset = devnum << 16 | regnum;
+
+	/* Set the LAN port indicator to IDA_ADDR */
+	wr32(wx, TXGBE_XPCS_IDA_ADDR, offset);
+
+	/* Read the data from IDA_DATA register */
+	val = rd32(wx, TXGBE_XPCS_IDA_DATA);
+
+	return (u16)val;
+}
+
+static int txgbe_pcs_write(struct mii_bus *bus, int addr, int devnum, int regnum, u16 val)
+{
+	struct wx *wx = bus->priv;
+	u32 offset;
+
+	offset = devnum << 16 | regnum;
+
+	/* Set the LAN port indicator to IDA_ADDR */
+	wr32(wx, TXGBE_XPCS_IDA_ADDR, offset);
+
+	/* Write the data to IDA_DATA register */
+	wr32(wx, TXGBE_XPCS_IDA_DATA, val);
+
+	return 0;
+}
+
+static int txgbe_mdio_pcs_init(struct txgbe *txgbe)
+{
+	struct mdio_device *mdiodev;
+	struct wx *wx = txgbe->wx;
+	struct mii_bus *mii_bus;
+	struct dw_xpcs *xpcs;
+	struct pci_dev *pdev;
+	int ret = 0;
+
+	pdev = wx->pdev;
+
+	mii_bus = devm_mdiobus_alloc(&pdev->dev);
+	if (!mii_bus)
+		return -ENOMEM;
+
+	mii_bus->name = "txgbe_pcs_mdio_bus";
+	mii_bus->read_c45 = &txgbe_pcs_read;
+	mii_bus->write_c45 = &txgbe_pcs_write;
+	mii_bus->parent = &pdev->dev;
+	mii_bus->phy_mask = ~0;
+	mii_bus->priv = wx;
+	snprintf(mii_bus->id, MII_BUS_ID_SIZE, "txgbe_pcs-%x",
+		 (pdev->bus->number << 8) | pdev->devfn);
+
+	ret = devm_mdiobus_register(&pdev->dev, mii_bus);
+	if (ret)
+		return ret;
+
+	mdiodev = mdio_device_create(mii_bus, 0);
+	if (IS_ERR(mdiodev))
+		return PTR_ERR(mdiodev);
+
+	xpcs = xpcs_create(mdiodev, PHY_INTERFACE_MODE_10GBASER);
+	if (IS_ERR_OR_NULL(xpcs)) {
+		mdio_device_free(mdiodev);
+		return PTR_ERR(xpcs);
+	}
+
+	txgbe->mdiodev = mdiodev;
+	txgbe->xpcs = xpcs;
+
+	return 0;
+}
+
 static int txgbe_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wx *wx = gpiochip_get_data(chip);
@@ -356,16 +434,22 @@ int txgbe_init_phy(struct txgbe *txgbe)
 		return ret;
 	}
 
+	ret = txgbe_mdio_pcs_init(txgbe);
+	if (ret) {
+		wx_err(txgbe->wx, "failed to init mdio pcs: %d\n", ret);
+		goto err_unregister_swnode;
+	}
+
 	ret = txgbe_gpio_init(txgbe);
 	if (ret) {
 		wx_err(txgbe->wx, "failed to init gpio\n");
-		goto err_unregister_swnode;
+		goto err_destroy_xpcs;
 	}
 
 	ret = txgbe_i2c_register(txgbe);
 	if (ret) {
 		wx_err(txgbe->wx, "failed to init i2c interface: %d\n", ret);
-		goto err_unregister_swnode;
+		goto err_destroy_xpcs;
 	}
 
 	ret = txgbe_sfp_register(txgbe);
@@ -378,6 +462,8 @@ int txgbe_init_phy(struct txgbe *txgbe)
 
 err_unregister_i2c:
 	platform_device_unregister(txgbe->i2c_dev);
+err_destroy_xpcs:
+	xpcs_destroy(txgbe->xpcs);
 err_unregister_swnode:
 	software_node_unregister_node_group(txgbe->nodes.group);
 
@@ -388,5 +474,6 @@ void txgbe_remove_phy(struct txgbe *txgbe)
 {
 	platform_device_unregister(txgbe->sfp_dev);
 	platform_device_unregister(txgbe->i2c_dev);
+	xpcs_destroy(txgbe->xpcs);
 	software_node_unregister_node_group(txgbe->nodes.group);
 }
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 334803e6a5de..89a635593ae2 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -83,6 +83,10 @@
 /* I2C registers */
 #define TXGBE_I2C_BASE                          0x14900
 
+/************************************** ETH PHY ******************************/
+#define TXGBE_XPCS_IDA_ADDR                     0x13000
+#define TXGBE_XPCS_IDA_DATA                     0x13004
+
 /* Part Number String Length */
 #define TXGBE_PBANUM_LENGTH                     32
 
@@ -174,6 +178,8 @@ struct txgbe_nodes {
 struct txgbe {
 	struct wx *wx;
 	struct txgbe_nodes nodes;
+	struct mdio_device *mdiodev;
+	struct dw_xpcs *xpcs;
 	struct platform_device *sfp_dev;
 	struct platform_device *i2c_dev;
 	struct gpio_chip *gpio;
-- 
2.27.0

