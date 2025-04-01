Return-Path: <linux-gpio+bounces-18150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D69A77B39
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 14:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68F8C7A38F5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 12:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A1D203719;
	Tue,  1 Apr 2025 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xeQfMXP1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FAF202C5B
	for <linux-gpio@vger.kernel.org>; Tue,  1 Apr 2025 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743511622; cv=none; b=gYTpnQXJ+NWgMMQDMoH/KMRrAuJv0aGsf1CYGuePtuoK6PEs372sZ6wh59ZHko5zQzXI/oEUMjdZ+H7BjG6IOMg12NSnjMICksMp4FMlnPcyTAx9or88b0aOmAYA3tiXH2PZsOjIkgb18dIXO5N9eXTEHw0SyN1MKFAt1sZumk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743511622; c=relaxed/simple;
	bh=JkOG18MioYu8ChggNN0A+zNlGCZjt2SjnCv8Qzb6PLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mTEgpnj0/FZh90c1OyD4NBKxtw3HvhKjlFnXjOg4kbNBt+KsCsLNEmTYtDcgPQ2vRoKli7OcjFj4IKJGlmCB0WaGWRXWofB+536e453cStsCQOv05L87sXOeaWnsYRj4O7n7rb30ti65db11kwTMkCwlQ6R/4MZ4takUReTnPk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xeQfMXP1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so55218375e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Apr 2025 05:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743511619; x=1744116419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O973o4r5OZyC9BZfOU3kqAN8fnVRgLDLcQzrk76LOqQ=;
        b=xeQfMXP1+fT/dsZ0xON4nKlAB108A1G3BTNUsTi3Zr+VhS0DJOIbMT+6/DQK3dKjdt
         Vm/X5dVOvqrsCRs7Sa894fJcv9sD8l1ZPPV3hlicjdJEM9h1hnhhtW4fTvBei5wsv3da
         THHFzkVzn+fF99o+aUt9trMfVsNyUH3/5+1P/a1OgjpzrbHwdJd/rRDOkBDFlUeEE5rO
         lmlyGk2gIy+fx/wMlbcjrIDzUxdwm7g6Q1BjNB3aLlbEQ9h30eqPECm/0NMOQVd9Dy7w
         NF1dEWJByf9SI1nG5RFsv6IzccGmXibQc0Nwq0qUTRJvnnsEeuqeSaqExCj+OZf4CykL
         ii0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743511619; x=1744116419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O973o4r5OZyC9BZfOU3kqAN8fnVRgLDLcQzrk76LOqQ=;
        b=WmVF3FQk1Khftdyn0EKFXbFQ6HdY4EWjDS7wHHQK157Y2k99E/M00TOgYcUKX9mc6f
         6O+P55IjGUH0ZHkqWsgjn46zPQTcjEFtNOGr0wAIjjctGuI3WAqhCXHvw7a25y+SIVlv
         yn0zUx71ixtbfDLwsbdYfjE4UJRvjxfSALOx3XFW8upEYhHxncLPwX7ata4NAIYbjzvx
         yWfU3Slu9/1bmhgwycGShkBZx4PnIctu5q13ILa6t/FNklLxVjTRvQBjhwfJGSO6E/Ki
         UFAhy4xIIQIg+izM6RaR7Z40lxyfCYwKr9sm8IeyvC0ndXOyFe/3cENBExqmlhOPqL31
         LE8w==
X-Gm-Message-State: AOJu0Yy/b9F5y4gYejUxyNAytNLo39rRefDehgCqV3MmDObWla0EobJo
	htCrmj4fwWDch9LeSGu3n/fnDxIZm62MqeEpoE6Y/qwtm8vxQCtigZyqWlE1ZAI=
