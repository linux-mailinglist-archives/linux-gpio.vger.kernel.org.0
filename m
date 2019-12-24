Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9929812A10D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 13:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbfLXMH3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 07:07:29 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35922 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbfLXMH1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2019 07:07:27 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so19687391wru.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2019 04:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GsK7s8K6DIS0JIxs6gZ15L0MgMAbrzcUa2gzsoGKiM=;
        b=YKrY9BeP3bTiDh3XlXkFGw7Pakx435wwOMeH/ZZZmb6Ay4CWD8793GjcfoPcGRHtdm
         9BjG8B8hmq+P5EFeyXT3345qQ0jwatdyueeLQvWE7p6uKpbdGKzgg/WVR/P9Wi5AfsJ2
         96tPCTyv+Kn+Ogay7wqvCPIKD+dL7BAgGfe4E6LFSLwRns7q1rU9/GONf2LVz9wyZTlb
         JtDgS9kVGUXWTcfi+ScG9ELgAj9V1t6SYbBLErI7Sov7Cayzcg0ykmN/Zmj4XXk8aQnZ
         NYYwrD3cPul1CdKPYH8WfYpJFW34q2R62BCB5z23YnZ1SFFqq3xAcQlHOsJ/685SV5c6
         KcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GsK7s8K6DIS0JIxs6gZ15L0MgMAbrzcUa2gzsoGKiM=;
        b=BI/WLunPLbDNn+ls4g02tPXPPhyTBm/S7IjBJDgFyoiaqTDylU5H3lMlSwKOzf9ROr
         S0FAjCJAcy3xDsmwJsK5kL7ChXoZLIh05twpw4KjrdDh81PKUFi6NDQzwQL0Zu0B3j72
         YQklctSrn4JFl+3TlP9gPxqI2AYyi7bl+wm0eHMcDoswsMuFpgwA8NCmBvgQ05sxXouP
         1ZOjocGT9Slg2tdy4t4U5iQMxvstMm9QLFyFq1rqW4AdzPrmqHqu2OZkNkBpV7ZhQ35W
         IsHADO9+015ey5y+/8T4cIRE1AUwPztFRa9uXT/bzeV+KnMXJhdpZlUGvNA2FjUrqqHG
         qPeA==
X-Gm-Message-State: APjAAAUCtlVlHQOd59M6kkk7DIaowpvjc5Bqzi5KpnK7h/5h8PkCe4n3
        86nidqXvTQWh/ZBy/DJeFBuPnA==
X-Google-Smtp-Source: APXvYqzq9BB36SA6C58yO4E2MYcSe0ZdGBFlfvba7TUqpmzkWkeHPxZwVpnl0VAfjfYA51s9DNRiTw==
X-Received: by 2002:a5d:65c5:: with SMTP id e5mr34880376wrw.311.1577189245529;
        Tue, 24 Dec 2019 04:07:25 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id s10sm23829210wrw.12.2019.12.24.04.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 04:07:25 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 08/13] kfifo: provide kfifo_is_empty_spinlocked()
Date:   Tue, 24 Dec 2019 13:07:04 +0100
Message-Id: <20191224120709.18247-9-brgl@bgdev.pl>
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

