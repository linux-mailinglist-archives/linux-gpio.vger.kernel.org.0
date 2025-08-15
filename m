Return-Path: <linux-gpio+bounces-24409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6ADB27C2D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D88D262005D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CFA2D3721;
	Fri, 15 Aug 2025 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1q62UE3g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CCD2580F9
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 08:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248282; cv=none; b=QklfcwhTepARybjWyotGjrIX4g6xg5AVlJg/tmP4LNVk9ztasSYh5r/e//Mx2TUZSgdiNM0iXW2bhP0xqpq0AFNvRFaGSNiXjjWFUFCwgRDpFHjxkhdDsZTpQnF4NLebUZQXZNfaTt0ljEXmLmXTeV31uS7mPpiKXDM1ezkLGdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248282; c=relaxed/simple;
	bh=8eYT4HUy62U2zKybZ/5cELv7u+XA5t9Cj9ZzxOVKuRI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oRlrXD4HPNlpZM5VpUDE71k4VMhBYZTGuty1RpK9Po+HZhnV3/ZT6BCOkwJa9EASx56FB/B+lNVXqCaakCCs3KSPaVkdOTKk2WTkpOYr/atMUve8glgxwX+84SVYBaW9SNtzP7c/3UkGwzBZhSvt9kFI2+3M5u4nQO9mk6NOkP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1q62UE3g; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3bb2fb3a48aso175504f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 01:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248278; x=1755853078; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zt8PsCB3hg52l406nQaJW31gstOd/cFfDmfc/zUl4sA=;
        b=1q62UE3gofwuaPyUomTQabxmbCK0E08Xu3zaZpzIuDMZJFY/MUqeqGlE6PFhTnD/B0
         iRezby/DhYMRkvyesDJcrNkCBKdzq2t3n+Of5f5lLLbrM9E4EOLDBdu2ut4P6utdBaXX
         UMoZk7kJqMtnonpoMigOSYGKpSFu1mQ4LN1OoY2UpXgd5u4+qvVro+XFaYCZDm2SYx40
         MiDh7+br1LvTNL5kFjJ+izAG/uB+S6OUI5SCMCL2Muby1dkEl14gSWgaQcp84WwFe0Vo
         fSB7EcckoA7kQTkvnk3r30d3AfZq/yj63rUfn9s1sDZHRdnAgQuUEv6Nw9+VNZGZxQp1
         pBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248278; x=1755853078;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zt8PsCB3hg52l406nQaJW31gstOd/cFfDmfc/zUl4sA=;
        b=JSOxyW4EdNoC4FcRtP8jTUmYvqvpHDLXUAJbMWzaVQ66FvJ+xP8414QKIO0ZNKLUrT
         RByfVaXlVBJCbfuKWY5EOiHfTRznPuUJ1isJhZUEAew8aUQWLTgtj1Q7KzgIzduh6FH8
         OHEfgmO4YTUUdtRLhqTcDgQzerAhN2MKEAfMxMHTfmRK9fXT7B3rwMZ83e0yiGjSgtUE
         NIqfHzsvDeEyt5Zp8AyhAwcQ52tuDG4wA74zGJ/uaJKcG0tLkf6PXl54kMAqDb96SRQ8
         HpTHuOseBVHlhrB8ZrDnh9MYnp0ROo/NwtuY3Uu3vTu34ecmRmWQk2qEqHRi9TSvcnEA
         fZFA==
X-Gm-Message-State: AOJu0YzrlNfwA6I/f4pW0zr0KSapio1K7MexO2rLACoC6fAj5jlMnAF8
	9o/VB0NycdOEOVAbwuK3Pc5CskcxhF6+Ubp4SMUmeApogeg4QAXSCA3dZ1VixJSqZLbaE7/4EeW
	ct+eN
X-Gm-Gg: ASbGncuA7ibBrv00xR4ynHwtLcaCK+rEXFokP5aHLdfvnqD/41787WJfuRkr8rc0hMe
	UNZWwKYfb2ZOLSaDxJVkkSTnB3lATCH5hSjzy0/AiR28ixudC/qpFve/I7jSEFAYsgF4YEO0556
	Y5cEDst6yURzDkyzSvnzBh2Q+0vvQGkm0/F9wQgnZRzlIlYSv3TeJ12jZ5EZL8Ioz/qv6uaENlX
	LObFyj2b0kojnAZpXeApK/75xxJfCSSomAqvpHMja1GZBLDHOia41Iljfv/uCIQgshvD6Gpi0Js
	lQMBXLEVcN3CR0JIAmF58i6J+8WVUni19qdpgTF83zO8jRCkLRYalfuTUv4+cbTXeLPWBTpF1RL
	DFwpoUZpdZULKUpr+Lg==
