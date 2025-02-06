Return-Path: <linux-gpio+bounces-15448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8B5A2A85E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BC4B1889294
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58FD22D4EC;
	Thu,  6 Feb 2025 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ylmppqFf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EA322D4E1
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844541; cv=none; b=atK+L3eQIpbxrqrDICVmHeKqIpySXSWZmbrnX5ujk3SAYxLmIN4jU0Rji7HzQGOcWImlMxdWS+70GJTgY3rRYMgsDiHzeWEO6R7mirkXGiRzsyOc5Yhe2KpeoNNpMOzKYawp6PMlQQth9l4mU80OiRVRDSUW21jgnQnV9hnCK1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844541; c=relaxed/simple;
	bh=WO/IMfzFod/8cBoacm7o51W0b+nlCHHqIWQnuGnGvBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JynfCht0LX5nqpywVZei3a8Z1sicTq1ghJXTMIxGMqaqu2b1EEbwGXsquw0cdjN8oPvBCsCChxEx5/a2ZiYoUfQKrhjdsuXbmb4lmaJpokjU37tQJxGOcPgC5j1K0xtjTQOxgMQGIaDydkHkPagmasamjMIdJhGwKGM5xjpfrHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ylmppqFf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso4659935e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844538; x=1739449338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1BBaXwMfpgsyUobFfQ5GTap8VassTB06r2EoTlfJ+w=;
        b=ylmppqFfiCArKayXuscqCsZ+r0+cTa+Z6yGJ59D5nwFZ/R9z4tSu76Ifc0ultbNyyj
         ZXWyLUkM4rDQzCgl45SsH+WxfkhUmdqHacM81gZ2462d1YR0A0yr/GgCybLYx7nqmFvb
         MEKZTcL5adAIiefoHz2CSDbOjotR531WkyBL332c5V0JX2SySddWurO8l/zf5R1AUZCP
         zE/tOBY0RFquwcP0oDjR7kW7DyUHauwjqrdXXw/oFil2VxTy23YQng6Ww+KEfSpxNIYM
         3b/aQSBAsH14fsW5N3FSF3CZ9atYbzstqrUg+g0g8/FpyLUL4vXAYcGVAh3ZMIywhyPb
         9sEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844538; x=1739449338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1BBaXwMfpgsyUobFfQ5GTap8VassTB06r2EoTlfJ+w=;
        b=DhlBZ/v/5ioeioMzYTtPdikmzGE2ZDk2H/W8RTvhqNALJs5PNkD6GGNe7W6qQC36e1
         bBQDqu8f8mIKnlCSPRyxs5dISrUEi69Nryb4nRQ1eFFPjtKB5wSyGKmbhJq1IyHdU4i3
         FS9AxTX7G+Ki8O2JH9RBDVvj37zYUXWjbGC7TZDX9mOovSh3jqkIpopKAOddR94YJi/T
         6MMIVn2dGV3fxcB7Lh+9Kx9iBzKgmqcnP7fik+lsXzLp3mQ/BPW2eo6NNVi4b6EsT73w
         ohju3VbZZ14y0ozts7XZUI/rEpdyUBhSt6q1ZX6ZpWgwq+str2ENhNa/CIYrrfTKwjSk
         7l6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbKHvm2KwLimzrv1jJYlNQq7OT1JYuG9/RhLR3oq1VDKvW7lXvO3+8fW3bi9T0yqYdevph1BsG2tXc@vger.kernel.org
X-Gm-Message-State: AOJu0YwhpCoLNWIoc/jthFrGXx5DinB2+EsvayKE13uNm/rL0qcu2dPE
	DXU1FGOThN55ZQWR3tijKnRI1qaf+bAa113ZU3/0fm+wwmdBuDCZRZtFg4H266c=
X-Gm-Gg: ASbGncvxSKInx7Sj9QHf45g7ECvze4DSSq2Ezmvxm6aN4VPq3JozdyKGU1Dti8Wb6r9
	6nuWtG5kGg5NlSeQY5edGw2TGPe5Ri/bjXzSGOA3AoT0zPaapCzrqghzZclUOjdAAAP0vCAH2sa
	+Zc/liyTXm2IEcaTWjzzCuXvo2Zc06/a14Mct11HQ2KDH5uLf/M2g4/Mdkcl8h6EWsxVsWBPLY8
	xXIJAB9LpT2iGQG7+rt6Ro70QRv3Xu8PGsJ0leuaxDmMFnditHbbX+SHRD/qL1xayvDhZyaOwHC
	CkUnJQ==
X-Google-Smtp-Source: AGHT+IHzca4JOmSJBmaPXUfWi9XX8jR8+oBYlRCIrRQ79Nyaipf6ArzWEzvHyuJ0LwjZTQZqn9neEg==
X-Received: by 2002:a05:600c:6c01:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-43912d22565mr22043685e9.8.1738844538326;
        Thu, 06 Feb 2025 04:22:18 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:01 +0100
Subject: [PATCH libgpiod v3 04/16] bindings: python: doc: make code
 examples appear as such in sphinx
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-4-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKly610GFGad8wT8/b23A512qXV60i88jIf+H
 olZgl4WUw2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpcgAKCRARpy6gFHHX
 cokFD/44TyNpcANec+mYLed69RjfkfZy5J6iBMuEX0krWLecSxqIzjMw6uw1Ec7JN4ovedyZHCk
 G/v8xiDcYYopsn3yrVWUG35MAn60d+0x3Trj69Fk6U870+JpNrFyHQBBaiZU4yr5j8DBOQqs/cH
 iBFASPK08/XzIlS+NEkwIlmtA/VkI6WQPNMD8cZS0w1j5s+NqTkL3KB0jqVIQP6N79lPk7XlxyR
 IdHMzAU8ywViEC8w6fc9zAnGehzlEm1/K2kb2fSiJzy/4ysiTlDbuSbLZfO1e5MQgLTodK0AuIM
 fh7YfArZxjmm9onTP1RltYbNjSailehDG/p80y0LH4Exo6EouuLj61PFrkp/K8+oq0ApP4mKd+5
 YLNPXHKf5kJlhWLMe6tPV/BR9xXqtwIXK4dtFRqKA5K0jraCVViZLvW8s5PdTLekl/bicuSFLvj
 Z+XizpZHrzpBcVFmzmdC3Pnycc2xEFgLfLxiGeW7j6MKiyTLjutMWgAHxswo8viVR1ufyrzpb67
 85qP9YiQEsf4/sTwbL+cjQfxYYc/XzETKkwrKyzfWNfnLrIxMnz9YHPTr/2VfW4Ery0jNp/zi5V
 dt087Mas7e1m5gyNjUOioa0OK1epNLembcQ0blFVWXPQdBn33rTI/7VWfjqDzGDy/UHyDZLCSS+
 szyJZ3fwA3Jeylg==
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


