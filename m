Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E33544F427
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 17:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236029AbhKMQdK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 11:33:10 -0500
Received: from mail-am6eur05on2063.outbound.protection.outlook.com ([40.107.22.63]:38048
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236044AbhKMQdI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Nov 2021 11:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwWZFCGV3qgxuhKZn31y05raTLY6OkUPL7SqVjCkC8Q=;
 b=SBAhyB610+Sa/z4oHD/my5JGnrnutD7q8j9Q5ezlYCIZCdHn7cYAX0Z8EOzLz48wP+7nUo6JUuiTfN0M0yidiUW0HT5NguaNJwVuyuAjzCA8ii/kv3th4eyvHIdl0bvyNcdrDPmwMEPSBTVL4HXLsc8swa1v1W3Iaje0irENARw=
Received: from DU2PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:10:3b::31)
 by DB8PR08MB3930.eurprd08.prod.outlook.com (2603:10a6:10:a7::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Sat, 13 Nov
 2021 16:30:04 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::aa) by DU2PR04CA0026.outlook.office365.com
 (2603:10a6:10:3b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Sat, 13 Nov 2021 16:30:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Sat, 13 Nov 2021 16:30:04 +0000
Received: ("Tessian outbound f65bc39c8ea9:v109"); Sat, 13 Nov 2021 16:30:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17c6aaa1b3f662fb
X-CR-MTA-TID: 64aa7808
Received: from f6eff03308e4.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3ED30179-F95C-46F7-AEA4-464F45ECCA5B.1;
        Sat, 13 Nov 2021 16:29:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6eff03308e4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 13 Nov 2021 16:29:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOHYgPVmIQsvSw4j5pBYImZ5h+ED7wakML5mII6IxW803fmBADhEaDo9oyIiw+fq6jddgYcSCnF7wUDNNGvJSYdXmkE0Jc9DqI8yepfxVN2opg9m2PzRtKhEGSXi/11viK7SpAi8r/4Xko56qOGUsQzPBcWTFvYjK+5lrADjNqqJxKKWQGXvyP0dbJg9BZw6t/1Ggiso3TBFyCHpxEcogtjrO0h0jylKINGZaKGX72iQj0oO31gwjU4r1snAlkk/x8QvfQqwv4iyj9wiBtRW5MrAPhjsXFBeuBoz9IrLTNzeaMRC5SgoegHCipILPDn0aK5CMsFR+R6wWF08fl/cmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwWZFCGV3qgxuhKZn31y05raTLY6OkUPL7SqVjCkC8Q=;
 b=H6BKRZEsgJwsKFJfZZmcDX1KFHFftIcl/1HvTus+VnL8/jiIHHMYagTYTONIuu1xcyssTEvHF3opSyErzLtQW5jYOZMtLnnb4KswcYy4I9b4Xhhv5SKIKC2yeDuGXaYdl/2YZjWjmxpjY7cAa0QntTgN+pZTWn4w/oIFXFktB+4Izx65v5lgjGupRXgMdF8iB7h+4cEk3SqFC38BygjmpRHKhf8VqPq6GaF7Z6ZOHS65jLrx92+92AH1YRDFMJyMiNYD1uVQlnfRuU1/JsUnH8ueTlT7wIKom4nPk+qVJcQDX0qytcbVk+LRDKOXpc7miltz8Jw+dO/BiyoEkn9O7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwWZFCGV3qgxuhKZn31y05raTLY6OkUPL7SqVjCkC8Q=;
 b=SBAhyB610+Sa/z4oHD/my5JGnrnutD7q8j9Q5ezlYCIZCdHn7cYAX0Z8EOzLz48wP+7nUo6JUuiTfN0M0yidiUW0HT5NguaNJwVuyuAjzCA8ii/kv3th4eyvHIdl0bvyNcdrDPmwMEPSBTVL4HXLsc8swa1v1W3Iaje0irENARw=
Received: from AS8PR07CA0052.eurprd07.prod.outlook.com (2603:10a6:20b:459::13)
 by VI1PR08MB3648.eurprd08.prod.outlook.com (2603:10a6:803:7f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Sat, 13 Nov
 2021 16:29:55 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::f2) by AS8PR07CA0052.outlook.office365.com
 (2603:10a6:20b:459::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.14 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:29:55 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sat, 13 Nov
 2021 16:29:53 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:53 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v1 9/9] pinctrl: apple: return an error if pinmux is missing in the DT
Date:   Sat, 13 Nov 2021 16:29:44 +0000
Message-ID: <20211113162944.22412-10-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211113162944.22412-1-joey.gouly@arm.com>
References: <20211113162944.22412-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18cfa9ff-2d3c-406c-be9e-08d9a6c2d8c7
X-MS-TrafficTypeDiagnostic: VI1PR08MB3648:|DB8PR08MB3930:
X-Microsoft-Antispam-PRVS: <DB8PR08MB3930E81D840866DF9858E26694969@DB8PR08MB3930.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: t0OR1rZJQp1kTyTIfBWlt1G5Vgc+l9KNac5lM7mUMyvCu1Lb2HwM/64DvbZLYbWmxbf1yq7DGQJVk9wlBGuAm64StfRh4BNCghODzE3NUZcivan8qrThxetZ68RAfbda8Y15oEWgiQkQSAgEbifFrE6VJ4XyrO6VTIOz6RLMKEJdw8D38hOQuA7js++iOZnw6z3DuevSfojswh0DTSRyC203sfXYqvS2X6lSF7qUJ0m2z4JfwEgxZXI5vCLEJnZnWzff9eNYXvQCWud5LoMYTAg3BUWGXNFt9F3Z1LaAqBZ8SUHNNrExP9X4BWY0aXyZaGxfsfxUEc+71+qSwbJ8RENG1aIfcyxb+VdY0qilSpYttX7ms048fZjVlKWkvLZgy2jH3Zv4TmEwpFlKdYlfJ5ZBLt7TRoygMyiATiZ5vFGIUvgbV8GRP7godJId2teJ9cwjSnmQeo8tuqpht26suoOd3Gdjs+Yb5g3+cr3JdXsolmffKBtjq1HktVvXRzkqdzEX1V6OMiZNd70PSiXCR0W+YdGToyWreV1VYECJ/zfQi0kd3FRR0Ng8FCM8HGWt+ZT4BIKGZ8vkKZqJBZy6KSdgaVyVdummUBGKZxQ+JHAa1Cdi6shsxSvhnldDBZNlFQ0RnXNoEFJuHwHmupsRhNqDA7Kj6zEcjxrmoF9DZqPm6pGmZfwrCMVRKekYlt1JMK3Jms7RToAvs3Ti1RR7iONRUCEBgbsP0Rwh4oZ+/WqoqQtb4vu9hd4eKy9qPr8wyfE0+wdffIHq4aanDO04vQ==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(7696005)(26005)(2616005)(336012)(8676002)(186003)(36756003)(2906002)(70586007)(83380400001)(36860700001)(86362001)(70206006)(82310400003)(426003)(44832011)(6666004)(47076005)(356005)(4326008)(8936002)(6916009)(4744005)(508600001)(5660300002)(81166007)(316002)(1076003)(54906003)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3648
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7dc6ed2c-6fe2-4387-f8dd-08d9a6c2d392
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fXc5Z/1BG9INRNuk9gF817gzpooq7oy0MV++cFzDllA5Zuht48SP0gJfnKHMQog3ZeEMN3X0cihy1aLtOptUJrumPZtcdhEBJnE73pD0aqfXZKzExa0Kf35rcSRfdB4SWaqrtJ81QaYcZulLo5EkfsV4+2sduYYOqNR2KOaQVeNmJhD3St8y9NzTEwZ0K+R3sxOniXSWSDdfuyohRIRv9mlwvMbxTxb55/RDYUyw/6BuobaYZmfaP4xHiPmXKJdnSrlaxdCp/5OUiZQ9JwtnV3leLH6zM9gdy2duFhsgweLO2+U+XYLFROZrMnk5Wk1ugoC3PJ5aka9pFjnu6dU4nOsoElCwF5MbZosA/m/al6aZF+UJJZiWB8PT0FLoy1piuKNVWoCWLSBjEM0TClnjG5XjkWtQfo+c3yLbn+4kBho99a+o5fR5As1F5y2icGApEjvnqwiDuT9fihNU3MtgieWiLNwZJTXxhw08mtrKyh531Jxis77TyB6UtiwBIGO2tKFKm8wQMTmWk7luoCdKkEiiecbLOt3eByaCYpCZijzzYTIrH4i8f/X4AL5tvff7SW/g1D2vHHBmw64URbO3UWzXilrFB/XJLrYS7xClKVW3tb1xy/MK3Qq6JikHmvJ74zvrXW6uvuxQdcpv4pYmnEYJWHc8+1l78mO0j7GuQ6L0FD2jk7B8kb5IiWKFactfvD4Rh6mDLuGUQU+rClmTqeEvqPwh77GfpBmXse9sAaM=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(508600001)(426003)(36860700001)(7696005)(6916009)(2906002)(316002)(2616005)(8936002)(47076005)(6666004)(44832011)(336012)(86362001)(8676002)(26005)(36756003)(70206006)(1076003)(81166007)(186003)(82310400003)(54906003)(4326008)(4744005)(70586007)(5660300002)(83380400001)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 16:30:04.0401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cfa9ff-2d3c-406c-be9e-08d9a6c2d8c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3930
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If of_property_count_u32_elems returned 0, return -EINVAL to indicate
a failure. Previously this would return 0.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 8a58c862c33a..89602aa14c6a 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -119,7 +119,7 @@ static int apple_gpio_dt_node_to_map(struct pinctrl_dev *pctldev,
 		dev_err(pctl->dev,
 			"missing or empty pinmux property in node %pOFn.\n",
 			node);
-		return ret;
+		return ret ? ret : -EINVAL;
 	}
 
 	num_pins = ret;
-- 
2.17.1

