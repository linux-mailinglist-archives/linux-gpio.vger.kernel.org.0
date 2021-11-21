Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134E5458509
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 17:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238537AbhKURAQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 12:00:16 -0500
Received: from mail-eopbgr60043.outbound.protection.outlook.com ([40.107.6.43]:30353
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238526AbhKURAL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFPICHtkHnMBSClSkAJZJJpTW6ln/FJmJ/ZIiim4wzo=;
 b=yMDwa3qNWjJT8Lrwu5bbc3jd97PTfRHh4/bjTZsf8xhsZxrSlXMI4SguzY4y8G4wj3O28bSZVNAk/NaO4VwnC8iWel/PLgn3/0n8THfkjF3mjc92j6KNd/7jQfY3VWPH7wGL0ypBnuuXirkumlaIPy+mG0R9LFpl13U7O0uVY8g=
Received: from DB6PR0802CA0039.eurprd08.prod.outlook.com (2603:10a6:4:a3::25)
 by VI1PR0802MB2415.eurprd08.prod.outlook.com (2603:10a6:800:ba::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sun, 21 Nov
 2021 16:57:01 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::6b) by DB6PR0802CA0039.outlook.office365.com
 (2603:10a6:4:a3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Sun, 21 Nov 2021 16:57:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:57:01 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110"); Sun, 21 Nov 2021 16:57:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5b721d80d32296d
X-CR-MTA-TID: 64aa7808
Received: from f91f43e61031.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id C35C73CC-844A-4FD1-B818-739980378DEE.1;
        Sun, 21 Nov 2021 16:56:54 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f91f43e61031.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 21 Nov 2021 16:56:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOoGBz/9Rs6kc/2FfNIUrELkqWXIUjBkzy8hCriOj3exaFa1P6Oz0zarODIfTO4jNJryE9z2masY/Kz0rja0fKmxmT77z8JFE/M4ZhzT21x0Sl06DhaDgOx4tt2tHAzdd93sWukEeEPiUv5bv9M469qoBxz4csvjm6HqFtC7+9hNrbbIBOz7TUzl5zIxnKOQWAqXERm1icv2qVRTTz/EziNOTi4yLeJff0x3tJNtQ3bCAyNoRbcyAWcsFLZR1OvuzlJAIWwgUsVuUgKQ1iWmQUOuhxaSmql2Jbvd8lD1izvcmYhFo/gU3waUYbod/kCTQU/cVncC2pioRQDPZ9W9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFPICHtkHnMBSClSkAJZJJpTW6ln/FJmJ/ZIiim4wzo=;
 b=emPk8XDpQIfZrg0dBeK3rF/pNEaH/0XrFVthMtKkbEFhHJh5G9ttBgimlmlYyFl5e2mwGHyMP57M2dUWuhCcnK3RM5sz8MQ+fBiVy2uY63D/F1qWVkeprQrGXAnFbvoqmT+xlihdz3+Ead+/edNvr6ph7sXDpWjqXbg/dju6/jBwdCozW92pQ9dJjUb01v3OxYtAkyvrQfJhKlI/5EkAioq6xm/cjJTFt5CZrPJmABtaMA7DyGLiSxFv4CzannLuMm0uzONiNisdmV3Gp6OVqPXVqmdXYcnAMgS/NNj8ysyoV6yRFZtuutnD9WMb6eWJlz/9thfH+heVB4OMTgMU3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFPICHtkHnMBSClSkAJZJJpTW6ln/FJmJ/ZIiim4wzo=;
 b=yMDwa3qNWjJT8Lrwu5bbc3jd97PTfRHh4/bjTZsf8xhsZxrSlXMI4SguzY4y8G4wj3O28bSZVNAk/NaO4VwnC8iWel/PLgn3/0n8THfkjF3mjc92j6KNd/7jQfY3VWPH7wGL0ypBnuuXirkumlaIPy+mG0R9LFpl13U7O0uVY8g=
Received: from AS9P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::29)
 by AM0PR08MB4996.eurprd08.prod.outlook.com (2603:10a6:208:15a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Sun, 21 Nov
 2021 16:56:50 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::8) by AS9P194CA0024.outlook.office365.com
 (2603:10a6:20b:46d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Sun, 21 Nov 2021 16:56:49 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Sun, 21 Nov
 2021 16:56:49 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Sun, 21
 Nov 2021 16:56:47 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Sun, 21 Nov 2021 16:56:48 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hector Martin <marcan@marcan.st>, <nd@arm.com>,
        Joey Gouly <joey.gouly@arm.com>
Subject: [PATCH v2 02/11] pinctrl: apple: add missing comma
Date:   Sun, 21 Nov 2021 16:56:33 +0000
Message-ID: <20211121165642.27883-3-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211121165642.27883-1-joey.gouly@arm.com>
References: <20211121165642.27883-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 439a2ce2-5acf-4fc7-cf2a-08d9ad0ff045
X-MS-TrafficTypeDiagnostic: AM0PR08MB4996:|VI1PR0802MB2415:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB241568E0585E4E616A6742EB949E9@VI1PR0802MB2415.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: kLziGJe5cGJWJoxX0zW8L8QH8GHTKyLwfwusqhxXntlv6S7VZ+NorGfP3tC1rv3tSV2oofMsxhv9zxQvLMUr7WfiRyCx9YPqvP59NQ8E31X1ge7f/XV1iTJnsvY/PC3Gx0uRL9dq8QnhFzMk62BJ0eFiw+MnVVycTKIfnD2WHPfqYzhUwH7b0rD5zyO21KKqtKlFeMvuxLiKLgHKVa9hk48kAxKiPhdUbTf4OSAkN3mwVMBSSpKNkJnIaV03BnHQSHoKyiH2CeV7+GZTUBModWZW2BRDrJ39rwbzLuAyib2WTF8iyq6/EGZW/NDvqT6QxhySzahJ9M61zV7O6kyp7e+zW1JJqeXkBFsjligD/+3JoQogvcdIFsA6zG/m0EsoYayWd3SchCkJr3koYHjXvcoxEsGvbwWH2bhGvJ4S+yVQVz5prnb6qIu+ik+TeoJuoktINJEGLMoTeRP/dT85j2SQwRVwIaAHuqSaq4enRSJYanXxeupkmjKHHHWhNJwV8LKn1IkTsW95LdrYcQbp1vHGB74J3pVxP0F3RMANZwFpyoCujm3Zjh/o8E7QRp5YXaeXr1iSiJZ9TF9Q8e9dym/1/JKMlMDWGcFMlg+SfLi9gHzKNKOi7Ug/ejLKtJbb+E/Ns6nox/3g6Pss6jaUH2sqfBLnT8d4CuMNuylfmcs8OTLb4hjoEbi+PpFlKc6kBES9SnLLunWUj9ohIwGp1CIlUsRhNbGStS5yb5eIgvcxM+tNq2J/N/PeLc+FCR/Lgf6fRtqaHM1jOvm6h44/Lw==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(83380400001)(2906002)(4326008)(7696005)(82310400003)(8936002)(36756003)(508600001)(54906003)(336012)(316002)(70586007)(356005)(1076003)(8676002)(186003)(44832011)(86362001)(36860700001)(81166007)(6666004)(2616005)(5660300002)(47076005)(26005)(426003)(6916009)(70206006)(4744005)(46800400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4996
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2a5981bf-f7cc-4d6c-2467-08d9ad0fe91a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t8qY+9Vw+FzwpWgffcUQ8b8ChlO2oCjiicNq6ny2zwsuU12FuwOYnHkKY+FjIDTpdjilSjk8Qrr0Xzw3zlFt/kfSV29MDgI2g0x4uOAvuhycrXteYwzvXkM7dZkZWItKNDg2JjPg1gGKC8OSaa22FRqXI/X3Pnh/24LfCqnRZlDLvDx4A4BehNwnNyjNplnln386tBWc2VpkRgWV1Ea+n0RMFTOw2HfwR4pxXVgYH/jC4sfA4ioEKOMr2SdPv3BYRLx88zI8MmBppb2/D4iGOg5V0HAN/rIAFwItytOTRNdpDrZYCyOo03TICxcMnf+LF61gZJ+kIhfItpGcDVNtl6rI3oRoOgEViW+o+0oivi7Pn7kKTcB8epCT2X4UrUQvNQ5Dx6qzPeARTSyiVDUy8CLlbI/L8cN0xx3NxxQiaNFRLC1z4qn1E/hvI/DTZ3o6/ZJaTEJuovhNtidDqGj4mpRF2DjrAvewXEPi4ryrV8RJZ16AkG/4Cjir0HWrOiOLERiH0GGt7RJwJsun48biJzgKbS01ofeST1HYx31CW35VdvDxCajbsxRFShSCCL64UnOzeN+AcKyuUPE101zWRNxqYezR/gOoz0u73XMwzmEm4vLnkP0/EekK9lmerr5xmyFRpx3pCawQqQzhDn5c4dChg/tBPUoMusea8f/lWcYv6fCQX5s0XCudfirX2TI7d6C145mHMdeViKC44o9UzrP4dHO+p/xnGwciqwUYORI=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(47660400002)(46966006)(36840700001)(6666004)(7696005)(81166007)(70206006)(2616005)(83380400001)(8676002)(86362001)(54906003)(47076005)(508600001)(70586007)(44832011)(336012)(426003)(2906002)(36756003)(6916009)(82310400003)(26005)(4326008)(1076003)(5660300002)(186003)(36860700001)(8936002)(316002)(4744005)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2021 16:57:01.6777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 439a2ce2-5acf-4fc7-cf2a-08d9ad0ff045
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2415
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a missing comma at the end of the regmap initialisation.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 7299c7686f7f..60d46ce26115 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -70,7 +70,7 @@ struct regmap_config regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 	.max_register = 512 * sizeof(u32),
 	.num_reg_defaults_raw = 512,
-	.use_relaxed_mmio = true
+	.use_relaxed_mmio = true,
 };
 
 // No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register.
-- 
2.17.1

