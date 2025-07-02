Return-Path: <linux-gpio+bounces-22587-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC80AF0FC4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D40B1C27B54
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36212246767;
	Wed,  2 Jul 2025 09:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZWy9KPXs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B9124466C
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448139; cv=none; b=R5+a40r6cAsuZ79983Sgd8PxaYXeXQOdh8O0b4YsEiWwH6NiY051Yx394XgwuhC4T08S6+I1mZX5mzEXX4C6cWKz67yaQx5tM0kkfJG9o83q8tjz+F9Zdqq7a3vl9UioC8ZW7xTB+Cu63mDnrs+GYbW+c8Oy44ILHDZwey15bpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448139; c=relaxed/simple;
	bh=IDsUBmMl4vmxwpChddfz/0o/3m8yos2rsQrr3srBtqw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p97rP8edrqbBeAkehCymtDL+tOkbZxOAVuaJFP7SwBmTm1Ddaf82yEw2ZFPaYPjSJyIETVIOr4g4bMEdYf8gtYVw6/GcqriSDPZRpCsNVUQHaux5i1S4xak7qeawOh4qIl4ung0NjQaTTEcMJebw/TXUnA0G0v14pQzqTpkf3y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZWy9KPXs; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so3625228f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 02:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448135; x=1752052935; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dJOUAJfKVX2aPL9IEMk2+/CliU7l5+z7z5St/kFtJDA=;
        b=ZWy9KPXs2kBVGqLFM73rAglXSVZ4aEJR000c+aDcNkdmuBoleFHMt2Zh+toY5sq2fj
         Mo88IYoYft/nikZ+T4nxudGx4YQl1XlgDVwulPuI6WpqVDqJVI1nLfPWCFvd2IUOl0mG
         H+4l+tBN/C9BYoYO6j3m+bPyawAJ26EKk2CPfP0/jha0IIGuClQ3dR/dinbqVSh7iidU
         GI2pgKgetDDlM5lhRJpYn2rGSQM9TKDmzHl7BdYQpNZfaKq0+SGRyqq6p2dRbx5fCgE9
         v4jOp37kD7x1OpLuIe2K6c3YLww5ebBYZfDNplp8mzY8R/G5E2NP/zR5JzlrHlw4hovQ
         fg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448135; x=1752052935;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJOUAJfKVX2aPL9IEMk2+/CliU7l5+z7z5St/kFtJDA=;
        b=gpe85XCAqMaC/V+UAZ+xrSjFdUGZ3iriNcMwr8nJMLN0I6dcnAVn33fP9o+zRO7zti
         KTIW4nUrOg71YUeS2hN20epk3e/pdLZAgHhUb2LwOc7e+eDfmPL9Bc/kJwit1Gx+e2mO
         g1yJSELLpOFECdNkE7rgyhaBmDjH4kDTWjV29cxcwz0aszvKMKWk0kHG/0MoLSIeTsZ5
         Zo5i1ZkwKOqc9WiBclefjTLW2RN8UAu4b60E+WTpJh0IDxmV3ktD8jOEgOW86e68SPxl
         H+7WDwp/fr6mcASTffJPH08PtuUStVjGrDhrsPdESbgDugY+mQfiy1ZPPchBlaY15Vd3
         YM2g==
X-Forwarded-Encrypted: i=1; AJvYcCVDqSTl9M0gTFxlI0yx2DlRJ5p+tG5EnammjMrsYhMcwZmFoMzm3ForoQUKTBCvDUp3x4IeFUlnDVRz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4FptpIZ+r4tRDZoUSMvkzCnlfR4aJY+Nf8Qar/oeCBwHU4HFb
	oDBmZqVjnr1bpl3le+6We1GZmq34HE1jNfPqXFCWJ0iZ9UOUyU2KhuD7mMW7y+E2inY=
X-Gm-Gg: ASbGnctr0pZGVo2OOJuaYwCTi4xRvsKDFk3Tzs/rxPsKDTJpvA4Xi+BRoSU6ndzrA2H
	1Fi+iUmtNZlcQKRHbQQW0oTKQWQigodnYuhy+5Myz8OhIexqByyKsSM/COYt4HGFWFJdtk05Q5Z
	dqxFUVR+ssla9c1ioQomX9yahTAwAZu9kTwbvc8Or6iDPsT3XmXFswVHCAal7CGHnz0YlzE01Ah
	SB7pWPAyXRb21w7Nm5dM3nfMfvwlNLhPyszyI73R9PjvlPz94DzVJv41FmfNdZYxuhlVwjQhWP3
	R2JgqCy0CiBITNaEXq62acMa5t2MB4x1/EO0zsUnVyW0K6jy4Q/AAJbJAT9SRsvY
X-Google-Smtp-Source: AGHT+IGRtI5EizlyYaagGIEM5B9cIXG2G3RtfcUDuM69KE2zVYdf1i0pFG68QB2VU8jMhrLhfO7HYA==
X-Received: by 2002:a05:6000:188c:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3b1fdf01fedmr1581155f8f.5.1751448134571;
        Wed, 02 Jul 2025 02:22:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/8] gpio: move generic GPIO chip fields out of the
 top-level gpio_chip struct
