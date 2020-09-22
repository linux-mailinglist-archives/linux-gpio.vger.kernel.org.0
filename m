Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2932738B9
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729071AbgIVCf5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728603AbgIVCf4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:35:56 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D705C061755;
        Mon, 21 Sep 2020 19:35:56 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a9so766433pjg.1;
        Mon, 21 Sep 2020 19:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MgSl6kZ4hesOBe3O8hHwvM5Kc/CNBzL6db3fP9FdH8M=;
        b=T97sYTEuXnh2+2DAExFEt7J/s1iSce9nn57/beTArUmjsrfnU/AsDAp3D4YCu8+T5q
         ft98HA72vXC/4gA8owgv/No4OCrViCiS+ATPn2vVzr56bhUTWoxA3U2HqR22a2P/p+yy
         JjyO8mApIRNgPVaf9mQsT0m0Hiu2sXGb6qHX+HKYyqvFExvGSBvFIEMedUyfN8nTMeWi
         4GvYrdN2/lloiiKqXTpiTr1LT6kEGxifeOekF47RQLinPLQHknCqnFV74BVsS2LHpHTx
         LkISkbR825esjUM4UlEsD6OOBMVds+61MxoXLINhG3KqqaxZUX1ODhOI+GP+bZkx+gyW
         IFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MgSl6kZ4hesOBe3O8hHwvM5Kc/CNBzL6db3fP9FdH8M=;
        b=cD9etyeueVphIDEsVdoEDoexw2/XNf3DyDQRRznfgKAxwi7Z4QuB05K8VrmuiV2isZ
         clIeiQhI5dpEnar627LFYEtG3FTafGMdRuOcX/4pXZEglBWFRW6GGMmEJEiGNLdKhDtY
         CX8rgD1JSNJ96ZW1AtcBoGfZ5JyJ91VZSnyL1vxbaSFoPu+h/XfLDxTnbIqInDm2OzDd
         XvPl3+2BBLQTpSdMrCF/9YELj1qGSky4zP/QVwBJ7DiLNfUXy6ycscju2AH8cqSvTxJb
         BkQ7Eony2lwbPPeLeKkifg1cBIyBPgCOsOXfGxA3Xvnu9JqNt/IKoKFBcHD9dSnkeqKp
         rcsQ==
X-Gm-Message-State: AOAM532f36//nkc5BPQz75nTZTOyhu+C2tcMGCKdJaPS2qRWTFPI427K
        ObIYfEyJ6JlpYGrKIgb6I4i1C1EwxwT8vg==
X-Google-Smtp-Source: ABdhPJzqXg+7WDJa7JoJvegEGW/4I00E3DcOH38ppSjg4HxYYbBbZboFy+bbANpu6I/K1z8xnT+jMw==
X-Received: by 2002:a17:90a:178e:: with SMTP id q14mr1956603pja.154.1600742155597;
        Mon, 21 Sep 2020 19:35:55 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:35:54 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 10/20] gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
Date:   Tue, 22 Sep 2020 10:31:41 +0800
Message-Id: <20200922023151.387447-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 145bda2151fb..debd3b277523 100644
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
@@ -444,6 +445,8 @@ struct line {
  * @seqno: the sequence number for edge events generated on all lines in
  * this line request.  Note that this is not used when @num_lines is 1, as
  * the line_seqno is then the same and is cheaper to calculate.
+ * @config_mutex: mutex for serializing ioctl() calls to ensure consistency
+ * of configuration, particularly multi-step accesses to desc flags.
  * @lines: the lines held by this line request, with @num_lines elements.
  */
 struct linereq {
@@ -454,6 +457,7 @@ struct linereq {
 	u32 event_buffer_size;
 	DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
 	atomic_t seqno;
+	struct mutex config_mutex;
 	struct line lines[];
 };
 
@@ -573,6 +577,8 @@ static void edge_detector_stop(struct line *line)
 		free_irq(line->irq, line);
 		line->irq = 0;
 	}
+
+	line->eflags = 0;
 }
 
 static int edge_detector_setup(struct line *line,
@@ -614,6 +620,17 @@ static int edge_detector_setup(struct line *line,
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
@@ -796,6 +813,74 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
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
@@ -804,6 +889,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return linereq_get_values(lr, ip);
+	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
+		return linereq_set_config(lr, ip);
 
 	return -EINVAL;
 }
@@ -964,6 +1051,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
+	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
 	lr->event_buffer_size = ulr.event_buffer_size;
 	if (lr->event_buffer_size == 0)
-- 
2.28.0

