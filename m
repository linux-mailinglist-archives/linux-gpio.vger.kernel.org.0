Return-Path: <linux-gpio+bounces-14091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A87F39F96CF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 17:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44DE518869A7
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 16:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E1821A42D;
	Fri, 20 Dec 2024 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cZ8aq0ZI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1A72594A8
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713196; cv=none; b=IKUoGpGMIZdYSDu36NEI4pBV3FE4BP/e39FJcIIqCtkMMbM0DgnVnknF5iBZT5QZLXLaarkE6QkbWx7D/qjAszcGp5iMEpN+QNz6Xi/d6getNbnqB6lLLzrZJ5ZxqSxRD7PmJG/LYqbIv9R1dYoOP7D8TdAo+Evt38L9P3z/TmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713196; c=relaxed/simple;
	bh=WO/IMfzFod/8cBoacm7o51W0b+nlCHHqIWQnuGnGvBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=indYnoh72zgnIdw+VUPRsQtT7hq26P4gj7ntEFzluKdDoGZcK4cLggJvd/K9BmJ5SwrPM+szsNKEGUn3UGGbuiW43WflkUXVi/JPfy5Xg5XVDxpHl5kEvsj3zGliTkRlDUK6AzSF90Fk+8wur4qUgbEkOAf3i8DUQ8KVkWphZqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cZ8aq0ZI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso21333155e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 08:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734713193; x=1735317993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1BBaXwMfpgsyUobFfQ5GTap8VassTB06r2EoTlfJ+w=;
        b=cZ8aq0ZIbVVtH81Q5zO4UaEW1Hkc6H+MoWzE5GZLFc7OrtQ6i5+zI+w0V9HV5Ge0zS
         nAHMRcIXh4osStgiGKuZ4jlK3fbFb3VA7J1xEFmAB2KfF7/9RrS/AI3dnY/PVJjNBENf
         OQOCPfvW/iq3gR87k+YBtm7xvZdBcViK82GR2g94K8UABosAnW9ZRG7C4LaLezv6x78w
         WEhbuOX2FYzt5NbFYrN7voL1sJ8F0HhNK+E9PQDvLgOwtHwQz9JlcdVZ+0C0+i0n0+hX
         6nO6lF2gDm93liNs+hD3GoalC8ki/JcNQxt/b+EjUTg1D2r/I04S8SzSzxIZglG/l/ZH
         xxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734713193; x=1735317993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1BBaXwMfpgsyUobFfQ5GTap8VassTB06r2EoTlfJ+w=;
        b=xQYF9VKtW3CZsWGAgQg3Hm3kUMYR+k7fZBdVUyEglyeubcudYpZh6+iNL4Ayf/rSeB
         a3CkN/faWkRCTayh9LrbnCwxYpXgXxd+3zxpo9zhDfEqJfCF8j0blCNYwQBjkKST7jS6
         eH0w9QOIwzTGBmEiTxCT5zWy9QbwIknfY1+HvVGvlSp4H2LHExpeHvFkij5m1swnm8I/
         mns9aKy0dwB9w8iyfmajYMe1/fUPlTfiE/ale0nQZXRLy3+3G4VZRURWz1+wMqo4+9tc
         zEeae1VJWewsQNK07T9FOqt2uzb2FfGNCIuAmKw09Wsia/Q+urG8VPrjw606hf1EXb1r
         6NwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUott54/VXu8YEubyNzAqGxd+fHDL+9Fv+i4xK+AeWpGAXixtu/hQFZnGhzLDtxy1yizBlkqOTMCVJv@vger.kernel.org
X-Gm-Message-State: AOJu0YzYsQoNBZj1HFNBxpTHdm5iehnvSIowyhBUwby0j73i2Fc18e5E
	KUU6698qePmISZTiFu5y3hhqxTf6wCmRc/w38UKQ1e8Qfs/4xv+F83xxv0M+B/Q=
X-Gm-Gg: ASbGncvKrRbeF/xFLcDDC1BubIOixkVvGxm3VDPtIsJCB+keAiqcmPp1YCoFlbkTBG0
	ZOE9I9Xzekwx7wS2sZP6wqNd6XGilpghOlMcRylkc53h1owKMKQhrzd81M7tLnPy/RISBQqIaC5
	uEPUBB+Xc6NsE4DvEq+AE3IyP3nCt9I4MW3Ws2htkG00K4Hl9kNObjPPdguD58Kf42RPRFoUu9V
	nxaAyLtdrKpdJ/lUr3LnhIJCSmGLeXb1J+hXDDCDfl8yxLn4w==
X-Google-Smtp-Source: AGHT+IEHD3QLzvDcOs6GEaPLtK0CjxQIL+UAOX1JGMLUKu5xMX/Kk26ddr4uYUVFzFzL6YoejzJpsw==
X-Received: by 2002:a5d:64ac:0:b0:385:effc:a279 with SMTP id ffacd0b85a97d-38a223ff46cmr3254637f8f.58.1734713193588;
        Fri, 20 Dec 2024 08:46:33 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:72db:1014:577a:9e6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661200abesm50165225e9.18.2024.12.20.08.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:46:32 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Dec 2024 17:46:24 +0100
Subject: [PATCH libgpiod 3/5] bindings: python: doc: make code examples
 appear as such in sphinx
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-improve-docs-v1-3-799b86991dec@linaro.org>
References: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
In-Reply-To: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnZZ9kG2/LyWgoR7oyzUjp9XpQiJQzTywxU6OiC
 qcOF0HXo2yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ2WfZAAKCRARpy6gFHHX
 ckcKEADL9NQXHKDslyZRZ3BuHzyrsiuSUVKxAWLHXliQQs9rUzYMpqb/dXNczGYiJlQd4rOnYVf
 O0H6H4S5w+2v4x6Q7tU+yZ/n4twWRXG75LU49tcY2twUGxEJbg9K1FbgxbNID/383edv1Xyte2J
 7QqCgZCw7kEdiM/wVCn6XnN4g3SR2C/xDYFHc7V8ddhl8KQve28rp5Os32Dbbcgij0KVTXGm8mJ
 uQjfmrTHQt9T3BY6mkQYd2E7UqEvE3MQ6oARkH79RmqoB1HvUhzkZ5/GJtll3yyIH6SvNhcNM/C
 KfLmpdDGO9a8HAKiDnR+qgTvvOxJOIXQpDDcZGjVxJPJrt1SbeMuxfTu8TKpEqS/JHzdnIZ/SJ+
 Jel62NzAU7qKy8FhkMWkpJrLSyedy9uu+r7LpYJIlvHIA4KCwHuW5HHrorHkOxXfOQD2BfBOwRy
 u59QPlUbFm9pDLr1oJomiaKezVVUPmmqkheX85e19eBB98GPbIgfmeFFCX7+Juf39RI7mb35563
 75ilWgNDPm4BDFePyLQiOdXax9w5d4nrexc+W3bGeesm7TqSZ6WUbnEmvuYhd1Sb+6USXvsAxkS
 /k1mKUkmRW+uZ1serzhOvNMwAqKRHXCrEDC4v7fFHVLfRRld7g/PAa8dhlojgIOfkiGaimyt7kZ
 kRJ62onxXJBam4g==
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


