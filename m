Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F9223FE7B
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgHIN1E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgHIN1E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:27:04 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6341AC061756;
        Sun,  9 Aug 2020 06:27:04 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 17so3707895pfw.9;
        Sun, 09 Aug 2020 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uHj38SgEJOMyv9/gkXLzuXwYQehNLS/ebga0cV1L8rI=;
        b=NBi4iBJZUDgWJtyc02WAA9IuHcTSd0wHT5/aW8TtvRQj/4j9T2VIZOb32uH+YSbnkO
         HzGPL2M1wRLnYkVHvTUernChO/trX4k5McckH0XSkgfsFdgQ3TKmZz8EbigBrZSS5VrS
         D5qtyIFhzapFR2r6ijkkICvHwcr/geJ1ZkqFh99AT2oPOoUxCeEtm2/vIwZ9aoxsqejr
         1k1qPikDbTINxO/vGjwQSWPho9bs1lAjwjbG3twyZPpOVqildX0LIHvMheVBQs4jzrT9
         PUes/KMWMZDteNk/EI7z1N7zvH37pvR57OPd9v8m8npRTbjSVypGRGZWj2geq611VH76
         BCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uHj38SgEJOMyv9/gkXLzuXwYQehNLS/ebga0cV1L8rI=;
        b=dNrclGycmfBIYh01JFgJiMpOTa0qTuunRspX7xZPd/wganUnm/kOQuL4FL3xWZzi9D
         YN8bSU9fc5KM07B8TmHTnWoRs6F1xECYqE5hGjMDERt2tcdfwJENjKOzcNVRg9bbQtHj
         R1mFedw2OV+GvtwIPYkiLv2QimjGJBgkT+eluhtNbymAdUE8dulthzGEOmlUmPYn4s75
         EKMFAet/uwU3UTsIVY4GQCGUqGmNbzeI7oibVGomGLc4nTwZl3D74mMbYEfwy9Botc3c
         F9ia0se3MlBnh8CxlC8+P7Yj3IW/EF/QjLu6OpQyE8uxFkRe491LDgDAfDABJqm0Tobz
         DTDw==
X-Gm-Message-State: AOAM531w3vrYqQ9oD42MXMpxw5SBephtBUo1c3jAS1PNjE3CS4GJ2v1l
        r+sVkB4++cPVRISg2tC8VstMdVpA
X-Google-Smtp-Source: ABdhPJxVwT3QfKIhJ6l2dInlXhtN1i0XvbqgF6fS2P5cQiQlJAbgZbklakdOjRbk3mYfEf0YWo50Mw==
X-Received: by 2002:a05:6a00:90:: with SMTP id c16mr21783139pfj.200.1596979623559;
        Sun, 09 Aug 2020 06:27:03 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id j10sm9127414pff.171.2020.08.09.06.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 06:27:02 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 09/18] gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
Date:   Sun,  9 Aug 2020 21:25:20 +0800
Message-Id: <20200809132529.264312-10-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809132529.264312-1-warthog618@gmail.com>
References: <20200809132529.264312-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 67 +++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index d34dad50a048..2f5cc835133c 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -811,6 +811,71 @@ static long line_get_values(struct line *line, void __user *ip)
 	return 0;
 }
 
+static long line_set_values_locked(struct line *line,
+				   struct gpio_v2_line_values *lv)
+{
+	DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
+	struct gpio_desc **descs;
+	int ret, i, didx, num_set = 0;
+
+	bitmap_zero(vals, GPIO_V2_LINES_MAX);
+	for (i = 0; i < line->num_descs; i++) {
+		if (lv->mask & BIT_ULL(i)) {
+			if (!test_bit(FLAG_IS_OUT, &line->descs[i]->flags))
+				return -EPERM;
+			if (lv->bits & BIT_ULL(i))
+				__set_bit(num_set, vals);
+			num_set++;
+		}
+	}
+	if (num_set == 0)
+		return -EINVAL;
+
+	if (num_set == line->num_descs)
+		/* Reuse the array setting function */
+		return gpiod_set_array_value_complex(false,
+						     true,
+						     line->num_descs,
+						     line->descs,
+						     NULL,
+						     vals);
+
+	/* build compacted desc array and values */
+	descs = kmalloc_array(num_set, sizeof(*descs), GFP_KERNEL);
+	for (didx = 0, i = 0; i < line->num_descs; i++) {
+		if (lv->mask & BIT_ULL(i)) {
+			descs[didx] = line->descs[i];
+			didx++;
+		}
+	}
+	ret = gpiod_set_array_value_complex(false,
+					    true,
+					    num_set,
+					    descs,
+					    NULL,
+					    vals);
+
+	kfree(descs);
+	return ret;
+}
+
+static long line_set_values(struct line *line, void __user *ip)
+{
+	struct gpio_v2_line_values lv;
+	int ret;
+
+	if (copy_from_user(&lv, ip, sizeof(lv)))
+		return -EFAULT;
+
+	mutex_lock(&line->config_mutex);
+
+	ret = line_set_values_locked(line, &lv);
+
+	mutex_unlock(&line->config_mutex);
+
+	return ret;
+}
+
 static long line_set_config_locked(struct line *line,
 				   struct gpio_v2_line_config *lc)
 {
@@ -880,6 +945,8 @@ static long line_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
 		return line_get_values(line, ip);
+	else if (cmd == GPIO_V2_LINE_SET_VALUES_IOCTL)
+		return line_set_values(line, ip);
 	else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
 		return line_set_config(line, ip);
 
-- 
2.28.0

