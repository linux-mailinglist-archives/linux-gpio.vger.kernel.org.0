Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02640458502
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 17:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238568AbhKURAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 12:00:13 -0500
Received: from mail-db8eur05on2063.outbound.protection.outlook.com ([40.107.20.63]:54432
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238518AbhKURAJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQD4j2KnCJYZjzbJvcpobqwhP4W10Rfn95HcUHz4WtY=;
 b=NgZerzgfINzk/BWxGW5ujAY9SQJYWQQ7ZSnOnIAtjK4TLLncg68R6G+1xxGZoqVyYRJ8vhV98IvBOv3DqEAdm5dTwBJMq3aDOtdn+m23Yu4FRl9Gi4Ul/K4ZeWL2GMPgzp9M63yYQiqlMekFoJeDqruCH3+0Tcd6rB6tb71IJL0=
Received: from DU2PR04CA0211.eurprd04.prod.outlook.com (2603:10a6:10:2b1::6)
 by AS8PR08MB6662.eurprd08.prod.outlook.com (2603:10a6:20b:397::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Sun, 21 Nov
 2021 16:57:02 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::bd) by DU2PR04CA0211.outlook.office365.com
 (2603:10a6:10:2b1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:02 +0000
Received: ("Tessian outbound a33f292be81b:v110"); Sun, 21 Nov 2021 16:57:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 410c70dce73f1282
X-CR-MTA-TID: 64aa7808
Received: from 4cd0dd711efb.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 45D927EA-7757-470D-9FB4-370DC2E21504.1;
        Sun, 21 Nov 2021 16:56:56 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4cd0dd711efb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 21 Nov 2021 16:56:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjWVC4BOVIP2MSMfB8th0NXF+j32kICdMlJ8Ol5E5pkXotbOXjg5QPZoe/kqyBedFpxwnVIoqqcoans+QxtLUxjJ02zJN2HU811M4pRWpx4W/S1F76vt5NeE/R0qQPuu/xZ1fInEhnWqcaTDsbLby9p8tVPPERRU2LWb1lxac7ZRHIXc1ZmO511wFYYrAEJDwE2jAnL8cAQVJANj+nIo5tIKwR7IDS0PrgO/p+UfI2boiWLcccoN9q4DgIAq/AgZ5aQRNDiYrW16WNOoPO5IjJiBFMJXVSni3i99piNHOKxZm+xgRG3PUtA4IoNSeYeqbEayWq1qR3B8t6gDtXBMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQD4j2KnCJYZjzbJvcpobqwhP4W10Rfn95HcUHz4WtY=;
 b=Bb5YPIaeRVoaZVdwhBB8kVXbOBrTQUWdJ8QyuswIw0pL0tiwF/1jQeBelSFrWfkisgAR1ORf252JBHKCAYd8+Lc6nJR1A587YjRM4xbc0ASyadpbxbNZORG5zSSCW7o+ndK7w81G+WNKaVMnqrW/5ApSsWK2saD+YQHh0gw34NS8e3x3FJ/CF3Tr+XVaUrD2gyXhCZEfqDCrocTxGGf4SE6UFiMfKS3BBXUn/ZVsDq0Cg9DvNl28A4s1XOORZqnrr4vlXDWNCP/CJxIBlG0ju7eP0r3TbUTanSHSDWR4vnacPPZozDbttxi8JIYvshD833eX+mFlbwNy1mgwmNv2XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQD4j2KnCJYZjzbJvcpobqwhP4W10Rfn95HcUHz4WtY=;
 b=NgZerzgfINzk/BWxGW5ujAY9SQJYWQQ7ZSnOnIAtjK4TLLncg68R6G+1xxGZoqVyYRJ8vhV98IvBOv3DqEAdm5dTwBJMq3aDOtdn+m23Yu4FRl9Gi4Ul/K4ZeWL2GMPgzp9M63yYQiqlMekFoJeDqruCH3+0Tcd6rB6tb71IJL0=
Received: from AS9P194CA0004.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::32)
 by VI1PR08MB4304.eurprd08.prod.outlook.com (2603:10a6:803:f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Sun, 21 Nov
 2021 16:56:54 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::2e) by AS9P194CA0004.outlook.office365.com
 (2603:10a6:20b:46d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:56:53 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sun, 21 Nov
 2021 16:56:50 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:50 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v2 06/11] pinctrl: apple: make apple_gpio_get_direction more readable
Date:   Sun, 21 Nov 2021 16:56:37 +0000
Message-ID: <20211121165642.27883-7-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211121165642.27883-1-joey.gouly@arm.com>
References: <20211121165642.27883-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4edbc0a-c916-4c4d-6eca-08d9ad0ff0dc
X-MS-TrafficTypeDiagnostic: VI1PR08MB4304:|AS8PR08MB6662:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6662E66D6B0FEE61F48B49BC949E9@AS8PR08MB6662.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:494;OLM:494;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: sfH65GGgDCzTpKJ3dbfHypz3YOzfz8xdXwQPQqd5Xr2r5bPevaY1eIWaIAn7deNSbzHoxb0U3n8+pyHW/Q3sHQ35clWhPkUitUgAaW9qbm945g/CJHD7gvcp5GDrtyWiCyjoj6eb5ip7jDutlUA55bNDPEk/q/X5QV+F3jHDSYSZV8Koj75iOPgcvqDmvdV6U8rJP8ONTf52X1Qew+JhnR/ujCCouMwaKD84kGJsWKggo3wecVeByLtk+Sd4XPHFHd6BblYTGhdQGMzfnyN5pJsGDLWHRi9jdKuYSUZXggxSZMLKTJbJDD+Q3jy8144ahqiJLSBzy5y6JJsmB84qctGF5W0Y5+B39RB+9SU2u4UzPJp9hlIjw5VggPOcdJT2xid2pOOnyMmMC1ooNryuMY22Gmnz34XF9C0DnDdkmp5cWcGatbsfqpst3VvzNtGxelQtXlt6bSlO/AIDNtph/Z1OkL+oaeGAlRaFPzm4o/GNOxO6bHmL9wI62yc2fRZ/5Fw9/jDGe3X/htMWBcaxfDbfVqogFDOHwtS/GdhQvtYZ+up4anYInAcIS9iN0PnAvpSNngUpzP0ndSe3345PYAhATk8x4w4AXW523OSTr6A8MfHFHCzOSybMyC2OJOuGxLPWCkVYxCdnA+ecff9CmcGuRhOSqvqqcIalzeThBgJS84UhMvWFMSWdvzDBnjcffP9HvqL0r5kVF758xV45iTqzL5YyAdIe41UGi0VEkEMsUobTnpKtWc2clXQgz06OUHWDU6mJYpJ47nXtGahdjA==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(70206006)(6916009)(44832011)(4326008)(7696005)(356005)(70586007)(1076003)(82310400003)(6666004)(336012)(36756003)(83380400001)(47076005)(81166007)(8936002)(54906003)(36860700001)(2906002)(316002)(508600001)(5660300002)(2616005)(86362001)(8676002)(26005)(426003)(186003)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4304
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9b72d05a-ecf5-4de2-cbae-08d9ad0feb63
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gck5j+KHo6QO6uj4Bcx1ZL9J5Gt5WYK8O+pl6/93Be2EGdn1bgnbMdL02MsDGcYHzVR8bjO4Q0BQmjh6+pp4s/g8cGrPC+fiYCAfCg5ocTjXsj5mvXEQDcVOQyfubfSh8cgKv0aDxPfjuDdEAxSSxJtUc5QA1nnCZp3jjr/wlsKRPlPyHwnzlviQL8TPWOp66GfbuD2OOm27Xv7LmqXPf0iPdXk62clUsgpK549N8/o7j9Ew2YAro4j+IGEiA59HW6u47x34zJIhiwXwnGIBgkXv85ll1mrBycaluG4M0iWS5GQkBghLZqA3v0zaPJFK9Qr6eCitQ+mVC0hKsqD9sqUODRFzowHOjyJowD2AvtZrlQeJG7RPmQTB+Z/znKkTuITsPTKO1WkGRPvFCww31H4oceUIQ/kR61iphv5uodEUMa2X+8767b5S+rn2O7E6XshH26GqTZr9tQRq2poBpOa3EYmL6y+8Yg4ZAyKEPKBEn/4q0qsEW+xuC8JQkocHkQgvYCfkpAGi1WDAkpTUXXi0chn42FhhgXuvm3ifwTmnUXQcyLJz9v+GZAxICOXpJXMktyq3kg09DYzkUjYYtDHeXg8ne6CNAuVIYWtUSrlvgduhE3zNtzmt04/bGQtAcOg3+ywQ0Fbu+KQPKl/DO0XcxGaVHPmrZIwzY8WWXVu59UH6fzpg/04+h1+LvyJ3cRbff1i51smIfI9zwKEEKdbiNOkuEBmvZM7BdH4nV94=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(316002)(86362001)(44832011)(82310400003)(426003)(6666004)(336012)(5660300002)(186003)(83380400001)(2616005)(26005)(36756003)(8676002)(2906002)(70586007)(54906003)(6916009)(1076003)(36860700001)(70206006)(4326008)(81166007)(7696005)(47076005)(8936002)(508600001)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 16:57:02.6648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4edbc0a-c916-4c4d-6eca-08d9ad0ff0dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6662
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Try to make this more readable by not using a long line with
a ternary operator.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index bd7f28150ac0..fba2d4ec383c 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -194,8 +194,9 @@ static int apple_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 	unsigned int reg = apple_gpio_get_reg(pctl, offset);
 
-	return (FIELD_GET(REG_GPIOx_MODE, reg) == REG_GPIOx_OUT) ?
-		       GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+	if (FIELD_GET(REG_GPIOx_MODE, reg) == REG_GPIOx_OUT)
+		return GPIO_LINE_DIRECTION_OUT;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int apple_gpio_get(struct gpio_chip *chip, unsigned offset)
-- 
2.17.1

