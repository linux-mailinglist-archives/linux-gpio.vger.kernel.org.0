Return-Path: <linux-gpio+bounces-25145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D26B3A885
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72E073BC084
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 17:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD4C33EAF9;
	Thu, 28 Aug 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kdDk6T+I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BFE33CEA9
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756403005; cv=none; b=J9LppXNZuLXRZL0Ge0aa0EGnDWPMq/kXR9e31sGmCfWN1aWctoJhI1Ue2L/T3vfQE1sqM8CGJ+jmF3AifFjfISkf+pAvsXhpQWNfA2LJmCu1Zi51rDHiVhYXUtZFZ4QDS2FWTf4TrL+tY6QKkBxjatCJsXqaAHzX+3dvaXcWUH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756403005; c=relaxed/simple;
	bh=fUcPAbak9lmzdPyjyyIiYNRygzBwp1z/CyfWPoAL1UY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gTkpGPypri4iH2cixOFzrRZHL968zV3Xo5QrOFoVKc3uKygLfnqfEkievO8SzXjBV5RDBb5oTvgUDH9HBObqZ3IL8KSXhwkCqAG/4tJjoeYbx78RuM3DM8WzFu/HyXTXJ3GP7n15WCKx6Ph+cQk6FxgIPnboLdAjGnjLauYOjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kdDk6T+I; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b618b7d33so10320025e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756403001; x=1757007801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51cdqE5cTuEFj+FSUjyNyUCRcNoclwYUIrFJ996Vo/U=;
        b=kdDk6T+IheLvbrzis1OgpUJsNp8kKRmx/wi81KzjGb+W4L/7mcPwQmYO0t6KqfyTjA
         jskRfPuwSJoKnTx9IYn5uiXwzkT+2m0zBUJpjgPRRD7bEeLqDvpQPG7uiey0MuhApgq2
         gdwXBJwuZliKAvZefByiQxyLj0TpWFgg0cqMy+wLzKMaesNTv28+rKU6IC2TmijFysc6
         AJdcq4+22lkrM3Zd4HrKcXeXFFazFLZ9lYuPqARiJcUuMFcZCUt10hHs2g8r7kIvFJdn
         CzEJbor9Bksec79Hc1VmWOHEYh613lwrhezFz09XhZAgy0Dz1OECLQXpsmWlyZaVhLmD
         j8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756403001; x=1757007801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51cdqE5cTuEFj+FSUjyNyUCRcNoclwYUIrFJ996Vo/U=;
        b=rXwn592SJgaz1/vk3skuz2/wD6uepUHFS8uEB8M/tMcj1ISTyaYzClK+YFrnX89asg
         VqU3uFSnskluYJni+C+HtW/awm3B+ChTe/bAh950sBE1uWGc3BEbeErqWa9l6Zb8O8NA
         mYfYWYfybbGmDCzaOSEuxMPlT1q4zW6Q58tSuga+R4F+IZGwb/KqblNfhrb9WDHwBZv2
         uc5TrYHQCvOSGE1Lx+xcEHzaDYNJAixssUNhOYw+p/+qycUoePkpEhXpDt5iJL1dBv/r
         WSzYSHpjwprcCsFOnOjpHkvNflx+u2durrLI79Zk2ZKuemey+TWKPISCdQ+M0/7Yjv7S
         GBtA==
X-Gm-Message-State: AOJu0YwQKaLSfYSaOsnK6OnbmvqcK8xK9WxK94mKRZBE+7OkfAx68yCN
	EGzyc32EhVLnxkCA8vvo8jroqXpTRkgj1kj75N3nWZlDnVPuWAYZaeCZU/w+CeVaiFQ=
X-Gm-Gg: ASbGncvawBVjZmjRqiBDcFtirRBv1sIkLPMjEjAhK3oj1vwAx4taGbW60YojzLXzcRs
	xHr3C41Ojp7UpyoOuHLptTmViSbwEt9WL7I4rxgnSFv5xrY0b3A2gqz1V4WCC1QkRfd4ZEafhY5
	K2eoPVoqfUYKfnsDQJu1qftCBopsVcTezGNp1pvakIrFIBQais5/JPKYWlmKiBmTJCY3HLlcsCL
	teRgeKjnlm1fC9xK1Z15JGfY3qvIPs3m2hNY4tPXoWinHnVTHoj3/A+bF+bC7Wesqe4AOqgCcbT
	/1UTdRXyldURiQ4688bxNs1Ao+nEtgxIXixSyU7nmZ1KuGZPaSySwYbdjFSeriu6bpUDc7ilPrC
	lWRJqdESrLRNqV1kbcluTTsCcN+Fj
X-Google-Smtp-Source: AGHT+IFq54YdVygwKrciKe5Zt4w8PSgQXT8+UnA6fDf5SqVm/pfgP7Bt6IXOLAUIQxVh752Bte06yQ==
X-Received: by 2002:a05:600c:154f:b0:456:1560:7c63 with SMTP id 5b1f17b1804b1-45b5179cf31mr202345755e9.3.1756403000747;
        Thu, 28 Aug 2025 10:43:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm3812075e9.3.2025.08.28.10.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:43:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 19:43:11 +0200
Subject: [PATCH libgpiod v3 09/10] bindings: rust: update intmap dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-rust-1-0-0-release-v3-9-0f9c6c1c4808@linaro.org>
References: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
In-Reply-To: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3245;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yWZCeZ8I95w9OkTolb2RaXA6aWjKC07wdSegcK9m2U8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosJUuvtKGH14oN1W0r102rP7iYTlUus3TBS+rn
 Dxa+2pntfKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLCVLgAKCRARpy6gFHHX
 cg/jEADh7Gaqocm4VNF3KJX3lxA0cG8a7sgS7HnfenkNmKswCezFn0BxDxNyFBTmXe6NyK+x+Fo
 LzufadVD+zyUe2wAebv7PBsWTdyIzI/a73tRa4RDCev6/2cuCDPMi0fzXvwO2GWL0er7eet8Q4V
 s/QijNSk4V6xmAfeqz8T88e/vC0EsC9dsu2s226zJcVYrGp9froYeBoVhg3LP2Aphnw80yLPkN+
 wqaBhhJMd0mQgdgvsW6KNSkNPmdsuJfrvm5Vpvz+vsEN5hrB8BArKdx1UPsCStRU9+3pgWBLaM2
 5iY6UaTx2SRgl1/FymDeblf0+TBqU5c1RIIjRxV3cpSjxsbzQESLr773XYpbDPNXSiBxcjW1M3f
 enSHxUWYn6qsFNv8Pq87ECQdLtS4m6+lxM3XOL98GHNPGh/74bMk3Rh/OY8vjZdvwpyNbEILCW/
 aJORPIl239MZGOhCjMrMb2wJjq8V2QbiDCc5l2DnjZEDp5sdJgsMXl7L/8t6J3ah8m5yAT35EUW
 cD+K/PthE0wEQ+OI7jueT7Wld2URtiIXwHOly7ATrlUZMmoqXshuugJVySr5Tr0wV0zIK81vApT
 dQ9K7Bal/SZerH0y/lYFunvKcBHmXzKuWxVAfZ2tywmJoDFp7Jn4c5gB4wK099ZfWKK4J+ocMNV
 +7bEP1hUlX528jA==
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
index c7542d61fdf0ddac79a1c2c5e1d4a587d32c5b16..533a482f7cf45d5174b78824203befdeeb2901a3 100644
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


