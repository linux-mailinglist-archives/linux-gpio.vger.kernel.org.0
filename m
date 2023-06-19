Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22E6735137
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 11:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbjFSJ5M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 05:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbjFSJ4x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 05:56:53 -0400
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D2DE5C;
        Mon, 19 Jun 2023 02:56:47 -0700 (PDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J5mUng002763;
        Mon, 19 Jun 2023 04:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ZUwtWDbN+Xi9vSy0kuLY6Hls3ttHaS7lNlDP6YzuMZk=;
 b=klY7YkK1ID+idSlNsDQ0Y/W1riLMvYtMypOiqbGenv3wMNfIQ2S14knFpBtxu196NW8p
 ZjRXkXi1VqQf8azbrVwk/lvqLVPJl1tt3CA0SyJl8AuTs2yFmZC5aVbgHbfygOnvovT0
 R9efAtTQ5K14IeP+WA0LRg2d3EzgZ9QZnXpR1rXfAnmzMycqYvxgK4P7soNfz0ih+pU1
 FXXsOpLwKsP7jIvCsO7KXZF1sMcsknZHU5Hn8WfbFwqfhstWmCSEayAFQvnqd7Kg3E6J
 dYaHiqSxM/I3hbHMFC2+wnhzXga89K/Hje2Ct0ZPt/2EKFB1BF4i265rhijlh1j+oTQ6 sQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r998mhtm4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 19 Jun 2023 04:56:24 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 19 Jun
 2023 10:56:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 19 Jun 2023 10:56:23 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 487FB11AA;
        Mon, 19 Jun 2023 09:56:23 +0000 (UTC)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <broonie@kernel.org>, <lee@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>
CC:     <robh+dt@kernel.org>, <conor+dt@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <pierre-louis.bossart@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/6] soundwire: bus: Allow SoundWire peripherals to register IRQ handlers
Date:   Mon, 19 Jun 2023 10:56:18 +0100
Message-ID: <20230619095623.1987742-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230619095623.1987742-1-ckeepax@opensource.cirrus.com>
References: <20230619095623.1987742-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7K4VRrS7RVWKIB3q-7UjrF7WZrKDsNPv
X-Proofpoint-ORIG-GUID: 7K4VRrS7RVWKIB3q-7UjrF7WZrKDsNPv
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lucas Tanure <tanureal@opensource.cirrus.com>

Currently the in-band alerts for SoundWire peripherals can only
be communicated to the driver through the interrupt_callback
function. This however is slightly inconvient for devices that wish to
share IRQ handling code between SoundWire and I2C/SPI, the later would
normally register an IRQ handler with the IRQ subsystem. However there
is no reason the SoundWire in-band IRQs can not also be communicated
as an actual IRQ to the driver.

Add support for SoundWire peripherals to register a normal IRQ handler
to receive SoundWire in-band alerts, allowing code to be shared across
control buses. Note that we allow users to use both the
interrupt_callback and the IRQ handler, this is useful for devices which
must clear additional chip specific SoundWire registers that are not a
part of the normal IRQ flow, or the SoundWire specification.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v4.

Thanks,
Charles

 drivers/soundwire/bus.c       | 32 ++++++++++++++++++++++++++++++++
 drivers/soundwire/bus_type.c  | 12 ++++++++++++
 include/linux/soundwire/sdw.h |  9 +++++++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 1ea6a64f8c4a5..81f358ec09bee 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -3,6 +3,7 @@
 
 #include <linux/acpi.h>
 #include <linux/delay.h>
+#include <linux/irq.h>
 #include <linux/mod_devicetable.h>
 #include <linux/pm_runtime.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -25,6 +26,23 @@ static int sdw_get_id(struct sdw_bus *bus)
 	return 0;
 }
 
