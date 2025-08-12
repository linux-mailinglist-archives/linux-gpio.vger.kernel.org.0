Return-Path: <linux-gpio+bounces-24283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06BB22664
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78CCA1B62B48
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698642EF662;
	Tue, 12 Aug 2025 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f1uJ04Hy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA622EF65C
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000658; cv=none; b=bpMGY3LBIcJiFr4UX39uA7KYi83ldn9pPpVMwcXvSy5ypVFGPg6zHWyXrALTiFXUTi1s273M03jNXlQYY93Jfuts5dPNk7MYspJrWGaAm4Po/WiL1r7HfVa6t8eSjwGjReIqRJUzi3eqqi6DAtlhQuJYzlIuyA12rChNcDdME3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000658; c=relaxed/simple;
	bh=vL3pf6x2REjhJG8vkq8ETL0iim7u1FymkLYpyGpMFb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gis4rrsvvD3hEgjn3XEyyTpqciDG57jQNJvuBToqyDU+QpXIUbB6WNiA8mzi2gg9wifidIMnhMZXND2GC/HFOm5+VL4cD66g40Zx0AmVBEj+jxcQPQNZqK49ZEFtb7wgS9YwRYXcivJN6Ws0XQNVKbqy5N6Nchd482zNhwjV3DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f1uJ04Hy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-458bf6d69e4so49288755e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000655; x=1755605455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGVxHrF59oaywwwMet1YWBSrEkuVq7/tQFEXLvw77VY=;
        b=f1uJ04HyiM3tNabca6nUOZ5hMH4CV2CCy5+Nub4ckTBGAwhPOf74APdeKo3Nsk0VLF
         zLgoVjS1+ddUzvbB7SGlkGohGTkreIVWW31/ucCVuqCjTfqfpyF1peK9YwAMTTC68FpL
         3Zfl6PL8qs6p2RkB3cCigH62nBElXrYzSgOr3NEPYSd0JrI/6Ed6ocI+ggUI6Q1UYIyq
         0IdPt/hcMRjKhmycGVLgMFsSbqDSIHmrn+vuXTxSrbIs+FJby5B2MhiKSpagg0hRqAOP
         qdKYd0FF60JgUOwuYkgxzvAThy+HC4HAlnqAFgGqN7l5wSvh8HfdFzTKDsWI4soGiun7
         dRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000655; x=1755605455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGVxHrF59oaywwwMet1YWBSrEkuVq7/tQFEXLvw77VY=;
        b=OJb/5sFunPZErEjMJAq0AWNkMhWzkSWtfa+kCOTwDQGwSIr38Nnq8IKGGL+dbE+T+x
         5p0Noe0xo0qtiSUDFUN4UyHt+MMIef/X6JUuPoTwTqCSpS8rsbe9Rn6Y+26gc0TzXpfY
         /922xzINPBeaOlHgh7oW0+QSXP/c01eoY5ptb3Ds8BQhE+W+PlGOg1o83mBHBNa1n2HI
         VEEu+WuCCxozofCxVRSNlD4tA0ZbiKxaC3HGH2hiHr2POlaRFw/7PZ1GJ7AxPvK0OZpX
         vE8LI6xbrrIrgoIhwH/vHopIeM4Gr+TIj9b1GBZpSI5yVz+IUy1+n+B2I5wg3dGJnV+h
         H35w==
X-Gm-Message-State: AOJu0YyUa8iJUwWyWnAmS2+GW2S2Vb4ohsp1cPIDRVBT3n02YN82swRF
	DuP9QczwpvLF+AhSCX8wTsld/WfsR5CH8fazUZ6NoLkXNSLxpqtCN2ocZCRU3Kb7T6WXMxGekMM
	AW6Rr
X-Gm-Gg: ASbGncv+LE+7CvWGv7a+ml+SdPY4s6Qm7uaxoCS6XgEnkPHq3MEvhcThE8qZOeVyjuU
	YgS3k59uwMkv0K+DoMgOXKqWRXPAQfb3pQpQzIL5kZwsPvJddaXumE+EtSZ6ZilNTkBslS2XV5b
	ktSCD98QbOHcYGw3Z++Adjj9N9H+/ZN6kmwSqvMfvCUG20pdxzcoVrXhtdHd72LJhBnBt3mgHHb
	/oPJs98SQUzhKiI84BreikmYSIdDRMWELWkjJRub+CldhIs1cEZt1ISoovpbsTstL9QHsfe9VRe
	alNVt24ftOLAe8fKJMoF1XmIiOPGx9nWYj3KD+inZm3Mq7g+8M+9bnhqX5ZTEroak/zspNv66eS
	YQiZAHIaMb++MPxQ=
