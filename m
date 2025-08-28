Return-Path: <linux-gpio+bounces-25137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 008B1B3A881
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B445F7C06B9
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 17:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B9F33A035;
	Thu, 28 Aug 2025 17:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EEPaCBCK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E10322543
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 17:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756402996; cv=none; b=GEUmnwaPrtC4q8pprPJSbNchPhvkSVjzoE25InW3OhkqSs37IZuUwag1TuNF7K4p6dsrQa/MiAkVKssBSVsUttzKzVGOeYXDOXUGR7pvaZy8UCGxYbZ2puNNLIvktHRs8DraR5ELnrIK1hysebZpTPVYiB2BtTQl6IXLm9min4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756402996; c=relaxed/simple;
	bh=th6Mue+Jlx0Y4akANJrIZztW6E4HgxYxOP2aIh0tIac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oAAylheA4navWvD7qCQhOh3yIRTE6NNTUMLbMDYBN2/y4mwNS6/OH7CeOlot0zETT8wEaKChz+XXbnHu0riHgvCTDpf0kdN9yJmYm/WqunboI1+irXKB/VdQPhEP3w5eDXBFUDK056RZwOwmS6HXRVqyLx5rq9kNKL2N9R6HX04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EEPaCBCK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso3900435e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756402993; x=1757007793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaWSeJO3ztNKJX/kgI5xbPZqqI6FcbuatLTwZobM21c=;
        b=EEPaCBCKykdgLjmiMi0jgQYGsRFXIQTAq5tJJECSYLNJWbHfL/+AJFPV3GaPIWo/Xv
         KRtrCGAMdue76Kidy+5iCbtJH2QX5lKHLMVceilZnEbkJ0ZOS3BIYO4M5jbDAnGMWh+O
         TwTqOtDYbY2XYN/+nBACH4gFXtAfFSIOH6RkZml7qEgvDGrEI5hSuq6syctoXYHBivRL
         +iDy5xzcvGphjrIwyXHsel8/sQp56E4F4s4zAumVxKpcHGSoqg5G1gfcU3Ge8p/Fz7l+
         lBHSxadQ5m2lfyOJ+zAl1BmnpAyIx6nop6SRCes/9YU1xacX/H3Wuz/sye9jnSJ3+kra
         y8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756402993; x=1757007793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WaWSeJO3ztNKJX/kgI5xbPZqqI6FcbuatLTwZobM21c=;
        b=GfSy6ZP/6kYrzyRG+0fi82cMBh4A9ylbcBNBzyRkUjz6pj1avyBuUwseC7Xjs5i5rm
         weSupGauB/Gi50LSEUyPrGIWATxd6Ki5iqK1j0bsIo4Ix4S0WpGPI0Zy7J8uBDkBPn1E
         o7GNYzqEvK+u35q/Y+QTageITPDcKsf/FNgbS8OEiqZSo24dA+IXRpmqOomFMFltJ+Iz
         0987GsUD5xU6s/AmLN6LUR1dgos8x2XNipt7Qd0rjzNm5+i6MSUQa4FiQSnoZLsFqJve
         kOTVLhqyf111TyDV75HHe5tND8AWeLQFGbSQF0jMZKCBJDwLNEYb3qvr4/VNATkQMktR
         +s/w==
X-Gm-Message-State: AOJu0YxOKr2ftJnEqpnPEVaw5JnXQrl+Qxd25cN06kL+jCncOYwnSxEq
	fWz96Am5PICheHTYAfu6Hl3qx5kSE+H8xp2GHzyURJ2ZagYGBSxdkqa6Lcsg3NWgpJU=
X-Gm-Gg: ASbGncvpXiU5Qua7pFjqsb4E76AFF+H/2gxbheo2zFgZFV2XoN+/E5wWg55q8r7Xauh
	1r2eXQwzF3hrvJ9aqd4bJkVxIDVUt00VfRDPyuINzuazAjN/BdtCTfssPnR2jYifdCAJKKNzNXJ
	Nn0Yj9iMVSAfnqdyEFqlol1R4IQ/POTdimj4rzqnqRYmGlyKNR8R4vhUZ9i9j5Qx4fRZnG7GNGF
	ZvF0kI/XS0+84yPPJtsO99X6PrsXfuXFxv0fIvRLQt0JDzO35X0sEJiuitqRyjSn/acFxfATOGO
	CKo4quWXFDn0oU+lTCOXF4WswdkNZs/WgXnEZYAx9FkE6UijnVvl44ucPeG6hWQDKs86KRfeFCE
	BZeBkMsYVGrTmR1yv8w==
