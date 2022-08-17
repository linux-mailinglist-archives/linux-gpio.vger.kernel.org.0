Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF35596BBF
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Aug 2022 10:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbiHQI4w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Aug 2022 04:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbiHQI4v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Aug 2022 04:56:51 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906777FE75;
        Wed, 17 Aug 2022 01:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcM8CRkX794fH8E7D5DfVGTzXlnycNtmUIIOYYus/d3OQuFY1p56bgJoizTZU628J7NzZvnIpqpRw9U7L69zaFPVTj5SouJPxNanh33TSqqTuPRm0Ne+zhdk+Abk7j5dUp3l/6GyTxkRDQ78LQ0DtGWiakGD4QmauOwN/3GctXOLxK3EW8T6N7jSZtAEhEKh5v4ZKuU/LrvwQW5sqCd+2N5ayPSNO3RXYIlD+2beo11+8qg1i00IXZVleviztToSGq5ACW/DnryNclsdiOBwvbpqZJSpyP1RxdH9zQgeDUVU6I0qhfHBhUNlF2WfMMieHWE9iQ2lqDHIR6sHmEqyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzcXfdiSHzsv0mxs/S7iOxn9ZkzQ+8lGuommV2BhLhc=;
 b=Ex7fZ23F3nEFGngg6C5LpJ4i2j/Rlj+eLMANQZCO/v09sLnFOOliAGjxQfz/6A25nRFEdbuwoNExl8JeuUJofMaZ31kdak+UAAVf7TNRkjwySD/iXDIDQ3waIxePh9mqlvUhWP0UTLpzkr2uVewsufasz5fr+8grGa8TP6/rv356/MicMwTy4wpfgE61LPYbDq1Jgs/+QfKdrluSDbGTmJXS8pepc1BYzud6S+C4o1kY09DWVruEwtUIO/1EmiEj/c6+nkQhYrzM7XYBfFyRJf7aJfcIbwjIkyKiMLVaoT3caGvre7sSX9pKb1ii/KVhWak8T6ai7bFquubkBXN9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzcXfdiSHzsv0mxs/S7iOxn9ZkzQ+8lGuommV2BhLhc=;
 b=gmjXayULT0wV5Q587vGIbk1RhHVPSMJwi+dQOCiEBNvSiseeXj9Xy5bXvxIqF5Es/CuSveXnnFr8I52y2ccGxlHnDZoZP8WWOS1wnaOVcTuhhTdEEQzmSOaEPU/iRcNFGdY8m3CQatDjvXauKnMKVQ1HKAM1/nAl5Ol6mXbTWso=
