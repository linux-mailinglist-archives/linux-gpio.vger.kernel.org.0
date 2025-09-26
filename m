Return-Path: <linux-gpio+bounces-26635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B08BBA43EC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 16:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC8533AE802
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 14:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE0D1F1517;
	Fri, 26 Sep 2025 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qWHk/+g5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9371F12F4
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897364; cv=none; b=ldSoQ37c+gaKS710mXPn5/Rm1L9Nb4Uqb0hbBRiqQ2SSYljZVUIv4rNtRoBG5NTL9qDjLVVx4/gJYpF7XY21OV/F4B7Qn23l2VgWY6EjWV8PRcbir/UVxng7L88ojq5m8NsrTydOkHW41HfPY6dgUlcMWpMxsTnASobuiWgkndg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897364; c=relaxed/simple;
	bh=alwb03rphXFogM/CHECLPzYAsfBZ2xbKPEzK+OWu1oE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M3BSb7vz1nsJksidSQglaqv3rYTjQ9K3FhwCTDOvJSBdB5bJACsbBSiHpypyoktOSheM74fDNQgX78ro3T0jXa7fktSDuhtNBSJ8HtcvM4ly51efRMdcGz1XH2PuzdsLENJoFc2nVqaVsDsB3jIh6StRMjZ83sMUBJu9UCB4aOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qWHk/+g5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so12422795e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758897359; x=1759502159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8PCsvm8WzTyaGVxelkS7On2Zq6kVcIiO7AddgK4DQk=;
        b=qWHk/+g5QqMQzieacW0GJVdCgV5HehfyR/ggDOnSiblokz3qzkrFp4sUCCWsRd8JjD
         TygRrgC0hFj2sD/fXcRAKQM9BZ+4BpD2IUNgSgvMrOqJjO0aLFtQgNsJ44GU7yWs+fGw
         gitTYdEBxAUhSwWn9cV41nHxDUbA5IP25BTiyVBqKKjXVo5vyKceJV+EF4WRKLjQ0J7N
         s4cMmTmnWwDXpyOWvVavU1taXpZn6155M+hEeCTfDiRTjtSbJSHBu9hh20uY5ODdlBTY
         tv/2nGkb5wNy7IcugxVBw1FSr5XJeBJ6HdV6YvEZzR/+JiY0IcAlDZQVVHEuZnfMt8i+
         MOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758897359; x=1759502159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8PCsvm8WzTyaGVxelkS7On2Zq6kVcIiO7AddgK4DQk=;
        b=KxMAFLdHHntuxpOcImTfb9u/OSwZh2lW6x6uu1rAHSIZsaW0xeRc2enuafOpF/fiVV
         fjLU3YGDQmN6YUYwjeDZiHadG4R93ub8ZtEUB7+BF2g25LZQNeozhc7r5Wupx/ndxxPC
         AAPOlmv0qnwkph6lVtIo9G+jdOfmP7QPWuuDejZ2GJFhoSLGLyUBAetvIJKVy8nSI36a
         IlfWO1E1gw/3cFZfmX7t7ZnMqqqaQk4NpoyGS2+lET/Hu8b7buJct5ptT/GZuwH8Bhzi
         0Gx3n9gJCOkPVPMRd3LdtjVFbpIOrM9JnWn7CMWeqqezXNTE6XwcJX4SqOAGiCu54IYC
         Sp9Q==
X-Gm-Message-State: AOJu0Yxmz0TJwyumnMWs6CKVd48uOe6xtzxn7mAn6LO3IVYlzPR5B7JV
	9xr0q+3RhJoyps6+3NuVwmcCQj+9I8TE9I/pgf3NmBoJctzQ0AIMI2yn28AM3TY4eSU=
X-Gm-Gg: ASbGncvCgCg9/Ry+3c0pga7xI3BvueyIiYTwswt3Ts51Hvu0mqx4V+CEKg70skwaunC
	WNOeG/LHu37pRnWrvgcb7MmfYuvJpy0XzN7dTX4uPhyJdpiFkSG4W1prIN3Yfexmg/MqdnfwoGa
	7smKgx6MiJvxnmEl3bsrXFgD01K4zUVAKKdB/5KGUV1yYcNY+RIQLmTrgtXb6PRn5ruXe3xgeIg
	HL0s83Gp9AozOMocmtAOAeqo4XMRVf+7IulIhTno1174RBCTJLo19sfxmymXHl3cTzH3zZ0aPCy
	GC+oDEP6XYhauwL4dIZzebL2DUEfkIbDWnsuW3XbcLJvGl9EpdFssm6cHkSOZGuOcsqL3lOV8vA
	nQJHNrrTF/lqxeZhd
