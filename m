Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDF717725E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 10:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgCCJ3V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 04:29:21 -0500
Received: from mail-am6eur05on2135.outbound.protection.outlook.com ([40.107.22.135]:41280
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728010AbgCCJ3V (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Mar 2020 04:29:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fas1xvhHwuvR3aMAN19x3O2NiaPvwcpN66XSLFi1f6yqoRbQ97wxANJtXaYLYBNoWISxrrVsfldMyrqZmEAPqLT6aMftyF0QaGW1XCB1ad6aOrgiQNaetBCSaGCmFsVJ7rHPMcq7LJFOmhkm6w0HOaI+6grCy1DkRW4HxQP59+mdhWZVTELVIrCf0hlMzONMN7BdbGKIN/1niwNHm+CU443urcdc2zNC7rd5b2wBEGB+tPnuKfDSgbfvQGjZbaIenA12FShIa1voU/ecX415m8Rtr8oCVatWHrKjN/7Q4NGgZmM5HPkvFbg7HanM6nhQdIlsBs6IAyV5+M4ExQ+mUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhaeGqroqamQbhxdh9RtApPKBe08FECchRCMDMkPRL0=;
 b=LodKIBYmCkQgQ9S3aCZ1U6ojsGykMQW2+wMzX3fdF0Yvd0Rr2EdU9fXsaD8vX9s8josqOfceP9xQIRC+WeAgDHxYB2WMr7ZC6cg0jtGSVQSBivn2Cxuh5c12e3uBQZB1ONgM8aN4OLhhUCptSSI5AUpEZXIb9w/X4n5FlfmonzUz8d5QXsvtnmLOuA0yBbWLymUf7I2hoPipYSZZK7Y/wWO43iLpaNchYBgRa4DRowRRhEpPa8tdrvseGyy8ZGbjVE09ly/HBji72zZEtNhSH7IGFnS4WAtEPdnx79poK0weaSe2bYNcDAHogsK0vXjOQ4IuxkhEE/oa6CIE27dI+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhaeGqroqamQbhxdh9RtApPKBe08FECchRCMDMkPRL0=;
 b=UxmSt5osWFbaXBlZp/mmjsKkajqJ66FJyRzY4PYye8y437Q9oVODsGxnJv0jtK39HPENeI3fL0oX2Jrt0fFiKtbjY2VmNd64N8hna7ajH545lS71yxA8ZFxeHZnYM+kM82q6h9Ldx4f0zL45hzqHJJ8UuqufmBWPSlcHetolNU0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com (20.177.203.20) by
 VI1PR07MB6237.eurprd07.prod.outlook.com (10.186.162.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.9; Tue, 3 Mar 2020 09:29:18 +0000
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd]) by VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd%7]) with mapi id 15.20.2793.009; Tue, 3 Mar 2020
 09:29:18 +0000
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpio: pl061: Warn when IRQ line has not been configured
Date:   Tue,  3 Mar 2020 10:28:28 +0100
Message-Id: <20200303092828.4463-1-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.24.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P195CA0022.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::32)
 To VI1PR07MB5040.eurprd07.prod.outlook.com (2603:10a6:803:9c::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvdell.emea.nsn-net.net (131.228.32.181) by HE1P195CA0022.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend Transport; Tue, 3 Mar 2020 09:29:17 +0000
X-Mailer: git-send-email 2.24.0
X-Originating-IP: [131.228.32.181]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4b93f354-6777-4401-1dac-08d7bf5558cc
X-MS-TrafficTypeDiagnostic: VI1PR07MB6237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR07MB6237199C7D86CFCD1D300B9A88E40@VI1PR07MB6237.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 03319F6FEF
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(199004)(189003)(6506007)(2906002)(26005)(36756003)(6666004)(52116002)(478600001)(2616005)(956004)(186003)(16526019)(54906003)(316002)(81166006)(5660300002)(81156014)(6512007)(8936002)(6486002)(1076003)(4326008)(66476007)(6916009)(66946007)(86362001)(66556008)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR07MB6237;H:VI1PR07MB5040.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2tdl1mai8MtaWsCKi1aiTrJnxkm008fdbX121NlyWoIgfocQNFaz8+QvSQaypexkp4mi8IIHHxah9V8DrMWTSz4+7yv/wJfna7nqAMZDgCIMf2onHmMFeo7jpG/7QRD7KhWE/y+JeBHVTITiY6wj4w41JAA34jkr61KDGXRemyTkgOsQfNLdj0OBY387fUdn+zw/LtY76TRSLpZYFCv09OaMNGMJ6XUlkfrfcfgGrWwHju2t/p+wMsoP2/E7u6zdjcMfGHzwNR33FBArQYg38TKhgyYkoyZTIv3dT/+5VU+oSxkxo3f1wqmRmMo9xUvRc6aApYNpYEr/QhnO/CG6L1hVpdil/qiS1r8cXGyCKinWrUH0FeAlkYuZgb6u/u95/fp6Qcuf5wg3ywB/XhIL30UU7n1ylDKZ6RvfUXuZlZjqdtTqUIE1pjjJZFQJVpIs
X-MS-Exchange-AntiSpam-MessageData: vZnq2aRWBMon4bkyiHZS/aImz3TM2saQAHVOi8sHyAxPIKzKjIvJ4J8W0T9cOMxiDLqkKyK30UxWZl4j/k28qV+wIx0JsgLvmNk0fqNN/EJItCuaoIFVx+16B1KKxCSG5OpwvgCfSyiz87ABenNmWw==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b93f354-6777-4401-1dac-08d7bf5558cc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2020 09:29:18.1330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89+Uda8wKb/GIPGCtm6b0Yqpj9PeaEQYL7jEn3jTExLwXuwzJWnWh29PqRU76GSn18bnJSKm9ZLh6qjJ/FVvpUWqCmH2q+lsoupZSPAHysY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6237
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Existing (irq < 0) condition is always false because adev->irq has unsigned
type and contains 0 in case of failed irq_of_parse_and_map(). Up to now all
the mapping errors were silently ignored.

Seems that repairing this check would be backwards-incompatible and might
break the probe() for the implementations without IRQ support. Therefore
warn the user instead.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/gpio/gpio-pl061.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 5df7782..3439120 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -326,10 +326,8 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 
 	writeb(0, pl061->base + GPIOIE); /* disable irqs */
 	irq = adev->irq[0];
-	if (irq < 0) {
-		dev_err(&adev->dev, "invalid IRQ\n");
-		return -ENODEV;
-	}
+	if (!irq)
+		dev_warn(&adev->dev, "IRQ support disabled\n");
 	pl061->parent_irq = irq;
 
 	girq = &pl061->gc.irq;
-- 
2.4.6