X-Gm-Gg: ASbGncs8fMT4AgOqLuJSREjqs5hDcP1RD8UlodN9tdnFW9mcl8lySyLeqCcPtOAZYoz
	X8RvIbqonHq6Aw2Of7fB/x5IniGkrnjL32zuokpLkE88tzL1scMH2aqexGq7411BT0qONjZC0gN
	TuSbhIkgRromG+A5cZNSZn7fSdU6siJ8zeGmHXj2NfDaPrioeKVBV1DdtDcghx0MbhxVtVm3a8Q
	gvrn//NJGbkyyWXwMGv0jlyAl26Bn9xt0oLaX+X8fVrv18mIE+uF972MnKjkr7S3hcFfY7WgqJT
	AzQAZKeumVce6LNKzFi8ldDYSx3k0XNjV7sx
X-Google-Smtp-Source: AGHT+IGVViAJd2BFboWMnm9/8gwix+c7PzYTgEUC6yQjbYfGsDLLy/NtUnA6k9FYa+zAPP3wsDcCTg==
X-Received: by 2002:a05:600c:4705:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43db6249861mr118603305e9.15.1743511618977;
        Tue, 01 Apr 2025 05:46:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a1d1:bbb:e2a6:2a9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc1889sm154711095e9.16.2025.04.01.05.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:46:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Apr 2025 14:46:44 +0200
Subject: [PATCH v2 3/4] MAINTAINERS: add more keywords for the GPIO
 subsystem entry
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-gpio-todo-remove-nonexclusive-v2-3-7c1380797b0d@linaro.org>
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
In-Reply-To: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=814;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pMJ2ejTqSuURn65EkjVC6Jv3tiwHgCNsCp47X6QxcOY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn6+A/8aahbPoNTEGgiXVAM+kIMRz0Jj/rHociv
 ncxAtmlNaaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ+vgPwAKCRARpy6gFHHX
 cuVjD/9w9IWz2tPsJvuXLNlGXcEOwMrx5we5lWrKpa1ucn91TaKhbSMDIwDWLTFYTa8KVmecYoy
 GOJyr2FmbqiwVZpBAaTJujcL3bUOC/PjRJBKjwxRPgaQ29yJ6tKGtM3buP43qbO4k9/VErmP8H5
 pD+MnyYa+weouY3ePnyogo/i3Q1eHLfzvRSq/alQkt2WtuaC4HvpJq9NXlst6NTn4wVhA+x+88p
 NApBI5Pe8Z6suGEMarymJLqcQaJGSPbvCPcPvnUgx4xBrdeEbUGCM0EAz1996YJt95nKsI4EGga
 xHi6zntJ140VEyEMkub5+ibTci+MpTRu2qNg4muvHXcA/gihai3tAYgrEL0pUjNB6sSCQs8Stwe
 gOQb7A/HysiJC4BqtPOSdHSxukW1SVd+KrZYkSyi5eNB5QZt5sU3FpqlD++mKp13Rgr2IOkysOG
 gD2HgnD9ddn/86bGA6Goy8vtLNrjEmDTFT4TX7ICMbYhZHGbHDmscbNP4EbK7SV29dak3RJqHaO
 w5vkvgXCQR1lJbZXJLPWbmf5z4gWkt/Ciao1Hj/m7itrrFAX3zj4A7KTuI2NURcG0iy1zmKLqIn
 NTuubW/CcR6L3A3wkhlkOEkz8h6dsFNSk00N5D338VQwNj2rBEVaFxs1rFaf73M66swsyesojZH
 6AjiN4QHkfjMpRA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add GPIOD_FLAGS_BIT_NONEXCLUSIVE and devm_gpiod_unhinge as keywords to
the GPIO entry so that we get notified if anybody tries to use these
deprecated symbols. We'll drop them from here once we remove them from
the kernel.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce2b64f4568d..0ce265332577 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10151,6 +10151,8 @@ F:	include/linux/gpio.h
 F:	include/linux/gpio/
 F:	include/linux/of_gpio.h
 K:	(devm_)?gpio_(request|free|direction|get|set)
+K:	GPIOD_FLAGS_BIT_NONEXCLUSIVE
+K:	devm_gpiod_unhinge
 
 GPIO UAPI
 M:	Bartosz Golaszewski <brgl@bgdev.pl>

-- 
2.45.2


