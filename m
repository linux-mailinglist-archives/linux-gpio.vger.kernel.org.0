Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9342D44F424
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 17:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235923AbhKMQdB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 11:33:01 -0500
Received: from mail-eopbgr60058.outbound.protection.outlook.com ([40.107.6.58]:1766
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236029AbhKMQdA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Nov 2021 11:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENxxYiKACKwEXTrBb0xDqj9yXeSc4qNK1JDlXvFaNtY=;
 b=e321ywrUYhQUHUmtQIJMAYEE8vL/w9KK/F/oVB1gfkszjBul6y6OEC8hSBNx6zzqu1jMNAO0bGg8I+joQqYBVgplEUcwtIwFId/qZnewkcnxVR/zHceWTTc+q5JO3c4RwEPfapjZKaDsLXqnvJ0EgreQ+PnyPm10EtGhgEyz6Rk=
Received: from DB6P191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::30) by
 VE1PR08MB5775.eurprd08.prod.outlook.com (2603:10a6:800:1a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18; Sat, 13 Nov
 2021 16:30:04 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::6a) by DB6P191CA0020.outlook.office365.com
 (2603:10a6:6:28::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend
 Transport; Sat, 13 Nov 2021 16:30:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Sat, 13 Nov 2021 16:30:04 +0000
Received: ("Tessian outbound 892d2780d3aa:v109"); Sat, 13 Nov 2021 16:30:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d659337763de8086
X-CR-MTA-TID: 64aa7808
Received: from 85c597a3c4bd.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 92A4BE84-B651-4047-BBDD-F3120ABB55D6.1;
        Sat, 13 Nov 2021 16:29:57 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 85c597a3c4bd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 13 Nov 2021 16:29:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H98sW2qWElf7V5XIc9lmd8vBbFuOMmud4AD9rwy3UjFlgwq8Nqm1qQHoHn/GCwPtbZBfdPTR2/rogT3WZtTLgXTFBU5X7VG3peMaBU+48vHbj4BG4KF/ZJNQQu6r9P1UMZ7K2EZBwEk6T5DJpFtZpm9QYQJ0hYUeYgMf3LJXBhfmSZ3NrZr6zmMux9nhjsiXHRNQHFeakQ80dPmGuB4mSC1ABr9ud7k3VItXL6tHPqk4pRJlhFxlmerhZM7Nv3XG12Eh+uK28oza/p4Vu/gIoSKylg2DvJ9+uh9Vowmx0FN+Y3k7suh2hJsOGXN8ajB1rAH3x0Fxqmm+bK0eslhiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENxxYiKACKwEXTrBb0xDqj9yXeSc4qNK1JDlXvFaNtY=;
 b=B4MS0XKOHjq/13cAASfOFhXR8aJTYotAv98d68GPcRUoTFa2XZWvxGy976/fr5d/S9YHhWLt4ovq+o/2U2uQ+1V/8coz161q3YgouHsHQbXE2MTNJpdzCA5kMK8r7uJ4nNRD5KjPQnJhW697JSQWSBD1HF/Ua/E5DG/XVrt3cGXnKQPnGkUZPJYdf6yCBLnWLVLraotk6CRDbSr0o38PW/CKqeqlyme6WczYLtKyKkeMwQM3AJFNZxwlTYirhzx0JD5504SzATOZEsQHn+W5Mfoj0Vq4UFobkWxyIYDzz0WaDt4UPXyehg2ewJjqkkLLZm0B719RSkjVJVvn5Rl+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENxxYiKACKwEXTrBb0xDqj9yXeSc4qNK1JDlXvFaNtY=;
 b=e321ywrUYhQUHUmtQIJMAYEE8vL/w9KK/F/oVB1gfkszjBul6y6OEC8hSBNx6zzqu1jMNAO0bGg8I+joQqYBVgplEUcwtIwFId/qZnewkcnxVR/zHceWTTc+q5JO3c4RwEPfapjZKaDsLXqnvJ0EgreQ+PnyPm10EtGhgEyz6Rk=
Received: from AS9PR06CA0399.eurprd06.prod.outlook.com (2603:10a6:20b:461::12)
 by AM9PR08MB6804.eurprd08.prod.outlook.com (2603:10a6:20b:30f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Sat, 13 Nov
 2021 16:29:56 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::31) by AS9PR06CA0399.outlook.office365.com
 (2603:10a6:20b:461::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:29:56 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sat, 13 Nov
 2021 16:29:52 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:52 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v1 4/9] pinctrl: apple: make apple_gpio_get_direction more readable
Date:   Sat, 13 Nov 2021 16:29:39 +0000
Message-ID: <20211113162944.22412-5-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211113162944.22412-1-joey.gouly@arm.com>
References: <20211113162944.22412-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3eb95e6-4a5c-4044-780d-08d9a6c2d922
X-MS-TrafficTypeDiagnostic: AM9PR08MB6804:|VE1PR08MB5775:
X-Microsoft-Antispam-PRVS: <VE1PR08MB577576D15BF82067C63A5F5894969@VE1PR08MB5775.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:494;OLM:494;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WDsEflV68dS00VvFcW4pqK/20V4da1Y8/nuBr24LSbsJZ/qVcGChMYoGQRx7dhxeyAwuK7Iq9dTHver9NHt6f1yB/wbzF6KBBPEl7b5dJDGx2PAJdvAROOhp2emTw0gFH/Cg+kGc3w5efIonJvDZPPcfqkEVujHXK4AOdCSTQqJC0HxU8SavwwR8d+4X4YNxVLrgm9RpLmgJvSwiwbgrq3bKYiaWGwdCOuYZdLXT2YJtDp+T4kUo/U5sySNhXItWwJgUbHUtNkZNXIAV2yx8ralAcEBtaYvxftaWdosE1D8yvWCiZWzWyqUqVSMfqybDFemukVV62iym3V4RBGXFdxqPP4qPyAUNsf/uVHEwQZKqkuvIbbzT4HueO6Eog+v8cTpVCEcim1eaxjJaY6WTXacEaVk7+JAmTx4XUlo8uvOqSq1Z29/6lTfhgDq5+4D4gIStCf0Y22WBh00ZxQd/UB/or3JMxPz6KAvW8aiZNt2hNPzchKbidZr8hvGHAbRCZCgXmtJ3FePlyBB3l8bJzMmlWOVnY9w1soCnCLgo6FJ/Les7pSNmcKPaLoKc3z5wk9EoAeF6A6dSerVcGlWbEyFXOgcinP5n1WENjA5Z7xmm0yAkAMH/O18oxHPukgJwQe6w73DEc5aFY0LP7X3IKJeJSY7l0hwUt8HwyEFuBs2L2CkGSjwKwa2b5bhGDCvqRFYD+WaS35P/laFngR1JZLqlE2T0skwMsnMrzKL4zs9s3tDC8k+SGkvJM/CGIkDnodtgvLqpXRvByA1RQtvuew==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(4744005)(81166007)(356005)(36860700001)(186003)(316002)(86362001)(83380400001)(82310400003)(36756003)(5660300002)(54906003)(47076005)(70586007)(4326008)(7696005)(6666004)(2906002)(44832011)(26005)(2616005)(426003)(508600001)(8676002)(1076003)(6916009)(336012)(8936002)(70206006)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6804
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2115c8e4-8473-4f11-670e-08d9a6c2d40d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NsPhYOfkgWB2s29yxQn/r1iATOVUz68vQjfHvMlk33EHBzMYlI6vXb1dzku33RVkP4HW/23IifsqT5hFI9vnNa00/Q8YZdtjJPv5EuBaK8+Fd3LfhV87E7NqEKpwkBy7ffqUnXA1pyHlRC4PWA6bNvNe+dDfSpMVtEDb3hVRc9JM5hCRq/Umcmcp6cA/535rHViQBAVNru/kcR3221despCNFdMsGe8QL5fXEgnRsUy/I8hNaabPq3/MKTJQefuzvUnc7WIQhVECyhAxwJnSVcOJJ4EIYXTliiYRkX8gef1VoaTOSGXc8H6h2OvOvi0ODdRZppoSnYu2DPlOKtdO1Yh3DO0y8AnZhgxAbqCU2ieo+MGYWqk9w9yBp3LOSU4e0VH6tRR08LWu8UebCT/B1r5BL1r13VdpUPnPIyYWmAGHzsZC07fSo+E3Vc7d62srToZzBiPxjZqEbtwrJb1bdPkB/HM4UFxMp1mFem7YLaJbPUouOjvsU36HJ4FYjBQrh5LFas9AjhDu6FGBNKdwMQJgP+OL7at8Wx0QG/BatScERhMmQNxYbOTcC2cYgc8EgAr0qHzXWJA3JHlFgkfLtPAwzxFqt4INUWG6/dS/Ay+uqh49H3FUAqufYt0BhtRr4D5SAn4/5bCXiAtrTRC0hV3cPoO36JIdTbO6NIIONx0dSq0oCGrUhvYanub0MpqBRmoNwIGn7Gx1tCTi814tXIrHlHqAEYQZx+gKUf4guL4=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(2616005)(1076003)(508600001)(426003)(5660300002)(316002)(70206006)(44832011)(26005)(6666004)(4744005)(186003)(86362001)(54906003)(70586007)(336012)(4326008)(7696005)(36756003)(47076005)(6916009)(83380400001)(8676002)(36860700001)(8936002)(2906002)(81166007)(82310400003)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 16:30:04.6336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3eb95e6-4a5c-4044-780d-08d9a6c2d922
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5775
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Try to make this more readable by not using a long line with
a ternary operator.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
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

