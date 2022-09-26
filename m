Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 651225E9954
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 08:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233220AbiIZGOR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 02:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232675AbiIZGOP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 02:14:15 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2087.outbound.protection.outlook.com [40.107.212.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BD727DCA;
        Sun, 25 Sep 2022 23:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3miR6FxB85tSk7YXJqxvZ/o6xd7H2umISSrqNsNfpOhV8SRYhSwpha1sq2E+i+seqscSG/yRt2vIzbHvy5POPWi+BiOGPRMQ0+a1EsCfzK/CfjoH/9ZiUrW/7mz7h7b74oYZqEo+TGBZcSfMBU6ctKgnEMW8NmajytLdReRgF89DJY4mCTiXBZ9zrcJTtp3ZpKVR8/zdzEwzv5OiV/zUTu+FDVikadyK81WnSOV4PBYCAtELKtC3N9IC6XjmwRzwaY8jzO29vueyes7hto8yCogcvjG1FItxnZNLeKY6+6wgle+QTiIw3m5LegdZLBdgZVr+h0X3bevSq8vxrQODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTx8Irqn3dOZWwC71x30+8EEcW/wToLoRcjFXMrI3kI=;
 b=LDxxPOV+r1lH8OdxcnKL87Kf4tQEodQ4XxxNe1aMr3r2l7lai8I7TtcJOEQI6z4gR20FI6CSrIFTSpLrNVAihMIXnb74IUW3uw7j4O2X/WNdcoUI+jca2Lt2SD64lt07rfZQxEdYNUUmd/hVNniswjxqqs7PJ4iC0nrcjz+7ex68xYKHC1J10ZsDoIVOjzvcfBSRZ2GQgyHTIQZ8xnCcVM4jiUos+VESo+YHgykaE7TKNMnwc0ltPVzbnn1RQUhuR+LAS8K2uQdnxeUKtAO5FSgH2tymc+3tiSRq8ZplIM/YMmZzA11EF0chu+NetSw4jTprNmljD8ajp1p2BLqWUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTx8Irqn3dOZWwC71x30+8EEcW/wToLoRcjFXMrI3kI=;
 b=U8rxQfpvDJFaxPHw+ZWk5hjnRak1qlgTqyMHNoATLcEwGzVIIFv6jWvEMZMte4qV2rYhf0zQu29uXdZA40r3VlFUvcwthaTaaCtQapfEcIxE0XJvrviXxoyUShGHlgMrLvXIXsyXhbcjN5L+yGqkXRu6dVdy5lO5rUUr/IYu23w=
Received: from MW4PR04CA0173.namprd04.prod.outlook.com (2603:10b6:303:85::28)
 by CH2PR12MB4921.namprd12.prod.outlook.com (2603:10b6:610:62::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:14:12 +0000
Received: from CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::31) by MW4PR04CA0173.outlook.office365.com
 (2603:10b6:303:85::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 06:14:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT024.mail.protection.outlook.com (10.13.174.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 06:14:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 01:13:27 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 26 Sep 2022 01:13:25 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v3 3/3] gpio: pca9570: add slg7xl45106 support
Date:   Mon, 26 Sep 2022 11:42:59 +0530
Message-ID: <20220926061259.13491-4-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220926061259.13491-1-shubhrajyoti.datta@amd.com>
References: <20220926061259.13491-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT024:EE_|CH2PR12MB4921:EE_
X-MS-Office365-Filtering-Correlation-Id: 132d34c7-99a0-4a9d-1b42-08da9f86548c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hi2lLycqraBSuOQf+PHXdc64oY8Gj+eho0M2F18vES8A7LqH2A7U+cESKvQk2T+y06VZFvAoshuwLq3EG6bSqYwDXtzuU10Dr/kKLy7rCN3/Pacgj76iVq6E/X2tbFMWhdNGMKMuCz7g/zAgf7m5SxHz91O9jTjKi8SR/I0QOPsKxpXn3HAZl9GpM/ZK0isHEdFiE0ZK/ltQtGAXvVqCmI9lls1qpJ5UV9F3GZFycMg8HXmEjymVu3dY6gynl4amXZkIyBExYyAWfS3gpaWD9aprHC+vNo97bEYlj0oTOQ3sf54hUfv4nCahNC67ZSuX51eSk5cLJs4/0EIRtyPg1PxkYEYHlHhu8bpjI9/Xv+r4J9twUZqgqR8+kLo5x05iCuVS8tVPEYB3cyv60mwmPqm+kwZQ4DeViPg0lDTIc08VMkscthe+jryqo/hmTfSVUNwN08efYhgHD39NG4f+eMAl5ZTpk3Uxc14Z0MuOfg5riF03HYZBsn97Bxh2hjeCYX1wSTEkeG0O+AkOcs9eKZkk45oGPXcl0dLUPFaG3nDzMQrCcuuhnZ4b4Ulx1PJVjl2C99nXhglf771/34KVWpljcefyzh/WdddJx+p/QHAJdWqb63AWRI+cS5OCNz9oITpEb24LHGJa+zKAWt4CAjA96+IZtQBJkl0FYK096Qk/IZMqY/Vn42Kl/MbR/O0NSGf/FGgdhOvc8NXofRuBVyYAYfHxF8fxsNBTimMmuBCQQYyEa1tNo+2SryyNcX/Uh7uzgepiDZuEYSR/FT/zOHBHed28J1BiuhBQjGYbtM8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(426003)(83380400001)(336012)(36756003)(47076005)(82740400003)(356005)(40460700003)(36860700001)(81166007)(8676002)(70206006)(70586007)(4326008)(8936002)(44832011)(2906002)(5660300002)(86362001)(6666004)(41300700001)(82310400005)(26005)(2616005)(1076003)(186003)(40480700001)(478600001)(54906003)(316002)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:14:11.7373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 132d34c7-99a0-4a9d-1b42-08da9f86548c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4921
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dialog semiconductors SLG7XL45106 is an 8-bit I2C GPO expander.
The output port is controlled by a data byte with register
address. Add a compatible string for the same. Also update
the driver to write and read from it.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
v3:
split the patch

 drivers/gpio/gpio-pca9570.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index d49e088e6b43..6c07a8811a7a 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -15,6 +15,8 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 
+#define SLG7XL45106_GPO_REG	0xDB
+
 /**
  * struct pca9570_platform_data - GPIO platformdata
  * @ngpio: no of gpios
@@ -28,11 +30,13 @@ struct pca9570_platform_data {
 /**
  * struct pca9570 - GPIO driver data
  * @chip: GPIO controller chip
+ * @p_data: GPIO controller platform data
  * @lock: Protects write sequences
  * @out: Buffer for device register
  */
 struct pca9570 {
 	struct gpio_chip chip;
+	const struct pca9570_platform_data *p_data;
 	struct mutex lock;
 	u8 out;
 };
@@ -42,7 +46,11 @@ static int pca9570_read(struct pca9570 *gpio, u8 *value)
 	struct i2c_client *client = to_i2c_client(gpio->chip.parent);
 	int ret;
 
-	ret = i2c_smbus_read_byte(client);
+	if (gpio->p_data->command != 0)
+		ret = i2c_smbus_read_byte_data(client, gpio->p_data->command);
+	else
+		ret = i2c_smbus_read_byte(client);
+
 	if (ret < 0)
 		return ret;
 
@@ -54,6 +62,9 @@ static int pca9570_write(struct pca9570 *gpio, u8 value)
 {
 	struct i2c_client *client = to_i2c_client(gpio->chip.parent);
 
+	if (gpio->p_data->command != 0)
+		return i2c_smbus_write_byte_data(client, gpio->p_data->command, value);
+
 	return i2c_smbus_write_byte(client, value);
 }
 
@@ -116,7 +127,8 @@ static int pca9570_probe(struct i2c_client *client)
 	gpio->chip.get = pca9570_get;
 	gpio->chip.set = pca9570_set;
 	gpio->chip.base = -1;
-	gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);
+	gpio->p_data = device_get_match_data(&client->dev);
+	gpio->chip.ngpio = gpio->p_data->ngpio;
 	gpio->chip.can_sleep = true;
 
 	mutex_init(&gpio->lock);
@@ -137,14 +149,21 @@ static const struct pca9570_platform_data pca9571_gpio = {
 	.ngpio = 8,
 };
 
+static const struct pca9570_platform_data slg7xl45106_gpio = {
+	.ngpio = 8,
+	.command = SLG7XL45106_GPO_REG,
+};
+
 static const struct i2c_device_id pca9570_id_table[] = {
 	{ "pca9570", (kernel_ulong_t)&pca9570_gpio},
 	{ "pca9571", (kernel_ulong_t)&pca9571_gpio },
+	{ "slg7xl45106", (kernel_ulong_t)&slg7xl45106_gpio },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
 
 static const struct of_device_id pca9570_of_match_table[] = {
+	{ .compatible = "dlg,slg7xl45106", .data = &slg7xl45106_gpio},
 	{ .compatible = "nxp,pca9570", .data = &pca9570_gpio },
 	{ .compatible = "nxp,pca9571", .data = &pca9571_gpio },
 	{ /* sentinel */ }
-- 
2.17.1

