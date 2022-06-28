Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E27655E5F6
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 18:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbiF1Oeq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 10:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346169AbiF1Oeo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 10:34:44 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F9F2B269
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 07:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOL9v8u55QZTpf+TPu/+KWAGb/DQtDuD/GYgI210z6I46YiMQYoup/WubQaImVu9UozOFLvU7vCtT0RaLCyubRXntD1CBYkS54ZLdtyNr0OS53oHGjquFgxuBzw88+JdZSXdXymgyHsQVOyNZpkb5mLuP5gUsg+E3sSEwobojsl1+WgD1u+rELQAhhRq9txKLF6Zw1Ya9sJU6eMPnSiISII3xhgsR/rFV9kplJE4scvQfKyJberakd+y3dWOip1+FKLDeg7i9CMLLnOOxprkJOFm3dLccVfQ604QtO1rGTmLl20zFdjfxPHxVFDhhbElgEeerelwKKLyRrj0sTsrYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YeM9I7wTGfAviDSiD36yoFk0QcKDXY6wd5GRHmSRQE=;
 b=Rtsyxk351dxLxmpE1FdT/FGc2lvcmZ8LH7QrqBWUDiFD/bQsklbk9+s9083tduVPUqo56UXFfK5+wxsG8bXT5ThFDjq+CWOwjhBjF8cjF+cVAdAGf5J0G0UW6wgrYdOudlaecmfZLkPt4uHcqeP6y15HzT51AMrQSUWqtD82Nl5C8C0fsoXDmqNSCCC590y7OcQcpPWOmFQfOhSiqevT94Djmus4P+v+L90F/sPNCttdM+VdBt+DfMgsRVK66DIX6qfdApxzgnpbnkh3l4c4tfu208wDaKa01kXjDwW2faVlpnL6eEbvHBpgECURot9BDBQ2SbhOoED4FpUEg8hRpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YeM9I7wTGfAviDSiD36yoFk0QcKDXY6wd5GRHmSRQE=;
 b=UGpynevDOzaJM4FdA14LwSM5h0tPM1w+s1jN1NUFq3N5uSnQDGrbFgOgddbHM/7vXUZJdKw1ZwcKWwSSuBPGw6oCC8RV5mt0+qNALrZDKGZtuFb3gWEE5ETxoXIzL448UhysXZybJZK4dG/il3DT+DciUlWMzwsPiuWZa3XqADk=
