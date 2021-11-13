Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6267B44F428
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 17:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236042AbhKMQdO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 11:33:14 -0500
Received: from mail-eopbgr30060.outbound.protection.outlook.com ([40.107.3.60]:29638
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236045AbhKMQdN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Nov 2021 11:33:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBhS06QuUTSdOlylvab77tl6FTFv+94nH0b7kNwQv1Q=;
 b=OrHyey7l8Baal3qc5pwGIcQYYAWcM/iOxnTfP+0Ef9Gl7l82py6Y3fjdsg5ZW1Nbqbl00glvzO5bRlX+t9Wb/Ns5K7iudIGGlsBt14OynPjMZHxVqVv7srbcSa1ZtNnuJQJDxTPBHfdyjsF69uO7c8ByYUM1z6il4at2SFcJEJk=
Received: from AS9P194CA0022.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::28)
 by DBAPR08MB5765.eurprd08.prod.outlook.com (2603:10a6:10:1ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Sat, 13 Nov
 2021 16:30:19 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::1) by AS9P194CA0022.outlook.office365.com
 (2603:10a6:20b:46d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Sat, 13 Nov 2021 16:30:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:30:18 +0000
Received: ("Tessian outbound 798acf5fb8aa:v109"); Sat, 13 Nov 2021 16:30:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 39407971bbaf0c56
X-CR-MTA-TID: 64aa7808
Received: from a34eafe9044b.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id CD3D40B0-373D-48F5-ADDE-0D7B6009C9ED.1;
        Sat, 13 Nov 2021 16:30:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a34eafe9044b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 13 Nov 2021 16:30:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vnwcflsuz3/+XDvY6EMUP0m6qX0dcEWtuvU2F5xdPXSkoxONVxnF1BCjpxt5mwMlk1kymvtgtksJsGRXLuFQ/+qr7Icc3FqWWCaNW0sfxEvsjgaB8g4ERhWTR0USMHskVcjB3OuUzZhrFgvN8TI2MvQS5OK87a+3X8Z4Fg1hZQih7kRec8sOfiSwBaFt0P+OtKMlUdkd80i14T4TmFdIfEnvi59d6BD1i5ODwkp1Mh2XH2b9Nay2Fh0XsSI+qonx/gxPXy1sJJgxs21jJBfEBFyS71zGXYnVdzOKmYxM1fYuSa/Pm/ordCyoKye4Moo2AfyIpXiQKr9g5zGpyhDnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBhS06QuUTSdOlylvab77tl6FTFv+94nH0b7kNwQv1Q=;
 b=Ag27EidaFmnOpGVMZ2BaFrZ+kxGE6sqlUb1y7GvStSwn0sCT18CgkFC4l7qEpJvluqIfSx6aNR2Wt2JTS5R6wm96cM94tVw9Xs67hfdKCmOhujeiywibMpzeaP/g3Ac4Eh4sGRrZCl/bT8ZmOof6g3bxwMpPwn45t8bvZuXdsxas6CZS1FCWhsfnNV8JMAT2hB0AosRP4SjwgvAF9DaNT+Hov9BpACYORWt+HvvuCqNMO6I2B62XlNzsnZ8d3WJ0C6CB5r95Bdgy60/PNVTl0T5bTscd/ynli6y7od+jEIgZCxbxPwVEq0M08QqkLf9018UVEqE7j/p5xTvmg4jR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBhS06QuUTSdOlylvab77tl6FTFv+94nH0b7kNwQv1Q=;
 b=OrHyey7l8Baal3qc5pwGIcQYYAWcM/iOxnTfP+0Ef9Gl7l82py6Y3fjdsg5ZW1Nbqbl00glvzO5bRlX+t9Wb/Ns5K7iudIGGlsBt14OynPjMZHxVqVv7srbcSa1ZtNnuJQJDxTPBHfdyjsF69uO7c8ByYUM1z6il4at2SFcJEJk=
Received: from AS9PR06CA0410.eurprd06.prod.outlook.com (2603:10a6:20b:461::28)
 by DU0PR08MB7487.eurprd08.prod.outlook.com (2603:10a6:10:357::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Sat, 13 Nov
 2021 16:29:58 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::83) by AS9PR06CA0410.outlook.office365.com
 (2603:10a6:20b:461::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:29:58 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sat, 13 Nov
 2021 16:29:53 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:52 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v1 7/9] pinctrl: apple: don't set gpio_chip.of_node
Date:   Sat, 13 Nov 2021 16:29:42 +0000
Message-ID: <20211113162944.22412-8-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211113162944.22412-1-joey.gouly@arm.com>
References: <20211113162944.22412-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b534802a-416b-462e-3968-08d9a6c2e1ae
X-MS-TrafficTypeDiagnostic: DU0PR08MB7487:|DBAPR08MB5765:
X-Microsoft-Antispam-PRVS: <DBAPR08MB576557888035E1C7CB6D1EA694969@DBAPR08MB5765.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:628;OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: z2JJehomScOJlRUh2YH2IJsjNMr9/TcRfKFb9/zcHZN9EtE1ZKKmPVSPjU6x8a1k87A3GLim0IkUQN7ba3y5lyusP22NBLp7NNxYrE4l3uyBy+vbs0argDytgdYGGZEee11U3vE3UYEVsDXpQrklAjrf97PdDQZaTkx1oAzgJzrpAB5PNZ/zUd/nBIOaDhVC7tlSEz2hsVGnuVPshY4KkykYepmqCFEtb9JQ3ZSP1MfAPeAad+vWbSZIyrp2g1UE+9flOfRuMJhx2v5CrLmxrdQeyvPQGKu0lMzlrYyrcNEWB85xu62mrDQxqwiWGZwsCWknOnwpU6XZUKTRAoLHm2Uz3C7kaU5KQBVZEouUooQxQ0q8hd3T/5GqNimb+r93YmYvW9v3rGXLMdaZTYTLF8O3Rbx0Gp1QHwLWVNQTUk5bRWo76ymgLlrR2XqyXgu/kRIwUPcoO5Kz9OgMvD4+4ePhDGpHVbLxiXRIrslzwcu5l9Rt2XVOiCenRKTmU24aGPLQ/22k1OmU6DDLj3vTI+N0IH/x7AcIJr40zGaSJue4jnNYCbMplD9+ZNQHiBeBeZZvA4VUWPcN9TCpG7WxXVtooY5hU/FSSKDxxw9Fos+XEU93s3clGovwBA9jlLQAwTjqOG1wZbYQws/JAAlP+ET+qT+r1+IIoQLjEQTP1G2H9h8oLMLJwOzzxtfRO5IYY+JA81C9kmvBk1MYX4e7XjRiV50i9SFmdDWFcYHC30z3AiNFLK3uphEPHbvdTvJ5TYb3mNazRexY5fd3yG+Fsg==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(1076003)(4326008)(83380400001)(426003)(336012)(36756003)(316002)(81166007)(26005)(86362001)(356005)(508600001)(44832011)(5660300002)(4744005)(8676002)(70206006)(70586007)(186003)(54906003)(7696005)(6666004)(2906002)(8936002)(6916009)(2616005)(47076005)(82310400003)(36860700001)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7487
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: b107ee69-f87a-4e83-a6b3-08d9a6c2d585
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Nw52gxewJNww/m6P5PBljnYH25Ofms9LU2rFIKFck4tGS7S9ggdv+aIvSI1WDvzwWcdDmzLopM/xhHuv34HYKniyZKKHweyZUmk8y5CwdFLrcw1dBKkLHgNQfr0kOSqF8G/dOzv9yrFfOeNuYcUIntTHbL/DEsokZyEv+WQSb1g86042u2wn3LxlnmG3HTLfOT1VQZJ7DZ/sD8XjcsfrivesbbN+nYnsEV20MU3U5y+0cXbRnabHXAC3ROT8HdkIdBuy3cEBYIRJd21MS3jCBQ4kLd4e3OoD+MxOlqgAzE9m0Vkq3kF9mUltFakd6VvkdWalsW7O5bEXs6cQhdaaZXtrpG4UdOPlxW8AJFghwSqmJZ31sI18RXOzcvARxToZb0sJWnwZAxp90dS8ibOM8UGWjT9y7QZPecz6PvTTGFlZg6vA+mGH/dGz7SG6YOVuUC64HndiVSaRiGTBZ402XuAVz9ZSu6SRU1WA8OSAt/JVYQTrxq3AzCRi5FESOGywY9LZ3/iO419Bi+Vs4JwFGm9Bm2LdFDJNxxnimZP7bqu8OMbJScVyYz0NKxeVasgcT/NJiS/TnUm4JYyPcA5qAYwKEGHd51Vj8QFYS8sy8dbUz6sjnGDHwPOZ2bzIzeKIfjYt8x/5RAZNtvcbsaSPnpqK85jPYPtOrLA3nX0u1A8RrqB2TmgzPJpA/5JyNeQcbguji5W5d6DR17k7cUfci92wL77bTSpo08bIMrbzko=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(47076005)(83380400001)(81166007)(7696005)(54906003)(8676002)(4744005)(26005)(4326008)(36860700001)(316002)(186003)(82310400003)(6916009)(36756003)(1076003)(70206006)(5660300002)(336012)(2906002)(86362001)(8936002)(2616005)(426003)(6666004)(44832011)(70586007)(508600001)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 16:30:18.8730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b534802a-416b-462e-3968-08d9a6c2e1ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5765
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio core code sets of_node, so no need to do it here.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 471d3abf9d99..8e794ebb47da 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -373,7 +373,6 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
 	pctl->gpio_chip.base = -1;
 	pctl->gpio_chip.ngpio = pctl->pinctrl_desc.npins;
 	pctl->gpio_chip.parent = pctl->dev;
-	pctl->gpio_chip.of_node = pctl->dev->of_node;
 
 	if (girq->num_parents) {
 		int i;
-- 
2.17.1

