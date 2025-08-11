Return-Path: <linux-gpio+bounces-24192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B75A4B20CD6
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 17:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A14E24E122C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FA02DECA3;
	Mon, 11 Aug 2025 15:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qJzRfZAb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF041D63E8
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 15:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924531; cv=none; b=ilLsXSnxWQi+QssfgFeQsk/e8E5iNgo9mxPMIK10Z/RHtbHc/psS0zdgs8ZxQFifrgAl8psuwYWtKeyrdIHlmb87UEggstpPkl9LieTxYRgbTgA5Rptqzauo1csXyIOtVQU/05/GMdDJG3MRdmrN7aypf+H94MBWchSm4kmTl6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924531; c=relaxed/simple;
	bh=o4Eo/zy/CDLQ6xHxEmWPUQyDRccG1SfxWwIAZkyyDsE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jshRRdbpRYP3xoCnfWjlBk2mJmfzwEtfdvBgasUxa+IgRCdlhZj0QENuww6c41VfOvlxFVzkG2MlCH0A4/ysmKRuwMNZG2z78muVGRvT+mEJaEuLTB6OV6aqq4TUs751IGqNZ257k8VBHDgo1G5CKEkk2pUgFyeYZJJ4Lc5bGAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qJzRfZAb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so28381155e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 08:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924527; x=1755529327; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zWxxJB41GipbzcLM3187/KnwqQo0+hqj/Nc5bwMNpJE=;
        b=qJzRfZAbr6JFzjyIZAyoIdjtp85riksQrhWCWvC/U8eB6LlRK6JzCaYSVuc3ChQKAS
         G3eLHrRmk+K2wGFf72nL0Eoa/1bGBbhtemnIMh7AdnTb9r8nK6Z/kVdXRqaED/Vd2S9G
         jTwZ4DnLH+mQ9TSTy/NV2eMZJSfWkvfwmWNxIgo01jFoGVXtSeAVlhDx76QBCHecyWtc
         pz34KngCsZfP8anrfG4jLnNGC8VRiRAUYkcMGcVxc8306LFqMbOgMxyc711GuJLeef16
         O0Qh32E/b13hGn11kqRSr0UXNfecPcRMKZD+3Li843QmngVPRKJf3L7/FspTue48XAHX
         LavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924527; x=1755529327;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWxxJB41GipbzcLM3187/KnwqQo0+hqj/Nc5bwMNpJE=;
        b=baZkNQOjyZmqhWfiU7RTYOD5hs3MeFLoVMbOMv/1qG5ein17OKQu8/yNmYUQsA406T
         fqKMPWZV2WJUn3Y7a2Hl855LQ2CZQr7hP5f0BfE9QGUcO7Wb8bJAw0SpIXX8or7hJQqi
         sGGN5gtRjITqCpEDcptZnndnpiegdHdCDS4Kp6oBRqP/NySgmKPs5Novjxq9E0SnVqFF
         I+2T0nQ57jmz3b2+bOA6Az8BytfJns18l0SdjEoYztbVwGFrhE7m+d4C6CBZ6VLr6sdG
         kqVXHH9tEmCLC+b9Yh1SGLxinSIIbIk2jHpwVFv1UVerMOTG9ZdHgzPRrkh7ZJWzewId
         0wHQ==
X-Gm-Message-State: AOJu0Yx4DUm6lqF40+kLGomyfuKLXumK8xm6HrCqFZlO2llCrM2DDZP+
	+C8r6gwIIOqrwqReXaU/ujgb4CWrVLQg4UzYl53C9kzbQ7SaRTnD2+3cAiEKh+OZ020=
X-Gm-Gg: ASbGncsicXJk6BVxGjHHjmmDk/p7pIOVoVrQnKlR/APtQB936NLkwwoG5uUcMIB2f6D
	sZl0VE0N1/qPODFD653acR+YFeOm7qMivmxVuE1f4DCoIJnZaVxAcAjFFRxZzSWB0XEIxmtXx4K
	8iuoHCjDOpqWruCRLZYF0fIGYeGUwn6X59u2wYJiJDxBryLXw0lcKgqkNq0wePvuPsBNVFk0kp4
	hZ725M7897EWF/nNTK5r7WNXS9gfPSt1IxQh2/eEn7RJJE7feXKLNRQDkewgL0XyDZbKJnOeVBw
	DeiwFgDoIaJbgwXnIpnQ4lBqpFd3ox57Y0hRN5hwPie8NE+9I4NG7j/UHNrImcA80WlEsFScSEn
	1T9vKRoaO+2Efk61d
