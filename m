Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A08041E4F2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 01:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350692AbhI3X2i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 19:28:38 -0400
Received: from mail-bn8nam12on2064.outbound.protection.outlook.com ([40.107.237.64]:26113
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350183AbhI3X20 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 19:28:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbX7b2PdR2Hau1YlwOr0c7kvahAFexsuvPb3XYeX+9taTyF9LCqyRxYKWNbIixGrNzfpif1rFM44RHYGNWD0HTQX6KMeR4I7nVODnvv1ifkAc3HEKPKxgLE3lEkTGRoJ/h0CJAUGNmfXySvBQ0GpLCkgWOFWu72rHMt0RIbWuSIUJ8JX0xVbNybVbbZILObpmWEPFNmJ9rZxa58HnUGtgeYP5d8UdJ0oY3WvBFZIPqOX5SYDcv1lvdP/rWAAjQV+3Q/Nvzy4OODHBIAb5W0xcxVvERAWuhChg1tu4XqiZE5MexKs4Yt9faFMvIA0rHNp7FZmdbWRLkBgBJ98YHSyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQAw0L8ErqgSOkehkNgBBTcvvIEYxjNEmn8wasgEMjk=;
 b=Rq2YSfVz2X8DyuyRhWGZ7Eib0INOaYcOQvcf7gyui6e3YIdQ4loi5KCfnbRD8x302Noj5eWjoZ4tOnhalrFzemf3gloU1Ds8h3438fiz3iucN0gEvMSrh8MBCtCKjJjg9C47ulsIXVth1bcG/RkT7sM8qF4y4rS8mc5/EeDEokqZTtdmOrdlMypZMwAxioUZWkFUg3IzLL8CbzdZfYIi7vlIha7xKoqn0Da+dTjyjqebaVatNY1iFspyei9EE31eaFO2H0MVO7dvLFmcPs7fn9yq/KeAYLImQ1EqA5prl21oZZRfWgZAYZlUoNNiOYJ9zA/IcRi20k3UDdZ4/I9KdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQAw0L8ErqgSOkehkNgBBTcvvIEYxjNEmn8wasgEMjk=;
 b=hROIn+GbU+8Jj1Naa97vS9V6eDrfexYHYBN5cAe6kuSDA2PwnAuxxdrVLkNTW0MzhuuERY/3DY6zT8hmmNNLGZgv+Rq7Jn3zbOyuGfc/ln4VKc//ZBZIo2FtoNiDQZ5ipTp2dZvGHi5rYaYMpgQKerRDeuRCKrAz6kndA7/DpGtu6Ke/uDE0srN6ixRtyCBSsWyvUqr9PaHBzCRQzVQJFztWqIDy7Spx8dLDxW8v6xtZKs/xTXBhKavhT9roZuMm3GkNWcvqu7ja4t5v8JPjuIdmH9xOo/R2eH2jdyF7axRCsf3U4kf2qGHTZvEH5AWEp6Yl2JtZZzntoP4gNA+zFQ==
Received: from DM5PR12CA0064.namprd12.prod.outlook.com (2603:10b6:3:103::26)
 by MN2PR12MB3261.namprd12.prod.outlook.com (2603:10b6:208:108::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 30 Sep
 2021 23:26:41 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::f5) by DM5PR12CA0064.outlook.office365.com
 (2603:10b6:3:103::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 23:26:40 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:39 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:39 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v2 08/11] gpiolib: cdev: Add hardware timestamp clock type
Date:   Thu, 30 Sep 2021 16:26:14 -0700
Message-ID: <20210930232617.6396-9-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930232617.6396-1-dipenp@nvidia.com>
References: <20210930232617.6396-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96d40a7d-a50f-4cb0-2457-08d98469c1d5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3261:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3261AE82B18BA29516D07157AEAA9@MN2PR12MB3261.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HcJzX0hrcDKpROnpubkCMybS1Za64C9xLEexnlWZLd+UvpnrnEBl8pvIfplm3WFUWWyICVTNnkYl7OPM371kzDSBHqWUoHBx5baKNkhK3sCNQgcJHuazo8dBRirqg7xMwzKd20fz5SufU70ew9pU1dIg68gAabxGylU5xe1yUiWJU15dExfsUEI6AM1fjzremiVjQs0EFPhlFrMFctLq/rCtIEHPwMC7J3knbFN721zNiWcjwOlIILZzf8Kk24mCOxE6yq3PFXU6OCbgxzSdB813l6eeu6hlVlk7lggMnMtlJrCaVLT7ToEN7Ow1PGBPnICNjn73Z6oJihUci8aFLqhRdXzGSpm2q5sVZPAvbbYt4Se4Lk+jEhNdekKQEKpsehpMLA05aQpMQnffJOg3URNvJVqEd+wBYiPYaHkAlT5c/wIUcenCZVQo0qbaWISUBo2P5cFpzOaZhWzFTaEUdmhzJsyF6C7QE0oCqL/ld7E8wkxIHRzWhmFqDyiA/rM3t9uKY9Hi4k9WeoZleeUT8cpXRsnmo65x0n1FHGZbTLGHU9YhQwLpKOlU4Jql0zaJLDh1HRFHBqVNwTjGq5oQ+mLZqnlRCccBFsPKSyN588eutjzTTTyFlr/5E+uo9YK4RV9h79MAlVmJq5eBUu4jbOjdV1mv7sZeP/LIOzhHmExvIXXL90lf+LlLSnZeo+om5O3zdZtqu1A8UhxXln960raowkF39YxYfva3sr8Nlinx/qgYSK3LXK1hyvB1geZsIRwUjBMdakuaQ8i8sP1s5A==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(47076005)(8936002)(336012)(6666004)(2616005)(2906002)(5660300002)(921005)(426003)(70206006)(316002)(8676002)(36756003)(83380400001)(110136005)(7416002)(70586007)(26005)(186003)(7696005)(7636003)(36860700001)(508600001)(82310400003)(1076003)(107886003)(356005)(86362001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 23:26:40.6910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d40a7d-a50f-4cb0-2457-08d98469c1d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3261
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

