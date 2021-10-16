Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB56A4302F7
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Oct 2021 16:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244371AbhJPOVY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Oct 2021 10:21:24 -0400
Received: from mail-eopbgr80078.outbound.protection.outlook.com ([40.107.8.78]:14243
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244351AbhJPOVT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 Oct 2021 10:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p73EAFNGNj8UYXZZs0dafDR8CpElg2SmEQ6iUSLrqto=;
 b=TlIL5UxcDKWVln+Js2Q/XAjbG1GxoktQ3aSAM0tgkTpDN84e4yk45wDV7DcDLNGKM3o1IVTxI8oofi1AIzW1Y/FbounAp4xa0XNdk4+eKVIreNNEOE2HBg1q0xmsuScprGP3gAv+a58iXJDj1QZ8IvYe5t/uNEXktDnMe9FOkrI=
Received: from AS8P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::7)
 by AM0PR08MB3186.eurprd08.prod.outlook.com (2603:10a6:208:5d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Sat, 16 Oct
 2021 14:18:56 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::2a) by AS8P189CA0016.outlook.office365.com
 (2603:10a6:20b:31f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Sat, 16 Oct 2021 14:18:55 +0000
Received: ("Tessian outbound 8e26f7114b75:v103"); Sat, 16 Oct 2021 14:18:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bae73c1c4349ef5b
X-CR-MTA-TID: 64aa7808
Received: from efe5793f2165.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5D394895-76FA-4209-AA9E-999B0DF7E9F2.1;
        Sat, 16 Oct 2021 14:18:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id efe5793f2165.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sat, 16 Oct 2021 14:18:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDXIlRtyzqiiAH0z06TF+40Vwew0VnvJwiurjYrP+4V70XksH8/UF1cwmcmNdNj67Vr1MC8bqwIqkLDjd2FxHC+c2+64CoO4Se4nKFRU4PDAijSFnZhRUlgD0fX9qDgYAo+ZP5Sm+D5I0oYVji7oD044ZTwbHWuPH6LkwSm2ljkHyd7MtXPgJQMlqHxtJKxr+DnS06N79fn3O0wpEdMAPkEumLHXHEkABaMatnPjhRI5UuHosVaqGO7PsPJ2lX0m4Il/pfT+LzMzth1GKfWs7sk0DK4sT8qvmR9iT12K2J9J8hXS+x3gYHKbp5DRrAgFYp/QHPOwK5Nz2GutDDnFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p73EAFNGNj8UYXZZs0dafDR8CpElg2SmEQ6iUSLrqto=;
 b=hwNnVPGTOYNJTN48012j7umAMpWqWjGPK5taPoZrjxpL3CxTRSsBKWJ512y99hTqKN4UWTP8j7T+kBgMV3A5+U+zngDGfGI6mhi1AYN3weKvrAndJ1ez7PQbFHmeN92ItkBFpelF6LDMRKfP11+MvKnJhJsIZvMze12GJ2yloM4rt3jPQV21gojroJJAI1mzuggzdTyVowwBZBxn4tS3QLq8LYomQokPNQvW4kF/lO6HlsjiOM3oxzaNUoPdlEiPo2Q1KmcCpl55MOi01B0zhFlnDD7y3GlINJ/2/oC8vjibXXa3cfrxYSbQYICiQyUlnbU7mcZHD1SZZI4MkfDbUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p73EAFNGNj8UYXZZs0dafDR8CpElg2SmEQ6iUSLrqto=;
 b=TlIL5UxcDKWVln+Js2Q/XAjbG1GxoktQ3aSAM0tgkTpDN84e4yk45wDV7DcDLNGKM3o1IVTxI8oofi1AIzW1Y/FbounAp4xa0XNdk4+eKVIreNNEOE2HBg1q0xmsuScprGP3gAv+a58iXJDj1QZ8IvYe5t/uNEXktDnMe9FOkrI=
Received: from AM7PR03CA0014.eurprd03.prod.outlook.com (2603:10a6:20b:130::24)
 by DBBPR08MB4760.eurprd08.prod.outlook.com (2603:10a6:10:f6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Sat, 16 Oct
 2021 14:18:45 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::c4) by AM7PR03CA0014.outlook.office365.com
 (2603:10a6:20b:130::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Sat, 16 Oct 2021 14:18:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Sat, 16 Oct 2021 14:18:45 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Sat, 16 Oct
 2021 14:18:43 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 16
 Oct 2021 14:18:42 +0000
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
Subject: [PATCH v3 3/5] dt-bindings: pinctrl: Add apple,npins property to apple,pinctrl
Date:   Sat, 16 Oct 2021 15:18:37 +0100
Message-ID: <20211016141839.45460-4-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016141839.45460-1-joey.gouly@arm.com>
References: <20211016141839.45460-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1f45995-fe7c-4f19-081b-08d990afe344
X-MS-TrafficTypeDiagnostic: DBBPR08MB4760:|AM0PR08MB3186:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3186F798D25829F0444ECB3894BA9@AM0PR08MB3186.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 6q0HTJsbAvV4qmgMygLeaiZo7m/H8qhNuXnuJoKbfqGHArwnOnj/cm885IuHROUSex9rel01PkjQaj2i0zUmiA1tRFeAhDFIy/X6TwizcIgTUl2TA7dEN/NAuJGpWZc8nLoOv/875TJm9GCEhrsTQAcWGHKgLvbKr6Sxsr+Mq6oRj0cnpL8Vrbq6z06aWbiabteLp5GHgC4CiuBpTQ95ejiJWbGYs9VpMejkKHZAmFpev99+DFWlvNJE+Pkkzrf607nxj2HlSpfvXiWJI7Ah1dfd95YESt5FTEzOfVzFBp6dJ2ZkaqaeXX/3/lvjEudA97T4zgrzP7iEwMFN9WWM17Kg16GcGMaZ3Fxf9TGz0/clamqeVz51ZT7dRbbd8QgyrX4ptYwKtx/SmO+kh+3Cp0jwDJ6vecNaUgTrDmwM/nUTQEUhWVEX18wIlvwyC39rv99wfaiMZxawFgsOm66yFT9m060rNGI1TzBLBevqy0v0KsHo831wBMPK7E1HAMB4u3ps09uwL8tah+3Zxs0ZUhdpS7MQQHqeRX1fIETs7Na8uFxTuCFuTJPdiGLZfeqIDWAp6hPlhWv7yMOBuk2fX71yijUIeD4JWLwVabTCBfUTpvdj0DXRQM1FVqHfHxtioQsYFekSMce/q/m0lZqkaf85UkjmLsiS8mAbYzA9fZN7RH54kprSahuGk7VDbkPkCbcUqAHOrbOUqPSevHPT+dOGTd1KMZ2rZaiRWTpmGws=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(6666004)(86362001)(2616005)(36756003)(356005)(83380400001)(44832011)(81166007)(336012)(186003)(2906002)(426003)(82310400003)(54906003)(1076003)(8936002)(6916009)(47076005)(8676002)(4326008)(70586007)(316002)(36860700001)(5660300002)(7696005)(508600001)(70206006)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4760
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 477f7bee-cf51-45b9-d9f9-08d990afdd02
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bfuhyWr2PgpujLd9vs/ybgAFQ6WTNXWtqfxrqQeDyyX+uNFC0zwe2V7qU5gZC/at3DZqPO5smhRZczVGHfu5/xPEqWSIQUJaDYmj03WqTjL8AOdVkcbKuPVrvomiXahlR9VQra/TpKpaG2GnbNDQQXwpykKx11FtnFfXqFNz3yHc1QA/fyqh7D6+hKbOV3FgHIB6hlbxVdGbgsN6sHNDb4Nk+9uNeVNVecXrcoxo5ADA9POXMrzzk2F1QdYsIgUnGvfY3H9BwP92CF0Yu7cGvh+EyMmaMRJkQTQPSp+VcY3lVJU/o95Bz76rE7PZ9BjDHdZGYzYb9sM3SA4vFWPjDSuk1lrzA62sZ1aDVl0Z3YMu8BS7EhFI6i8eVs4a+TH5hZoWhxo0zLPCNMFKEgrFKwFRd1vvT8wTRE7lvALM2+pITgoalv0fth4ereoMF6i2XWIb9+rgLYJt0anXB7Ja5HVbxRuwFcN5ujZ8wH4ZqSYGgJbxLlVRSo6QPar/Dhe+MAVEq8IiYVFLxVht1Fek9dlstRHEJdryGCLR8dlqSDl4SLdO/8pKwSyUn5olO8oPv3+2CRQfeZ7FE5q8YIDshXuDa8ghKxwT/PEoKsEnLBr64PA79CfhHGc/kKCK4xr0pZO6A1HjdIEqRGTjLfB42ze7NmNHJAQmUMIzP6zIyPFUmdB4Qt7+QgMEkbZQNZsHX2bWrr5ulMjVoLcdQOwOXg==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(26005)(2616005)(83380400001)(426003)(8676002)(54906003)(44832011)(6916009)(6666004)(70586007)(82310400003)(70206006)(508600001)(316002)(81166007)(450100002)(86362001)(5660300002)(186003)(2906002)(4326008)(36756003)(8936002)(1076003)(7696005)(36860700001)(47076005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2021 14:18:55.5420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f45995-fe7c-4f19-081b-08d990afe344
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3186
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This property is used to describe the total number of pins on this
particular pinctrl hardware block.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 340be4eabf44..5f3baa918ed7 100644
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
         interrupt-parent = <&aic>;
-- 
2.17.1

