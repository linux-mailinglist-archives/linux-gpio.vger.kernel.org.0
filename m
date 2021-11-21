Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219B1458526
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 17:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238445AbhKURBF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 12:01:05 -0500
Received: from mail-vi1eur05on2062.outbound.protection.outlook.com ([40.107.21.62]:10782
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238713AbhKURA3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Jnlxw9V/9Ny04bI0Wqgq4KGwLhVc2D9BpabSXLveXg=;
 b=jGWsI1t1BvLBm1MFQ1k6RpQW0XQXG2Rg2pApXoswphht7gfqPfbrRc02dCuIbsiGPoxAIenvaaMvZFz7MAzcMwBYF7mwvbF4rQ2TriPjJuSta8v4AbicHS8lnRo3kwoYfm07+bYA5oq4xYdZqYVzmw8DB2r6oAsD/U3YdY3fvzA=
Received: from AM5PR0101CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::19) by AM0PR08MB4113.eurprd08.prod.outlook.com
 (2603:10a6:208:129::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Sun, 21 Nov
 2021 16:57:21 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::19) by AM5PR0101CA0006.outlook.office365.com
 (2603:10a6:206:16::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:20 +0000
Received: ("Tessian outbound 157533e214a9:v110"); Sun, 21 Nov 2021 16:57:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f7f87525cea371e2
X-CR-MTA-TID: 64aa7808
Received: from 8e6e3c09f841.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 304E139C-6C4B-4ADD-96B5-58E9FAAF6C4D.1;
        Sun, 21 Nov 2021 16:57:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e6e3c09f841.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 21 Nov 2021 16:57:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gg8xcnEHZRdf50qnKPpaNQsptF+ZXnbPlFDv0YpgrL004fUy+hSjirIUGDiDASaelp4q4r6+IiI72zh5NK5dIe5aV87dBgn8ym/5u/VMtNX1rShC85ZWzYOPAq/FPn9O46+h5bz2jabCD9cfKhTm9c5/8Wc9I21PceQr7lxL75IcdIY0X7nP607YhMgYGtYCKN3hrnMfTNLsA4B3Ky89R/RaIvrrDKHHMR3341k4RFKXhpk3aFI8zST/SJFs+j1rlgEXHkdCvnboF9e6Xd1qI4V1lYra1FBTZDypizEzyRXkwxvsVBCZPQdoPuuymZeyY06HbYGuRs+4DoLEchP1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Jnlxw9V/9Ny04bI0Wqgq4KGwLhVc2D9BpabSXLveXg=;
 b=c52g3gQtgwDsrFL8JnqfBiBuejHU/WEfX6G+7eRjJuemAVmK6+an4vqZjSCYooUfn8t9dzl59BzQeZ+CIxmMtjB0SfQusPlnI2N57WpIGQRmu3/PlsuPoLkjZAYu/Q64FLsM8HwC0nPa2G0RdJnL7zVf5lPnDOes1yKuw6kPD61tgdsu84Pi7EjCaJZEOXkZtdFc2fNdi8ziAKg29KczT1aLuRWjvpjqeUqf9lV2GQV55YhVw5eoka9peG87DmD5j7YAvxax1ldYKQ2vQuvXYoxVXaLpezdqEIYz66guwbpo8QUp8Acm7Yi3EjWnod0kNTVFVWo4pHIdQTvbgC9D2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Jnlxw9V/9Ny04bI0Wqgq4KGwLhVc2D9BpabSXLveXg=;
 b=jGWsI1t1BvLBm1MFQ1k6RpQW0XQXG2Rg2pApXoswphht7gfqPfbrRc02dCuIbsiGPoxAIenvaaMvZFz7MAzcMwBYF7mwvbF4rQ2TriPjJuSta8v4AbicHS8lnRo3kwoYfm07+bYA5oq4xYdZqYVzmw8DB2r6oAsD/U3YdY3fvzA=
Received: from AM5PR0402CA0018.eurprd04.prod.outlook.com
 (2603:10a6:203:90::28) by AM8PR08MB5667.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sun, 21 Nov
 2021 16:57:11 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::65) by AM5PR0402CA0018.outlook.office365.com
 (2603:10a6:203:90::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:11 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sun, 21 Nov
 2021 16:56:51 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:51 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v2 11/11] pinctrl: apple: return an error if pinmux is missing in the DT
