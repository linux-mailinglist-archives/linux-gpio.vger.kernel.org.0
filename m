Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 012855EC279
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 14:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbiI0MVS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 08:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232349AbiI0MUw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 08:20:52 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89035123DB0;
        Tue, 27 Sep 2022 05:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kapY3ALKLDMIMGzp2ISXOVgAEeg3Gd1XwHtMZstvezv/4znbL0ua3H0GKuBeGAUsaqwR1mQCWCv4U/EZtYXXOijk20MmNgxI+9oMZw9vJwWXIE4IYiclUtMh6MjKP1y6fjPMQSHI3+Qo+yKXObAswV7Vwk8aVOhr+S844kjwU/uCJiZjlFEVX4bLSga808jtyLQod9biTyNixDnT7gvwskd/A2PM3/ywiZUp/3+XQ/IvwSCNWdElmXXENPK29HzYVqSWWvwr5AdJBPC2rTNNr+bPRG+ZHrWFnRvLMXodb4qnzX95QB9yvBKEMAheTzYu9sZPlG+JTELW0ywNxu49jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AvxgU1n8IkVQJ7Q2UoA9pk5D1qIuQpq6SRxha6oNrg=;
 b=T7laf/fnJXskHvDM4BojNBfY//mdoW0g08sg6LZ6ulZ/NcUCr9RzItgXpFJcIdzkIsnjUFfUmfChV9xmM1rkp+bgHmQrUYY80vJx8Rvt2Ak9A9ULnfe04eHGR9+2HJQb14LTgTyLEHXH/baLs7U1prZR+DwRRDDEbjh70Vx0HnHLIyjnVWB5W06whzjzdEevBRHs25Ouk38Slzrp3QETEm6ERFlmzU6C4xX9WbT2dGX1sA+/QU2FeqzM1pnjmEApE/AJ4gn4eMNjRt+mGYrWtFpLFxLIieLtHgulcYejqoQbxDUDqXIqrpbuhzJnbmbvw9O2bLR/StzFIUhYwzkXsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AvxgU1n8IkVQJ7Q2UoA9pk5D1qIuQpq6SRxha6oNrg=;
 b=y94dW3rzx5iXMAkjogb0L8x4GoTo11GESQX+9Ef7leEjzwbun+PCb5yDd+6xskdta8ZwVIz61J1iodC4AubVwmZXtBVvp30NqJ6+MP6EEA8Lb/UyN451HxO+xQN9C8LgaKU3/EFwBOQAYdSsuzS+YQjDYVgfvfIMffY2xug3Sdo=
Received: from BN9PR03CA0299.namprd03.prod.outlook.com (2603:10b6:408:f5::34)
 by BL1PR12MB5318.namprd12.prod.outlook.com (2603:10b6:208:31d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 12:19:31 +0000
Received: from BN8NAM11FT084.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::a4) by BN9PR03CA0299.outlook.office365.com
 (2603:10b6:408:f5::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15 via Frontend
 Transport; Tue, 27 Sep 2022 12:19:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT084.mail.protection.outlook.com (10.13.176.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 12:19:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 07:19:29 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 27 Sep 2022 07:19:27 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v3 3/3] gpio: pca9570: add slg7xl45106 support
Date:   Tue, 27 Sep 2022 17:49:18 +0530
Message-ID: <20220927121918.30543-4-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220927121918.30543-1-shubhrajyoti.datta@amd.com>
References: <20220927121918.30543-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT084:EE_|BL1PR12MB5318:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eee1528-522a-4995-5c54-08daa08287b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GsV7Da4b91Rul+798n19xlkAAZUoFJXjjZtDMYkRAOKfCL/Cry0dxMBeLDCp9Jy9iRM4pkM1om6rg8gqXhiiVBRbTBvc17KNSa1WbD38sNh9B8YFLE/EX71LJ0Fv4CFLeAhd1Spx0z7RL92m+OqCASNILJWsGnLUngCsX20l7GSV18St/6ZkgsK9ZPLLuoOdBkzNQOhsn1uZzdkU0QYkxrgy1q64bjO/uJ3MajD5Cs4K8cXbK0A8XvSAYofSgStRetYGZX6fzwrFghh1VofAUzKJB+UfpgbjBHkEdegf4yJ0VJsc4hIumCPSvd/PLbkcsClQjcszP2uGHaZ9vjFfogaKW8PRpu6BQ3H7F4ahC7rdv/5KhvDw73A2caKThU9dL+LRBsoZ7Upp+ipOON+Cx61NKaac02pI2+vhamf95qCxdQwSvV5W7ayy2Bgcja2vBE48XOl0gbfs5xf0eRvwZt4U+GxEeal0dO0ypCFlXk6JWNXEwye0qZJgXEXa6rQB7K22sZB2rSeycLUnZeP9Df5MQwc9G1ahQYGOGURdXZXHn3ELn57f49Xvc2WEaDiM5PqoCEZPVK5vaVgSn2tqUryqaHbSC7h66t4w8M4SGpuCFPb8ybHVxqtQI11RJwiW1dAtF+QUp+1eneUN3LRLWi5HMnssOACqp0LGH00zawl7rGOrOX/qb1exvCtGUFWZgjhZY0i04A83zahWpv/VS1mJiNLtC0EBtIZH5/GWE0V3uOJ7sjmVJlnVRZ6amJmjunu3nsS2qYe0CorgVCN2YhJgxkCRaXnrs8riFXzB64uMyzswbgH/4RUrsGa8PIMV5gY/T6NTy6nj3oXFr3qZRyD1MZsyvkfTbcca1mUP+SY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(82310400005)(356005)(81166007)(2906002)(316002)(6916009)(26005)(6666004)(36860700001)(44832011)(82740400003)(54906003)(86362001)(478600001)(5660300002)(426003)(336012)(47076005)(8936002)(8676002)(83380400001)(2616005)(186003)(1076003)(41300700001)(40460700003)(40480700001)(70206006)(70586007)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 12:19:30.7771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eee1528-522a-4995-5c54-08daa08287b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT084.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5318
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
As suggested by Andy Shevchenko

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

