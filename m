Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB90227A4D1
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgI1Aaz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgI1Aaz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:30:55 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B49C0613CE;
        Sun, 27 Sep 2020 17:30:55 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 5so6798224pgf.5;
        Sun, 27 Sep 2020 17:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AW1sSBKCVsXpYEbajwLasF/VVriD8AxM28/q4ZLpQUI=;
        b=eTfUZzLvj52P8rwZvTiMTdHAz0V/blgrPBwyen7HBkE1rTNaVTg03UGx/h68efQ7DV
         4gTlB588wGjRREj89AJnGy5aPs0fYmeTg9OpVTz8bk5AKqt+L1kyuM27/X1ArDSDrAXr
         rtmyL8xwHX1Ea7e+VZtyRiM9KsXoOz+TLXZ7y2BsvQBVaWuPy4q3U+uuiJqbLQyQ1as9
         5jNCZlIltC2zzeWP3mzpdNhF1lcMVxrriM/dhSpeoUJfRargDAc22dyXJIzyqxwdL0OT
         PeHOwje0a3cpe5JxGmXadt8FWstC8JZlQ/stNGrKpHNBQKdULk7M3hs//tey6Ocm5ShM
         i3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AW1sSBKCVsXpYEbajwLasF/VVriD8AxM28/q4ZLpQUI=;
        b=nI6JbvKF4jq17uNVmTkU4gyoITo3U3korQk+o2bXgKkLlZRYY5hWUnBQlkcFtERjS9
         JohSVQqJ5okgXXqqCYDPrTENWW3ojFFk0ZBzIZmvTgz6jHLAg53z6LDugn2xUC9gz6oP
         rua7j+WEP0EMudEZ7jNGxAnexTqke3y9Sm3VJ3PO6XiCeI+T9Luxf9a5egvp2sH1QZxT
         c+RfhZYRUnusl9Vn7dos/8+UEwYulBwiRsHS9eUJl2k1ztSZxJ2X9HpY5F2oXGsaLwGb
         oxRuIBY4bGgSmMvkJcNPttmUbE4U7hiRPHzXve1xjRDT7U4TfTe5CbdoGtsyEb7U+5Y7
         SmGg==
X-Gm-Message-State: AOAM531PNbvHMhm15vlPIddTu9vhrPNnqq+5NULQRJSrq5fQGxhOeKpy
        vqXjGgdm0GRFdZAP8DnOdLv0rTRwpIMoaQ==
X-Google-Smtp-Source: ABdhPJyuqI4mhQC3TJaLtO8Wag4fTcIPoj3L/2nrfB0fii178MWZwmzl0TwGHkq3hMfwr3HQqGe20g==
X-Received: by 2002:a62:1e07:0:b029:14e:d96c:9e04 with SMTP id e7-20020a621e070000b029014ed96c9e04mr7911448pfe.58.1601253054756;
        Sun, 27 Sep 2020 17:30:54 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:30:54 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 11/20] gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
Date:   Mon, 28 Sep 2020 08:27:58 +0800
Message-Id: <20200928002807.12146-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 608cdbd1d579..25536aae3e18 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -816,6 +816,65 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
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
+		if (!descs)
+			return -ENOMEM;
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
@@ -892,6 +951,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return linereq_get_values(lr, ip);
+	else if (cmd == GPIO_V2_LINE_SET_VALUES_IOCTL)
+		return linereq_set_values(lr, ip);
 	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
 		return linereq_set_config(lr, ip);
 
-- 
2.28.0

