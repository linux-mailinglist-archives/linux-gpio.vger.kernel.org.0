Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9920B5EC280
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 14:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbiI0MVt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 08:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbiI0MVX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 08:21:23 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9743B5B048;
        Tue, 27 Sep 2022 05:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiL6c3KPTak+0F0lHpcl34SLfGklk08AGa9KomWX2BU4YcWKeJWck3MYR+hJVu0n0a2Sx36ntiROSsGMdlnSOS3WLBCnBinWcY9lnQYo7DuE7pmcW4H5lJuDXhrT+dzN/KfCYVkc7on0Rwx1DhIrL1pNDVp6nzjBmqEh9Mc2cIAw0bBz6FL9b2pmyXCet+VoI06u0P02WnK29qhZf4r3JK9780glE3PJaoxmLf1fQacm7J4PZCkfooAWW+JF7vJJSXnxk5eTKNyvXmSgtKCbmNqK2RJq7V/gds9APWmCq02MpDSFUeNOIRgNfNPjRvGVVTKoGXAf6rltnXKN/eGz+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AvxgU1n8IkVQJ7Q2UoA9pk5D1qIuQpq6SRxha6oNrg=;
 b=OixqZJWxbXC8lvOBHLLfmKxrxp4IBIQwh2FkuXz9za9Xg+FWJ1wt/c0KfHvadrwk27iRi/jc/wufBMZ3S1F53AtERUb9PVTo76jacl+6hdydYi0ZYpb+xYc41BqG6SomQqnaGnTT8sjmqCCe9IekfOXn6jgP7jRMQpIZHJJjajwoKKrJ7YD4Z78mpyMpAapiOd+5AW1NysRAy1sB3RYUE7hR2nBoHgDKm+mCPsxbg+BqcUYjTz04clcLm8Ppx53SK392cQYjcmJBY/8/0djfKttXDtETVLeFPcThQCOioU8pqv7j5n28k29Y/RmXX1XF1KxvTA5xhtOtg8xMZ+Rlxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AvxgU1n8IkVQJ7Q2UoA9pk5D1qIuQpq6SRxha6oNrg=;
 b=2ndcgCWjGXSyFxrbyz4bT+npriq7MYXW2TIs+0c3NTFljb6bBjx1o1bPTH8a3joHAfPeMjXSvadGa9mhGSqD4ZgJENT0NqYvOXv6sWpiLdS6rYuD72VhK38Zue3lA93QEp55RXrciOZ/utYCpxB9FH491jh2utDv7XGR814L1ek=
Received: from DS7PR05CA0099.namprd05.prod.outlook.com (2603:10b6:8:56::20) by
 SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 12:20:48 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::ab) by DS7PR05CA0099.outlook.office365.com
 (2603:10b6:8:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.14 via Frontend
 Transport; Tue, 27 Sep 2022 12:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 12:20:47 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 07:20:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 07:20:45 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 27 Sep 2022 07:20:42 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v4 3/3] gpio: pca9570: add slg7xl45106 support
Date:   Tue, 27 Sep 2022 17:50:41 +0530
Message-ID: <20220927122041.30607-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT047:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 5633ee10-dbbc-46ee-7b30-08daa082b5b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j06WlHhIrFKg1ZUIEv6yOR7DpFE75kIv4lzbTBffDLk/IB9VQi8arsSDGJ2t1iTdBkgJQp14HIFaLMp61P3MHOS/vH0cr3PN1zsMNtkYBh/423JQnXVMlBQ7v7noDoxUdwX3PA3iUW8es/eryLHMzHggmN+8O61Tnc/+RPHNhQ/qpCO1/6lxQV6a5fEb3Er1HHqbhOqBy8yICB8vWn2p56fC+XzY8NpqwchDQrQirFPlVnPx+lvjwO+q7iDwKg2SGkoOq6OTJjWhdYEDBqVMNKxxopEMAr/nJ1C78/0ilupFvYHCWXisMWZvf/TS04qgZYjYBQcpb1Yv1wk50mVKWHKorJMjwn2+FGaKrdWeTqgT1r/c6wkoz0WbgNpDZybYPXp+cUT6v+8CRSEh/2Fgp/zKD3OBJVPzWynok1acZzb2ZOXH+2DOQL0dZ6WmpRb8o13U2j9Mt/jqS55P0/YFOHOjFRFBm3harp0jmbGi2PI3MmSHugFJDB8aUfEgxAs09kIhY800uRD8XKowi2jVR1/BIHuNKcwCR/rXYat+hbuD57P2zNOMExqsEJ0QvXTW8txCpSpZZ9c6qA8BPKOEKVkXxCIXZMptGnLbVpW3VCCDbZjM9e42SC6tqy2iUUfgDRSMB1OxJhB7nA5G1StuOCqsZ43T4heT3WHUctgnCZR36yf7i47kQkgQN0oZ6n7qKwzrWNnxi4k3BxzTOzIU/ejWpMY+j+r19IvnlpOeiX2Ptw5xYzMAMtRtVYpnNYmRPNXQvL7DTebV75KOYi9Ahydet0UvaeDBl6K/Dh47SEI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(6916009)(316002)(54906003)(81166007)(82740400003)(356005)(40460700003)(5660300002)(8936002)(41300700001)(36756003)(44832011)(86362001)(4326008)(70206006)(8676002)(2906002)(70586007)(26005)(2616005)(1076003)(40480700001)(47076005)(82310400005)(186003)(478600001)(336012)(36860700001)(426003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 12:20:47.3034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5633ee10-dbbc-46ee-7b30-08daa082b5b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
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

