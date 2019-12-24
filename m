Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 316EB12A119
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 13:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbfLXMH5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 07:07:57 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44423 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfLXMH0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2019 07:07:26 -0500
Received: by mail-wr1-f65.google.com with SMTP id q10so19648059wrm.11
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2019 04:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K3tKF/sG1li0TNgHDm/zaOCBiB+0gN/tDFvNC2uEQ+I=;
        b=g9lElHhRIBO+8JEjfNQMA2XVSiVQ30Ri7z2hJTRPm/j76Zx+jJmIIj5Xk1TO2WTEgS
         JcPqP0HQePpxXiyH++hJanMAX+vXYghttAmn6yYEdiN25cuFwAXOeIX1q5Pe0oIAwcBh
         42iR7XTlVPGTIJwvBP6pxkEOCSLU0meQVw9ZuvwFC4zdFig7tW2Ozy0cx5W+ZyXQdrZb
         rh4daaHeRMx2uAe5Mg0ug7aXbCnNSOd0hCK6SmGf2O5Wum2RjliPZyRwGfZrlObGe8lz
         qlIxQNUjMKFU+3s9zbZGimAfru7gT2n+4SEHBbpFfvht7MRLthOreQqSC9/YTbj58JOq
         q+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K3tKF/sG1li0TNgHDm/zaOCBiB+0gN/tDFvNC2uEQ+I=;
        b=LFQ0HThHr122SMzhTIDzYtTZmJEX7dLVuf2k6tNytZyrYKHZ+KbSQg4gZxN3OCCLAh
         1hrtsYw0CWIKa9ew5909GMp2SyUV3TVt3uQ5MluzRh0cFZl+0yAqD3z2BC8iNuqb4CX/
         0HvayL+aouixWAgjhYzzINijjBuo5KBpj1MEc2pjpQnRtrx9rO/pXpBL8gyCFxo+baF8
         i8I87P6BHMoAZBKxcT2/5VfkhPBFqoAGeO/lgEAXczhCVMAHWQJS9nszCP/a9xnNvjms
         dq/TTazBPOg7TKIH6OOJYpkygg6cLnms3gmUQ8b38tZDReuimZdapaMb6s6cYtAPXWnS
         gOPA==
X-Gm-Message-State: APjAAAVYmuwgSXtV5vAVrHyByciN2ZcRldlYnr7dk/6vdsiKGmWAoYCc
        S1nyFpGAzmWZKiwSl1N88IETNg==
X-Google-Smtp-Source: APXvYqzl4dthlgxAbEzxEkPONj4TiKBr71Sgs3FieyhYDXLXvuH07TMky9rTBxWiG9PFPeEE6pMnSQ==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr33840026wrr.252.1577189244487;
        Tue, 24 Dec 2019 04:07:24 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id s10sm23829210wrw.12.2019.12.24.04.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 04:07:24 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 07/13] kfifo: provide noirqsave variants of spinlocked in and out helpers
Date:   Tue, 24 Dec 2019 13:07:03 +0100
Message-Id: <20191224120709.18247-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191224120709.18247-1-brgl@bgdev.pl>
References: <20191224120709.18247-1-brgl@bgdev.pl>
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

