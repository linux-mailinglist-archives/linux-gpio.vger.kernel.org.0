Return-Path: <linux-gpio+bounces-25142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E894B3A884
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD0E3169653
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 17:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F59933A032;
	Thu, 28 Aug 2025 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0gM96jA4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544F933CEA9
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756403002; cv=none; b=mq6jPeViXuEHQOjW4r+W9Vg/VsS+oQhte2Rse3QBgLiqvqhzWtYkqTCntOo/oozCLXu5b1m80v0xZVTPUiDxozY06P7ab0RUXbvQD7x4i0YkL8nlru11Dty3fcGKHe13LCZZMnh7qD65BBmSqQMCj6IWOlttOCSUvAuGl0akpgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756403002; c=relaxed/simple;
	bh=6gJei7szANMw/NdE6iIDacG06iwYw/3qwFXetsEvQ+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPxYSMD4dvXr13kvJC04TnY8gADBqlcjEzU9d4SPR7hj8fky5sAxIrk/bymkDsC9lD9/jHs7oK5mkwIbDtIhMjPbVr0yI4Yqmhym5yYqMuTWyfO9iXKlzKC6IKlShvDJJYoIJGFpRHh4wg7RpVMWv+1eXSdZ9my8IfQrm2nIsLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0gM96jA4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b5c12dd87so8653205e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756402999; x=1757007799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aql+jJr1VL+QjBgrFtqT3lZge/2ebcEO/EsMATxLWg8=;
        b=0gM96jA45rpnRrpOp3g4IBGl/hsjgfPbJz68V1x+WmpIxsFxuwHIAOQStsPKXjURop
         8a3J4j9qSR6rOarCo+KdLRNslBmVDWIhbnPF2YaST65CFwHxrrvinaPckeqtoiwJ0gBu
         Z0MNlfKPerWr9eeDdN3TWI80B4EgTz4xp0C6ogNSFV860DnL0hqCPt7dUVH52rymo6Wr
         GoL9IvOy8Udh1be6AF4Mb/Xa4vEuZHSK1sGK+rIyJVZP4C4Ala5xYqV1UWKcMb1l7t6M
         Ox944Y3ngenmEE+sEeWyXo7RtLrG/yR66QkLuOibC5RBxtobqXZG2dZ1MgQl5YIzjjhB
         ezxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756402999; x=1757007799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aql+jJr1VL+QjBgrFtqT3lZge/2ebcEO/EsMATxLWg8=;
        b=dsWXTW3t7yA+LAFYoRxEyNEcXnPZIdL3e2NRC258kwtSxT4R5xU2R+u5rn2xEcMGO3
         sXBBY7uSY4SDWBlHiEgzsnKAg6Gih1wJK6K3rNlX8iP5fIQGKaVQjcR+QBWYAfqMuAqX
         ARuDd8WTEq5wdLiPKuSXaXED18CSmCM5qqUvbBdL6lyU5BDTUc+uhH2k19IOmYP2hLtx
         wpeZ2+1rKYemqnbocfAqSEinCInY5MJ0L6b7mJwvmMwq+U7XVzrlFw9ZEI9y1z1e9MHx
         6W5/rF8IQ51wm+/jwr2sHVSAKPuZ1/T7MBFkTcb1hxBxUl1T8Fyg0qyGwaqxgyGzl9le
         ZKLw==
X-Gm-Message-State: AOJu0YwgIw9rt0icunFDNIwaoAVxumRWFgB7KtK2mKHSFuNsDQOcZefs
	aznvIb0SIoUgAxF6C30R9ForE2RY9k7ZlEeDexjQ6v9s3TvuOdjSrzdaTmRnwLmB/xo=
X-Gm-Gg: ASbGncsO8GWMo6CA6WcDuNc50mv6fb+NmD7qt2zpmAanL8kRzHBFB357ymnIZ9X44ET
	0WxEpBzZgxkIty62W78vOp5D9BQESNloNLzjM87SKZpypzBjdY4cw2jQuHmaFJHyIRmj6ve18VK
	2SrWWIqcrz6Z/1DFhVJJOW2TU71TtdWsgdCXgNaWp7jD8/XJVvj5ZeXN4J4G97D0D16IUNQxM5T
	beGSl4m5/G+drozB2Fvc1H06A9wvTpXZfrti+WhiRNeWvkFZiD+V/MNQpxYUHI1Kppe4kVfTrf/
	xF7YJTxJcyyJ61WJmRTbT66obtumJUiBSSFKxhJ1Fsz8I+Rfj9YduUGBV+90205tcKEhDCRILJg
	FGqwqSWiYI0US9Jjshw==
