Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDBB545AC69
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240200AbhKWTcz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:32:55 -0500
Received: from mail-bn8nam11on2056.outbound.protection.outlook.com ([40.107.236.56]:61695
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238633AbhKWTcd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:32:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePHYXmdBP3edYUDgczUFCFntjDfXBnQvXMcMK6wVn+cYkMgIRo3tDTCIdQhtNtwK4qblP3xQxdli3EE/iXG4/hkl9g+c3kLfec+kK2RE4Z6zM2vzNgNz9V09b8VOU/djHBW8vs3ImP4BxUk9nc8Sh1nHXQLFBWTN5EPYj6bJLN+B81U4QpoxiicSimeASr/CeVgmm/ALin7iI1I82G6wOWzZRChxKhh/LNJMxrdz5tM7ZErDyZWxOqgrYCOvYrzOhPs5X4Rkrd54KrtHUe0iW6c2cr5nMToyaA2dVBIyonImYLZe0sRBIgf1U8FuBPMw+sMFQiZ90vXS0Oeq1vs8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZYZ/d1lwasIQRRumt4UsRbQ8dG6351qJ6/PhTVio00=;
 b=Dd9nNUJdM2qe+vHDKT2emSEj0vh/37/OiV4PzjCN1jNQNT5BHqycjCJ17QxUGY297RpR2oBd5cqUxKOw+Aloy20No0ooUi5PlcHsbxjwixsm1QbzM3DSOb/J4sPG1n0UOqGkE964wcXWD8F93WMsAufa6EzoZiwxdJMcis52Bo7+YhOqGAA5OM6c/VdRKUbn/kSbWRxlWv8wzTZrhVdMf0mlU0ovFxQP7OMkDW21WbexBlQcAwLLvGLd+qzRFj4Jn/ScKmp3UitLCNeeroonOvl/zlNLQUejdHgso8Qp9CmdQEygbPCEtjwbV8DmZNZpcDDlwaqAwJYtwTVg/WNa8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZYZ/d1lwasIQRRumt4UsRbQ8dG6351qJ6/PhTVio00=;
 b=EPS5oGf898pVluCvLLCiALy6apH5p+pF9Ff806C6EI6worzDDTi2qcpZT6PUlZORaEwH13L8bQmRz5ZLOzr/z6Lq2XVi639JI/ynHm16J2hmmrVl1izhE4rG9wxSdvzsBfuJyRMfwCT9L8zEjQFbj13bBWU8MrV+f47ORkysjhXwW2tx0+UeJKVAhUbM1CceTEUTpP8drylNZIvOamA2tqq/+O7ldlkBpoSa3a4HSzGzNbWuxXn8MHzQ4fM8OL4phafpG8ES6UywThWO7TCH6aasOZEf3i7t9CQvpa4OMpdq/KkCOyv1ihYSJtO+A6wx+T3bxvvK64NVaopDisOB9A==
Received: from MW4PR04CA0189.namprd04.prod.outlook.com (2603:10b6:303:86::14)
 by DM6PR12MB2905.namprd12.prod.outlook.com (2603:10b6:5:181::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 19:29:22 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::76) by MW4PR04CA0189.outlook.office365.com
 (2603:10b6:303:86::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 19:29:21 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 11:29:20 -0800
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:20 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v3 09/12] gpiolib: cdev: Add hardware timestamp clock type
Date:   Tue, 23 Nov 2021 11:30:36 -0800
Message-ID: <20211123193039.25154-10-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123193039.25154-1-dipenp@nvidia.com>
References: <20211123193039.25154-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3384b10-536e-4ffd-f6c1-08d9aeb78d1d
X-MS-TrafficTypeDiagnostic: DM6PR12MB2905:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2905C2BF39F886CB4FA8D5DCAE609@DM6PR12MB2905.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /s4i2XLkzPZhupDXYAQeBbR6N7eHJ/t4ArsINr+0lGjs6BzOJSSf70WE0XmKQc1AfLFRpoGuckF/M3aPPvtbf/D4yiwPkbEFqXu/dlGfsQUKhvQloUwUq7F1spDgfKv+SsTSCEbp8aAX/fluGxCuChD/58BlJlzzJPpuZJBUO2klB8WWG843mYI8HfWkq/nDDTI8TIK7Bb3fEP+gRBpaeIfGHXBzgkD0cibaoyJkS+g47JVFP++nTUO72XSwavcIAHrK2QxJ1bDLmmLKHeSblOLRInIuKOPwWCjPzZ8MpHxLHSIt5HRW3/kQ1yl84jEvsSsK7RlVEzxQ7sPAZ5fwH7jBqJyxRmvVGng+lPL8JWyEAsSIEQafvLovBoEB7B8Z3Lb0B9gRTpEDVQJfR10DIbEZR3FUImK5+1YnMrl2cVX9yvqpoP7MxrXCpZ4g+jugSeP0SqMT5BfHPX9Ln/6a+CdOg2KeZ2QS4/V4R08woTceS75G6CX8gLwMGKHSU3PBklZo1RQTdG907DPdRxms8FICjrm2NZOvx9A0ub/ZkwhKCgIGXN0hbfUKftxT6qz9RYFSHrJ9NYO8PhKRJlQgTlfm7kvh7wrdpidT8yXIuFphPSCaUjBZ+ekIK6zu0exoaXne657QWlBi0lATzFntKO2VPJr2oQr+gHN8L0MLoXrWe0lTYG3i0/CKBqa6W93hQQWx/y6jWC4ToPyCZME2yaAAc9HtTtQCadCPWzSagYdALh1iV3TVqyd9v62gjKz4Jx6CNYYYY77woQnVxN+NSg==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(107886003)(82310400004)(70586007)(356005)(83380400001)(1076003)(26005)(7696005)(8676002)(2906002)(7416002)(70206006)(8936002)(36756003)(7636003)(186003)(6666004)(110136005)(316002)(5660300002)(2616005)(86362001)(4326008)(336012)(36860700001)(47076005)(921005)(426003)(508600001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 19:29:21.8295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3384b10-536e-4ffd-f6c1-08d9aeb78d1d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2905
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds new clock type for the GPIO controller which can
timestamp gpio lines in realtime using hardware means. To expose such
functionalities to the userspace, code has been added in this patch
where during line create call, it checks for new clock type and if
requested, calls hardware timestamp related API from gpiolib.c.
During line change event, the HTE subsystem pushes timestamp data
through callbacks.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Added hte_dir and static structure hte_ts_desc.
- Added callbacks which get invoked by HTE when new data is available.
- Better use of hte_dir and seq from hte_ts_desc.
- Modified sw debounce function to accommodate hardware timestamping.

 drivers/gpio/gpiolib-cdev.c | 161 ++++++++++++++++++++++++++++++++++--
 include/uapi/linux/gpio.h   |   1 +
 2 files changed, 153 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index c7b5446d01fd..1736ad54e3ec 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -464,6 +464,12 @@ struct line {
 	 * stale value.
 	 */
 	unsigned int level;
+	/*
+	 * dir will be touched in HTE callbacks hte_ts_cb_t and
+	 * hte_ts_threaded_cb_t and they are mutually exclusive. This will be
+	 * unused when HTE is not supported/disabled.
+	 */
+	enum hte_dir dir;
 };
 
 /**
@@ -518,6 +524,7 @@ struct linereq {
 	 GPIO_V2_LINE_DRIVE_FLAGS | \
 	 GPIO_V2_LINE_EDGE_FLAGS | \
 	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME | \
+	 GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE | \
 	 GPIO_V2_LINE_BIAS_FLAGS)
 
 static void linereq_put_event(struct linereq *lr,
@@ -546,6 +553,94 @@ static u64 line_event_timestamp(struct line *line)
 	return ktime_get_ns();
 }
 
+static hte_return_t process_hw_ts_thread(void *p)
+{
+	struct line *line = p;
+	struct linereq *lr = line->req;
+	struct gpio_v2_line_event le;
+	u64 eflags;
+
+	memset(&le, 0, sizeof(le));
+
+	le.timestamp_ns = line->timestamp_ns;
+	line->timestamp_ns = 0;
+
+	if (line->dir >= HTE_DIR_NOSUPP) {
+		eflags = READ_ONCE(line->eflags);
+		if (eflags == GPIO_V2_LINE_FLAG_EDGE_BOTH) {
+			int level = gpiod_get_value_cansleep(line->desc);
+
+			if (level)
+				/* Emit low-to-high event */
+				le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
+			else
+				/* Emit high-to-low event */
+				le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
+		} else if (eflags == GPIO_V2_LINE_FLAG_EDGE_RISING) {
+			/* Emit low-to-high event */
+			le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
+		} else if (eflags == GPIO_V2_LINE_FLAG_EDGE_FALLING) {
+			/* Emit high-to-low event */
+			le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
+		} else {
+			return HTE_CB_ERROR;
+		}
+	} else {
+		if (line->dir == HTE_RISING_EDGE_TS)
+			le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
+		else
+			le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
+	}
+
+	le.line_seqno = line->line_seqno;
+	le.seqno = (lr->num_lines == 1) ? le.line_seqno : line->req_seqno;
+	le.offset = gpio_chip_hwgpio(line->desc);
+
+	linereq_put_event(lr, &le);
+
+	return HTE_CB_HANDLED;
+}
+
+static hte_return_t process_hw_ts(struct hte_ts_data *ts, void *p)
+{
+	struct line *line = p;
+	struct linereq *lr = line->req;
+
+	if (!ts)
+		return HTE_CB_ERROR;
+
+	line->timestamp_ns = ts->tsc;
+	line->dir = ts->dir;
+
+	/*
+	 * It is possible that HTE engine detects spurious edges for the
+	 * lines where software debounce is enabled. This primary callback
+	 * will be called multiple times in that case. It will be better to
+	 * let debounce_work_func handle instead of process_hw_ts_thread.
+	 * The timestamp_ns will be overwritten here which is fine as we are
+	 * interested in the last value anyway. The debounce_work_func will
+	 * then just read whatever last line->timestamp_ns is stored. Because
+	 * this callback can be called multiple times, we are not really
+	 * interested in ts->seq.
+	 */
+	if (!READ_ONCE(line->sw_debounced)) {
+		line->line_seqno = ts->seq;
+
+		/*
+		 * Increment in this callback incase all the lines in linereq
+		 * are enabled for hw timestamping. This will work even if
+		 * subset of lines are enabled for hw timestamping as
+		 * edge_irq_* callbacks will proceed as usual for them.
+		 */
+		if (lr->num_lines != 1)
+			line->req_seqno = atomic_inc_return(&lr->seqno);
+
+		return HTE_RUN_THREADED_CB;
+	}
+
+	return HTE_CB_HANDLED;
+}
+
 static irqreturn_t edge_irq_thread(int irq, void *p)
 {
 	struct line *line = p;
@@ -553,6 +648,10 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
 	struct gpio_v2_line_event le;
 	u64 eflags;
 
+	/* Let process_hw_ts_thread handle */
+	if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags))
+		return IRQ_HANDLED;
+
 	/* Do not leak kernel stack to userspace */
 	memset(&le, 0, sizeof(le));
 
