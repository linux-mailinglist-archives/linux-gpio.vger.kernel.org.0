Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B634825E80B
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgIENrH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728647AbgIENiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:38:15 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5391C06125C;
        Sat,  5 Sep 2020 06:38:12 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z19so3993538pfn.8;
        Sat, 05 Sep 2020 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A0FDKIaOVzFSAR2B90PhOfINZllTIeSixiX8pmcfEzA=;
        b=ZbW7oXXKA/JzbcEHzumIe6a2YlCfODkpKj47CEoDPq7hVGzKe9vPECpzZcN+xVdcsZ
         tvHanq2J3q7QbC6OxJoiNRCRCXU0jnBxogq5KJ2i9mBZSRfj6kI31EiH5lw4yS2o2kl5
         PkNVVN9lVofuTYpEMd858n2n2VkUZAGHq9Cn9uJC3+BpS7z3XWqsw8HjWZWIz+Az4UkZ
         wN2zZS55ppPBd4jv+73cVCAS5XDKoKngFyZtjPiEZE8alOeoqpcWvW/DlX4GdwUSYeLf
         JzOqXs1KL+Cpe5ADmjhRWdXkCWnIlwpEUe1g3TfxQtrG0KOtXH01//+Py16GUZvsloqk
         y7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A0FDKIaOVzFSAR2B90PhOfINZllTIeSixiX8pmcfEzA=;
        b=OHRkYRLSoo93Uv+D2q/94hMNMlZ0czP+08SrUS+HSX6NUQ2Q5Fymw6U/p8Y2cW0vOU
         mNWSSDVWRzv9b/em0fVdETI+9NAdZSokwoMr2j2lUA40jgXE967aLlX1xKHzHNWugH8P
         IFqbY3Z3pAGdVAeKvw4yBL0Cl+DESuzg7fELfXHUjbiWaeQdovIXkHqOHafrAMifGUWY
         oDjKT0kO9Qv4PUjaYoymp3wpN3I3w7josLgzzpGWRGKBWQKya2q+rHnLruS18RFBk5IE
         33Va+QKBxxql/w6GaNVMyvSdj3TSbw4rmVtNbjk48kYHoXXXcxy76CQMvLtjdk/6HN9t
         P2hA==
X-Gm-Message-State: AOAM53024y2MLsfHkZhLmsYyXgAoVrLWG6iQr5GPMPCzOw5J3wT0/6X9
        ztZKjC3tHVRvM0vwhegOMcgJnBVF9f4=
X-Google-Smtp-Source: ABdhPJypUKMTjl4jY8SO7sqUsUjMKebbAtXsuw9PaPyA3/pDk3DELwGIp0vczFTIBzGqyyZaDu82tQ==
X-Received: by 2002:a62:84d1:: with SMTP id k200mr5735977pfd.235.1599313092019;
        Sat, 05 Sep 2020 06:38:12 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:38:11 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 11/20] gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
Date:   Sat,  5 Sep 2020 21:35:40 +0800
Message-Id: <20200905133549.24606-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
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
index 0d4d217a6e15..8edf7dc30cd3 100644
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

