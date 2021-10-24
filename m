Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16598438844
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 12:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhJXKVa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 06:21:30 -0400
Received: from mail-eopbgr10079.outbound.protection.outlook.com ([40.107.1.79]:49847
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230403AbhJXKV3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 24 Oct 2021 06:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NARTcb8v/zI74dqsUxDXg2IyW1EHiQRFHKuudMgUpE=;
 b=mBAynkLoMgE3cYvue60Pfo7+1TGac2Z2O5EZTbU6bI2OEtTwk9COL5HL0q1s6oMEOGZjLNYFwXipNdJEUcFhKJwxfeHlOwBF38c8Uu9lRwwpY/r+nGpYqULX+6SZbGWdVeWwGGAzNFxODhjgs+GxP7yiycxKD8qnU1KqYsIQkaA=
Received: from AM6PR10CA0066.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::43)
 by DBBPR08MB4821.eurprd08.prod.outlook.com (2603:10a6:10:d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sun, 24 Oct
 2021 10:19:04 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::a) by AM6PR10CA0066.outlook.office365.com
 (2603:10a6:209:80::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Sun, 24 Oct 2021 10:19:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Sun, 24 Oct 2021 10:19:04 +0000
Received: ("Tessian outbound f1898412aff1:v103"); Sun, 24 Oct 2021 10:19:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8a01e4d00c04523
X-CR-MTA-TID: 64aa7808
Received: from 592420fdb9bd.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id B29FC82B-16DA-4F5F-AA9F-D02F805E3180.1;
        Sun, 24 Oct 2021 10:18:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 592420fdb9bd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 24 Oct 2021 10:18:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jB2J5skOc9U6pMbeRTJIki1g2DiPYNxGi+49vMqZyWWDizoFx9G6VhgqtY4z0Wk0n9akDdN24icpHvhO63qq8PPVNiiSSEzF6vm7YL0hsyKsbLBhE0xeBX0CqCGiBvfGnKQYiDqr0F1xXFtA8zslXXLxj3wMJQ7ohnVktNkEs7cHdpmkTQ3eiDFz5rYzwc91rRuaoyMV/dSmzjoS57z4LfqZqG75MLXbiS9mfE1a7aNm6ZVqxesha85Z9YOkMgK3Fhf489LzEeawGQZftsmhFDh20D2PlgB3CGFDWaB1DVhyDWsTn25Trm+0w2EeIbdAIhGj8lebqEEUigPuUOnxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NARTcb8v/zI74dqsUxDXg2IyW1EHiQRFHKuudMgUpE=;
 b=BGSumuGojwV2RVvi4ZhJd21A48C13pgFBQ/OJzTkAQGy1kJQ678CFin2kjFPap91scmeX4L8rvV3AncPRgop69oLtWfuutzCfPVam+Nqmt3dEy0KjUq4nrIUkvEZWI10Ud3Eon2SEVy7OxpmYRQhTnd3FhoXn9ebZfQ3pem+BE4Aq2VvNh0cU7+FFwJUwc7RXepPW+s5o0D8fhdfhem80A4KBhialo1KL24SHhSekls7nwhzOBB734hRrEoNYRoz+0qrvRIGOqD9NbsWEcZwK9xLoYejlIREBxZIL7lotnJDenORge/KEbdh2wjqOtPyV2hf0dqAiHM6tvaaf14X/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NARTcb8v/zI74dqsUxDXg2IyW1EHiQRFHKuudMgUpE=;
 b=mBAynkLoMgE3cYvue60Pfo7+1TGac2Z2O5EZTbU6bI2OEtTwk9COL5HL0q1s6oMEOGZjLNYFwXipNdJEUcFhKJwxfeHlOwBF38c8Uu9lRwwpY/r+nGpYqULX+6SZbGWdVeWwGGAzNFxODhjgs+GxP7yiycxKD8qnU1KqYsIQkaA=
Received: from AM6P194CA0028.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::41)
 by VI1PR08MB4285.eurprd08.prod.outlook.com (2603:10a6:803:f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sun, 24 Oct
 2021 10:18:55 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::2f) by AM6P194CA0028.outlook.office365.com
 (2603:10a6:209:90::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Sun, 24 Oct 2021 10:18:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.18 via Frontend Transport; Sun, 24 Oct 2021 10:18:55 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sun, 24 Oct
 2021 10:18:54 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Sun, 24 Oct 2021 10:18:53 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v4 5/5] MAINTAINERS: add pinctrl-apple-gpio to ARM/APPLE MACHINE
