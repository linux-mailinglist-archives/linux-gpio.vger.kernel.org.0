Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5501A44F425
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 17:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236035AbhKMQdE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 11:33:04 -0500
Received: from mail-am6eur05on2040.outbound.protection.outlook.com ([40.107.22.40]:62693
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236027AbhKMQdD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Nov 2021 11:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgHlOTdIsBNi9VYZtjPZ04AJQNCrm+1E9eCD9cnp/Nk=;
 b=6BYD+wvlnfSNc3cpaPuQ4NFZEyBPW99OZ2bxm/jSoVStsn9AamEkhBJLrLB7cQDTwV+1b/dpoZFF0Y/ul/4urb+2quSSOuslAB3VkJ/ORu1z9XssUwAFJPQ7mTvjDmFmudB0sSQpazfp2seAdH2xauKtHU9IZJuC+PYMtNqZnfE=
Received: from DB6PR1001CA0020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::30)
 by DB8PR08MB5466.eurprd08.prod.outlook.com (2603:10a6:10:114::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 13 Nov
 2021 16:30:08 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::a4) by DB6PR1001CA0020.outlook.office365.com
 (2603:10a6:4:b7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Sat, 13 Nov 2021 16:30:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Sat, 13 Nov 2021 16:30:08 +0000
Received: ("Tessian outbound f7440cb8a4c6:v109"); Sat, 13 Nov 2021 16:30:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: beac7ce8701b5591
X-CR-MTA-TID: 64aa7808
Received: from 76da22247b02.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2B04291A-1FA0-4FD0-B51E-05927FF89498.1;
        Sat, 13 Nov 2021 16:30:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 76da22247b02.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 13 Nov 2021 16:30:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JClmNOfzZaz9q+m6iOg5VshsUXbcnswSof7VQZ9q8lBdohrhO61OlwE+J6wXvF1093T5UmT2whU34XtOFwZoq328foYcatkpqppp8AWGFHY53yzTPCxnsNsYN+RG76RLDrXrnXmI/3MIFw3G0hTAmXzedaR4tiy/O7RlurJ0nVH11z9MSV0iNqldAROCSNmQZeXWyXbB3LG48i8cApRZ+4Ss+hvh1kmnlST1uUOou+7LDBprSD6coB5mS6LFaEMZ1z1MOK5Z2/j44g2SD/Sh1I6+E8MbEK8ur3mpDs9ukSJMFeTMTIYLwP/hAsUaOCNgHy7o2Zz+4L3Wj3Zy64UC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgHlOTdIsBNi9VYZtjPZ04AJQNCrm+1E9eCD9cnp/Nk=;
 b=HlSos4rhTYjfazM9fuHXAdFHL7qp6SK/wLuOtRMzKqwBI+CvMHUGM86nZ6vk8mfmGnLMuNMWg5poXfcLGWmL5kF2pVizyOZ0Y3nCpDfNtHVPRbZBATbl0OhXUycg+nRvteUZI4d8BYaSP2d+RZvm+M0ow8ZRyoNZ2osfmHRCZtnfGcUUb5sbwJfzPL+zaiP1A6tvBXA15Li78NP/BY6yKA7Rar/kOmsOgBNUHl9eXMqeanI95ERKu8wW2WiEPggc6Ye6F4dHy1Zmnj6evFHM180XhORlryn8iMcPir9JJ6YozGl+IvYsaarPDguW7aMW/UlBPysAIR5BT9yi1PpaLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgHlOTdIsBNi9VYZtjPZ04AJQNCrm+1E9eCD9cnp/Nk=;
 b=6BYD+wvlnfSNc3cpaPuQ4NFZEyBPW99OZ2bxm/jSoVStsn9AamEkhBJLrLB7cQDTwV+1b/dpoZFF0Y/ul/4urb+2quSSOuslAB3VkJ/ORu1z9XssUwAFJPQ7mTvjDmFmudB0sSQpazfp2seAdH2xauKtHU9IZJuC+PYMtNqZnfE=
Received: from AS9PR06CA0397.eurprd06.prod.outlook.com (2603:10a6:20b:461::8)
 by PAXPR08MB6896.eurprd08.prod.outlook.com (2603:10a6:102:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Sat, 13 Nov
 2021 16:29:59 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::56) by AS9PR06CA0397.outlook.office365.com
 (2603:10a6:20b:461::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.20 via Frontend Transport; Sat, 13 Nov 2021 16:29:59 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Sat, 13 Nov
 2021 16:29:53 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Sat, 13
 Nov 2021 16:29:53 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sat, 13 Nov 2021 16:29:53 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v1 8/9] pinctrl: apple: use modulo rather than bitwise and
Date:   Sat, 13 Nov 2021 16:29:43 +0000
Message-ID: <20211113162944.22412-9-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211113162944.22412-1-joey.gouly@arm.com>
References: <20211113162944.22412-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36730aa5-213b-478b-2133-08d9a6c2db39
X-MS-TrafficTypeDiagnostic: PAXPR08MB6896:|DB8PR08MB5466:
X-Microsoft-Antispam-PRVS: <DB8PR08MB5466A81D191C51307381CDBC94969@DB8PR08MB5466.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:339;OLM:339;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hLHf5aCipMD0kAj3STSuBUl6z3mLxbomurNQPOurQowjXTGJUTk5BXKA65rrnDi4OHlefDTPoUEI9JUrOggs+ST/n/1/zICiijtOduXNX56NFO6co2EgM7/1ZS1OVl9/s+GWMV3xJifZydUa9ICYbg8j1bOq3Lhem2Zp9KeauB7x+YV5HkLBAOGfRYUMRXmuiVRiPwQfn/eFSCZjdh69OWL3+8/FWFIy0XH5OCxRUgZGnk+Gwykq4xH7Uk54jkjyWntZ0yAwpAyF+t6tTM2Yl0M866YXoY/yqFsG2hSKbdGVn8LBOowomYrczELkJfHYKigpu085+TbTKzOC6KA3brNx6FPdMDZK+ZwS//ub/Ajo0SU8waZBaHC/6dwMnsXsQcW3Vzj+NkFTO5A2I8lzK8f0MJmMMqPKZqvniBb0ox7bxP70SORWjRTiY4mYGVSiBlAJ3QnUMDZD209QWG3a8T4Iz9RzJrNMARTJs97ZmYQSUFko1uLIH5KaSvDm45I/y4SVLxH1ZV5Cp0Xmd5yk1plFh3Mo8HUEEFHA9UOjxQamUun0CXkVSa86IaXBpW2fpwsGNaabWo+tIqXNOx38ZMH4EuicEiEFFP7mQn6i365lQt9sGa0lrKNZ5Go0CxV3CMXZUCvuhWTfihFzMFraXNlcO5LIBJUPx6LxVhQJVadvrpJMl8APEIleFHGvH9huuLj4bMxnxk79JrvgOKcocjZjL/mYzxQjmAnDeeoAm6oTIdL65/q8NyEKC+N7QuvIFTcKXC0F3GVcUQsjgufhjg==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(186003)(36756003)(82310400003)(4744005)(70206006)(70586007)(36860700001)(4326008)(1076003)(47076005)(5660300002)(83380400001)(356005)(426003)(6916009)(336012)(2616005)(8936002)(316002)(86362001)(6666004)(508600001)(81166007)(54906003)(2906002)(7696005)(44832011)(8676002)(26005)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6896
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a1854eb7-f97a-4b92-c9a0-08d9a6c2d62e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fmRaFZ6evADkKuPpZF4F8e1in7H+x8IEHK9K4q5FZcpJZ+VSP7hdfJNBW+iPQvm6F0zAOm8L2KjDpjwGrtICxwmILd6oQKI2wwwSbWSgN4t0Nrzti7sQ81GuZRzL4bEpZXyVUbyERH9EQdXtCMWDex5yR5Y8Ljggvzsi2+7hjtIu/8YlWcKVAj2lRU/gFQpLhT7okagskL5eyL90UUIc7iTlFHhtUfvQUNBLs370I/Ey4a/7kEh4l3fE/44rBvg3oQR6GQNCQce3N2Jl7pyPaUpUDtSlkE5of/LOhV1PNg7B+blMKpOpMuFLTLHpkLIaktgtbI4nZhTlT2cyJWwwNGfhzuB7oMu+dPjiLU+3Q5BqF7icQqovrf7wKRDP+1UBbeVbMTxiDq6zFFb82jDLc0oydl4KY102NbI8JqejCDGRDQ4UHSRLr+7fd42GvC7F+ZdOOvxS5qIr/xUNsgNb1kSLSDxoA9W+k4HjS3J84GCiPdp+HUnKo9J7+IPmufkCKUC/GhMY3zKKdbVOemUpMQYGyyYBothFdDyw5bNTwWK1LBdi/wsKKXwU0K+nNxPEyKvpq1LU9lMx5SzHhg+Qw/wuP3VAjTx44STQKmVLbu6+dNbK7jdSolziV/7ffXjzoUZLk6/8eQ64mhMKX0KEAW59EVvU2nfHmlmfoxD07MABvU/kQ13eSKLMNcHce3l8vpB3WhNC5LxYkk7TccqRYgM7P/blISslJVF87dP14do=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(86362001)(26005)(186003)(8676002)(5660300002)(4326008)(83380400001)(8936002)(1076003)(4744005)(70206006)(70586007)(6916009)(36860700001)(2906002)(44832011)(2616005)(81166007)(508600001)(336012)(82310400003)(36756003)(6666004)(426003)(316002)(54906003)(7696005)(47076005)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 16:30:08.1374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36730aa5-213b-478b-2133-08d9a6c2db39
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5466
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This expresses the intention clearer.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 8e794ebb47da..8a58c862c33a 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -252,7 +252,7 @@ static void apple_gpio_irq_ack(struct irq_data *data)
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
 	unsigned int irqgrp = FIELD_GET(REG_GPIOx_GRP, apple_gpio_get_reg(pctl, data->hwirq));
 
-	writel(BIT(data->hwirq & 31), pctl->base + REG_IRQ(irqgrp, data->hwirq));
+	writel(BIT(data->hwirq % 32), pctl->base + REG_IRQ(irqgrp, data->hwirq));
 }
 
 static unsigned int apple_gpio_irq_type(unsigned int type)
-- 
2.17.1

