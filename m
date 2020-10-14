Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F00128DC72
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 11:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbgJNJJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 05:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbgJNJJh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 05:09:37 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03795C041E57
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 20:46:02 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id g29so1132050pgl.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 20:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n01pleTg7SFuysPBXACr81SWaUOxZ0H1TEx2dK23HNE=;
        b=vX5h+m0p4Jr1obD9r+GP9tDW5zNoabhrl9wchNE1zIGS9atTl+CFWxwXDB9KFMRZmj
         uJVYJ+OG5KHJ6dmiVWeGTWH6AP8eMmUo/GeebrnRoH5f1er5N1bZSBPpHposGUSkFGus
         FfWVEz9NbXV6CIxsrj6xoEjcEDoFKFMQzaNpEUbDT3d1aQSYHb+2B6jzXY/d/ntdVIu/
         RqaGGxulwQ/PZN2WtaD5iiE4qlA0BSNU00EAhwA5NlYC3oP0y7PO9jhclbkC9DHGeUFu
         FT/V5ZczjHITeIOJDICJldKVj7OJWqOuWBsM2Fvzho7xbg4cxVHGuXYg9lQ1eh++jJol
         iiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n01pleTg7SFuysPBXACr81SWaUOxZ0H1TEx2dK23HNE=;
        b=gOuHhzOTHPQqx3f4EE11hUN8HOn/pN+xvE5Hkqmr7mDBrU75Wq5lpuFCroZLSff1Cs
         V26TX2gizKI7B+toy9EsQOljU3LvqHVjsLaMrCfHOIGZqq1jsJPe65Zpmr3KBiuzKRhj
         GO5Jg2Eib7XkdhP7UufVct8yXEYdnCQzWfgkNg4na5ZKLjhsoUK49XVIzKzm/DIXxXaP
         HrnYuLze/suHU5VG0dFdmG+dywU4ujCb8ADW6qt8untrwhgbA5d9uOL8T4wTlO/yVpeV
         cotoJ/2ngKVAsStn0FZ4GXjkVgER3wCvfHuc0XwZ88a3p4F/751IfQ6/AkNGezBFnJmQ
         Dxxw==
X-Gm-Message-State: AOAM530wIvlI082Odh4Z43jkVe5FTvB6hVOcyfZQ4iUUJWytpA8/TwL7
        +maRTq4KE+bn1R+JtPVSGVXtUiedvhuTxg==
X-Google-Smtp-Source: ABdhPJwzeGRKTMYWCVJWFUTgYNzpw3DGa68bXzLORjt/C3hxjGZhjSKbNsvavmJa3Ip4pgIABl/jvg==
X-Received: by 2002:a63:2406:: with SMTP id k6mr2216552pgk.366.1602647160406;
        Tue, 13 Oct 2020 20:46:00 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id g17sm1231655pfu.130.2020.10.13.20.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 20:45:59 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] tests: rename freq parameter to period_ms
Date:   Wed, 14 Oct 2020 11:45:50 +0800
Message-Id: <20201014034550.19290-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The freq field of struct gpiod_test_event_thread is actually used as a
period measured in milliseconds, so rename it to period_ms in the struct
and wherever it is used as a function parameter.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/tests/gpio-mockup.cpp     | 6 +++---
 bindings/cxx/tests/gpio-mockup.hpp     | 4 ++--
 bindings/python/tests/gpiod_py_test.py | 6 +++---
 tests/gpiod-test.c                     | 8 ++++----
 tests/gpiod-test.h                     | 2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/bindings/cxx/tests/gpio-mockup.cpp b/bindings/cxx/tests/gpio-mockup.cpp
index 0005d3f..e8db962 100644
--- a/bindings/cxx/tests/gpio-mockup.cpp
+++ b/bindings/cxx/tests/gpio-mockup.cpp
@@ -116,10 +116,10 @@ mockup::probe_guard::~probe_guard(void)
 }
 
 mockup::event_thread::event_thread(unsigned int chip_index,
-				   unsigned int line_offset, unsigned int freq)
+				   unsigned int line_offset, unsigned int period_ms)
 	: _m_chip_index(chip_index),
 	  _m_line_offset(line_offset),
-	  _m_freq(freq),
+	  _m_period_ms(period_ms),
 	  _m_stop(false),
 	  _m_mutex(),
 	  _m_cond(),