@@ -604,6 +703,10 @@ static irqreturn_t edge_irq_handler(int irq, void *p)
 	struct line *line = p;
 	struct linereq *lr = line->req;
 
+	/* Let HTE supplied callbacks handle */
+	if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags))
+		return IRQ_HANDLED;
+
 	/*
 	 * Just store the timestamp in hardirq context so we get it as
 	 * close in time as possible to the actual event.
@@ -682,14 +785,6 @@ static void debounce_work_func(struct work_struct *work)
 	/* Do not leak kernel stack to userspace */
 	memset(&le, 0, sizeof(le));
 
-	lr = line->req;
-	le.timestamp_ns = line_event_timestamp(line);
-	le.offset = gpio_chip_hwgpio(line->desc);
-	line->line_seqno++;
-	le.line_seqno = line->line_seqno;
-	le.seqno = (lr->num_lines == 1) ?
-		le.line_seqno : atomic_inc_return(&lr->seqno);
-
 	if (level)
 		/* Emit low-to-high event */
 		le.id = GPIO_V2_LINE_EVENT_RISING_EDGE;
@@ -697,6 +792,23 @@ static void debounce_work_func(struct work_struct *work)
 		/* Emit high-to-low event */
 		le.id = GPIO_V2_LINE_EVENT_FALLING_EDGE;
 
