Return-Path: <linux-gpio+bounces-23668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F203EB0ECF3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BA467B2585
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 08:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187B2271443;
	Wed, 23 Jul 2025 08:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TiYDema2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F6279DBA
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 08:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753258616; cv=none; b=ERnv/P+dxgPdARIBHlEx/Y/EKsk+78BR3vqrkmEO2V3s3ERDZx3AVmBxbzMiT774Z3r4Q6KStAyY3mBsrN9zBxcpccanGAd0o0V6VHg2L7cC2gx81UUtudFP1ePlTXf0HnsWd/luxHxtGbuo2KCsqZI3X/YDVvNPqdJzRkbzt24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753258616; c=relaxed/simple;
	bh=mH/EnvnA1aoLQhogD6G1V9m6cZKMZK5er2ezTBDjplo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Whyz4akVqMorGygdZa8oEOGR9lJYpfg9dugElcVg93YM4dJPUejdcHiwcA+3OdpVunYShuf2XHOxH7LSclKYN55mRSIZJIout2B4A/SdYZMqsl8A9iD8NuQnt6J6aQg7yEQzXaLknmsY20jbmgnaeImp2r+Kg/fdkGw1EpBCig0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TiYDema2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45629703011so44111055e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 01:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753258613; x=1753863413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4PAUT6PnWohjiWk9u4qzgMXiyThN8XkSHY7uGWzZCI=;
        b=TiYDema2Doy4yh4IBIxVb5PsM7Bhdgy2Jo7BAwzmpHrC6P4yxfeA7x/hQ0X5w5EnLL
         ziIPHC5+oNZFpAlqipY1bBRegFIUz9x9qkqZjAlMRVUb1djM/fAUEKW80Kd+3jGMnMxp
         f1MnsXfEGZII8renfqpeBRcUflpqH1ab/5rpFTvD91qFqtIaD9fGsyQ4+MU+TBepM26S
         LCvvlhYzIizvRCpnlHTsoxJrwa+Oy4czqvmJhR2By0aiCc3tCUcQ0ZA7DJMy0Qti5lKK
         Tq+r9noKZf2bLcyNMTAs1QtBY4qnynAmg5miZoiPqXL5vUDlyl74qwBoHNh5Pl+MV9tG
         8hgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753258613; x=1753863413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4PAUT6PnWohjiWk9u4qzgMXiyThN8XkSHY7uGWzZCI=;
        b=Mgle7OEO/kN3vUGsMsmtHmt8woZUa2QqxhZ53660xFA2nTm0WI8C+nj50IlDOdnync
         5v5TDn/X3+aKcFeFDISeiSzFc1gkolWCsduYEW3D+Ga2NYcaiiCFx6K6YDgXPiPdjc2j
         8UH/opSfx3GkhWsrYHytaB2HEs2h2N5MrQzMu7p5twxRUVM9fMdyA7mEg1G488V36I6T
         3Mc2VrgcjBScxNu3IXSFn6h1zGJ2R+MZdyJ5WB1wsA1KiKGBICVBQCPljFTuTivnqrcf
         V3Onx2r2dO8apkZDOhT58dFYg4EclSsyYX2PLk2BSlR0lKVOitbiCPXN73cIDoQs+duD
         IWDQ==
X-Gm-Message-State: AOJu0YwMADheIsfCCm/7qJsJYeYLBNVrB948zclGl76KVtKx4hQlaNTP
	RJXyoqDVhc9gXIyw/69GKaj+NrNG+v4i5ZGv0hi9teA6OTZvHc3Y6aeA+Xjzli85fm8=
