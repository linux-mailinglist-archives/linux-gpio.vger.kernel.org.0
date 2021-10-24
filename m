Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE2C438845
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 12:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhJXKVb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 06:21:31 -0400
Received: from mail-db8eur05on2061.outbound.protection.outlook.com ([40.107.20.61]:3867
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230230AbhJXKV3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 24 Oct 2021 06:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXssyN1BE4zep4Itxk2qjgGpCYqr9EP46LksppG9abI=;
 b=xaOcDXKuP1wJ1UfFPJnNTzMCsxYqTfe/zIkdpeCMYYl5e5Ie6Ms9w59gfY+t/cgKIb/q+CcX9qNjMHxEE5xIZ3jP7yh4IN/5t4cB+H7SQr3o6bUtB8RB+GT2KmlJJy6bfQhnu1H13xEapijPW8lioG7QrfYZOEtwJK690zEN2i4=
Received: from AS9PR06CA0180.eurprd06.prod.outlook.com (2603:10a6:20b:45c::27)
 by GV1PR08MB7316.eurprd08.prod.outlook.com (2603:10a6:150:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sun, 24 Oct
 2021 10:19:03 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::a0) by AS9PR06CA0180.outlook.office365.com
 (2603:10a6:20b:45c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Sun, 24 Oct 2021 10:19:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Sun, 24 Oct 2021 10:19:03 +0000
Received: ("Tessian outbound b9598e0ead92:v103"); Sun, 24 Oct 2021 10:19:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ecaa1e43332fd7ed
X-CR-MTA-TID: 64aa7808
Received: from baaa6ebce8d4.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 867671EE-D532-451E-B9C5-38C83162FBC6.1;
        Sun, 24 Oct 2021 10:18:56 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id baaa6ebce8d4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 24 Oct 2021 10:18:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7/JwOJWtIjvoao0jQsHFSzMSIFi/dfZmARpbE5nTm2sQm8tY/eC4M84cAg/PtIUZpUrp3UwLjorngmgklTpET2wt+n7hwa0HCh2lH+TqPsNj4fH0ivgTtA+5IwQYF0zmE+ch8O6J1PaVfoghUsFmEWmchDwEIR4/jG7m4PFOtphFuBSvYNWRTtYvkDW7QlcXXRozplX/LoLnHE9otRsqxOjDQU8K79q+xTgi38Z5s603Z6GtoHzGWVk0KT/nWepSUD16ZQ1RcfxWmK32mdgcr7vHYX6rf1prCe2t2jBJuQ7r+ukcBtQmxeEEHEjMEa3U3NsiL3bUDLQsth68QgDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXssyN1BE4zep4Itxk2qjgGpCYqr9EP46LksppG9abI=;
 b=hUs5JRnrfBI08GUiVgc9dUhkQFvK5Pd+DCFo5zpX7EnfpM3SnuRYW/I8Ip2Pw85embeNIuJaGcUwVflAP7HPuWY021F0F8brkrineevW3Q4AHRaZ1u8qfGpIyWWMouOWp9h7rb6i+UmeewM0uY3E9zLhFmdqwj5X1FYrLGFEwrs+tjhnK+zxOUi95cP04A3XJJTkjsFf5iHpai0zQ0PovcoGK+44gsijlZoahSXNXMK6hmHEqa6iDAYXHqPEEQks4FlFaWFs2uyOu7YHQFtLaqKTkZO9lPZle8eAiiWRdwYYAlHvAnfFYJhls9Uo+VPDkTc/0ji6QiUtbUL1Kpp72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXssyN1BE4zep4Itxk2qjgGpCYqr9EP46LksppG9abI=;
 b=xaOcDXKuP1wJ1UfFPJnNTzMCsxYqTfe/zIkdpeCMYYl5e5Ie6Ms9w59gfY+t/cgKIb/q+CcX9qNjMHxEE5xIZ3jP7yh4IN/5t4cB+H7SQr3o6bUtB8RB+GT2KmlJJy6bfQhnu1H13xEapijPW8lioG7QrfYZOEtwJK690zEN2i4=
Received: from AM6P194CA0028.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::41)
 by DBBPR08MB4332.eurprd08.prod.outlook.com (2603:10a6:10:d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sun, 24 Oct
 2021 10:18:52 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::2f) by AM6P194CA0028.outlook.office365.com
 (2603:10a6:209:90::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Sun, 24 Oct 2021 10:18:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.18 via Frontend Transport; Sun, 24 Oct 2021 10:18:52 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sun, 24 Oct
 2021 10:18:52 +0000
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
Subject: [PATCH v4 1/5] gpio: Allow per-parent interrupt data
Date:   Sun, 24 Oct 2021 11:18:34 +0100
Message-ID: <20211024101838.43107-2-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211024101838.43107-1-joey.gouly@arm.com>
References: <20211024101838.43107-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faa169d8-4fc6-4050-c506-08d996d7b41b
X-MS-TrafficTypeDiagnostic: DBBPR08MB4332:|GV1PR08MB7316:
X-Microsoft-Antispam-PRVS: <GV1PR08MB73162C634D0FB56CE0D6BBC894829@GV1PR08MB7316.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bLZGWq/0yllM7QgDfeGIP5xWDCCZxvpgh9VLRKaOkFhNCnRneRS330mtZPZLHtZQRWpULB1LadVDYYusalY2B4ezZKIB59Qpp1o8xbm2+9eKgbRwbWZSrULhaW4aItrcbvybbjMzsk/p1LFh02v8Z5pyMUfU0FNpoT3ZTf4FcGdOKKS2AA8qo6icDBLgO1UcuKGnziGK0ED7FvBLXv4GuOtpmTqhxeUjg2dJnQgo709x3w+ERiMYqVwkn/JuMzph4se/Yuqx0fwVLV3UvNNlqTIIu6dFcndQfero5/uHG5laaM5MhpCAHeXk2o6hvw+cuJwlQn4HnXuXR5uYV1LKNusQBFIeltttT8/5w/wQveD2xS9n0/1kBqjUdGv15WHUC6TOx/MdjHik6VhbFkqAQ36bNaohfxX1XF9qLW9CHmDe5/+yd4uMZ8dPtFJJ5P0QliPOhLsS4OX9ZVCwxbn4ERY/qyXf7d9xxeWoV7Bok0PgOlI8U+7w5fmRZe8wCOS7B69BrssffWeLqju4iQG9K4blWF6V3iHV1vtadMzdADQPeA2iqVUYJYiXr9kPhENGwtVzdzh8cbdfRBSetxXEB+j1F/e2f28rI0ymaq9ixRCjLOP/YEcphT6K15cVuLhVrcB9PYzB//NlmOxzwsTHGs1aS61t1SV5eoC2HhRf/PQiSlUmifhBTHgQvCRaERs+ooHfzxaA9/AzOvbIRUmG1Wv9nlNEYXWCuWgSlKvhaFM=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(54906003)(508600001)(1076003)(82310400003)(6666004)(36756003)(26005)(186003)(86362001)(81166007)(36860700001)(47076005)(2616005)(2906002)(356005)(83380400001)(70206006)(8676002)(70586007)(5660300002)(6916009)(4326008)(336012)(7696005)(44832011)(8936002)(426003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4332
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3f107f96-9372-4329-53d6-08d996d7ad71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yUiDCg2R5IDHmLFVfU72QDZFl/DIBEcpqOixmj/OGV9d9Er0tVxlkzCGh+CfzVCxr1z4zFJdDYClwFuyA9UlSoPoahGo/LcS+wQ2qGHwp3c47KEr3+jOyFDholhp75M0Gm1NXRrYkSBLgVUU9FgyKBAyRFzypyN+yTXyL1PuDa1Naw52AqdVg6z+w7rxGes6L+rpdeL7Sz+kBHxVIFQYoEGP9e9HgwSwS3Q2AwZPBlnidOL09BHHZokmokI0h6LqjbtlJuaYJ6kTqrGZ4C9uJSiXtjBiIsutkRwFlcefrUuINEy+KfarjH93GCV5ivTjmNevNQahw6ToFZFFj1zkSuq+p+G9EpmAweu45PAjU78HJGsFjzW/nF6EFzkrnTn8ZIFx1U3c9+d1YQGNET5Rg6+tUiX+6x8IpKA83Da+al6B5K+xiuJQd+fWcfsbOA0fOf50pGvgwrOSx/hFeQoCr96UADstow1v/lFTxCP4Mpmk5dZZHQF1gTCxP1EKVte/6RHyKzECS2SzBmDJWM/qz25R9PFZwGrrddpmdwTncVzhe+jnw9l7ix2l/uZS3OQ8TWOb1wOqQc7V07IA51kATkTh1iwIaLcBECSTqJFv8o6JIa1Bmmv2rV5jPjUQqz9RlgnSD3HI2ZdsNvXoXSLgqghSpoa4UDH6uBpJDoJfuxVZYNINUalNp3YDwNiZLxNlIG/V4sd7MwZm42i2e45Q6w==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(7696005)(2616005)(6916009)(47076005)(186003)(426003)(83380400001)(70206006)(4326008)(2906002)(8936002)(36860700001)(8676002)(450100002)(316002)(54906003)(86362001)(36756003)(81166007)(508600001)(82310400003)(6666004)(5660300002)(336012)(44832011)(70586007)(1076003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2021 10:19:03.2070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faa169d8-4fc6-4050-c506-08d996d7b41b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7316
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

