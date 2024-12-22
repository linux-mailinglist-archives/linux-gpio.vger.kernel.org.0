Return-Path: <linux-gpio+bounces-14140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 456BA9FA7E1
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 21:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5572C18865BA
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 20:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFD818FDA9;
	Sun, 22 Dec 2024 20:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TOvwZ1kr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0731418F2CF
	for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 20:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898103; cv=none; b=JT+6jYfcW1p+aE1xUI8Qd58Xyje2ESW6xahlKr6WTYbMwkXxZvOaBdfqt1el3fYglmHV+frqcdl3FhtqQUxvjkq5NwXs6Upxd4nt88RqqdxZ6wKW1JNXYGHWJqllfQ5ctjfBMPj4YWuwf3w/hMTps0hNPqtVE69Zq7nY+a5vOBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898103; c=relaxed/simple;
	bh=WO/IMfzFod/8cBoacm7o51W0b+nlCHHqIWQnuGnGvBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DVjAgXIp9oEctdt+W5KYrXLHSMF027BHJuMoq7yvqPW9OLjAo+LJ4MuWtJDpCgEg1tJbuyo90EPj1PJULiZbx0xBGrDK4bvS9S8vx47bYCRagspXpddz8ByymMTFs7vj8li0fZ+63JKGJBOkuWnu/rHiplruHRSaaDtYFzmfc8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TOvwZ1kr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436341f575fso38291965e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 12:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734898100; x=1735502900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1BBaXwMfpgsyUobFfQ5GTap8VassTB06r2EoTlfJ+w=;
        b=TOvwZ1krnNxXRu0TRSBTAu9jlZEqszUEP1gv9JGgHRmNQW60h7m+lNy1w/cHXbAwK8
         WSJVm/vFsycgh6Dh2EAELdFPnfIp2MtIVin922qAEFmlxN7j/sFzKv/hEjGyMhwwHdW+
         6eB2GOU8YvBlERHdfxoetfvYvOBCgWeo1HIs1mudq6s0LMlILmaAh8WEXzUHBqG6b+ir
         V72IcJ5p5YjvZfubBluD9rj3M96Qed5vLKmAS8e2x3OOA4vmbCIwZ1IzhtN4OPWiykXH
         co4HTWiLDvMHvW3m8q6SfBw0g1zeyHPOQns06W8kDyRTzIGcrDVAJClBkx8NsBL/g7BU
         ZS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898100; x=1735502900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1BBaXwMfpgsyUobFfQ5GTap8VassTB06r2EoTlfJ+w=;
        b=sO0q4h+BKJsnAf3XEq1/KOkZMLD6HJycZAzxU98HdgINgJu2SsXn/y9Mjt2iN3BIwh
         19n6AmlBxpvbBrKfHhqFjkVPxDzqHSpYNOzEaiWe44pfXOSxD1Al5Xukt18Donilct/r
         3eG/C8/Dn7Yypp9VzPJuTclOI9tzqVFAOZflFsEpVH50gCukpPHlbwGFFOIFMdmdmPlo
         XLLMLntwFe8I/leZ8mh1DfvSP5HFfHIaKEDhSEYJ5YIKq/1gslbHQMvcheEAtjqLC0Cf
         G8P8ScoCGvaz6pttZQNhylt3QreeyaNbJvZp8zLSUQzkdB8JlxMbn1k9XY4IytVq7COm
         GkaA==
X-Forwarded-Encrypted: i=1; AJvYcCXeWhVulYYfXCrWvja8W+pQCdxHIR+obhWm8wQ+qrlq1JBfQo+l9VMolRth4JFm1C+yTg4m80sZLZzE@vger.kernel.org
X-Gm-Message-State: AOJu0YxJQ73dHhpieBaZEMiS0InNm0KvysmJd6ARyQreCs789HyvA5AY
	fj+glGLOsJBPxHpzz2WtjfZ2FRQP0dbnpU4f/oieFMd8ebiW2I7cez/cOXnezq0=
