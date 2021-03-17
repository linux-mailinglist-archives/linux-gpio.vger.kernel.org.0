Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3873133F4D6
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 17:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbhCQP77 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 11:59:59 -0400
Received: from mail-eopbgr00111.outbound.protection.outlook.com ([40.107.0.111]:23936
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232118AbhCQP7d (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Mar 2021 11:59:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFDjHf8bwBG4UuJBst0Ek3NoKQHQ2ROf0WqtQoeKplnzWlvdiX8ayH6H3AYNvuX70c9cFwHrlSzX6b51rohzvMdj03WYBNBCQ/OVAPAT/DWGILmn0zpzLzUQNga/FLQk0mn5AJO04JsWds4GImrZCnFkvopqvep0gs9u2snvTJ0AdtLKKVQMwYXO/IbAzpl/ClK9M6cjQPvcjR5+FyTpN7tBW/sUlxtmCkihYu2U5fw3nOgHl74kWglEvdDkflY5+s+8paRXts27e0eiHMcHKkP1fgfsu+0oo9f/P6/aiBHr4xOVr5NhiJTiOUM22hAvVgMuWghcXA7SNZb9CJF8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhaeGqroqamQbhxdh9RtApPKBe08FECchRCMDMkPRL0=;
 b=eP2EoAzu0/mKWhBPRX2Ezcs97zFSVzrX/TXK2gpfEV3yA5HXtmoO7RsjqCNFvvXhvCJ6JYYdWsitNGyEVs1A1vJ1HVoO1KvMQ5OQ88nUX7PwfM7duLE781uHF8fcZ1HLP6SJ7OrWINjvYOF1uu+MtDNCrDLoo0kzHOPp+F+N2TZCoVNBIK72oxCBxbooy/Ja6BtCBC5G8vdb8Lm/ycydmPJRqWPIERRYwVbmH94/h//5eo75AL+za3vKavxUnng8vXyQi5uBwAEV/nvCYy278Z32NR2Z7jaAIqdi/2sS4525R29Ojpx/TQTKHi7S1eDrD2db7tMmDGiLZ9ckh1271Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=baylibre.com smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhaeGqroqamQbhxdh9RtApPKBe08FECchRCMDMkPRL0=;
 b=mYfY1PeJ+oi4RgXU2nkVTtm4QfTWBAvxWyevwnED3j79+wMRmJdt0F2lhnEYSsFN1BMQZnL6852mKp2S+W4Kpd1d2wct4ZG2y9/li44K+57hbpCR+w63CmiwEr+/75wA+8VCdoemKLFT3vwUzcls5hv/FVBqwmKMXOiRZVw+/CM=
Received: from DB6PR0802CA0028.eurprd08.prod.outlook.com (2603:10a6:4:a3::14)
 by AS8PR07MB7768.eurprd07.prod.outlook.com (2603:10a6:20b:351::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10; Wed, 17 Mar
 2021 15:59:32 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::a5) by DB6PR0802CA0028.outlook.office365.com
 (2603:10a6:4:a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 15:59:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 15:59:32 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 12HFxRUT016614;
        Wed, 17 Mar 2021 15:59:30 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpio: pl061: Warn when IRQ line has not been configured
Date:   Wed, 17 Mar 2021 16:59:19 +0100
Message-Id: <20210317155919.41450-3-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9d05d5e5-f074-4493-8b93-08d8e95da74c
X-MS-TrafficTypeDiagnostic: AS8PR07MB7768:
X-Microsoft-Antispam-PRVS: <AS8PR07MB77685A2D22353531E7AB7F6B886A9@AS8PR07MB7768.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GIWuZ5U2BzRpxbiuLKK1wl3pieqJGYZABC+n3+c62eY0I+uTWFPiDwNdRnhhY17z1/dd6/GLHPizBNsKqb9epQ2QyaHpFttb2qHi2miW3p6LO3yYhqfp4QfLeGrhT4eDJz/CkhSQpRxWwglrhPS6C+ul1hE4sX85RdIJhU9QINUIOXs2Kf9GECUsiT0OLtupXuJzUotNXiaQ6wZ21PeSNHfGTAV2uvaOFpwqjOqxOpS85A9bXih4JMCuAE4PojMCIuYWtd5yxDIXP8VuAwyzNzSwFFULdqv3kPZWNI36nXEh3LqlzGo3tJ8UyKuUW44FbF8Z6VBlN46p/RVQFCf85S5uP8gC1wklRFv2g671N8M3AmJlX1PJsxCc9crWtXZXcZ7c8j9U/LE5FUnZthTfGbxBpOEEORp19HiwFysiwfeLmbN0jRrNJOyTXjQYekQURerO2qRM9NGlIyyiwhvSsV3tPlNOao4+2mjnu01hdOuBPrWrToPd4BPgxc7NyVxWsWoX/8c0OugjNOX+CKw4zy+NgIddqTC4f6dzzWtYa23TTIArADkQoKYZHU6pQNCxniwkPhU1qLFUD+9doeXLNqgC875PTWSxKpT8bS3+c4F5IxLwUNA/AskhAF772sW5TTJZd7aQ3/G34fPKn2+Q9rHjk5VwfHpVaA7/W2Tgy6XcvE41FYTm8ty7afPEIxWZ
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(86362001)(36860700001)(6666004)(5660300002)(82310400003)(47076005)(4326008)(8676002)(1076003)(316002)(70586007)(81166007)(356005)(54906003)(336012)(8936002)(36756003)(82740400003)(2906002)(83380400001)(186003)(70206006)(26005)(6916009)(2616005)(478600001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 15:59:32.0087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d05d5e5-f074-4493-8b93-08d8e95da74c
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7768
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

