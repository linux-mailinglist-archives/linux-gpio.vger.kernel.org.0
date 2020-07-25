Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67CBB22D4B2
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgGYEWB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGYEWB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:22:01 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E149EC0619D3;
        Fri, 24 Jul 2020 21:22:00 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x72so6335618pfc.6;
        Fri, 24 Jul 2020 21:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BQHpbdZsyy7ix7v7aLwAzrkqv4jy9/V4hGoEUbnEOlA=;
        b=rRwvX/RAzuW9fCsHB3pSGgGYKQx+UPTN+xGsn9YtML1i2IBMz3YI8yg4EEg/4oORl7
         VP2Xk1y3Iwba3M+Rj8zUPHQxfO0VLlOtqTEfDOfB+TOVxVuYljt08P1HS78DzlnyNY9a
         TAz2VvLV8r19QbMYHiz4Lz4QWh022b665dd/0Ga/CKwPYSLQkt7mUdsOGgSPBr8/6In2
         hboYFgNVYtigH7QMGGwEyJxkiUHWDjf2tzyUYon9eFdXoNRmXlAWtO0jC6bSjLdrK1oI
         n/EeoirZgG6bPw6NDvRGZBKrKBsJCJnZDgPDaQBzLdjHkt6oKfiQLfgYeab1XF791/vm
         LbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BQHpbdZsyy7ix7v7aLwAzrkqv4jy9/V4hGoEUbnEOlA=;
        b=EZmz/Dv1lnth5CTcnntgaQfLHnz/pl8rVHtPVyqWZPka+Uy5pzBch4ZbG9Mflcp/Ic
         RaK+Nam1Bu24VtFhFAof8We9uB1XKI5EywhUtO/1NNOpW6zHSKlwH2lX1Rwq+WHcRTo3
         R2omu3sqFxc5zJxoVtdmMJhJwlret0BJqBKgmFCnsXgBQ4OP1kizJBsm+KcFkHLKJFS4
         HytsUTOiAWiEIdoNI7r2X6LaucsQ3rpkE8y6C754KDNCJrC0Fc+uHni9UJQzH/lIw1ga
         LqWhs3HN0cJed0TKrT3A0iVKaj83aGAvBvMEFR9Hyma3xhZ0mehjyj1Nmkat0IBUINru
         BbPg==
X-Gm-Message-State: AOAM531BO1pvYW0ciRnD4J7rTlrLJFQcGjK3B6ZhrJC2G9fRlUrRhZnw
        /qys4axGOmmatg8C2Iz/P7yTHtQc
X-Google-Smtp-Source: ABdhPJySu+Lj9P0eqPlRa6l5tCHVyD2eueHIjt7EpBui6O7AUbNghCSSsdPaSzqjIKH+U1LcNHHUaw==
X-Received: by 2002:a62:2f86:: with SMTP id v128mr10626014pfv.247.1595650920105;
        Fri, 24 Jul 2020 21:22:00 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:21:59 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 09/18] gpiolib: cdev: support GPIOLINE_SET_VALUES_IOCTL
Date:   Sat, 25 Jul 2020 12:19:46 +0800
Message-Id: <20200725041955.9985-10-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the GPIOLINE_SET_VALUES_IOCTL.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 4822cb10aa40..0482a16388a0 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -785,6 +785,70 @@ static long line_get_values(struct line *line, void __user *ip)
 	return 0;
 }
 
+static long line_set_values_locked(struct line *line,
+				   struct gpioline_set_values *lsv)
+{
+	unsigned long *vals = (unsigned long *)lsv->bits;
+	unsigned long *mask = (unsigned long *)lsv->mask;
+	struct gpio_desc **descs;
+	int ret, i, didx, num_set = 0;
+
+	for (i = 0; i < line->num_descs; i++) {
+		if (test_bit(i, mask)) {
+			if (!test_bit(FLAG_IS_OUT, &line->descs[i]->flags))
+				return -EPERM;
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
+		if (test_bit(i, mask)) {
+			descs[didx] = line->descs[i];
+			assign_bit(didx, vals, test_bit(i, vals));
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
+	struct gpioline_set_values lsv;
+	int ret;
+
+	if (copy_from_user(&lsv, ip, sizeof(lsv)))
+		return -EFAULT;
+
+	mutex_lock(&line->config_mutex);
+
+	ret = line_set_values_locked(line, &lsv);
+
+	mutex_unlock(&line->config_mutex);
+
+	return ret;
+}
+
 static long line_set_config_locked(struct line *line,
 				   struct gpioline_config *lc)
 {
@@ -853,6 +917,8 @@ static long line_ioctl(struct file *file, unsigned int cmd,
 
 	if (cmd == GPIOLINE_GET_VALUES_IOCTL)
 		return line_get_values(line, ip);
+	else if (cmd == GPIOLINE_SET_VALUES_IOCTL)
+		return line_set_values(line, ip);
 	else if (cmd == GPIOLINE_SET_CONFIG_IOCTL)
 		return line_set_config(line, ip);
 
-- 
2.27.0

