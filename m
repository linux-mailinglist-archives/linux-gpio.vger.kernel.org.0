Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9298E43B8C9
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 19:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236512AbhJZSBJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 14:01:09 -0400
Received: from mail-eopbgr40072.outbound.protection.outlook.com ([40.107.4.72]:23360
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233064AbhJZSBI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Oct 2021 14:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylaTf0ZyLkZn+wH7mGglUMw0g/12SLtQ5pxcH1Zeocc=;
 b=BTCYURup5EFBbHbJiHthQWx3yx4+AICiP6UWMn3Zlr3mZecw7vE6uA1GssgqHBfefgah3UOzRODZJNXleTvBfsdGKbyNsSncRBrMr6AQLF1i+LodVfrl4NiKPWB9To7PMR+KdKguQ3pNDBHu9XdHDQfIOTlck9z+D1ZgpiNRryQ=
Received: from AM6PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:20b:b2::22)
 by PA4PR08MB5983.eurprd08.prod.outlook.com (2603:10a6:102:e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 17:58:41 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::f9) by AM6PR08CA0010.outlook.office365.com
 (2603:10a6:20b:b2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Tue, 26 Oct 2021 17:58:41 +0000
Received: ("Tessian outbound 2e7020cc8961:v103"); Tue, 26 Oct 2021 17:58:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d75f0f229240eb05
X-CR-MTA-TID: 64aa7808
Received: from 55488774c6b6.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 24249B87-A19C-414D-B7CC-F759E1800F64.1;
        Tue, 26 Oct 2021 17:58:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 55488774c6b6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Oct 2021 17:58:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXpqK/ptgBxkKTDpxeMnW+UV8JZLphgecEQd8wlDXnTQecxruAKbLGo0QCsBfPM5Tam6umQNwuXEWZvDppdrsBsAL4Nzk9+Rie7PssAKhWRmInP/0gJE5+lXptLY9DoFXuufsfOwqOmTjS8N6lu/OmCMd1HL1Xq2sfoE1jZelWBRD+GwO/oXCq88ahiOsD/CsCOaxnYAEkwZn+BzDXM+q/neL6uyJji2tSroasTdIi//gOgd2GIs3LN9/Xx7QoZDgS0PL96dfNkKrKYUwQKM78knlC7qRc/y6yuW6KBu54FGi4NDmB156DzVfhx5ptKFcyq7UDmKLXWS/loCTcF8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylaTf0ZyLkZn+wH7mGglUMw0g/12SLtQ5pxcH1Zeocc=;
 b=Oj7PU3YcVCW9TUlCezmmo36JfKHXaGbffJC5SRB7WVMDhVGi5OnrTd+/czr8tEDs4aKwvlLgz432yfxgYK6wt9IQ16jZBQMx38eTYW+jNn4xX1giEV4FJLCBm09x1NRt5bfluArAG/rMxa+1i4fuwTQ1XTk7o2Ux9Y3lJv6qNprBfmVjPfHAHIZWL93kDPul4IR4pIRsdMyLX35t5bG00qM7CahwcKsC9n1FBdpIdqPUHvk4bw5wnXsiHKSajNABwpkJdUewWoErbG1LzFL5VtE0+NdayjJqITKLbgtPL8mAFNz8Z3w8/SwjW8dqIo1ga02BKcScc+ypN9LtJhPRlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylaTf0ZyLkZn+wH7mGglUMw0g/12SLtQ5pxcH1Zeocc=;
 b=BTCYURup5EFBbHbJiHthQWx3yx4+AICiP6UWMn3Zlr3mZecw7vE6uA1GssgqHBfefgah3UOzRODZJNXleTvBfsdGKbyNsSncRBrMr6AQLF1i+LodVfrl4NiKPWB9To7PMR+KdKguQ3pNDBHu9XdHDQfIOTlck9z+D1ZgpiNRryQ=
Received: from AS8P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::19)
 by AS8PR08MB6679.eurprd08.prod.outlook.com (2603:10a6:20b:393::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 17:58:23 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::5e) by AS8P251CA0030.outlook.office365.com
 (2603:10a6:20b:2f2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 17:58:23 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Tue, 26 Oct
 2021 17:58:22 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Oct 2021 17:58:19 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:22 +0000
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
Subject: [PATCH v5 3/5] dt-bindings: pinctrl: Add apple,npins property to apple,pinctrl
Date:   Tue, 26 Oct 2021 18:58:13 +0100
Message-ID: <20211026175815.52703-4-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211026175815.52703-1-joey.gouly@arm.com>
References: <20211026175815.52703-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc8129ef-bbed-491b-29d9-08d998aa3eb3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6679:|PA4PR08MB5983:
X-Microsoft-Antispam-PRVS: <PA4PR08MB5983555923B8C317AC8AF2B294849@PA4PR08MB5983.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: YNcVjAbaKT1RNbmBaR0Lm/LliHPHXyRDcGoBFB1+NqEN/Q/8gR90oKTxzZbjwf+JHKQp4FmxxcaE/jalmSr9dHiZd5LFL5Ayf5exi4iNHOUH9aJelEKFjjLVSfKX7Jhp/t0pAzjn5ipPIgvdHzjyTcNIXvLGlTXpyWDF4oIKJqpqIcVonPO3KEMWUnXQXS+tC+LQPHk8SoAZOXQZ05rPVe1WxBrP5Gbw2wOUJpQ8rYXo6sa4b+pI8mNArg+a+w1lHV7EZp6d8A/j0R3EQITSU3lavL/sF23AZ8TATzyJUVbuQwRLU8M2lo2ufK5E1iY7Z+YydORWNZK5n4RGCJpciPOizrRkCxfOf9drEgqGc3mCCtuD4J3c8eSK89BcXndZjWA680MBtV1LdOS53d/7UQeiWVNOfwQddffgV3X9mDu7gsEb3QHTjzUZ8S2d/xUIT6HbMEnOEpHwBF+cZoiFjss7XBvwucKxvd8xN0aaxsOhl/rwZveZBrDYp5KBIE0mMlm9h8xzEq8/kKosb2PC1a5h9JAi51TyKrZ45KRsfWebmx2nKn2UbkRdamjlXil1t4PNc3YcgLQHPkBlOtNpFuiW5dCdJ2TB6u4bhUUAGh11QyQiD00EcPogoWRAJVo18Fb5PbOiFhCYEKLoQR+y8/f0DMwGa7tB2ezsqgazlnoKMfFN1bq7MNOZz1HUzJM/F1UlGIgPBQxa7CdxQOe/8THFy0iI0PqGNaxRU8Po0KH1H7DdaUS0m3I8Gu3fsr2MjBvidbNKvwW4D56quZG22A==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(70206006)(508600001)(336012)(7696005)(70586007)(186003)(356005)(6916009)(26005)(6666004)(36860700001)(44832011)(426003)(82310400003)(5660300002)(2906002)(2616005)(83380400001)(316002)(1076003)(54906003)(86362001)(8936002)(81166007)(4326008)(47076005)(36756003)(8676002)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6679
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7813d464-b1b6-4ae5-789e-08d998aa342c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s6h57qcMkSOnjDskXtuLu3RrikuynMB3BfjlJOzOOt6oiwP1L0BBkKALNeNYwYa2oJvlq4kA5tSLJwr/5LAl/T1Y2zgF1syLnyPhoFV8YSq+MzTo3BLR84Z1v54yZKg5iqykUy5Ncn7+jrzI6PWKlWcA1BxY5DBiZMEaBPRqvFThxE7/Vky/LxSGI2buTODvZ3/FXPF0F9kK9+I2GBAG3QGIJRnHeJUhcrvR/p2DZRhvCFh9stnDYNf6uUXLF8fiIpChB3dmEJaxlXV0ss64u5sUfV+rdFOduwJrXP7Mw7SHTLO+52TX74pcYRb4kaAuDW9cf+pz9+6yMUvihXbSsSLtq0LO1bCbaWYeapx7MF1aihgI6TKqK7ei4CAIyVhmal4iPBrtpcoe4KuYXj8QyCeO8nwfMJfvfLFS0GIuGX8FuXq3TRBqXThd8+/s6cuazfJdFryokRw90JiVPn8mR5SB1347ukM5mPW23CyoCcpehwb0I5x1vAtILPoIWG6bTvd+Lu2X/qO37Z+Zoaf33GY6V+pMPX9ab5Ag7EzAzhuOLO8bj/Jr+mq1Jk6Z0QjSBiUg5zsz1w6R9vqYNbZk0ZM3Nc3+tRiqzfSTBi0+8v3GP/xlEpu7XCCLCuCyjXpYUJEZh5C8RVV7SFOH7cHlYYwFwDeKcJVINM+sZGkTWObYR0N5LT5OfKk6Yp+TZAFLf4Bka9KnaNCVU6ZZwyFqbunUA/jvrepeGnBLxJlDxJU=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(450100002)(4326008)(7696005)(82310400003)(6666004)(8676002)(426003)(508600001)(6916009)(336012)(1076003)(81166007)(2616005)(26005)(83380400001)(44832011)(47076005)(70586007)(70206006)(36756003)(316002)(2906002)(86362001)(54906003)(36860700001)(186003)(8936002)(5660300002)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 17:58:41.2617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8129ef-bbed-491b-29d9-08d998aa3eb3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5983
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