Date: Wed, 02 Jul 2025 11:22:07 +0200
Message-Id: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/6ZGgC/2WNwQ6CMBBEf4Xs2ZqyAhFP/IfhsIGlbBRKtgY1p
 P9uJd68TPImmTcbBFbhAJdsA+VVgvg5AR4y6EaaHRvpEwNaLG1lK+MW8WaaUig/vd4M4VB0xak
 mqitIs0V5kNeuvLaJRwkPr+/9Yc2/7U+Gxb9szY01xJQj2rrH8tzcZSb1R68O2hjjB2ELMa+xA
 AAA
X-Change-ID: 20250606-gpio-mmio-rework-a2f4c439aa96
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2506;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=IDsUBmMl4vmxwpChddfz/0o/3m8yos2rsQrr3srBtqw=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhk+kPIvzlcY34zkh2Nj4PaZstktliKWBcYWZ3+v8XzOCbDD
 IkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoZPpDAAoJEBGnLqAUcddyvM8QALht
 p+0/5kj0hAd1GH7XCSJQj1xtclo+EbYwl+bIW4Ppol5rzy/Ww+YmiN7UfX/LQmQM81ByNclCOk8
 8yVuwOiCUfYJuB5mKWYrWLwiGZCFX18PXJaf2eDjbSuGXxBAaq6sv5p6gWUjzkmKXGd3R1j38FN
 2MP84vl/De+q+j+gS7qOICkoFnew3ASVw+Sehu5b9KiRNdNyC3RyESwRBvE+rSiB/SxJWGVmRZQ
 Vd9BDYTEglata0+NQUyij9ENWct0NzUdygyVwa6a+M5y/OfxRgVizsGIUuKPJh42tXK+7eENAaK
 lTDM+bpEsrkroP/o32TIo2RazbpVv+To7qR17XNdfdoWNiqonSruJF16yPfZ6l4mxaLX9vQB//G
 voAf3FRniA6ym8jCePwxqGGGX0mJL29lHxiMCItsnkBLbZKbQhTGq4+VaLcletzTe9Ydtw+1bE4
 skQO84IjV4PI71bOpfgrvkBRksQGm6k0+urSfW9uzq0q4FZG+yjdZinvNUniWeC6qByqdtnilQU
 LPZ4zjnM6y8hiw92JS8Y3Xfo26+SY+49p7fL2tBZgRwAIJGe9eH7aaKFgcJB1OSccqGFDWIibKV
 27KSY1CtQxooxZ/ZU8T2Lq+5lDJ+omh7OW8vD0sPCBItzUdDE/8lq9GMhFs/KZhZWVHmS9EapOa
 xcgFa
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The conversion of GPIO drivers to using the new line value setters is
moving nicely along and we're on track to have all the existing
providers converted upstream after the next merge window. There's
another piece of technical debt that bothers me - the fact that struct
gpio_chip contains a bunch of fields that are only relevant to the
generic GPIO chip implementation from gpio-mmio.c.

Let's work towards moving them out of struct gpio_chip and into their
own struct gpio_generic_chip. Doing this in a single series would
require some ~40 commits which is way too many to review at a time.
There are also users of gpio-mmio under drivers/pinctrl/ and
drivers/mfd/ which would require cross-subsystem merges. I think it's
better to do this in stages over 3 release cycles. This series adds a
new API for gpio-mmio users, hiding the implementation details and
converts the first set of GPIO drivers. Once upstream, we'll convert all
remaining users and once that's done, we'll move all the
gpio-mmio-specific fields to the new structure, convert the internals to
using them and remove bgpio_init(). The last step will be done in a
backward-compatible way, not affecting the users.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- rebase on top of recent driver changes
- pick up review tags
- Link to v1: https://lore.kernel.org/r/20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org

---
Bartosz Golaszewski (8):
      gpio: generic: add new generic GPIO chip API
      gpio: mxc: use lock guards for the generic GPIO chip lock
      gpio: mxc: use new generic GPIO chip API
      gpio: clps711x: use new generic GPIO chip API
      gpio: cadence: use lock guards
      gpio: cadence: use new generic GPIO chip API
      gpio: 74xx-mmio: use new generic GPIO chip API
      gpio: en7523: use new generic GPIO chip API

 drivers/gpio/gpio-74xx-mmio.c |  32 +++++------
 drivers/gpio/gpio-cadence.c   |  60 ++++++++++-----------
 drivers/gpio/gpio-clps711x.c  |  27 ++++++----
 drivers/gpio/gpio-en7523.c    |  36 ++++++-------
 drivers/gpio/gpio-mxc.c       |  87 +++++++++++++++---------------
 include/linux/gpio/generic.h  | 120 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 243 insertions(+), 119 deletions(-)
---
base-commit: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
change-id: 20250606-gpio-mmio-rework-a2f4c439aa96

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


