Return-Path: <linux-gpio+bounces-23573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E12DB0BE25
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE1FE1893A97
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF38A28507C;
	Mon, 21 Jul 2025 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cWFg8oSw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0A928467B
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753084400; cv=none; b=qXJf90Ar9Cb+Cjjr94tcJobMGqxDfQFHZRBxrIrZ2JTQPjBcxyvU5LEj7Lwk9ARSFgDiKsOoWsCKO/7oBb+8LA6KdD5qPx5GWg1OYtJ158NDHf0Ioxqlkr1rZVbV2/5x3K3fgXNR2XyHBqddA8cOkecPPEu4p9RDKolrUT0ouCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753084400; c=relaxed/simple;
	bh=MjUhQfJTPa0TTpQL/DbnIB7mLIyEngwk1NjK4PAFjaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iG4Y0vhWb1ppA+/Z+qFgMn9/CrZmS2lAiUd++TGTCXfhuuQloTYA9h1p6Yf3em85Oli9by9dQMa/ikH/BvEenwPFyYqvdLz81UQyCZnnR02OflfggjpTI32JQXhr9MpJEmvlg1tYd+jQlwTi1k5Jwupbjse6HeuJ0cEZ6F2JcCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cWFg8oSw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae3ec622d2fso666509466b.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753084396; x=1753689196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJlzlbQAF7ZF+g3uhy0OfqXR36jBDtT5y0cZK8g8hwI=;
        b=cWFg8oSwzENnAfJK6ACw9JHzAHSzGafR4eWNdGVwsrBjutGNPTXwH4jpoXWJeQNigR
         tmzfpyCwRLS62fuhBMHsbbQiDeNMe7i5fHcE95cq06CUpEFtTqsWGiDf7bcesTsNmbPb
         aDsoI8Ln+eklkCulQ6n4UlHNMryO8RlzOGPT9xXRr3M/2QvHbLeTajrfPP77IpYzlMPB
         a19MKEgkpD4fUu92wBaM9R7+ORiEMVFBDLzENjRT50he67zl/+h2ts3RBZQHtKqQWU4a
         yrAmMTL1dEVsn3quXXk73sBjB04ouAyxsGLlMMyibR1vjs0PsiSQ6lLiAkIx+c3pdSN7
         8o8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753084396; x=1753689196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJlzlbQAF7ZF+g3uhy0OfqXR36jBDtT5y0cZK8g8hwI=;
        b=Ui+AamyAVfPewSU7K4xl8NxXH5GTsds761H4pRuH+uLtEf/kgwlolKJI9FfVR37lmr
         NyJjiqVMgzz3mFEuVLZ4qYccx9QtXsfBEhRqVR6vX9dxx3nRzEgPSnXUwwN3lQzXGiI3
         GOK6CT0KWdjCXKG/QDJ9g1CAsQx0GxaIbNVJCBDNwZ2wzAp/jCqPMVueUOkbTVB1nkVy
         dA6jz+APGt0SSvySSH+qHV07araN8huWHFUXJnCyAtfgfqCvolkE4VxXkTcYN1ndQ/HP
         Dyn1eSGmMqxykm5CiaMR4i7qh62IKn9YPWtrxjjtmxIbywdaA3JDI/eMMGweMRy9gJQl
         j+Ug==
X-Gm-Message-State: AOJu0Yxu2+mVtI00s35ySrDpqPqatE+3MMQ/l0JplKgdFXHdVC4xJMqj
	NzW8Eh79PmxdtHrWn2V8N3of7qiFuY5I1ZgDIXOX+tzrlE4osR2qyLxQ+Z3wLcwF9TAvrxlnobb
	8xOXk
X-Gm-Gg: ASbGncttzgQz/6uIakBl4sj7JaavV75vnsjotp5Ady9cZ3AJP1QrfsymVFjqTpcOQjW
	MAAtZzDEEQdUvn0cNV5+RcxkBvZdOZ6k1bnKM3fWSaCiymL5bNK68zK7l/30kzcvpnPnZIoEe4Z
	pEP7xDC/ZFPKj7Ydyq2N+B+ZFLwDAse3U151zXhrs4il32/xlsgGgdIdkKmqLmIliFRooHsRMmH
	+XE6usCdkPHNgAMMS3H340Bvo/GGPZbCTcKGi8kvrd97i/N6Cdu3HIIIgoJb3b4VgPEBJlid3PK
	v7MpyMhuPq+zUicE/aKrOvCz571dWMbxJEkqynQ74XFMLL435aDqxb/lTw3GJ3Spfoih4+ZDVPA
	n4tw00A==
X-Google-Smtp-Source: AGHT+IEHk3Z1w78AcgxKsLFcv1tG8lccDXkyz+0f3rBdrMpgYhT4K0txoy+aTHRx55tiwwjiFeyHog==
X-Received: by 2002:a17:907:6d25:b0:aec:5a33:1562 with SMTP id a640c23a62f3a-aec5a3354b2mr1449253366b.44.1753084395621;
        Mon, 21 Jul 2025 00:53:15 -0700 (PDT)
