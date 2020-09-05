Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4609E25E80C
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbgIENrQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728644AbgIENiI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:38:08 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA4E9C061247;
        Sat,  5 Sep 2020 06:38:06 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id kk9so1935281pjb.2;
        Sat, 05 Sep 2020 06:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fOShQOnP3xiHchJXCKcF0QXLy2o+Q08MnW320XGs32Q=;
        b=lANkR64YWSAEVpi0r4WdPDoSZqezK0vDggX5IGT5w1XYpu6hFjoeBZyO1iEejiYUnD
         L/RFPwz9Nh2ZdkIzjplNdiM47n/KY5rOF9atqg6BNMxV4SnXcEmumetSonnuculISCY/
         irPIsO6I4n/Lh1SgZwHXqkGBp7apKl0OOTiNNLVU6FlsN8oD/FAUDQ6OA620DrntWz7E
         3pyC5Kr/dz5jW4ZEeg4J6nxAUd+Gbs5W4ouyyPu+DzyFONJvPX/EhbNS+EYZq5+PV6lZ
         r9XFDZQK0KGia1UKKBLgDqirDYdoBtoSfcOdlp8lgUd60BPBPgD3RE29Y8Wc1kBeXZzE
         WGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fOShQOnP3xiHchJXCKcF0QXLy2o+Q08MnW320XGs32Q=;
        b=mUlwjhFbWBmW5Xj9s68ZKsxoMSxt30p0fb/Q0jj9NaOcJMpsRNW3Gn8dU9uMwksvbz
         pKt6aKhcqiWh0hrZ3xAD1zQeRM/zx5E4z2UAu6yqlEFCveUDniumpjlPVka5MUQwKjZD
         i8FVlXCTtzDwS5soWzL0MFa9WvbvHwBb9B2QCpQvR/3WYfDmgyjDG8eF93NhjvNttvjq
         AlTbRh1KKcORZXIB0Y72h5jlkYttyfSKE4lsVovtgwDXbuyz7suhR1X7UhQceofaRCD3
         8gxIuOQc67r9qIyZcEydG1l01YVgeDu8zXRYFPGS+rGUsTaUVVt7NogMG1Rmf1PRV7hU
         RLig==
X-Gm-Message-State: AOAM5337xWtJJ6K3Th5PgrxpGDFljZRRX5584pmmkiRjkfmg4JtRTWP4
        yW4cHuYig45oUPJFaG7gdaYVNpMhqDw=
X-Google-Smtp-Source: ABdhPJy/lvLMOK65r1/N2eUK4ac3NX5uK/b8LJ50xmo3dWDbpeVCkVsnQt1PBZTQFOIKsqBMxj7P6g==
X-Received: by 2002:a17:902:b405:: with SMTP id x5mr12662133plr.267.1599313085985;
        Sat, 05 Sep 2020 06:38:05 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:38:05 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 10/20] gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
Date:   Sat,  5 Sep 2020 21:35:39 +0800
Message-Id: <20200905133549.24606-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
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
 drivers/gpio/gpiolib-cdev.c | 88 +++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 0fee108c767f..0d4d217a6e15 100644
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
@@ -424,6 +425,8 @@ struct line {
  * @seqno: the sequence number for edge events generated on all lines in
  * this line request.  Note that this is not used when @num_lines is 1, as
  * the line_seqno is then the same and is cheaper to calculate.
+ * @config_mutex: mutex for serializing ioctl() calls to ensure consistency
+ * of configuration, particularly multi-step accesses to desc flags.
  * @lines: the lines held by this line request, with @num_lines elements.
  */
 struct linereq {
@@ -434,6 +437,7 @@ struct linereq {
 	u32 event_buffer_size;
 	DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
 	atomic_t seqno;
+	struct mutex config_mutex;
 	struct line lines[];
 };
 
@@ -541,6 +545,8 @@ static void edge_detector_stop(struct line *line)
 		free_irq(line->irq, line);
 		line->irq = 0;
 	}
+
+	line->eflags = 0;
 }
 
 static int edge_detector_setup(struct line *line,
@@ -582,6 +588,17 @@ static int edge_detector_setup(struct line *line,
 	return 0;
 }
 
+static int edge_detector_update(struct line *line, u64 eflags,
+				bool polarity_change)
+{
+	if ((line->eflags == eflags) && !polarity_change)
+		return 0;
+
+	edge_detector_stop(line);
+
+	return edge_detector_setup(line, eflags);
+}
+
 static u64 gpio_v2_line_config_flags(struct gpio_v2_line_config *lc,
 				     unsigned int line_idx)
 {
@@ -762,6 +779,74 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
 	return 0;
 }
 
+static long linereq_set_config_unlocked(struct linereq *lr,
+					struct gpio_v2_line_config *lc)
+{
+	struct gpio_desc *desc;
+	unsigned int i;
+	u64 flags;
+	bool polarity_change;
+	int ret;
+
+	for (i = 0; i < lr->num_lines; i++) {
+		desc = lr->lines[i].desc;
+		flags = gpio_v2_line_config_flags(lc, i);
+		polarity_change =
+			(test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
+			 ((flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW) != 0));
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
+
+			ret = edge_detector_update(&lr->lines[i],
+					flags & GPIO_V2_LINE_EDGE_FLAGS,
+					polarity_change);
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
@@ -770,6 +855,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return linereq_get_values(lr, ip);
+	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
+		return linereq_set_config(lr, ip);
 
 	return -EINVAL;
 }
@@ -930,6 +1017,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
+	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
 	lr->event_buffer_size = ulr.event_buffer_size;
 	if (lr->event_buffer_size == 0)
-- 
2.28.0