X-Google-Smtp-Source: AGHT+IEhF/WFSmPqIOgtOOXuLEk9Ksz6RlTsN+4xxyxP/H8aMtboNnUI95+QuiQQ6dSGQD5dkDrsDA==
X-Received: by 2002:a05:600c:8a1b:20b0:45d:d86b:b386 with SMTP id 5b1f17b1804b1-46e33cc6845mr53226615e9.14.1758897359073;
        Fri, 26 Sep 2025 07:35:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ab15:a65:aecd:6def])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc92491efsm7515317f8f.62.2025.09.26.07.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:35:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 26 Sep 2025 16:35:43 +0200
Subject: [PATCH libgpiod 2/3] bindings: rust: update formatting to
 --edition 2024
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-rust-release-tweaks-v1-2-beae932eb691@linaro.org>
References: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
In-Reply-To: <20250926-rust-release-tweaks-v1-0-beae932eb691@linaro.org>
To: Erik Wierich <erik@riscstar.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=32082;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7WWhNbtwjUg37/EXfWDgjZ5IdO1R0dRJiCcK4JKZB9s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1qTJWzpAySdSxxjVdMkgBHT9GpRqqy5lD3/0f
 HlQvI+ubDiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNakyQAKCRARpy6gFHHX
 cqjrD/95punq8oR/nEZ2uKxMnRI97o2hPZ7WqaOyT3FrBANTrbSQ/jZO/nsP/PAIMcE32LtNs1n
 bQqr71PiXNWFJAceyp3BaJlqfUsFE+CuS4+eFMN06uAczvFcrT5i5wq2a/OCPcUk1vYLkq8Z/Hc
 w/WE+QOkPDtC2i2Y5VRv3FLIG44l3kmVQwds84Gy8R4NnNRFV85pFgvwoQGymHRJz5q2Gc265TT
 a5fyo+7XgVIU9ABGKuNB0po4TqlEAZapaB/mbHwB1CYgSEc0f3ArMnEgpb4mUbY/T9REVoC4Z/d
 /jtRf/o8QAXiIBReKgDYmejowVIxWcy7ldCbspBNlitp5tzWTpVTaHMTq/z5apY5vMpatObkoq4
 aVVNSSYmulGK5REpnFDAya1MQRI2BgrSUOtgm+eU9Tabeavo0mGOaI+30lYr51ywYIBQv+gP+5A
 /5mBQc2gfXN5HhjuDbnEz1nRqfbCh0ub53PHVdyadfJCkOuHXKlxP+dE5RN3RvvmmFHNfB1sVRx
 vL+nZ9ReWuRzxo+JkMy8nLBs1gY0H4AanYFlgKXUwC4HbQ6QdUDAGV8orH5LU7BxgqKud/9vpAZ
 gXUYUy/oqblxpbAkGjQNiGj/JghsMsGf8scspbvoSkZuecBBaZxSpBAMnM228viRGMmBtInveX+
 L/2sFhEX5rieYBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Update the formatting of all rust source files to be up to date with the
2024 rust edition.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/src/lib.rs               |   2 +-
 bindings/rust/gpiosim-sys/src/sim.rs               |   2 +-
 .../libgpiod/examples/buffered_event_lifetimes.rs  |   2 +-
 .../rust/libgpiod/examples/find_line_by_name.rs    |   2 +-
 bindings/rust/libgpiod/examples/get_chip_info.rs   |   2 +-
 bindings/rust/libgpiod/examples/get_line_info.rs   |   2 +-
 bindings/rust/libgpiod/examples/get_line_value.rs  |   2 +-
 .../libgpiod/examples/get_multiple_line_values.rs  |   2 +-
 .../examples/reconfigure_input_to_output.rs        |   2 +-
 .../rust/libgpiod/examples/toggle_line_value.rs    |   2 +-
 .../examples/toggle_multiple_line_values.rs        |   2 +-
 bindings/rust/libgpiod/examples/watch_line_info.rs |   2 +-
 .../rust/libgpiod/examples/watch_line_rising.rs    |   2 +-
 .../rust/libgpiod/examples/watch_line_value.rs     |   2 +-
 .../examples/watch_multiple_line_values.rs         |   2 +-
 bindings/rust/libgpiod/src/chip.rs                 |   4 +-
 bindings/rust/libgpiod/src/edge_event.rs           |   3 +-
 bindings/rust/libgpiod/src/event_buffer.rs         |   3 +-
 bindings/rust/libgpiod/src/info_event.rs           |   3 +-
 bindings/rust/libgpiod/src/lib.rs                  |   2 +-
 bindings/rust/libgpiod/src/line_config.rs          |   3 +-
 bindings/rust/libgpiod/src/line_info.rs            |   3 +-
 bindings/rust/libgpiod/src/line_request.rs         |   4 +-
 bindings/rust/libgpiod/src/line_settings.rs        |   3 +-
 bindings/rust/libgpiod/src/request_config.rs       |   2 +-
 bindings/rust/libgpiod/tests/chip.rs               |   2 +-
 bindings/rust/libgpiod/tests/common/config.rs      |   3 +-
 bindings/rust/libgpiod/tests/edge_event.rs         | 120 ++++++++++++---------
 bindings/rust/libgpiod/tests/info_event.rs         |  58 +++++-----
 bindings/rust/libgpiod/tests/line_info.rs          |   2 +-
 bindings/rust/libgpiod/tests/line_request.rs       |  12 ++-
 bindings/rust/libgpiod/tests/request_config.rs     |   2 +-
 32 files changed, 144 insertions(+), 115 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/src/lib.rs b/bindings/rust/gpiosim-sys/src/lib.rs
