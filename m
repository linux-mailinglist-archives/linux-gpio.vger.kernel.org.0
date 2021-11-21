Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C41D458517
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 17:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238701AbhKURA1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 12:00:27 -0500
Received: from mail-db8eur05on2052.outbound.protection.outlook.com ([40.107.20.52]:50272
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238483AbhKURAJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0GbkqjVNt8L+Bhy8DKrHaU5MAwNQ4JHyrb4FGund2M=;
 b=ncoT/GKf/KF5tBFF6EuhB8Iqq6+Dcea4enHLiI+LSxx6Ue/j+ihXmR+d8lpt0+wtZS25M+rlhW9NNZRy618garvjN5tnkPiF9XuOzyzLpO+N/U4y7pmFSfV8mBYfBgPKdr05Kw2OPxWnrLTxMk36/BMjlAM6oOCq4zSPSrxlUBk=
Received: from DB7PR03CA0097.eurprd03.prod.outlook.com (2603:10a6:10:72::38)
 by DB9PR08MB6444.eurprd08.prod.outlook.com (2603:10a6:10:23c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Sun, 21 Nov
 2021 16:57:02 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::9) by DB7PR03CA0097.outlook.office365.com
 (2603:10a6:10:72::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:02 +0000
Received: ("Tessian outbound de6049708a0a:v110"); Sun, 21 Nov 2021 16:57:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7186051f8a569db1
X-CR-MTA-TID: 64aa7808
Received: from fd8123f6f4e2.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id FBB3281F-D664-4B89-A434-DA262C299071.1;
        Sun, 21 Nov 2021 16:56:55 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd8123f6f4e2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 21 Nov 2021 16:56:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lphmdM6hYBM2bAVIZtktmGip2PHPSdsIfdm73Pl61UVrKCvDpBPil0x/WwyjD8i63XfdWBHuNrz6cN/9x6GYYZlqYMkriaaNu2CmAkBrinKeOLaDhGijxO8/HcpgT7n11g1saii8bR2EEGm3SA2Dxn8L1vRLerAl+iQPA+vPhVKUuyi5YxXgNWJzdAp+Gt435BKpH6DTKvu9LqferXBz6nC8Xke0bhr0eNII46wLtI45UztolZ6Cj3zOLsfbj5QD3ais4pFh/WEKgOECV7nNE7hYsTAc3qP7ArANLA8kwu7R8F7VZGhiEC+LqZKD3wHNxB5txNTvohjhFu7lxAMabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0GbkqjVNt8L+Bhy8DKrHaU5MAwNQ4JHyrb4FGund2M=;
 b=VkL2gpHC9LofLqP88LulDv7oVhDY2efHigCFSDQxrHtHgdnNg52k9U4/zc9+tIeKns32iJfHrZvDJg4RVXYbU0FG7T+1IANP/QMpNM81oBF+01LZVd4NaI29lrLe+dut8YTuidcsqNXpvwjOQ1l849QOD6hpdfOXI2QuJdkiaG0bugygRO0yHy1o0nAQKkIPNnmLn/IxI1lQTzPm8uuN54Xue8KA9hNgYENZOlbv+56wkTN+2SjK1CobAdCRx/sCuQsot39clqTi1Ctgxiy6r3F92K2d2iArEJcSPKPhr/+6RQV2PXLOSNvWiiXfiZOnzasWfiqchNBPvDVcWUbx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0GbkqjVNt8L+Bhy8DKrHaU5MAwNQ4JHyrb4FGund2M=;
 b=ncoT/GKf/KF5tBFF6EuhB8Iqq6+Dcea4enHLiI+LSxx6Ue/j+ihXmR+d8lpt0+wtZS25M+rlhW9NNZRy618garvjN5tnkPiF9XuOzyzLpO+N/U4y7pmFSfV8mBYfBgPKdr05Kw2OPxWnrLTxMk36/BMjlAM6oOCq4zSPSrxlUBk=
Received: from AS9P194CA0010.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::10)
 by AM6PR08MB3926.eurprd08.prod.outlook.com (2603:10a6:20b:a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Sun, 21 Nov
 2021 16:56:52 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::77) by AS9P194CA0010.outlook.office365.com
 (2603:10a6:20b:46d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:56:51 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sun, 21 Nov
 2021 16:56:49 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:49 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v2 05/11] pinctrl: apple: handle regmap_read errors
Date:   Sun, 21 Nov 2021 16:56:36 +0000
Message-ID: <20211121165642.27883-6-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211121165642.27883-1-joey.gouly@arm.com>
References: <20211121165642.27883-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfbf8cbb-45cc-4260-5296-08d9ad0ff083
X-MS-TrafficTypeDiagnostic: AM6PR08MB3926:|DB9PR08MB6444:
X-Microsoft-Antispam-PRVS: <DB9PR08MB6444148B7A6614D98A54CAC1949E9@DB9PR08MB6444.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /CtHGXuG20U249vpQRUKfeZF24v9jcJ47pgQ2b0bQHuVcMiPs6ogND8lPP3BVroUTgfRJvH12MW/rcRH19zofnE0ryq81DErBbCEnQNdFzmgK/RHzckPPBwBFVGAImmddIP+b4RseePP2NzL20f7d1Kf+EyGq5IohF26VMfZpJsV3Fv9K7kahMlmUfKSnHycQQ5CKdK2mVbcU7RTBLraRyu3Rb2Uh0F1qKf5skxzvyV3RVDkf3E5T7LNM1cEhr1/ZfdoPlopdOGPTn6LAet0Rwn0SZTH/4hrHZu7BQYm2Bu3LQQ29cPe1DyzJuR0RPmjY3w6US4pGIawSK6gT6WmTNlH1dLsncjyKOD5cSI/7USRvdqzXDzcN00CnZFvZBz4EYZISr+l+4buRmXmke3sok2L4Iu07aLagjHouvDgtKbi69rxKMwKpGoVdTeIPZIfoEqcnoFtHUMPYXivJWaNx7DLo9kJzm/tiHBoIjczFTga53c2+Jb/Xyy0s7EicjQb4T7S/UskVJmVOIzR6VbOkIoCUSk/1Fti0nQYt2H/vtVhvDHAMQs+I7linXzoVnAhAdVl2Pox37egNvlwwI8j2mudTomaqKSDwfUgvmdzLPZFIxsKuHFsIe2a1uVXoz3KuSMYM8CzuleOfMxx/by/IhSoi1fQHqPz6g1yX1V9dI4cCQ7k7UZMw/ReshFh1b454lLnYeNu0MetM4zk8rH8BEkLYdHHM7QGSQeLMKuJ96RwEMUIArsnoNGCACQmH+zX5R9iugkuPnSKtvx/6X5NdQ==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(6916009)(47076005)(186003)(81166007)(82310400003)(8676002)(356005)(2616005)(316002)(44832011)(426003)(336012)(86362001)(36756003)(83380400001)(508600001)(1076003)(54906003)(2906002)(6666004)(36860700001)(26005)(7696005)(70206006)(4326008)(5660300002)(4744005)(70586007)(8936002)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3926
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 94a16d9e-a3e6-4c8d-0f97-08d9ad0fea7b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: //EbJEfGFs4slbXa0YneUt7ngExyjZf4G5h0E1IELLMxxeP+mLuRrmAzh2UVPQmM1IkTLDn+/sSdIoBqLGlXcEJf2FSWQbFCFdeLExjDyP/iTJ99co4Ed1BPzbrMqKwkeHNSVRdFO5mzT4QpL31w/vKJT7Wfjca4gGuBpCvcX46wUaAGvcaTgv9MVrQb65EuRas66bnBBvWDqX4vhezClezsg2pPxx5/hUnTfe9BmwFVL79xgRya5d3EgN/Rc20CJRCfJcoHi/nwqx6qT//AlsB7BowQT7/xNQ2FjvE4LPbqnKTdESmFe1iG8dGRB2EByh/m9tBwPd4Xhuxb+6l0n4aAu/76mo8HS/cnGZ/kiHiZDf6jFpRlrprKSh/VCbZuNpTdoZKJVedp444P7hne5LVDxnm4Co00lmNAQEBIr3GyEusWqWNfXm3xGloeYJW9PQPr+xPVogOW8MtaiqHH7Ty9Do90ZYLQAjEBGDv8FTMJ5ZX9d7ipSmGZQRbGibuyjWCNGXoyzBJGg0/BcR4senlqhWpRfDsZc1GBTmXLxSnk1id4kx4IQIusnx1DqszLUBLHbGa995K2vqXW1GS/R4lLS38MN3vTS3yOrAxHaDOUxnXp206nt2H3yQXqd2HqYFvFH4UbLCWRn0FOfCSzsgjHmGXYhB3SycxIV8xFSP8fDiVw+gjGfGDQvf7JhUeFlBJPSi8mljns3wMX3vkVcW63m/XjAFIOA6YAbmjj+qA=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(508600001)(4744005)(1076003)(4326008)(70586007)(70206006)(86362001)(2906002)(82310400003)(6916009)(2616005)(47076005)(316002)(44832011)(336012)(36756003)(186003)(6666004)(8936002)(8676002)(83380400001)(7696005)(5660300002)(81166007)(36860700001)(426003)(26005)(54906003)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 16:57:02.0803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbf8cbb-45cc-4260-5296-08d9ad0ff083
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6444
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Explicitly return 0 if the regmap_read fails.
Also change a uint32_t to a u32.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index cce95367c156..bd7f28150ac0 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -81,12 +81,16 @@ static void apple_gpio_set_reg(struct apple_gpio_pinctrl *pctl,
 	regmap_update_bits(pctl->map, REG_GPIO(pin), mask, value);
 }
 
-static uint32_t apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
+static u32 apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
                               unsigned int pin)
 {
-	unsigned int val = 0;
+	int ret;
+	u32 val;
+
+	ret = regmap_read(pctl->map, REG_GPIO(pin), &val);
+	if (ret)
+		return 0;
 
-	regmap_read(pctl->map, REG_GPIO(pin), &val);
 	return val;
 }
 
-- 
2.17.1

