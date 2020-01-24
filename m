Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C000148CF5
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2020 18:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388867AbgAXR1k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jan 2020 12:27:40 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38071 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390486AbgAXR1c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jan 2020 12:27:32 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so2944996wrh.5
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jan 2020 09:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/WIeivaGQxrlEYfXU5yeyOajIwgi/x64w9TFpm3Lzbs=;
        b=OMNP06LJVv7z/8HMT1U3LlJLhp8LpJoYHDGY0rPhdPVcxLykArz0KpN2rLQ9kbYJwf
         lyN/K128daIdO0KovHl+M4Rg3rqokbx+3wrkuvItJ9S7tbBV8w0bZW6A15aH+b58gbvm
         zV9fRlEBav9fownSv0tL3Ig9GxByTfTlkdS/l+JETR1hmbS8OOBbXHUML8eTsVnwz+iU
         lO96xJRH4VPogg6Le7EjEyc7c0jS/VG3GOZgz330m70hb+AJO1g4yycHWIBgkpJwb8rD
         x/VbeduqLCqLdHNG1wWnCWuDySYvAXKJKiIJ95i4sZMZ2Z8muEbO1IwbYAtsVm1+yeD+
         /pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/WIeivaGQxrlEYfXU5yeyOajIwgi/x64w9TFpm3Lzbs=;
        b=qcFH1eRSLhbsBb7Eo65PC1WrVu1QTfuaRpbaF00QthfjvDBuYZxIU7OlAtcxjtPFAV
         AXQOWrFTBlQg55q3E/3i1Hyzj092/GQhiTvaItl8IWQJvYpOh8soGnfLKTqwrgDJVAC6
         ZAjdspj//ruvjRgMPwZrrN+/twpkielnjW+BlDrhbDltfiE2N6Z2oq7PQOfrm71GBgZn
         6/9dH45gXugpj1SZqZ89wBlkwPZpYk8vlGeqHgFYGcJWcZMLWPMEsHEAenh1OykOzmvw
         1N/ba7HrbqYsLvNOjXhFW5VebH7FI5/7qOIa5NXlORpoBxzfEz9jifCslgHeaYjofxmH
         B+ew==
X-Gm-Message-State: APjAAAXU+zW6NUjTXedNk6TIy/L1fG6zbp/+GVJuIBhjrMgif5Xiq0M+
        ZUx3kygt/6ZvdvHbgnG8zJVsMQ==
X-Google-Smtp-Source: APXvYqziiJlYF3fliGq+eS20t/bwAty9dObiuwbBRCW6TAT6PG/9boi52uBZx0zUmB9xMt+7lAjuTg==
X-Received: by 2002:a05:6000:160d:: with SMTP id u13mr5252608wrb.22.1579886838627;
        Fri, 24 Jan 2020 09:27:18 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id t8sm8358585wrp.69.2020.01.24.09.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 09:27:18 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stefani Seibold <stefani@seibold.net>
Subject: [PATCH v6 2/7] kfifo: provide kfifo_is_empty_spinlocked()
Date:   Fri, 24 Jan 2020 18:27:05 +0100
Message-Id: <20200124172710.20776-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200124172710.20776-1-brgl@bgdev.pl>
References: <20200124172710.20776-1-brgl@bgdev.pl>
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
2.23.0

