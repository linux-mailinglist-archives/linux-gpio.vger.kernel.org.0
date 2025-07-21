Return-Path: <linux-gpio+bounces-23567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779EB0BDE7
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C57F18941C5
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EB828467C;
	Mon, 21 Jul 2025 07:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="c2zHRNCk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B9F2AE74
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083735; cv=none; b=MqFIZQvpSUZ/iP2hSQcMaHDd9eoS7fG4rMPNJXWuVPO+O4M12B48qjUyKi+tRrG1wW81/+jmL7r5ef1JJ15fcWBLuhKMUeG0EE0whBeSGZGyWRHKKUyGVP/Nv7cntkAVzHTFGN3tSBBHkRgSdtkmu9bzAw7swz0aUaEK8kua+I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083735; c=relaxed/simple;
	bh=ygwpLu3QoztBVe95d+nZCpd7gaPo5ykHDyQ3OKp+hLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAN4GP4r/FNaeyNCXf04jSjZnahwUQpc9JEvWr5kM1cLB3x9hIDBpwmr0rd9nNNIDCk9KU27K//lHXTR0/VKJSQFA4AHJAActCuKQx6e06pWGPP6fXvb+T+/YtO08gElYTeZnu0gn54ZByHZTcKZi9DhDO458F7ywUXREzRJaT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=c2zHRNCk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45610582d07so30572505e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753083732; x=1753688532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XKsGuFgWAitSDVHFer2KqWF01hDT4ex7wWLS2gjPYk=;
        b=c2zHRNCkgfwbmt7sy1Fp4jmKIL8jUfEANcsMj4LM2XcuAvuwG/p2v97F3V9ymF43zf
         PE+Q8ErNJMeMJSo226vlmdSUZemt3bS12hRAfoCXztLr8EcsrNzHQOwUrf0aHZ/ebnbH
         psNXOPYDQoCu0WpjG2LB5q9zTawMLlzC2kI/nuZfRhitaZxwL3kLligpOM7qOTCYj7Bi
         ugPUVuR7TzY59pVarCYdk2Q1Ppq1jFKhOPeySuNaNfSqlRQ0kS/N2HKJcpGTadD4+N4/
         8Rdz7jxM6/sot1zH+kcOTnB/uMh9GyfJb4k+fO4OLaUT6XnN6g2sAwd2yaHjGkSSLKOy
         vzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753083732; x=1753688532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XKsGuFgWAitSDVHFer2KqWF01hDT4ex7wWLS2gjPYk=;
        b=IQUHBHIchQJJy5/3PM+Zgaf8PweYeRw2BU0XK0TpIVVAOjvu/xE/fPakoeMq6tVuS2
         l2MWg+F3LwWzVRsAkmTkpvIBclNFnNz+gPbULZge4raUyT0hJpf76DVh+e+g9u0m5beq
         xQHGyS9KY4ClvLu4AR2Qf8KkY5h3eG+hjckoN7v8pV71qjmtME3v2loXml2tDoZwTohP
         /3sHB18vMVRIZkt83ZJ5+LAJVpiJXUaQGN31WY7gyNYey9+yQDq4sPQ4eukn14P8Cnpr
         2DoPDZQDTTB2FjPpJdzNSeVqTrHMMe4wvyD5c2xCqQdNgNAAeHkOUxvbZRAOMCNM/ZyD
         ddXA==
X-Gm-Message-State: AOJu0YytPzBQ6BShsV4BbqkRNVBQriBCeA326p6BCeE408/hmLcedKq5
	z881qav4WOz5aJ9l0toyUTQLD8TCXjSNoDWzwssGOnUPf2bH8YCoBRUfpT0WlYlH4oA=
X-Gm-Gg: ASbGncv/OT9GvKZtEkgo57IMZpi/Vd9rB517mps2J6RawcXjnrNy23L+oNC7ya+lf4Q
	MyfvoMlFJDnDE04z+IBknz70TsK04HFvcj9+akW1HUAZ24iNQdJremVRgw13VqlPf21IHc4vtS7
	vMrW8ZTSAHhh+Kfb+zzyz/uoIR+bUQ76apxGmrO2BtFXrAr85+vOCr+BmWEN3LAyPzOTb3++rdL
	kKRWIWY68+jYAiU8ckV1rtL/pHrLXzf6fSUzop5hapm3ZIDcKzDeT0NEOQSriAgGtSsbgBu679j
	DW3s8GWktAa8I/aTqd8KpTEL9GW6q6mxJiX/Tk8V3FqGFRHL+OLoCtHiNdAT8zTtq6c1w7HdS86
	fWcO6JA==
