Return-Path: <linux-gpio+bounces-31714-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qwHYH6sPk2lO1QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31714-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 13:38:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8541435F4
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 13:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C49B0300159B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 12:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6413713AD26;
	Mon, 16 Feb 2026 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fi0a+xo6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BD818024
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771245476; cv=none; b=HzalWRsFBQqALFcOXTtPEIGEVII14gaqGHVKMI1XvAwIPuiC82psdgTlyFaTOaJ7+kRSSba3c6HMhjxSatTGstu8aI0y6w/1subKq30oy/PlcblISPnczKkGaJqMJeM7psr5W4u9UCUJes8ditRqpIN+EXD9D9WyUavNm7KeDZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771245476; c=relaxed/simple;
	bh=JyW4xCH2v4mV6eU4kP1v+j5sI8KnRgxrZ9O+Z3bSt+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SQ7Bk4qRXSvpXqvaVtzQuLOEmNoD88pGdNWYpNn6otQ6aHFxQMZ3OBxLvtuPuW5OH/Kv0PziaDyiueeICZxlLYs5EDh5BfDLjsOFdgym3Wg41nVQ5ZG2yW8nkP2G5aRFjfH1tprQ5gBw6+y+bLVeg4ELHO4wGTapqTUUje4v0qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fi0a+xo6; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82418b0178cso1694152b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 04:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771245474; x=1771850274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MHdBO7D48PMjrQF+vFby8p0IkVa7d5hczXXHGgZD74w=;
        b=fi0a+xo6+NhX7TIMqxIBrLKmAshkKqCwdX5HtfPX9+uC8osn0b7rSsIVUxpR3h4T7N
         ZdqFg9CfBBMsXD5U98BVmSSPay2G5vE6UjG5HrmJXXVOMjisu3FPBo/G8soj6KRpaOPH
         s9yYNl19h8jo/wMpKYebeFhS1zdjr9tYaEsKETGOQH6ubyFOdjYdVoyaaFXxHX2dYunW
         WHwebNabMd7qrvwZ5OLhoCyH5ePhciCHhdhqKFwt6/K80/6dfDcZADdgp6+9SD5030w2
         /OX8XaUQr6tcyCFihg68APLcQjM5NYy58PDB2InuTmLSUSx7jKfgt/W/OpwmYRZC+sLP
         yokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245474; x=1771850274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHdBO7D48PMjrQF+vFby8p0IkVa7d5hczXXHGgZD74w=;
        b=lrNmKBGPImrCmyg27NUCVXzy3MyvrO4wXtLXgYHAGA6tiglLELvmF0wY+l1jO0jFV7
         6yY4BdDjsYYJUM6XgHxUHzbL/6N5UK08IAbDr/ryI9rPnzIxBibqw99PRTrUWkEMms6B
         1exhpZMEzC0yPZC+7KFEEcvSCCOFYGdsLcvURDMBhIP1iuq9cxNTg05uKLamoNAKDM1Y
         607j64r1DFaEzlPCBzf/c1e7GhNRySsZM3L+AAH1Jn2OcDZvKkaqtRvFrnBmtOErXU+G
         81pzjxdEGrYDX0+Qf1PI/s7t5aOn1Wzfzbke+fLqynu64clKZpOkBRFyCkTfhbCFyaOt
         OOUg==
X-Gm-Message-State: AOJu0Yx9MyYgiv6AEjkS2dmUfuaI68cP7rxdhAS1aVy9BHxV2dAtc2us
	5yL6Xowl8WCKTS2nLu09H1WaY0cDi+TMJDkcHULxfU+4RHla9x/86yDnsvhHvlRg
X-Gm-Gg: AZuq6aIS48wuu0g7I7RnJwCHYDa1kkZ1bPQgSxPLO+ekGBeqMXlwGrR3/URIHkfU2C0
	jspOY4Qlts+gQz4o6Il3ypKSOvONZTO5ZOx3tCAzYBu8XEuKaGtdu5JwcZ7DPfl3g7C+2a7s3dl
	EunGaxWVUVjDNmupbCKtykPH0KEbbgfW43NN3DJcPkLlgmeccXrq9TnV/ZeMeDghEYZjpYqjmjs
	e0pPcjMu9CLIEeFreyqw0kysQLIYcnZgZ/KtsTL1U9aPAcx/unJLRJ94LcPJbrgC86UQt3XbXKY
	hrQWBsKyqFazET3GqsB9ASDeBgJi0wkLJnqbKo5g1V0tZBLkFm/ystZ03ByHpGbiwfTj+FWT5cp
	0qEDiITvzFYMvDgs+BGUAdlTEd6jdCvVClMJdz8B5qIj7pKCd4YGcKgdyVW2reRrpUOvr3UUsqf
	QMkBD7n/baBiJx0JNPLPp685sPtgUcxoqWgD0yK0cZ1+tp0341rZgTNd6JZ1OTvX4=
