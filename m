Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D802D438840
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 12:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhJXKV3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 06:21:29 -0400
Received: from mail-eopbgr60073.outbound.protection.outlook.com ([40.107.6.73]:61314
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229886AbhJXKV2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 24 Oct 2021 06:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylaTf0ZyLkZn+wH7mGglUMw0g/12SLtQ5pxcH1Zeocc=;
 b=eh2ReLG52NtxqGCytFFjqccXTTnvHhtq0xRxSlGUKdwou/YEZ/pX0A7fQN/TX5fy5PQx4M76q74cX847FG9PQJQGH+pM9bOJa9nez6o79eWgfPT3aJpIHH7Hay6ECecnM4QYeTOqfasboh3HjaGiGIsINL6NVpgEgh8P3SzQUWI=
Received: from AS8PR04CA0109.eurprd04.prod.outlook.com (2603:10a6:20b:31e::24)
 by PAXPR08MB6925.eurprd08.prod.outlook.com (2603:10a6:102:13a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sun, 24 Oct
 2021 10:19:03 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::64) by AS8PR04CA0109.outlook.office365.com
 (2603:10a6:20b:31e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Sun, 24 Oct 2021 10:19:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Sun, 24 Oct 2021 10:19:03 +0000
Received: ("Tessian outbound d5def7722ff7:v103"); Sun, 24 Oct 2021 10:19:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 74ba1173d7e53b74
X-CR-MTA-TID: 64aa7808
Received: from a2f7ecf93c3f.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8A2E986B-4875-4CEE-AFA7-000B0BDABD91.1;
        Sun, 24 Oct 2021 10:18:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a2f7ecf93c3f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 24 Oct 2021 10:18:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGkVXo/ByC6B+D3sT5+TKjvXHMRJXng8pDL1LP5KEkxVxQqEdIWK4zprOLRjyWz2W8vbpWA9QKhgjWkxrpdYof96yZTa4j7ouhtt7CxpXCe8+WTfGo3DcwIwHt2Hg4OZByCQfkk6bUVXLYcjDwPxIMCVbdU/Cf0M9QIT/SnA/9LLF+hmFt7LRuexvs8Ijfl9fHQn6WahVD9C0kr7Irf3ACUNVi3/StYqqhgtEAnu34oC2N4Apav20G9L5Pn8n3qU4wsJtqQpFtCJl4CyGblegIujmldt4lf0PbovNFhk/DsyosUqyqN2fsTi9hpC/NZK92fwifPTNLu/wHyaanSESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylaTf0ZyLkZn+wH7mGglUMw0g/12SLtQ5pxcH1Zeocc=;
 b=kmyVIkKwA0jt4FfMDJlZoLzMi3PkbkYSdjmqVQYMcGVG+thxoSJYRfVXHyfNoBARC+0tUPVSRFb7p5gCyG+0QX9Vw6o9WLZV5Q5wJTw1rfaKXWkBhD+eOF0ipSl+t4wJ0xcUK0k+4ClZ3WyRI7RgRN9gq2u1QJ+cmFRg9JT7+k3DHe6b4lrI8ZUxmEjuZJaUzMDa7CNwLBaUDSxXW4xQmZt3cNAxcoQlwXS5R8ZS9mKoFmvvqwgG6wgjOcZp64PJBlRtiMPdZG9loYLpM4fUb02RBLETIdvekQLOFowETswbXuxaG3FT68Na9kTZtAQe9ztMJb32Z5HnxzRqxvjeaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylaTf0ZyLkZn+wH7mGglUMw0g/12SLtQ5pxcH1Zeocc=;
 b=eh2ReLG52NtxqGCytFFjqccXTTnvHhtq0xRxSlGUKdwou/YEZ/pX0A7fQN/TX5fy5PQx4M76q74cX847FG9PQJQGH+pM9bOJa9nez6o79eWgfPT3aJpIHH7Hay6ECecnM4QYeTOqfasboh3HjaGiGIsINL6NVpgEgh8P3SzQUWI=
Received: from AM6P194CA0009.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::22)
 by AM0PR08MB5058.eurprd08.prod.outlook.com (2603:10a6:208:160::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sun, 24 Oct
 2021 10:18:53 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::cb) by AM6P194CA0009.outlook.office365.com
 (2603:10a6:209:90::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Sun, 24 Oct 2021 10:18:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.18 via Frontend Transport; Sun, 24 Oct 2021 10:18:53 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sun, 24 Oct
 2021 10:18:53 +0000
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
Subject: [PATCH v4 3/5] dt-bindings: pinctrl: Add apple,npins property to apple,pinctrl
Date:   Sun, 24 Oct 2021 11:18:36 +0100
Message-ID: <20211024101838.43107-4-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211024101838.43107-1-joey.gouly@arm.com>
References: <20211024101838.43107-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f61f017-17e5-40a2-2852-08d996d7b439
X-MS-TrafficTypeDiagnostic: AM0PR08MB5058:|PAXPR08MB6925:
X-Microsoft-Antispam-PRVS: <PAXPR08MB69259252235421701A6AB11C94829@PAXPR08MB6925.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bg4pR+eVUzsESGretSWH8yeprZRuRMtF4KGNp5UQwnVIaJ1t2YSDvk5XovYihvgEkCYbQ16CgPIgvAw0Vkn2cyWycJqLt8jFiJbK5f5VO4i6tAb6vk5rGt/CQSVFZxA2PHR9KR+EIpOZieJxIzKPl4M3TPWYEsvNUWrFjc8nwRFs29kVriG1SVAC1wC0ZwTU9MBhmi5oUHICm8T2hp6VBJA8XOPaYc7eSJv7gBiUvYHXB+I02NhH7QAHHG8P8vyeegcF2GEOfPYb9PDUjuJnNXJDjloClWiHLK5zzvxCh7AETVJmirbHrNYcJnSGYZWsmHAgVq4n0+Q4coUUP2n99/VuI524FjJLGTMriB6QCDPzzhxXWMCRjMZ7KlcJsB/8MUgNISnAQ5/GOlDyxz/mAGHfjTULe0OJzjBbINaO5aY6oxoBAhGdio6n6nPMV9VD6NnzRIRZ6J7/TZys0Oicjt1sfY5GVqJFfID3g0bjNNmoXYnXlJ/TnwNbbR+DeF5+kkrmybFbpwudK3y4d6u8FnkYCEt/1kAcA14bzA62nkujWsK7LSKCcNr6liKLKYSVhy7MttLCwwupkFUYdZX0MgL7WoPsvByzlR7pMLEOoOnvzZnpFxGCPKqJuuBgf93dLPZ3ePzEZx0AZKi57rMQ+IhySqXAgBYLRFHV71F847CylESmnVuqw6kqp1dq6qSFCx9m7fPXzyl8l6YxGDLuD4uUwtNQQovpB9qud4DUdbBHlAROkWhmGYs2AvPfPMUtPlsFa27SZCACcG4nrZXgAg==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(36756003)(70586007)(86362001)(316002)(70206006)(5660300002)(2906002)(54906003)(6916009)(83380400001)(508600001)(36860700001)(44832011)(8676002)(47076005)(82310400003)(7696005)(356005)(4326008)(6666004)(26005)(336012)(1076003)(81166007)(426003)(2616005)(186003)(8936002)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5058
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 663c3262-770d-4c55-4932-08d996d7ae6d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D2HXQ4BfjkkWnrF7BiqXX+NoZfKDC+n4CWdNacif4wqktzKfVH8ps493ouPNFpSQZtpZPCT5vPu7qRT6XcnOWFJzAVnKEZaSEooTCKheBqlerSR3/Zavjj8J2ZrnUusgo89vEi09V0OzWhJSrvsOB0RiILcFqBhYCGey2QVPta/yiBmfoif/aAicwnnYuCJYEKrIRbnpoFVWvUpEXxvJH8aYPJv8VcVrQE5XCpsgx1aLRlAJYIygDHDwzjMaZUarYQ/owltc5NJIZTDh9uaCFFDRBPuFZSuCR0PudqfDXYSGUMrcwuW3MqmgORQuSlj/CZjilZxpDCBEjFBuEg5q5249P5Mi8Ft0bvlHxokKW+JvQs334P4lnz36dXpfdg+L90/TXzHpoqRTksnLihJo71gsWk0/UqsZ3lnNVPBO9KXufwjVocru/EUpdFDXluSYV+I6XJqZQZA0VmPJh9HzUNNwhdO4jUpaTMC2vz74OaH+lpogV5b3DvgPFyQ9sSo2SFNsdz4NWMAuZANPVymwmFrvig21T3Db9rJ4PUmREuN+9o1MeADjgXDL6iJ9tWggp3guFHzlzx0yOurkLwmDE7BVCiA6xvn8z20Z9u9Yq4KDxbA0SKCEOcVQSuxhu8VHTt8b1EI/jS86DoixaoQP71joZ/1F6uRr4Klqh2xYsaURWJNKPOB47QWfnRHlHtCNWC901pC9Rwdv9sSV8VpPubSUO1VjvpO+gq/9cBKz6+I=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(70206006)(70586007)(8936002)(36860700001)(336012)(4326008)(2616005)(1076003)(8676002)(81166007)(6916009)(86362001)(5660300002)(7696005)(44832011)(47076005)(26005)(316002)(54906003)(450100002)(508600001)(6666004)(2906002)(186003)(36756003)(82310400003)(83380400001)(426003)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2021 10:19:03.4426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f61f017-17e5-40a2-2852-08d996d7b439
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6925
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This property is used to describe the total number of pins on this
particular pinctrl hardware block.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 0b3eb068fb12..07b00de79755 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -34,6 +34,10 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  apple,npins:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of pins in this GPIO controller.
+
   interrupts:
     description: One interrupt for each of the (up to 7) interrupt
       groups supported by the controller sorted by interrupt group
@@ -69,6 +73,7 @@ required:
   - gpio-controller
   - '#gpio-cells'
   - gpio-ranges
+  - apple,npins
 
 additionalProperties: false
 
@@ -89,6 +94,7 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         gpio-ranges = <&pinctrl 0 0 212>;
+        apple,npins = <212>;
 
         interrupt-controller;
         #interrupt-cells = <2>;
-- 
2.17.1