Received: from [192.168.1.187] ([2001:9e8:d58e:7200::35e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7d30csm628379966b.119.2025.07.21.00.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:53:15 -0700 (PDT)
From: Erik Wierich <erik@riscstar.com>
Date: Mon, 21 Jul 2025 09:53:08 +0200
Subject: [PATCH libgpiod 2/2] bindings: rust: simplify format statements
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-rust-clippy-v1-2-2ac0198b2ea6@riscstar.com>
References: <20250721-rust-clippy-v1-0-2ac0198b2ea6@riscstar.com>
In-Reply-To: <20250721-rust-clippy-v1-0-2ac0198b2ea6@riscstar.com>
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Erik Wierich <erik@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753084393; l=7648;
 i=erik@riscstar.com; s=20250721; h=from:subject:message-id;
 bh=MjUhQfJTPa0TTpQL/DbnIB7mLIyEngwk1NjK4PAFjaw=;
 b=92l0g6MUlKLSjX2KBrzffcuhwcLHu+fWCHBi4S/egagvFeJWBOW+kj6lZmJko0S7XBBZ2z8KY
 V3fId+KxjV/B7CTRax0bsBUi9kG6zjOcxB76FbQRSIZ7hwp7fhl5LfF
X-Developer-Key: i=erik@riscstar.com; a=ed25519;
 pk=gjm0pD1JkINoNzvT3vC2WZoAWUld0EyXuhsQ/i5Qz4I=

clippy suggested these:

    warning: variables can be used directly in the `format!` string
       --> libgpiod/src/lib.rs:113:9
        |
    113 |         write!(f, "{:?}", self)
        |         ^^^^^^^^^^^^^^^^^^^^^^^
        |
        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#uninlined_format_args
        = note: `#[warn(clippy::uninlined_format_args)]` on by default
    help: change this to
        |
    113 -         write!(f, "{:?}", self)
    113 +         write!(f, "{self:?}")
        |

Generated with `cargo clippy --fix`.

The suggestions look like an improvement to me.

Signed-off-by: Erik Wierich <erik@riscstar.com>
---
 bindings/rust/libgpiod/examples/find_line_by_name.rs           | 2 +-
 bindings/rust/libgpiod/examples/get_line_info.rs               | 3 +--
 bindings/rust/libgpiod/examples/get_line_value.rs              | 2 +-
 bindings/rust/libgpiod/examples/get_multiple_line_values.rs    | 2 +-
 bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs | 4 ++--
 bindings/rust/libgpiod/examples/toggle_line_value.rs           | 2 +-
 bindings/rust/libgpiod/src/lib.rs                              | 4 ++--
 7 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/bindings/rust/libgpiod/examples/find_line_by_name.rs b/bindings/rust/libgpiod/examples/find_line_by_name.rs
index f7b991933b44c8bd107507a9a5322e4cf8bdc312..6d6a37b083efce4c61ecfb8c57292c4ee299466c 100644
--- a/bindings/rust/libgpiod/examples/find_line_by_name.rs
+++ b/bindings/rust/libgpiod/examples/find_line_by_name.rs
@@ -20,10 +20,10 @@ fn main() -> libgpiod::Result<()> {
                 info.name()?,
                 offset?
             );
             return Ok(());
         }
     }
 
-    println!("line '{}' not found", line_name);
+    println!("line '{line_name}' not found");
     Ok(())
 }
diff --git a/bindings/rust/libgpiod/examples/get_line_info.rs b/bindings/rust/libgpiod/examples/get_line_info.rs
index 086db90dbc1af97203ac54f3aa3abc108216cd19..7fb91a0cffaf5d7419722e9c503ab75cef44488a 100644
--- a/bindings/rust/libgpiod/examples/get_line_info.rs
+++ b/bindings/rust/libgpiod/examples/get_line_info.rs
@@ -25,13 +25,12 @@ fn main() -> libgpiod::Result<()> {
     let low = if info.is_active_low() {
         "active-low"
     } else {
         "active-high"
     };
 
     println!(
-        "line {:>3}: {:>12} {:>12} {:>8} {:>10}",
-        line_offset, name, consumer, dir, low
+        "line {line_offset:>3}: {name:>12} {consumer:>12} {dir:>8} {low:>10}"
     );
 
     Ok(())
 }