X-Received: by 2002:a05:6a21:e0ab:b0:38e:9ebe:525e with SMTP id adf61e73a8af0-3946c87f17fmr10420023637.52.1771245474144;
        Mon, 16 Feb 2026 04:37:54 -0800 (PST)
Received: from rigel.home.arpa (27-32-126-215.static.tpgi.com.au. [27.32.126.215])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e53342ce4sm7959795a12.34.2026.02.16.04.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:37:53 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@kernel.org,
	linusw@kernel.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpio: cdev: convert lineevent_create() and linereq_create() to FD_PREPARE()
Date: Mon, 16 Feb 2026 20:37:09 +0800
Message-ID: <20260216123709.281444-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31714-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[warthog618@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C8541435F4
X-Rspamd-Action: no action

linehandle_create() was recently converted to use FD_PREPARE() to
simplify fd creation and cleanup logic.
Apply the equivalent conversion to lineevent_create() and
linereq_create().

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 141 ++++++++++++------------------------
 1 file changed, 46 insertions(+), 95 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 3735c9fe1502..8b89f1d86de0 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1586,15 +1586,16 @@ static const struct file_operations line_fileops = {
 #endif
 };
 
+DEFINE_FREE(linereq_free, struct linereq *, if (!IS_ERR_OR_NULL(_T)) linereq_free(_T))
+
 static int linereq_create(struct gpio_device *gdev, void __user *ip)
 {
 	struct gpio_v2_line_request ulr;
 	struct gpio_v2_line_config *lc;
-	struct linereq *lr;
-	struct file *file;
+	struct linereq *lr __free(linereq_free) = NULL;
 	u64 flags, edflags;
 	unsigned int i;
-	int fd, ret;
+	int ret;
 
 	if (copy_from_user(&ulr, ip, sizeof(ulr)))
 		return -EFAULT;
@@ -1627,10 +1628,8 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		/* label is only initialized if consumer is set */
 		lr->label = kstrndup(ulr.consumer, sizeof(ulr.consumer) - 1,
 				     GFP_KERNEL);
-		if (!lr->label) {
-			ret = -ENOMEM;
-			goto out_free_linereq;
-		}
+		if (!lr->label)
+			return -ENOMEM;
 	}
 
 	mutex_init(&lr->config_mutex);
@@ -1649,14 +1648,12 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		u32 offset = ulr.offsets[i];
 		struct gpio_desc *desc = gpio_device_get_desc(gdev, offset);
 
-		if (IS_ERR(desc)) {
-			ret = PTR_ERR(desc);
-			goto out_free_linereq;
-		}
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
 
 		ret = gpiod_request_user(desc, lr->label);
 		if (ret)
-			goto out_free_linereq;
+			return ret;
 
 		lr->lines[i].desc = desc;
 		flags = gpio_v2_line_config_flags(lc, i);
@@ -1664,7 +1661,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
-			goto out_free_linereq;
+			return ret;
 
 		edflags = flags & GPIO_V2_LINE_EDGE_DETECTOR_FLAGS;
 		/*
@@ -1676,16 +1673,16 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 
 			ret = gpiod_direction_output_nonotify(desc, val);
 			if (ret)
-				goto out_free_linereq;
+				return ret;
 		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
 			ret = gpiod_direction_input_nonotify(desc);
 			if (ret)
-				goto out_free_linereq;
+				return ret;
 
 			ret = edge_detector_setup(&lr->lines[i], lc, i,
 						  edflags);
 			if (ret)
-				goto out_free_linereq;
+				return ret;
 		}
 
 		lr->lines[i].edflags = edflags;
@@ -1700,44 +1697,25 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 	ret = blocking_notifier_chain_register(&gdev->device_notifier,
 					       &lr->device_unregistered_nb);
 	if (ret)
-		goto out_free_linereq;
-
-	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
-	if (fd < 0) {
-		ret = fd;
-		goto out_free_linereq;
-	}
+		return ret;
 
-	file = anon_inode_getfile("gpio-line", &line_fileops, lr,
-				  O_RDONLY | O_CLOEXEC);
-	if (IS_ERR(file)) {
-		ret = PTR_ERR(file);
-		goto out_put_unused_fd;
-	}
+	FD_PREPARE(fdf, O_RDONLY | O_CLOEXEC,
+		   anon_inode_getfile("gpio-line", &line_fileops, lr,
+				      O_RDONLY | O_CLOEXEC));
+	if (fdf.err)
+		return fdf.err;
+	retain_and_null_ptr(lr);
 
-	ulr.fd = fd;
-	if (copy_to_user(ip, &ulr, sizeof(ulr))) {
-		/*
-		 * fput() will trigger the release() callback, so do not go onto
-		 * the regular error cleanup path here.
-		 */
-		fput(file);
-		put_unused_fd(fd);
+	ulr.fd = fd_prepare_fd(fdf);
+	if (copy_to_user(ip, &ulr, sizeof(ulr)))
 		return -EFAULT;
-	}
 
