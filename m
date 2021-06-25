Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF5E3B4B40
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 01:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhFYXul (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 19:50:41 -0400
Received: from mail-bn8nam12on2043.outbound.protection.outlook.com ([40.107.237.43]:12001
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230046AbhFYXug (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Jun 2021 19:50:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpfWrN1BGf2T3+0Notjph8zUWAqZCVKzHWCWmPU2EkA2PWYTHbzM6mDw37/lzRs7bpJIZph5+87F8Yh+XWEmklRpi/ixZPiBdswx6bK60z/zZ9lQPDkUs5XWITE5FO3mh1+11m8XvN7Z58+U2OxJBZC9JgA4vBrK5F0sWHE01ZtxcPdLTmspeB0u/sdAoJr5Y/7TBZ6NTkplxsn8ELu8oSCqXv0Y9Iptx6EsRogMkjPIDj9rYn21UI75ckdkiKlIQCaTNswsSM9penJyrVNCGxM/3TaNUnpQBJTVrjPhwOjxd7CZdoAPkZMDVapuMr4Q0cdfNWyUO99oaTQzFA8zeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IzrkczlE4nz/psksqaHqfipbBu6W16piEDrlM0MFEk=;
 b=l52cFcXhCH3xZGrnY4xWe4/1wCYLesigdqb1t9OIhelEo4V2aVwVCKD+kjvTwnzLOZ54f58FWob67cFJuxEvFwLquATSj8V4O20MF/7IEDGhX0xpWejCzyld9aK0JURyCdy91Yh6Uv/XCZfn6Amxfw2SANbdXOTZXRiwVvFxm3d+FamjRghaj1O+iqyJNn5F0LfRSHf228eu94gNHCSm9E/dZ7MMIM893PsrngMkPRnF3FZQgORTJBNfU45Byyl3/bm5B2xupjaDlenHEXHY89LfxZSfc9dVtRlQ/fLI4VVJJF4LN8Y6iVW/MALS9OYNKW5q1BWZuGQ9ullEpgClxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IzrkczlE4nz/psksqaHqfipbBu6W16piEDrlM0MFEk=;
 b=FcrkgZb2SLbeshQwI93w8fVsDapAIbvtAHDAKIFuJtClYlcnaVsPemftVpRGyi/ZsmYhmXpI18sriFs8EAXF6AzYxq9BsvYlsbxKNitB14Y9fKvI9qRHVV4WQbRI0G7RVWM1d30tgKi04cysrMeg10f/idL+MFL1kku0KBg0hx0aNc7lbXSMXw3WKYW1EzVC+C8jbmu8rIPNRPxKf+RF7eYp6y0vyj8H+XasbXVorzmjv/6Cw4gYOoQ0sjQ7A6TiR2A1AC9Wv6E+wQ741BkFqMUZgXQ6+UFb0Yd8TKle+4E671paqeqEQZMU+Bs+9TqnzAjI9fbipPfW8yszOvUHSQ==
Received: from DM6PR03CA0012.namprd03.prod.outlook.com (2603:10b6:5:40::25) by
 DM5PR12MB2472.namprd12.prod.outlook.com (2603:10b6:4:b9::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.24; Fri, 25 Jun 2021 23:48:13 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::b8) by DM6PR03CA0012.outlook.office365.com
 (2603:10b6:5:40::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 23:48:12 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Jun
 2021 23:48:12 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:12 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <dipenp@nvidia.com>, <robh+dt@kernel.org>
Subject: [RFC 08/11] gpiolib: cdev: Add hardware timestamp clock type
Date:   Fri, 25 Jun 2021 16:55:29 -0700
Message-ID: <20210625235532.19575-9-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625235532.19575-1-dipenp@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22f6b97c-ee76-4bd2-dec9-08d93833b20a
X-MS-TrafficTypeDiagnostic: DM5PR12MB2472:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2472CEED0693129DF979B4A2AE069@DM5PR12MB2472.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ju3lEVAgDIapY7BWsRr6yvaZ7dAYCXE2mm0Ax9iH6eZPf2uKSgSsiRzYyRh/2N9EZXyT5xpgsUnTFkPxNBfDT/DcVrtXhSkhyeM40zNBZkqER+GVe0s5/mD0/DSVqa87oO2Es5uhp0Qcso4/zur4SRnuvFLTH5oK0LhntnNIufydcWuInxbG9WMDQQyhLMoSiHYcg8Oirp1s6SAlpyIweRy40+81f6g3UCyLkHni0URNen2JZkC58WARd0EnQ7pKJm7sw6c6BSJu0X1xWLiMFrVkObHQvuI4TypYMcHrZ86j0Rotk3pR7YDN5c5Np/xfe03809hnwxHrwto649iqah6ryMTr2n8hIumU1EygBjzcC4ZkHFMPoV+NFt4pKXh3j7jgBqvs1EtKxpPzakmC5zu9VQkUtzxBs1A9Oi4vOu8ndMdf6ubfDNr6vlitHKHNJcCKlgcptOGDRPO3D8DM/dtCOMyZgFR/5b2gA62/Qlh51hAuMuKPkNxsrjKHkoU8qX82Qp5WAbG08DNsMOeLeAn36oydjixHmNS8douWjLuQ0QsBVZ4WcVT6u27IhVcZ8mnJAPN7wo3jdTWK3Nmgi+YOqQbltc7OgLdAXDy0bB65GM5ApoBinT50ugm8tycoa/QwK5KjCwn3z4yYrtbJN45iSg+lCQ3jW/c4QrA409dFgWG7bR/Y6xAxfzTj+hDV6S6dBO6Zt06X8JMeL8XYhZ6NGUHAzb86U1i/B8S6p7Y=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(36840700001)(46966006)(316002)(86362001)(8936002)(82310400003)(36756003)(336012)(83380400001)(70586007)(356005)(2616005)(921005)(426003)(478600001)(26005)(7416002)(36860700001)(8676002)(7696005)(82740400003)(7636003)(6666004)(5660300002)(1076003)(110136005)(2906002)(70206006)(47076005)(186003)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 23:48:12.9871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f6b97c-ee76-4bd2-dec9-08d93833b20a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2472
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds new clock type for the GPIO controller which can
timestamp gpio lines using hardware means. To expose such
functionalities to the userspace, code has been added in this patch
where during line create call, it checks for new clock type and if
requested, calls hardware timestamp related API from gpiolib.c.
During line change event, it retrieves timestamp in nano seconds by
calling gpiod_get_hw_timestamp API from gpiolib.c. At the line release,
it disables this functionality by calling gpiod_hw_timestamp_control.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 drivers/gpio/gpiolib-cdev.c | 65 +++++++++++++++++++++++++++++++++++--
 include/uapi/linux/gpio.h   |  1 +
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 1631727bf0da..9f98c727e937 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -518,6 +518,7 @@ struct linereq {
 	 GPIO_V2_LINE_DRIVE_FLAGS | \
 	 GPIO_V2_LINE_EDGE_FLAGS | \
 	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
+	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE | \
 	 GPIO_V2_LINE_BIAS_FLAGS)
 
 static void linereq_put_event(struct linereq *lr,
@@ -540,9 +541,20 @@ static void linereq_put_event(struct linereq *lr,
 
 static u64 line_event_timestamp(struct line *line)
 {
+	bool block;
+
 	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
 		return ktime_get_real_ns();
 
+	if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags)) {
+		if (irq_count())
+			block = false;
+		else
+			block = true;
+
+		return gpiod_get_hw_timestamp(line->desc, block);
+	}
+
 	return ktime_get_ns();
 }
 
@@ -828,6 +840,7 @@ static int edge_detector_setup(struct line *line,
 		return ret;
 
 	line->irq = irq;
+
 	return 0;
 }
 
@@ -891,7 +904,6 @@ static int gpio_v2_line_flags_validate(u64 flags)
 	/* Return an error if an unknown flag is set */
 	if (flags & ~GPIO_V2_LINE_VALID_FLAGS)
 		return -EINVAL;
-
 	/*
 	 * Do not allow both INPUT and OUTPUT flags to be set as they are
 	 * contradictory.
@@ -900,6 +912,14 @@ static int gpio_v2_line_flags_validate(u64 flags)
 	    (flags & GPIO_V2_LINE_FLAG_OUTPUT))
 		return -EINVAL;
 
+	/*
+	 * Do not mix with any other clocks if hardware assisted timestamp is
+	 * asked.
+	 */
+	if ((flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME) &&
+	    (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE))
+		return -EINVAL;
+
 	/* Edge detection requires explicit input. */
 	if ((flags & GPIO_V2_LINE_EDGE_FLAGS) &&
 	    !(flags & GPIO_V2_LINE_FLAG_INPUT))
@@ -992,6 +1012,8 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
 
 	assign_bit(FLAG_EVENT_CLOCK_REALTIME, flagsp,
 		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
+	assign_bit(FLAG_EVENT_CLOCK_HARDWARE, flagsp,
+		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE);
 }
 
 static long linereq_get_values(struct linereq *lr, void __user *ip)
@@ -1139,6 +1161,18 @@ static long linereq_set_config_unlocked(struct linereq *lr,
 			int val = gpio_v2_line_config_output_value(lc, i);
 
 			edge_detector_stop(&lr->lines[i]);
+
+			/*
+			 * Assuming line was input before and hardware
+			 * assisted timestamp only timestamps the input
+			 * lines.
+			 */
+			if (gpiod_is_hw_timestamp_enabled(desc)) {
+				ret = gpiod_hw_timestamp_control(desc, false);
+				if (ret)
+					return ret;
+			}
+
 			ret = gpiod_direction_output(desc, val);
 			if (ret)
 				return ret;
@@ -1152,6 +1186,13 @@ static long linereq_set_config_unlocked(struct linereq *lr,
 					polarity_change);
 			if (ret)
 				return ret;
+
+			/* Check if new config sets hardware assisted clock */
+			if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
+				ret = gpiod_hw_timestamp_control(desc, true);
+				if (ret)
+					return ret;
+			}
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
@@ -1281,8 +1322,12 @@ static void linereq_free(struct linereq *lr)
 
 	for (i = 0; i < lr->num_lines; i++) {
 		edge_detector_stop(&lr->lines[i]);
-		if (lr->lines[i].desc)
+		if (lr->lines[i].desc) {
+			if (gpiod_is_hw_timestamp_enabled(lr->lines[i].desc))
+				gpiod_hw_timestamp_control(lr->lines[i].desc,
+							   false);
 			gpiod_free(lr->lines[i].desc);
+		}
 	}
 	kfifo_free(&lr->events);
 	kfree(lr->label);
@@ -1409,6 +1454,15 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 					flags & GPIO_V2_LINE_EDGE_FLAGS);
 			if (ret)
 				goto out_free_linereq;
+
+			/*
+			 * Check if hardware assisted timestamp is requested
+			 */
+			if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
+				ret = gpiod_hw_timestamp_control(desc, true);
+				if (ret)
+					goto out_free_linereq;
+			}
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
@@ -1956,8 +2010,15 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	if (test_bit(FLAG_EDGE_FALLING, &desc->flags))
 		info->flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
 
+	/*
+	 * Practically it is possible that user will want both the real time
+	 * and hardware timestamps on GPIO events, for now however lets just
+	 * work with either clocks
+	 */
 	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &desc->flags))
 		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
+	else if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &desc->flags))
+		info->flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE;
 
 	debounce_period_us = READ_ONCE(desc->debounce_period_us);
 	if (debounce_period_us) {
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index eaaea3d8e6b4..d360545b4c21 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -80,6 +80,7 @@ enum gpio_v2_line_flag {
 	GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN	= _BITULL(9),
 	GPIO_V2_LINE_FLAG_BIAS_DISABLED		= _BITULL(10),
 	GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME	= _BITULL(11),
+	GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE	= _BITULL(12),
 };
 
 /**
-- 
2.17.1

