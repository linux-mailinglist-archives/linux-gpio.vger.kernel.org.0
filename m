Return-Path: <linux-gpio+bounces-24282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98696B22662
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D1381B62839
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF732EF660;
	Tue, 12 Aug 2025 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MGFLe6Vb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550A32EF64C
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000657; cv=none; b=Z6H6gHgRf+GgXRModPXsLjjM/av5i1X6hzfNepBDBT72+LikJSJJ1ve+uNSb8X7geWYrD55DxDyZtUMCDlEz7hJo2E+OnojsbSMM1bWgCcgkFStOaAgGlLjPVStLK9icSBS9h2LN3AVEZbtibszbytj5F6AX6gqUuXwIwb+FKV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000657; c=relaxed/simple;
	bh=thh079rHaz4Opon43L8KgpAxZqcRYj9LeT+JNRwG1C0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iIJQqul+DLsOS8Zi00jgN010JGrmaW1dIcOBGDXAzfGQg/AySLC92tdIkHFGigyrS4Uw76gJeclJW3/jazfmh5ITfoUWCuK865t61L44qpasoiLgKKoNVj5X2RsOea/YIrtlqUjtniNDNkE7jA/gvpG2G9a+KE1/u919Qw/oR7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MGFLe6Vb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-459e20ec1d9so52934465e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000654; x=1755605454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koC+0/v9/LcbM4WWFoON0dSwyF7a3Du4788vBL1KsIU=;
        b=MGFLe6VbhPc19gl/d4vd2sOp0kaFFbYdggD3IWssyjZBdzTqhrcLi3xDB+BmxKBgkY
         QGbls4D5fq4PV8lWZj0AqWR7Hb2lQEOJt3mTWDgSO97UI+dUWOCGs4ULI+BrskbLVdWu
         CxbElung7Dp9kYBSb223XPtlolT+Zk1+tWNKqqwjIV4m5Daf8QsSSHdm0X/vaqWBQ4GN
         h3Ltni/JPjV+FcBZ531vdOWQULb5ajYEwS9GQN17iq4zjiGUPlUHHUVDnfThx7OodXV5
         1jRShnThlzIjfO6xkTddAIs8gRQCwfF+7FlPqrg8QdOflKPGUjquB2Pnx8e0R9kmsJNW
         dyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000654; x=1755605454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koC+0/v9/LcbM4WWFoON0dSwyF7a3Du4788vBL1KsIU=;
        b=f2DilEuR+I/ILRhdl8iiv1Oo8Lvdd8Mt53Txk1W26Nhkie24XxjdyU4EWYdRiQPayz
         Gwqm6j8PCFH7OcSoNOYYtkyPx79JSBJn5NHxxFoL6YqTWwfWK+9vk7vLcwjUMP/pysFy
         vXE85k2Ym78EJJ9fqgepZItXYFFNMjSO+ePg5m9H+f/WQf1+51YvUj7q+CFLdZ+yNwUT
         /B7hTHuzxoNrnSUQMPC2A23pXjzpudO+6RC3RDuYYS48vCQKAwppRKgj/+ZkK7TMMdOt
         hUi42ImS9X3KqzbJ4QHFZcI8dgz6qIgPDPr9BP3+abnWe51vV5R6+3RG4+heQZpesSAV
         6FNg==
X-Gm-Message-State: AOJu0Yxu3JNN4OJuc0NiWMuJbHScrTaS4NiEP2zVB/q99mZythLxxoMm
	1z6M/zl6Rmhypm5QOQOC5er/qrA548s5bcYwmV2hwATxLLpBnFw/jkAXqzG9erFsWJzEnTRuMBJ
	jSZAU
