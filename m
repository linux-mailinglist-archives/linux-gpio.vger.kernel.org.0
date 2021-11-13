Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F63B44F421
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 17:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236033AbhKMQc7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 11:32:59 -0500
Received: from mail-eopbgr140084.outbound.protection.outlook.com ([40.107.14.84]:37426
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235923AbhKMQc7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Nov 2021 11:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6ojjMDC06okRbwI6qmbCT+taDiJonW/6lvPxxk0GSg=;
 b=KLB/SB0nWZhh3fHcHna1tAVMIKTUrJdOcdi8CpbZswV0Frd3IjXISDSqI/QieCG2LgHZr9hvYnM8h6XDjVvyGohh3lk/8zxfJjv/SXOojiSX8cLwpNzJfXLysWDC5XvBs6Zae+DrRYTR23WpnOoC42zpHFmM2EOmQxkk9HjEUwk=
Received: from DB7PR03CA0084.eurprd03.prod.outlook.com (2603:10a6:10:72::25)
 by VE1PR08MB5262.eurprd08.prod.outlook.com (2603:10a6:803:106::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 13 Nov
 2021 16:30:03 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::62) by DB7PR03CA0084.outlook.office365.com
 (2603:10a6:10:72::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Sat, 13 Nov 2021 16:30:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Sat, 13 Nov 2021 16:30:03 +0000
Received: ("Tessian outbound 892d2780d3aa:v109"); Sat, 13 Nov 2021 16:30:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b0a85575cdf6ebbd
X-CR-MTA-TID: 64aa7808
Received: from b91d92c7d550.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 00543322-72D4-4330-868F-0D5309F59E7C.1;
        Sat, 13 Nov 2021 16:29:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b91d92c7d550.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 13 Nov 2021 16:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXkQIfuB61ULBcpFFnUZnRGOGsPNtKiZ6pUTO7HtNzvNvg+FoADPMI4ygWZAmiFnBTAaO7Gpz1Qqy59UOrBI5esL7XKHSZlo/mY3bvJe54BVJ6hIh2Do/vfizo6Juh25usPJPFykjZTR7WiGCT/HK1rI7J09oJi8GRXsIU7inOOExNudDf//PYNrdqzXd0YSYiXixYF59FqerDt8mTwKMn2GOlQB4f57S3GgzueSIxxBitkrq76Y3+vTsNqUFUspog19RaG/jXtOMNUfB4Qwukh7+tfBAaMoWHBR95rqdxL1oyIHRHoBNiuSN2M0ajpo8rsrP7lqh07WDkg5+GHUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6ojjMDC06okRbwI6qmbCT+taDiJonW/6lvPxxk0GSg=;
 b=KD2HwGJpN6cpx2Q6/8S7HfPj6ptDwv1P9Tx3ujBxy9UhQtC74RfzHO7FmXtLBi/JMjUIvxEMyZKSCK1hzKdxh1fvPURxKCHzvldSe1U11IkVxvwmHY/XN0r6PMWfh83eV8wwpV/IBjHaQXkkdljayP6EtXr1ln9dHSRPWrU2QNg1NJMs0DE94EM7yCL5GY6gSUQAAbNDOkb2Py4iwyJQ4iQdSd74wo1RDjXjRy4Uk4c75FHMUflzNumVHn1KWKhshXrZqrYn/Shd4uyF70opowdwuOckzEwnyswS1RxnmaRuD8VtpreCJWMwUBWv1aAEnZQGYoZ9HCtXqrtW6U9ICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6ojjMDC06okRbwI6qmbCT+taDiJonW/6lvPxxk0GSg=;
 b=KLB/SB0nWZhh3fHcHna1tAVMIKTUrJdOcdi8CpbZswV0Frd3IjXISDSqI/QieCG2LgHZr9hvYnM8h6XDjVvyGohh3lk/8zxfJjv/SXOojiSX8cLwpNzJfXLysWDC5XvBs6Zae+DrRYTR23WpnOoC42zpHFmM2EOmQxkk9HjEUwk=
Received: from AS8PR07CA0051.eurprd07.prod.outlook.com (2603:10a6:20b:459::10)
 by AM8PR08MB6404.eurprd08.prod.outlook.com (2603:10a6:20b:362::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Sat, 13 Nov
 2021 16:29:54 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::6d) by AS8PR07CA0051.outlook.office365.com
 (2603:10a6:20b:459::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.15 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:29:54 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Sat, 13 Nov
 2021 16:29:53 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Sat, 13
 Nov 2021 16:29:52 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:52 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v1 6/9] pinctrl: apple: remove gpio-controller check
Date:   Sat, 13 Nov 2021 16:29:41 +0000
Message-ID: <20211113162944.22412-7-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211113162944.22412-1-joey.gouly@arm.com>
References: <20211113162944.22412-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b245b26e-7232-462f-e47a-08d9a6c2d87e
X-MS-TrafficTypeDiagnostic: AM8PR08MB6404:|VE1PR08MB5262:
X-Microsoft-Antispam-PRVS: <VE1PR08MB5262D5B6361A92199449C9E894969@VE1PR08MB5262.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: yq7hZXNDnKJdePvu/Nxc/RSxwUzDx/wq3SMrkIZ5mgY1GJ7wjNkiTALMMqqZkRMhyee/Oitdr+eXn/SjeL6HJ5XnTsZscA3CZVQiuSHI8kc9uTTZpaN2X6SCPuDfSCzqhvF1cXrtsqpMRGzXLDIwvQw7jdwoeYfCWjsgeR5huEoY0Ogq1Pq3+E2bR6wIFx4rjycH3FasNJv7ihjlvW+T5o9NiQYkv/76JeALsYTSr4FnwNO8LntaA6qUcKbPlqUCvIr8HJtWFkKv73nyuYY6YMv7KFNhiddt/rjl87pVKYBjqHq2x2JWPy86IScKM6Dnw+7i98R4GPt43CLnBlwTK4th8kild+A7xN43TiudUOczls6F5dpOg8rfr558UWjA0SalllAz/jBIgMZl+KQJdZiU0iMaTQJ+iG4rw0hjNzPGhHwIvIXIk6Iy96T5cX9DRhzmVvpb4uG5aOSfAQRKFOvN+Yj4UoaaAblcbcGvxWIB+Rv2wKBt4ch5ylmmjGeJmbZ+G95TPmXkp3fD+Oh0UcqueX0HyCYbujIle6uDOdjIv+4djwu8fDWZWeqGAQSp8NQ+XBwh0e89ZtH6HKOtGu3cASNEISuQHOmC8bwVTYk0lyvBWXmfGUIlpDTZDTPd0sJut4nWrjtu/O7rVjeeqH/X14K4IMUqg1K0UgTP7dg+Qi/wzUQRbD3DnmK+w29oNL+ZQw+/tzaE9w/tVahE3DgOppQwmXgBC4wWvDTjy486TIXwHEhcQiVROSAt1eNY
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(316002)(1076003)(6916009)(8676002)(508600001)(54906003)(26005)(6666004)(186003)(7696005)(8936002)(4744005)(82310400003)(4326008)(83380400001)(2616005)(426003)(2906002)(47076005)(36756003)(336012)(44832011)(5660300002)(81166007)(86362001)(356005)(70586007)(36860700001)(70206006)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6404
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e6864105-1e80-4566-e122-08d9a6c2d307
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Eeaw5KWlO5RB5O0powVo9INZd69lhE3Z6N+IPQOut3+uEGxE5fUyeZSjPph/27CYBvD7kuNjhP+9FQv6DYnG5wqQ102cJckpYRxz6Fp23nplf9hwuA3jfwPMrFrqYFO+EQLRaLs9XPgU6C30b7XHQgZ/7jn+GrtDe5CGa7yCSc1v6TfomSjnZediemyyIgn5S3PoOy5gncK/zX1GmqsrQGDOKVnMoItVR/xMTorlci1Lp773D39xXEkDlTgKUkJ52kaoOiFHQbDaAp0Y80R0BODGnKBsYCt6uXNvoD4oYSRvUq4RSvRfNCQG6gOOiEfJZ1Ugk7n2aSjP07FXZAR59G9l5McySdljOHzmro+2tOk3SkRH3o7GeU1cXmMSz0RZ0E9DysfYkfhqc9h/Cn9+qU+FWjWaMqx3+I+lQjI0E+pQ8RMCByKxCqsCbQQvHSrvTxkCIupp0bSIrBA9bnHcLWcLVW0rGdo8JQMcbz/h32HKGppUgwttdf+7TlvaqhJ/7fxAeED/OA9XdA+7MxRF3/8wnlKumutDEPnhjCXtwY1egW8EUTM6/RnRlZuFIqaOD9zZvHnCRp30Q8bWihnQDZN2YkkHH2MCvT7g3dhHzzkHwZVRYD1IN5/ncswf/CvpdTOdzbGWXPeDNnwpSOD0PRTw4pBvTtF/zDWlOdFkeGkFKCekpWZwYAwHAAI/ilsC+dVgmXoFvPgSYmL+0QE6bdz57TuLE+RRqFfWiBa+00=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(44832011)(4744005)(81166007)(86362001)(36756003)(336012)(508600001)(426003)(316002)(4326008)(186003)(82310400003)(8676002)(54906003)(26005)(70206006)(2906002)(7696005)(70586007)(5660300002)(47076005)(6916009)(6666004)(2616005)(83380400001)(36860700001)(1076003)(8936002)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 16:30:03.5556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b245b26e-7232-462f-e47a-08d9a6c2d87e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5262
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Having this missing, but everything else valid shouldn't result
in a failure.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index fb34cbe189ce..471d3abf9d99 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -360,10 +360,6 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
 	void **irq_data = NULL;
 	int ret;
 
-	if (!of_property_read_bool(pctl->dev->of_node, "gpio-controller"))
-		return dev_err_probe(pctl->dev,	-ENODEV,
-				     "No gpio-controller property\n");
-
 	pctl->irq_chip = apple_gpio_irqchip;
 
 	pctl->gpio_chip.label = dev_name(pctl->dev);
-- 
2.17.1