Received: from DM6PR04CA0014.namprd04.prod.outlook.com (2603:10b6:5:334::19)
 by DS7PR12MB5959.namprd12.prod.outlook.com (2603:10b6:8:7e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 08:56:47 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::d) by DM6PR04CA0014.outlook.office365.com
 (2603:10b6:5:334::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18 via Frontend
 Transport; Wed, 17 Aug 2022 08:56:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Wed, 17 Aug 2022 08:56:47 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 17 Aug
 2022 03:56:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 17 Aug
 2022 01:56:02 -0700
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 17 Aug 2022 03:55:59 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git-dev@amd.com>, <mans0n@gorani.run>,
        <devicetree@vger.kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <shubhrajyoti.datta@gmail.com>
Subject: [PATCH 2/2] gpio: pca9570: add slg7xl45106 support
Date:   Wed, 17 Aug 2022 14:25:50 +0530
Message-ID: <20220817085550.18887-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220817085550.18887-1-shubhrajyoti.datta@amd.com>
References: <20220817085550.18887-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a495299-02eb-43ff-db85-08da802e6ae8
X-MS-TrafficTypeDiagnostic: DS7PR12MB5959:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KaUOzjFpLiWlw5Ptrls988ckGCXt3wlxfClncRaMap8D6+wH3Ajr7PJ7JppDYvng7iLROS3pEj8xmc0kLvoCOXDKlKeS91yyn5HoJDcsRP1z8Y+YSt2APMS6SDxmof79Q7Asa0zIY4oouGKpXoTGPc4SzbFm5aNy9+d/VctKLwBVXxf2ET2aS622NGz3b6ziqeNVuMwMk+u1SYEJNuGSez8aBfYFmEw+H7UwZ1pduZFvWrtjKDkkf8aFj4k4EBoFdvcYFwZ68r+wCW2H0qTGdMZ2BsM7sTbZRGdrtbB07DWX2IlL0iYK3A6VzjhR0R0NeSEdpq2rnnd6hXdgkm8PdrAuNLsbSd+FVXvuj6ffs2o4hfR4FU1abKnAL/GosEucDe6Ue0b0o5NeyFqCfYjvXQbHe6WzTyuSEU+Nv5jxSDog1+V9vXxutuKj1OI9SPWyex7FI2bkhyuc4+S/70F5gbZP+/DPvN2H3xFqyy+WWOb+M+2y149mnpTK9JUtp6/uZ4vOfvj4U7IwrqIer3nF6HgU9SFCRCUfWdOJAv68p/AkFNaz4j4LM3+RufX2hoLBEJVJdaTmdf470y9hKmANUu1/tw7/noWvlBHTfucQr5sBOVKScGYDJMqpmQoQ2kv6IewPDfObxJg+gD/qV1qJO4yVfirn+5nb5HkD8fxnn+NwXZw2NW66v81XyG+mzKfK9XdvczYt4ZhvDCBBGHLy7YvwJHztWBTugtJCDC2lRGuVft8Vxhik2mJiKFnCBnfLHKnKtGdfpgz6tcTxQ4wU2h899O6aXsjO6qOuXVsUbC2Nq1tIqGtOZJjWC/oKKMiTSUWisIVf9BQ3bttInaJ7pA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(40470700004)(46966006)(36840700001)(4326008)(2906002)(8676002)(36860700001)(8936002)(83380400001)(44832011)(5660300002)(70206006)(70586007)(81166007)(36756003)(356005)(186003)(426003)(82310400005)(478600001)(54906003)(41300700001)(316002)(1076003)(336012)(2616005)(86362001)(6916009)(6666004)(40480700001)(40460700003)(47076005)(82740400003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 08:56:47.5749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a495299-02eb-43ff-db85-08da802e6ae8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5959
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

slg7xl45106 is a I2C GPO expander.
Add a compatible string for the same. Also update the
driver to write and read from it.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
 drivers/gpio/gpio-pca9570.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index 2735cd6addcf..b4e422b25ea6 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -15,6 +15,8 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 
+#define SLG7XL45106_GPO_REG	0xDB
+
 /**
  * struct pca9570 - GPIO driver data
  * @chip: GPIO controller chip
@@ -25,6 +27,7 @@ struct pca9570 {
 	struct gpio_chip chip;
 	struct mutex lock;
 	u8 out;
+	u8 command;
 };
 
 static int pca9570_read(struct pca9570 *gpio, u8 *value)
@@ -32,7 +35,7 @@ static int pca9570_read(struct pca9570 *gpio, u8 *value)
 	struct i2c_client *client = to_i2c_client(gpio->chip.parent);
 	int ret;
 
-	ret = i2c_smbus_read_byte(client);
+	ret = i2c_smbus_read_byte_data(client, gpio->command);
 	if (ret < 0)
 		return ret;
 
@@ -44,6 +47,9 @@ static int pca9570_write(struct pca9570 *gpio, u8 value)
 {
 	struct i2c_client *client = to_i2c_client(gpio->chip.parent);
 
+	if (gpio->command)
+		return i2c_smbus_write_byte_data(client, gpio->command, value);
+
 	return i2c_smbus_write_byte(client, value);
 }
 
@@ -94,6 +100,7 @@ static void pca9570_set(struct gpio_chip *chip, unsigned int offset, int value)
 static int pca9570_probe(struct i2c_client *client)
 {
 	struct pca9570 *gpio;
+	struct device_node *np = client->dev.of_node;
 
 	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -109,6 +116,9 @@ static int pca9570_probe(struct i2c_client *client)
 	gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);
 	gpio->chip.can_sleep = true;
 
+	if (of_device_is_compatible(np, "dlg,slg7xl45106"))
+		gpio->command = SLG7XL45106_GPO_REG;
+
 	mutex_init(&gpio->lock);
 
 	/* Read the current output level */
@@ -121,12 +131,14 @@ static int pca9570_probe(struct i2c_client *client)
 
 static const struct i2c_device_id pca9570_id_table[] = {
 	{ "pca9570", 4 },
+	{ "slg7xl45106", 8 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
 
 static const struct of_device_id pca9570_of_match_table[] = {
 	{ .compatible = "nxp,pca9570", .data = (void *)4 },
+	{ .compatible = "dlg,slg7xl45106", .data = (void *)8 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, pca9570_of_match_table);
-- 
2.17.1

