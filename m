Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8E72D5B9B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730429AbgLJNYM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728462AbgLJNYF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:05 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20B7C0613D6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:24 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id g185so5292162wmf.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6xN2KudYr05J6jbAqEoEctu2in84QIGf0FfBwBh+8FM=;
        b=hvLOoJenNJR/YFRS4ru6cMtIJQOLI30Ncqt0V3AUInqtOTgR6KggrJRaxPqpT7RTq+
         B5LuDL9czS4ozvMuWju404E6eDbJKpEs9/32j0lHTcPJ4CJOqLGXewjzjSPrTojGb0JF
         SdKXo9vJdll3GhkUqsgeUNPdG1yOTt8XZ0Gb29l6ltVlBjBbhhyXTKqSqT/JH3eMdCkU
         cyvbEgAwa4gVINOODavTcCWj1ypqa9Z4uxDpjgKypZfjbwnU5M81+ahiXoL6aq6aKgtY
         im7lbPlgjQSp57R3C1PjxDL+AiZbJ6H4pH1+WN4IMvIrvZjLu4/51Rm/+IZlvkjxmXze
         vbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6xN2KudYr05J6jbAqEoEctu2in84QIGf0FfBwBh+8FM=;
        b=dSdmEWLA1Y9h9IVuZbQy3w/cVtKVshxgXWafwivZCP1JaPOHiVfftnw6bNa52wQbT2
         zXkcU4bHDYPwwkXW6VdU28JgclgwYRPLsAbsGCrZMQOCyiIprc5Fk5puctIOaydXH1/V
         2marvjuMqJ6TMVa+B8BPuEPpbTzldHKAid6vgspyQc/AgkLkJJYd1amsaa9f89cuW5W6
         qRJ9S+bOskQd7erbQZl3a+hStbxGk3sHpCkRNwNk3wTKUvOK3ZHNrcUoI0pGHeplLeSt
         0+7v1bTkjfNP/yQVVfWJ6ke5rqHc+dFxPtB4VyClRhhN/wdPqLiJYWQdVfnoakMgZpr3
         GsDg==
X-Gm-Message-State: AOAM532rEWHNjEyoFQguQHT0XA2OI1Ss1HGtFBttmKWLVaZud+VJjyvc
        aYkeujJyxKdSZB/pkXo++jgLaQ==
X-Google-Smtp-Source: ABdhPJzblrvS6dmmC8Apjbxvkjwd3qCXJAC7j5K4JYm0Odnv6jUAvURkVBjeL+2qYNee0Wy4WSj+4w==
X-Received: by 2002:a1c:2288:: with SMTP id i130mr8344480wmi.78.1607606603426;
        Thu, 10 Dec 2020 05:23:23 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:22 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 01/14] bindings: cxx: check for error from gpiod_line_bulk_new()
Date:   Thu, 10 Dec 2020 14:23:02 +0100
Message-Id: <20201210132315.5785-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We call gpiod_line_bulk_new() in C++ bindings but never check its return
value. This function can fail so add a private method to line_bulk that
calls it and throws an exception if it returns NULL.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/gpiod.hpp     |  1 +
 bindings/cxx/line_bulk.cpp | 22 ++++++++++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index a4ef7c9..8c8e6c9 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -869,6 +869,7 @@ private:
 
 	using line_bulk_ptr = ::std::unique_ptr<::gpiod_line_bulk, line_bulk_deleter>;
 
+	line_bulk_ptr make_line_bulk_ptr(void) const;
 	line_bulk_ptr to_line_bulk(void) const;
 
 	::std::vector<line> _m_bulk;
diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
index c24e91d..1de90eb 100644
--- a/bindings/cxx/line_bulk.cpp
+++ b/bindings/cxx/line_bulk.cpp
@@ -256,8 +256,7 @@ line_bulk line_bulk::event_wait(const ::std::chrono::nanoseconds& timeout) const
 	this->throw_if_empty();
 	line::chip_guard lock_chip(this->_m_bulk.front());
 
-	auto ev_bulk = ::gpiod_line_bulk_new(this->size());
-	line_bulk_ptr ev_bulk_deleter(ev_bulk);
+	auto ev_bulk = this->make_line_bulk_ptr();
 	auto bulk = this->to_line_bulk();
 	::timespec ts;
 	line_bulk ret;
@@ -266,16 +265,16 @@ line_bulk line_bulk::event_wait(const ::std::chrono::nanoseconds& timeout) const
 	ts.tv_sec = timeout.count() / 1000000000ULL;
 	ts.tv_nsec = timeout.count() % 1000000000ULL;
 
-	rv = ::gpiod_line_event_wait_bulk(bulk.get(), ::std::addressof(ts), ev_bulk);
+	rv = ::gpiod_line_event_wait_bulk(bulk.get(), ::std::addressof(ts), ev_bulk.get());
 	if (rv < 0) {
 		throw ::std::system_error(errno, ::std::system_category(),
 					  "error polling for events");
 	} else if (rv > 0) {
 		auto chip = this->_m_bulk[0].get_chip();
-		auto num_lines = ::gpiod_line_bulk_num_lines(ev_bulk);
+		auto num_lines = ::gpiod_line_bulk_num_lines(ev_bulk.get());
 
 		for (unsigned int i = 0; i < num_lines; i++)
-			ret.append(line(::gpiod_line_bulk_get_line(ev_bulk, i), chip));
+			ret.append(line(::gpiod_line_bulk_get_line(ev_bulk.get(), i), chip));
 	}
 
 	return ret;
@@ -340,10 +339,21 @@ void line_bulk::throw_if_empty(void) const
 		throw ::std::logic_error("line_bulk not holding any GPIO lines");
 }
 
-line_bulk::line_bulk_ptr line_bulk::to_line_bulk(void) const
+line_bulk::line_bulk_ptr line_bulk::make_line_bulk_ptr(void) const
 {
 	line_bulk_ptr bulk(::gpiod_line_bulk_new(this->size()));
 
+	if (!bulk)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "unable to allocate new bulk object");
+
+	return bulk;
+}
+
+line_bulk::line_bulk_ptr line_bulk::to_line_bulk(void) const
+{
+	line_bulk_ptr bulk = this->make_line_bulk_ptr();
+
 	for (auto& it: this->_m_bulk)
 		::gpiod_line_bulk_add_line(bulk.get(), it._m_line);
 
-- 
2.29.1

