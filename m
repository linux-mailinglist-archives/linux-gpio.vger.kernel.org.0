Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C38541F597
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 21:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355947AbhJATOr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 15:14:47 -0400
Received: from mail-eopbgr20061.outbound.protection.outlook.com ([40.107.2.61]:24524
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239579AbhJATOq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 1 Oct 2021 15:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nelbOXPLv8fev78xBHWETIY5joEG4gwdmrwF3OY8MxQ=;
 b=lbOePArdj5zIU9L/StLbSmMMvHu77GNgxzp74rQmVgIJuEmXo0TQR1qqcfS4duBobbHuDdu3Zv3nbejjCfVJMDkJazLPKdMwol4ZYkaeF/pBOcpuf3lmCT02hQqzjAMx/r/rKTTOxy9Y/5nnyV+M+aXNowxu/VUJA4+cWzK3d+k=
Received: from AM6P191CA0059.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::36)
 by PAXPR08MB6985.eurprd08.prod.outlook.com (2603:10a6:102:1dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Fri, 1 Oct
 2021 19:12:47 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::35) by AM6P191CA0059.outlook.office365.com
 (2603:10a6:209:7f::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Fri, 1 Oct 2021 19:12:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 19:12:46 +0000
Received: ("Tessian outbound a492f2284909:v103"); Fri, 01 Oct 2021 19:12:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e2ec5db6b44e1e0e
X-CR-MTA-TID: 64aa7808
Received: from 79ed60b74e76.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0627F36B-F3C9-4EEC-B7FA-317DE0B6AB6F.1;
        Fri, 01 Oct 2021 19:12:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 79ed60b74e76.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 Oct 2021 19:12:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGKxb0F5dXzkiRVIZY/4f/UychaGxJKpkNkNPV3LqO9Q/my6DslaYFVsz6K7QWFnRBzd5blVxzXawBhYQ1M8xuHYK+M+QgEod8jbNt2n8NL3EpLDV1gsHQv4HYyxPS7zrnDsC+vWXnNRz4rxwIBFIeRprguAy/c+2XVhHmnjLrzZs0CABGxzy7Mrm/i9JhNoyf9DQ/vE2ZjGt244f/rDu61kJ/nJj5IoQhrchV9eeUDEaekq/xRCUvUNrH1X24OSXH2Emxir4R+6G3N5LstAsygO8TUjtscl4v8HsdEjFcthDdAI1FiKjfg0S9znmvxc9KcffqaaLMo5G4vOq3VJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nelbOXPLv8fev78xBHWETIY5joEG4gwdmrwF3OY8MxQ=;
 b=k3jVw7wZlikhXWOO9HFLwtmbquB+EvT8Z4i6kzFNAYPSiicsZQXHjgH5jy7EKHar22MekjKN3QybXP6tW4FAVTiwN81YWkOV59jVt+fMJTgbo50NOjg6x4s+i+BjkYM490BMMAzv+JLoIxASnHrHUSQGPcLMAebhtkiLXNQ30jTAxGv555V0zsxGyRsSyjjq3KnLyciwCgCxguYr/Xu7KT4jexmv8RkEnFJQTZX/5sUaNtK1YDFdGdZNrAziJKGA3DiALjdkrht8oBaCFVFJi+yJECxha1AVYkwwzyYqwO1pJIrZWOVDsz1KLFw/t0rH2lG4VdIv1DO6ycgufN+OdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nelbOXPLv8fev78xBHWETIY5joEG4gwdmrwF3OY8MxQ=;
 b=lbOePArdj5zIU9L/StLbSmMMvHu77GNgxzp74rQmVgIJuEmXo0TQR1qqcfS4duBobbHuDdu3Zv3nbejjCfVJMDkJazLPKdMwol4ZYkaeF/pBOcpuf3lmCT02hQqzjAMx/r/rKTTOxy9Y/5nnyV+M+aXNowxu/VUJA4+cWzK3d+k=
Received: from AM5PR0601CA0028.eurprd06.prod.outlook.com
 (2603:10a6:203:68::14) by DB6PR0802MB2518.eurprd08.prod.outlook.com
 (2603:10a6:4:94::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 1 Oct
 2021 19:12:25 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::f4) by AM5PR0601CA0028.outlook.office365.com
 (2603:10a6:203:68::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 19:12:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 19:12:24 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Oct
 2021 19:12:27 +0000
Received: from e124191.cambridge.arm.com (10.11.7.12) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 1 Oct 2021 19:12:27 +0000
From:   Joey Gouly <joey.gouly@arm.com>
To:     <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, <nd@arm.com>
Subject: [PATCH v2 1/3] gpio: Allow per-parent interrupt data
Date:   Fri, 1 Oct 2021 20:12:07 +0100
Message-ID: <20211001191209.29988-2-joey.gouly@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001191209.29988-1-joey.gouly@arm.com>
References: <20211001191209.29988-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8285a89-fb5d-466e-4914-08d9850f741e
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2518:|PAXPR08MB6985:
X-Microsoft-Antispam-PRVS: <PAXPR08MB69855A91A49D30C584766AD894AB9@PAXPR08MB6985.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: RJb3+7Wf/x7rQFvRX8/N/wvoKW1hid9EU7oxyzj3XGcnSqIWRVSchu7WxUE4phoFNDSQEaXzFB+cDFvWE6fEvGvBzeLyGKJECdoQzdDS26+J1k3iXGJSm8pE2iLLmjgn6Imkg3QV+SdwYi9bjAqMdiBGL8wTTx84Qws/C7GDgI85SQIgj3/owXEUubl/C8FiJnX4e6+1daez+uaG093m9pE5/oRP/pTb7aNV2E3Q/kjq4KtXertvlFGp+LXjshRRmsY9MMNifEva2bwVy4hblxYoej/7s9yuwXSRmZ7kb4Zc3ISPwi8z0q6RSrnR47naC3hpgZc79RPPavINnzgYu2NSVqsNlTqpWQGML3SVcwYhIOpTRTAgt1V6n+4BrhaTZRrpl6FWyiv3Muuz7LImozuMiquWLZWWVBPn4dFjB+g9GY9rTD7YIQhdq8o2SPTirJgstAHlkVNxXgxFJQBo5hSWiIW2mGT/xQ+vCG329DAIOWCE0IJ6eiNtDOqS1MGxMpEXsw9/giOghwvjDWq2VPSnXDHJjn2o8Mp/LiUUm7Twz9MEmQGlk7bZVgP+wHBR+NlIpZv+KVgjOXJz20HET6ewNrFJ3g3QFx6phszcgKWwz0/9UHvNiCz3IRSbjHoQzHodNQVO7U8y/fNZFBICw4QX4LFjg9xkx5Pv31yKS5pEwid9SJSeCFfbYNwMDMrE/s2Zg7C5EcLNaGOrV+Xp0lP3nMFvVtPlgsj5VIDyEAc=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(7696005)(70586007)(86362001)(336012)(8676002)(36756003)(426003)(316002)(2906002)(5660300002)(508600001)(44832011)(54906003)(4326008)(6916009)(47076005)(186003)(36860700001)(82310400003)(1076003)(26005)(70206006)(81166007)(8936002)(83380400001)(356005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2518
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 23384a97-e640-4956-d53a-08d9850f6719
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9dqIdBIfDHHxeTzrUWs+5T7cu5RRjtsA5NdIn3Ky9QF4VL1eMG6algNXaKZy4fi22+8Q0HOU5BR1+L7s+xKg3InhzF9auYEp8FkDcV4dUWRgyZlb9HdDVZgk/HmTgMMvv21/3Q/AWHwEFkxVsn6IZJ8TtBLxHf8GeXQMraLX29Ri+hcgQ+VED7t7eOaJ65QRynpyJVdupH9YVl6St5TSjM/tP8/wyUjWTZS3pzD7Iot3QCDvSU6g1eFEiDbRrA8CtgfjXw6r6VYxNUvE4LUTk/vk02j+4CqKStYOeHIgX7GpfIy0GPNOHApU36+sUXAnELS45vcOyOjXDDeuJxonnycqpGOghLss7f3BnXx1jyNJ7r38oK9e03+aOjzY6Ue/qJIqSpNwhdan4CQY3iOX2QxRe7WcNVn4H6zLgH64Q3W6YRTQN7p3omI8pb32eNbbcSK7GEpq4UsTekHCBd3LZkDUcYxWhbkR/9qKwraxWVbqME+ME+ZZMi1+SNTJkLsZO2ecYfcs81inZXqEovSwVRfDzVR9zXHY2K1QNDGzXhO4xLxigwyoOr38vt5JU6drdcgb23ICdrpcSS1IaesDqYgWJNzFXmg0x7t4eqg4CC9WL9HG4TbUULKommC7Vr8rci4R/wD332rgw1qf7efavsfwk5Pi5hTjjS/qAD8hNM1jOHJDimh5f/ZRmZKipYnKbAoTH05U5AVufD4cC+7JA==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(44832011)(8676002)(83380400001)(1076003)(86362001)(508600001)(36860700001)(316002)(47076005)(26005)(81166007)(54906003)(70206006)(426003)(2906002)(82310400003)(36756003)(450100002)(7696005)(186003)(336012)(70586007)(5660300002)(4326008)(8936002)(6666004)(6916009)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 19:12:46.7350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8285a89-fb5d-466e-4914-08d9850f741e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6985
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

