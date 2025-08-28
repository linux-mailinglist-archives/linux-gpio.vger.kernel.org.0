Return-Path: <linux-gpio+bounces-25144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8C9B3A88A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD9177B3458
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 17:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FC333EAE5;
	Thu, 28 Aug 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZLC8xQIV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F8533CEBA
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756403005; cv=none; b=YaXZJzEIk8hHXGAK2L1gXQ03xdadwRmhWxwNBJpZQ1W7BHt7SZsPTVwwJNhSwcFmI+iSRDdDiwzkttIjJe/lUtEtwJhvs1Vj2JG633EP87UWQFkwAt9KlNxT+ccc1QsmbB0SjK2Gfkqb/HJjE9S/Eg9rM2udsgvE9a2v76sdGl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756403005; c=relaxed/simple;
	bh=xLJmj83MC6UPUg4m4YodpEutivOl3wvpNHrUIDM0wA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oIhDxYSnG7WhU4AmYtQL8q+8f5MVXnIQsIQlXCrX0WXcQ+Tn1rOXOUIrors2ETCeQpddVI4FjWMbwtzoOeW0OPduVD3JW/8NfpMf1n1ETAn7xsQu6vDJ7n/bA4++rWz/f4n4kJUOekpeuvfME+54YzjcYpOGWBdAcvZy/PW9LpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZLC8xQIV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b77f59bd8so5753315e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756403002; x=1757007802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EM4U/8tHAGd7Ebl7ojLHr/FTfIe7ZFdliR6MjeWLa0c=;
        b=ZLC8xQIVu2vvo8yzaLDsK8zd7h4Xi3WPyClUw1eNokJRM8N03fkUeZhb6trytoaL1l
         0jZyPe0sjXEgXC0vdh20CPh1fn4VZkmsvGfYchJAhq/Z7qPcVQC5mt3R4PGcOLxUw15L
         QmGDhR7e6QsvYp3sh+E9GpVmE/9lk3c1afl4FFLA8ephlwTQK5aajphGN2wjs/AXIIMw
         Pbto4zm58ePcimZnL4XofM3+cu+we67TSjQlaY8tGjYwMHXo1cLIIGgF/t5Qum+/CzRw
         d+z7RQuryquG1sxq9sKk5d2JhhS4reAPcDTnMLztw29iZjMCepetQRLlp1Tb7DAQPfzs
         320g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756403002; x=1757007802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EM4U/8tHAGd7Ebl7ojLHr/FTfIe7ZFdliR6MjeWLa0c=;
        b=vbHxKrRiHvxHjKEcfaoYgyEcheTWGI54TJDMPMNV5zXmqhlVkG5Wn4HznWscEn/WVD
         G26cSKrxeuTfVUZX91YDmSeXiM0IlgMr2p8DGzwXS8sPrDZXT1omC75cm2BzxPEUZMhn
         R/bBI9jaDfyXYHT8P4Ip+QuhbuHnP6Zi4jNgWGU3yWH7ugocnG/VFUH3jkbOPdRUUPyD
         e+Av15FWwiulAUIOTo/WHhzuPSjNEt7IsvGzilWCWNmEVpsy1cj/qk/6UjGcQRT+uOJ2
         XiIrfH+MTiLlfCLOlu8f0yA1odkgjvYjK7edk6K2p8SpX4046F2g2bqJI3FAbGd2I0aZ
         LfzA==
X-Gm-Message-State: AOJu0YzqH7gVP4ApJICI2s91CUD7BJLKO5F1aw5q2tXhBJICPzndqsNv
	NuMAv1Op9NUFk3/A7s0TUJcZlUWPqoC+tZ62f57A7Jhl7UIzmK7bHc8Sx0tNfzUoRgHItaftxZ1
	cGyNi9WI=
X-Gm-Gg: ASbGnctUH/5gb4BGaw35uBCvSKtMmuPO3AJgJ08Qac6Dz65CsbD4a7tNQZ+WC1yfIyR
	xDB/ThMlXgSaIR4X5/fuLH64awIMUwRGI8fI8HXiSvzRQ0g/QBuCJPN/OcPtzzik3p2ieqk7SGU
	pj87X6Q6nWr+B9Sk3mgVVi7C3Ql68NnRnqkw2tim4YoBQpiWZGAOu/TS8sE/EKpiseyIkeaTE+Y
	VNXb3AhXigmebhFXIflRvbZ8ik3U8661cgDyw3k+IWiB82Ja9fwmEdkizgKdqS/PCDwf9ZAW9Rb
	4SJWMjZ4mhWgmlW7PPk54RByN6OtkZ6SDWDv2cuExV/aRspJTTP5uLyGq2TTXbzkxYU8Xbl2aLl
	wZfvTER1pxIECzVHvGtcs8zbN1R2T
