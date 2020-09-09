Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D4C262D37
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729622AbgIIKcP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729251AbgIIK2V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:28:21 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAE3C0613ED;
        Wed,  9 Sep 2020 03:28:20 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mm21so1109638pjb.4;
        Wed, 09 Sep 2020 03:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3IVl2bcGqMzH5g50+3h123xFWFKslEzTZ0XaFzZ2uFU=;
        b=OHfu8HEkmffdLDUCZ30TKXklbo1uVC5qe/fuJj0x3ilyBvnJ6hv9SNC1SKkPQGxFDt
         tdJwlh2GEOem6yN1bCxNozsqP6/Teco5rZYUOLZqhrKBBz/9fjbrSCH1UWwkUMNkeoIw
         lApD5ZVuOQ0bKD5fS+8cBahs4PvT7/fElpYiOP49hqng21B7Ettg2q7aUDIcxDZGwssS
         xKxx++NwKUssOOqtm6JhqWbgOSMBszW3lxcu7T0fOVzr99K0JmDft2837UXsBtFk63Qm
         aIc93fL7JxP3/Otxgy8lBpDJZTovb74eVpQrqTLqlnZdhiK+6Czf4VoRQbyfLwmtA9H8
         aUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3IVl2bcGqMzH5g50+3h123xFWFKslEzTZ0XaFzZ2uFU=;
        b=ecDz1n9zMtXP6ycAMUwUvMD5clBxYarqSTYvLm62Af+QxwbaaV6m+iElBN/oAx9gq6
         Qlymztr9b3CeKkD9nYIXOwfbdkc/uOt+JtgOkZEIcGsldSSoyCDbg7fD/FpgFO3lO1jg
         7QeCEjCmoaog5NAawNbyFoVqIZA/mwgdsx3JB9sbLlsivpX/9emlb3T7ytSvHlbC5WIt
         cc69pEsKiR3g+YXf7LQJiYoZB7zsmw/Q5HEYaZk80Ph+/GIdigdV4iP60fUrP4p6PtM0
         7CmpOhmDcoGkfgWGEjTUJUSwlj0PEfJC44mc6LOKns1zYP/FvBarc5c+tWQh+t2XGpIE
         P/uA==
X-Gm-Message-State: AOAM531u+3qApo4Xm6pr7t1BMgOS1Iuv4FGiGIXSog0KuvGyBaJWMW/T
        Bz7orZK8UBf9L8OuMdkL054B0i16z8I=
X-Google-Smtp-Source: ABdhPJxWji2Bk0mXOM5mrF/7YwKSuwZ+je51mCC6ljroTlAlD/LAiTkumkRPJ9VUyoDOmQKN6O9sWA==
X-Received: by 2002:a17:90a:81:: with SMTP id a1mr248495pja.136.1599647299162;
        Wed, 09 Sep 2020 03:28:19 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:28:18 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 11/20] gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
Date:   Wed,  9 Sep 2020 18:26:31 +0800
Message-Id: <20200909102640.1657622-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b6da92d9dba1..12d5c6543c15 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -779,6 +779,65 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
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
@@ -855,6 +914,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return linereq_get_values(lr, ip);
+	else if (cmd == GPIO_V2_LINE_SET_VALUES_IOCTL)
+		return linereq_set_values(lr, ip);
 	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
 		return linereq_set_config(lr, ip);
 
-- 
2.28.0

