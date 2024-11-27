Return-Path: <linux-gpio+bounces-13320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DA9DA88D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 14:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16BDD2836E5
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 13:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B7A1FCF65;
	Wed, 27 Nov 2024 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="obUDK7Ff"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85B75B1FB
	for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732714308; cv=none; b=pApZ3JNR41GMUvxKybf2Gh+8p2LLrkwvbJbjKYwDvpW2hj6YOsYbUJLs+6al9VXzFgMvTUAJDoCQXGWJMmCKOyecAQN+r4xAZjm6/yDsyLKR02pHfh4rila/1WsGN9CGpsN6hWItZR4G8Ehpbr0bLExmJJ8SvjLhuhNqjYPo1EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732714308; c=relaxed/simple;
	bh=bN47fR18OH0WdE2rDO97scLvyDs+vxcpNsEAlfsRtbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CPTLYKL8POkO4RscuqNHle9/axFjDooaelhx+LU/SlZjoP9G9DQ65F1cR1BJOI2ZOWARhL4SKMk230B1m1LaTBidzG7L6jNYgLaTP9mF75kBUO7EyxxBLMAXaykhMHoTdTAupsMa/YZ5+IwjCQudzXOK7HgMuyQmse+reShVf1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=obUDK7Ff; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so5141085e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 05:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732714305; x=1733319105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOFGJl9JdmOF60cr1pmexdxHzrHoLWb6fwjhsqCmvjg=;
        b=obUDK7Ffdsypqa7OKT2DRI5fNwYBhMfJUOoBaipZmJzzi5Sx678Gfnn9Hd8FsEFM9Y
         L0Q2ti9mhK/PCU+Kbdns93O9opYiSgRkGsakRCV/1c/oBOqdaQ9rAzfTsvucYPWLVIhP
         gmYojssW8HOOwIsvAMgeZu6OoDyaFpv8AKMEgkWNdqdfto1qcQkQtJ5fMsv8165xOJ0/
         xJhdL+AfOKdbAlxwy8lAOtOUoPsjQD2mIGvWHjT0CAzde21bjFWBCoKs2ohVZzb17Wey
         FZ3SS498gsO9iZRJKKJhsyuKYUFG18SU1cCK4naP6elpyu72h0GLMrVl9buABzN01wRE
         lm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732714305; x=1733319105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOFGJl9JdmOF60cr1pmexdxHzrHoLWb6fwjhsqCmvjg=;
        b=KGqc3p87gcwvazp/Z6XfBBca1pwzRjfucbjlBVezICoda9VlFdY5kx7c0qRBG0Z9vs
         /2yJbk8HlSEwYDhVRYz/TFahTPE8ZYzm5FqY/p6p1jcw6O32czithrCkUoO6/+Smhljq
         9j6IaoOzsAVAY7lo26s8lHrNuOlyjh3UUbOUPZg48u2fvllpQDI6pgtQa1KjE1wX2bWH
         wpZrPiuDBf52+zXT8UdBg1ulk8iIhm+5iKP7INFLXQLjp6keOCivvAiIM69IqKIcYb5u
         cwySB9Kv8l8qvFJpZNN622j5nWhRDB+f00d2ZiAyPtv9nYzz/LtdDBPMSt2yYwAzIPol
         tAdA==
X-Gm-Message-State: AOJu0YzMbqxVsUYtQmdPqjtg4TicdJcxWNUW+0FCTcn+XHozmtKgyvjn
	GZF91lMFhOvZyKika8vU/9hmFHdN/6TUjUXrskTOa7jfpd3R0bxZ5zxqBF8L4HI=
X-Gm-Gg: ASbGncs5ktgvSWWIskVEywjauBQk+uUCtAgZSOQBzr/ORkjT6uD3ZU0Ht/UlhUJ/UJZ
	4lHq08SyIp7Zr+GsEsi/zw60qUe6BE0r4T1HX3J7awWVtLyaEhx76jJ64h4Toqz1lRvx0Z5HhEQ
	lU4erdPtelBbj2/gpJJgPOkDTN4OOLw2b8J2+ES4f9WDslDle2HxVo7+xhV0aPAm9ssObU8b2Aa
	84adz71134353AEo/2FoRH9C1Ncaik/m449oitD/lfdwtjqdA==
X-Google-Smtp-Source: AGHT+IH0EqUhyemE4/m5M0TNmAEA6mq0LMucFk2qrYo5tBv6rlaC4egCVkStM+m455RKCMpOlQ/4lw==
X-Received: by 2002:a05:600c:450e:b0:433:c76d:d56b with SMTP id 5b1f17b1804b1-434a9e28dd7mr24969875e9.12.1732714304858;
        Wed, 27 Nov 2024 05:31:44 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fecd:58cc:bc05:528d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7a49a5sm21776925e9.7.2024.11.27.05.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:31:44 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Phil Howard <phil@gadgetoid.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: python: relax the verbosity adjustment in build_tests.sh
Date: Wed, 27 Nov 2024 14:31:39 +0100
Message-ID: <20241127133139.120107-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

When building tests using the build_tests.py script, we try to increase
the verbosity using setuptools.logging.configure() preferably but
falling back to distutils.log.set_verbosity() if the former is missing.

This however creates a hard dependency on distutils on older environments
missing the recently added setuptools method. The build however, can work
fine even with default (low) verbosity so instead of bailing out if the
second import fails, just keep going.

Closes: https://github.com/brgl/libgpiod/issues/109
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/build_tests.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/bindings/python/build_tests.py b/bindings/python/build_tests.py
index 84cedfc..ebe1727 100644
--- a/bindings/python/build_tests.py
+++ b/bindings/python/build_tests.py
@@ -82,9 +82,13 @@ try:
 
     configure()
 except ImportError:
-    from distutils.log import DEBUG, set_verbosity
+    try:
+        from distutils.log import DEBUG, set_verbosity
 
-    set_verbosity(DEBUG)
+        set_verbosity(DEBUG)
+    except ImportError:
+        # We can still build the tests, it will just be very quiet.
+        pass
 
 with tempfile.TemporaryDirectory(prefix="libgpiod-") as temp_dir:
     command = build_ext(dist)
-- 
2.45.2


