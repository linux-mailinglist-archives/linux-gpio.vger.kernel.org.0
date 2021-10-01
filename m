Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF01F41F590
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 21:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239324AbhJATOd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 15:14:33 -0400
Received: from mail-eopbgr60086.outbound.protection.outlook.com ([40.107.6.86]:30276
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229753AbhJATOd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 1 Oct 2021 15:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uma64sklGCAfaa9iOI/k8ykCda+7LG4ns6cgg/K6OHk=;
 b=XyQe6BGspJP5LWKsswtX6u9EP/wgsxnlVp43Gxl5Rbws/y7ak+P12D/7+eKZpLshocr1351ZIkZKBs1vuQcAIqYBcE0wXo4xkiC9XGkm6HEgpDlSBOzB+LZXy01oUgCWdbi76r86Ktf/uTEaOGpFoRex6vt9q/p0iKuY9YYeZtI=
Received: from DB6PR0801CA0045.eurprd08.prod.outlook.com (2603:10a6:4:2b::13)
 by AM6PR08MB4120.eurprd08.prod.outlook.com (2603:10a6:20b:a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 1 Oct
 2021 19:12:45 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::99) by DB6PR0801CA0045.outlook.office365.com
 (2603:10a6:4:2b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 19:12:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 19:12:45 +0000
Received: ("Tessian outbound 71ebfb754289:v103"); Fri, 01 Oct 2021 19:12:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6711d3fbe058320c
X-CR-MTA-TID: 64aa7808
Received: from 9ada1fb00c80.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0807C22B-B17D-457A-8E5A-8183A3C7B0A9.1;
        Fri, 01 Oct 2021 19:12:34 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ada1fb00c80.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 Oct 2021 19:12:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIexyaxUyfnBz9no4NJj1KEHdwAO4FswH6kFcnur+WmY1c22j8U4YjqZZO9cPzIVpHtIu0afKXkyqHPBKe9cw0oNSDfYb3Mxv5jlkMWefn7C97A1pA/YxKW3xYi9Cpl4O14UN4jzlE0ED6ECbFrKHLpmLzwrLeF7YeNyWmyJgcZhUO0P+TlFGGgHCc3I3LoRG4Xed9pHpZSrYDL/igcNuiP1+nclSyAb1fUxoEXUyHSw5w/ABN3ouegq3Wk2j9iHAzsUVnbjP4yvXZUj3Ke52yND2gcqRS/b92ZxLUelE2CRhEXzO4lJ8R6l1w2pY9Sko15sclYP7GAmGK4n1UYwuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uma64sklGCAfaa9iOI/k8ykCda+7LG4ns6cgg/K6OHk=;
 b=RMNotEkh8PMTgIbdfB7VAl4dcLc8vFo5LAaHr/wQHsVEZ6JCl60cTyEaHYFFzA5CstduqGMqnlv/Y1KMOZ4MbhJFJeooTt0CjUkdk6kEZGCGBNaJsk2ZuGxEu+X662WnjRiN25ukgpIWZ+Q9xKzF7Ryd2LbDWMvEvhz20QqMR9sz9lpsy6BBNCPUzQa60P6i6cuX0mx+Zprhurio2SAGyFcCPSoiiQs7mkyMl84N4Nj2FokGOk7HyHR/jcLmHSaRsrVwmdpk6fT6rJEjfoHVNQhYgZmW7bvuIMBQxLB4+mCl/bzpfJNlEbLZog7UjZWfm7UqksNDvVgu+O0x+eoybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uma64sklGCAfaa9iOI/k8ykCda+7LG4ns6cgg/K6OHk=;
 b=XyQe6BGspJP5LWKsswtX6u9EP/wgsxnlVp43Gxl5Rbws/y7ak+P12D/7+eKZpLshocr1351ZIkZKBs1vuQcAIqYBcE0wXo4xkiC9XGkm6HEgpDlSBOzB+LZXy01oUgCWdbi76r86Ktf/uTEaOGpFoRex6vt9q/p0iKuY9YYeZtI=
Received: from AM5PR0601CA0042.eurprd06.prod.outlook.com
 (2603:10a6:203:68::28) by DBBPR08MB4872.eurprd08.prod.outlook.com
 (2603:10a6:10:d9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 1 Oct
 2021 19:12:32 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::c9) by AM5PR0601CA0042.outlook.office365.com
 (2603:10a6:203:68::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Fri, 1 Oct 2021 19:12:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 19:12:31 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Oct
 2021 19:12:30 +0000
Received: from e124191.cambridge.arm.com (10.11.7.12) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 1 Oct 2021 19:12:29 +0000
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
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: Add apple,npins property to apple,pinctrl
Date:   Fri, 1 Oct 2021 20:12:08 +0100
Message-ID: <20211001191209.29988-3-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001191209.29988-1-joey.gouly@arm.com>
References: <20211001191209.29988-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aec8b99c-e49d-4c4d-aa15-08d9850f7357
X-MS-TrafficTypeDiagnostic: DBBPR08MB4872:|AM6PR08MB4120:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4120D1C3A025972B5B591A5594AB9@AM6PR08MB4120.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MHCPNKAiytGtG/tbzunz408OZvix/JxErHi/ZBahZLWitm0qc6QsUJ5k10RVZ9Mdw1knwzAu9PAaJ9/HN4GBbKvpz1Shjd91xg8Gla7cgpkCqT5okkkCfK4svZu1twjq+EQXIJVQPcXun+uTBf6ixyY4ZgWidOHFO/2VanFUxkIuQ/iUPnXiEmfwGjNH4e3Lcx4nkPFABa6iDv7JEwJVi4h0TM7gNB08lTFD6ycKKItcbod510vRgmmIhdawDVZfWczRlVSpdls0MHa5WIYDq6h416IXpwpNMkiABK2asJBdrCx7K1n8wQ7BM9hFa9mfzSd98d4os9+rr2sQzpYEgJJr7gXXv2jlnM29DDbyIdrSO+vxjTvtzNRIRUvGrIEayu9U2ebq8Kkc/Jf4AENecsgJ0lUVDz1bleprLbMpH73CsMnragqOwY2j+DaEonSVejKbMD2X5hIT5zaYzJRIIzda68haT1+UMe9vy6HbJnUyeno+NoQe+2ZzXFHDU6Ffb5fk8UOOfw3qHuQqjiImwfb3pHuTmgtPJiAVTYiARh0+PAx3pCjh2On9QguikPBoVpR/vHbsFr2+mrurLNNeWcVxEA69U175qdcTSyDrjcwk09HRz7GUb4OsMgZcv+K/5OPgHlgNJIH4GhjUpsezgr1TGVfP9bnFhfSaHNsgFENqLTi1EpoV7ioBE+AWMFAWQwWcEQxg/RWGNKAkN4oNzUGOpzYZSserNNNPm0wg+NL0OVENbfDRn+ph2KhPT3rfun3J9i4Apu67AXQf5K1NPg==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(336012)(4744005)(316002)(82310400003)(2616005)(6666004)(8936002)(4326008)(426003)(36756003)(1076003)(36860700001)(26005)(508600001)(8676002)(54906003)(7696005)(86362001)(81166007)(83380400001)(2906002)(47076005)(44832011)(70586007)(356005)(70206006)(5660300002)(186003)(6916009)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4872
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e154e1fe-e3b4-4a0b-3b5b-08d9850f6afc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HbjDrpOU827BLZQpWtDESOPaDziOLXP6XpeW/r5XxkuDkXeDw0OsQmLUH07o87UTaw7V0pln4CPqJu19v9HNIlgE4a3YazHim0G256qpMbcFG5VkLwTAPpsJlj0SOMJrKb/yz48ia2l0P2qesNZPKN2wQfBW8F9ROL7eV/5KFlpu3vDztuehAZ39IRPr8wvGie0c05SyPHdsN43gxZFr4Z6YzNIBJG8km5NN5dJisVY96SY1Hc9kJdwpg56bSwJr0r5XG6gVXBtyL28KhLb0mPM9icZiSUzSc2U0mFo1ouCTK+b7YltD73hlkgy4MA/Cg13yVuIVFPfM9bCu+5a1CKNkb9zwZ12grdFUGIazPAxYGQA8f6252NTGe2Myqa5Tyh6y8YhF/fsFNhxVsA/bra0rnjQxoCv2mQ4iH9KAIxBqf9NmbNYxcxxuHRaVxVCTLcQJsImGkV6j0+oj5CylZmOxige3OYI/InnsH7Xb6dGyjC84wfhuu806fCWvUXW1J8b8kCUHCEx3hJtd4DfmQEmylnye6i3OI8xpa0Crl0PZ/wWuNVIdxYqdSwKnmgBvscmvx1hAcJfXPIyUqfAk96H0gEYfCM23aCP3i0sFt3Jel3djycbHta0VkgZMv/F819dBx/Q0fv+YtHmPTLXPVbXSckOKuyWPq58y1kcuvcS3JxhL8h9OfA1Wz1hCDd5GqJjVwzVHwpDKIDPfgUQaV2hWOHTIl8SJ+2qSckP7FHE=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(82310400003)(86362001)(2906002)(44832011)(7696005)(8676002)(36860700001)(4744005)(5660300002)(47076005)(83380400001)(36756003)(54906003)(1076003)(186003)(4326008)(2616005)(70586007)(6916009)(450100002)(81166007)(316002)(26005)(6666004)(8936002)(508600001)(426003)(70206006)(336012)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 19:12:45.5674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aec8b99c-e49d-4c4d-aa15-08d9850f7357
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4120
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This property is used to describe the total number of pins on this
particular pinctrl hardware block.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index d50571affd1f..cdd8cb454e92 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -34,6 +34,9 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  apple,npins:
+    maxItems: 1
+
   interrupts:
     description: One interrupt for each of the (up to 7) interrupt
       groups supported by the controller sorted by interrupt group
@@ -86,6 +89,7 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         gpio-ranges = <&pinctrl 0 0 212>;
+        apple,npins = <212>;
 
         interrupt-controller;
         interrupt-parent = <&aic>;
-- 
2.17.1