X-Google-Smtp-Source: AGHT+IEcrkMBX1HMee5DPSAcVOkz6/rkL5dN6iNy359nkqVJ45QiyPfVt20K1JGTO2ejJDUu2iL+uA==
X-Received: by 2002:a05:600c:c493:b0:45b:7bba:c79f with SMTP id 5b1f17b1804b1-45b7bbaca16mr22679125e9.13.1756402992932;
        Thu, 28 Aug 2025 10:43:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm3812075e9.3.2025.08.28.10.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:43:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 19:43:04 +0200
Subject: [PATCH libgpiod v3 02/10] bindings: rust: add missing unsafe block
 ahead of rust version bump
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-rust-1-0-0-release-v3-2-0f9c6c1c4808@linaro.org>
References: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
In-Reply-To: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/8yx2RhpPwP71KkYQKmEHcN483C0e+kgp8yhtwq9YZk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosJUsOts9grEPTLPYTeSX1PWzAPAhC+PnfIDwf
 dukoxe0jtSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLCVLAAKCRARpy6gFHHX
 cszDD/0fkwKwcSlTIXO8pZXSC+TFxmmcksZMMsUzk5CDD/2oAUB9aT4jC+RK3BL8VKeOgmiy1SV
 wutSGa5ey18Df4YMNKieUBcDyd/SJkydOiGMNUOBGFDlgtBo92G4jDaeV3iOv0JLOdqBSfQfnzq
 6kIq2hVIubjC6sAWueg6zYCmste61ESpm765cxhj2HCL7t0nMZ6QAkBQazLVcHw8Ria977ASUJA
 L/cvgk5ffspp5mTXpwdRRcpbELoWako9sNu337NL72Adovlk583RchdsGAsfnncOzFCLYtHD46Y
 vcwbTTq0K65bkMqJOzaP5k/CvvM7OFMQmd2Hm4CStasXaDMy7ZA7GsQU/jmsbSHxmD62yHcXGnh
 qW7bfp32YwAEeqnGYecaEyVxF5aJo7S7nqp91CRQHO4iD36a/hWDV+yKaNe4qkMIEAuxPDrVveA
 NWNKKYejoo+Xl4qzBDueHQqusgf6ug/IKKGvZzD1ms9WKwITAhqRmd7nkTD4vEXRF036RK2Ri4r
 t0zea37ViUXzvuUi1554dEtyrsLasfYGPhaUPik9PlWJQllKZFCm1O+6/3bGJ7JP7ZQMS1D43qx
 1j2Kj1Cj/n1E79ZW07UPEqp/h64gvoLTcYhxRclOxl63nxPFYT1iFoLX+XffmfYvD72v15kdCah
 V2+MBu3TQL4GHTQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Rust edition 2024 changed the semantics of the unsafe keyword used as
function modifier[1]. Unsafe operations inside unsafe functions must
still be wrapped in an unsafe {} block. Update the code in case we want
to bump the rust version or check it with clippy --edition 2024.

[1] https://rust-lang.github.io/rfcs/2585-unsafe-block-in-unsafe-fn.html

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/src/line_info.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
index bd290f6e1369a3968a39178c5bcfb9f6aaf26239..8def1ab4e52962fffa6911976e64204c3d02df6f 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -51,7 +51,7 @@ impl InfoRef {
     /// owned by the thread invoking this method. The owning object may not be
     /// moved to another thread for the entire lifetime 'a.
     pub(crate) unsafe fn from_raw<'a>(info: *mut gpiod::gpiod_line_info) -> &'a InfoRef {
-        &*(info as *mut _)
+        unsafe { &*(info as *mut _) }
     }
 
     fn as_raw_ptr(&self) -> *mut gpiod::gpiod_line_info {

-- 
2.48.1


