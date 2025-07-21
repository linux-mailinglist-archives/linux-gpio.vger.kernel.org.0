Return-Path: <linux-gpio+bounces-23568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EB3B0BDE8
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 271873B2C7C
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF758284687;
	Mon, 21 Jul 2025 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="e74ZBPDS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E50280014
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083738; cv=none; b=lbgyzaFC1Uhsotey5tbo9ZRhH9eiPGGhktg2y0Gcp96CyypNQkj3YqPzxYGRPwLgfqtzQDlkUcvyvh2sfKMsPjg0UockMWXbtNRnjonWVylMt+Qo2+sP/5NXwKfvV4vHz6PcVs4H2dfycxMCd95m1lj5vapH2NQrjFKwLShYvLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083738; c=relaxed/simple;
	bh=zz+1eWUo6cjJXBU2Mmii4yDSAmjqj8xU76JdjZ+41JU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nIKRSL0xgohXZO4et/ixE0SkqC5lrmYD8zqKFPIXMeqboEgvAY1tKTIOk0ZApi35j5l4JHv/5QsqwSNe9jvsNMtav9Vk873zxHUdR2ImmXedusWBTET3y9FzMgGD0SzkvaZdKlMI/9lqLGQmE/wU8sv3h81hVpRwHW1n99pp2w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=e74ZBPDS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso3709505f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753083732; x=1753688532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0Eo487yzY6HIIpcvkkt+fbwOU67JX2oiEUk87ASpvk=;
        b=e74ZBPDSBRsysEVRaIeECFdj+FuvlZaDNNeWA347sZynMvLcLvY8uOEh2msTX7qX5b
         iZzj551wFz1mo15oRtBZ4f+dB0t9OVFtbGMlv3CN6rZvI4GpYwlySgRUgQ4Snxou2vaL
         0IG0XuLw6+kk8Yd2TKrjAK5Y5h2Oo1w6sbleQfYxVj0kDZpbSkkggIVFNMVBH8fwhNdj
         vix/+ifTLYvBVH9JkNfVX4OmK9tNjmb8TK8J3wNFaJ/uj/jK9kr8ZKqJBpWfdI0jIdGP
         BPy9ZiBBhDdRJ2Unhnvjp/R8+naIPVXLKTlhhonuUa9n99Q6OnPmhTqNSEOaq/ih+Seq
         eMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753083732; x=1753688532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0Eo487yzY6HIIpcvkkt+fbwOU67JX2oiEUk87ASpvk=;
        b=RbFt4MvPww/49qCW3tKdpD9mnmFb1uHpcRKTulP6ADXGLYQK0S2rxXIq0Ze+tUTXd+
         xwQOktffMcOV/mfdM6JSZJ7BxWhgNee0raZwnwIAetpVUm+vL8TkJkY0fx1X6WQNhGrX
         Ao27nly7oTRKZIX4yae7RKqIC5pignUdHe1wkJWt9cKqXwejEReXlco0IA7EytDjP8cK
         4daIPoLDcB7dWlVSG373kSYClCEOH835DZ4UcjQol2DBDl+H6pRfvxSz7Q4voeGgCdM7
         Ww/fQGG8iWV9oJR0kvuRYFu3Z8pNoIlRDvU/dxqk6YWdRx6rJR4BzpW98ThPJWMoxhRZ
         QbTA==
X-Gm-Message-State: AOJu0Yz+zdRHFjAgvndRPLO0C60E0l8rKBC4kIdk2etiCwNDcI0KHYWN
	Zjqpw0eKXrnyTzKpZg6LIUhMJ864L9GN5L3jTCfDDGtpUnl+JpImLsPXYrxqtvIUsAdzPG4k+NR
	by8K6