X-Google-Smtp-Source: AGHT+IF2JvFZj+qwLphaims1sk/ASbsLa2kueHJBwMmNxxt7qZdcxkP8u5Fzv7C8KZ7vn0DwIyUDVg==
X-Received: by 2002:a05:6000:4022:b0:3c6:c737:d39f with SMTP id ffacd0b85a97d-3cbb15c9d73mr8391918f8f.3.1756403001800;
        Thu, 28 Aug 2025 10:43:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm3812075e9.3.2025.08.28.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:43:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 19:43:12 +0200
Subject: [PATCH libgpiod v3 10/10] bindings: rust: update crate versions to
 v1.0.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-rust-1-0-0-release-v3-10-0f9c6c1c4808@linaro.org>
References: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
In-Reply-To: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=n4OdIt7JFr4mM5s3kVwkWuF2Nq/JQhGkT0rF9f6uJ8U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosJUuXrWv6uTU/4zbxH+uAim7DVE1+xgd4+EXo
 WRCgebDyvGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLCVLgAKCRARpy6gFHHX
 cklSEADDuYe5TqKOasEzBNFTGeAn1Ak4t6wHWe1tmSy9kbHV4K/nXczengH1U6lz1XMWWVv0J9E
 LDK6L5u44h5xPjuEDgOwmBI/K8uhf1LesA8Xppsd4z4ViEK5zgMSwnxiest0h1t6JjU/4LJXYRe
 CXN8vLu/VEy7ObiVRM5RyhwLpX6hOdJA+Y3Gz28cRgyogDezEdslsiO8LxBXw0jNi0uOMCyhgMM
 7k9yg5OJ2vCGTXLewGFaQRDQe/aL6vNxF+vvqvFxgSSDD9lNgQvAHcoCF/eX9+T6tYg0pPWUrDr
 Q2Eucgu7Tn7XeZlduE+h/m/2s7JXK09f8T44qwdE/bGSU7HRTSoSZxQBPuNMYTMIOXivDqgS2NK
 BweyOYQ7prxT0piYmXTkuuhyjRSM8q92PupsYH5RNTHvCR19qscEuRCm8DHqQ0PnKZwe2Ou5UHQ
 /zcJCPcciL3jpWyMRnNLoeC5nopGjF9pywMK369mFt+2d+5e5TGdwUBGpwQKtwLN1mDptpmaGKB
 M5Hv+psoi40VUT2sAqQZu9zKzPXfsu1DY8+RZ6nGkRrIfhEUMsy8j/zFdOp1YukaIMXDArNzpd5
 LXYuu8wKwRoXplTGmjzw7ijtCx7qNL1bYzOyOVy0rLfJ4zsMXM70VHtmBNT1aIylVnBIgZxtbY3
 BF10l0DBAUgpC6A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of the first stable release, update versions for all libgpiod
crates to v1.0.0.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml  | 2 +-
 bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod/Cargo.toml     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index 148f7bb76501886e894bdd1649ac02567b10616a..7458b00efc342ace9ddb040e2f3c0575a8054dfa 100644
--- a/bindings/rust/gpiosim-sys/Cargo.toml
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -4,7 +4,7 @@
 
 [package]
 name = "gpiosim-sys"
-version = "0.1.0"
+version = "1.0.0"
 authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "gpiosim header bindings"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index db2616f74c2d116878abca6b5391647f6b6fd2d4..97bba2f475e8a8a307c0d96ef3c82df56070b75c 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -4,7 +4,7 @@
 
 [package]
 name = "libgpiod-sys"
-version = "0.1.1"
+version = "1.0.0"
 authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod public header bindings"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 533a482f7cf45d5174b78824203befdeeb2901a3..4d88b071442eadec0159c5b7c082df667d5e126c 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -4,7 +4,7 @@
 
 [package]
 name = "libgpiod"
-version = "0.2.2"
+version = "1.0.0"
 authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod wrappers"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
@@ -26,7 +26,7 @@ vnext = ["v2_1"]
 errno = "0.3"
 intmap = "3"
 libc = "0.2.39"
-libgpiod-sys = { version = "0.1", path = "../libgpiod-sys" }
+libgpiod-sys = { version = "1", path = "../libgpiod-sys" }
 thiserror = "2"
 
 [dev-dependencies]

-- 
2.48.1