+static int sdw_irq_map(struct irq_domain *h, unsigned int virq,
+		       irq_hw_number_t hw)
+{
+	struct sdw_bus *bus = h->host_data;
+
+	irq_set_chip_data(virq, bus);
+	irq_set_chip(virq, &bus->irq_chip);
+	irq_set_nested_thread(virq, 1);
+	irq_set_noprobe(virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops sdw_domain_ops = {
+	.map	= sdw_irq_map,
+};
+
 /**
  * sdw_bus_master_add() - add a bus Master instance
  * @bus: bus instance
@@ -142,6 +160,14 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	bus->params.curr_bank = SDW_BANK0;
 	bus->params.next_bank = SDW_BANK1;
 
+	bus->irq_chip.name = dev_name(bus->dev);
+	bus->domain = irq_domain_create_linear(fwnode, SDW_MAX_DEVICES,
+					       &sdw_domain_ops, bus);
+	if (!bus->domain) {
+		dev_err(bus->dev, "Failed to add IRQ domain\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(sdw_bus_master_add);
@@ -178,6 +204,9 @@ static int sdw_delete_slave(struct device *dev, void *data)
 void sdw_bus_master_delete(struct sdw_bus *bus)
 {
 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+
+	irq_domain_remove(bus->domain);
+
 	sdw_master_device_del(bus);
 
 	sdw_bus_debugfs_exit(bus);
@@ -1711,6 +1740,9 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 				struct device *dev = &slave->dev;
 				struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
 
+				if (slave->prop.use_domain_irq && slave->irq)
+					handle_nested_irq(slave->irq);
+
 				if (drv->ops && drv->ops->interrupt_callback) {
 					slave_intr.sdca_cascade = sdca_cascade;
 					slave_intr.control_port = clear;
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 1f43ee848eac8..fafbc284e82da 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -122,6 +122,12 @@ static int sdw_drv_probe(struct device *dev)
 	if (drv->ops && drv->ops->read_prop)
 		drv->ops->read_prop(slave);
 
+	if (slave->prop.use_domain_irq) {
+		slave->irq = irq_create_mapping(slave->bus->domain, slave->dev_num);
+		if (!slave->irq)
+			dev_warn(dev, "Failed to map IRQ\n");
+	}
+
 	/* init the sysfs as we have properties now */
 	ret = sdw_slave_sysfs_init(slave);
 	if (ret < 0)
@@ -166,7 +172,13 @@ static int sdw_drv_remove(struct device *dev)
 	int ret = 0;
 
 	mutex_lock(&slave->sdw_dev_lock);
+
 	slave->probed = false;
+
+	if (slave->prop.use_domain_irq)
+		irq_dispose_mapping(irq_find_mapping(slave->bus->domain,
+						     slave->dev_num));
+
 	mutex_unlock(&slave->sdw_dev_lock);
 
 	if (drv->remove)
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index ef645de13ae93..c3ab5e5f9cfa4 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -5,6 +5,8 @@
 #define __SOUNDWIRE_H
 
 #include <linux/bug.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/mod_devicetable.h>
 #include <linux/bitfield.h>
 
@@ -369,6 +371,7 @@ struct sdw_dpn_prop {
  * @clock_reg_supported: the Peripheral implements the clock base and scale
  * registers introduced with the SoundWire 1.2 specification. SDCA devices
  * do not need to set this boolean property as the registers are required.
+ * @use_domain_irq: call actual IRQ handler on slave, as well as callback
  */
 struct sdw_slave_prop {
 	u32 mipi_revision;
@@ -393,6 +396,7 @@ struct sdw_slave_prop {
 	u8 scp_int1_mask;
 	u32 quirks;
 	bool clock_reg_supported;
+	bool use_domain_irq;
 };
 
 #define SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY	BIT(0)
@@ -640,6 +644,7 @@ struct sdw_slave_ops {
  * struct sdw_slave - SoundWire Slave
  * @id: MIPI device ID
  * @dev: Linux device
+ * @irq: IRQ number
  * @status: Status reported by the Slave
  * @bus: Bus handle
  * @prop: Slave properties
@@ -669,6 +674,7 @@ struct sdw_slave_ops {
 struct sdw_slave {
 	struct sdw_slave_id id;
 	struct device dev;
+	int irq;
 	enum sdw_slave_status status;
 	struct sdw_bus *bus;
 	struct sdw_slave_prop prop;
@@ -883,6 +889,7 @@ struct sdw_master_ops {
  * is used to compute and program bus bandwidth, clock, frame shape,
  * transport and port parameters
  * @debugfs: Bus debugfs
+ * @domain: IRQ domain
  * @defer_msg: Defer message
  * @clk_stop_timeout: Clock stop timeout computed
  * @bank_switch_timeout: Bank switch timeout computed
@@ -916,6 +923,8 @@ struct sdw_bus {
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 #endif
+	struct irq_chip irq_chip;
+	struct irq_domain *domain;
 	struct sdw_defer defer_msg;
 	unsigned int clk_stop_timeout;
 	u32 bank_switch_timeout;
-- 
2.30.2

