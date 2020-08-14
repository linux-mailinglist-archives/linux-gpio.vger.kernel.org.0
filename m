Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7D12443C4
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgHNDEx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgHNDEx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:04:53 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4316AC061757;
        Thu, 13 Aug 2020 20:04:53 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id m34so3832344pgl.11;
        Thu, 13 Aug 2020 20:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=id2yCOcY/kLWgNpSgBrFBrYhr1/oEj38W9XI4BIRcLQ=;
        b=Xd1iMaRPMDmisbYJcR9JA8EgrlXLkXHq5g+FRXUw7FxNsvP4k1/PJZH3WS8LHeasuV
         x2NA98+5wNiWUHl95hmiMYYgt+Sf6XWAcN6f7zfH1YW7G3KBwmKZ1BfPv2FMDxvW/ayy
         LoJd/r9+Hwk0piSPyoRY0AdOj5Aeorposnp8Kmo9C/J6ep9aTmLD+c0NVI8QT9JWTEBd
         emI5qTCLANFEQ8oT7qHOdBT0DYc02VkmBDuEqKa2zw2XDQgM+eVuZZKRITzoJUxyhHtL
         I21bQJScSSh5jM2CnqA54+x6yqg8WcduX4cWK4p43gWS0KAyqrIZAuhH33dGb5OJMLH6
         EIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=id2yCOcY/kLWgNpSgBrFBrYhr1/oEj38W9XI4BIRcLQ=;
        b=VImJY9pQsz2DaJ1aZZ9hBnwoM7ti1FstsfkyYaP5sriwdO2sDd7zq6b2QjWzuvfFYq
         eVfdPwJOeSzpNpe7E3s37Qyd3jJFtipWIc985HdzPNzuqQNefr8bT8BN9lp1BMN/W+s7
         aIS+XnpXCsyuNKwC3BRy7PwM8BCEx5+6yatNfV00QMhhFNg+1wSsMynvNSqIqKGr7N7s
         UYoKxuKyJRbN4WqFKQsQfgI/D3T4YnVTPTzaFP+BLqALGOkUkUckKa9UbwepxG6JGDZJ
         xgPHT577uWyFm9/Tktsk4f2A79+GemJlAa5cZOSmmvUDO9ZUC2YA5cHZ3G1JnA9ZlYUL
         0iwg==
X-Gm-Message-State: AOAM532DV20pUMTOYXWap/rJRV2KzDjEO+zESsaoYrtrAwkZIoIg3I1z
        jUF5eOoG+ESe6EilHGL7nGImFm8r
X-Google-Smtp-Source: ABdhPJwgGxpU9hYbuXpqcIykFyRwBa4hmiFAzXBHiUj8zO5ijlEjMyrI9EUWHT5Kw/YKXXKM2oetoA==
X-Received: by 2002:a63:1f04:: with SMTP id f4mr439564pgf.34.1597374292434;
        Thu, 13 Aug 2020 20:04:52 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:04:51 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 11/20] gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
Date:   Fri, 14 Aug 2020 11:02:48 +0800
Message-Id: <20200814030257.135463-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814030257.135463-1-warthog618@gmail.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
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
index 04472c2b6678..de88b7a5ba0f 100644
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

