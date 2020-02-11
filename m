Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB062158BC5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 10:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgBKJUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 04:20:18 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37643 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727904AbgBKJTt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 04:19:49 -0500
Received: by mail-wm1-f67.google.com with SMTP id a6so2524815wme.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2020 01:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J6ZLNj2Gq0W0Yaf5OErI6mxsCNdT2eS8KG7ezcB9dY0=;
        b=bvlde9/BYWUt6yX6B3axWW/EXQmlMl7L/is9C1EKF8Nx4zE9fM88462YL3CmM28ioo
         GH3iIhRZllHSdtjSSov1oy10smvIWwyQQi3cpc8C/meYywWKxyeTfPrd27JSUgJngcxP
         cP5cvQhg1dsawZLIQCnMJ3tJNGV5LakxTH6BY5YHtAoek2x0s8fek2tx0fY+SkmKg3Ux
         mH6Vj1sPdc9YxdMCamsUNWTxV1j75xySd/ke1LMmwx+VfDj4HjwGlMi4h5WxQQX/kjIZ
         oxdMXoto6p+tODUU5saArZQ6thjikM1uE4x1cirtB9sKiVeVYoPVwUfutJkZbcavbaaz
         Ab2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J6ZLNj2Gq0W0Yaf5OErI6mxsCNdT2eS8KG7ezcB9dY0=;
        b=imOCreHZgyuzVHnbaa0J7H/MqGwolOByO9DpfcPtvfoMyrQ8nwj6Sm+74Mda7iE/2L
         dTGYSRrARN45RfntfjdpQJm6L1aiFYZIk88O03oKNtO4VoqsXMoS7mZu61kDib0YR7do
         Fdlmz7PTMsGI8LG3iGKekZ2YRpMc4zi202207uy7VQiBRjH9FZzn22O/88AL7TXtAPMb
         btNp5aBUHt5rzeSiYxA8AoJiAASxUlP1xYRiau8pNXbN6T157qzpYbn6LHTZ717AqNn+
         +gd7BPHAu9hKxTFXOuy0Y4qIjcx/8J00DArMALvBQj+Sq3SPvHZkxtiRkrJWoXBmXgLi
         KPjA==
X-Gm-Message-State: APjAAAUdm9PaX1MU7u72cpmserpUHzBeFZb622noj12ZY4AQdJUfgifa
        QAEzB+94JPVoCfOQc9+fQiPCXw==
X-Google-Smtp-Source: APXvYqxHjKZdZWKhZS3AoeVyH3NMEieAbdcgVVvcmpoGXTu4vuIZJaP8GCNGxLmznkRrQAzrQ9SNuA==
X-Received: by 2002:a1c:ddd6:: with SMTP id u205mr4689065wmg.151.1581412787259;
        Tue, 11 Feb 2020 01:19:47 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id y131sm2958622wmc.13.2020.02.11.01.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 01:19:46 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stefani Seibold <stefani@seibold.net>
Subject: [RESEND PATCH v6 2/7] kfifo: provide kfifo_is_empty_spinlocked()
Date:   Tue, 11 Feb 2020 10:19:32 +0100
Message-Id: <20200211091937.29558-3-brgl@bgdev.pl>
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

Provide two spinlocked versions of kfifo_is_empty() to be used with
spinlocked variants of kfifo_in() and kfifo_out().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Stefani Seibold <stefani@seibold.net>
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
2.25.0

