Return-Path: <linux-gpio+bounces-15743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE741A30C4A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CDB83A60A6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DC121E0B2;
	Tue, 11 Feb 2025 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pbA+nxeQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BD721C9F3
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278784; cv=none; b=auDCVq84Ai6wT76UbdVO4EsyyGKVGYzunN/KtN0NyzpWtf650ZHLaYAQDJkfohpTonayn+0bto+GXl2v3eJDccJLjUeRXEMAvKycWl4PrNTOQIovxvB51MkBrgU00lF+hWNnlB2WO39g3b9s1AYT3y1vhTS3ecCSddyRqEf6ORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278784; c=relaxed/simple;
	bh=WO/IMfzFod/8cBoacm7o51W0b+nlCHHqIWQnuGnGvBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TYWk4w6gNXGCBegKjG9Z9Obsk1zHHPWckGP5AhvA9miUrPPRmKwNV9+UVEzl3CyvWh5ndsTskRwS805OpC9rs7z0VV7qoUQ7qtB1gtX5pmYQ90EXdSl6KniyHBhz5Yr8Le4mnQhKpG99KiAeNmrpGeLetyIWeT7fSbXPSLBlcKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pbA+nxeQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4395561ab71so4909655e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278781; x=1739883581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1BBaXwMfpgsyUobFfQ5GTap8VassTB06r2EoTlfJ+w=;
        b=pbA+nxeQeyz4sMGkr0JMF2mS2AWCxWwUSAicGbjkcM9VgR0Qa8JpE4DQ1LzDGPJWEo
         vYjBg7NgKxGemq2NrrJWGwPSH5E9adX1su0wg43ciiRpBYc+JmJKpjyQbzxBzjMLbiQA
         U6ll9oqGUMRbtjYnWj81/vhvYaYKNNj+iXRqMnqHf5gWZiGkZNv+buuRCOE1/0WK4+mS
         6wDKlEA/S6KVk4iLvg4KZytt3Tl0zZGnS1c8N9UNwh+fhp1wpx3HhfsmqMjfhS4o2UYs
         TS3DJl2tzRicYYY8CGHf2ycvXtho8IfSFl5v8F2zKeE0MhRClDuyYloq5XLoYWAgs2ub
         aZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278781; x=1739883581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1BBaXwMfpgsyUobFfQ5GTap8VassTB06r2EoTlfJ+w=;
        b=jTPB96pq9wK54WlVk6modKFrGv5V84XGokncn9EJ6Tj+SeVYVYYjCmUaeUCcbuXmmy
         X0T5IincGLMGUwT3BJHqHBDfwvFazVDdfB++2m7pVh025HP5US25VVUh5woLaV1UONw2
         C14eFdNMtbomFIWoNcypFuX8a7H+6Wd1+haR5dmY9E1BJZ27/W828U4p2i1RgTHPQ/TZ
         KhgVeRTxp6QCvBSUqF/s+7PFMICb14/jubRjH774Ohv3EtYPg5Z3t3Y7JfWfd3Rwq8o3
         2NNrAcImbZww58ZeaTz27D5jhD9JEcdvzIYGW12qhyQJO1fniIXMyD+TjrLHnkHNY9Ff
         5esQ==
X-Forwarded-Encrypted: i=1; AJvYcCUownHzxpu0nZWP2Syu2me9rzJOFH8bO4jDiLVOLYOH3fg8mAXzrN6vMw5eF7Pp2NVQSVcwdoxYML9X@vger.kernel.org
X-Gm-Message-State: AOJu0YyKTM2dvZkTuaadtM3BN2fxXdS41dDuAG0HVa4gNgg7g2wwuGbn
	dN3pgsju1Q9ZGpf4gAArF+Ve6x9SPK8rGWEkIoeQBZKx8GX2PBogFAaLTovOPMo=
X-Gm-Gg: ASbGncuSsAaEZ8M+WB/0rite8dfRBlM5dkuQimMJdLCBUhFUsKN6vK/7o1lTx+MZCXM
	tQRlONdnUu7iHsJaZkd0vvRlgymY2KmlndvFh030qqzmin24WhZQ/jujNfpY17eWPlHappoGyvC
	2+GnTQTZbwWBlrxoJHI5xlDn5WEwzMyJYhc/656MPmPchA5fsnjkGIRt8vfgRNXTp5WFWCZGaLX
	epPr89UFyOckKQGGwnE1v+AFblShPge8BMB15Zp0BXf+aZG2AdJJdCfZhvWCMY8TvwEYrO5umqT
	duZCBSc=
X-Google-Smtp-Source: AGHT+IH/QqzP9Fm57nRToI5S4Xs7Fzxt4LrLCGSWsyZt/UganCDt1UrDuC4IjVlIOzrgiiUABagnDg==
X-Received: by 2002:a05:600c:1f09:b0:439:4d37:7f4d with SMTP id 5b1f17b1804b1-4394d3781f2mr26389495e9.27.1739278781231;
        Tue, 11 Feb 2025 04:59:41 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:25 +0100
Subject: [PATCH libgpiod v4 04/17] bindings: python: doc: make code
 examples appear as such in sphinx
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-4-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m1ZEyXxUBzdrty2YlMBQBRMHQ6Rw+eRN6gg
 3EOtwDB2lqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtQAKCRARpy6gFHHX
 ctfrD/9qt7oKWLp7IkQFBD+KrgWJpAT+fSPY0IZ65u48y3C48ynkZ5GYU2LvU+nV2U7y9blMyUI
 7EyRboA/dumjZe1AsJ5x14PzQGe6vD6+fXcPjFGOtPRPdlunROqwr3CS803f048BksiwzGNh/9/
 FaAH/+YlCSz7GSGTinQbQpvCjDPLMwJ3Cg98mnPJd0Ifym+Gwv9z04Ck8aMIjbSbkXx7bxO6jAm
 KUVClS+UaFdNknIdHW+rGv8gDjxaDtI1idrc8zfYaul2zl+Bdy3xuHk61lW1272AgYTyfc48SJD
 2JzTyLsOfSvIboGmVcmBBJ6dHHW0E0s1OGdwpjBp2Vm3BpFxwhhAXvBoEleAQd9g+UYLjAI9DSf
 t4bIEy9fHBxyZk6HTqliFzXd89F777VMBk28wFp9xViq8tBqwp7TKWm5InIETFx410YjxbQNt9b
 UOcREH6zpLxEmA64cDMdp1muGEUnZYpxbTOn9OOKD/2VCf6PJRUH4dI/mLSugMVlGhKLoOqmPwh
 IyR2D9V6trqV5oecI5u0vhnP3z8reYvhctwR3c89xYQ9wNyqxPUpwnSHIl9kwqPvA+M/lfwL+Xx
 Ix3QUzNFSvWf4kabf4JeZ4YiosvzgUwREd7UP/VX+5IVr8t26Pk+JgHIH0vIjSHcj7uMRTNDb2N
 DkWzQfXDRu9Zm8g==
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