+	if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags)) {
+		le.timestamp_ns = line->timestamp_ns;
+		if (line->dir < HTE_DIR_NOSUPP)
+			le.id = (line->dir == HTE_RISING_EDGE_TS) ?
+				 GPIO_V2_LINE_EVENT_RISING_EDGE :
+				 GPIO_V2_LINE_EVENT_FALLING_EDGE;
+	} else {
+		le.timestamp_ns = line_event_timestamp(line);
+	}
+
+	lr = line->req;
+	le.offset = gpio_chip_hwgpio(line->desc);
+	line->line_seqno++;
+	le.line_seqno = line->line_seqno;
+	le.seqno = (lr->num_lines == 1) ?
+		le.line_seqno : atomic_inc_return(&lr->seqno);
+
 	linereq_put_event(lr, &le);
 }
 
@@ -891,7 +1003,6 @@ static int gpio_v2_line_flags_validate(u64 flags)
 	/* Return an error if an unknown flag is set */
 	if (flags & ~GPIO_V2_LINE_VALID_FLAGS)
 		return -EINVAL;
-
 	/*
 	 * Do not allow both INPUT and OUTPUT flags to be set as they are
 	 * contradictory.
@@ -900,6 +1011,11 @@ static int gpio_v2_line_flags_validate(u64 flags)
 	    (flags & GPIO_V2_LINE_FLAG_OUTPUT))
 		return -EINVAL;
 
+	/* Only allow one event clock source */
+	if ((flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME) &&
+	    (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE))
+		return -EINVAL;
+
 	/* Edge detection requires explicit input. */
 	if ((flags & GPIO_V2_LINE_EDGE_FLAGS) &&
 	    !(flags & GPIO_V2_LINE_FLAG_INPUT))
