Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BB2458513
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 17:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238695AbhKURAZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 12:00:25 -0500
Received: from mail-eopbgr00054.outbound.protection.outlook.com ([40.107.0.54]:8246
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238553AbhKURAM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjZtheuLYMTaSwGih43Le1PaDk77ICFwLJF2RUSdxcg=;
 b=HtVKNIFpyBtyE0aZMM3h31TW0eWcb75XmCIM+456rqDeqcjMTizXD3KmMrRHsfeGb8vcPwldi5Vz9zc8I0O95TgeV1DvzmXXr0oa7pzY1xNoxhG6ZMlQSJs8WK8Z0/NeiHhFFdc3YqBA42lqezrqklJ+ghGXBHK95/bC95c4bvE=
Received: from DB6PR0501CA0006.eurprd05.prod.outlook.com (2603:10a6:4:8f::16)
 by PAXPR08MB7020.eurprd08.prod.outlook.com (2603:10a6:102:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sun, 21 Nov
 2021 16:57:04 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::41) by DB6PR0501CA0006.outlook.office365.com
 (2603:10a6:4:8f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:04 +0000
Received: ("Tessian outbound a33f292be81b:v110"); Sun, 21 Nov 2021 16:57:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 633211f390c2ce3e
X-CR-MTA-TID: 64aa7808
Received: from fad94e497979.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6D059573-9CD2-44BF-8577-CE8F9B2E9B52.1;
        Sun, 21 Nov 2021 16:56:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fad94e497979.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 21 Nov 2021 16:56:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8/bqVb/B9+L4VuubD6yBueyhgEBjxlYHUW0W9ML3OE5xEOEVDJLgsVx+qlTop1gQyl26ur9lR0I25q4l+iG3iYTzY88aHitSXLXQAmcF1R/r9E/qz2iLuhb8OwzMhMwjlVswucL1DH9f0Q8F+zHn7COV8tQ3jdvYrANrJaVqGjwRUfY7NSG9I7HWdNqGA3v+OttRonG5VveQV0NPGUa/U8VjZgzR/T7bg4+8CouHxq/dfy5Rwq/2hGC2gJlon9yQGPYNiNiH4RHzzhQqMsKO8yMSWmFfzmcBCVWx2btObiTXKU9ptFYueNZw3KQiB4+0ZjuSO73stsnNdZ2dcCaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjZtheuLYMTaSwGih43Le1PaDk77ICFwLJF2RUSdxcg=;
 b=WSyCycO4mMEucsgNAAy8rY1md9lDrr5w8RwEGxbm1cwIiavkJYvEoXAMfD4xUFocgFYxqEEPHOvxDMIYBZRVlwMdIjhsIRFAGsz8zUYGir5xzrCeqH3/iiiHsAIfdtnPX9mpKzUJgqyuszABQqZdVQVFGj3rFGw3qJb4B5P61VyJptokGuNsxMRGv3D3Mp6/9whooxUGGZpguq/dsY2RWlhpw1DvE4+DUXkDKClfbr0aVTodqlBm50oqdbIhN4LdFBo6wxuhDY3G2GiGV2oSj4RXj+vL/AbN4oSZQTC6hvLE38eOYMOM1qHTjIgB9Q9o+5QSRLZkN1ppA+dJNHrmpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjZtheuLYMTaSwGih43Le1PaDk77ICFwLJF2RUSdxcg=;
 b=HtVKNIFpyBtyE0aZMM3h31TW0eWcb75XmCIM+456rqDeqcjMTizXD3KmMrRHsfeGb8vcPwldi5Vz9zc8I0O95TgeV1DvzmXXr0oa7pzY1xNoxhG6ZMlQSJs8WK8Z0/NeiHhFFdc3YqBA42lqezrqklJ+ghGXBHK95/bC95c4bvE=
Received: from AS9P194CA0017.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::33)
 by VI1PR08MB3165.eurprd08.prod.outlook.com (2603:10a6:803:45::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sun, 21 Nov
 2021 16:56:56 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::88) by AS9P194CA0017.outlook.office365.com
 (2603:10a6:20b:46d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:56:55 +0000
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
Subject: [PATCH v2 07/11] pinctrl: apple: give error label a specific name
Date:   Sun, 21 Nov 2021 16:56:38 +0000
Message-ID: <20211121165642.27883-8-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211121165642.27883-1-joey.gouly@arm.com>
References: <20211121165642.27883-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b59951f-bc11-4123-9ec6-08d9ad0ff217
X-MS-TrafficTypeDiagnostic: VI1PR08MB3165:|PAXPR08MB7020:
X-Microsoft-Antispam-PRVS: <PAXPR08MB7020ED133D143D478B5415DE949E9@PAXPR08MB7020.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: QiM9ijjtJlf0sONYK35Va7sQnYfcMgk54BqZdoZs5lZLqmpf9z43f+upJ8UIVqfp3rv6H+uwKpleL2wFiHqUn+6BtMzxRIEA2eNsg3GCqPsBXCGbuJvUgN+Q+yDZgPAebOcQNZ/fxG+bWYT2cKDI08H+0olCDifirOOJpZNDJ7ueJXSy1Cdx+oKKqdu/TZZVsvsqMPmnrBWRnoHDs2yQyoodM7mO6nGlmSx8uU5qv5SzwVv6fr3duvduCMqwFjYK3ZxgWvheRKxU1G1eQ/ws1kws78muKEWcu51TK8QgI916nQ4+yMuzL3SiNvZNcVYepsrt7Zzb+bbkjiZQt/OzD+VxLDC+4zOJ1UKwKTZMejdeVmmodChwalWeY8cHxO8OLXLQXTRSjsfoHXyWIlUcIhL18OCKS5GqnmAqz1ncSwQpUq2jbJydjeowdXKphKPlKedmOAWo0Shvuhe82pnG9K3/aH6KKD5kmYSOFpKi2FStKhOxm8zVrgzGcmapjEQI+uoAIAOEdpnQmv0bIxXJXfq449peuQjuFhIaCkdKxcqVlAhLx39UzX4ywNB/78lwplA8L+6DM1BvuQ+R4Ul69lz0e3m3/TM9aZpwPpv0ldwdXsxuEMDuJpnYqjXkxZU97DWJIQCgo1XC4Hn4Sbzwi/4JZYUNJO5GJ1TfhdEggexsEvtfaxK2uAKT6xxbdM8Ka5sMAAWborLIZcxT6mYJUPf5jg6S/1wqa+1cuDkvEaIGiVxDEhV+SPblRVvsFWRUzHoKLCZctMvuUYEoinUFwA==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(7696005)(86362001)(36756003)(2906002)(70206006)(70586007)(316002)(1076003)(83380400001)(47076005)(5660300002)(44832011)(81166007)(26005)(4326008)(6916009)(54906003)(36860700001)(2616005)(8936002)(336012)(6666004)(186003)(426003)(508600001)(82310400003)(356005)(8676002)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3165
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ab4811d1-9bb2-4d42-c2b7-08d9ad0fecc7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pxHYig7MUnGCgxhFR2q/ZxkC7V+hgF1Lcp4dRpcBIMEu19YtE6t9p8bBSldPpsf8dpuh36Qv/D4PV0YMJGLMEAKW2jC7v4lIW6ytg5dM1ujvH9HgfT9G9tbdpCHhdiCC7dKYfu1DvxXMaCXD/U2YWuv4R5viZKl8JLR+i2TepqkOl+2oNRgrLksf/p4IDqTEgdvDtRjzqrJVW9FCo12tiOXnRWUvJCNh/2kQHbIMz1o73Os2YJLYktthwRF9SBOY8tNyRTUHZvEmMchokP4NT4C9lzLQh9iW329uhJA4Ify8R6RHms2zwVLHE+fU+ylQeu93+QJ5OCCUPgNlsC1Evoh15/0vkyE10Lfubnf38wxHxA+jLITWj1l6jvsOa7J87TWnXEmJ98i1HqGk8E7N870Dj0Gu9DwveL3d51GYTB7Ne26I8VaCn4LIqdUGqPmxKmO2FckJuNnBhBwrHzRl30N65OegcC+xKZuXCoTssaanjvJLna5Z3HCaIOvG6Ei5ZNbJOqBeKVfJNYJtF3sdsUJKE3peVboF88xBkOoYlwz7VugGFn/wEm7uTZdm9GrF0W3gWJPsNWQybf7CCCSjQoZfjEzGKkYSHpvCSxct4ET3DnEZ1ztIouxrcrQrzt8GMxNdsccwqQCpfst8HW9Qawlmp0ZXZttYtPSCM5wcX+CgX6zjahj6GCfNHeWjDK0nGzhTfNEm1ToUGYdl3x51ca/ZfdyxeiRAnm3SDzCOFUU=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(70206006)(426003)(81166007)(70586007)(2906002)(8936002)(316002)(44832011)(54906003)(4326008)(2616005)(1076003)(36860700001)(82310400003)(8676002)(6666004)(336012)(508600001)(7696005)(6916009)(47076005)(26005)(83380400001)(186003)(86362001)(5660300002)(36756003)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 16:57:04.7304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b59951f-bc11-4123-9ec6-08d9ad0ff217
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7020
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index fba2d4ec383c..fb34cbe189ce 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -392,13 +392,13 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
 					 GFP_KERNEL);
 		if (!girq->parents || !irq_data) {
 			ret = -ENOMEM;
-			goto out;
+			goto out_free_irq_data;
 		}
 
 		for (i = 0; i < girq->num_parents; i++) {
 			ret = platform_get_irq(to_platform_device(pctl->dev), i);
 			if (ret < 0)
-				goto out;
+				goto out_free_irq_data;
 
 			girq->parents[i] = ret;
 			pctl->irqgrps[i] = i;
@@ -412,7 +412,8 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
 	}
 
 	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
-out:
+
+out_free_irq_data:
 	kfree(girq->parents);
 	kfree(irq_data);
 
-- 
2.17.1

