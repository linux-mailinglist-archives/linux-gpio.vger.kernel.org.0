Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7483146ACB
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 15:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbgAWOFY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 09:05:24 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53976 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbgAWOFV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 09:05:21 -0500
Received: by mail-wm1-f68.google.com with SMTP id m24so2693795wmc.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 06:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GsK7s8K6DIS0JIxs6gZ15L0MgMAbrzcUa2gzsoGKiM=;
        b=fEJGbr7MJ2EjCq8HYkTsAyu2k193Bh3jN0H0bWKRYgQY33vr77MxUHpfIODJrnglMF
         oI3SOf7bOKkbx0eR8VJCdySsymi7DOJ7E+9HhzE1AO9CEhpyj5iyUE7POae1ZPKuXlT9
         6XJIEW07yGsohy1VMKB+SMIvGCWvJsCC+fjx6LfVbz+Z8JtgJVSPFMGXMfEVdrj0IeVU
         29f1sltrz4AtOLNqusPPcgPdm22GCK/TrLRikk3PRlPjWAkFp1o8TRV3N48DGV06lUEK
         qAZseBeZxZnbkNv4Ch6eV9dqE7M+eZ9jPY+kLLtADkT6QU6VYysvFB0lv4kBEZUraxMo
         3luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GsK7s8K6DIS0JIxs6gZ15L0MgMAbrzcUa2gzsoGKiM=;
        b=Fi1vbB3su97DXYG5z70hZTn6VDvzz4b6mEDhKg4BaCfMpFwdFlqjv28jeV2a0JnCr6
         NsuMqETE2Ott4JD7ytSe92FvqVuTXWMIQNkuC/R4qSP9SF3w4CoOjWe2/SCRr270vxRM
         ETxVsjKNl3nx+5k/uEZIeAi3BOUcDlCoTGiASo05YV7xFeEb7hnTLIuXjgize7udXiPr
         yE6nCYpVNhmaOvEwEw9S8cl8BkIoqOVdUHKHwQalDuMYXxQb/vCAAnFsLCB3dAc0IpOR
         0TLnov9XKG11CxyPvSwB6q3sj9J/8pH/4T0R4ciefP7xTtFeyrCQRYHmITzSVCFrFx59
         vT7A==
X-Gm-Message-State: APjAAAWNve+QU1kwOJ54CNmnkpRp8l0B76tb39WX+iDnZ9Kh9DLtqYkO
        VltGMcHDjvvYws3r9wkzlsf7eg==
X-Google-Smtp-Source: APXvYqwl1Nv4aSf47ULiMfgkeOFZuih3o0I+acG52VBTsjkpi9ZAZ6Z3zKQBHkYANXNvBH6gVbWZEA==
X-Received: by 2002:a1c:964f:: with SMTP id y76mr4326006wmd.62.1579788319801;
        Thu, 23 Jan 2020 06:05:19 -0800 (PST)
Received: from localhost.localdomain (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id n16sm3100963wro.88.2020.01.23.06.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 06:05:19 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Stefani Seibold <stefani@seibold.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v5 2/7] kfifo: provide kfifo_is_empty_spinlocked()
Date:   Thu, 23 Jan 2020 15:05:01 +0100
Message-Id: <20200123140506.29275-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200123140506.29275-1-brgl@bgdev.pl>
References: <20200123140506.29275-1-brgl@bgdev.pl>
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