X-Gm-Gg: ASbGncsszWXSN94BohwYEFEp9ScSPOg+cTPEf431OVTv8XmhzCK99SA1WCeue2eS3ya
	Es0VRUpXqYfGNRfSsxRYqTXvXphH+pTuFm2MSL4cFRNVDWJRKh18D+Xl0SJnX0iV6z2v/aRBVHj
	960Oap+0VupKiBddDvRzW0US/7BaS1YcoA1Ng5xViPVIYRTu66fYsXGRYvg439DLNcFzZB+yUfc
	8yfjeVHWFun5irpCJDe8EYVjEzpTZkjRJ8++r3Bi92YcZWWVOqECqVUpZulUdba79SjpuO5n3R0
	GgHUl2lf8XNor39rdsGbJzLFEDt0qmWrf/YhLnKi6Vi4oGHUX4Brrcoil4HrWOgAUrLGnor6XQ6
	XEyUQ08RBdWJHZX8=
X-Google-Smtp-Source: AGHT+IFUTSgc3r1Maifl6g8ixnvJN8Z0lGFbMEh0Jxb7+jlsOZAQNOfcKdwLdvh61DXz1PpmFmiamQ==
X-Received: by 2002:a05:600c:358f:b0:456:2347:3f01 with SMTP id 5b1f17b1804b1-45868d4efb1mr14285155e9.20.1753258612552;
        Wed, 23 Jul 2025 01:16:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34cd:b1d:d4f9:be03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586919708asm15096495e9.13.2025.07.23.01.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 01:16:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Jul 2025 10:16:48 +0200
Subject: [PATCH libgpiod 2/2] bindings: rust: unify imports in examples
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-rust-examples-imports-v1-2-4c87e07a9b79@linaro.org>
References: <20250723-rust-examples-imports-v1-0-4c87e07a9b79@linaro.org>
In-Reply-To: <20250723-rust-examples-imports-v1-0-4c87e07a9b79@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16230;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TjzENWGYyjjJ2sPy/UfOe0ZSo/btiu8EkEnOK7rvqUI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogJpy/D4dzHKbBH2/KO7kANUU+uTo5wwLzJqtY
 HVeK1OOV1SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaICacgAKCRARpy6gFHHX
 ctbvEACAgTuPI0qpvymYNnzDstuCw3VgPKHpdEFkiqQSuMAT6IT9+PNx8i9+AWBRBHYRz8LVDtO
 loRNVmm/+NOTA9ofgAANxlKzej/ulxIPnfS7StSGqr/gMOwSECtsHyQkPdKY18/wYFBRvBcpiPT
 z/LP+qGGEWuOUB0uzCIhRowvqqphoc+c6VHN3G6zMnU0HOhmBVb8kJmCBSKOvIKPfHaeBl83xyX
 czryWahpgUVlJBQhlbtDZ9c9ZPToAmKIJAmx9hqDnUxPMa2lbQivr4/CG6lkTSYi++IXNdvBhK9
 LPKrhSdVewxQNbums3OLdHriDJJGpp+ea5deAn/zW22fWSmRime/PvcP4Rlq9y/bINMOHJU1v1y
 Xld8f5ZGLrgV2AJtXHP+v6g7o/Mq0HYLs0XS3WkX0W0m0FAh6IMJ86tPuIGxiRJFCYKAlMqI0dc
 As39bFCbSb7oS2n1okt2dQeY2fHFNfWZ78vuw7a76o3HLgoYJ1uqPDkdJ80gfyrMOubKWxYZvoY
 cOUgWMfAEHfalJdqtzMLudF6Y9VIWMYkCRXjsGm9Cu7smXjijTxZEeO4RqEhkeEZCOpVo3NmzeJ
 FmcZr9uNgNCxxpc/kkeosuIxQzGm8apnmJ1ltpMSIYzuGxmHgwiIQkU6iLSPiQQF6/+kVwuOvgL
 LPS89L+pYw6HyZg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some example source files avoid imports at the top of the file in favor
