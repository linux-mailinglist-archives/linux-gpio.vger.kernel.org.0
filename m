Return-Path: <linux-gpio+bounces-5418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D50E48A2E33
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DE8528796E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D4056B64;
	Fri, 12 Apr 2024 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ry2kZ7Xb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842F956750
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924906; cv=none; b=LeBbQoerF2+76X/oNC+r21DULQLDhMJ9IALmbLkxav3JuIuF33lA7DsRlZSKpJgKJ/hXfgcamKPaCTavMrrSKJ2mWeUkly/6Hs6hT50Y5q7A6Y0awfPoZ8Y0AMOPm36vj22fM+SzFJZwjN1jbF1EulYJ7fEjQyP67AJYNLCKvg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924906; c=relaxed/simple;
	bh=A//zFMRJISgnjQa40WUbA8nl3JlSxbNU+MT/SoG7S4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rXuUxUekbxPDl1Y2oz00WJ5xgfxTvn4OXnhTkHFPLLFN4m1mFDE5obgbWPkidzroK/M8T1O5tXBHw7E5HB1SgJyvfALli6L1I++a462BXWpMMGihUzd/Ce/BhmruiNeIIwRER0qfREspVLPwj7riJd3o4PEkVAJ1PmF6JC/yLkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ry2kZ7Xb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-416a8ec0239so4977715e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924903; x=1713529703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JT2RNvwmn359ye+4uo39hNggvezMvWeoKN8TOK9MD3k=;
        b=Ry2kZ7XbhtARK6gv+BYBT96Ml5OPFkP0qUboVeUX9DSe5OhE+6a90fEaKzKTK9aVZX
         Kh3OfjfbofWRkMDw0faFxA+LAENR/BX32klc2p6DLdJoUR0v1EeXIXG3POl2wJ7xxIeS
         x/nAiAJZv/xSyEiK1SwMCvLKU/lgwxc1YTYlxMo1KYg/phNdkUFQ/tHLddcD8vcZqrwk
         OqHW3HcaAUg1422ndh6U7oOPefYpawLY1VeA8O3/gINgh8n2Qv4PnP6OG1ZULVTE9D1o
         HgqWIPGndbkTEqzhYqtwUMMmEueJd6jb3gaoEQWksc0M8RsIipr7deFHK19nyUIe56cI
         KOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924903; x=1713529703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JT2RNvwmn359ye+4uo39hNggvezMvWeoKN8TOK9MD3k=;
        b=S+YDs34WIF+Sfpw0XuLhOqgDVf3m2M65dQWC/kGFOowlv6yPabUsJ8nfG8UHrx+ShS
         RsCXs1OEPlvgXuwLrzZmuW+TjcECTAJi9UiEPfE+d1vfSG2WxMcqxR5FWmMrduz5VtYI
         ubfzm0VADOOJqo7LmRCN3GGLuAPmWcWj/9TJhtSElxBT8txRokseLiqVCpd0q2FeDfJ2
         /KSVQmiRsKz0do2MD5pVrt9ZdFm3XZ9pE95lal9tEvbeAZf6zQpyAp6ybfGZSjQqjLNT
         zqva4Q54Lf1HMXpNKvRG2CQYcCZm/5lZRWwniegJLIW8Z3pO43HXCOp0Ltro+EGqAXrg
         7Y9g==
X-Gm-Message-State: AOJu0YyBSc9rD3BT+fuL80++Kd82v28be/5TLZdHpjcMxTFlLdxDW00S
	wPA1AAHUfFy0tw/vhva71tXrL2GIkMAcBjmXf2Qp+XsxpJC0gM69svP77LYal9sUzpe/hM/MCFb
	9
X-Google-Smtp-Source: AGHT+IEoonEOETolbzS3aOB29c4vM57ZX2PQozI6ei26059hbVhHuF0WjG/65K2wFi6OA/BLxoU9BA==
X-Received: by 2002:a05:600c:1c86:b0:416:350c:db48 with SMTP id k6-20020a05600c1c8600b00416350cdb48mr2070169wms.9.1712924903026;
        Fri, 12 Apr 2024 05:28:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 08/18] README: document GLib bindings
Date: Fri, 12 Apr 2024 14:27:54 +0200
Message-Id: <20240412122804.109323-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412122804.109323-1-brgl@bgdev.pl>
References: <20240412122804.109323-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add information on the requirements of and the configure build switch
for GLib bindings to libgpiod.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/README b/README
index ec60ea1..8e1e1c7 100644
--- a/README
+++ b/README
@@ -206,13 +206,16 @@ Examples:
 BINDINGS
 --------
 
-High-level, object-oriented bindings for C++, python3 and Rust are provided.
-They can be enabled by passing --enable-bindings-cxx, --enable-bindings-python
-and --enable-bindings-rust arguments respectively to configure.
+High-level, object-oriented bindings for C++, GLib, python3 and Rust are
+provided. They can be enabled by passing --enable-bindings-cxx,
+--enable-bindings-glib, --enable-bindings-python and --enable-bindings-rust
+arguments respectively to configure.
 
 C++ bindings require C++11 support and autoconf-archive collection if building
 from git.
 
+GLib bindings requires GLib (as well as GObject, GIO and GIO-Unix) v2.54.
+
 Python bindings require python3 support and libpython development files. Please
 refer to bindings/python/README.md for more information.
 
-- 
2.40.1


