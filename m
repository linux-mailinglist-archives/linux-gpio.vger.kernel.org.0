Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D89A4302F3
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Oct 2021 16:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244358AbhJPOVT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Oct 2021 10:21:19 -0400
Received: from mail-eopbgr80071.outbound.protection.outlook.com ([40.107.8.71]:44574
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244354AbhJPOVE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 Oct 2021 10:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZDcCNx/Duv1pt1K6deyAYM5hR/it2tNk8f9tZbVejI=;
 b=GMfLlK9rTgOzXeeVNbpLhkom+5/BJ4xfjSWpLF8qpvHregIeMluZaYSYfShAzCO6uBDEb4rarq1DSQKQ8xpY+wAgRfFMAdMJ+yY/56dWPLr2YhFFzU17319YGtUmG9pYPKIfAfMIGqB1g0FVji/8hGuLyYaCxJVSpnX2vbMsHgw=
Received: from DB7PR03CA0101.eurprd03.prod.outlook.com (2603:10a6:10:72::42)
 by AM6PR08MB3079.eurprd08.prod.outlook.com (2603:10a6:209:45::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Sat, 16 Oct
 2021 14:18:52 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::57) by DB7PR03CA0101.outlook.office365.com
 (2603:10a6:10:72::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Sat, 16 Oct 2021 14:18:52 +0000
Received: ("Tessian outbound e27daf245730:v103"); Sat, 16 Oct 2021 14:18:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 99fcadb0d38af85d
X-CR-MTA-TID: 64aa7808
Received: from 4fc8a7af2c90.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id ED6EE635-066F-4339-B0A1-9160192335E0.1;
        Sat, 16 Oct 2021 14:18:46 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4fc8a7af2c90.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 16 Oct 2021 14:18:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5KumUanpTsgHc8XQxTX1zQaLd6hhfyCC1RvftVYPWXOK7ikpQcycqmM/QFqXNLf9S7/869s8PVKbpP2pHh59GCFCLEWoy2pAwBeJOLxYEXuXSJX4Ja29BUYiiVSy5SA2CK2pl7NctSeoxfQPly8HZypLvI/M32HzoIsrTsF0pV0PBp5dH0kI6nvFBqUB7BeILIpN30oH89dXy9hd42OBuBqpMbbiNfPrxuBt7WbGZX90plcJ7M82uLzOcqiCY4/Qqx0LfLbuiacIz3yry+up//9APoQsAFfuFwk9bDKWdTIJJnQOHjM8CS66vh4Mz5Mid+aL4DGqjwmzsw2jNQwmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZDcCNx/Duv1pt1K6deyAYM5hR/it2tNk8f9tZbVejI=;
 b=RHD/9MAg1PBW+8mFCUCWfffPKvq/KQXKqpHuxkx9oUulNFFObqmX7i8FnyOxhNgGrswVQvXRuvLEmfcuBaCiT8GBtOlYvkPVAee5FKmpNJBUVji8BtQnNpwXik+D6CtXMCSBQ51dJ4Kl1G9WI59TrcF/s0ZPlIFHPgXsMIO0jBUS2hc0Ik244uaPVTGJjQQC+qjA0vvdqQRAp9ugLFomyoBK/WKuYFdgLX7zm8d/AJDahs4dtvhbGyJag6WHipx6t6311MaM0gNsZnvHUBFvfleqV3W5Y09i2embIZjEeKq3CEwH19UCJLnSXK/RMzUXOfWv1beh21RfumNF8BJ2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZDcCNx/Duv1pt1K6deyAYM5hR/it2tNk8f9tZbVejI=;
 b=GMfLlK9rTgOzXeeVNbpLhkom+5/BJ4xfjSWpLF8qpvHregIeMluZaYSYfShAzCO6uBDEb4rarq1DSQKQ8xpY+wAgRfFMAdMJ+yY/56dWPLr2YhFFzU17319YGtUmG9pYPKIfAfMIGqB1g0FVji/8hGuLyYaCxJVSpnX2vbMsHgw=
Received: from DB3PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:8:1::38) by
 DB6PR0801MB2053.eurprd08.prod.outlook.com (2603:10a6:4:76::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Sat, 16 Oct 2021 14:18:44 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::e2) by DB3PR06CA0025.outlook.office365.com
 (2603:10a6:8:1::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Sat, 16 Oct 2021 14:18:44 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sat, 16 Oct
 2021 14:18:42 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:42 +0000
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
Subject: [PATCH v3 2/5] dt-bindings: pinctrl: add #interrupt-cells to apple,pinctrl
Date:   Sat, 16 Oct 2021 15:18:36 +0100
Message-ID: <20211016141839.45460-3-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016141839.45460-1-joey.gouly@arm.com>
References: <20211016141839.45460-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55b424f6-0037-454b-d278-08d990afe1a2
X-MS-TrafficTypeDiagnostic: DB6PR0801MB2053:|AM6PR08MB3079:
X-Microsoft-Antispam-PRVS: <AM6PR08MB30795A18C107E37EDD763A4894BA9@AM6PR08MB3079.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: e9cz6RcsTb4Or7zblteSAIK2mSEI0S1nMMmNM4COOmHNO3eMIZgMAVGRnNqDIreDjshvHvh4/n5WnAA4aBJHrNqSvFGrIwJPtZW/QC8a1ccE3abxoREVdtBKQ5X3bl5dGA+WT63RcQn+Psn8MRBLqNK5SmX9E3i/96sBW+1IXEAtf8m4mtQIgOgSpmIGzCH4FAgdoG1n/akGe2q6Zq9IEJSxqedAPtVLdVlvwezRXJ1qfG79BXAIwcoD70n5ZkYCdHzTL7olJwKfSiigwnnTPdjdpiboZkTOkb9A4NbkstjrJHYoLu9GTZiVej4JecNlIPdy0C3WFJpy0dK390SWzOOIV36+lF5cU5s+sXt+39UT/29tqFHBJlqOZ3gTRgKBH6NlFPpbjM7F4bQYAuWMS7sCswOCw6JLdiHn7fP86vej6MNV6yMVVlkzIGbsZttlxBEzWFVl8P8e5aYIoveVceG6q99gTRiyDZ0xpGmuqE7Sko5QpNrdlQQzAq4HBzq09WN9BeX/a7x3N+ljOGHbGkY4b3su1KF92674+rmvFEdQ/onTUvufGb1JwL8JZqJSHNUSb7rQWW3YnBqcz6tzpNLPsng6QmuIwcCb9oP2Pb0dsYDc7Gi4Lgk7vLOYJ57eYjYJjnaCTcSMyAB9iGUszzredIl3SMD1g8IRSYW+Atsf/dTdi35JB+2riJQkneuYjJmq+CNqhJFBmgXwchSWtYhpUaC/DlymeA6VLTIQx5Xd00n+vWZkn8VTvyMFGRUkfyl3ELCkkydHZcWggI3bFQ==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(426003)(86362001)(70586007)(8936002)(70206006)(6916009)(186003)(36756003)(82310400003)(1076003)(356005)(6666004)(2906002)(336012)(7696005)(316002)(47076005)(5660300002)(26005)(36860700001)(8676002)(44832011)(81166007)(508600001)(4744005)(4326008)(2616005)(54906003)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2053
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: cfcea0fd-8127-498e-4adf-08d990afdc8f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zNGdk/Rm5qJ/ByaNAeJWToyG/xbPXB1YXlWM3l78QMmCHWViv1Zh/425xPZaBoIFLrPdY4I0Q3OYbiNhOBqn7NGAv0OfU7n1inbvNcrq3iscujolrLcE3nid7DOlXvM7BWEnAKMDgVcGDVsw8NgVULOb46pJV9WL35olmoHoV2W2DWFlL12qlVvaB3ESBksE5B3/QpLeDEvFVx0O4QfKjMoWZCbLC99vtfdjPNJMWeVSgjgS3G/BN6AKUmrEr6N0RsehfCe7ZYEOKPEv5i7ARRZMUPgpdsY0y4vMRahkuyPQiqlydkA6cG6XJh3BpxDrPKbSjREvwTwHNguBZcsYb8xlQUE92N8+XP6XTg8aMnQzkVhxiPI69TjHJ9klhK6e5UAa5qQcjgYhOfrEJ+WqZV1mo5pqtRF45Gi8XVHMo0BmxkSFMxARqYMUEuE6U7MFZ7QTMOnsG9CKeUtHHNByhbC9ovZO2TwgnURvIcPdlKs5shrVOoGvmyfcZjonqYGBd2eF5ZXEmGQyOelotsENFgulV8catrYyjqlPHuCf4vqHd1LiMI/OPY7jKnC7Tym5/US44q0/ghpIekwLscGujZS5AnOAWsJ1LPcYVsxvaFHZ+jevf+JSP4Ys/YjDu/m5BXEuYfJ+yo0LBF0GFzZ9Nc/hfJnSy8a3u4gxW6jTmQIgjuyAxmk9HypgM6kNXLGG6QK8jyLpEB+hdFnkhN6QSaWOV3F2WXuFImjnzrc6CII=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(44832011)(508600001)(81166007)(82310400003)(336012)(86362001)(4326008)(2616005)(6666004)(70206006)(426003)(70586007)(36860700001)(47076005)(1076003)(36756003)(2906002)(4744005)(6916009)(7696005)(316002)(8676002)(8936002)(26005)(5660300002)(450100002)(186003)(54906003)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2021 14:18:52.8756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b424f6-0037-454b-d278-08d990afe1a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3079
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO/pinctrl hardware can act as an interrupt-controller, so add
the #interrupt-cells property to the binding.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index d50571affd1f..340be4eabf44 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -43,6 +43,9 @@ properties:
 
   interrupt-controller: true
 
+  '#interrupt-cells':
+    const: 2
+
 patternProperties:
   '-pins$':
     type: object
-- 
2.17.1

