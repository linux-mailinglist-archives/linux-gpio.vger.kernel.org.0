Return-Path: <linux-gpio+bounces-13159-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5169D3C75
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 14:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CB9C282C0C
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 13:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2021A3BD5;
	Wed, 20 Nov 2024 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oFXYTT+e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927BF158DD8
	for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2024 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732108723; cv=none; b=q6Mpn48URX7YbkMDWQ0ptixiffpxrF8ymSJmktLiNa4wB3usNjEM6eJNDLE/VppqH97KniKR0wM+y45tOYLi+JgQ+3NUAJjgnFm0q/jWSXFuYJQhMnbKAaXXDLyG3kgGzZFsJ9qU8nxGh74BliBZrOOL4VEPKhb4XMVVd09sHFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732108723; c=relaxed/simple;
	bh=ecI8JgPiwysUn4/RxKJ4oEhqEgtsMDf4RV27KRsn9yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/c+aZDP9FGkvMI0yLpqx/es4XNA4ysjKGJQ7a0Q7AqesY3M/pE/jm7Q5BodBNKYPxW3bfFur61JA5gT1xxHIEoBF8Ry4P2wcbwjZaCJzN93JVy7mlAA4Q6wZqpWd4E2aqqpYcaIoNfoVc/U0N/k1uq9gCpdPIeda0t2Ja/hcwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oFXYTT+e; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so56573345e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2024 05:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732108720; x=1732713520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Obywm8qFcWYhfI7yfALUSGj6P1J1l92eFi4boKLeRBY=;
        b=oFXYTT+ec4MSyHNgtMLIfsb4eoZZ1ow49W2Ou0kKtYzpdRdf6iCsMNgMcxi+skutlg
         +/VI9n5+nMaNKdRK2XzD6bwHon3vAs9uEVFD4q7Kx/CXvznjfF9im8aeuU4FeT36yPmx
         XAjKFcV8Q3plvE71eCwHLp6rOSEmlGnv53L1JZfJr+wroJVA4oLioMC1VMDAtr0hq0S9
         JvW5+z9+d7rhW5ysP0aF/l7MWAp0qbpYFGdAR3ffaTXL8x2jwW2t3cacmiVeBUzD6vG0
         KUbI3VPA1aopYihQfU3u28umx/kYnvEeK5XcyWFXH6+g02iufg8fRapg51CqOIXLC0pi
         BxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732108720; x=1732713520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Obywm8qFcWYhfI7yfALUSGj6P1J1l92eFi4boKLeRBY=;
        b=f/Z02H+ePmSCQ+ZfbiKebN7FtR6wB5ow1B7+h1psS57/XBKy5q8eQTWLQ9zYuX0FnE
         W31gSDKmfmhha+sTgXwb7DUi3jZLPDN0TJZicfOwUyuVlQXh9cTq5xBJfqBeYD7/itEQ
         uaNpfF9n5wehyhm0Kls/FUzWIz3ADjh8D2/Z5voi8QOKfRZyRtM3OdOKWZm3RWDblKwC
         g5hlrMTFLwnXznNn8TsYcIdoRGb7zY3/Xx44cMYJsjnW+y2oeCwzoqrOPBi28F9U3ZaM
         tOK9ojJGe9Vm5heG4e8c1RFTyqVPUW/SPIAAkK4jnT6XUIQavbpIesYx8FZLpXbh5hbx
         zKZw==
X-Forwarded-Encrypted: i=1; AJvYcCXqVPqJA2DigPeQw5BQ/BkyPva1S9lQp1y/uUDs2evjCUyVjEy4Fso8Nm628fwThpKPx5UgpQSsafZ3@vger.kernel.org
X-Gm-Message-State: AOJu0YxiUnw/PHBAihy/XG9wjhMYtE88dwaekNDj75ZavaQr97W4SP0M
	3/hskNlm+OQLK/Hm4wL5t6pm6GN5u7Jzj6IIEwHfV3t2tKHHGUpadEJQpmfx2GQ=
X-Google-Smtp-Source: AGHT+IEIczEbKOpnEYf3hw2tOjaMaIuZBEtwvR2uU53Uy1WqFZ7KLFyAuRlpNL0HwRUFf4ijFt73Fw==
X-Received: by 2002:a5d:5887:0:b0:382:4fd6:405e with SMTP id ffacd0b85a97d-38254afa8ecmr1947910f8f.29.1732108719847;
        Wed, 20 Nov 2024 05:18:39 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e93c:902f:82f5:7ce8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493ee48sm2040188f8f.98.2024.11.20.05.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:18:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Nov 2024 14:18:18 +0100