-	fd_install(fd, file);
+	fd_publish(fdf);
 
 	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
-		lr->num_lines);
+		ulr.num_lines);
 
 	return 0;
-
-out_put_unused_fd:
-	put_unused_fd(fd);
-out_free_linereq:
-	linereq_free(lr);
-	return ret;
 }
 
 #ifdef CONFIG_GPIO_CDEV_V1
@@ -2010,16 +1988,16 @@ static irqreturn_t lineevent_irq_handler(int irq, void *p)
 	return IRQ_WAKE_THREAD;
 }
 
+DEFINE_FREE(lineevent_free, struct lineevent_state *, if (!IS_ERR_OR_NULL(_T)) lineevent_free(_T))
+
 static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 {
 	struct gpioevent_request eventreq;
-	struct lineevent_state *le;
+	struct lineevent_state *le __free(lineevent_free) = NULL;
 	struct gpio_desc *desc;
-	struct file *file;
 	u32 offset;
 	u32 lflags;
 	u32 eflags;
-	int fd;
 	int ret;
 	int irq, irqflags = 0;
 	char *label;
@@ -2064,15 +2042,13 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		le->label = kstrndup(eventreq.consumer_label,
 				     sizeof(eventreq.consumer_label) - 1,
 				     GFP_KERNEL);
-		if (!le->label) {
-			ret = -ENOMEM;
-			goto out_free_le;
-		}
+		if (!le->label)
+			return -ENOMEM;
 	}
 
 	ret = gpiod_request_user(desc, le->label);
 	if (ret)
-		goto out_free_le;
+		return ret;
 	le->desc = desc;
 	le->eflags = eflags;
 
@@ -2080,15 +2056,13 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	ret = gpiod_direction_input(desc);
 	if (ret)
-		goto out_free_le;
+		return ret;
 
 	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
 
 	irq = gpiod_to_irq(desc);
-	if (irq <= 0) {
-		ret = -ENODEV;
-		goto out_free_le;
-	}
+	if (irq <= 0)
+		return -ENODEV;
 
 	if (eflags & GPIOEVENT_REQUEST_RISING_EDGE)
 		irqflags |= test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags) ?
@@ -2105,13 +2079,11 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	ret = blocking_notifier_chain_register(&gdev->device_notifier,
 					       &le->device_unregistered_nb);
 	if (ret)
-		goto out_free_le;
+		return ret;
 
 	label = make_irq_label(le->label);
-	if (IS_ERR(label)) {
-		ret = PTR_ERR(label);
-		goto out_free_le;
-	}
+	if (IS_ERR(label))
+		return PTR_ERR(label);
 
 	/* Request a thread to read the events */
 	ret = request_threaded_irq(irq,
@@ -2122,46 +2094,25 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 				   le);
 	if (ret) {
 		free_irq_label(label);
-		goto out_free_le;
+		return ret;
 	}
 
 	le->irq = irq;
 
-	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
-	if (fd < 0) {
-		ret = fd;
-		goto out_free_le;
-	}
-
-	file = anon_inode_getfile("gpio-event",
-				  &lineevent_fileops,
-				  le,
-				  O_RDONLY | O_CLOEXEC);
-	if (IS_ERR(file)) {
-		ret = PTR_ERR(file);
-		goto out_put_unused_fd;
-	}
+	FD_PREPARE(fdf, O_RDONLY | O_CLOEXEC,
+		   anon_inode_getfile("gpio-event", &lineevent_fileops, le,
+				      O_RDONLY | O_CLOEXEC));
+	if (fdf.err)
+		return fdf.err;
+	retain_and_null_ptr(le);
 
-	eventreq.fd = fd;
-	if (copy_to_user(ip, &eventreq, sizeof(eventreq))) {
-		/*
-		 * fput() will trigger the release() callback, so do not go onto
-		 * the regular error cleanup path here.
-		 */
-		fput(file);
-		put_unused_fd(fd);
+	eventreq.fd = fd_prepare_fd(fdf);
+	if (copy_to_user(ip, &eventreq, sizeof(eventreq)))
 		return -EFAULT;
-	}
 
-	fd_install(fd, file);
+	fd_publish(fdf);
 
 	return 0;
-
-out_put_unused_fd:
-	put_unused_fd(fd);
-out_free_le:
-	lineevent_free(le);
-	return ret;
 }
 
 static void gpio_v2_line_info_to_v1(struct gpio_v2_line_info *info_v2,
-- 
2.53.0