index bf9ae32eda0cf7220e70975e2dfa4c093f46ce90..e03c8e3eabee427f287a389b3425a123689324d6 100644
--- a/bindings/rust/gpiosim-sys/src/lib.rs
+++ b/bindings/rust/gpiosim-sys/src/lib.rs
@@ -44,7 +44,7 @@ impl Value {
                 return Err(Error::OperationFailed(
                     OperationType::SimBankGetVal,
                     errno::errno(),
-                ))
+                ));
             }
             _ => return Err(Error::InvalidEnumValue("Value", val)),
         })
diff --git a/bindings/rust/gpiosim-sys/src/sim.rs b/bindings/rust/gpiosim-sys/src/sim.rs
index 85c24948d247c71ffcb364db82473ca43ee2aca9..38ee73a1277c9af37a33995fff35916e50dcfa76 100644
--- a/bindings/rust/gpiosim-sys/src/sim.rs
+++ b/bindings/rust/gpiosim-sys/src/sim.rs
@@ -7,7 +7,7 @@ use std::os::raw::c_char;
 use std::path::PathBuf;
 use std::str;
 
-use libgpiod::{line::Offset, Error, OperationType, Result};
+use libgpiod::{Error, OperationType, Result, line::Offset};
 
 use crate::*;
 
diff --git a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
index 7589e1f4187d364f28477c0d410b7e666608ac88..2fc3f08ab9d2bec734b13d8915182f5ebd31b8e1 100644
--- a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
+++ b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
@@ -6,10 +6,10 @@
 // subsequent writes to the containing event buffer.
 
 use libgpiod::{
+    Result,
     chip::Chip,
     line::{Config as LineConfig, Edge, Settings},
     request::{Buffer, Config as ReqConfig, Event},
-    Result,
 };
 
 fn main() -> Result<()> {
diff --git a/bindings/rust/libgpiod/examples/find_line_by_name.rs b/bindings/rust/libgpiod/examples/find_line_by_name.rs
index 3652b6419731b7e85d594906a1b5d41eed63fcb6..ddb264c861d9cf93027086367b8f96676fddda4f 100644
--- a/bindings/rust/libgpiod/examples/find_line_by_name.rs
+++ b/bindings/rust/libgpiod/examples/find_line_by_name.rs
@@ -3,7 +3,7 @@
 //
 // Minimal example of finding a line with the given name.
 
-use libgpiod::{gpiochip_devices, Result};
+use libgpiod::{Result, gpiochip_devices};
 
 fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
diff --git a/bindings/rust/libgpiod/examples/get_chip_info.rs b/bindings/rust/libgpiod/examples/get_chip_info.rs
index 1781d464f0e66471ac1beb038d566eb537fed402..d5d57f863651b3643d75745abdf8e1efad0e342d 100644
--- a/bindings/rust/libgpiod/examples/get_chip_info.rs
+++ b/bindings/rust/libgpiod/examples/get_chip_info.rs
@@ -3,7 +3,7 @@
 //
 // Minimal example of reading the info for a chip.
 
-use libgpiod::{self, chip::Chip, Result};
+use libgpiod::{self, Result, chip::Chip};
 
 fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
diff --git a/bindings/rust/libgpiod/examples/get_line_info.rs b/bindings/rust/libgpiod/examples/get_line_info.rs
index 36c6fbea4c873be473bbbd7d6b91c6925084c9d8..017f5187b6e2dd791c1d1277be01dae3a129a7d9 100644
--- a/bindings/rust/libgpiod/examples/get_line_info.rs
+++ b/bindings/rust/libgpiod/examples/get_line_info.rs
@@ -3,7 +3,7 @@
 //
 // Minimal example of reading the info for a line.
 
-use libgpiod::{chip::Chip, line::Direction, Result};
+use libgpiod::{Result, chip::Chip, line::Direction};
 
 fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
diff --git a/bindings/rust/libgpiod/examples/get_line_value.rs b/bindings/rust/libgpiod/examples/get_line_value.rs
index 9986931af29a284131ce21fe11915285264786eb..844e30cda9671928c2041ff5a534100bdcab9d24 100644
--- a/bindings/rust/libgpiod/examples/get_line_value.rs
+++ b/bindings/rust/libgpiod/examples/get_line_value.rs
@@ -4,10 +4,10 @@
 // Minimal example of reading a single line.
 
 use libgpiod::{
+    Result,
     chip::Chip,
     line::{Config as LineConfig, Direction, Settings},
     request::Config as ReqConfig,
-    Result,
 };
 
 fn main() -> Result<()> {
diff --git a/bindings/rust/libgpiod/examples/get_multiple_line_values.rs b/bindings/rust/libgpiod/examples/get_multiple_line_values.rs
index a33a787fba4e94060c83a9c909b0f9c74517d7c1..39f0767cff9d62c73ef4f7f753c6de8fdfb45187 100644
--- a/bindings/rust/libgpiod/examples/get_multiple_line_values.rs
+++ b/bindings/rust/libgpiod/examples/get_multiple_line_values.rs
@@ -4,10 +4,10 @@
 // Minimal example of reading multiple lines.
 
 use libgpiod::{
+    Result,
     chip::Chip,
     line::{Config as LineConfig, Direction, Settings},
     request::Config as ReqConfig,
-    Result,
 };
 
 fn main() -> Result<()> {
diff --git a/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs b/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
index ded576529212de4aaea0c025f7d1d38c44baaa7c..b82f19bb407459fed651d06ffc3e5ee3e81da7e3 100644
--- a/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
+++ b/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
@@ -4,10 +4,10 @@
 // Example of a bi-directional line requested as input and then switched to output.
 
 use libgpiod::{
+    Result,
     chip::Chip,
     line::{Config as LineConfig, Direction, Settings, Value},
     request::Config as ReqConfig,
-    Result,
 };
 
 fn main() -> Result<()> {
diff --git a/bindings/rust/libgpiod/examples/toggle_line_value.rs b/bindings/rust/libgpiod/examples/toggle_line_value.rs
index 33b17d5a36364f4a0e9e93c0f68570f764fc31a4..f38a7083bec810da4a44f0f89049640cca7bbb2b 100644
--- a/bindings/rust/libgpiod/examples/toggle_line_value.rs
+++ b/bindings/rust/libgpiod/examples/toggle_line_value.rs
@@ -5,10 +5,10 @@
 
 use core::time::Duration;
 use libgpiod::{
+    Result,
     chip::Chip,
     line::{Config as LineConfig, Direction, Settings, Value},
     request::Config as ReqConfig,
-    Result,
 };
 use std::thread::sleep;
 
diff --git a/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs b/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
index 3572deb19734146c4727e05a5273b6ec52fa14e8..a69b3aa086c36b686be6304efaf8ded45a9bc71a 100644
--- a/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
+++ b/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
@@ -5,10 +5,10 @@
 
 use core::time::Duration;
 use libgpiod::{
+    Result,
     chip::Chip,
     line::{Config as LineConfig, Direction, Offset, Settings, Value},
     request::Config as ReqConfig,
-    Result,
 };
 use std::thread::sleep;
 
diff --git a/bindings/rust/libgpiod/examples/watch_line_info.rs b/bindings/rust/libgpiod/examples/watch_line_info.rs
index d724b6749fed19504ad13d8c3eb20aa351d00148..804ae681f4510794ed0930314a004ec19c7c7f18 100644
--- a/bindings/rust/libgpiod/examples/watch_line_info.rs
+++ b/bindings/rust/libgpiod/examples/watch_line_info.rs
@@ -3,7 +3,7 @@
 //
 // Minimal example of watching for info changes on particular lines.
 
-use libgpiod::{chip::Chip, line::InfoChangeKind, Result};
+use libgpiod::{Result, chip::Chip, line::InfoChangeKind};
 
 fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
diff --git a/bindings/rust/libgpiod/examples/watch_line_rising.rs b/bindings/rust/libgpiod/examples/watch_line_rising.rs
index 77434ae89d3ca76e1686d6debddd88141a3dda08..b0260a4af4602f7deab5c27a5c7480f2ebbb7caa 100644
--- a/bindings/rust/libgpiod/examples/watch_line_rising.rs
+++ b/bindings/rust/libgpiod/examples/watch_line_rising.rs
@@ -4,10 +4,10 @@
 // Minimal example of watching for edges on a single line.
 
 use libgpiod::{
+    Result,
     chip::Chip,
     line::{Config as LineConfig, Edge, EdgeKind, Settings},
     request::{Buffer, Config as ReqConfig},
-    Result,
 };
 
 fn main() -> Result<()> {
diff --git a/bindings/rust/libgpiod/examples/watch_line_value.rs b/bindings/rust/libgpiod/examples/watch_line_value.rs
index 3d5bc86724e316077bfb24b8fbf4f2365bb429ab..f7469ddb3d5da1d24ecc76d19e48895737a5c691 100644
--- a/bindings/rust/libgpiod/examples/watch_line_value.rs
+++ b/bindings/rust/libgpiod/examples/watch_line_value.rs
@@ -4,10 +4,10 @@
 // Minimal example of watching for edges on a single line.
 
 use libgpiod::{
+    Result,
     chip::Chip,
     line::{Bias, Config as LineConfig, Edge, EdgeKind, Settings},
     request::{Buffer, Config as ReqConfig},
-    Result,
 };
 use std::time::Duration;
 
diff --git a/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs b/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs
index 10079ac8cc0da733adeadefd101455c046eaa7fd..c9d65e612ae1206f419f1d350cf30b0e93190987 100644
--- a/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs
+++ b/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs
@@ -4,10 +4,10 @@
 // Minimal example of watching for edges on multiple lines.
 
 use libgpiod::{
+    Result,
     chip::Chip,
     line::{Config as LineConfig, Edge, EdgeKind, Settings},
     request::{Buffer, Config as ReqConfig},
-    Result,
 };
 
 fn main() -> Result<()> {
diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
index df1cef3bdef5d2014e951437c9fe89c119bff48c..1e98cb28efe97d7cd97363a62cd5b2b346cf381a 100644
--- a/bindings/rust/libgpiod/src/chip.rs
+++ b/bindings/rust/libgpiod/src/chip.rs
@@ -16,9 +16,9 @@ use std::str;
 use std::time::Duration;
 
 use super::{
-    gpiod,
+    Error, OperationType, Result, gpiod,
     line::{self, Offset},
-    request, Error, OperationType, Result,
+    request,
 };
 
 /// GPIO chip
diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
index 7f8f3773ef4005ac41b5aa2504340069f3adad5d..45caf9ead0afa72dc0d5ea2f4facabb15b4bef2a 100644
--- a/bindings/rust/libgpiod/src/edge_event.rs
+++ b/bindings/rust/libgpiod/src/edge_event.rs
@@ -5,9 +5,8 @@
 use std::time::Duration;
 
 use super::{
-    gpiod,
+    Error, OperationType, Result, gpiod,
     line::{EdgeKind, Offset},
-    Error, OperationType, Result,
 };
 
 /// Line edge events handling
diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index 059de1adabb858ba211446b27312c60429c6cc07..4f8ae63907b5886abd5ab581f677f7ad4cc2ce96 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -5,9 +5,8 @@
 use std::ptr;
 
 use super::{
-    gpiod,
+    Error, OperationType, Result, gpiod,
     request::{Event, Request},
-    Error, OperationType, Result,
 };
 
 /// Line edge events
diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
index f23701ab43ce5c215bb5260cd608d8e46b927079..4338680e83a7f4065099190408d0b503bfad9575 100644
--- a/bindings/rust/libgpiod/src/info_event.rs
+++ b/bindings/rust/libgpiod/src/info_event.rs
@@ -5,9 +5,8 @@
 use std::time::Duration;
 
 use super::{
-    gpiod,
+    Error, OperationType, Result, gpiod,
     line::{self, InfoChangeKind},
-    Error, OperationType, Result,
 };
 
 /// Line status watch events
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index 76a2c1b76f3cf365866797742011b780ee5795d8..aacc82e79dc77f9563d90adaf5fcffeb86ce690b 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -192,7 +192,7 @@ pub mod line {
                     return Err(Error::OperationFailed(
                         OperationType::LineRequestGetVal,
                         errno::errno(),
-                    ))
+                    ));
                 }
                 _ => return Err(Error::InvalidEnumValue("Value", val)),
             })
diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index 5850b9da3cba0d75f475246592796c2c52570e8e..e78b77b4df2aa932a9e976db3529e71fd0ef2137 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -3,9 +3,8 @@
 // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
 use super::{
-    gpiod,
+    Error, OperationType, Result, gpiod,
     line::{Offset, Settings, SettingsMap, Value},
-    Error, OperationType, Result,
 };
 
 /// Line configuration objects.
diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
index 8def1ab4e52962fffa6911976e64204c3d02df6f..fc7f47dce103e5728fab90079d02cb3004882634 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -8,9 +8,8 @@ use std::time::Duration;
 use std::{ffi::CStr, marker::PhantomData};
 
 use super::{
-    gpiod,
+    Error, Result, gpiod,
     line::{Bias, Direction, Drive, Edge, EventClock, Offset},
-    Error, Result,
 };
 
 /// Line info reference
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index 48d8d1a3a6fb5110ef295971cf44bcc70ff68c58..723a2903cdcef91edee30d54a41745d6c65f4097 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -8,9 +8,9 @@ use std::os::unix::prelude::AsRawFd;
 use std::time::Duration;
 
 use super::{
-    gpiod,
+    Error, OperationType, Result, gpiod,
     line::{self, Offset, Value, ValueMap},
-    request, Error, OperationType, Result,
+    request,
 };
 
 /// Line request operations
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index 9ab8ea7173c4f214e6d513434435a144424ecc74..ce2aa564b3fdd8b1533290ba001e60311a9fe9d2 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -5,9 +5,8 @@
 use std::time::Duration;
 
 use super::{
-    gpiod,
+    Error, OperationType, Result, gpiod,
     line::{Bias, Direction, Drive, Edge, EventClock, SettingKind, SettingVal, Value},
-    Error, OperationType, Result,
 };
 
 /// Line settings objects.
diff --git a/bindings/rust/libgpiod/src/request_config.rs b/bindings/rust/libgpiod/src/request_config.rs
index 9b66cc9d25e3a291e913476721b8e0bbad1edd2f..1419bdeaa09247871890a84f681673234cfb0957 100644
--- a/bindings/rust/libgpiod/src/request_config.rs
+++ b/bindings/rust/libgpiod/src/request_config.rs
@@ -6,7 +6,7 @@ use std::ffi::{CStr, CString};
 use std::os::raw::c_char;
 use std::str;
 
-use super::{gpiod, Error, OperationType, Result};
+use super::{Error, OperationType, Result, gpiod};
 
 /// Request configuration objects
 ///
diff --git a/bindings/rust/libgpiod/tests/chip.rs b/bindings/rust/libgpiod/tests/chip.rs
index 60b4ecc431fce15f69e20fbad1ed40df7280f172..1fbe2b7089dc0ce90eb259aff9a0771b0718fb67 100644
--- a/bindings/rust/libgpiod/tests/chip.rs
+++ b/bindings/rust/libgpiod/tests/chip.rs
@@ -9,7 +9,7 @@ mod chip {
     use std::path::PathBuf;
 
     use gpiosim_sys::Sim;
-    use libgpiod::{chip::Chip, Error as ChipError, OperationType};
+    use libgpiod::{Error as ChipError, OperationType, chip::Chip};
 
     mod open {
         use super::*;
diff --git a/bindings/rust/libgpiod/tests/common/config.rs b/bindings/rust/libgpiod/tests/common/config.rs
index 7bb1f659a92831ba3585f4e06b8fe6031d2243dc..d876df7f91ca0b86a03dda10bead7f9285043c10 100644
--- a/bindings/rust/libgpiod/tests/common/config.rs
+++ b/bindings/rust/libgpiod/tests/common/config.rs
@@ -7,9 +7,10 @@ use std::time::Duration;
 
 use gpiosim_sys::{Pull, Sim, Value as SimValue};
 use libgpiod::{
+    Result,
     chip::Chip,
     line::{self, Bias, Direction, Drive, Edge, EventClock, Offset, SettingVal, Value},
-    request, Result,
+    request,
 };
 
 pub(crate) struct TestConfig {
diff --git a/bindings/rust/libgpiod/tests/edge_event.rs b/bindings/rust/libgpiod/tests/edge_event.rs
index 03b7e7cb05f7564170a27ba1cef0cb3892e6945f..a592f1db94bd6f3f7d06003c4cd9b7878c5a3b33 100644
--- a/bindings/rust/libgpiod/tests/edge_event.rs
+++ b/bindings/rust/libgpiod/tests/edge_event.rs
@@ -87,10 +87,12 @@ mod edge_event {
             trigger_falling_and_rising_edge(config.sim(), GPIO);
 
             // Rising event
-            assert!(config
-                .request()
-                .wait_edge_events(Some(Duration::from_secs(1)))
-                .unwrap());
+            assert!(
+                config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_secs(1)))
+                    .unwrap()
+            );
 
             let mut events = config.request().read_edge_events(&mut buf).unwrap();
             assert_eq!(events.len(), 1);
@@ -101,10 +103,12 @@ mod edge_event {
             assert_eq!(event.line_offset(), GPIO);
 
             // Falling event
-            assert!(config
-                .request()
-                .wait_edge_events(Some(Duration::from_secs(1)))
-                .unwrap());
+            assert!(
+                config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_secs(1)))
+                    .unwrap()
+            );
 
             let mut events = config.request().read_edge_events(&mut buf).unwrap();
             assert_eq!(events.len(), 1);
@@ -115,10 +119,12 @@ mod edge_event {
             assert_eq!(event.line_offset(), GPIO);
 
             // No events available
-            assert!(!config
-                .request()
-                .wait_edge_events(Some(Duration::from_millis(100)))
-                .unwrap());
+            assert!(
+                !config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_millis(100)))
+                    .unwrap()
+            );
 
             assert!(ts_falling > ts_rising);
         }
@@ -136,10 +142,12 @@ mod edge_event {
             trigger_falling_and_rising_edge(config.sim(), GPIO);
 
             // Rising event
-            assert!(config
-                .request()
-                .wait_edge_events(Some(Duration::from_secs(1)))
-                .unwrap());
+            assert!(
+                config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_secs(1)))
+                    .unwrap()
+            );
 
             let mut events = config.request().read_edge_events(&mut buf).unwrap();
             assert_eq!(events.len(), 1);
