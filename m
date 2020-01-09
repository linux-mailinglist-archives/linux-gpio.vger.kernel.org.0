Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5861913586E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 12:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgAILuV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 06:50:21 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53485 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729035AbgAILuU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 06:50:20 -0500
Received: by mail-wm1-f68.google.com with SMTP id m24so2576257wmc.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2020 03:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GsK7s8K6DIS0JIxs6gZ15L0MgMAbrzcUa2gzsoGKiM=;
        b=I6txfwI90sjMIg0dqiroXeL928Rj7hB3V/5JvOX+/OemCDH/T9a/dtcEgv+mmoShkD
         53jia1JCu5R9USQKUXjzn+pU9TZt4E/6qBvTLLpAal8g2aJZ9bBcZYxH3F7Gh3sidxqF
         iySg7DW+gdoVxk8JAn3o3HwQ3fUN7/p8C7/VXwElL7u1PAvYJtNw6UMxP4KlneZMq5qX
         8RWeWoa0hSkk4y7OSduZySI+UvOFnFmEbwQZ92j5OmnXIXIwtPvK0Hp1/n8fKyX0W0E0
         3HqAINB4wMAZJb0hCtyPAVz2VDWGKXYiVqQcowx6qJNkfr2HUokLO4vdamJ38q9UqJq5
         pGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GsK7s8K6DIS0JIxs6gZ15L0MgMAbrzcUa2gzsoGKiM=;
        b=BwKHjOt4mRFlHTetv9xPJfAu/oj5VDXHXezhwLhL1MpGb7tmubt+SbsD1Smw3WjtGH
         20/Xx3AWJ2/HpY1KKqKm/K+ON2azGrBRqe/EdIwPoIJXxR/x30J3kEQNbwzHofeVd3GG
         3SlzbjXpNw9o8/mGOy929qBIQiTQGqcXGdpFtuun4hrQg6Rb9akl705tdxwtznuzhqwX
         AnIhoUSMVnrQKbK7KvDGXqCiJ1VLv7mQwsgfzXjsYko/m84CEF7aRwYFq1zYtupTAkbC
         kHWarOzQLGJpw4QCWr9i2zbPJfRfogN1u/A0tiYCcD5kU61Saexc77oqHCO99BE0R1z5
         Jebw==
X-Gm-Message-State: APjAAAVEOkoEuQ6SqccF2huKMU9+ZCh7oKPbOpuwWoyLGQj6QeaesOyB
        W2yI6pB6ZjRxrFqO39ap4XeKRQ==
X-Google-Smtp-Source: APXvYqzNkYXAmDxnxKgTQKco5PlOQHcCMYerJYTlTTJNn7H+Ku5b6ZFIjSHuE6PVA/Iy81wD8KK/nA==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr4555286wmc.9.1578570617472;
        Thu, 09 Jan 2020 03:50:17 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u16sm2574979wmj.41.2020.01.09.03.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 03:50:17 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 2/7] kfifo: provide kfifo_is_empty_spinlocked()
Date:   Thu,  9 Jan 2020 12:50:05 +0100
Message-Id: <20200109115010.27814-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200109115010.27814-1-brgl@bgdev.pl>
References: <20200109115010.27814-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide two spinlocked versions of kfifo_is_empty() to be used with
spinlocked variants of kfifo_in() and kfifo_out().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/kfifo.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/kfifo.h b/include/linux/kfifo.h
index 123c200ed7cb..86249476b57f 100644
--- a/include/linux/kfifo.h
+++ b/include/linux/kfifo.h
@@ -246,6 +246,37 @@ __kfifo_int_must_check_helper(int val)
 	__tmpq->kfifo.in == __tmpq->kfifo.out; \
 })
 
+/**
+ * kfifo_is_empty_spinlocked - returns true if the fifo is empty using
+ * a spinlock for locking
+ * @fifo: address of the fifo to be used
+ * @lock: spinlock to be used for locking
+ */
+#define kfifo_is_empty_spinlocked(fifo, lock) \
+({ \
+	unsigned long __flags; \
+	bool __ret; \
+	spin_lock_irqsave(lock, __flags); \
+	__ret = kfifo_is_empty(fifo); \
+	spin_unlock_irqrestore(lock, __flags); \
+	__ret; \
+})
+
+/**
+ * kfifo_is_empty_spinlocked_noirqsave  - returns true if the fifo is empty
+ * using a spinlock for locking, doesn't disable interrupts
+ * @fifo: address of the fifo to be used
+ * @lock: spinlock to be used for locking
+ */
+#define kfifo_is_empty_spinlocked_noirqsave(fifo, lock) \
+({ \
+	bool __ret; \
+	spin_lock(lock); \
+	__ret = kfifo_is_empty(fifo); \
+	spin_unlock(lock); \
+	__ret; \
+})
+
 /**
  * kfifo_is_full - returns true if the fifo is full
  * @fifo: address of the fifo to be used
-- 
2.23.0