of overusing the namespaces in the code itself. The ones that do import
modules either group the imports or have a separate "use" in each line.
Let's unify the imports in example and use the brief approach of
grouping the modules inside use statements.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../libgpiod/examples/buffered_event_lifetimes.rs  | 23 ++++++++++++--------
 .../rust/libgpiod/examples/find_line_by_name.rs    |  6 ++++--
 bindings/rust/libgpiod/examples/get_chip_info.rs   |  4 ++--
 bindings/rust/libgpiod/examples/get_line_info.rs   |  6 +++---
 bindings/rust/libgpiod/examples/get_line_value.rs  | 19 ++++++++++------
 .../libgpiod/examples/get_multiple_line_values.rs  | 17 +++++++++------
 .../examples/reconfigure_input_to_output.rs        | 25 +++++++++++++---------
 .../rust/libgpiod/examples/toggle_line_value.rs    |  7 ++++--
 .../examples/toggle_multiple_line_values.rs        |  7 ++++--
 bindings/rust/libgpiod/examples/watch_line_info.rs |  6 +++---
 .../rust/libgpiod/examples/watch_line_rising.rs    |  4 ++--
 .../rust/libgpiod/examples/watch_line_value.rs     |  4 ++--
 .../examples/watch_multiple_line_values.rs         |  4 ++--
 13 files changed, 80 insertions(+), 52 deletions(-)

diff --git a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
index 8dbb4963b638ff9f8592f76ac85c6e106f3ddfa9..7589e1f4187d364f28477c0d410b7e666608ac88 100644
--- a/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
+++ b/bindings/rust/libgpiod/examples/buffered_event_lifetimes.rs
@@ -5,26 +5,31 @@
 // An example demonstrating that an edge event must be cloned to outlive
 // subsequent writes to the containing event buffer.
 
-use libgpiod::line;
+use libgpiod::{
+    chip::Chip,
+    line::{Config as LineConfig, Edge, Settings},
+    request::{Buffer, Config as ReqConfig, Event},
+    Result,
+};
 
