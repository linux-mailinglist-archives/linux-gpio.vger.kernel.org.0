Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA5C170F220
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 11:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240667AbjEXJVF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 05:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240655AbjEXJVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 05:21:01 -0400
Received: from smtpbg153.qq.com (smtpbg153.qq.com [13.245.218.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C769993;
        Wed, 24 May 2023 02:20:54 -0700 (PDT)
X-QQ-mid: bizesmtp69t1684919949tya2q0qj
Received: from wxdbg.localdomain.com ( [122.235.247.1])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Wed, 24 May 2023 17:19:07 +0800 (CST)
X-QQ-SSF: 01400000000000I0Z000000A0000000
X-QQ-FEAT: /rrU+puPB7QnDrlUdgtGO4kAwd03CcQueDffJal4Y2C7NpJC/BS4uWx4liHKI
        yrQ46T2amolIagvwPHrcPbls+jDp7R6aFupzyuCbA5Ts319RY/PHQRgiBwN7tVE+Qhw8Qsd
        8rL3If0zF+23vEM/oIRD+VJidvwP6ih6I1TEPm+XMa63KseEIRQcSUcA2n1IXNF+VwmGUM7
        meRhHR4k4X+Fn6qvpStWFFFs95nDMDPKyofM1bQ9qIT4P78jKYGwhI7sjOBIoT687F0kqOm
        CN+VWHZK/W1EAA3K4IeRWHDQawYLjc+04t13iLJ+WX+qUn1vtM0uHi4oVegU9NC0VO0qokj
        ZOwvwKg9W4Er85/ZLooBUc2aASmrzlSYd9sxdeuPg/8mODcCtyrQn4Q++BNZKFqgCJyxfsB
        Ie2n0ozmtew=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 14739430546709426475
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com, Jiawen Wu <jiawenwu@trustnetic.com>,
        Piotr Raczynski <piotr.raczynski@intel.com>
Subject: [PATCH net-next v9 2/9] i2c: designware: Add driver support for Wangxun 10Gb NIC
Date:   Wed, 24 May 2023 17:17:15 +0800
Message-Id: <20230524091722.522118-3-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230524091722.522118-1-jiawenwu@trustnetic.com>
References: <20230524091722.522118-1-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Wangxun 10Gb ethernet chip is connected to Designware I2C, to communicate
with SFP.

Introduce the property "wx,i2c-snps-model" to match device data for Wangxun
in software node case. Since IO resource was mapped on the ethernet driver,
add a model quirk to get regmap from parent device.

The exists IP limitations are dealt as workarounds:
- IP does not support interrupt mode, it works on polling mode.
- Additionally set FIFO depth address the chip issue.

Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
Reviewed-by: Piotr Raczynski <piotr.raczynski@intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  |  8 ++
 drivers/i2c/busses/i2c-designware-core.h    |  4 +
 drivers/i2c/busses/i2c-designware-master.c  | 89 +++++++++++++++++++--
 drivers/i2c/busses/i2c-designware-platdrv.c | 15 ++++
 4 files changed, 111 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 0dc6b1ce663f..cdd8c67d9129 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -575,6 +575,14 @@ int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
 	unsigned int param;
 	int ret;
 
+	/* DW_IC_COMP_PARAM_1 not implement for IP issue */
+	if ((dev->flags & MODEL_MASK) == MODEL_WANGXUN_SP) {
+		dev->tx_fifo_depth = TXGBE_TX_FIFO_DEPTH;
+		dev->rx_fifo_depth = TXGBE_RX_FIFO_DEPTH;
+
+		return 0;
+	}
+
 	/*
 	 * Try to detect the FIFO depth if not set by interface driver,
 	 * the depth could be from 2 to 256 from HW spec.
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index c5d87aae39c6..782532c20bd1 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -303,6 +303,7 @@ struct dw_i2c_dev {
 #define MODEL_MSCC_OCELOT			BIT(8)
 #define MODEL_BAIKAL_BT1			BIT(9)
 #define MODEL_AMD_NAVI_GPU			BIT(10)
+#define MODEL_WANGXUN_SP			BIT(11)
 #define MODEL_MASK				GENMASK(11, 8)
 
 /*
@@ -312,6 +313,9 @@ struct dw_i2c_dev {
 #define AMD_UCSI_INTR_REG			0x474
 #define AMD_UCSI_INTR_EN			0xd
 
+#define TXGBE_TX_FIFO_DEPTH			4
+#define TXGBE_RX_FIFO_DEPTH			0
+
 struct i2c_dw_semaphore_callbacks {
 	int	(*probe)(struct dw_i2c_dev *dev);
 	void	(*remove)(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 55ea91a63382..3bfd7a2232db 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -354,6 +354,68 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return 0;
 }
 
+static int i2c_dw_poll_tx_empty(struct dw_i2c_dev *dev)
+{
+	u32 val;
+
+	return regmap_read_poll_timeout(dev->map, DW_IC_RAW_INTR_STAT, val,
+					val & DW_IC_INTR_TX_EMPTY,
+					100, 1000);
+}
+
+static int i2c_dw_poll_rx_full(struct dw_i2c_dev *dev)
+{
+	u32 val;
+
+	return regmap_read_poll_timeout(dev->map, DW_IC_RAW_INTR_STAT, val,
+					val & DW_IC_INTR_RX_FULL,
+					100, 1000);
+}
+
+static int txgbe_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
+				   int num_msgs)
+{
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
+	int msg_idx, buf_len, data_idx, ret;
+	unsigned int val, stop = 0;
+	u8 *buf;
+
+	dev->msgs = msgs;
+	dev->msgs_num = num_msgs;
+	i2c_dw_xfer_init(dev);
+	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
+
+	for (msg_idx = 0; msg_idx < num_msgs; msg_idx++) {
+		buf = msgs[msg_idx].buf;
+		buf_len = msgs[msg_idx].len;
+
+		for (data_idx = 0; data_idx < buf_len; data_idx++) {
+			if (msg_idx == num_msgs - 1 && data_idx == buf_len - 1)
+				stop |= BIT(9);
+
+			if (msgs[msg_idx].flags & I2C_M_RD) {
+				regmap_write(dev->map, DW_IC_DATA_CMD, 0x100 | stop);
+
+				ret = i2c_dw_poll_rx_full(dev);
+				if (ret)
+					return ret;
+
+				regmap_read(dev->map, DW_IC_DATA_CMD, &val);
+				buf[data_idx] = val;
+			} else {
+				ret = i2c_dw_poll_tx_empty(dev);
+				if (ret)
+					return ret;
+
+				regmap_write(dev->map, DW_IC_DATA_CMD,
+					     buf[data_idx] | stop);
+			}
+		}
+	}
+
+	return num_msgs;
+}
+
 /*
  * Initiate (and continue) low level master read/write transaction.
  * This function is only called from i2c_dw_isr, and pumping i2c_msg
@@ -559,13 +621,19 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	pm_runtime_get_sync(dev->dev);
 
 	/*
-	 * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
+	 * Initiate I2C message transfer when polling mode is enabled,
 	 * As it is polling based transfer mechanism, which does not support
 	 * interrupt based functionalities of existing DesignWare driver.
 	 */
-	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
+	switch (dev->flags & MODEL_MASK) {
+	case MODEL_AMD_NAVI_GPU:
 		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
 		goto done_nolock;
+	case MODEL_WANGXUN_SP:
+		ret = txgbe_i2c_dw_xfer_quirk(adap, msgs, num);
+		goto done_nolock;
+	default:
+		break;
 	}
 
 	reinit_completion(&dev->cmd_complete);
@@ -848,7 +916,7 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static int amd_i2c_adap_quirk(struct dw_i2c_dev *dev)
+static int i2c_dw_poll_adap_quirk(struct dw_i2c_dev *dev)
 {
 	struct i2c_adapter *adap = &dev->adapter;
 	int ret;
@@ -862,6 +930,17 @@ static int amd_i2c_adap_quirk(struct dw_i2c_dev *dev)
 	return ret;
 }
 
+static bool i2c_dw_is_model_poll(struct dw_i2c_dev *dev)
+{
+	switch (dev->flags & MODEL_MASK) {
+	case MODEL_AMD_NAVI_GPU:
+	case MODEL_WANGXUN_SP:
+		return true;
+	default:
+		return false;
+	}
+}
+
 int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_adapter *adap = &dev->adapter;
@@ -917,8 +996,8 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	adap->dev.parent = dev->dev;
 	i2c_set_adapdata(adap, dev);
 
-	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
-		return amd_i2c_adap_quirk(dev);
+	if (i2c_dw_is_model_poll(dev))
+		return i2c_dw_poll_adap_quirk(dev);
 
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
 		irq_flags = IRQF_NO_SUSPEND;
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 89ad88c54754..f5751d608048 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -168,6 +168,15 @@ static inline int dw_i2c_of_configure(struct platform_device *pdev)
 }
 #endif
 
+static int txgbe_i2c_request_regs(struct dw_i2c_dev *dev)
+{
+	dev->map = dev_get_regmap(dev->dev->parent, NULL);
+	if (!dev->map)
+		return -ENODEV;
+
+	return 0;
+}
+
 static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
 {
 	pm_runtime_disable(dev->dev);
@@ -185,6 +194,9 @@ static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
 	case MODEL_BAIKAL_BT1:
 		ret = bt1_i2c_request_regs(dev);
 		break;
+	case MODEL_WANGXUN_SP:
+		ret = txgbe_i2c_request_regs(dev);
+		break;
 	default:
 		dev->base = devm_platform_ioremap_resource(pdev, 0);
 		ret = PTR_ERR_OR_ZERO(dev->base);
@@ -277,6 +289,9 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dev->flags = (uintptr_t)device_get_match_data(&pdev->dev);
+	if (device_property_present(&pdev->dev, "wx,i2c-snps-model"))
+		dev->flags |= MODEL_WANGXUN_SP;
+
 	dev->dev = &pdev->dev;
 	dev->irq = irq;
 	platform_set_drvdata(pdev, dev);
-- 
2.27.0