X-Gm-Gg: ASbGncvs/ytsEc8v6NwyIF0SGPnESv5CxEViq1Xn+0jVtz9VPKxfaANjqOvuqaE+GQt
	VtkL2khx4ymdenq66aSJL5CEEYNO6S+RE+S4DHfrXFDXnMsXANyaqFkxFtDNvb0G594D41R8Ka0
	1AwF5aueUKtScAuJLKCQi06/3JSNVW1VYnotw8VJfYzrw/28sNQq/HaqluyJp0KaeSqAJ0NtKNo
	fjl2ZARAO+i1NpXYY3GRVb20bUvvCfxO+bK+lVrkAgbocYRfG/HC61oWBHRAwGkvao4oplfAwpx
	bbB3/hzWUafEOUik3+KniEDLEFsTwOiE+cjt9alOoyhpxRNR2uO7kp8F2jaMkt8WqTofu83jtQS
	s4BUWjQ==
X-Google-Smtp-Source: AGHT+IHj7PF2GzmYVNwe00bID/xNzFhvrDiJ6SZ5kLkIiuyYPYQNzAVos4ZkyAJm6dl+UHInzm8eug==
X-Received: by 2002:a5d:588f:0:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3b60e4c914amr15881151f8f.3.1753083732290;
        Mon, 21 Jul 2025 00:42:12 -0700 (PDT)
Received: from [192.168.1.187] ([2001:9e8:d58e:7200::35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b5bfa44sm90336215e9.13.2025.07.21.00.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:42:11 -0700 (PDT)
From: Erik Wierich <erik@riscstar.com>
Date: Mon, 21 Jul 2025 09:41:54 +0200
Subject: [PATCH libgpiod 2/2] bindings: rust: rename constructors that wrap
 raw objects to `from_raw`
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-rust-unsafe-consistency-v1-2-aa1b42ed5983@riscstar.com>
References: <20250721-rust-unsafe-consistency-v1-0-aa1b42ed5983@riscstar.com>
In-Reply-To: <20250721-rust-unsafe-consistency-v1-0-aa1b42ed5983@riscstar.com>
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Erik Wierich <erik@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753083730; l=6458;
 i=erik@riscstar.com; s=20250721; h=from:subject:message-id;
 bh=zz+1eWUo6cjJXBU2Mmii4yDSAmjqj8xU76JdjZ+41JU=;
 b=c4oMUSsVm9aijmmptaAYmIYJ3saCUcmgJSdn+pzYbYpCK7PbIQ4ILrOjwHfApwMKcjtMzzBen
 waxpTIHg5+vDQp3ncnfZVIFG9vx/94QJxSXGd9b00qq1DI9EkL0XdyG
X-Developer-Key: i=erik@riscstar.com; a=ed25519;
 pk=gjm0pD1JkINoNzvT3vC2WZoAWUld0EyXuhsQ/i5Qz4I=

This matches the stdlib conventions[1] and seems easier to read to me.

[1] https://doc.rust-lang.org/stable/std/?search=from_raw

Signed-off-by: Erik Wierich <erik@riscstar.com>
---
 bindings/rust/libgpiod/src/chip.rs          | 4 ++--
 bindings/rust/libgpiod/src/info_event.rs    | 2 +-
 bindings/rust/libgpiod/src/line_config.rs   | 2 +-
 bindings/rust/libgpiod/src/line_request.rs  | 2 +-
 bindings/rust/libgpiod/src/line_settings.rs | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
index f39beab58363beaebe2ba2dcfb846178b7b595e5..df1cef3bdef5d2014e951437c9fe89c119bff48c 100644
--- a/bindings/rust/libgpiod/src/chip.rs
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -149,15 +149,15 @@ impl Chip {
                 errno::errno(),
             ));
         }
 
         // SAFETY: `gpiod_chip_read_info_event` returned a standalone `event`
         // over which we have sole ownership. We won't use the raw pointer
         // directly after passing it here.
-        Ok(unsafe { info::Event::new(event) })
+        Ok(unsafe { info::Event::from_raw(event) })
     }
 
     /// Map a GPIO line's name to its offset within the chip.
     pub fn line_offset_from_name(&self, name: &str) -> Result<Offset> {
         let name = CString::new(name).map_err(|_| Error::InvalidString)?;
 
         // SAFETY: `gpiod_chip` is guaranteed to be valid here.
@@ -197,15 +197,15 @@ impl Chip {
                 errno::errno(),
             ));
         }
 
         // SAFETY: `gpiod_chip_request_lines` returned an object over which we
         // have sole ownership. We never use it again after constructing the
         // wrapper.