-fn main() -> libgpiod::Result<()> {
+fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offset = 5;
 
-    let mut lsettings = line::Settings::new()?;
-    lsettings.set_edge_detection(Some(line::Edge::Both))?;
+    let mut lsettings = Settings::new()?;
+    lsettings.set_edge_detection(Some(Edge::Both))?;
 
-    let mut lconfig = line::Config::new()?;
+    let mut lconfig = LineConfig::new()?;
     lconfig.add_line_settings(&[line_offset], lsettings)?;
 
-    let mut rconfig = libgpiod::request::Config::new()?;
+    let mut rconfig = ReqConfig::new()?;
     rconfig.set_consumer("buffered-event-lifetimes")?;
 
-    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let chip = Chip::open(&chip_path)?;
     let request = chip.request_lines(Some(&rconfig), &lconfig)?;
 
-    let mut buffer = libgpiod::request::Buffer::new(4)?;
+    let mut buffer = Buffer::new(4)?;
 
     loop {
         // Blocks until at least one event is available
@@ -34,7 +39,7 @@ fn main() -> libgpiod::Result<()> {
         let event = events.next().unwrap()?;
 
         // This will out live `event` and the next read_edge_events().
-        let cloned_event = libgpiod::request::Event::try_clone(event)?;
+        let cloned_event = Event::try_clone(event)?;
 
         let events = request.read_edge_events(&mut buffer)?;
         for event in events {
diff --git a/bindings/rust/libgpiod/examples/find_line_by_name.rs b/bindings/rust/libgpiod/examples/find_line_by_name.rs
index c563c45eac793d9547b729ed58712f61a9d8e338..3652b6419731b7e85d594906a1b5d41eed63fcb6 100644
--- a/bindings/rust/libgpiod/examples/find_line_by_name.rs
+++ b/bindings/rust/libgpiod/examples/find_line_by_name.rs
@@ -3,13 +3,15 @@
 //
 // Minimal example of finding a line with the given name.
 
-fn main() -> libgpiod::Result<()> {
+use libgpiod::{gpiochip_devices, Result};
+
+fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let line_name = "GPIO19";
 
     // Names are not guaranteed unique, so this finds the first line with
     // the given name.
-    for chip in libgpiod::gpiochip_devices(&"/dev")? {
+    for chip in gpiochip_devices(&"/dev")? {
         let offset = chip.line_offset_from_name(line_name);
 
         if offset.is_ok() {
diff --git a/bindings/rust/libgpiod/examples/get_chip_info.rs b/bindings/rust/libgpiod/examples/get_chip_info.rs
index cc23c86a3fd4a64e6fc995aba271ec8df41e2fef..1781d464f0e66471ac1beb038d566eb537fed402 100644
--- a/bindings/rust/libgpiod/examples/get_chip_info.rs
+++ b/bindings/rust/libgpiod/examples/get_chip_info.rs
@@ -3,13 +3,13 @@
 //
 // Minimal example of reading the info for a chip.
 
-use libgpiod::{self, Result};
+use libgpiod::{self, chip::Chip, Result};
 
 fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
 
-    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let chip = Chip::open(&chip_path)?;
     let info = chip.info()?;
     println!(
         "{} [{}] ({} lines)",
diff --git a/bindings/rust/libgpiod/examples/get_line_info.rs b/bindings/rust/libgpiod/examples/get_line_info.rs
index 9eb8d0fae7ad2d0f09c2721f010513e074f98e58..36c6fbea4c873be473bbbd7d6b91c6925084c9d8 100644
--- a/bindings/rust/libgpiod/examples/get_line_info.rs
+++ b/bindings/rust/libgpiod/examples/get_line_info.rs
@@ -3,14 +3,14 @@
 //
 // Minimal example of reading the info for a line.
 
-use libgpiod::line::Direction;
+use libgpiod::{chip::Chip, line::Direction, Result};
 
-fn main() -> libgpiod::Result<()> {
+fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offset = 3;
 
-    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let chip = Chip::open(&chip_path)?;
     let info = chip.line_info(line_offset)?;
 
     let name = info.name().unwrap_or("unnamed");
diff --git a/bindings/rust/libgpiod/examples/get_line_value.rs b/bindings/rust/libgpiod/examples/get_line_value.rs
index e1ef6c7896c3671667119a256d14e930a291d532..9986931af29a284131ce21fe11915285264786eb 100644
--- a/bindings/rust/libgpiod/examples/get_line_value.rs
+++ b/bindings/rust/libgpiod/examples/get_line_value.rs
@@ -3,23 +3,28 @@
 //
 // Minimal example of reading a single line.
 
-use libgpiod::line;
+use libgpiod::{
+    chip::Chip,
+    line::{Config as LineConfig, Direction, Settings},
+    request::Config as ReqConfig,
+    Result,
+};
 
-fn main() -> libgpiod::Result<()> {
+fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offset = 5;
 
-    let mut lsettings = line::Settings::new()?;
-    lsettings.set_direction(line::Direction::Input)?;
+    let mut lsettings = Settings::new()?;
+    lsettings.set_direction(Direction::Input)?;
 
-    let mut lconfig = line::Config::new()?;
+    let mut lconfig = LineConfig::new()?;
     lconfig.add_line_settings(&[line_offset], lsettings)?;
 
-    let mut rconfig = libgpiod::request::Config::new()?;
+    let mut rconfig = ReqConfig::new()?;
     rconfig.set_consumer("get-line-value")?;
 
-    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let chip = Chip::open(&chip_path)?;
     let request = chip.request_lines(Some(&rconfig), &lconfig)?;
 
     let value = request.value(line_offset)?;
diff --git a/bindings/rust/libgpiod/examples/get_multiple_line_values.rs b/bindings/rust/libgpiod/examples/get_multiple_line_values.rs
index b09f3be033246c61cda43bd0e947ba34bb421642..a33a787fba4e94060c83a9c909b0f9c74517d7c1 100644
--- a/bindings/rust/libgpiod/examples/get_multiple_line_values.rs
+++ b/bindings/rust/libgpiod/examples/get_multiple_line_values.rs
@@ -3,22 +3,27 @@
 //
 // Minimal example of reading multiple lines.
 
-use libgpiod::line::{self, Direction};
+use libgpiod::{
+    chip::Chip,
+    line::{Config as LineConfig, Direction, Settings},
+    request::Config as ReqConfig,
+    Result,
+};
 
-fn main() -> libgpiod::Result<()> {
+fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offsets = [5, 3, 7];
 
-    let mut lsettings = line::Settings::new()?;
-    let mut lconfig = line::Config::new()?;
+    let mut lsettings = Settings::new()?;
+    let mut lconfig = LineConfig::new()?;
 
     lsettings.set_direction(Direction::Input)?;
     lconfig.add_line_settings(&line_offsets, lsettings)?;
 
-    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let chip = Chip::open(&chip_path)?;
 
-    let mut rconfig = libgpiod::request::Config::new()?;
+    let mut rconfig = ReqConfig::new()?;
     rconfig.set_consumer("get-multiple-line-values")?;
 
     let request = chip.request_lines(Some(&rconfig), &lconfig)?;
diff --git a/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs b/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
index b872d7709f3ecc651cf6d372cb46d6fbdfed77b1..ded576529212de4aaea0c025f7d1d38c44baaa7c 100644
--- a/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
+++ b/bindings/rust/libgpiod/examples/reconfigure_input_to_output.rs
@@ -3,23 +3,28 @@
 //
 // Example of a bi-directional line requested as input and then switched to output.
 
-use libgpiod::line;
+use libgpiod::{
+    chip::Chip,
+    line::{Config as LineConfig, Direction, Settings, Value},
+    request::Config as ReqConfig,
+    Result,
+};
 
-fn main() -> libgpiod::Result<()> {
+fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offset = 5;
 
-    let mut lsettings = line::Settings::new()?;
-    lsettings.set_direction(line::Direction::Input)?;
+    let mut lsettings = Settings::new()?;
+    lsettings.set_direction(Direction::Input)?;
 
-    let mut lconfig = line::Config::new()?;
+    let mut lconfig = LineConfig::new()?;
     lconfig.add_line_settings(&[line_offset], lsettings)?;
 
-    let mut rconfig = libgpiod::request::Config::new()?;
+    let mut rconfig = ReqConfig::new()?;
     rconfig.set_consumer("reconfigure-input-to-output")?;
 
-    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let chip = Chip::open(&chip_path)?;
     // request the line initially as an input
     let mut request = chip.request_lines(Some(&rconfig), &lconfig)?;
 
@@ -28,9 +33,9 @@ fn main() -> libgpiod::Result<()> {
     println!("{line_offset}={value:?} (input)");
 
     // switch the line to an output and drive it low
-    let mut lsettings = line::Settings::new()?;
-    lsettings.set_direction(line::Direction::Output)?;
-    lsettings.set_output_value(line::Value::InActive)?;
+    let mut lsettings = Settings::new()?;
+    lsettings.set_direction(Direction::Output)?;
+    lsettings.set_output_value(Value::InActive)?;
     lconfig.add_line_settings(&[line_offset], lsettings)?;
     request.reconfigure_lines(&lconfig)?;
 
diff --git a/bindings/rust/libgpiod/examples/toggle_line_value.rs b/bindings/rust/libgpiod/examples/toggle_line_value.rs
index bf87222acc87f559af1467c59b1b98b299755759..8d34c5fa18746bc89fe6597f22a77c000a6b49c6 100644
--- a/bindings/rust/libgpiod/examples/toggle_line_value.rs
+++ b/bindings/rust/libgpiod/examples/toggle_line_value.rs
@@ -4,7 +4,10 @@
 // Minimal example of toggling a single line.
 
 use core::time::Duration;
-use libgpiod::line::{self, Value};
+use libgpiod::{
+    line::{self, Value},
+    Result,
+};
 
 fn toggle_value(value: Value) -> Value {
     match value {
@@ -13,7 +16,7 @@ fn toggle_value(value: Value) -> Value {
     }
 }
 
-fn main() -> libgpiod::Result<()> {
+fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offset = 5;
diff --git a/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs b/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
index b7e6915fa1813a7e9d237ff0d836b0d4bf5d52da..e15b09392ccbf38d99a1aa591c6022fab64f7ecf 100644
--- a/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
+++ b/bindings/rust/libgpiod/examples/toggle_multiple_line_values.rs
@@ -4,7 +4,10 @@
 // Minimal example of toggling multiple lines.
 
 use core::time::Duration;
-use libgpiod::line::{self, Offset, Value};
+use libgpiod::{
+    line::{self, Offset, Value},
+    Result,
+};
 
 fn toggle_value(value: Value) -> Value {
     match value {
@@ -26,7 +29,7 @@ fn print_values(offsets: &[Offset], values: &[Value]) {
     println!();
 }
 
-fn main() -> libgpiod::Result<()> {
+fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offsets = [5, 3, 7];
diff --git a/bindings/rust/libgpiod/examples/watch_line_info.rs b/bindings/rust/libgpiod/examples/watch_line_info.rs
index e84ce133fece5ae4c6d5f1f4be98384828bdafb5..d724b6749fed19504ad13d8c3eb20aa351d00148 100644
--- a/bindings/rust/libgpiod/examples/watch_line_info.rs
+++ b/bindings/rust/libgpiod/examples/watch_line_info.rs
@@ -3,14 +3,14 @@
 //
 // Minimal example of watching for info changes on particular lines.
 
-use libgpiod::line::InfoChangeKind;
+use libgpiod::{chip::Chip, line::InfoChangeKind, Result};
 
-fn main() -> libgpiod::Result<()> {
+fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offsets = [5, 3, 7];
 
-    let chip = libgpiod::chip::Chip::open(&chip_path)?;
+    let chip = Chip::open(&chip_path)?;
     for offset in line_offsets {
         let _info = chip.watch_line_info(offset)?;
     }
diff --git a/bindings/rust/libgpiod/examples/watch_line_rising.rs b/bindings/rust/libgpiod/examples/watch_line_rising.rs
index 81a24077e9d7acc7657ea13621e91effbddb12ab..00e65f0e9df3cf73613f71173bcc8c1f6beb5ae5 100644
--- a/bindings/rust/libgpiod/examples/watch_line_rising.rs
+++ b/bindings/rust/libgpiod/examples/watch_line_rising.rs
@@ -3,9 +3,9 @@
 //
 // Minimal example of watching for edges on a single line.
 
-use libgpiod::line;
+use libgpiod::{line, Result};
 
-fn main() -> libgpiod::Result<()> {
+fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offset = 5;
diff --git a/bindings/rust/libgpiod/examples/watch_line_value.rs b/bindings/rust/libgpiod/examples/watch_line_value.rs
index 3bf40af4ba3aa50cd59b4e05775c217da302e6c3..3df5a2bec2910a96d36da989b34624e2f669394c 100644
--- a/bindings/rust/libgpiod/examples/watch_line_value.rs
+++ b/bindings/rust/libgpiod/examples/watch_line_value.rs
@@ -3,10 +3,10 @@
 //
 // Minimal example of watching for edges on a single line.
 
-use libgpiod::line;
+use libgpiod::{line, Result};
 use std::time::Duration;
 
-fn main() -> libgpiod::Result<()> {
+fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offset = 5;
diff --git a/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs b/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs
index 3fc88baa484754fadb48a2afc4110805e8db639d..81d211784d4929eb925231d05199a61a24816d74 100644
--- a/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs
+++ b/bindings/rust/libgpiod/examples/watch_multiple_line_values.rs
@@ -5,10 +5,10 @@
 
 use libgpiod::{
     line::{self, EdgeKind},
-    request,
+    request, Result,
 };
 
-fn main() -> libgpiod::Result<()> {
+fn main() -> Result<()> {
     // Example configuration - customize to suit your situation
     let chip_path = "/dev/gpiochip0";
     let line_offsets = [5, 3, 7];

-- 
2.48.1