@@ -149,10 +157,12 @@ mod edge_event {
             assert_eq!(event.line_offset(), GPIO);
 
             // No events available
-            assert!(!config
-                .request()
-                .wait_edge_events(Some(Duration::from_millis(100)))
-                .unwrap());
+            assert!(
+                !config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_millis(100)))
+                    .unwrap()
+            );
         }
 
         #[test]
@@ -168,10 +178,12 @@ mod edge_event {
             trigger_falling_and_rising_edge(config.sim(), GPIO);
 
             // Falling event
-            assert!(config
-                .request()
-                .wait_edge_events(Some(Duration::from_secs(1)))
-                .unwrap());
+            assert!(
+                config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_secs(1)))
+                    .unwrap()
+            );
 
             let mut events = config.request().read_edge_events(&mut buf).unwrap();
             assert_eq!(events.len(), 1);
@@ -181,10 +193,12 @@ mod edge_event {
             assert_eq!(event.line_offset(), GPIO);
 
             // No events available
-            assert!(!config
-                .request()
-                .wait_edge_events(Some(Duration::from_millis(100)))
-                .unwrap());
+            assert!(
+                !config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_millis(100)))
+                    .unwrap()
+            );
         }
 
         #[test]
@@ -200,10 +214,12 @@ mod edge_event {
 
             // Rising event GPIO 0
             let mut buf = request::Buffer::new(0).unwrap();
-            assert!(config
-                .request()
-                .wait_edge_events(Some(Duration::from_secs(1)))
-                .unwrap());
+            assert!(
+                config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_secs(1)))
+                    .unwrap()
+            );
 
             let mut events = config.request().read_edge_events(&mut buf).unwrap();
             assert_eq!(events.len(), 1);