@@ -146,7 +146,7 @@ void mockup::event_thread::event_worker(void)
 			break;
 
 		::std::cv_status status = this->_m_cond.wait_for(lock,
-						std::chrono::milliseconds(this->_m_freq));
+						std::chrono::milliseconds(this->_m_period_ms));
 		if (status == ::std::cv_status::timeout)
 			mockup::instance().chip_set_pull(this->_m_chip_index,
 							 this->_m_line_offset, i % 2);
diff --git a/bindings/cxx/tests/gpio-mockup.hpp b/bindings/cxx/tests/gpio-mockup.hpp
index 1859010..f7ef985 100644
--- a/bindings/cxx/tests/gpio-mockup.hpp
+++ b/bindings/cxx/tests/gpio-mockup.hpp
@@ -61,7 +61,7 @@ public:
 	{
 	public:
 
-		event_thread(unsigned int chip_index, unsigned int line_offset, unsigned int freq);
+		event_thread(unsigned int chip_index, unsigned int line_offset, unsigned int period_ms);
 		~event_thread(void);
 
 		event_thread(const event_thread& other) = delete;
@@ -75,7 +75,7 @@ public:
 
 		unsigned int _m_chip_index;
 		unsigned int _m_line_offset;
-		unsigned int _m_freq;
+		unsigned int _m_period_ms;
 
 		bool _m_stop;
 
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index 572aad8..e835ef3 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -34,11 +34,11 @@ class MockupTestCase(unittest.TestCase):
 
 class EventThread(threading.Thread):
 
-    def __init__(self, chip_idx, line_offset, freq):
+    def __init__(self, chip_idx, line_offset, period_ms):
         threading.Thread.__init__(self)
         self.chip_idx = chip_idx
         self.line_offset = line_offset
-        self.freq = freq
+        self.period_ms = period_ms
         self.lock = threading.Lock()
         self.cond = threading.Condition(self.lock)
         self.should_stop = False
@@ -50,7 +50,7 @@ class EventThread(threading.Thread):
                 if self.should_stop:
                     break;
 
-                if not self.cond.wait(float(self.freq) / 1000):
+                if not self.cond.wait(float(self.period_ms) / 1000):
                     mockup.chip_set_pull(self.chip_idx,
                                          self.line_offset, i % 2)
                     i += 1
diff --git a/tests/gpiod-test.c b/tests/gpiod-test.c
index 72b228f..0411623 100644
--- a/tests/gpiod-test.c
+++ b/tests/gpiod-test.c
@@ -29,7 +29,7 @@ struct gpiod_test_event_thread {
 	gboolean should_stop;
 	guint chip_index;
 	guint line_offset;
-	guint freq;
+	guint period_ms;
 };
 
 static struct {
@@ -202,7 +202,7 @@ static gpointer event_worker_func(gpointer data)
 			break;
 		}
 
-		end_time = g_get_monotonic_time() + thread->freq * 1000;
+		end_time = g_get_monotonic_time() + thread->period_ms * 1000;
 
 		signalled = g_cond_wait_until(&thread->cond,
 					      &thread->lock, end_time);
@@ -217,7 +217,7 @@ static gpointer event_worker_func(gpointer data)
 }
 
 GpiodTestEventThread *
-gpiod_test_start_event_thread(guint chip_index, guint line_offset, guint freq)
+gpiod_test_start_event_thread(guint chip_index, guint line_offset, guint period_ms)
 {
 	GpiodTestEventThread *thread = g_malloc0(sizeof(*thread));
 
@@ -226,7 +226,7 @@ gpiod_test_start_event_thread(guint chip_index, guint line_offset, guint freq)
 
 	thread->chip_index = chip_index;
 	thread->line_offset = line_offset;
-	thread->freq = freq;
+	thread->period_ms = period_ms;
 
 	thread->id = g_thread_new("event-worker", event_worker_func, thread);
 
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index d4a8c5f..8308547 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -96,7 +96,7 @@ typedef struct gpiod_test_event_thread GpiodTestEventThread;
 
 GpiodTestEventThread *
 gpiod_test_start_event_thread(guint chip_index,
-			      guint line_offset, guint freq);
+			      guint line_offset, guint period_ms);
 void gpiod_test_stop_event_thread(GpiodTestEventThread *thread);
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(GpiodTestEventThread,
-- 
2.28.0

