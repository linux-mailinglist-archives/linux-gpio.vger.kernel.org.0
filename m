Return-Path: <linux-gpio+bounces-24278-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 952DEB2265F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BE381B62AF2
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2982EF661;
	Tue, 12 Aug 2025 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oVaEHNe1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7302ECD2A
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000652; cv=none; b=vArDwcaJO89aj6HTvRv2vtto7olwSbyTNkB0rliNpmCXINW0PYw7yzU3eXrBWDLw6EQ1SUBfYrqDnkY/dyy9azvQruZBaYlY60l9c/zdgKAlGjeUiZDHZwm1maqEV6ixFsFAJiG+wYffG+2YgjqTSc06VleSEj7cVjBLDho4eAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000652; c=relaxed/simple;
	bh=lD/bqJLZv0u6VvMbqTYr1Cz3IOkkqfpAl2LLFjSAO24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YA3bgfQoAITMmc0pSe25FAIxfdsKE54e6bbJ/DAsCXlnLgtwvvGhFOXgdJCYkFoEytAgIOmLUo7YgGjznhkJvgvwGpAkyC/rI6LhLFAv9CIds5Ytiauf6wUSEFAkRBIfdnxeGK4dhXw7ulxtEDFqyBks1r8maUWPyKud515MmO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oVaEHNe1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b783d851e6so4561435f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000649; x=1755605449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3dF1z863t+Cr8Lo6Xq1GtcdJkXks3M5gk8nL9enJak=;
        b=oVaEHNe157O67WxGkCTORH5QSZZHt9SRNI2G9zGN30p9WKegZRvABBpkXfJ+XPCO+J
         d7ElMtXsL2fZBlWls3W2tkAQsNscQRijOt2DXivl2fLy2Xt+tnX5Ipimf5Z6cXk/WTMI
         nW5AJKcEmypphe6hTBKc4bOF8VaeG59fSahWDWbXUF32oC7qkK49J9x2YfkXfOJMdBD9
         4qRkoRbmTmpxKJ8+BYos6vhIslvkijDJDMLT9ABTT6DKQvCC+XE1eIBajAb28qWB9rqK
         C1gJmAB2yl87tEqjDnBBnI4iR3Q7NWtbQdLO+BLGe3QXVVwvorBmAmlkHSzXHaXuo02M
         46EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000649; x=1755605449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3dF1z863t+Cr8Lo6Xq1GtcdJkXks3M5gk8nL9enJak=;
        b=I01fPS8v0fAOMmKLoX+ki+hndz2s4o2hok20TjqAD0EsE/WBvVFWF0mj7Nqr7RMayp
         V/XizCCfQmiZMalRQ/0RaOLFoW+KDksJcD+cvRzK7XWFFguJRdNkx15cQie18QE3oZCr
         AB9EvJG4BEbl2fQFdlSj6dHqv6HaZnwGeRJllam3hMJVvRlfoSxJSF1fTv32j/auDBGS
         MJBFRoTakP5dYUuilDnXXQ5abDzrYd5VC+n+uQ06KjbHVjOX95znZjtHLuCYtjzGn7bH
         wPm6LnLr0me5Qu/Q8HPc0BqVwkgufefp4hguRVJD7+d2RU4cF9kDi/Vf7HtXNdJArpAm
         Q3lg==
X-Gm-Message-State: AOJu0YyIxRiOuAA8PZOa8qjclD+n0lHvIoxUtXGsKMBon6CHyr6fu2Q2
	0r5oFA5aj2AjJnjD6uTwCmYLbNWKyyrcv4maQT6+LXBtUWhLaPvjK7hwTfg8oTfsUKAkCAVY8hh
	cIYmA
X-Gm-Gg: ASbGncujEAbl2H5nZDJCu+/Q7yU9VijET9O6/L8RMYYGjUS18BAFM2tG7N+YbOK3D5K
	tb69myE4ujTC7h0gSyrDOpAe+6zpXPHml8KAJ0ewi3EBiqr0ak4BB9xbkqk8FUAB+3Vo+Cy/JCX
	7Lcvs+EEbeO5q/DlsJQif2zgkqF6V897Eq5vD6YuiipLO4uuCBXRIaaX9CQE7OO5QbAbgW+j1f9
	yzKzVD0bh0Chmgjhounh7KyZ0UlLStdwWCFVbNMxNIqmT/JOweFSL2zcn9hoO62HlXbuUxHJE5X
	5ADm72lNwUSoR5jTb9iuTsFGiTLutvle73yO0+JmD8SktsGQU+/9Jzu23pdleDJHYA9ScWGNWLi
	SedU7brpunbix1QI=
