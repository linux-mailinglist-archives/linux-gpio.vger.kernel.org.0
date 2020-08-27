Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175CB254707
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgH0OgN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgH0ODt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:03:49 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD96C0619C2;
        Thu, 27 Aug 2020 07:02:48 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id n3so2681844pjq.1;
        Thu, 27 Aug 2020 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PPWCmf3nG0tkeT+4WJ+YoP1DR3GW9Dr8lBTML579n38=;
        b=cHJVwTRoFCCQBz5RDYSuiif20EIPI9tKWyxRNdU6F6mWKnH7dnWfOFvEHCPPEUXbLK
         /KX7fRu78PikvI8yJXnDABEWzO4BaqhwLXHrYyDRxGyH815SXD+h40pKwEGmx/E3fbKl
         NTW+UhvQnemzu4wp8ThY4dJIGIJCCAyeRPWhOQ4nbhoryMHM/LtHJ+4kS1HIsDCLsSCl
         56+RWZB9cs81tQIDPnrY82DpI1DVhSxwjXWK7t9k6ooZdsXH70KUsmlcO1YapJK8CFLr
         L/XqkPV9QTNF4aU2bUUt1TkTkJS7WiDXuJ90UrEQxCPvPVi6IEAs5iE2YEhNnnrYr49X
         uMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PPWCmf3nG0tkeT+4WJ+YoP1DR3GW9Dr8lBTML579n38=;
        b=h2e1JTgwGtu53+umumOaG0ktRDo/OANeZO9Tl8azL5ek5HBa5/M3k6w4EHGIEj5tEm
         0SMHB88NpLr2L8MszY0gVvUgzV2Bd8IH5OXGS1U2VpenJfz8SAumOPRNtWBQVIzhzO6m
         otU77uz3Kf4n9ixsvYk2slUJSaIhjFLz0Xxh8v6BuFTd+STacu7vXn4/hY1h/KvSCuyW
         KVemTRbl7HKGFSP/rnmzkvLk0CWVLElPx2i4PcYKRipnWoNOxwkkZ4A2F0OQUf/5Y2gI
         R2r65typSit6ppw+24hFn5zmDL6zd12t+LdnCY8y7D+LNhhU2Hyt2NAuaqTPRvenBtnS
         Szqg==
X-Gm-Message-State: AOAM533fItlQ+4rwTPoliXxZcIwLTrcFopxbOjkhdGRCg61F4bfrDR/T
        2sRaa6+/0q5hkYkYtk/M2UyaIo5Usfg=
X-Google-Smtp-Source: ABdhPJzDqs31URNvPEtLcqLk2V1fGmarmB+xwvvzXZNw4Ho1HNXHLNSfK4nKP7Q7kbwy4jF9bx1kBg==
X-Received: by 2002:a17:90b:384b:: with SMTP id nl11mr10727536pjb.91.1598536967720;
        Thu, 27 Aug 2020 07:02:47 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:02:46 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 10/20] gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
Date:   Thu, 27 Aug 2020 22:00:10 +0800
Message-Id: <20200827140020.159627-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for GPIO_V2_LINE_SET_CONFIG_IOCTL, the uAPI v2
line set config ioctl.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 92 +++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 05b15f20fe2c..9c1e3f5f01af 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/kfifo.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/poll.h>
 #include <linux/spinlock.h>
@@ -423,6 +424,8 @@ struct line {
  * @seqno: the sequence number for edge events generated on all lines in
  * this line request.  Note that this is not used when @num_lines is 1, as
  * the line_seqno is then the same and is cheaper to calculate.
+ * @config_mutex: mutex for serializing ioctl() calls to ensure consistency
+ * of configuration, particularly multi-step accesses to desc flags.
  * @lines: the lines held by this line request, with @num_lines elements.
  */
 struct linereq {
@@ -432,6 +435,7 @@ struct linereq {
 	wait_queue_head_t wait;
 	DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
 	atomic_t seqno;
+	struct mutex config_mutex;
 	struct line lines[];
 };
 
@@ -693,6 +697,29 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 	return 0;
 }
 
+static int gpio_v2_line_config_change_validate(struct linereq *lr,
+					       struct gpio_v2_line_config *lc)
+{
+	unsigned int i;
+	u64 flags;
+
+	for (i = 0; i < lr->num_lines; i++) {
+		flags = gpio_v2_line_config_flags(lc, i);
+		/* disallow edge detection changes */
+		if (lr->lines[i].eflags != (flags & GPIO_V2_LINE_EDGE_FLAGS))
+			return -EINVAL;
+
+		if (lr->lines[i].eflags & GPIO_V2_LINE_EDGE_FLAGS) {
+			/* disallow polarity changes */
+			if (test_bit(FLAG_ACTIVE_LOW,
+				     &lr->lines[i].desc->flags) !=
+			    ((flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW) != 0))
+				return -EINVAL;
+		}
+	}
+	return 0;
+}
+
 static void gpio_v2_line_config_flags_to_desc_flags(u64 flags,
 						    unsigned long *flagsp)
 {
@@ -772,6 +799,68 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
 	return 0;
 }
 
+static long linereq_set_config_unlocked(struct linereq *lr,
+					struct gpio_v2_line_config *lc)
+{
+	struct gpio_desc *desc;
+	unsigned int i;
+	u64 flags;
+	int ret;
+
+	ret = gpio_v2_line_config_change_validate(lr, lc);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < lr->num_lines; i++) {
+		desc = lr->lines[i].desc;
+		flags = gpio_v2_line_config_flags(lc, i);
+
+		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
+		/*
+		 * Lines have to be requested explicitly for input
+		 * or output, else the line will be treated "as is".
+		 */
+		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
+			int val = gpio_v2_line_config_output_value(lc, i);
+
+			edge_detector_stop(&lr->lines[i]);
+			ret = gpiod_direction_output(desc, val);
+			if (ret)
+				return ret;
+		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
+			ret = gpiod_direction_input(desc);
+			if (ret)
+				return ret;
+		}
+
+		blocking_notifier_call_chain(&desc->gdev->notifier,
+					     GPIO_V2_LINE_CHANGED_CONFIG,
+					     desc);
+	}
+	return 0;
+}
+
+static long linereq_set_config(struct linereq *lr, void __user *ip)
+{
+	struct gpio_v2_line_config lc;
+	int ret;
+
+	if (copy_from_user(&lc, ip, sizeof(lc)))
+		return -EFAULT;
+
+	ret = gpio_v2_line_config_validate(&lc, lr->num_lines);
+	if (ret)
+		return ret;
+
+	mutex_lock(&lr->config_mutex);
+
+	ret = linereq_set_config_unlocked(lr, &lc);
+
+	mutex_unlock(&lr->config_mutex);
+
+	return ret;
+}
+
 static long linereq_ioctl(struct file *file, unsigned int cmd,
 			  unsigned long arg)
 {
@@ -780,6 +869,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return linereq_get_values(lr, ip);
+	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
+		return linereq_set_config(lr, ip);
 
 	return -EINVAL;
 }
@@ -946,6 +1037,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
+	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
 	if (has_edge_detection) {
 		size = ulr.event_buffer_size;
-- 
2.28.0