diff --git a/bindings/rust/libgpiod/examples/get_line_value.rs b/bindings/rust/libgpiod/examples/get_line_value.rs
index 39141e23363d6a026c0e5f748f72b1b8e5c583c6..e1ef6c7896c3671667119a256d14e930a291d532 100644
--- a/bindings/rust/libgpiod/examples/get_line_value.rs
+++ b/bindings/rust/libgpiod/examples/get_line_value.rs
@@ -19,10 +19,10 @@ fn main() -> libgpiod::Result<()> {
     let mut rconfig = libgpiod::request::Config::new()?;
     rconfig.set_consumer("get-line-value")?;
 
     let chip = libgpiod::chip::Chip::open(&chip_path)?;
     let request = chip.request_lines(Some(&rconfig), &lconfig)?;
 
     let value = request.value(line_offset)?;
-    println!("{}={:?}", line_offset, value);
+    println!("{line_offset}={value:?}");
     Ok(())
 }
diff --git a/bindings/rust/libgpiod/examples/get_multiple_line_values.rs b/bindings/rust/libgpiod/examples/get_multiple_line_values.rs
index a1be5a6e670b41534a65f7435d99185d832a894d..b09f3be033246c61cda43bd0e947ba34bb421642 100644
--- a/bindings/rust/libgpiod/examples/get_multiple_line_values.rs
+++ b/bindings/rust/libgpiod/examples/get_multiple_line_values.rs
@@ -20,10 +20,10 @@ fn main() -> libgpiod::Result<()> {
 
     let mut rconfig = libgpiod::request::Config::new()?;
     rconfig.set_consumer("get-multiple-line-values")?;
 
     let request = chip.request_lines(Some(&rconfig), &lconfig)?;
     let values = request.values()?;
 
-    println!("{:?}", values);
+    println!("{values:?}");
     Ok(())
 }
diff --git a/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs b/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
index fb5402bf88bf56c28f1c43f0e54ced22ed64f39e..b872d7709f3ecc651cf6d372cb46d6fbdfed77b1 100644
--- a/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
+++ b/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
@@ -21,22 +21,22 @@ fn main() -> libgpiod::Result<()> {
 
     let chip = libgpiod::chip::Chip::open(&chip_path)?;
     // request the line initially as an input
     let mut request = chip.request_lines(Some(&rconfig), &lconfig)?;
 
     // read the current line value
     let value = request.value(line_offset)?;
-    println!("{}={:?} (input)", line_offset, value);
+    println!("{line_offset}={value:?} (input)");
 
     // switch the line to an output and drive it low
     let mut lsettings = line::Settings::new()?;
     lsettings.set_direction(line::Direction::Output)?;
     lsettings.set_output_value(line::Value::InActive)?;
     lconfig.add_line_settings(&[line_offset], lsettings)?;
     request.reconfigure_lines(&lconfig)?;
 
     // report the current driven value
     let value = request.value(line_offset)?;
-    println!("{}={:?} (output)", line_offset, value);
+    println!("{line_offset}={value:?} (output)");
 
     Ok(())
 }
diff --git a/bindings/rust/libgpiod/examples/toggle_line_value.rs b/bindings/rust/libgpiod/examples/toggle_line_value.rs
index 6d5f697310e9977677975ab3202cad3975ffdc6f..bf87222acc87f559af1467c59b1b98b299755759 100644
--- a/bindings/rust/libgpiod/examples/toggle_line_value.rs
+++ b/bindings/rust/libgpiod/examples/toggle_line_value.rs
@@ -30,13 +30,13 @@ fn main() -> libgpiod::Result<()> {
     let mut rconfig = libgpiod::request::Config::new()?;
     rconfig.set_consumer("toggle-line-value")?;
 
     let chip = libgpiod::chip::Chip::open(&chip_path)?;
     let mut req = chip.request_lines(Some(&rconfig), &lconfig)?;
 
     loop {
-        println!("{}={:?}", line_offset, value);
+        println!("{line_offset}={value:?}");
         std::thread::sleep(Duration::from_secs(1));
         value = toggle_value(value);
         req.set_value(line_offset, value)?;
     }
 }
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index c03831bce62b287c08804e2d9d96aea7320dec7c..f4e511d535b70fbc01f91fa059921545b405656a 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -106,15 +106,15 @@ pub enum OperationType {
     SimDevNew,
     SimDevEnable,
     SimDevDisable,
 }
 
 impl fmt::Display for OperationType {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        write!(f, "{:?}", self)
+        write!(f, "{self:?}")
     }
 }
 
 /// Result of libgpiod operations.
 pub type Result<T> = std::result::Result<T, Error>;
 
 /// Error codes for libgpiod operations.
@@ -378,15 +378,15 @@ pub mod line {
         EventClock(EventClock),
         /// Output value.
         OutputValue(Value),
     }
 
     impl fmt::Display for SettingVal {
         fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-            write!(f, "{:?}", self)
+            write!(f, "{self:?}")
         }
     }
 
     /// Event clock settings.
     #[derive(Copy, Clone, Debug, Eq, PartialEq)]
     pub enum EventClock {
         /// Line uses the monotonic clock for edge event timestamps.

-- 
2.50.0


