Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2BD257239
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgHaDXM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgHaDXL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:23:11 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E59C061573;
        Sun, 30 Aug 2020 20:23:11 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id g6so2267926pjl.0;
        Sun, 30 Aug 2020 20:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OYsLApoVefZ4GPKHQ8Fka3prg/gKgrKG6Hmpz79H9rM=;
        b=OWHIypdjjBcDam3qaKLcAR9u2E0BAQoRMuJpJDm91pvLrvDTaWcb1bLxnoMztKjQrH
         FN6enZI81CzFvePK6SC/JBFoI/6MxrS5zEJHlZA1SyVMiK0L88ItWUNLksHT60cwK+ri
         LnSZlyzFcLELCQQ5ARynQMi/4gyGbEtvuCJkbZ9GVQiSXWXaFcSYndTHPmg54092UZJc
         3jEzoUKJ+BuJaZRMPF1+1I7hG3yMoOnt+YjGYUtNEll1uJ7zYVDRmqxVZ1FXyXLj21UY
         NDyz4dToN4TFYCnpLJhWqnl6b79R4lzSP8NkAg3eLgXdHgW40Olon2IiL5IX75QOrlXg
         PEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OYsLApoVefZ4GPKHQ8Fka3prg/gKgrKG6Hmpz79H9rM=;
        b=p0WOJSxNdQC0l9qCsIh1nRltLIbbDJpKg7IHRGaxT57SZKNYLkF/Lyim2vQKNADvgp
         U5P0CH5SHICeF5AOMl3GUyEw5AQVT9mX8KWnDHHzOQusiFllhRXAM+pKQ6LF9NdtPFj4
         761de4QEsACWPObkU2L9tqw/vLyVrMOaw2mKtIYVgtHPk+pAuEpFDBCZNuvROzqERi80
         PDNJlJUa5l729C6qa3UXZF8jibX9kbBxgzJrRrbEM0J5GKdfKI5eR9+4cueyKkZ1pZm6
         mjm0oU5WmVOeHrofCyqXWkSmvySpJ5Tb2D9bBaFFgL5Pt651QQIvXu1vHgKA8naYHInS
         48iA==
X-Gm-Message-State: AOAM533JGKB1iabmaZfJOoeegQdsLb5UE4KbogrmYakOtKonVlKEPksY
        9ECyzqqNl8X45xqc1he1KardJHivBG4=
X-Google-Smtp-Source: ABdhPJwDpvhZAyur00KOKxjLkHHFkyXAHahCr5c2g5qo6vHWgRdP15gk9SFdtgPoyKZ8+oFQRgoZGA==
X-Received: by 2002:a17:90a:f298:: with SMTP id fs24mr4136544pjb.4.1598844190249;
        Sun, 30 Aug 2020 20:23:10 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:23:09 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 11/20] gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
Date:   Mon, 31 Aug 2020 11:19:57 +0800
Message-Id: <20200831032006.1019978-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 936b8c9958dd..9f05bbd2161e 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -777,6 +777,63 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
 	return 0;
 }
 
+static long linereq_set_values_unlocked(struct linereq *lr,
+					struct gpio_v2_line_values *lv)
+{
+	DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
+	struct gpio_desc **descs;
+	unsigned int i, didx, num_set;
+	int ret;
+
+	bitmap_zero(vals, GPIO_V2_LINES_MAX);
+	for (num_set = 0, i = 0; i < lr->num_lines; i++) {
+		if (lv->mask & BIT_ULL(i)) {
+			if (!test_bit(FLAG_IS_OUT, &lr->lines[i].desc->flags))
+				return -EPERM;
+			if (lv->bits & BIT_ULL(i))
+				__set_bit(num_set, vals);
+			num_set++;
+			descs = &lr->lines[i].desc;
+		}
+	}
+	if (num_set == 0)
+		return -EINVAL;
+
+	if (num_set != 1) {
+		/* build compacted desc array and values */
+		descs = kmalloc_array(num_set, sizeof(*descs), GFP_KERNEL);
+		for (didx = 0, i = 0; i < lr->num_lines; i++) {
+			if (lv->mask & BIT_ULL(i)) {
+				descs[didx] = lr->lines[i].desc;
+				didx++;
+			}
+		}
+	}
+	ret = gpiod_set_array_value_complex(false, true, num_set,
+					    descs, NULL, vals);
+
+	if (num_set != 1)
+		kfree(descs);
+	return ret;
+}
+
+static long linereq_set_values(struct linereq *lr, void __user *ip)
+{
+	struct gpio_v2_line_values lv;
+	int ret;
+
+	if (copy_from_user(&lv, ip, sizeof(lv)))
+		return -EFAULT;
+
+	mutex_lock(&lr->config_mutex);
+
+	ret = linereq_set_values_unlocked(lr, &lv);
+
+	mutex_unlock(&lr->config_mutex);
+
+	return ret;
+}
+
 static long linereq_set_config_unlocked(struct linereq *lr,
 					struct gpio_v2_line_config *lc)
 {
@@ -853,6 +910,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return linereq_get_values(lr, ip);
+	else if (cmd == GPIO_V2_LINE_SET_VALUES_IOCTL)
+		return linereq_set_values(lr, ip);
 	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
 		return linereq_set_config(lr, ip);
 
-- 
2.28.0