Received: from SN7P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::7)
 by BYAPR02MB5175.namprd02.prod.outlook.com (2603:10b6:a03:6f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 14:34:37 +0000
Received: from SN1NAM02FT0046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:123:cafe::d4) by SN7P220CA0002.outlook.office365.com
 (2603:10b6:806:123::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Tue, 28 Jun 2022 14:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0046.mail.protection.outlook.com (10.97.5.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 14:34:37 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 28 Jun 2022 07:33:55 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 28 Jun 2022 07:33:55 -0700
Envelope-to: git@xilinx.com,
 linux-gpio@vger.kernel.org,
 git@amd.com
Received: from [172.23.64.3] (port=34503 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1o6CHq-000D9m-Uo; Tue, 28 Jun 2022 07:33:55 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@amd.com>, <git@xilinx.com>
Subject: [PATCH 2/2] gpio: Add support for SLG7XL45106 I2C GPO expander
Date:   Tue, 28 Jun 2022 20:03:49 +0530
Message-ID: <1656426829-1008-3-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1656426829-1008-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1656426829-1008-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07b2bf44-b30b-4875-dbf7-08da59135431
X-MS-TrafficTypeDiagnostic: BYAPR02MB5175:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xxmdW3LCBWUVEETYCPeAUKiD6Hd0BKiuq7uGPK2ih6DYE6daIxALq/RNuwl6eFt9nBQ31QEcwOzuq2UOBnV4bsPNCAYwL+0tmL7qv5NsdKPfJiZFUqQ0l97jFnWIH8LNH/5B3wDalsq56MpDt2nppc6mgUnXIrd+XQA/2WXZVehEyBYrT7aivHYxGjWNtkCidrwgV3Uf0YTroAePl927HfLLqGwtVLT6UGOkDfhcVFIFAEvUfJIdNhCst7rMxnkk6BYa14NMiQ/9+uiBsLNKEVApinDrrEoaWjV0T/GBber0qNqOOf3qtCSnlQ2kn0m9rbYMiLfcsGb7D8O6siYl6N3e3+Gi0YP1B3WXBd8X+2PX3xDKdQppOeKi8um5rtJAAEYTNTCPfbcir4UvapcE2mO5RYOuyc61lsIgP4gw/d+0roFMg+0zIS8fOhDJZoNZmvpyWlAOZShRAnVBTRrdF1Q0AaxulbwTbpRIzd7iOSALhOZNSnWSb5lYfZX0c5U7Ahb+3t59A12NwsJDAsUO4+buSei2hzWmYyEkME9JPXCzwIkyr3yymME+aTqiIFZYBJ11iwCEm2KibWupLrX0uEkgz5ZSKRBc9JR5q2d/3tDuMUpNkpnjtSiiejnGO/NYQbN9pKH1XP3oWN7f/Gdg7CavNe3m+upDI9Vf2fsY1iLpQk01aTWha+rxwom+mhxSrV7uuUoY+zO7p4vw/lam6uIjCB9mHTl8kcGvutP/D5HEN9L+PsB/Svia6LYkIUhl845SU4RLeSafixE9DlZKmKiGOqtScUmen56RBvQo2v4Z+6qQUEgvgTWX9qek0PmmP3/k36YKOAnJO9s8CcWnBQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(346002)(136003)(40470700004)(36840700001)(46966006)(186003)(26005)(47076005)(7696005)(6916009)(6666004)(41300700001)(54906003)(426003)(107886003)(336012)(70586007)(83380400001)(2616005)(7636003)(36860700001)(82740400003)(8676002)(356005)(9786002)(5660300002)(4326008)(316002)(36756003)(82310400005)(2906002)(40460700003)(478600001)(40480700001)(8936002)(70206006)(44832011)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 14:34:37.7369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b2bf44-b30b-4875-dbf7-08da59135431
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5175
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

Dialog semiconductors SLG7XL45106 is an 8-bit I2C GPO expander.
The output port is controlled by a data byte with register
address.

Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 MAINTAINERS                     |   7 ++
 drivers/gpio/Kconfig            |   9 +++
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio-slg7xl45106.c | 133 ++++++++++++++++++++++++++++++++
 4 files changed, 150 insertions(+)
 create mode 100644 drivers/gpio/gpio-slg7xl45106.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1fc9ead83d2a..3b3f322b5012 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5875,6 +5875,13 @@ F:	include/linux/regulator/da9211.h
 F:	include/sound/da[79]*.h
 F:	sound/soc/codecs/da[79]*.[ch]
 
+DIALOG SLG7XL45106 GPO DRIVER
+M:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/gpio-slg7xl45106.yaml
+F:	drivers/gpio/gpio-slg7xl45106.c
+
 DIAMOND SYSTEMS GPIO-MM GPIO DRIVER
 M:	William Breathitt Gray <vilhelm.gray@gmail.com>
 L:	linux-gpio@vger.kernel.org
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b01961999ced..1e10f96c9c09 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1101,6 +1101,15 @@ config GPIO_PCF857X
 	  This driver provides an in-kernel interface to those GPIOs using
 	  platform-neutral GPIO calls.
 
+config GPIO_SLG7XL45106
+	tristate "SLG7XL45106 8-Bit I2C GPO expander"
+	help
+	  Say yes here to enable the GPO driver for the Dialog SLG7XL45106 chip.
+	  This expander has 8 output pins.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-slg7xl45106.
+
 config GPIO_TPIC2810
 	tristate "TPIC2810 8-Bit I2C GPO expander"
 	help
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 14352f6dfe8e..8248e4fcc22f 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -136,6 +136,7 @@ obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
+obj-$(CONFIG_GPIO_SLG7XL45106)		+= gpio-slg7xl45106.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
 obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
diff --git a/drivers/gpio/gpio-slg7xl45106.c b/drivers/gpio/gpio-slg7xl45106.c
new file mode 100644
index 000000000000..61935b8538d1
--- /dev/null
+++ b/drivers/gpio/gpio-slg7xl45106.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for slg7xl45106 I2C GPO expander
+ *
+ * Copyright (C) 2021 Xilinx, Inc.
+ * Copyright (C) 2022 AMD, Inc.
+ *
+ * Based on gpio-pca9570.c
+ * Copyright (C) 2020 Sungbo Eo <mans0n@gorani.run>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+
+#define SLG7XL45106_GPO_REG	0xDB
+
+/**
+ * struct slg7xl45106 - GPIO driver data
+ * @chip: GPIO controller chip
+ * @lock: Protects write sequences
+ */
+struct slg7xl45106 {
+	struct gpio_chip chip;
+	struct mutex lock;	/* To protect writes */
+};
+
+static int slg7xl45106_read(struct slg7xl45106 *gpio)
+{
+	struct i2c_client *client = to_i2c_client(gpio->chip.parent);
+
+	return i2c_smbus_read_byte_data(client, SLG7XL45106_GPO_REG);
+}
+
+static int slg7xl45106_write(struct slg7xl45106 *gpio, u8 value)
+{
+	struct i2c_client *client = to_i2c_client(gpio->chip.parent);
+
+	return i2c_smbus_write_byte_data(client, SLG7XL45106_GPO_REG, value);
+}
+
+static int slg7xl45106_get_direction(struct gpio_chip *chip,
+				     unsigned int offset)
+{
+	/* This device always output */
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int slg7xl45106_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct slg7xl45106 *gpio = gpiochip_get_data(chip);
+	int ret;
+
+	ret = slg7xl45106_read(gpio);
+	if (ret < 0)
+		return ret;
+
+	return !!(ret & BIT(offset));
+}
+
+static void slg7xl45106_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct slg7xl45106 *gpio = gpiochip_get_data(chip);
+	u8 buffer;
+
+	mutex_lock(&gpio->lock);
+
+	buffer = slg7xl45106_read(gpio);
+	if (buffer < 0)
+		goto out;
+
+	if (value)
+		buffer |= BIT(offset);
+	else
+		buffer &= ~BIT(offset);
+
+	slg7xl45106_write(gpio, buffer);
+
+out:
+	mutex_unlock(&gpio->lock);
+}
+
+static int slg7xl45106_probe(struct i2c_client *client)
+{
+	struct slg7xl45106 *gpio;
+
+	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->chip.label = client->name;
+	gpio->chip.parent = &client->dev;
+	gpio->chip.owner = THIS_MODULE;
+	gpio->chip.get_direction = slg7xl45106_get_direction;
+	gpio->chip.get = slg7xl45106_get;
+	gpio->chip.set = slg7xl45106_set;
+	gpio->chip.base = -1;
+	gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);
+	gpio->chip.can_sleep = true;
+
+	mutex_init(&gpio->lock);
+
+	i2c_set_clientdata(client, gpio);
+
+	return devm_gpiochip_add_data(&client->dev, &gpio->chip, gpio);
+}
+
+static const struct i2c_device_id slg7xl45106_id_table[] = {
+	{ "slg7xl45106", 8 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, slg7xl45106_id_table);
+
+static const struct of_device_id slg7xl45106_of_match_table[] = {
+	{ .compatible = "dlg,slg7xl45106", .data = (void *)8 },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, slg7xl45106_of_match_table);
+
+static struct i2c_driver slg7xl45106_driver = {
+	.driver = {
+		.name = "slg7xl45106",
+		.of_match_table = slg7xl45106_of_match_table,
+	},
+	.probe_new = slg7xl45106_probe,
+	.id_table = slg7xl45106_id_table,
+};
+module_i2c_driver(slg7xl45106_driver);
+
+MODULE_AUTHOR("Raviteja Narayanam <raviteja.narayanam@xilinx.com>");
+MODULE_DESCRIPTION("GPIO expander driver for slg7xl45106");
+MODULE_LICENSE("GPL");
-- 
2.17.1