X-Gm-Gg: ASbGnctfYt0Zw09qssJUs7WlKR353eP1aeaMb8CmdwewXY9zWyX4MtMn+U8Um6gCgLa
	K9YX/qgqjzqO0LM9337jzDWeCZ3DIKoKIkPXjysUo/FrAwL9D4WLu1B0fXamJVkHz1MaElTmIWI
	D0oyGkcYfytzQJJ8cynlK1h9ONsg8CYDKvXLuR0Q0TO+n3WKXsZIcLdBbZ+ggU1XLmT+zIq6TRo
	RfyrMwmFvrJvA4kOkNUxSEiH8eBQG99vazQh4fh815m89Fc
X-Google-Smtp-Source: AGHT+IGBD/YHSaEqYkFn/OiKhIYVpboBX4XgLY492MgyAHUPXur5yEh4nooh0/Fr1D5ZBF2Cj0T6Ug==
X-Received: by 2002:a5d:6f16:0:b0:382:40ad:44b2 with SMTP id ffacd0b85a97d-38a221fadadmr9370116f8f.34.1734898100427;
        Sun, 22 Dec 2024 12:08:20 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a153:75c:4edb:ec23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833155sm9492900f8f.24.2024.12.22.12.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:08:19 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 22 Dec 2024 21:08:08 +0100
Subject: [PATCH libgpiod v2 3/5] bindings: python: doc: make code examples
 appear as such in sphinx
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-improve-docs-v2-3-9067aa775099@linaro.org>
References: <20241222-improve-docs-v2-0-9067aa775099@linaro.org>
In-Reply-To: <20241222-improve-docs-v2-0-9067aa775099@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=979;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ql8amRJIay+V0eyvml8PPHVhO3kwrPs+SWiWNGqjGeI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnaHGvYyGXWK4q76Zr2TP47uMu1F71BAQHI4CP3
 Ttw81h5+d2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ2hxrwAKCRARpy6gFHHX
 cmqTEACtVf0lHDJ39keLQil4lwL5scqWxgjPA/567QLNjP+LRUcDZUkbB1W7nbsFCg/Vra2JWf9
 Gq7zcdH5Wg5ACMw57Oz9ArVhzSQdhmwk8/JiRXjSXloPfadsNYzhZVpL7Gt5d2eHN8Vq2n6dgTZ
 cnoTz90LrybKNE4A3KG032FeaYWFK8WqOLKoPl/j7oGULs2q5lbz+DGH6ksO6DQU1/6p4CoTAH9
 KneGP5LetLOjXm7z/xolltKPqK1oocKRmBnWaxG1VKSHWQZXyLCVGVGl+rDlQLw9xbtvIHpkFDK
 t0BFtE9T0BuwWlV14RYKSgsMpjEqZD+VqT7QsjnFk++tU6b5RH4I5mdTn224c3uC6DVOgOc3aNv
 j6V4bi2ikVJc3I9517CYBW9Flh3iRyeuf47oKlK2ABz4SKWdnYUfKLOcYnKqNNqfCObMu5CcUwv
 0lnGkUNIENDs/do1ajpF5+go7YB6duEKHqd6IRIIqS/FmL+iA6Pp0Jz1wfcCc1+KlzO4vxpZ/V9
 X1pj8BNMMLp4L4mGwYGKcdLnbhKpnZ4Neq5E3QYPBrhlRPXz46X+8pSELofs+APCAzz608k33ge
 c93rR7UI6RggIzbzsf/8m57v4ZAxMV/9dlxeFYiCQbwm50MyYo5/Tv1MsiaqosuczimyeR7gk5h
 ByEiEwOMOzEttwA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order for code examples inside docstrings to be interpreted as such
by sphinx, we need to use a double colon ("Example::").

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/chip.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index ddd07b8..5641343 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -39,7 +39,7 @@ class Chip:
     Callers must close the chip by calling the close() method when it's no longer
     used.
 
-    Example:
+    Example::
 
         chip = gpiod.Chip(\"/dev/gpiochip0\")
         do_something(chip)
@@ -47,7 +47,7 @@ class Chip:
 
     The gpiod.Chip class also supports controlled execution ('with' statement).
 
-    Example:
+    Example::
 
         with gpiod.Chip(path="/dev/gpiochip0") as chip:
             do_something(chip)

-- 
2.45.2


