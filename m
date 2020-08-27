Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24DB254705
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbgH0OgN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgH0ODt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:03:49 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2CFC0619C3;
        Thu, 27 Aug 2020 07:02:58 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id s2so2056233pjr.4;
        Thu, 27 Aug 2020 07:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sW0UkKvySH75oSJX+PFR3W/jRHYtpquC/ixEl6sp2QI=;
        b=fKIP1ZdHXmNp26ExQxS9YbW5bZnFmC9whdfPXGG9/aebcBxJ/BWbm1E5Sls4nk/60i
         42oZMhteIubV/JIgHhdLpGDBBZ9f/DhbDZWoMS1trOxiE3n8GWWX1k5RiPy0klGp8btC
         pUGwG8GlzkLZNqvfCDi9aqWZF2Z4X4krCFt4ABYdzQFXmFFxNPFB8+Z9/ss64PzjVdOH
         C/oZA7XblZUae3DHdZ0Rn9RFTefokvjMbmf5Xspdu3+k9VffInFaOzS1/CkIgjXPOttj
         HYXH+FEUrDTPkHuffCnYY6aM8ZzLzCF/1O6MGyqECoVEmGDft3kwPqTMRFOVCvuhhE1T
         dObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sW0UkKvySH75oSJX+PFR3W/jRHYtpquC/ixEl6sp2QI=;
        b=jHjNwWSEiKN4LozyBxQVZUKSYO+VWHKSwpChXoRcwJMrTHMgkWnhiO8FVM7C7cjN2j
         x06RHyjowJVBMwKqLtTo4oBR2NogsbKhYARXRuC9FqibmHXE42pA+gBtN65RDo+TNQDu
         uWMO0U/MI5s2Adq01xkD6XWEQoOHYOCcX1JY6TQUBmcuA3VRxmdWQu6t/EbYcJFBhrNP
         bAJoD4mNLUj7jg9s2tVC+haBamHc4W8fwiNeMd8BoRgsNt4H6svh5kDhvV0qcnv/yUpk
         YU1CruQ83RI8aTnSgOq5/I3swkdzv+/27cV3uDV+KIoSC4ipPiQiBzrdy6BsbhJayile
         Cnkw==
X-Gm-Message-State: AOAM531yCF7xaX8yM4576+weqAtYEIhxXGhsdvwB5aHVYKvUPmO+XdOR
        2F8XgdAPIfUt58CRzrOjoqjGvOTz96w=
X-Google-Smtp-Source: ABdhPJy9y+9ovRDPtjgT2GDLbGBWJ6ur77ZSM77JQSQV0R09nkpSrWDh0bcTTA5+3uLG/lfD1ofyIg==
X-Received: by 2002:a17:90a:d3d4:: with SMTP id d20mr10496642pjw.111.1598536977465;
        Thu, 27 Aug 2020 07:02:57 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:02:56 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 11/20] gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
Date:   Thu, 27 Aug 2020 22:00:11 +0800
Message-Id: <20200827140020.159627-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
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
index 9c1e3f5f01af..3d2d9eefdfa0 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -799,6 +799,63 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
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
@@ -869,6 +926,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return linereq_get_values(lr, ip);
+	else if (cmd == GPIO_V2_LINE_SET_VALUES_IOCTL)
+		return linereq_set_values(lr, ip);
 	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
 		return linereq_set_config(lr, ip);
 
-- 
2.28.0