X-Google-Smtp-Source: AGHT+IHYAg5/y7zzobnnTviyWJZ1QSB220ScxMwZP0hCZAAL8BDUWTjluWnaNcHujIv1yztB2rpJiA==
X-Received: by 2002:a05:600c:4f91:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-45a10bef8e5mr117525e9.22.1754924526966;
        Mon, 11 Aug 2025 08:02:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/5] pinctrl: replace legacy bgpio_init() with its
 modernized alternative
Date: Mon, 11 Aug 2025 17:01:59 +0200
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOcFmmgC/x2MywqAIBAAfyX23IJJL/qV6CC62kKpaEgQ/XvSZ
 WAOMw9kSkwZluaBRIUzB1+laxvQu/KOkE11kEIOYpIzusgBz7MistdXOlAHX1AZYe1sRD+Shhr
 HRJbvf7xu7/sBAPmAOWgAAAA=
X-Change-ID: 20250728-gpio-mmio-pinctrl-conv-ad0ff8d046ec
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o4Eo/zy/CDLQ6xHxEmWPUQyDRccG1SfxWwIAZkyyDsE=;
 b=kA0DAAoBEacuoBRx13IByyZiAGiaBeig651OieRFfC30/uCVO7y8iI2KgimJW4RKqVTdYrjxp
 YkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJomgXoAAoJEBGnLqAUcddyU4AQALGs
 Woi59UlCQe+wBauzsU3IX4K+sRo+vEk2S5EOlNJTfDlw/+bxQrkKLPpVFW2papWzPwvwfKoHmk2
 o2PkOmUxcL5/zR3kV5czcj+EYf0Mo9Oo9EyP5zNHD42fuOai8TqncXDUpSRiNeWemMBVI/tqXEo
 S7wG6bfTJQWhZydCqJrktOIPmqp/94FlLd6Gdb/gDJDsbcotGrzqmVbfwCVZpRcEschG+8Cs1l5
 XupJgXz7MvXDzozY6innrdxmciMCCdR/i+mbWA36pxXLAM54PNTG51/1W7kqh8kAVqki71SKRsn
 NEjPtM7HRTWaYBq2Nvq0eKiReBwgq4lSlm66feUhPx4X7HhMDWZUJ5+RbWbmFF9OqlioZxGJ7ma
 kfN8Wkhf+4Bm1txc70R52AD5uceubTlslFxZ6xdRW3ybaNy+eJ9w5qUzgmQVLXh311cIE90D01O
 gkWr+AkX33bicivR5yTraQDAB03YibkGswLnA6H6z4INNJKKpiwS7KnfPsXsWfGR3+aMSYgEw5p
 vh83ZU7yXJ2tHsSyEVAxax3riPxInwQ3Md6oWpWgpgvU+GO1eMkVhduz9VfMwCbItzRABIVAViC
 7kV1OuH/pn0B25k5kJIslZu2sakYxOM4LY9k25MKF9/BZhmzYohzC0fdFo2TBc2vX6DB4qvOfNt
 6okKU
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

We are in the process of modernizing the gpio-mmio interface. This
series converts all pinctrl drivers calling bgpio_init() to using the
new variant from linux/gpio/generic.h.

Linus: Please create an immutable branch containing these commits once
queued as I'll have some more changes comming on top of them - most
importantly: removing the old interface. I will need them in my tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      pinctrl: stm32: use new generic GPIO chip API
      pinctrl: equilibrium: use new generic GPIO chip API
      pinctrl: npcm8xx: use new generic GPIO chip API
      pinctrl: npcm7xx: use new generic GPIO chip API
      pinctrl: wpcm450: use new generic GPIO chip API

 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 181 +++++++++++++++---------------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 154 ++++++++++++-------------
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c |  44 +++++---
 drivers/pinctrl/pinctrl-equilibrium.c     |  26 +++--
 drivers/pinctrl/pinctrl-equilibrium.h     |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c |  32 +++---
 6 files changed, 232 insertions(+), 207 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250728-gpio-mmio-pinctrl-conv-ad0ff8d046ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


