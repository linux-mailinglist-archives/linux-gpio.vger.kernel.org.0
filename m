Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 059C243883E
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 12:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbhJXKV3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 06:21:29 -0400
Received: from mail-db8eur05on2058.outbound.protection.outlook.com ([40.107.20.58]:42176
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229868AbhJXKV2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 24 Oct 2021 06:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXILVILTDFw9KcK4bZglomKfLH1xZBDzq8Obes8oJpM=;
 b=d/c7VndaweCfFTOE574T8MULdtclIC1uwirH+1faFT7pUlUF136zfhyagyTnR+AZBOAfadNd76/Z0bzbHJsN0XfpISu7/YIp8xsmnhaJa/dVFrmiMOorULfiIvFUU+KzGN8VizNckoPE5fISQA+UQ8uer5MB3uvnFCdmQiKPofM=
Received: from AM6PR05CA0032.eurprd05.prod.outlook.com (2603:10a6:20b:2e::45)
 by DB8PR08MB4122.eurprd08.prod.outlook.com (2603:10a6:10:ac::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sun, 24 Oct
 2021 10:19:04 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::ac) by AM6PR05CA0032.outlook.office365.com
 (2603:10a6:20b:2e::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Sun, 24 Oct 2021 10:19:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Sun, 24 Oct 2021 10:19:03 +0000
Received: ("Tessian outbound 8e26f7114b75:v103"); Sun, 24 Oct 2021 10:19:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 78d7008e8b13be26
X-CR-MTA-TID: 64aa7808
Received: from 273cca4fb8a7.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 86901105-E65E-4497-A550-F1DEB24B8C7F.1;
        Sun, 24 Oct 2021 10:18:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 273cca4fb8a7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 24 Oct 2021 10:18:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Um3DtRQ5o3xQbsfDMAZnFK6aF0/GVVO1CXT8ikS+2LeYjhrPFHX50zhh5V12Mtn7fxJ0x1FPH4LEbIKTW/5vhb5bZmOJmpSh2k3u5ADJfKqjQHJBM0cE9FDTFDByWXFTV56J0TXw2PoNjC3U52RGCh17kMEHZEqnwacggpFH9m5jSs3WJMZgkbN7e+v0VkTv49jkJqit0ekFbmJ7VJ39KxtPT+c54jCGTWMmmzN0esv8f2xfE2GhFXh9s0GFYL76hW7ZEZg9xYQAeP0ib7YkPAVmNtnjdX9Z/1qUX0lXMfndN6JTOCR6BF0u24CAMIXLzSFInk0mITBc0Ho2us9QGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXILVILTDFw9KcK4bZglomKfLH1xZBDzq8Obes8oJpM=;
 b=WMOIacv3AacdNcAG8L9wk2WxlEO94UJ6ncYfSZw0zFfegYcw+HQaw1P/CYAurOAa/E7Vy9F4x/uw6pzu0LrSV92xmcQTzTjyGbypRwXtuayhxEDTQniAKO3kPM2neMcjkP/a77/GmtIhCAbr6HYSmkeMpSLtcwox7eTEll3nH5C/07siUWeHJkAwF48IAA975YnOmxwjqeOPFQER1hDrg8LprO/R8SmoaTri6ljZigUbKkrzf4F5TLdkXJFGlpk3ok2Y3GeNM7IW4lYDjcp7O4JlHFWICTtCP7cCjbWrs2lo3iUZ12jcnp0cDmmcaAijSv7gAYpnVTLWF3ghVCefnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXILVILTDFw9KcK4bZglomKfLH1xZBDzq8Obes8oJpM=;
 b=d/c7VndaweCfFTOE574T8MULdtclIC1uwirH+1faFT7pUlUF136zfhyagyTnR+AZBOAfadNd76/Z0bzbHJsN0XfpISu7/YIp8xsmnhaJa/dVFrmiMOorULfiIvFUU+KzGN8VizNckoPE5fISQA+UQ8uer5MB3uvnFCdmQiKPofM=
Received: from AM6P194CA0028.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::41)
 by GV1PR08MB7315.eurprd08.prod.outlook.com (2603:10a6:150:1e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sun, 24 Oct
 2021 10:18:54 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::2f) by AM6P194CA0028.outlook.office365.com
 (2603:10a6:209:90::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Sun, 24 Oct 2021 10:18:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.18 via Frontend Transport; Sun, 24 Oct 2021 10:18:54 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Sun, 24 Oct
 2021 10:18:53 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sun, 24
 Oct 2021 10:18:50 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Sun, 24 Oct 2021 10:18:52 +0000
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
Subject: [PATCH v4 2/5] dt-bindings: pinctrl: add #interrupt-cells to apple,pinctrl
Date:   Sun, 24 Oct 2021 11:18:35 +0100
Message-ID: <20211024101838.43107-3-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211024101838.43107-1-joey.gouly@arm.com>
References: <20211024101838.43107-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d06ebc5-6c0e-4d6e-3f9d-08d996d7b459
X-MS-TrafficTypeDiagnostic: GV1PR08MB7315:|DB8PR08MB4122:
X-Microsoft-Antispam-PRVS: <DB8PR08MB4122E16EE0D4D24FA1AA95CA94829@DB8PR08MB4122.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: IkrWF2vjExRv//YPbagP60h5SnpiRxyWVDLzZPX6daFvimycV1EPvz8MJGeHrqLwD7Zm9xJf1YjcMb+5GhrdntKBm3IakUPJeY3vepuMYy22uFoSZasWY679/xcNxZgzKPeuooOnH31hcX+S4Nnn6Foz9nBgnf0YryLz/6djX0Nmqi0GAW+/h5z+ux7kjM4+QYmHeRCUZtqQKr1IS4vEXeSgVsguY2L38bLw9JM8ADAF2f5utEXwJOoeP0ZjPcwFHHiCPeNxHATEpl7BHDNt5OZXAEobA/kfqL/C/+kxb2/TB7dHoi5i5HitVJFHMEjMBauYaRpGBj8yjAoXQZ0rGfyWEhFORa6J+QWtdmyAPDSsaG9NO6rHpLznS+1hf2jER55tpGE0GlagwtEE+Oty33AXYWDI842rnmpnbJkxTq8gbsS4OQW77kT3weGHYYi+dOdguKue7iKh3Bc+NFWJjFN/w3bakC6FUNo2tZEQOC5cve7PtiE/+ke5SPDbXDUx2Nh2VAQBPWfIfIzCl8Uh8t5o5dM0CtrY9DrKa6PBM/OStSw/OwlkX369J8mS38RoV1V/4/mclS2HKrHRLCcDEAZR0wS+e8A7TlpurUYnFwJ+GUIqIAhVKYf4eFIwQcUVDKoyxOMMo4iSEwWdxUksA/em6Z30fXrzMAaMZDO0u0OlZK8nVXShyPa6dH6hl5m0TY+65VUsxuQExnWSKlK7hs2aCq+3JnOG5fEma+29dgmJHml7ju6f+o7YTLxdB7GHiqGl/FWUjynqTFmWrZnv7Q==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(26005)(1076003)(186003)(8936002)(54906003)(426003)(36860700001)(86362001)(4326008)(82310400003)(7696005)(8676002)(356005)(316002)(508600001)(44832011)(36756003)(6666004)(6916009)(81166007)(2616005)(5660300002)(2906002)(47076005)(336012)(70586007)(70206006)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7315
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1960eb81-cde6-4f02-d106-08d996d7aeb4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s4vratQm5EveSZmiAjB0gYSfnp/qgNAw9s8mYheYc+GiyQ1Dosno3DNDmNBcrvqi/R+UrMo4gFBze+ul8NbvGPaeYTo5gDYQrl4/wcqGPNhdk0OrLFn92OeGRGsQ1B2dviR9DZFiFMt1PkQyhhtucf2fMaKg7LbiRhPFIh1rkIv96PNtpUUMxaoGRFL7cFYKJ0sMLaptcBearpz7rKRl5pCEtLSw3nEa6wKJJ6ZVqBfez1+I4E0E1jmWpeYGRMjAYRBWWH2zDxbtJjjGi3EUMR3J5diQ+QEDRzFWhVVEBdlRiqHcUFcFCawVtknLm5cZS3h3XE0ocvXgcx381VlRFdfSZhZFmp0jZwDUTjfosDGRnVUssw6nw6fLGx+yFc2gpeMYwSFZGXz1/zSb9HA7kyb0uiVbxzu0lw/jUT2EMufqiSf4yN8ejaGoKZI1SZqeNLSCuM5tRRPlcYyND0Ljg0wwf4gJ9Hrbvu6XPdt2h53jvMqDolmtqnlSGF0IpYYpSc7hTbWEFxA90sqREu2Y09TfoBz1p3u/GBt6erJEgsOSYsoXiJOfRqw+ku5OSjH0KSLcFjk+1A3Bo5wiXUJByxfVkpSGeIj7AeynTZPrXSKJHbLUspnuUxNiNAQSdFkdJmSuQAQRo0NflgsDswtkpdhfNBYw5p3nYQtBeDa5cCBMmO8KJ2SOxlgkIraxju0UD0JyOaAC+ei5KDB3qjHJV044NAyYVIFWkzb7+9LwzRI=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(1076003)(26005)(186003)(8936002)(54906003)(426003)(36860700001)(86362001)(4326008)(82310400003)(7696005)(8676002)(316002)(508600001)(44832011)(36756003)(6666004)(6916009)(81166007)(2616005)(450100002)(5660300002)(2906002)(47076005)(336012)(70586007)(70206006)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2021 10:19:03.6011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d06ebc5-6c0e-4d6e-3f9d-08d996d7b459
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4122
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO/pinctrl hardware can act as an interrupt-controller, so add
the #interrupt-cells property to the binding.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Sven Peter <sven@svenpeter.dev>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index d50571affd1f..0b3eb068fb12 100644
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
@@ -88,6 +91,7 @@ examples:
         gpio-ranges = <&pinctrl 0 0 212>;
 
         interrupt-controller;
+        #interrupt-cells = <2>;
         interrupt-parent = <&aic>;
         interrupts = <AIC_IRQ 16 IRQ_TYPE_LEVEL_HIGH>,
                      <AIC_IRQ 17 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.17.1