X-Google-Smtp-Source: AGHT+IGob0LeNTKP0XfN0p+FOX1xbb+gkLja7uvvbsfpqBkpXyHLFAa/ScwyiZWdAMRTsub863qsdg==
X-Received: by 2002:a05:6000:2890:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3b900b49992mr14900824f8f.3.1755000648933;
        Tue, 12 Aug 2025 05:10:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e1cb7deesm34268788f8f.2.2025.08.12.05.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:10:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:10:34 +0200
Subject: [PATCH libgpiod 04/10] bindings: rust: update errno dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-rust-1-0-0-release-v1-4-372d698f23e8@linaro.org>
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lBMO0fz8WCCeIa1+//C8/S7Bo//8OVxeAMc4MaAKRxE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy9CQk3GV0aBqYwjhAiYqeTnhaSp6GUFpL3MR
 zB2R9j2staJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvQgAKCRARpy6gFHHX
 ciDdEADBqsnHhfo9DYCikGBZ5cFPjTox+9cxK2qHrtcq9BJgPHKH0CqM/ChVZJC2kfN+mqLbnx8
 62vuF5/fQgjaWupMnLh20mer0LBsCSRr/4hE4z0mvvFuYPHr7/rm1Rn/HpofyyIen7Xlv2iOlYK
 EZGLGChguqurUzwt7kc0Tdp+NI9c4Eqpw6MvO1Cjlr6hB2M1ANfWV60hctuvd1xMlz//78dIzaB
 6Flp/xqC15bjazaeidw7D8i67aO9kfIlaNmFyxPohm9lGMVmMqhpXjHdmc/lDi1x9NVoxo2dXcy
 8XYNdKNWSeCcC7Yv2zYElTJk9GCt/gP/HM2mYfUXeTNxvdIkWkcaTUT7nesosfc8nwoh0IQm9zx
 uh+XH9yGOQHru3xO2BgpWMimtC6DijhIsaIa2NAzD/EHFtdSd4LwfhYXogluNgT4/+N7kga0pYf
 yfd5xWEEzuztQyyuGktZK411rgDaSdqFKVpsGJLmDdkbjbVsNkPMJ1fWENCZJPKf/qzIxv3VvnA
 LnKlgUeimTB5QJfQ0PDHe86rwTDGpyL51OZTxqGg2D8hO9TdhveMXpahSV47u/aIm2kAk9Xyh75
 jzKCYqD6EvG/mOPEHb4Mqg9+jE5BsP9csWsSNq27ESzUmR4Dn1UCR0ohIu73kBerlfNovzpW4Y4
 ASrv1YOdXeGPVqQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the errno dependency for gpiosim-sys and libgpiod crates to the
most recent version. No code changes required.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod/Cargo.toml    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index 7099abe41226236b9cba70a36643b921021952ee..52ed43410ef5154a57a15e362344347a2b2cee57 100644
--- a/bindings/rust/gpiosim-sys/Cargo.toml
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -15,7 +15,7 @@ license = "Apache-2.0 OR BSD-3-Clause"
 edition = "2021"
 
 [dependencies]
-errno = "0.2.8"
+errno = "0.3.13"
 libgpiod = { path = "../libgpiod" }
 
 [build-dependencies]
diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 23c34799715339be02f769a6b4b7de8ae5c1639f..7c285592777fd6399591691076e0bb301ebabcc0 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -23,7 +23,7 @@ v2_1 = ["libgpiod-sys/v2_1"]
 vnext = ["v2_1"]
 
 [dependencies]
-errno = "0.2.8"
+errno = "0.3.13"
 intmap = "2.0.0"
 libc = "0.2.39"
 libgpiod-sys = { version = "0.1", path = "../libgpiod-sys" }

-- 
2.48.1


