Return-Path: <linux-gpio+bounces-13110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A378E9D28C7
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 16:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A8E41F2166C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 15:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BE01CC89E;
	Tue, 19 Nov 2024 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ggBlPtzR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977DB1CF7A6
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732028402; cv=none; b=JL20fHjFAC+OI5sQg+8wQXO2asQcTZkrcp6UuWC2NwVHJTZTGX3RcoPQ12mKiE+kXVxTLPJWoLNbM+1ZwiSdTNH8cJKHv7V9189wByqQz31q8pXEwKtlo++XBD94B/h224HkIeR8UAdZHLmJI78yvHPjN4FOYpQBCddBgQIY+SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732028402; c=relaxed/simple;
	bh=q15l5z7rF300ErRcmpIxinDa8ThOT/JS3jc+uXiYU+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qym3nQJ2vbv3wpIl6S6GfJRe4Xq6ABJ9U4lN6MgAZD6vDqcEnqQTgH3GzJmlr2vzfFMcWpbf7kUmvkrqpEDzHbpxBL66Zxos6jP0VU/wJCl5wzOjfQkd+OgCByOfCRKo05nPmrRJHHSnMYwOVFfk6aDtBKN1owLlTbcs7fBju4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ggBlPtzR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3824a8a5c56so1201278f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 06:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732028398; x=1732633198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2AYaC3enHLPDj8zbGxoXk05rkIWvywqWAY0p49eXI7M=;
        b=ggBlPtzRrrH/GoaJ7hDvRKcX/aVfIogCA3mhbujVn73feVBu9O7syNahXSZxDh/sz5
         4DGJoGYcwHgawsGi2XKYz0AYp5+duipCBsTzwuDPB2tclqT0ubbmvAietFlOqcHfUpGV
         i7No+SKqxqd6lt9VLv3eD9OSLOoSS3O6ExjYV/qJo3092T5qtd3JS0bVCQA9IP8DoWGn
         aJONXJRdOdEsneD8UNLnUaerrrP/7XJv/F44lbwJ6p9Au1vJuwjYbUjKzKRORYB9dS+s
         UwiegWCt/GCBgIzm0g4D241T+PL6+j6Vh5tjJXeZCk1DexoIeTkiN1faumP0zaJLP3H1
         mjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732028398; x=1732633198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AYaC3enHLPDj8zbGxoXk05rkIWvywqWAY0p49eXI7M=;
        b=A0eiS0YX/TWOf/JW1bb+spFPjKGPpVW04OlACsdbshvEFgaipNFoAcXh56KexNJa0h
         CYX1r1ZEN2CkxjQOj6Dz5h9jBu/flGvFMOlrt0X2cQGDWUrFuq3o3FAy/Eh85oN9tuSc
         jM5rZNvLngfaGvq0qwUaDJfqCz99IhyvNRXiYOlxuw09+TlBC1Ko77SFF/DAGZOx9h1t
         SbPJt0jCfATuhA/QRNp157rDUrGdpqahgYpSo7dIhTpo1gLHXPk06hUUsyTcvt1HS0zu
         62PKpSi0uuXCCnfJXp1NgfiDvLWel00jOZ8WTFv/GPmaTxs3UXfX6WaMXPGUzsKBhVnf
         /lDg==
X-Gm-Message-State: AOJu0Yx7j2l06J+ZoHo4j8rLBSb8mznxBeftAi/PoSqRYdOlsSMPJ1UU
	VrvFqZAu95BDdN8ikJ0j1z1zo9pTV5O6U7DTuRpeB1qZ8YtNZnUl8Fx99MQHRgg=
X-Google-Smtp-Source: AGHT+IEKxuo4+7Zvf1Si/V3H6j+ZycWtwRHMP1D6cIagIrIsQKCmQNywqwn4AHazVBhELj3JcKIFjw==
X-Received: by 2002:a5d:6d8d:0:b0:382:4f9e:7133 with SMTP id ffacd0b85a97d-3824f9e7430mr1955539f8f.29.1732028397981;
        Tue, 19 Nov 2024 06:59:57 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ced5:6c04:b538:be0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da24459bsm204316565e9.6.2024.11.19.06.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 06:59:57 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Vincent Fazio <vfazio@xes-inc.com>,
	Phil Howard <phil@gadgetoid.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: python: drop distutils from build_tests.py
Date: Tue, 19 Nov 2024 15:59:51 +0100
Message-ID: <20241119145951.126841-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The configure() function in setuptools.logging has been available since
v61.0.0 release so for over 2,5 years. We can generally expect users of
python bindings to be using relatively recent versions of required
dependencies. At the same time distutils has long been deprecated.

Let's keep the try: guard for setuptools.logging.configure but instead
of importing distutils if the former is unavailable, just do nothing and
drop the deprecated import altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/build_tests.py | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/bindings/python/build_tests.py b/bindings/python/build_tests.py
index 1760257..bfdc4c0 100644
--- a/bindings/python/build_tests.py
+++ b/bindings/python/build_tests.py
@@ -2,8 +2,8 @@
 # SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
 
 """
-Bring up just enough of setuptools/distutils in order to build the gpiod
-test module C extensions.
+Bring up just enough of setuptools in order to build the gpiod test
+module C extensions.
 
 Set "build_temp" and "build_lib" so that our source directory is not
 polluted with artefacts in build/
@@ -81,10 +81,8 @@ try:
     from setuptools.logging import configure
 
     configure()
-except ImportError:
-    from distutils.log import DEBUG, set_verbosity
-
-    set_verbosity(DEBUG)
+except:
+    pass
 
 with tempfile.TemporaryDirectory(prefix="libgpiod-") as temp_dir:
     command = build_ext(dist)
-- 
2.45.2