X-Google-Smtp-Source: AGHT+IEu+4IZiObaO/FBYFvuMyzZ4hxJAn5NCSRbOe4szy/4uzMc4ugFeFeStoaxNigwmbZhgAZwoA==
X-Received: by 2002:a05:600c:8507:b0:456:161c:3d6f with SMTP id 5b1f17b1804b1-4563c266ae9mr100447765e9.11.1753083731599;
        Mon, 21 Jul 2025 00:42:11 -0700 (PDT)
Received: from [192.168.1.187] ([2001:9e8:d58e:7200::35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b5bfa44sm90336215e9.13.2025.07.21.00.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:42:10 -0700 (PDT)
From: Erik Wierich <erik@riscstar.com>
Date: Mon, 21 Jul 2025 09:41:53 +0200
Subject: [PATCH libgpiod 1/2] bindings: rust: mark constructors that take
 raw pointers unsafe
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-rust-unsafe-consistency-v1-1-aa1b42ed5983@riscstar.com>
References: <20250721-rust-unsafe-consistency-v1-0-aa1b42ed5983@riscstar.com>
In-Reply-To: <20250721-rust-unsafe-consistency-v1-0-aa1b42ed5983@riscstar.com>
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Erik Wierich <erik@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753083729; l=7393;
 i=erik@riscstar.com; s=20250721; h=from:subject:message-id;
 bh=ygwpLu3QoztBVe95d+nZCpd7gaPo5ykHDyQ3OKp+hLQ=;
 b=Qx/UDI5FWCmehyMV/sTsm6aqvTEjxj58kfvqTYsm0VWDgGuRhECAj2yam0/7imeuIH4k97cVK
 ypCUY6pyROLDJgmJ3AFExBFj3+riwB67qs3Oz5t3/moR06FEzm2WxlZ
X-Developer-Key: i=erik@riscstar.com; a=ed25519;
 pk=gjm0pD1JkINoNzvT3vC2WZoAWUld0EyXuhsQ/i5Qz4I=

The functions take raw pointers and expose safe API that operates on
them. Thus, invariants have to be upheld by these constructors to ensure
safe operation of later API.

Signed-off-by: Erik Wierich <erik@riscstar.com>
---
 bindings/rust/libgpiod/src/chip.rs          | 10 ++++++++--
 bindings/rust/libgpiod/src/info_event.rs    |  7 ++++++-
 bindings/rust/libgpiod/src/line_config.rs   |  7 ++++++-
 bindings/rust/libgpiod/src/line_request.rs  |  7 ++++++-
 bindings/rust/libgpiod/src/line_settings.rs | 10 +++++++++-
 5 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
index bbb962f0390469b3193deec9388b5b56efab07ce..f39beab58363beaebe2ba2dcfb846178b7b595e5 100644
--- a/bindings/rust/libgpiod/src/chip.rs
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -146,15 +146,18 @@ impl Chip {
         if event.is_null() {
             return Err(Error::OperationFailed(
                 OperationType::ChipReadInfoEvent,
                 errno::errno(),
             ));
         }
 
-        Ok(info::Event::new(event))
+        // SAFETY: `gpiod_chip_read_info_event` returned a standalone `event`
+        // over which we have sole ownership. We won't use the raw pointer
+        // directly after passing it here.
+        Ok(unsafe { info::Event::new(event) })
     }
 
     /// Map a GPIO line's name to its offset within the chip.
     pub fn line_offset_from_name(&self, name: &str) -> Result<Offset> {
         let name = CString::new(name).map_err(|_| Error::InvalidString)?;
 
         // SAFETY: `gpiod_chip` is guaranteed to be valid here.
@@ -191,15 +194,18 @@ impl Chip {
         if request.is_null() {
             return Err(Error::OperationFailed(
                 OperationType::ChipRequestLines,
                 errno::errno(),
             ));
         }
 
-        request::Request::new(request)
+        // SAFETY: `gpiod_chip_request_lines` returned an object over which we
+        // have sole ownership. We never use it again after constructing the
+        // wrapper.
+        unsafe { request::Request::new(request) }
     }
 }
 
 impl Drop for Chip {
     /// Close the chip and release all associated resources.
     fn drop(&mut self) {
         // SAFETY: `gpiod_chip` is guaranteed to be valid here.
diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
index 472c8915a316f6dfdd184ff52e33754c0805f880..e59de89a0507aa224fc5f473f321a0817fe29980 100644
--- a/bindings/rust/libgpiod/src/info_event.rs
+++ b/bindings/rust/libgpiod/src/info_event.rs
@@ -27,15 +27,20 @@ pub struct Event {
 
 // SAFETY: Event models a wrapper around an owned gpiod_info_event and may be
 // safely sent to other threads.
 unsafe impl Send for Event {}
 
 impl Event {
     /// Get a single chip's line's status change event.
-    pub(crate) fn new(event: *mut gpiod::gpiod_info_event) -> Self {
+    ///
+    /// SAFETY: The pointer must point to an instance that is valid. After
+    /// constructing an [Event] the pointer MUST NOT be used for any other
+    /// purpose anymore. All interactions with the libgpiod API have to happen
+    /// through this object.
+    pub(crate) unsafe fn new(event: *mut gpiod::gpiod_info_event) -> Self {
         Self { event }
     }
 
     /// Get the event type of the status change event.
     pub fn event_type(&self) -> Result<InfoChangeKind> {
         // SAFETY: `gpiod_info_event` is guaranteed to be valid here.
         InfoChangeKind::new(unsafe { gpiod::gpiod_info_event_get_event_type(self.event) })
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index d0a4abae5ae7e0d5e111cf7778eaf3cd0c07ca53..09a65514748d0a85fb39a3d37a18f19fc9f4af1b 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -130,15 +130,20 @@ impl Config {
             if settings.is_null() {
                 return Err(Error::OperationFailed(
                     OperationType::LineConfigGetSettings,
                     errno::errno(),
                 ));
             }
 
-            map.insert(*offset as u64, Settings::new_with_settings(settings));
+            // SAFETY: The above `gpiod_line_config_get_line_settings` call
+            // returns a copy of the line_settings. We thus have sole ownership.
+            // We no longer use the pointer for any other purpose.
+            let settings = unsafe { Settings::new_with_settings(settings) };
+
+            map.insert(*offset as u64, settings);
         }
 
         Ok(map)
     }
 }
 
 impl Drop for Config {
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index d7b62a1a083ff589aaa4fa3edb1b1269e7aafaf5..c73943da9b42a12b35adf5234c80e62f4c7785a7 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -23,15 +23,20 @@ pub struct Request {
 
 // SAFETY: Request models a wrapper around an owned gpiod_line_request and may
 // be safely sent to other threads.
 unsafe impl Send for Request {}
 
 impl Request {
     /// Request a set of lines for exclusive usage.
-    pub(crate) fn new(request: *mut gpiod::gpiod_line_request) -> Result<Self> {
+    ///
+    /// SAFETY: The pointer must point to an instance that is valid. After
+    /// constructing a [Request] the pointer MUST NOT be used for any other
+    /// purpose anymore. All interactions with the libgpiod API have to happen
+    /// through this object.
+    pub(crate) unsafe fn new(request: *mut gpiod::gpiod_line_request) -> Result<Self> {
         Ok(Self { request })
     }
 
     /// Get the name of the chip this request was made on.
     #[cfg(feature = "v2_1")]
     pub fn chip_name(&self) -> Result<&str> {
         // SAFETY: The `gpiod_line_request` is guaranteed to be live as long
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index 7f271c3b7397c81d4d2e15fc8050582306ad2b5b..6445a4756b1f12932e266148a4ac9528c7ac1d06 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -42,15 +42,23 @@ impl Settings {
                 errno::errno(),
             ));
         }
 
         Ok(Self { settings })
     }
 
-    pub(crate) fn new_with_settings(settings: *mut gpiod::gpiod_line_settings) -> Self {
+    /// Converts a owned pointer into an owned instance
+    ///
+    /// Assumes sole ownership over a [gpiod::gpiod_line_settings] instance.
+    ///
+    /// SAFETY: The pointer must point to an instance that is valid. After
+    /// constructing a [Settings] the pointer MUST NOT be used for any other
+    /// purpose anymore. All interactions with the libgpiod API have to happen
+    /// through this object.
+    pub(crate) unsafe fn new_with_settings(settings: *mut gpiod::gpiod_line_settings) -> Self {
         Self { settings }
     }
 
     /// Resets the line settings object to its default values.
     pub fn reset(&mut self) {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         unsafe { gpiod::gpiod_line_settings_reset(self.settings) }

-- 
2.50.0


