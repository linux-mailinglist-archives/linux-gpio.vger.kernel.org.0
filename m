Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 664381267D2
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 18:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfLSRPq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 12:15:46 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52894 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727049AbfLSRPp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 12:15:45 -0500
Received: by mail-wm1-f67.google.com with SMTP id p9so6238272wmc.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 09:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K3tKF/sG1li0TNgHDm/zaOCBiB+0gN/tDFvNC2uEQ+I=;
        b=yvCbBMgsXygGH3FpIEPNHsa/VXxazpj/KKkweqXvtiwPAGQGvioH+U4zhS4FEmBe2J
         3bcwHbePdFYkv53xANQ07yko9f1EpaEr06XKEiGQfmhzVB+KP/bm5qc4/qMY36kFNMa/
         An7xjv4KBFJgqalgay1+pIpHbpovJVofNQK1nUAzV4DChKHO1sOyRvVge6MdEKhIav9J
         XfBN1rrrif8DB15FRkaW/sYyvboMW6CIm5xx65HaoItIainM6I0Z6HuYLXsb90I8IJTM
         znXgVy2wze2oBNhtr70aExe9Z6UEqj/ha8WrO3msi1bx41fkBu68d2pgssY4yX8VGKA0
         RKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K3tKF/sG1li0TNgHDm/zaOCBiB+0gN/tDFvNC2uEQ+I=;
        b=aptyJ3erMvC0mfjDhkotY6bw0G5zEXteE14UEipdDlzbK7A0Bdlh8pvuRAjvGNfuMh
         65ol7mqfmq9UqPN+XgfdQWCjHaoO0PjddpM7LdqgUVTPxtL94TvXXQJmtupP2f17/xR+
         ntVumTHesXeYXBiCRTO+5MccQY/LkgzOecT69yWuPJkdaEImIFy87k1vqV2uzxrkuHEX
         QVyRTuGgMX5PEdK+D8tRZJhV/yCF9kPFJklHNomYpBzHpgrReJcj5IHDxUlqa+AGsqe9
         CJcGaF0wC9AS1bz0TPPQioWlbTGJROrdDejjlAWrbX7AEsG/FykFYMELEvRLhDyQhbkd
         aARA==
X-Gm-Message-State: APjAAAWdn7BAiygL+kQQ9+GNP9b74jNMQOu9DQNXXI5GL1aHlF3peTqF
        ecvFRcm5pIBtCfxrlN7NWf6JNg==
X-Google-Smtp-Source: APXvYqzi/6ikWTdHrJtfEWndoMXEyahi/G3Kdtq/Ybn6ZO7teucGMeyvx1jbrI/xqlhXvEYWp5KGVw==
X-Received: by 2002:a05:600c:2050:: with SMTP id p16mr10682400wmg.176.1576775743241;
        Thu, 19 Dec 2019 09:15:43 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id q6sm7401428wrx.72.2019.12.19.09.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 09:15:42 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 07/13] kfifo: provide noirqsave variants of spinlocked in and out helpers
Date:   Thu, 19 Dec 2019 18:15:22 +0100
Message-Id: <20191219171528.6348-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191219171528.6348-1-brgl@bgdev.pl>
References: <20191219171528.6348-1-brgl@bgdev.pl>
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
2.23.0