@@ -215,10 +231,12 @@ mod edge_event {
             assert_eq!(event.line_seqno(), 1);
 
             // Rising event GPIO 1
-            assert!(config
-                .request()
-                .wait_edge_events(Some(Duration::from_secs(1)))
-                .unwrap());
+            assert!(
+                config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_secs(1)))
+                    .unwrap()
+            );
 
             let mut events = config.request().read_edge_events(&mut buf).unwrap();
             assert_eq!(events.len(), 1);
@@ -230,10 +248,12 @@ mod edge_event {
             assert_eq!(event.line_seqno(), 1);
 
             // No events available
-            assert!(!config
-                .request()
-                .wait_edge_events(Some(Duration::from_millis(100)))
-                .unwrap());
+            assert!(
+                !config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_millis(100)))
+                    .unwrap()
+            );
         }
 
         #[test]
@@ -249,10 +269,12 @@ mod edge_event {
             trigger_multiple_events(config.sim(), GPIO);
 
             // Read multiple events
-            assert!(config
-                .request()
-                .wait_edge_events(Some(Duration::from_secs(1)))
-                .unwrap());
+            assert!(
+                config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_secs(1)))
+                    .unwrap()
+            );
 
             let events = config.request().read_edge_events(&mut buf).unwrap();
             assert_eq!(events.len(), 3);