X-Gm-Gg: ASbGncudcJ+08hlh4Nqq+fX5o5qS8RH0ttnoAJycqmYhBPmyYnJglxu/dEvX/Vo+8vL
	SpH2IP6NWW3GhKzqpoxMTn6QI8cZovaoSjD0O0d/VDOFJU6sh8uBQ9l00ECywMP9G7qB/V3bWyU
	nY/AW+Xqd/YrM+Wki3+E39/YvIMOfNXp89yaziEI1BnEFFUWbNv3o8xbLjngdJHFHE3Zw700Y1o
	ozhkSZhXa0Uw/h+iEt0Pknj9ZMZHz2PRfPNVt11/meRVBZJ68HSqmLOm4ZwkmCtfMVL/NForTKI
	t2c1ts9bcCoYkO5K9VMJPHu9a8QWFQxADRLbPBIzPRutQ1KA7NEvBZ3As0Y2AfZlIYouHdLuV1Q
	bb8YIFPH7W86Lar8=
X-Google-Smtp-Source: AGHT+IEc6hPV55cDQfS8oVtFC+azs1VA7ynGM95vGu4Of652jphseAIeZLtJCK8szOHORJJEFKNgrA==
X-Received: by 2002:a05:600c:19d2:b0:459:ddad:a3bd with SMTP id 5b1f17b1804b1-45a114c20e9mr29065265e9.15.1755000653585;
        Tue, 12 Aug 2025 05:10:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e1cb7deesm34268788f8f.2.2025.08.12.05.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:10:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:10:38 +0200
Subject: [PATCH libgpiod 08/10] bindings: rust: update intmap dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-rust-1-0-0-release-v1-8-372d698f23e8@linaro.org>
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RHhdkIo2AFfSmDM7h2NjHZ2lbaO8izvR2MzgAQlC7HM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy9DaC0uq70r/9WpHhd6nmdT1CqGKE34FM3/J
 DLgEFJDXhGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvQwAKCRARpy6gFHHX
 cmZBD/9HFDSLazXS4S+3R8t0cfCMKwppovXYllJgxHOrsLyT5JZFhr88mikwHbM96Rp4EP2QmpG
 Zlg8ZQC1Y0aKUGZPjmyojhluNUcb8f8IOUAZBX9M3AXiwCILvYp+6ML6009++tH+jyZi+I6tVvw
 4mpSRQ2SS+CSKjbOnfrDfZOq6pMOtreeqdbxr0PWTIq9RJeYJ9+5kTWD66H3XRMoHVSZ9pKhBnf
 Bf8X49qZOa4P0BuvKV2Q+9K3pH2E17Np7z7KFn1IhgKqucWSx0hbujUKaR97lamguc3lLEhIseJ
 2JcgptisCCimRtExO5MpGWu7yORCBAIzjukz14/dZEx0HA3rVhNiG1/io7ukyvsHK9btFUE+vaW
 uXQXQS0+T17amxBzSkXvPJk6zbRTzd8xpFZklJh72RlQRsmgH+NYzcApnWLzHshwrCGIs1NNsXY
 QvWqAnjFaw0DeQAVx00v8uGd0Zg8Esq/qkg5M2bPK47rULl9NJPKezd63ctWHwAYTf/LpzKIEMe
 C1XT/HUJ+25B/LVi2lKgytekV1veg1AO9UFS4RWySMLNgdNmrFdKOCD8KSRXInmZv05MuCJMKPI
 OXmQd5YNFfEBQLPUziInG8Rc2QED94erGv4+RQHjozMNMlRkd3mpFuV2HYKuiPjM4Nt71d6Teyf
 ilVGrBsmFWInmTg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the intmap dependency for libgpiod to the most recent version. The
IntMap type now takes two explicit type arguments for the key and value
so adjust the code accordingly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/Cargo.toml          | 2 +-
 bindings/rust/libgpiod/src/lib.rs          | 4 ++--
 bindings/rust/libgpiod/src/line_config.rs  | 2 +-
 bindings/rust/libgpiod/src/line_request.rs | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 8b719b7647910269ca2c91fee685da7fcc67feb7..d7fbe7b3669750880b815832a2e5d7c975ed4d7e 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -24,7 +24,7 @@ vnext = ["v2_1"]
 
 [dependencies]
 errno = "0.3.13"
-intmap = "2.0.0"
+intmap = "3.1.2"
 libc = "0.2.39"
 libgpiod-sys = { version = "0.1", path = "../libgpiod-sys" }
 thiserror = "2.0"
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


