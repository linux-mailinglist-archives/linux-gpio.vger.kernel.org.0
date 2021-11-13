Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A6044F426
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 17:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236027AbhKMQdI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 11:33:08 -0500
Received: from mail-eopbgr50070.outbound.protection.outlook.com ([40.107.5.70]:53380
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236043AbhKMQdI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Nov 2021 11:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SY8G0lJXBxsYHsTunT6YMLI9rFZfmVz1KSVJcNQ8tk8=;
 b=naa/qhZIMk/fPAJVpmx5A3vDhxZs7fVzZ0fH5xcfRQqhcQFOPVt/pWqbggKre90eLjfaMPwaPZZhyFFDTXFeRtY4y8JVBeS1GPTCint0ZNRhI3fuUU1Qe6AMOWExN36T6LBtIUouYejW3IzJKXFom1q24rAxRpNM1r78vImW9PU=
Received: from DB7PR03CA0078.eurprd03.prod.outlook.com (2603:10a6:10:72::19)
 by DB6PR08MB2920.eurprd08.prod.outlook.com (2603:10a6:6:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 13 Nov
 2021 16:30:11 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72::4) by DB7PR03CA0078.outlook.office365.com
 (2603:10a6:10:72::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Sat, 13 Nov 2021 16:30:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Sat, 13 Nov 2021 16:30:11 +0000
Received: ("Tessian outbound 892d2780d3aa:v109"); Sat, 13 Nov 2021 16:30:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 994f32378549d8a5
X-CR-MTA-TID: 64aa7808
Received: from 4c14e497aef6.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id D150CF5F-6ADD-4DBE-ABC8-1AAF47F2B455.1;
        Sat, 13 Nov 2021 16:30:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c14e497aef6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 13 Nov 2021 16:30:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzdSXRhzLSV2yYzdjRrBMgJ08NtuNsnZ09vyWientKA1WIPLOnN3aHHEQtTDMWvdF6AmTZNB8SWo1lgR5Wnuf6kfeVx66l7O4lpt8ajXrQORbfpONInBYAb5mzHmkjsWbeMJWlUEQQkq4HMzJf7tmbx8R8EPVDSZN/kqdOowcgX3q14MYZ2LtqxK285yWN20Oz4daLcyFfG9S4niY77kb+0S/9eSXavDpDnjAg+Ivm5Krga7KrzfZRSM8YKUKtKVDJgAvl21qGczd9tk4YVASRvkCqO45ovvDK1pAb6SDoIp+vbPCvIZwWKePF3edJbz3oqJIbs2TKhBxWb7YLg/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SY8G0lJXBxsYHsTunT6YMLI9rFZfmVz1KSVJcNQ8tk8=;
 b=ICJORuflxeHVpgliiUdnDwv+lkPuLp/lupGN86hKAb/J/3B5RN8PZnpgkMamJxc7i5YVuXLT3mVVF7lyz42/rLfoAksl/BSabUg2SnpJEmGzEq+Gz9WWNHqmuZJnK2TszkCOQROC4uZ6oAOgAC+rnMlI0T3pUNRK71mYer+BBL8+qMVdsf9aKhcSDuFGRkD7x52JuRN4VzFbek/PfiQZYazVhVXwTNuX9SQXADc1AJQsQukmtU9sEF39sKjJXUuwndBGqm75L8ZqUlHyD6o5ahjih5tiXlkFTu/ycBdn113f+1Uzs9DxY/u+XWzoinvkVvN4flYMy2AzcMeieopgRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SY8G0lJXBxsYHsTunT6YMLI9rFZfmVz1KSVJcNQ8tk8=;
 b=naa/qhZIMk/fPAJVpmx5A3vDhxZs7fVzZ0fH5xcfRQqhcQFOPVt/pWqbggKre90eLjfaMPwaPZZhyFFDTXFeRtY4y8JVBeS1GPTCint0ZNRhI3fuUU1Qe6AMOWExN36T6LBtIUouYejW3IzJKXFom1q24rAxRpNM1r78vImW9PU=
Received: from AS9PR06CA0395.eurprd06.prod.outlook.com (2603:10a6:20b:461::30)
 by DBBPR08MB4871.eurprd08.prod.outlook.com (2603:10a6:10:da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Sat, 13 Nov
 2021 16:29:55 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::c4) by AS9PR06CA0395.outlook.office365.com
 (2603:10a6:20b:461::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:29:54 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sat, 13 Nov
 2021 16:29:51 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:51 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v1 3/9] pinctrl: apple: handle regmap_read errors
Date:   Sat, 13 Nov 2021 16:29:38 +0000
Message-ID: <20211113162944.22412-4-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211113162944.22412-1-joey.gouly@arm.com>
References: <20211113162944.22412-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39ea0c7f-5dd3-44c7-e8e9-08d9a6c2dd5e
X-MS-TrafficTypeDiagnostic: DBBPR08MB4871:|DB6PR08MB2920:
X-Microsoft-Antispam-PRVS: <DB6PR08MB292081569A6298D8A2EE146C94969@DB6PR08MB2920.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:813;OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: m1vgK0Vau8x1cBda+vEI6jLfYf5DYufTdKuM20hBTXqepeNN3QTWv5SHEN09Nxwz05cXntHa+sjpYEfj2yd6hmsmEEl8XEygKoJFwAlOH5WkX5aIRkU/CHwHgxBY6NG3Xa1IWESK62isxUR9XX7HgT+qsjAJMcnRVxkmqmvirqSNVhIk3ZDFxwE6HMQptEkkMeUcgSrRbas1JTWWfaRs2heJIbOCgUY0zkfxvPhxb4kQR9jUnR9gBcAk8SWuYXHt2l6wGlpeHdtHh98fJEXhQClWIQbh9S0K5Rz1LmEW1e2/XSr624qxZI+80DwFYFD0ri+9KwXFzQQ3Votg042iZ0DC7UCY4JCV8NDz4VOJQRUOo0E0bEjKizIj/xGGj8168jMn8c/XI8/aqrMkTFM8bbObIJIKhO4G3dBIkLYqd3kBBwGi53V9k3ZEoP3IZAnjb8oOQs3IqgaZoIy1Y/WQcN8GVZQ56p88GSsImUcRYD/dNY5nzxLKQIgwxULapXEjivAolyTvKJ2XKe0F5tc8B6/OZV91NELKvHzF/rcIxQjHHHOzgxJNJ2KMqEq7GzSE99rn8wUtrKdr5FsmQh4z+E8jqWNFNbk/YN7zq/AESu145P/1EF6lY4kTiPgDZwkf/Dc1xt5dKCE6/PJX7NLlTtZ7J/JCIC9sBs6M2OR1ipIqa0NiNH7SDNok4OLe3p0Ko7q+vWgp8n96Zobj1sycjX/kGFtBEBP+2TN/ftSuXLlUt8Jgxfk3yZQuD7khujjm74gSa7zpDrx1mFWlZB1GjA==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(8676002)(336012)(8936002)(82310400003)(44832011)(70206006)(6916009)(36860700001)(86362001)(81166007)(426003)(508600001)(36756003)(1076003)(2616005)(83380400001)(70586007)(316002)(54906003)(26005)(186003)(6666004)(5660300002)(4326008)(47076005)(7696005)(2906002)(356005)(4744005)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4871
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1e06aa43-58fe-4eda-b144-08d9a6c2d356
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5ghGg8f1Nyvx7sQ91kfWIee+4gbYyctxATojgSIECp7LdNEfBWLmrtJbPui+Pn4l8khzXHQxjm2kuQTEZsqxU934HMUgufllPVwWtEx1cvaDjVpRK1GsU3Gy/qdAEz+6aNqLYl4zVFKLBRpV04DX+/IRqKJcfGWH9F6jwyXAQo/488PMgt/sDW5vb/cESQIDXzgp43Uh+RcU2hSUGV5ij0C3s/ZxGGT/vaAIXtW3Gs7hsuZbQwDtgzKeya0CQfHZI6ejprWEdSAwvqG97DsTnjd9hfhJqkqk8FRXizDcOpYef4L0I4ndrw6+bd51HPCs9FJb0QwJj0aLERSPXHWinUwsI1JkfIBS8eGB8RJGmpDptdVeeF/qE+Pqv02T1plk3pz4vnJ4MCBdjzQiRvYXMjVLoPJujYFDHPs1RT4Ii1n5GkFzjRHDeqvkGlYHj+9S1xKrNqO0azVRAEwCJC2vCx3P/NqbDKQ7+XG53QXLX2KpV/XRjYqmFCVcM4Kn20CyCN4mgicCOUACfym1cPYdVZfwIm2NTiq5b2BZgRzYXW9w5SREYZ6cmTMFbbPuZRUt4+yt/IfNADOrZgaa0HK+Jm6PwkaVhngsbR6mn0cBbLgHF+e2GIC0QF9c/BI+UQDqpaEZYSDclDOpUqMs7eJdkH4jbxFc4sUUuBshae1MSqV20shFpHe9M4+Hd8zHXvjtM5oMxulOFHRzjjuaOIMKZiQGFmd/cXFklfgT5OTHig=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(7696005)(5660300002)(6916009)(508600001)(36860700001)(2616005)(86362001)(1076003)(2906002)(8936002)(8676002)(316002)(186003)(70206006)(6666004)(47076005)(70586007)(336012)(83380400001)(54906003)(426003)(44832011)(26005)(4326008)(36756003)(82310400003)(81166007)(4744005)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 16:30:11.7396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ea0c7f-5dd3-44c7-e8e9-08d9a6c2dd5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2920
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Explicitly return 0 if the regmap_read fails.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 4f7fb79d8e11..bd7f28150ac0 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -84,9 +84,13 @@ static void apple_gpio_set_reg(struct apple_gpio_pinctrl *pctl,
 static u32 apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
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