@@ -285,10 +307,12 @@ mod edge_event {
             trigger_multiple_events(config.sim(), GPIO);
 
             // Read multiple events
-            assert!(config
-                .request()
-                .wait_edge_events(Some(Duration::from_secs(1)))
-                .unwrap());
+            assert!(
+                config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_secs(1)))
+                    .unwrap()
+            );
 
             let events = config.request().read_edge_events(&mut buf).unwrap();
             assert_eq!(events.len(), 2);
diff --git a/bindings/rust/libgpiod/tests/info_event.rs b/bindings/rust/libgpiod/tests/info_event.rs
index c969af78238374110bfdb5536b4cab771d977c15..83e465b3a3ce0f256f90fd60d6ecf225e462c208 100644
--- a/bindings/rust/libgpiod/tests/info_event.rs
+++ b/bindings/rust/libgpiod/tests/info_event.rs
@@ -8,8 +8,8 @@ mod info_event {
     use libc::EINVAL;
     use std::{
         sync::{
-            mpsc::{self, Receiver, Sender},
             Arc, Mutex,
+            mpsc::{self, Receiver, Sender},
         },
         thread,
         time::Duration,
@@ -17,9 +17,10 @@ mod info_event {
 
     use gpiosim_sys::Sim;
     use libgpiod::{
+        Error as ChipError, OperationType,
         chip::Chip,
         line::{self, Direction, InfoChangeKind, Offset},
-        request, Error as ChipError, OperationType,
+        request,
     };
 
     fn request_reconfigure_line(chip: Arc<Mutex<Chip>>, tx: Sender<()>, rx: Receiver<()>) {
@@ -75,9 +76,11 @@ mod info_event {
             assert_eq!(info.offset(), GPIO);
 
             // No events available
-            assert!(!chip
-                .wait_info_event(Some(Duration::from_millis(100)))
-                .unwrap());
+            assert!(
+                !chip
+                    .wait_info_event(Some(Duration::from_millis(100)))
+                    .unwrap()
+            );
         }
 
         #[test]
@@ -99,11 +102,12 @@ mod info_event {
             rx_main.recv().expect("Could not receive from channel");
 
             // Line requested event
-            assert!(chip
-                .lock()
-                .unwrap()
-                .wait_info_event(Some(Duration::from_secs(1)))
-                .unwrap());
+            assert!(
+                chip.lock()
+                    .unwrap()
+                    .wait_info_event(Some(Duration::from_secs(1)))
+                    .unwrap()
+            );
             let event = chip.lock().unwrap().read_info_event().unwrap();
             let ts_req = event.timestamp();
 
@@ -120,11 +124,12 @@ mod info_event {
             rx_main.recv().expect("Could not receive from channel");
 
             // Line changed event
-            assert!(chip
-                .lock()
-                .unwrap()
-                .wait_info_event(Some(Duration::from_secs(1)))
-                .unwrap());
+            assert!(
+                chip.lock()
+                    .unwrap()
+                    .wait_info_event(Some(Duration::from_secs(1)))
+                    .unwrap()
+            );
             let event = chip.lock().unwrap().read_info_event().unwrap();
             let ts_rec = event.timestamp();
 
@@ -141,22 +146,25 @@ mod info_event {
             tx_main.send(()).expect("Could not send signal on channel");
 
             // Line released event
-            assert!(chip
-                .lock()
-                .unwrap()
-                .wait_info_event(Some(Duration::from_secs(1)))
-                .unwrap());
+            assert!(
+                chip.lock()
+                    .unwrap()
+                    .wait_info_event(Some(Duration::from_secs(1)))
+                    .unwrap()
+            );
             let event = chip.lock().unwrap().read_info_event().unwrap();
             let ts_rel = event.timestamp();
 
             assert_eq!(event.event_type().unwrap(), InfoChangeKind::LineReleased);
 
             // No events available
-            assert!(!chip
-                .lock()
-                .unwrap()
-                .wait_info_event(Some(Duration::from_millis(100)))
-                .unwrap());
+            assert!(
+                !chip
+                    .lock()
+                    .unwrap()
+                    .wait_info_event(Some(Duration::from_millis(100)))
+                    .unwrap()
+            );
 
             // Check timestamps are really monotonic.
             assert!(ts_rel > ts_rec);
diff --git a/bindings/rust/libgpiod/tests/line_info.rs b/bindings/rust/libgpiod/tests/line_info.rs
index d02c9eaf576c5d7468ab90058c2cbe166cbdf641..85714eb7c65d0b319acca96c223d8d52b0f651e0 100644
--- a/bindings/rust/libgpiod/tests/line_info.rs
+++ b/bindings/rust/libgpiod/tests/line_info.rs
@@ -11,9 +11,9 @@ mod line_info {
     use crate::common::*;
     use gpiosim_sys::{Direction as SimDirection, Sim};
     use libgpiod::{
+        Error as ChipError, OperationType,
         chip::Chip,
         line::{Bias, Direction, Drive, Edge, EventClock},
-        Error as ChipError, OperationType,
     };
 
     const NGPIO: usize = 8;
diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
index 4ba0d18b0f635eeab4fba99a6bcf38db0bca9289..07b0987c6204b9b10ec71948438bc67b43ff97ee 100644
--- a/bindings/rust/libgpiod/tests/line_request.rs
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -11,10 +11,10 @@ mod line_request {
     use crate::common::*;
     use gpiosim_sys::{Pull, Value as SimValue};
     use libgpiod::{
+        Error as ChipError, OperationType,
         line::{
             self, Bias, Direction, Drive, Edge, EventClock, Offset, SettingVal, Value, ValueMap,
         },
-        Error as ChipError, OperationType,
     };
 
     const NGPIO: usize = 8;
@@ -246,10 +246,12 @@ mod line_request {
             config.request_lines().unwrap();
 
             // No events available
-            assert!(!config
-                .request()
-                .wait_edge_events(Some(Duration::from_millis(100)))
-                .unwrap());
+            assert!(
+                !config
+                    .request()
+                    .wait_edge_events(Some(Duration::from_millis(100)))
+                    .unwrap()
+            );
         }
     }
 
diff --git a/bindings/rust/libgpiod/tests/request_config.rs b/bindings/rust/libgpiod/tests/request_config.rs
index a925a6833105c85fc6016253ae449a4fe2e8da06..5eba3e179f5a73c3122a7d04b790cca0164a45cb 100644
--- a/bindings/rust/libgpiod/tests/request_config.rs
+++ b/bindings/rust/libgpiod/tests/request_config.rs
@@ -5,7 +5,7 @@
 mod common;
 
 mod request_config {
-    use libgpiod::{request, Error as ChipError, OperationType};
+    use libgpiod::{Error as ChipError, OperationType, request};
 
     mod verify {
         use super::*;

-- 
2.48.1