-        unsafe { request::Request::new(request) }
+        unsafe { request::Request::from_raw(request) }
     }
 }
 
 impl Drop for Chip {
     /// Close the chip and release all associated resources.
     fn drop(&mut self) {
         // SAFETY: `gpiod_chip` is guaranteed to be valid here.
diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
index e59de89a0507aa224fc5f473f321a0817fe29980..f23701ab43ce5c215bb5260cd608d8e46b927079 100644
--- a/bindings/rust/libgpiod/src/info_event.rs
+++ b/bindings/rust/libgpiod/src/info_event.rs
@@ -32,15 +32,15 @@ unsafe impl Send for Event {}
 impl Event {
     /// Get a single chip's line's status change event.
     ///
     /// SAFETY: The pointer must point to an instance that is valid. After
     /// constructing an [Event] the pointer MUST NOT be used for any other
     /// purpose anymore. All interactions with the libgpiod API have to happen
     /// through this object.
-    pub(crate) unsafe fn new(event: *mut gpiod::gpiod_info_event) -> Self {
+    pub(crate) unsafe fn from_raw(event: *mut gpiod::gpiod_info_event) -> Self {
         Self { event }
     }
 
     /// Get the event type of the status change event.
     pub fn event_type(&self) -> Result<InfoChangeKind> {
         // SAFETY: `gpiod_info_event` is guaranteed to be valid here.
         InfoChangeKind::new(unsafe { gpiod::gpiod_info_event_get_event_type(self.event) })
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index 09a65514748d0a85fb39a3d37a18f19fc9f4af1b..34b6c227b0c8e156ea1bac396cc19ea4f182012c 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -133,15 +133,15 @@ impl Config {
                     errno::errno(),
                 ));
             }
 
             // SAFETY: The above `gpiod_line_config_get_line_settings` call
             // returns a copy of the line_settings. We thus have sole ownership.
             // We no longer use the pointer for any other purpose.
-            let settings = unsafe { Settings::new_with_settings(settings) };
+            let settings = unsafe { Settings::from_raw(settings) };
 
             map.insert(*offset as u64, settings);
         }
 
         Ok(map)
     }
 }
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index c73943da9b42a12b35adf5234c80e62f4c7785a7..49fe56542ab876bd2360b5e846e18ced0de51fbd 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -28,15 +28,15 @@ unsafe impl Send for Request {}
 impl Request {
     /// Request a set of lines for exclusive usage.
     ///
     /// SAFETY: The pointer must point to an instance that is valid. After
     /// constructing a [Request] the pointer MUST NOT be used for any other
     /// purpose anymore. All interactions with the libgpiod API have to happen
     /// through this object.
-    pub(crate) unsafe fn new(request: *mut gpiod::gpiod_line_request) -> Result<Self> {
+    pub(crate) unsafe fn from_raw(request: *mut gpiod::gpiod_line_request) -> Result<Self> {
         Ok(Self { request })
     }
 
     /// Get the name of the chip this request was made on.
     #[cfg(feature = "v2_1")]
     pub fn chip_name(&self) -> Result<&str> {
         // SAFETY: The `gpiod_line_request` is guaranteed to be live as long
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index 6445a4756b1f12932e266148a4ac9528c7ac1d06..9ab8ea7173c4f214e6d513434435a144424ecc74 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -50,15 +50,15 @@ impl Settings {
     ///
     /// Assumes sole ownership over a [gpiod::gpiod_line_settings] instance.
     ///
     /// SAFETY: The pointer must point to an instance that is valid. After
     /// constructing a [Settings] the pointer MUST NOT be used for any other
     /// purpose anymore. All interactions with the libgpiod API have to happen
     /// through this object.
-    pub(crate) unsafe fn new_with_settings(settings: *mut gpiod::gpiod_line_settings) -> Self {
+    pub(crate) unsafe fn from_raw(settings: *mut gpiod::gpiod_line_settings) -> Self {
         Self { settings }
     }
 
     /// Resets the line settings object to its default values.
     pub fn reset(&mut self) {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         unsafe { gpiod::gpiod_line_settings_reset(self.settings) }

-- 
2.50.0


