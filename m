Return-Path: <linux-gpio+bounces-24416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A4DB27C34
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8E72A018D0
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F38528399;
	Fri, 15 Aug 2025 08:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mS8VIfEP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B0E2D3A71
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 08:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248290; cv=none; b=JDgZ2WL6Scw6401bpvsTeo2FsH7fe1T+gJrl+R1PISqpEY1pzzGeYGgoELlGYXD84iU2HbCWh/GZwVvSfLWSG4W6BXD9WKcmckYttyBDZDFaEchhFH+8Y87fmZeAnmiIF+VypltbZEt4tPQGiq4ryljiPEYuL2ImtDsB8P3H9cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248290; c=relaxed/simple;
	bh=1NzqnGeoW4RdSSLnv4281Lgl359MICURsdk+0aRoeu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bg8BCUHCk0AKH12FEcNORrWTwqD7fcP+nQ5WthOpv7fC9T4AVjvwzdMyTpibUpDvrdr7NIB1wznmtknLcThKXt7Ff+rAw1kRFeH+nYF8r3QL42xmPhY2qpxx4Ue/ZtRr7YMJXTPchz9YXVb9h8iiXfDQI3KHxYAojYT6rKb1R3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mS8VIfEP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9d41bfa35so1453735f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 01:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248287; x=1755853087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLwALtw9DwWtE0w9l2/pMmWWHc0PZOPYhiDUPaeX4+0=;
        b=mS8VIfEPRC3JrP8ZtBOJscneDX75ZcL6wDC9AMzj80z3D4VuPr70esQ5UDmN8SwqoU
         k8bVOda1bAlk7ZSUXQ6MwX6q9nXSk8/EL3zghwWtwl8IRoN07EhG5tImzIuDgo5yRu9K
         GDZToEbietlcQSikdGZxKK9xSjLw+Y0ZU/noA8J49vQk17atnAK14p24OuKsO+SQR0lu
         IT+lB8Jo6J/gI/B9hHG9BXA5K03mnCDX9YE+NO+POygdYuNeVQ/ItUoz22xlAHF/3r3t
         XZWKpKjeXUsDdnRWLia3vg90u1C8IAsGXXBfEbHPdvQ8cpMZytklRloUQUINjQNtx5zf
         YsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248287; x=1755853087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLwALtw9DwWtE0w9l2/pMmWWHc0PZOPYhiDUPaeX4+0=;
        b=l9BJsXq01oRexojxUaYRcksfAanmdee1C/Fmgm/IKvxo8OtzVdc98k13UQTylxNXTN
         PJswy5PEyyzUYJ+tYSVjzkhrr/+d7Gbx4vyU+IeDfGAHg0ghi5CXrNCf5hjJ6Bah8Dow
         GZ7RK+ZuJ4mx8VdMD32sT9/f1QiWnXAXBzWftlX4McSM/6TGQkzuhu4M3lhYZJGRTkom
         Vrw6htdc8EP4bE2aow+E0e3BDS8asidpXn/oarRRmec68Au1h/Yuo1Hvp857hJ2ab+cW
         b8s8OKs8Q84b4mcM7W7E2avOKWNYVNAexmVAZj13AXQH9onKkwJOQHfO6PySO+LV8tmk
         Pd+Q==
X-Gm-Message-State: AOJu0Yyui76/8X6NgOJ6dKWKmaQrAoic+/4fMgRzKum/GAgAEuR10H30
	624W4ycA2iPFIyzQsyAym8MPjNpFffDoA2aYEC08b9RvibSkcwIi2ia3+J96aZ2F/oxIhy69al/
	ZDZG7
X-Gm-Gg: ASbGncvdSNzX0PgPATTtLEm6l2moOQQT6qsrFIpgzWYlrwE+01PHVH6FkO2COHIjHbC
	rlB0rSvxRgqwtmLXkPN/B1vFOzi5QMiAeDeG656fPVyQSuW0buP4wmFUkd2+CaJ2aM0KT7g5RKs
	ShozPMgENRz6jfAzYJ85SuA9sBTAQ8Fcxps7RxXflhIoZOe1VVNebsGYMKQuW4TvhHY9uG4Q4Os
	+XOd3xWGXKJAAmbsgtQ3kNaXqHE8EA4oiWpkRJ90dSScZSxD7a9/eJpduDbEBiOopqkf0P/ztnz
	4UuWaftUaFhJ8twgGJVzcEQ99LjaoA04hxt5nwxncdXU3w92kisCkOmMlS6eH3AJW9OLHBjOl8Y
	0J/9J56rRfE/4XqV9Zw==
X-Google-Smtp-Source: AGHT+IGt36EQk/yflsxw5iQ80E2Wi+jNZcAG/WgKX8bsG1YOK3i2XfHPRRCiD0DrGu1vXZPwDjYO1Q==
X-Received: by 2002:a05:6000:2409:b0:3b8:fb31:a42d with SMTP id ffacd0b85a97d-3bb68a1875dmr917361f8f.34.1755248286800;
        Fri, 15 Aug 2025 01:58:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64758d1csm1193355f8f.8.2025.08.15.01.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:58:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 10:57:56 +0200
