Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C44BA158BC3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 10:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgBKJTt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 04:19:49 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33650 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbgBKJTs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 04:19:48 -0500
Received: by mail-wr1-f67.google.com with SMTP id u6so11340407wrt.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2020 01:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WZf3facF4s50NdwT8mwrLucdo4f673o12D7A+cRaFS4=;
        b=IvdQYrmBc9pJK1TFywFWWBon6C3UYYo+0C2PyXm3fgAbkHa/V/N7P0gAxHRuNqaaLL
         qjNb39/QlJoRBTimOXL0nwfosIjpXJSWhrjqu3qXLuXOztCwo3wffvlc3DQ87HYtEr8e
         M56GeY5qHdNA01Qk3ILJPnZERnGevP2YR6QBQsj8u0ivUT2khiri4+m8Dwgx7UZDs0F8
         oKOFpjyMkoP2uV4SIclRWqUu91ieIvdWd9mSsV5mSFzGoraZLQjH6h5QgjdYVBZxQuEx
         drRnW1GZW7ifFN9C29KfMrCysXrQHbczd6gZyhWwuAhb5MGB0GkVSMVVY6DofoVjy1XM
         foZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WZf3facF4s50NdwT8mwrLucdo4f673o12D7A+cRaFS4=;
        b=Et0z0s0UxvkA3kj1gZ3NEBPoZmBJ7DjDJ0Vkf9AcZq2J9bblG3JuljYyLSYUsvSGj3
         ttoEl9NuahM9KI8JiUxmM83s6jODBP9PvzMb7ELdrhr+OyPPbIXxiiLLsPiuioO0Hl3Z
         /8ZZFjngfygaPgSvHDnfMyR8mYNmJcZMAftsPuwWw1esNQZ1ezu2bLDfXXnG4fUgp9GY
         Zz7/lhSnldV4W7wC04BSyyUCPG/VZpxAiW2+XgQGH9EAsRxPe70v5uZnaiEdBJvS3f29
         R1GAetP5zmCqQgQBT65s2z5OEy/CewnWdkb9p4f40DE6AJkZnRy6XlZ5PR7KS4vLFawJ
         UP1A==
X-Gm-Message-State: APjAAAU69UdZ50EUtl0CF2DblI1u4E8hLgcrT+ArVUVkYHrD6/1yLk20
        8FYym5a9oVbWaUW+XEraiZcrEQ==
X-Google-Smtp-Source: APXvYqwutVR+gFaAhKhVYXjzYXV7b9kfdsaXOaxB5Y1QN8HLZ3rZPL2yGSDwb3FjpQ6923RvxHXGFA==
X-Received: by 2002:adf:f850:: with SMTP id d16mr7267259wrq.161.1581412786180;
        Tue, 11 Feb 2020 01:19:46 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id y131sm2958622wmc.13.2020.02.11.01.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 01:19:45 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stefani Seibold <stefani@seibold.net>
Subject: [RESEND PATCH v6 1/7] kfifo: provide noirqsave variants of spinlocked in and out helpers
Date:   Tue, 11 Feb 2020 10:19:31 +0100
Message-Id: <20200211091937.29558-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211091937.29558-1-brgl@bgdev.pl>
References: <20200211091937.29558-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide variants of spinlocked kfifo_in() and kfifo_out() routines which
don't disable interrupts.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Stefani Seibold <stefani@seibold.net>
---
 include/linux/kfifo.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/linux/kfifo.h b/include/linux/kfifo.h
index fc4b0b10210f..123c200ed7cb 100644
--- a/include/linux/kfifo.h
+++ b/include/linux/kfifo.h
@@ -517,6 +517,26 @@ __kfifo_uint_must_check_helper( \
 	__ret; \
 })
 
+/**
+ * kfifo_in_spinlocked_noirqsave - put data into fifo using a spinlock for
+ * locking, don't disable interrupts
+ * @fifo: address of the fifo to be used
+ * @buf: the data to be added
+ * @n: number of elements to be added
+ * @lock: pointer to the spinlock to use for locking
+ *
+ * This is a variant of kfifo_in_spinlocked() but uses spin_lock/unlock()
+ * for locking and doesn't disable interrupts.
+ */
+#define kfifo_in_spinlocked_noirqsave(fifo, buf, n, lock) \
+({ \
+	unsigned int __ret; \
+	spin_lock(lock); \
+	__ret = kfifo_in(fifo, buf, n); \
+	spin_unlock(lock); \
+	__ret; \
+})
+
 /* alias for kfifo_in_spinlocked, will be removed in a future release */
 #define kfifo_in_locked(fifo, buf, n, lock) \
 		kfifo_in_spinlocked(fifo, buf, n, lock)
@@ -569,6 +589,28 @@ __kfifo_uint_must_check_helper( \
 }) \
 )
 
+/**
+ * kfifo_out_spinlocked_noirqsave - get data from the fifo using a spinlock
+ * for locking, don't disable interrupts
+ * @fifo: address of the fifo to be used
+ * @buf: pointer to the storage buffer
+ * @n: max. number of elements to get
+ * @lock: pointer to the spinlock to use for locking
+ *
+ * This is a variant of kfifo_out_spinlocked() which uses spin_lock/unlock()
+ * for locking and doesn't disable interrupts.
+ */
+#define kfifo_out_spinlocked_noirqsave(fifo, buf, n, lock) \
+__kfifo_uint_must_check_helper( \
+({ \
+	unsigned int __ret; \
+	spin_lock(lock); \
+	__ret = kfifo_out(fifo, buf, n); \
+	spin_unlock(lock); \
+	__ret; \
+}) \
+)
+
 /* alias for kfifo_out_spinlocked, will be removed in a future release */
 #define kfifo_out_locked(fifo, buf, n, lock) \
 		kfifo_out_spinlocked(fifo, buf, n, lock)
-- 
2.25.0