Subject: [PATCH 1/3] bindings: python: add .pyi files to EXTRA_DIST
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-drop-distutils-v1-1-7498e8b3babe@linaro.org>
References: <20241120-drop-distutils-v1-0-7498e8b3babe@linaro.org>
In-Reply-To: <20241120-drop-distutils-v1-0-7498e8b3babe@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Phil Howard <phil@gadgetoid.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=b/1GlSu5rgSLKbC9x+OzdesIfP/6+zrkm7pjV99kozY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnPeGt/nXI2s2x/6XHmctVdGtMMSLCWn6YsokGo
 TFaeRqHnLeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZz3hrQAKCRARpy6gFHHX
 ctdoD/9c+Dme2IMD9kz6VjQFwkyBukV2YyPsw04/5eYjbmi39I4NMT/aD8zYk9icpcgcn+mU7n2
 MhLy2Stssn+tuhXMrvX1nH0W+2XtWe5g6wTCBInz95/HA28BNCs1PTVFFuq8OX8EVUMyy/hHX/g
 BGF+pH6o4YyA4yNBKZzLP6PeUFgtjM66fRPwdarKEK6qikLxm/LQhWG1ZV1dmut2+CgL8w8ky3F
 sEWfmvHDb9KeidJiT9kpROOfxkc38rqqAJRotA07pGsUGTlAqcF8fgdrTAN4LeUKTB9swqw8ldx
 ObA9IhqzvD5B5b+UR9trbMA9VhsxhVIImchiWQJYHS05OkPYPFu5JjQtc+fK8hSmegrHXrCIRi7
 UsI9fsPsFS7qck5s2vdZNk7Ys+ri1+9ne14jo/jzKo+xYF2l1SVAfjpmAl98+kVjUA2NrvKX2g2
 KB0OE4Cr4WS/PMatkxv6LKnDeIOsXzmsh/Krwapg4w+V/1ByHwZMptu7rs0OZskCWNtbc506Oih
 LFCmy4V/166TESCUnQ3ydKvDYlKK2YbEDcrHrj7Z5G+tBbiwfhYl3f+TlGFbgO8depAwqv9roGP
 iNVl63BLt8WQ6E0NxTjjRXiE1kOEGa2FbhqrPIzwxLQ63AESFwhRyBqzyREKwt5QbkBhbcLAluC
 CYlm1BbzZ8m7zkw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While python sdist and wheels are built separately these days, we still
want to package all the extra files in the regular libgpiod release
tarballs. Add new .pyi files to automake's EXTRA_DIST.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/Makefile.am          | 1 +
 bindings/python/tests/gpiosim/Makefile.am  | 1 +
 bindings/python/tests/procname/Makefile.am | 1 +
 3 files changed, 3 insertions(+)

diff --git a/bindings/python/gpiod/Makefile.am b/bindings/python/gpiod/Makefile.am
index daf7bae..e50297c 100644
--- a/bindings/python/gpiod/Makefile.am
+++ b/bindings/python/gpiod/Makefile.am
@@ -6,6 +6,7 @@ SUBDIRS = ext
 EXTRA_DIST = \
 	chip_info.py \
 	chip.py \
+	_ext.pyi \
 	edge_event.py \
 	exception.py \
 	info_event.py \
diff --git a/bindings/python/tests/gpiosim/Makefile.am b/bindings/python/tests/gpiosim/Makefile.am
index 7004f3a..b403f3c 100644
--- a/bindings/python/tests/gpiosim/Makefile.am
+++ b/bindings/python/tests/gpiosim/Makefile.am
@@ -3,5 +3,6 @@
 
 EXTRA_DIST = \
 	chip.py \
+	_ext.pyi \
 	ext.c \
 	__init__.py
diff --git a/bindings/python/tests/procname/Makefile.am b/bindings/python/tests/procname/Makefile.am
index c4a8fd5..dbc8e64 100644
--- a/bindings/python/tests/procname/Makefile.am
+++ b/bindings/python/tests/procname/Makefile.am
@@ -2,5 +2,6 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 EXTRA_DIST = \
+	_ext.pyi \
 	ext.c \
 	__init__.py

-- 
2.45.2