X-Google-Smtp-Source: AGHT+IEZ3Q9e5Pg8ZPn3vMPB5IplmXoVH1WGUoFM4U+9XAJdBBdd9IPdv2u8/VrqKX5MOK+w8x6olA==
X-Received: by 2002:a05:600c:b93:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-459f4fac9e1mr139932665e9.25.1755000654807;
        Tue, 12 Aug 2025 05:10:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e1cb7deesm34268788f8f.2.2025.08.12.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:10:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:10:39 +0200
Subject: [PATCH libgpiod 09/10] bindings: rust: update rust version
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-rust-1-0-0-release-v1-9-372d698f23e8@linaro.org>
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SXDLjGUHYzday81LtLLE1PJ29A84uEF6CJ5XoWE4TNc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy9DFiNQvFsq4++aSCfWKiU5ucPrbgrgI8jX8
 sgjsnSQ0G2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvQwAKCRARpy6gFHHX
 chJiD/9ngHIRl/b8WRqTeqsysBBPDOU9m5tKIJJLZHRvRx8ysgaXzwTD0ThqfzBGc/8Aehf+Ej7
 L0wHrKWbzHjPaH9ZwUhNUur18x6hp2oKS0YEx3elFCfyDxUtaT8/p6+xWqS3TZ+wEoDUwbS+wC1
 KpLVrgrMuED7zieW2f+RYZYgLCk5RDexGMoQaXH9Z2DCyNFPfVkxwa+YvGMUs1qoIJugZTf3SLj
 u/JaMwN8cMip5gcD9W3mLJJ7e0jTVtAuXui7cCjccleViUvU8VY3D+/18YDiQnnbOrYAON4D7Sp
 x6FmqsXg80P16pZryv7evE/fgnS2dUFsUBUqfZNiWCOtcsayQ+34beNq/eJrKubn6/ZRS/FoSQL
 rJ9zS6qZkGsz0hcMvD6vsbsSXmcAQ2gUlIeer1i6Pd/K3wDcvqusCM4TBtaWjRrbnbi7F7L8lRA
 SQPFHIQvyxoKKQL8ZWjh2s4RYPDaTaUY5NBlxjNEKudyYLzRgsTOCB2L6CIK9UBCLmyGZoZtY50
 oEqJeK/yrt+3c0BHnw5v1fyPhxc8sVNOUkWBpNIX06s2T545HE/5d75aHnuZdN4edNhjzsOG2BI
 CyUt3SQXRw+jdVJVoNs0WViLhYJziWky8O4zk5paYScCRlc879dlZzhD+n32NC/uiJFAJ9bd3+f
 DfsPQPUGoNKLyOQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With all previous fixes to rust bindings, we can now update the rust
version and required edition to 2024.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod-sys/Cargo.toml | 4 ++--
 bindings/rust/libgpiod/Cargo.toml     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index 7fb5c174ec8186b6ef8cd64e1e6f25a13bd0dcd3..ab86ff8ecf871bfc3f931f8ea08490c4eb40eee6 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -9,10 +9,10 @@ authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod public header bindings"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
 categories = ["external-ffi-bindings", "os::linux-apis"]
-rust-version = "1.60"
+rust-version = "1.86"
 keywords = ["libgpiod", "gpio"]
 license = "Apache-2.0 OR BSD-3-Clause"
-edition = "2021"
+edition = "2024"
 
 exclude = [
     "Makefile.am",
diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index d7fbe7b3669750880b815832a2e5d7c975ed4d7e..c81680de1bdea76986c4a2fbb421bc452f92ff3c 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -9,10 +9,10 @@ authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod wrappers"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
 categories = ["api-bindings", "hardware-support", "embedded", "os::linux-apis"]
-rust-version = "1.60"
+rust-version = "1.86"
 keywords = ["libgpiod", "gpio"]
 license = "Apache-2.0 OR BSD-3-Clause"
-edition = "2021"
+edition = "2024"
 
 exclude = [
     "Makefile.am",

-- 
2.48.1