X-Google-Smtp-Source: AGHT+IFhwAluPKkmY09Z0ijfQ7H9b92rLDnVHH7QqQVUfOLhNYuzuG7mVk1cD2F7+5EwSBvOiGwuEg==
X-Received: by 2002:a05:6000:2c0c:b0:3ce:f09:afac with SMTP id ffacd0b85a97d-3ce0f09b49cmr2979886f8f.27.1756402998575;
        Thu, 28 Aug 2025 10:43:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm3812075e9.3.2025.08.28.10.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:43:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 19:43:09 +0200
Subject: [PATCH libgpiod v3 07/10] bindings: rust: update system-deps
 dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-rust-1-0-0-release-v3-7-0f9c6c1c4808@linaro.org>
References: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
In-Reply-To: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=W9jqUGtlLfU88H5SidpHANLFgnhMGljUwKjkNvp5ngc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosJUtmNvcTr4St0VlvyXqEm/YewqHnI/Qa0Auu
 e6iBqSI3RiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLCVLQAKCRARpy6gFHHX
 ch+ZD/9A1RdXldWk9nQRDWv/se0Rp3K3V9GFNMNvqb3LB3ALHvOLE3N8FVgAfmViP03++9U/byK
 txOaT0SY0oRyra11sPuYJReIkr5yzxf5S787dighaifdQCn+m/AEfK8g4acYtK7Sgkj38a35YGe
 HahO8jcPs0co4Ir+KBxEZt6odiCB0aRE4fZHvD26fdvMiaxPLd/mcBnyvMqNavH40KbXWUQitAt
 lzSGxV45/pMQuvVvawQKJ+NyrDXJFxuH3b2ywAeOqEdAg9Hkx7EWbjfS72kR8ORzgLVgOiMM2FS
 VXkcmm02RtVrCDVv98EW6ujAtekD0j0QyGwQLbJV6JK1Ueaics74x0bocxHmasEQmQC0LGybE+T
 aMfzEJ/zCyMAWP6nsK8zEbUd0SR07bxauL5hmMaVGEoHKV5CecOI38jQgOZWBtpekEmKtwNj4Xv
 mPXZlWazWgwlTS8ix/uquQp4hF3Ea6DImWrm48ez+4j/bQi9CGNc1thtosGwnQM+VpnnZJKX/y9
 2yHadUSNz8NWkElK5F91Un/RJCUwznbpGZapJxhoe0pav1KsU76zSnepP1FQqyrZK7DBB9+/QZ3
 KG4oYPYPwf8vrizsUuXI9WJpCGi97VUqX3UJW7ODETl30iL72sTa3yDgwJDKU8ohjCVr++8jYhS
 6sTc7Fng+0pXR4A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the system-deps dependency for libgpiod-sys to the most recent major
version. The way we iterate over libs has changed, we now need to convert
it explicitly to an iterable. No longer require a specific minor
version.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod-sys/build.rs   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index d5901b96721255c4ebefaef6b18a6bd9847d3b4e..db2616f74c2d116878abca6b5391647f6b6fd2d4 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -25,7 +25,7 @@ v2_1 = []
 
 [build-dependencies]
 bindgen = "0.72"
-system-deps = "2.0"
+system-deps = "7"
 
 [package.metadata.system-deps.libgpiod]
 name = "libgpiod"
diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
index ab5b11308c92579a5b16883d47ec5a616c2db78c..14fd0b011bd6077b0c9be1905b8faaa1a5a39e0d 100644
--- a/bindings/rust/libgpiod-sys/build.rs
+++ b/bindings/rust/libgpiod-sys/build.rs
@@ -27,8 +27,8 @@ fn main() {
         .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()));
 
     // Inform bindgen about the include paths identified by system_deps.
-    for (_name, lib) in libs {
-        for include_path in lib.include_paths {
+    for (_name, lib) in libs.iter() {
+        for include_path in &lib.include_paths {
             builder = builder.clang_arg("-I").clang_arg(
                 include_path
                     .to_str()

-- 
2.48.1