@@ -992,6 +1108,8 @@ static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
 
 	assign_bit(FLAG_EVENT_CLOCK_REALTIME, flagsp,
 		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
+	assign_bit(FLAG_EVENT_CLOCK_HARDWARE, flagsp,
+		   flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE);
 }
 
 static long linereq_get_values(struct linereq *lr, void __user *ip)
@@ -1154,6 +1272,21 @@ static long linereq_set_config_unlocked(struct linereq *lr,
 				return ret;
 		}
 
+		/* Check if new config sets hardware assisted clock */
+		if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
+			ret = gpiod_req_hw_timestamp_ns(desc, process_hw_ts,
+							process_hw_ts_thread,
+							&lr->lines[i]);
+			if (ret)
+				return ret;
+		} else {
+			/*
+			 * HTE subsys will do nothing if there is nothing to
+			 * release.
+			 */
+			gpiod_rel_hw_timestamp_ns(desc);
+		}
+
 		blocking_notifier_call_chain(&desc->gdev->notifier,
 					     GPIO_V2_LINE_CHANGED_CONFIG,
 					     desc);
@@ -1409,6 +1542,14 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 					flags & GPIO_V2_LINE_EDGE_FLAGS);
 			if (ret)
 				goto out_free_linereq;
+
+			if (flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE) {
+				ret = gpiod_req_hw_timestamp_ns(desc, process_hw_ts,
+							process_hw_ts_thread,
+							&lr->lines[i]);
+				if (ret)
+					goto out_free_linereq;
+			}
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
@@ -1959,6 +2100,8 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 
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

