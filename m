Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB5343B8CE
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 19:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbhJZSBM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 14:01:12 -0400
Received: from mail-db8eur05on2073.outbound.protection.outlook.com ([40.107.20.73]:1344
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235574AbhJZSBL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Oct 2021 14:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXILVILTDFw9KcK4bZglomKfLH1xZBDzq8Obes8oJpM=;
 b=IpAMOQw6hKovQXYT8ZOvAuZIcRTG2FmtivT10Y3MsnwEHdNvGktpCqSKtS7Xgzhch0HZ9k+m8dRNgX+xNfzGwozsE96zMjL0XOdZFQoqfi1OZ1bZiFmEZXlCXeADRgpfA7vLS24JI2qyBhQgr99ANhRcqdgT14FXXuF859RejTA=
Received: from AM5PR0601CA0040.eurprd06.prod.outlook.com
 (2603:10a6:203:68::26) by AM0PR08MB3459.eurprd08.prod.outlook.com
 (2603:10a6:208:e2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 17:58:32 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::c) by AM5PR0601CA0040.outlook.office365.com
 (2603:10a6:203:68::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Tue, 26 Oct 2021 17:58:31 +0000
Received: ("Tessian outbound 2e7020cc8961:v103"); Tue, 26 Oct 2021 17:58:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b82ae6cf0a455c37
X-CR-MTA-TID: 64aa7808
Received: from f3ce088b5b6a.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id C593AFCF-6718-45A2-A8F8-7E35596FA3F7.1;
        Tue, 26 Oct 2021 17:58:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3ce088b5b6a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Oct 2021 17:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMq7/EtWL4WgFy99P6rEqeZmXHKLMCqyUIb19GDZQPqM4Mm/8+lz38xhlBvAK08/SxUfnRnDCARGpF+75UOvM52gSe87VoNdbbWHrbOfLEZ7v2TMMStIXuXzaRiMWnc4kArWhmo32cBltOXj14rB9pT6uB2Vvl8IAKnaxsi28t8wUEzS8A4FffguRv6IY1AcQ5GztTMtxBJbmYbyzs58gRXiJdXLwUfl1+tTJT3SEwC3m3pngf2pQVAtZNyZ2IqXSvgDVIJkJGIaiaedo5vTtJ4XGmO6gWQl1fqvyn/pzO1aWhL40Xl92AdYzKJIdDAWSG1p4cKJZ5qhm8e1Bdlzig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXILVILTDFw9KcK4bZglomKfLH1xZBDzq8Obes8oJpM=;
 b=YwTc5VZTkAGgFEut5zShJH8XsrULFhQgJUpg5Qp6RkWqjHnQF+0hUBJgZ6JnZK8u11NR8KysEeOs3o/1ZSTpwm0V998Epc1uxWynKFgcdl7DwYxLKZzxVKQIBrnHagZ7TIE9y221rqAi39hh9PcpCsS2CUhVBLYOPaDizxxja7imadyAXJQkHckyEG60W3lAaFSCFQsoMZCq7ndEeS+F5mfeie4x1xI+aYMZhBYyT9MaK1gA6BK/KlHNX1C94TOMoqbOySS9Msh03O8u5EoaX8kRyb7V0D0HPROtn/S+onzJ1wQoB/hcmqW17FgBousrEqSvIZjcge8cNXOTSX7wHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXILVILTDFw9KcK4bZglomKfLH1xZBDzq8Obes8oJpM=;
 b=IpAMOQw6hKovQXYT8ZOvAuZIcRTG2FmtivT10Y3MsnwEHdNvGktpCqSKtS7Xgzhch0HZ9k+m8dRNgX+xNfzGwozsE96zMjL0XOdZFQoqfi1OZ1bZiFmEZXlCXeADRgpfA7vLS24JI2qyBhQgr99ANhRcqdgT14FXXuF859RejTA=
Received: from AS8P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::23)
 by DB9PR08MB6412.eurprd08.prod.outlook.com (2603:10a6:10:23d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 17:58:22 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::cf) by AS8P251CA0003.outlook.office365.com
 (2603:10a6:20b:2f2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.22 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 17:58:22 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 26 Oct
 2021 17:58:21 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:21 +0000
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
Subject: [PATCH v5 2/5] dt-bindings: pinctrl: add #interrupt-cells to apple,pinctrl
Date:   Tue, 26 Oct 2021 18:58:12 +0100
Message-ID: <20211026175815.52703-3-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211026175815.52703-1-joey.gouly@arm.com>
References: <20211026175815.52703-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ef64f2e-64d2-459a-b822-08d998aa3909
X-MS-TrafficTypeDiagnostic: DB9PR08MB6412:|AM0PR08MB3459:
X-Microsoft-Antispam-PRVS: <AM0PR08MB34594E55EAA6008E80BE415994849@AM0PR08MB3459.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 6H7M2tNYEb16W4i4TQ6xzi1/GrY20eSKg7zFmET2/Xsvk3Z+/uAHQxQXOQS1Fn5K6IFvfwYX9FtC5rzlxmhDFQJwktjATlbPXm0GN0U3OQfvDfdkeWnxhMO0T01ab7hC59WsdpOb46sP2ZnGjSYIItTjkLZlUtqjB+fpXqXbwene9a4AQMqX08g2kXniDSDW0L7bldlntIn2mEjAZQ5x+0oo/a/KpP9cOt1QvWO62LbEBpOC9+Aks3wFr4KKeiEflbMcca64Z5SRCOHoaf+RTHhcR4+DCSmq6ncBbE5ijqu50uPvNYWGzrPAgywkudHlLfcmLoTtlsswM+FSnmgnO3h/0hUBaT/0enclbBpSQ93j2d84e/n2oCtyzMYfShHRQhOkOLkW15FE9u5sZDCf+xlsUHxfpkpR7FZRV5U6hezEkrhxp86mxBPNoJsmZsD6E03wi25GS8muZkwcj9XKUnR5jkwkctz3fSkN8+17MEtX7gQLO3ISVik0/iUIyCIOaJlQ2iTD790clnYBPMQ/tG2vGIH5PGRpUBI+sRSzZUSpzp4PUhxZRRfBdwZH2uLymWaA1WoJrPxMZLCD8xJDsWjgPV9R9mPFGsEEWpX1+9acxTudSIyKiqa/Fgvg4bH+ZZPTuFboDzuY6trh+2tLi2GCSTzgqARCN20064lIoP5gI0u3JcNHlyj/plgounPTxcxWEo/DqeYYyDt7pSWF1CP8cqTgIla78qBaUvP10GLz0N4Dhgx3KgYcHhi4gWaIgQnnlh+iGcOl8t+LUdzDcw==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(47076005)(70586007)(7696005)(6666004)(186003)(4326008)(86362001)(1076003)(81166007)(336012)(426003)(82310400003)(70206006)(2906002)(5660300002)(356005)(8936002)(508600001)(26005)(36756003)(8676002)(36860700001)(316002)(54906003)(2616005)(44832011)(6916009)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6412
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 83763a16-ac9a-4f1e-5ea9-08d998aa337f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C9q6nT73DCfWUSGIeCpg2IB6z2YaaBCRRWSYDTLn1TpV0Mb1WV6zd+JjkY/kKKs3cwLFxRk30O+tFs4ocLynrE9GYfwquelXWqEwQu9GJCxmnLdNin1wHiREVQQ7FCyWykEWq8Ia8stY5A2opDp9hzI3w3FuUFLIj25mud01t3UJlNwtJcIBoCsOLEEd4cG+f1DfpTGUwFDCI9SsPPVGR6b+/EM8TqoCEGBmhNFDmsEayE1mo35QxkAX1PnE2BTz0bUxLSy+MFlMxyJ4MQ4d9+YMsmD/z9gR7NlkKTO+bs5RIk5QCjgpv4N+czk6BZPmEKnADNRK653mA4sf3+XHRvs4JO1L0xYbqpLIlVQBvTRmwhGoMpItocQwfEaGaSDsIxn07YTvDmfTRXonj+7rv2swVghy4p6YJhDCfJtwKfs1WeybYtl4zIdw+d+iYjRFSPkXwDUGTwx/3uv3Q8GrRAM6iZ06l8gSDrNHjPUAYOFi9LvQgXmkmG4XSlAKoir4QRAMLsEflkBY9P7qYlqDxiGaC1FE22F6+AmJexM9ZI+Z2dnClN747AsuBw9tm3o54BOZpNK0aRlrppONMwPj4hfzkqAMoND/Vp+3aQ3824uG4/ytm4JHp/lNKnF8gIAMkf94eBGvO2y+fPfC+LznsSfFgnVWB1jZys4w4u88+5M6K7sOXITWbCv2ViyQ62GIViFEXG5EKdYwM7IbBa7SBoORZjwYdIIL6a7D1vSCO/g=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(36840700001)(46966006)(47076005)(36756003)(336012)(1076003)(2616005)(81166007)(44832011)(5660300002)(186003)(36860700001)(4326008)(26005)(86362001)(2906002)(6916009)(70586007)(8676002)(426003)(450100002)(316002)(54906003)(508600001)(7696005)(8936002)(6666004)(82310400003)(70206006)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 17:58:31.6917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef64f2e-64d2-459a-b822-08d998aa3909
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3459
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