Date:   Sun, 24 Oct 2021 11:18:38 +0100
Message-ID: <20211024101838.43107-6-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211024101838.43107-1-joey.gouly@arm.com>
References: <20211024101838.43107-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b80aa6b0-2d84-45a1-f4ed-08d996d7b4d5
X-MS-TrafficTypeDiagnostic: VI1PR08MB4285:|DBBPR08MB4821:
X-Microsoft-Antispam-PRVS: <DBBPR08MB4821ADE68348B59B93CB54DA94829@DBBPR08MB4821.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: nvVCRgIw1rQ8kGG2utISckFKpCS53wEnfZ+mPLs8ogyKnNcxzbfmEnB99K2IZ+xPuD5SC3CwgzXXEmVftguawDrN24yn7YIckW99SkW/+twFrIb+sGgYU9bLQz1bjNY5Nlw5suU6kIEvZN1aSD/RUn10PD80aGkazBjYYXekQR1+VnN+zErNq4b6bH0pYxRm5CtecaroFqu7yME+uIhcCyBU9RIM9IlVaq8/nAPE0sSZo10awAfh6DUSHE/nH9Z7VbpWcpIvSl6gFufsClIr7ai3Z7ZRgwhTSHYXBlyev9/T3ZOj8+rCcmg1CdmiBZ6iBrysqWZ3gvI3cTt19Wb6Al5IRg+EMWHd7g0q2RJcFC1EQS3KEPhGUkalciJHdSQeDY+IE34uoRapgnVEBURXbgg/uMT7bCe0kiZ6tkBDucizmCpPxFOYyNQl/ru4tENOscXHBn3K/n0SVAs17YjbV1zLQh887XvFBmfh9mlLD9D5tBC7/xLKlPJtUxRPK8kh86+ukVP76hvrZvHmjoj0QE6LPW9fvjh4Y7BoGPM8U0Fvsp1q0/FX2NHdJ4OEs2k+JN+TaCOe3zGplaXpvz9liRh9CDFA5yGoQA75KiA2YHPXnKT6Nj67/ucGU/YwEnrBuEtH5ztztDkQQ/90hznP65OhTHutXbcYhrqy/EeNdfVWKPA8u+a1tU9NHEAp6J/I+Dv93aoRJtgiCQrn4WoBezd5zTe9QlgC6oRq5MndECc=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(336012)(2616005)(81166007)(7696005)(5660300002)(8676002)(426003)(54906003)(47076005)(356005)(6916009)(8936002)(316002)(6666004)(86362001)(36860700001)(4744005)(82310400003)(70586007)(508600001)(36756003)(186003)(26005)(70206006)(4326008)(2906002)(44832011)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4285
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: dfe1108c-191c-4ed0-125b-08d996d7af7d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pf6G6UcexxnUjk7SD2zD4AEIHMQoTe+vlBrbJ0FU6zh1WNjKrOUL4u5wPgEL06FgrX9zGTGh8UhJUbubIJ/xyqAOww27E1+qXRCKF/iXdKjzUFUJ4pqTUXubnmTQ3fMUvZtn67K1lvA9DqZxIZDnY3cq3LbH4jNgeL+w+79KdaMjbUobXVbPksBMDoM1N6V3zurfLVmmGq9IOCGUP6qsY8d2nrPZk9XnBGSw2Cw9ZU184TfBimTN6gqgEfoor1+Rdlwn7oPZNwOrC0lshyiMubPZkbvFkzcq6r+DbmDybBrkDyhc7ZyQsA9mZBB11BuQRge27WLf3N4WvtEUlONAnWyC9UtQF8X8m7NLnxp0F1zOkOylFNBe4JO88pPgu1pYls2zX2W2eYwFq3kY2Q8O2P7KusCF47fSWHts/sq659NXsB6DGBQ+MhHJIzeGt6Ik93TSGjWyT7Lsc+bLwUgx5XBtFUBXjn/nwVYSbraFhKRdQLJKqzpB9nGgXfTd6+L73+fTUtRiyzDYit/TdYJf4ZFvIplj2j1cQPuD4rDaIfoDEiR8TYCzdTB6RljIZ8xqLJWJkpCsxXwzNHqto1f2gzpUUIieuIKlX1nLcDQgP3I95EHq5SU+5WDSUrlMmPUozFi5MpXcvvicj4q+qKjviNPEq/MFMBWkclc6mMKMBV/CNG9RaBAsn/3lJ6NQnoO7ayNf0uUV1MBSK0CqzPyRCZa+05M8XNv4RlLiA6M+fI8=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(6916009)(44832011)(7696005)(8936002)(54906003)(186003)(2616005)(5660300002)(6666004)(426003)(70586007)(70206006)(4326008)(26005)(316002)(508600001)(336012)(36756003)(36860700001)(82310400003)(1076003)(8676002)(81166007)(47076005)(2906002)(450100002)(86362001)(4744005)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2021 10:19:04.4952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b80aa6b0-2d84-45a1-f4ed-08d996d7b4d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4821
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the Apple SoC pinctrl driver to the ARM/APPLE MACHINE entry
in MAINTAINERS.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ca6d6fde85cf..e83e992b8ada 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1722,6 +1722,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/irqchip/irq-apple-aic.c
+F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
 
-- 
2.17.1

