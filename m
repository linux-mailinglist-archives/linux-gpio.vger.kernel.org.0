Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD5F45851E
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 17:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238535AbhKURAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 12:00:38 -0500
Received: from mail-eopbgr30065.outbound.protection.outlook.com ([40.107.3.65]:43878
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238526AbhKURAR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eGZuk+Xb+HpemmAuVHjavzTM4anDzutBBoa4FHvQUE=;
 b=0IKFqc+WJdH6DuUVlc56NCCvTqU/1gxKwfa2sVSQOrvmifGvZLdg4u4uO8wq+8XyVXkF0mQnpB+bJgfIp8KAvAkdNiigkCtd7Ep1R+XeatP4LS8eWj/tFqmF2iRYTAmDSjt1bWHP0ncXX/tHRnKBje9Lcb48MAHJQzCbMWz4//k=
Received: from AM8P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::35)
 by DU2PR08MB7374.eurprd08.prod.outlook.com (2603:10a6:10:2f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Sun, 21 Nov
 2021 16:57:10 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21a:cafe::6f) by AM8P191CA0030.outlook.office365.com
 (2603:10a6:20b:21a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:09 +0000
Received: ("Tessian outbound 157533e214a9:v110"); Sun, 21 Nov 2021 16:57:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aeb12fa0fe1f87d4
X-CR-MTA-TID: 64aa7808
Received: from c08544fa194b.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 77B2EB94-E0B1-4F5A-9B01-35F4A17D5A56.1;
        Sun, 21 Nov 2021 16:57:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c08544fa194b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 21 Nov 2021 16:57:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkoLQ74U0A1sixZ7b59+TeKBh+lF0+YrO4n6mWRgxOE53ngBYQefy5qCdGPjK8yC4Dg/XTiQLN0kxK1rahvlUnMpsuI5ovEME/H7SuN9E6WScTg/cjI6bkEJ4k2HhwDj0ZTEOKpwLY1FJ8GY0v3dYeIeEQbin6fFQckSgeer0l9TyQfI4jtuP5d5Je/8f3k/jGumHRgqH5Ii6DZ357OFVuNwnQZqojIhK++/E1QUmTBxC4A2m2I5ID9j11UjMOdC6s0NqVtw0IMcFUW3bTu0tbL5AlOQLvLWmx90GTgiBILXwkw2uUbjthIoYRs8yBOcJUCH8vpHcUvfYgx5aMtMzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eGZuk+Xb+HpemmAuVHjavzTM4anDzutBBoa4FHvQUE=;
 b=RxRfaMUgnmz3GOylxccp2XZJjGH7yYllubzQF0rwMupKmGUwp3OK7Lly0xnCam0wzNlfPjk3dkmeDki1jG6oQxqtQ3C5NF+OaynZ/R2i2pRGmDNQSRyCyJj+IBOFr4+3GowYC6UJRmAR5gZze61RFnhWXfTz5GcuG/cCAK/6gYGMD7B23TO9oDDwEd5k4oLo5vbZh2QKFlnn6jKwr6ANWXW0AOq/PYgnYz5XQ3MyLCDdx/wEqV3h/3FwSCaYgjPVzkXP9mQ5B2m+TV+RPuzJtasSWpgDb8ZoIPscTZjOU98Z872oLpLYDSRD9oBW3SpAmvZusCTRChoU4pfm1ivYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eGZuk+Xb+HpemmAuVHjavzTM4anDzutBBoa4FHvQUE=;
 b=0IKFqc+WJdH6DuUVlc56NCCvTqU/1gxKwfa2sVSQOrvmifGvZLdg4u4uO8wq+8XyVXkF0mQnpB+bJgfIp8KAvAkdNiigkCtd7Ep1R+XeatP4LS8eWj/tFqmF2iRYTAmDSjt1bWHP0ncXX/tHRnKBje9Lcb48MAHJQzCbMWz4//k=
Received: from AS9PR06CA0409.eurprd06.prod.outlook.com (2603:10a6:20b:461::18)
 by AM6PR08MB3637.eurprd08.prod.outlook.com (2603:10a6:20b:46::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sun, 21 Nov
 2021 16:56:53 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::7) by AS9PR06CA0409.outlook.office365.com
 (2603:10a6:20b:461::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:56:53 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH v2 03/11] pinctrl: apple: use C style comment
Date:   Sun, 21 Nov 2021 16:56:34 +0000
Message-ID: <20211121165642.27883-4-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211121165642.27883-1-joey.gouly@arm.com>
References: <20211121165642.27883-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30fe54bd-ac94-471f-4832-08d9ad0ff4ff
X-MS-TrafficTypeDiagnostic: AM6PR08MB3637:|DU2PR08MB7374:
X-Microsoft-Antispam-PRVS: <DU2PR08MB7374BFB2963CAA13C09EAEBB949E9@DU2PR08MB7374.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BE0K8s7zC1ediQ66pAWnoLQw+8ZyKE2wtw39lnVxfeSjSMG/0Ywmlvebr6zOJHSN31bqFbAUvHbdq2B+83jlheSDqBPbug1F1jUNtigk1rzuE2wNZ7lhGW/4wW6oICfEgKiu9k/SrpGY7QzhoLPTxN5hv+vFoDszZ8qk+M8v5pn8owlwXLdylOSNGJRFLaRHWgqUmtbXhQg+9TvdlGD1PlplIgpP3iqKXQoWiajL7sr5yvDPeROAel4XxgutiW7xRHCSwS3iyow6wZy7Z7CV1ZUGT31yKg5t1mGOvNneIum+29LrtaFqYuLJG+peh2YbwxkyyTEb3GHjMbNXVCv3x2L2a3/aO9JngB80hSk/ARRcGKSlX5GAiN6iJgSaoVY+QjNynxndaOkltdwoJjG1Bf4e0RY+d4gYy/+iQeSkmpieS5XmjfQe3mkwxOqMGb6yrbFNAWVvWUN21lKG52mAi01QTcKCP5g3IsZ7WVNDLnGEzVB2JNwJ205C4QoRnw1kzYZsChytI9dQmO6aY7U8CDntTxTblCWl7M+OV+QQRvnPILehzPxUsFiIBXGNHqQXD4THX2BvC/R9iEEuLha34P/KaKbxKIrFnvwx7vV7UsbJyFvpYO68jEwEV4IoMkLSMwmtfZmF37MFTiujIr+x9vLGhyhWkBQ72LXIozPwStpFNelKpPiQNBISXOijCTah1ts5ug2Q9bHebgnEA51O77jya/qRHQgPlMij9NOn21nPzBHH2RFIkzN0MKOESahketjVOh8r6sX7ag7iGkFp2A==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(1076003)(81166007)(508600001)(7696005)(83380400001)(82310400003)(336012)(5660300002)(186003)(54906003)(70586007)(4326008)(70206006)(4744005)(8676002)(2616005)(6666004)(356005)(86362001)(44832011)(426003)(36860700001)(316002)(8936002)(47076005)(2906002)(36756003)(26005)(6916009)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3637
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4c3eafcd-f1ba-47f6-52c0-08d9ad0feb48
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l0nKfpX/09ec6x8RqNF4dAG5ZmgQEDp09qRMzEsWO8rbDb6hPvOpaw9npUka3jxlsBHDF1heMJgSO9Vop0ZQpMx4XDbGE1sqV4S2IZfNQY4pswbS5kDLqwNEzfqoRazd8dTJAqmzUMF4B1staeIO5KsUrUxuCIhhh2ol7tIqQNrrLZsYeXcAfxJ0yvRWPUjgeBp4BHjX+6598soy9+Z/4YDMKKQj2LoLYmhgooKFyhN4dcM9kg6NCZxgD27CmzMsXa1VsrTsX8yoYxlrLhAwiMcQquTcLimHVbUm2Rfj6WwUp2A1x6R6n+tc1CcpVU41iHrkYx3kGvkMLrpIGU8wIS8LZMtSbd+eC4UE4wXf/I6pKHDuGLb4gB1zq4dDZhKo0GhBU6KSW0Y2hHMwhyYJ1BwHEmS2vXTtPrPdleLpio9djNZ+x61esZAnx72iAMnx/3HH2OuoOB3nyYasOo7eg5Zo3/I7D2x57fK+jZlL/ovbB6mmEb3yMO2j4JHfYc05xha8WN6qnfESQ18hfxHjHpDIqK4u9W4U4b4HxjXBZ0Y6oWvzq8rXkgNL0lmCS8VEVbhuAvpgdWU6G++o7ezSKumq0SSQx7p5/LYO2zQNZGZQp03F8eOjyMi2qE7ZLe/nzXbXWw0Ok4f+odkXQnElUHKXqaMH0E1fGdTJrL3MPxa/lPwR3X8fwpgSw7dhbEPc48ygve7N3bzcGKXn7qdggEH3NOfmy9Ah7wXEnvL4uv8=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(70206006)(70586007)(1076003)(6666004)(36860700001)(508600001)(54906003)(4326008)(2906002)(316002)(7696005)(8676002)(82310400003)(426003)(26005)(6916009)(81166007)(336012)(186003)(47076005)(86362001)(36756003)(44832011)(8936002)(5660300002)(83380400001)(2616005)(4744005)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 16:57:09.5551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fe54bd-ac94-471f-4832-08d9ad0ff4ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7374
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is the preferred comment style.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 60d46ce26115..102940058a11 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -73,7 +73,7 @@ struct regmap_config regmap_config = {
 	.use_relaxed_mmio = true,
 };
 
-// No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register.
+/* No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register. */
 static void apple_gpio_set_reg(struct apple_gpio_pinctrl *pctl,
                                unsigned int pin, u32 mask, u32 value)
 {
-- 
2.17.1

