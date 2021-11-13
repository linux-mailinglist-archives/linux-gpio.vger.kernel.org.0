Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E9244F422
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 17:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236034AbhKMQdA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 11:33:00 -0500
Received: from mail-eopbgr140051.outbound.protection.outlook.com ([40.107.14.51]:33536
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235909AbhKMQc7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Nov 2021 11:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgyIFblOe5qPv5E0wYV+J5dpXgSmAd0z/ZUnO+LvYQM=;
 b=tPwG8djKpMbYgxEfLdB0Y6F7sXHc2oPa6v42U1UMQdqO7Jtgn8x4WsvjemdQLUe6sQNxbAauFrtzUhANRUa8YWbYgiFabZ4PBz2TUOxgnNZb6AXOXJWGRbSFAB78eL7+VzVnlndVC6AoJCILQC1ilZzODfDiKRDIPoquKz9Jqfw=
Received: from DB3PR06CA0003.eurprd06.prod.outlook.com (2603:10a6:8:1::16) by
 DB8PR08MB5465.eurprd08.prod.outlook.com (2603:10a6:10:118::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Sat, 13 Nov 2021 16:30:05 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::c7) by DB3PR06CA0003.outlook.office365.com
 (2603:10a6:8:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17 via Frontend
 Transport; Sat, 13 Nov 2021 16:30:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Sat, 13 Nov 2021 16:30:05 +0000
Received: ("Tessian outbound 1cfce3f02e53:v109"); Sat, 13 Nov 2021 16:30:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6697cc7c218d05c8
X-CR-MTA-TID: 64aa7808
Received: from 499bca74dc51.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0B4BAA20-682D-4362-80A2-1EAF0C3814AB.1;
        Sat, 13 Nov 2021 16:29:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 499bca74dc51.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 13 Nov 2021 16:29:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PA+nRmR7GurdVX6JpgVRHMpUcxB8nGv3vsn89N95kcvzPhtVi6Mh3ZczB62Ds0Mhp5j9+8/DIJyeChxopbK3ftKS12YiD51PIC1QGepuj1pQIg4OikGiJTR7YWO4CPXqYHfkW49hJgZ3DGLDVUoNTie49wl/lKLxSP3rCRN87HI/ruV/lRhWWp6hBJQ1DVmJBTcIjf7PY5WbP19PyIBzQ8hUD1nSZ9PMtd3SM3EAD07afzfffh9b4zuwRlDlxbrmoDUdPiFxMT73TDc11adHuKSzLdIHYazoULrzkkLA5Wj/u9NITTiZtHH0pRKiMC/XJ+xct1zQzhe4Lg149UU2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgyIFblOe5qPv5E0wYV+J5dpXgSmAd0z/ZUnO+LvYQM=;
 b=IXK/dV6Y7YcvVBxtKSt6YF0Gnj+K+SCJ8EgP5nehZj/QyfQUHBHRGknjxmYSYdV5FHpAx5Koq5y15L/q7kTpO8bYayDtjkG3wLn+dv6sRU//+Sq3XSB1azaULKthruotYOhkl/2vm04NFfveq93xIzqZEK46RHu96AeD5xYNC+MHflUHg8zWlCmzxc+R/J/RMtZ7nQZcNRtrabH4Jki+MI+EtP4wqaGr2zcIaJI/wn6DPSKfojOC48j6BsoIbhOPSfE0tHEOvajQBMOTowwMyxf1HfLdOCKTK1HAjDBFTNRscJx/GwbhCuwxNsJy4Cc4TZ2EJK/UOcsUc/STzF+J/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgyIFblOe5qPv5E0wYV+J5dpXgSmAd0z/ZUnO+LvYQM=;
 b=tPwG8djKpMbYgxEfLdB0Y6F7sXHc2oPa6v42U1UMQdqO7Jtgn8x4WsvjemdQLUe6sQNxbAauFrtzUhANRUa8YWbYgiFabZ4PBz2TUOxgnNZb6AXOXJWGRbSFAB78eL7+VzVnlndVC6AoJCILQC1ilZzODfDiKRDIPoquKz9Jqfw=
Received: from AS9PR06CA0407.eurprd06.prod.outlook.com (2603:10a6:20b:461::14)
 by AM4PR0802MB2305.eurprd08.prod.outlook.com (2603:10a6:200:5f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Sat, 13 Nov
 2021 16:29:57 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::60) by AS9PR06CA0407.outlook.office365.com
 (2603:10a6:20b:461::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:29:57 +0000
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
Subject: [PATCH v1 5/9] pinctrl: apple: give error label a specific name
Date:   Sat, 13 Nov 2021 16:29:40 +0000
Message-ID: <20211113162944.22412-6-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211113162944.22412-1-joey.gouly@arm.com>
References: <20211113162944.22412-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc467e3d-4c11-4940-04b6-08d9a6c2d98f
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2305:|DB8PR08MB5465:
X-Microsoft-Antispam-PRVS: <DB8PR08MB54659621521479F398844CC094969@DB8PR08MB5465.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: CkGXoSugUKI+rt1mfKSwECD/Tjm8fc9YgWCpmFBU74PfsJ6BGXIzuW65LFfbaz5A69XzxU11PiiLH3aesBtKe0kfcw4hIju+uhVqcqYKbQfK/LC6WowJovM6tAM4NzB7pnfS0TNPDukq4mIYIIV6k9dYoo5iOpJW1OyzC4ADqD3sGaLhsgdZFo9wJJ0nyoym7nYzQeqyYTk6kW5MRNhXQq+Y8DQkLnWuPwi179gLuV+62pVJDWmhfmDYv9Df939T0sdJAdNYMSMsk+gXO+mrUFq8ndvTUFp+fj9B71Ht1ph30GHAYlwy+By+PCvsNAcOSZdBy1GRFX2jmeNQ4dQSsGBeHQR3NjmI5nohTIOXcEqysYDEooBxgcjFYbjPnnlS3vbN3gn/qh0xciWm7uIOW+JxA5SxSEYzb0RcHLwGpOBzqJlKQ16aMVqOJTzK8vg/UMQtFRlf9KT18mBDy5amCfZUTsAQz/RVW0ya/rybJmSdTwqfSEvhOy/pwWlPiyg76fJQulP8xov8Q/T6gYgXIXLcrR4iS6WLptEMFgD/2wBAphrwJ4Vr6nN1MiRjR5YSV0pRXAD9twZgO8ZYZL+wSRowTBjyvESHC4/M5gY1pc9taMSVm+MHqUvz3aKeF8jRaiuBvWEzhuBXsASqPO08BfBbccrM12itba5mtVFLLRg8aZr+r5IlAi8hsxkdZ6WFxWvubMe9iKaYuGA+0LBmJYwy2PpuBrmy3rt/dfTm53vljgVlOMp6ij5vIrotpPoKXIZa+eQj7Z70kidzczOXgQ==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(81166007)(54906003)(356005)(1076003)(2616005)(82310400003)(4326008)(36860700001)(8936002)(36756003)(44832011)(508600001)(70206006)(70586007)(5660300002)(426003)(8676002)(4744005)(186003)(6666004)(336012)(83380400001)(86362001)(26005)(47076005)(7696005)(2906002)(6916009)(316002)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2305
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e1216e81-4e6e-413b-6d8c-08d9a6c2d4e6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iLvuModSD6dFmU+bDI+e9KLYHBP8DSvjFWSFc2XW4Gl90RqPKSNEEKvuonrSdV37yFhvOzvK7+58EJIvaPAK9KGlSazmIaHC37IZnCtOWuQ/dq4qAWPTj1rF44/RHUpJqhORcC4XJNoeWIqQcZDXk62XYD9Vb2Npyibedm9+J9RL73/nuPupK9HbFP8ZGTuH0r3j1q9yQBP78KZIBBqplpdmdD6AASLPohcjM07W6ESssLuMAd2Gv4jmLQGJllgberf8B5c7MoePcTq3fh1PlYNe6jq7etUn8evG+Cka+KAoLKgQefV090p2/8F37iP9qj+3+OZde3sQg8NEZp0aMrwbDkK2XGKh4mluPKXYoktK8XGQ5RKXjfmS64pFT4tqDpLhhX2EZhiQRvx8VhaZPHh+NUwJCcAd1Y40+ciWs4VW2px2PG2sUzZJvCJv4JUgaz+i3CcNxe+eyVb78sbu9R8UYjrN6tYvkfY2q8FollDPY/TnRv1cj0PI6rtcyPNZFu6KiHUjc76D7rkQtF47LKKMTCDwXZU0Dsy6+k7mJORvEwV2VpLsYEaX98upYiVPstZtFFvdLe5c491WTKsTcJBVnamIhXi8HJ+NZx88zHMgAJvwD1jXVfIdmYev4G1/IpE2TWkVtxTTsqlJONhHYfPCWTflgNJ8RwbSgcVpGxo9HQg4EZRdoXEgBtySoRqogr7Tbdfz4fkKxLoYX40Fmna/VOR5epVHUUiS0lngypw=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(2616005)(426003)(82310400003)(336012)(6666004)(186003)(5660300002)(26005)(7696005)(1076003)(8936002)(508600001)(6916009)(2906002)(4744005)(316002)(8676002)(54906003)(4326008)(36860700001)(47076005)(81166007)(36756003)(86362001)(70586007)(83380400001)(44832011)(70206006)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 16:30:05.3460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc467e3d-4c11-4940-04b6-08d9a6c2d98f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5465
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
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

