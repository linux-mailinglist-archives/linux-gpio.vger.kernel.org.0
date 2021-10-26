Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F65A43B8C5
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 19:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235133AbhJZSA6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 14:00:58 -0400
Received: from mail-eopbgr80051.outbound.protection.outlook.com ([40.107.8.51]:37590
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233064AbhJZSA5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Oct 2021 14:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXssyN1BE4zep4Itxk2qjgGpCYqr9EP46LksppG9abI=;
 b=YznHjkZwioRl8Rp4zf02BDAm7qjjoSlOlEhcNJNsN9PzhvV7I7rb+paxWtZeFHNaZYwYF7abXKQxpGzd7ZUPsx2BFXRPVLWuAVCmbxXXlgwenIdKJkoDsGMokaSWpmRbDc18+xpf8TOsA9/bHfDLnWhy/Gux/IKstvOQFs3q1xM=
Received: from AM6P195CA0093.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::34)
 by AM9PR08MB7291.eurprd08.prod.outlook.com (2603:10a6:20b:436::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 26 Oct
 2021 17:58:30 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::7f) by AM6P195CA0093.outlook.office365.com
 (2603:10a6:209:86::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Tue, 26 Oct 2021 17:58:29 +0000
Received: ("Tessian outbound b9598e0ead92:v103"); Tue, 26 Oct 2021 17:58:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15585d2669f495c4
X-CR-MTA-TID: 64aa7808
Received: from 798a2c2d3d92.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 076F4B88-5CD8-463A-9D2D-C0DE27D3716F.1;
        Tue, 26 Oct 2021 17:58:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 798a2c2d3d92.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Oct 2021 17:58:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTJuA6NQKyV1cBooxQk3/W5dM2t7nEMqUocG6nMvo/CHdRkoBfcGvz4xOEu2Ayo+GDCt30t8gvqkADZEU/VbmFRo1Ob0iKyVbqMMM+QdvHV7Zbhh3dXom6In+dQL1Um6IsBfWvng1sMt0odUgEhMvrPf1pbAyzDMZ7bp1IPbq/wgAEFKZ8veWmoY8oF4ugqVnhRTV8layRets50br2ixC4Vhll1nk/xo0xXfuUzerVWm5+ln+3n3VXg72Z3itytHC2Z01Ssr3UrA5BG/UTTmuPbraHLclVbeY1RrV3bMtNzHSATCjR+nEJE5l4sCYEuwQvo+QCA0kDtoeAYU95exBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXssyN1BE4zep4Itxk2qjgGpCYqr9EP46LksppG9abI=;
 b=N7E9ztC/XXHxUbQL5HJiAzaXjzSKw6uJEPeUKL0mX9vvF4aOrJ30AEs0i7V0s4lIWJc24N1YOyL24/iDdW/jmx60oygigNz0QeG9LttlyR+MTN7a3kfj/fMoFqQGFsb2gZrIuuBnPxLiidzFXLtNKCQcSPTYnJmaV57y2yszcn2Lu3nNBl0Mn1IVoVvvOp50QlJdY0yOUC2V+p6iCVO+NHDZEZdhSL2tI9/Pm7ov4GKAKepe7EbKsmgswQyELdteXfDWJBCflVp2N2RiL3akvGuVG6+PInaQ9J7ZfFe1Lk0884LkLhgG2sn63Zyby0XrSKKR9SZfLpglbQbhF2TFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXssyN1BE4zep4Itxk2qjgGpCYqr9EP46LksppG9abI=;
 b=YznHjkZwioRl8Rp4zf02BDAm7qjjoSlOlEhcNJNsN9PzhvV7I7rb+paxWtZeFHNaZYwYF7abXKQxpGzd7ZUPsx2BFXRPVLWuAVCmbxXXlgwenIdKJkoDsGMokaSWpmRbDc18+xpf8TOsA9/bHfDLnWhy/Gux/IKstvOQFs3q1xM=
Received: from AM5PR0602CA0008.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::18) by DB9PR08MB7007.eurprd08.prod.outlook.com
 (2603:10a6:10:2c8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 17:58:21 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::a2) by AM5PR0602CA0008.outlook.office365.com
 (2603:10a6:203:a3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 17:58:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 17:58:20 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Tue, 26 Oct
 2021 17:58:22 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Oct 2021 17:58:18 +0000
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
Subject: [PATCH v5 1/5] gpio: Allow per-parent interrupt data
Date:   Tue, 26 Oct 2021 18:58:11 +0100
Message-ID: <20211026175815.52703-2-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211026175815.52703-1-joey.gouly@arm.com>
References: <20211026175815.52703-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04a27af4-4b8b-4dd7-aef7-08d998aa3770
X-MS-TrafficTypeDiagnostic: DB9PR08MB7007:|AM9PR08MB7291:
X-Microsoft-Antispam-PRVS: <AM9PR08MB7291406EFB65290D795AE2BC94849@AM9PR08MB7291.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: b1NlJuLURks3Yf3/4fVQRrpDBy6+43+bD4RNk/N0cPDVvmILu5pfK/9uGr/xlI9/Ci5lhPX4G/xsm1SJqGyyFiT3g+qsiVmpLuhzBHVT5qhyakDfqDYXrD006RPOTnsI4LzFdgHC7Yi1TJqMMn8IiBVDMKIRXj07WagBdNJQH6isJfU4LOg6+etbHXtTeDHf/ZLr6vcY1HOiiL21vjZcG/2ZCZGv0tt3icr34CS8+DOVOYHwoQu0uO3Z63SUL1iqHftIn0snPyHu7xe0nx+/rEbPznL7Y3zfrUK4bge6NmKb5giEqckhNVvgsi2Xad2EokVbJq3Nw3JheSIrhxu3GaTehi6uutcuM+287BfQBTSdG0L+ZC8YT/MocXzq1+2UvKbmIzWLxtUXpRNS0mUL3A4Fk044kOumYTiXZdT8UTRD7GcE+Q7vjefy6BQvb+VfT1Fa2ownSd/s7Z61PssppX4GaIK8mtQTO8wRTIpBYGBTZxqpII9a6NQHCHOzmvrTKgj52GTEkSwbgi+WbYV0kYWiIQzxvulDcJMe7e6VaWmm9O0MFB+69W32V7rSIeyHWh2/huRoV/0wgIQb9QQEApzZPD+dn+XAedweaanjeiWsjyo8SGYtn7v/HkAla9tkPcZ6wIBK0oE4ltbUbH6nEor9XbjwoUE6Cn7QLl9MJmltvO2kVJWKd97rRYekiYN3EPhpuIuv4d55Qb+qTKwXyE8lSieZ0VSo3c7zT8YKGu8=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(426003)(5660300002)(316002)(6916009)(8936002)(82310400003)(83380400001)(8676002)(6666004)(186003)(7696005)(336012)(36756003)(47076005)(26005)(1076003)(70206006)(54906003)(2906002)(86362001)(81166007)(356005)(70586007)(36860700001)(4326008)(44832011)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7007
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 75076840-fef0-4333-78d1-08d998aa3245
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MEZwH+F7VGeKEc9VbEfgC53QcVtVbN8dCmnVgVZM/GUEv6Inyg2pozKgvgf7tcMacVKoEcQEebPypcpKCxNDXyXcMgJoo5nou573fRD0hVYdDnbCpO0wFf4+DoVys5s1A6I3/NjjjWCEz0+1W874xL5WgE2oxWZ4ki+TcMO3Zni9x53Y6NR75RyTBBQl3G7gvRD9renHoFfdmKVoEuuTnZTbOFiogHCX0QRIpInymf7UTigjiijuFcOgKL99Xe0r7dKs1T0tGiJkuS5C2cWvoh2zRePszqFBlFnllu4r+ftF6Oxdg3NBoUFjKU0mZlj9RycQK11bE6LR2lDRH1GRtMKgLpTXBPEpM6UlCFu6ZNO3LFuROo4FSN2BkQAPHWkK0XJEBZlrqdR5E3xsreWJInyWJFgIfAmp8wrphYtpZoLsSvw92ifqTnns7Fz8DGvbLU52KruiVJuYcjXNknRnmYd6KtZiYNdcmkMb2doU8HFreQ8PGETmd6CKSBWOu6ODSlaz+Eo7lrCk1MVeHXd2QomVDxXrawbKmFr2BMdwQbyMx4oVoawh8rxe2/0fPmii2JFXvLqbCq/31bU9tRlNyTs6IfjkPyX7TYbvyZvt6gDyh5/5yvoAFGMsud0xLUGjT0M9Ut8QGeA6lYd8jtV6oshDOZCWwwcRo+2oyP2BjZE1X+5zNYJgyqrW9K/3rYOxvXeiugkcEnyQq1gJQfTXKQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(63370400001)(5660300002)(36756003)(6916009)(63350400001)(316002)(336012)(8936002)(8676002)(6666004)(1076003)(86362001)(47076005)(44832011)(26005)(2906002)(186003)(83380400001)(70586007)(7696005)(508600001)(82310400003)(70206006)(4326008)(36860700001)(81166007)(426003)(54906003)(450100002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 17:58:29.0200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a27af4-4b8b-4dd7-aef7-08d998aa3770
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7291
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Marc Zyngier <maz@kernel.org>

The core gpiolib code is able to deal with multiple interrupt parents
for a single gpio irqchip. It however only allows a single piece
of data to be conveyed to all flow handlers (either the gpio_chip
or some other, driver-specific data).

This means that drivers have to go through some interesting dance
to find the correct context, something that isn't great in interrupt
context (see aebdc8abc9db86e2bd33070fc2f961012fff74b4 for a prime
example).

Instead, offer an optional way for a pinctrl/gpio driver to provide
an array of pointers which gets used to provide the correct context
to the flow handler.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c      |  9 +++++++--
 include/linux/gpio/driver.h | 19 +++++++++++++++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d1b9b721218f..abfbf546d159 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1534,9 +1534,14 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
 	}
 
 	if (gc->irq.parent_handler) {
-		void *data = gc->irq.parent_handler_data ?: gc;
-
 		for (i = 0; i < gc->irq.num_parents; i++) {
+			void *data;
+
+			if (gc->irq.per_parent_data)
+				data = gc->irq.parent_handler_data_array[i];
+			else
+				data = gc->irq.parent_handler_data ?: gc;
+
 			/*
 			 * The parent IRQ chip is already using the chip_data
 			 * for this IRQ chip, so our callbacks simply use the
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a0f9901dcae6..a673a359e20b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -168,11 +168,18 @@ struct gpio_irq_chip {
 
 	/**
 	 * @parent_handler_data:
+	 * @parent_handler_data_array:
 	 *
 	 * Data associated, and passed to, the handler for the parent
-	 * interrupt.
+	 * interrupt. Can either be a single pointer if @per_parent_data
+	 * is false, or an array of @num_parents pointers otherwise.  If
+	 * @per_parent_data is true, @parent_handler_data_array cannot be
+	 * NULL.
 	 */
-	void *parent_handler_data;
+	union {
+		void *parent_handler_data;
+		void **parent_handler_data_array;
+	};
 
 	/**
 	 * @num_parents:
@@ -203,6 +210,14 @@ struct gpio_irq_chip {
 	 */
 	bool threaded;
 
+	/**
+	 * @per_parent_data:
+	 *
+	 * True if parent_handler_data_array describes a @num_parents
+	 * sized array to be used as parent data.
+	 */
+	bool per_parent_data;
+
 	/**
 	 * @init_hw: optional routine to initialize hardware before
 	 * an IRQ chip will be added. This is quite useful when
-- 
2.17.1