Subject: [PATCH libgpiod v2 8/9] bindings: rust: update intmap dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-rust-1-0-0-release-v2-8-b1794cb4b9be@linaro.org>
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
In-Reply-To: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3245;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lHUSl5xAk3bAchCz7pOlKmXb1tbBFWwMO9P0K9lniOo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvaVbgZqlknLduE1gcaaBXQnifpbg+VJeV0vL
 x1FyYY0jkGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ72lQAKCRARpy6gFHHX
 cpvzEACOikNoDUNHRPo180Fvu+CFulsHydrHG4DNjzz6z4waq6+si8YBr+IcEIZdEZSPhiP5T+q
 i9OyJV/UlfRoOtjh/UxUWl4lf7Ziq94ge7Jlxfa5/3ysIhqFT/Kp59mNJOIPrP9A98W51nH7NKv
 8530CzpYjdzdAPEVRbqu2GT7j32RwNrCeyNtM+p+WwDlED/032rvhokqnVntDfNQ2+OgkNhwDD4
 UkvovCgPdTr8n9Z8qVupz7w0IpToP3Hxy/8mbbcifa+G0pcqnCsxxVLv3E79Z+VqALTJE6932Cu
 2ki87YUy/RIcDjYLCkHOwjm/7WJlU9ecsv4wwEyaIgvYSNgTJcObhSYkhwYO7LpwLo3fCe5msLM
 2ndAmYQ61LATGlCn6iDfPwPbC0NnyOulK+nNMZ4GXNmLnV0HZLEq9DbYcS7o4Rtu6J+Dczm5jdu
 esJwkjMBKORDefXTvqfNnW3fuaFwL0c8xUgYO1YeU039aXm2U4Oh2vHPma0yGr8x0gGysM3Iz9Y
 V/qMmnMoJJwyicMopPK2g8mzxl5Rt0goDXUSaq2N6zUuIijM+QMyLsQOcJtNbmvR7O0P5Rv0yuE
 ufBvGchYnIZHGXqFWlsk9dVtIvspqvRV+NxRs1tCOXvD6QaYQmtqIng0hpmFkbVXTQjb0dHyYVD
 RNGcbiv+pS4GBCw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the intmap dependency for libgpiod to the most recent major version.
The IntMap type now takes two explicit type arguments for the key and
value so adjust the code accordingly. No longer require a specific minor
version.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/Cargo.toml          | 2 +-
 bindings/rust/libgpiod/src/lib.rs          | 4 ++--
 bindings/rust/libgpiod/src/line_config.rs  | 2 +-
 bindings/rust/libgpiod/src/line_request.rs | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index e26e893b0250a79077a46ced38012367c78fa5c5..4902d3707bc84dfcfafa3e70493303dd1027dd26 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -24,7 +24,7 @@ vnext = ["v2_1"]
 
 [dependencies]
 errno = "0.3"
-intmap = "2.0.0"
+intmap = "3"
 libc = "0.2.39"
 libgpiod-sys = { version = "0.1", path = "../libgpiod-sys" }
 thiserror = "2"
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index f4e511d535b70fbc01f91fa059921545b405656a..76a2c1b76f3cf365866797742011b780ee5795d8 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -178,10 +178,10 @@ pub mod line {
     }
 
     /// Maps offset to Value.
-    pub type ValueMap = IntMap<Value>;
+    pub type ValueMap = IntMap<Offset, Value>;
 
     /// Maps offsets to Settings
-    pub type SettingsMap = IntMap<Settings>;
+    pub type SettingsMap = IntMap<Offset, Settings>;
 
     impl Value {
         pub fn new(val: gpiod::gpiod_line_value) -> Result<Self> {
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index 34b6c227b0c8e156ea1bac396cc19ea4f182012c..5850b9da3cba0d75f475246592796c2c52570e8e 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -139,7 +139,7 @@ impl Config {
             // We no longer use the pointer for any other purpose.
             let settings = unsafe { Settings::from_raw(settings) };
 
-            map.insert(*offset as u64, settings);
+            map.insert(*offset as Offset, settings);
         }
 
         Ok(map)
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index 49fe56542ab876bd2360b5e846e18ced0de51fbd..48d8d1a3a6fb5110ef295971cf44bcc70ff68c58 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -110,7 +110,7 @@ impl Request {
             let mut map = ValueMap::new();
 
             for (i, val) in values.iter().enumerate() {
-                map.insert(offsets[i].into(), Value::new(*val)?);
+                map.insert(offsets[i], Value::new(*val)?);
             }
 
             Ok(map)
@@ -144,7 +144,7 @@ impl Request {
         let mut values = Vec::new();
 
         for (offset, value) in map {
-            offsets.push(offset as u32);
+            offsets.push(offset);
             values.push(value.value());
         }
 

-- 
2.48.1