Date:   Sun, 21 Nov 2021 16:56:42 +0000
Message-ID: <20211121165642.27883-12-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211121165642.27883-1-joey.gouly@arm.com>
References: <20211121165642.27883-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f350dcb-3fbd-4c08-6bd8-08d9ad0ffbbe
X-MS-TrafficTypeDiagnostic: AM8PR08MB5667:|AM0PR08MB4113:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4113F929753FFAB449F20E5F949E9@AM0PR08MB4113.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KJyJnLVKA+VPNS/DbEzWDAc2kUfYRAMubsG2Cfy+5i4ItaGQIpKMe0516YpdZIa+9UGMQzXdzTvE5I20yaswKqgGpbRz6qGmkGqd5hZGGY5Dzr1JLcKKl0hnOryVLmY3D/eonLixm0YkkpV6n8EmDC0DYrBWOUfYf55z0KY6aqKbqBSxun+rfmYYPipIDqC6ycoUCelQMVqXAwVAjBQ4wbKczq1OGp5Sl/HgYCnvClhwuQoP6ASIyJOBlLoeqSqfsquxTTpc00BKs8om25r1YeJTSD4K2mqn3l+SCJ4s0aBluvM4riW47duOyy8eZfkItF636b/8JLQtzGzD3ihgtkwvpuQajX6TD1hHLM136q7jPpCAadz/p8nA5NIzmz/IUlCxdkpGaiFjN1BmNcG/WsdDRZgYR0YjbScXl4eVndGTDDFKUnYP1KbykzkZrwEM3hoUU8bwpMxX5YdTrox1LrYd7oMhrijAB0ynqXeTHRdJw6EaRO1NRbO2BA4umaaYYti05vKAhehBZSmG5vwQp+k34dwn8BphkhvBO97nYd6rZo4rc3D8ZbifqG98ByKPzztm8abEKA6mN0enBJ8i73VgSr868NaEiH9ppuFhJqCL8NFVsSSYIf/mFuQgOmD+7veyLZpaiwJOiUSBf5rJ5E2vPCmwoXednbGOdAL4oXJ0wvgMvx2hwhwmlHQB6uSHmbT1m1Zcfkj5Iucck0fbvNtI3riT73UkvuCpATvR8+cAc6C7LmpYA/DRPBHWMhkUmg3aKxzUZXTDupxvs08kxA==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(316002)(81166007)(26005)(508600001)(186003)(86362001)(5660300002)(2906002)(4744005)(1076003)(356005)(6666004)(4326008)(54906003)(7696005)(6916009)(70206006)(36860700001)(426003)(8676002)(2616005)(82310400003)(336012)(47076005)(44832011)(8936002)(70586007)(83380400001)(36756003)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5667
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7119e7e2-109f-40c4-3973-08d9ad0ff610
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O2sVXbUIOP+8Z658TaBEtq43TCOcOqz0UfTArH03xCr4agompQVwvB+hor3PD35ewy5L7j1hz3knBHa5BI8L3VULcgHiigFEumLD/m/nTT2TKrDnlnJTVnJp2T1wdzsZ8h9vUC2Ol1Uox+W4X3qPfyC/e8Yj8E9eDnnUI79fFqQJHWenJ25hmedIDl4YxcMRNtBHUmoIGEdOOVdu4Yyv4ugS+zS+v9O2Z3udtIJ5fEmoFvYZL9wzhqhkpV7Nv2VdPB05RSaVowDil5c2QRIcIbCs4aWSJy6NB51R3siilmaK7oJsEEIYC4yG3XBHcI9/8BzAgdsyOuKdpoIhgx34OlMv8nURE0QH0jSktEvEPxY9quGepoQgMMy6DGXLQOX0McuIZjJ7vtnL/F6L8kBRbDyIjgv0AWZgta134OsX25/FxYbi3bMFLAhRXIMRcfWXDtHG6wH8ut0IPcFYpM/mPbsUceryeKGM3VSD5BstpwzGbqFze5snr4oXkSrmI2g/diU7WNoFnxOH06OXZMRxtc1syVwLEqd3X4DsVfWrfsfvaisw7/BfLW0vSlrXs5Ac3lqpLfPoFYq3yIqwgJJUnRE+ZYRXl0qbHB3Ds+KDWUNzSth4PswT+RGXjfiZcd/90mS22GhgAFgfRYoDRL5NekNZa2Kj/6B5bNXaniepc30f8bSTGGt37DRAUWkrmxFWxAriZ5qio2Hd7vbVTqfj/crG/uNpaPBu8eR1jWhcp+A=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(2906002)(8676002)(5660300002)(26005)(82310400003)(8936002)(36860700001)(81166007)(6916009)(316002)(86362001)(1076003)(186003)(36756003)(508600001)(4326008)(2616005)(336012)(6666004)(4744005)(54906003)(44832011)(7696005)(83380400001)(70586007)(47076005)(70206006)(426003)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 16:57:20.8251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f350dcb-3fbd-4c08-6bd8-08d9ad0ffbbe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4113
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If of_property_count_u32_elems returned 0, return -EINVAL to indicate
a failure. Previously this would return 0.

Fixes: a0f160ffcb83 ("pinctrl: add pinctrl/GPIO driver for Apple SoCs")
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