X-Google-Smtp-Source: AGHT+IEntrNU6DTXKx0622fb0VMGZTGzm7gmWjWFM3PIO9mNBPVzpzoN/GMyBeghB7CFJW8rY7F+Tw==
X-Received: by 2002:a05:6000:25c2:b0:3b7:926f:894c with SMTP id ffacd0b85a97d-3bb675d3c7bmr807748f8f.23.1755248278319;
        Fri, 15 Aug 2025 01:57:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64758d1csm1193355f8f.8.2025.08.15.01.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:57:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod v2 0/9] bindings: rust: prepare v1.0.0 release
Date: Fri, 15 Aug 2025 10:57:48 +0200
Message-Id: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIz2nmgC/22NwQqDMBBEf0X23JRko9F66n8UD7auuiBGNlZax
 H9vGnosc3oM82aHQMIUoM52ENo4sJ8j4CmDx9jOAynuIgNqLHRljJJnWJVROkZoojaQcoXN0el
 S55ogDhehnl9JeoOJ78PCvoMmNiOH1cs7vW0m9T8x/hNvX7Qldu5S9Wipuk48t+LPXgZojuP4A
 MAqos6/AAAA
X-Change-ID: 20250811-rust-1-0-0-release-65342607040e
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2045;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8eYT4HUy62U2zKybZ/5cELv7u+XA5t9Cj9ZzxOVKuRI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvaPpg+q3CABi7M3oqmw3hK1F12rBGqon3BzU
 zQaYqywTv2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ72jwAKCRARpy6gFHHX
 chUgD/9PB+HXAg7EYY+WHm93c/lOOVRHF2cibeIj59s9AunCc9jdN8TuN+2wKZL66591c5iOECB
 HdVp0bcfKTsuujazYRJAMydDoRgarWiKINsa9RVP9azrabon8cHCUE8PaR43G2hE1cezvYTSm+c
 +yt1j7ixTnCfYZ/dFDOuP3HxJwmfHIIFnKYTpVzAUlDlajuYFG9AIEr+SaY1MC9Z3sHlZawVMsq
 0SoluqK4DpQofR/RMwUFxSrALB2zUZBSPq1h0ZVjiJbO/7O9W1CkczBGn260IM9s8/CaE72TgNw
 zwYNivL++NZ1AHypYRsJfWvXc1O9etJMTRuMW8Td4NTj5hXDnAaMKFYjwckjtTh/A7OPqbj+5w8
 LCK0gkIZ38yuabRu4i6/4pld6oo3G3BhPDjfMSXbE4zfNVLpCG2PG6xLuVtJZCX+TZ5HL8xHzxq
 wh1ddAy1bj4v7+/Bs9EKdxnOSO9/HuOiwbZCrC16qib9F3M5+rfWM+vETUFuFFQoXRh8niv7SIC
 mBdXswAxMzwigt+H7IKemJL+CCOntbA0VAjjzVUzFP+vGNrstYjnWn4rlvGbblADaTau+CUR0gA
 UM5i5qe3X99NQf2idkBNy/+nhfBliwAPynyAyQ0gfiHDUOGrb+qoLqCuri8u+YzJ8Pol/GZNikC
 1t/+9c+oLOyLkDg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The libgpiod rust bindings interface has stayed quite stable over the
last months so it's time for it to stop being a v0.x release and become
officially carved in stone. Bump dependencies to the most recent versions
available, fix some issues and then bump versions of the crates ahead of
the official release.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- drop the patch bumping the minimum required rust version
- loosen the requirements on the dependency versions: specify only the
  major number for stable crates and the major.minor for unstable ones
- Link to v1: https://lore.kernel.org/r/20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org

---
Bartosz Golaszewski (9):
      bindings: rust: make Buffer::read_edge_events() lifetimes more explicit
      bindings: rust: add missing unsafe block ahead of rust version bump
      bindings: rust: update bindgen dependency
      bindings: rust: update errno dependency
      bindings: rust: update cc dependency
      bindings: rust: update system-deps dependency
      bindings: rust: update thiserror dependency
      bindings: rust: update intmap dependency
      bindings: rust: update crate versions to v1.0.0

 bindings/rust/gpiosim-sys/Cargo.toml       |  8 ++++----
 bindings/rust/gpiosim-sys/build.rs         |  2 +-
 bindings/rust/libgpiod-sys/Cargo.toml      |  6 +++---
 bindings/rust/libgpiod-sys/build.rs        |  6 +++---
 bindings/rust/libgpiod/Cargo.toml          | 10 +++++-----
 bindings/rust/libgpiod/src/event_buffer.rs |  2 +-
 bindings/rust/libgpiod/src/lib.rs          |  4 ++--
 bindings/rust/libgpiod/src/line_config.rs  |  2 +-
 bindings/rust/libgpiod/src/line_info.rs    |  2 +-
 bindings/rust/libgpiod/src/line_request.rs |  4 ++--
 10 files changed, 23 insertions(+), 23 deletions(-)
---
base-commit: cd32f27dd550753488bff4918aef4e230ce01512
change-id: 20250811-rust-1-0-0-release-65342607040e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


