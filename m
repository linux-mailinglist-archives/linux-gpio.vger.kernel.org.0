Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0312AD65F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 13:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbgKJMeQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 07:34:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730375AbgKJMeP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 07:34:15 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53343C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 04:34:15 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id 33so12475286wrl.7
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 04:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t/9DP21Y/K7Z/VraeZB1byIXgPmUm3+JNNTaYKuJoag=;
        b=hKkxFUBeGtofgNXK5OXRrh+vsnz7Thn/3XUvECCmtbNszHbpSYac2sNL38IpmJ5prk
         q2m6bm63ecpHW3vLayRdGzaYTNGjA6xq42M0umpIPYQVC5RMBJgHHHmlUVI/KITnjDvX
         yxQDpa1fM3QTybTNc4f8QkhrWnEUs8uQpl9W4dYQEGcep5Q3D2QEXLjPs/TF5vJ8Z1Bk
         W5dx5T2S30yKaR3tQEYQ2cbDGbz4qq7GfILKYY7pQaKFj0GkdG8bd48wB4OjgrciJnJp
         QKWXjJvqA5XnfJy35tDvaLTj7pVIcXlFFWS7bjU8Qga8m/lzykpz3s7OcHXbehSjaurP
         WJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t/9DP21Y/K7Z/VraeZB1byIXgPmUm3+JNNTaYKuJoag=;
        b=O6UIpyarSgjSAIs+ts0l+ZVQNM7IDTjyg9uoN/1tqroobVCkAvmTyylxBv+Z9HW803
         3UroP1Qjm8vHk+fFT1VMZNXnu02zbV6cKg0+1FdftwG3o1oeDGDJmQhnJQG7bX3NjJys
         Yo/By/nMH6RleqOxvKIjuMz2W3T2DIYtb385pM4XuUbqpAjLoSBvkYUCbQ5Vd3q3SOA+
         kRd4TsWN4P+rID+xIlzO4+GAdxv+WRRDkO80HomyIR/jnwf5PV2l6/6wIoR1mVODYvVe
         +3Z8Sf7cJCH8fqZKpzkEaUwd3tvGTATk5HQhEPLw3IHYJ0+6jAd8tjqX4M/bANMnMHdr
         NV5A==
X-Gm-Message-State: AOAM532jKjO0T5gsKbbahC4f4JE1HMJ4WGQCjw5Y/r6XDv1onhzO3ka0
        QobdMqTLL7jAY/LLYJUfzPYsTA==
X-Google-Smtp-Source: ABdhPJxu0VeDcAVI6R6UoqvguHg90OWMt8azWYcvtBkbHOKQQv0bF55jq/CC96lwNVR4zhVtqSgwAw==
X-Received: by 2002:a5d:42c9:: with SMTP id t9mr10112703wrr.13.1605011654162;
        Tue, 10 Nov 2020 04:34:14 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id s8sm12942217wrn.33.2020.11.10.04.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 04:34:13 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 2/7] gpio: exar: include idr.h
Date:   Tue, 10 Nov 2020 13:34:01 +0100
Message-Id: <20201110123406.3261-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201110123406.3261-1-brgl@bgdev.pl>
References: <20201110123406.3261-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This driver uses IDA APIs but doesn't include the relevant header. This
fixes it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-exar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 4202dd363a11..1941ae533418 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -8,6 +8,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.29.1

