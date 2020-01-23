Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54436146AB8
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 15:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgAWOFU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 09:05:20 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38495 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbgAWOFU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 09:05:20 -0500
Received: by mail-wm1-f66.google.com with SMTP id u2so2671726wmc.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 06:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K3tKF/sG1li0TNgHDm/zaOCBiB+0gN/tDFvNC2uEQ+I=;
        b=M45+4iAd/+so2uPjQePCigx7UoGTuLYGKSenM9uGxUtckyFOJjElOUJxoiKVrJNRUN
         2gqepqxrBfH5dPejaSBDW1yuf5y97jJdD+qt1bvlfxR9hxDBbDQ0zZTH1WzrTU3rm7kV
         PPI6jmoKG1ailpQ57whCSDVbj3DxT6rDqgUWyxCgtTGSkwoqD+GYsuSCcQbYW9vxJJDP
         9lgIGV0XL2WkfNz1r4RKnOHMc2hhAPJ+DyYdyTUf0Hs3tUGgM6uX+GH9/w9Sw2L1B/Br
         NSN8kXuNplpCzDqggd24rgugepc21nxiILx2PdE/r53zvrT7mNoZpNwNLz39mIsuIXqa
         rFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K3tKF/sG1li0TNgHDm/zaOCBiB+0gN/tDFvNC2uEQ+I=;
        b=JC+42l3LIucz6bAcCWrHt32mxhknh/d+5InL54UfKqyr83z+ktb6CWK2v0rLdtHqZ3
         7JUuswc7gqqh2IKAcCdMWTVd7cP+SVRC1/JtW8HPm5VwVcxbQv6TqvIgoLw5OgWWFZ6E
         LVK8wbrerjjNpCo8UkkUKWp1GPwbo7cuKrBGGdu9IC+7JpmUQiWXBnP/TRgt39M8UHTb
         7MPxfWtXIUB2dF5yiTOXUc2J+3EWt8svxH15KPBBW3taXcHeuGGoSWSaZsYcmKbB7aW9
         qA6cdxXnYEmCcy4T2CX8JOORoKgqdKUewy+0IRPRv2oWx0xodr1sAtoJzLCFvDtxE5np
         GcMQ==
X-Gm-Message-State: APjAAAXRh4LuLI/PtuLW180ZTxET3yj2EC91Qv+tL35uTT1ye5fdNZ/g
        mbvS30OdKL29gToc+2y1s8HIFQ==
X-Google-Smtp-Source: APXvYqzgRoWJ/oQdJZsSS4fRPBaJ7vR9DWyEx17TRO9JFNLK4Ww1iOuMfcttEUdy/2yBNu3UKk8Kng==
X-Received: by 2002:a1c:7e0b:: with SMTP id z11mr4472464wmc.88.1579788318282;
        Thu, 23 Jan 2020 06:05:18 -0800 (PST)
Received: from localhost.localdomain (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id n16sm3100963wro.88.2020.01.23.06.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 06:05:17 -0800 (PST)
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
Subject: [RESEND PATCH v5 1/7] kfifo: provide noirqsave variants of spinlocked in and out helpers
Date:   Thu, 23 Jan 2020 15:05:00 +0100
Message-Id: <20200123140506.29275-2-brgl@bgdev.pl>
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

