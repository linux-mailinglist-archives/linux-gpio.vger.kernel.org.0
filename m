Return-Path: <linux-gpio+bounces-22165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BC4AE7F72
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 12:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 748AB3AF6A5
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE0829B224;
	Wed, 25 Jun 2025 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DuAoz7BD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAF823AD
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 10:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847621; cv=none; b=LkXmMPMGhm4xis+QYdF2RQS2ul90rowzcW1fk2CK+Q5QdNvwLdIypHr5ARJBcn/MegxAZ2/ohJAsBeEr387a70Y4DFipkuxI3+ooNpe2dpOLqa+rPL5FTazkVwMooMBRDvSKdepciqmQ9+kuQzo5r9qS+8h7x5ZGR3OeVWJKf7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847621; c=relaxed/simple;
	bh=42Gx7MVqg9RLVZZL0nQGlW/DfixSJ60vSIokymr97mo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SrYDNANPhEDdxwA6Sdavf4P4KnkvbYJuShIaPr9SbCtzT+yst3ciUdcGnCznB9ZtUoAKQIqiy6x1t9D+VSGXtGyV2Hj2rizCI+ETbmi0Zd56VNGv1xmT6Ye62qpY6qms3yM3lfLJgqiQvpGNOIOnQKIEMNtSnNVC67NZL+OCR4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DuAoz7BD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453647147c6so15227865e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 03:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847618; x=1751452418; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VWUiJJjRPw6HGWUg/XBl52lGHpdjt2Da3mfoNUZtank=;
        b=DuAoz7BDRNn+op6H4XZzfpcHgm/7vaIIRt7p3WfObfn0rlbEFTBB4zdvh3j/EzfgMK
         1wGddPwfvJPjjpHwrfInZHvNdhmiHUA4MKfOg5wtZG9fhjHSdswRfX267IK9zLRm/Yi1
         tzUiWDtMvJbO8FT32rOBW2kAqMpNASnR6x4uT4ZxF/TxagK6LPwGCqbc3I8GfGOWYTLN
         xNHM8Qc5HkmeU024dpjx9/62vj4of04vLVu131njY3J1A82D+bri/HKbXnuEvuxAvBH7
         i4ujnFybqYdD3XzcMDDPD2d/AjOSkQTAXYJP8NNra9SBNYwqDnU5dfQlxw5kq4jXFqyK
         YMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847618; x=1751452418;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWUiJJjRPw6HGWUg/XBl52lGHpdjt2Da3mfoNUZtank=;
        b=NC/Oubfb2rOs1HO5DA1rmlbc+1bBeiasVcW/BQxd//aSA1QrvWS/EVxvNz+5GhrBgy
         azKSZGWfusNDyadQ8oaGs/io2bVcUbMayHOw50UK+swYfkL0P1DI1jmJtwr/oS1PAwuH
         H9VHrwwsfSXI75TJR2Hxp83XnS5LHAPScHQnqjsyj4a5lClNy/GOZbPn0nCG085JQx1S
         Flmew5IPvMFlvYvDL01bmSyti1mn8wzoxj3FgrbmW1dvcaa9btJC7VLphwh4hfWqpnCT
         nADLQqpTvbEtqlbAaMMxCdKywNqZ6ADF191RDrYRFUMkbZAYxXhR2/Cic/kNRW36b1ZK
         pUvA==
X-Forwarded-Encrypted: i=1; AJvYcCUk6sopxArtDjJ5RH9ZOYZgYvfh3quyYNb+fGU7qdXKMfew0kv2AJbQMcByLF690qT5jg0/gV9KJFZe@vger.kernel.org
X-Gm-Message-State: AOJu0YxtbjpCSxFROEWsZX9HHOsUrGRctSU5odtlayoUsg/c90B7lGhi
	XPoeE1KnWv4lYedfoFdzRQS3u85E5PFu9iyMr5t2wUFEPy4l+oCvEEaqucsate2GOXuNiSRdCo1
	isdEzQnI=
X-Gm-Gg: ASbGncvWOWJQPlN71gXa/g5hoTXskd4MUL42CQm7Uhn7neZetD4yZTVKCjBG6JIy5b5
	JEC4wJPHEnYm1kmX+uGykGu5rrUOgnPcDmUXA4gq2J2pVJiJFj8Ns0rvvuiDerx5Mr603n5llKT
	JIkoSqUJ3dzprxrpGKZOU8qfDgmwqoQD/uOmUKtKeseP9LgEoUTZa2zZ/7oYxHjY30nn7HEQbu8
	h1mqU0Rtv/Y/r9T+urusybMzK4grAz5tYXC15H21zc8H6kbQeKWSilrOQQy6spDwdBTO80frz3Q
	HPGXKQAkvISL00NQl6kt3OES6p39rTsSHCwz+bKZHqUzbcsrkSViPNSQTAbTXpa2dcU=
X-Google-Smtp-Source: AGHT+IFotUTj5zcp7ShZ6IoB9WHymxHO7Rq5Lsk8ESCqSS7UfKL93wxzqyd9QmnDn3AYs6nJhvFulA==
X-Received: by 2002:a05:600c:a45:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-45381b0f48dmr20255625e9.22.1750847617865;
        Wed, 25 Jun 2025 03:33:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Wed, 25 Jun 2025 12:33:23 +0200
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHPQW2gC/x3MMQqAMAwAwK9IZgM1aBW/Ig5io2ZpS6oiFP9uc
 bzlMiRW4QRjlUH5liTBFzR1Beux+J1RXDGQoc5Y6nCPEtZDIiY+Ue/fqOHyjtAMgyV21LdND2W
 Iyps8/z7N7/sBvsgfCm0AAAA=
X-Change-ID: 20250625-gpiochip-set-rv-gpio-round2-08862ed27417
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=42Gx7MVqg9RLVZZL0nQGlW/DfixSJ60vSIokymr97mo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B6XbDc1lIy1VT9BCDCPgIvuXS+r0NgLXwjx
 3/PIGOmGaKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQegAKCRARpy6gFHHX
 cgTSEACFaucbwtdUwbgQWlc6On2PxsVQjx1y4B4b4AdaA4k1pQv3Mnkwj5zwmymAtY7xsbo1u5E
 7IExozMIQbhO3mBHTgvqM2xttAWFJoNEe38l/HvCFGOWAokGWyEnJl2XrzrsqKzTtxvd6oOEn8H
 wOhHqs6ZcnnWZiR8YV2uofWZbqn7Hkt/eZPRBzIlz4pwUbP2o2J+dhh5s6glon2J7+CYt+unvFL
 gORIlOItofYQPbdl2rFqKKeTLjyfKeLSIMAUAdXGcUuduoypT2gnYxru40kJEDN4vW+8rFhKFcE
 f0UYhwxnFqaDCdy2RTTB77JOdYKXSSTEYtFaYZj8xQSTTw/ciMwRiiucffXqNk71ASkMiC6cZUy
 cowudu4dzmh3ntG3AoC4HtYdmZ+mJFJRQLdA9O2k8PCh1djKhGJlUr85g3OMkJLe6OjCtOgQejm
 SDZcQ/8bTpwNkDz9w2//nWDSJ9GEdpxjv6xDe6JmFkFgw0xdlFFzw18MXwPIU/aKYWVDTvNoCqv
 uKbFZJUbUX7WrvVFGm5OVRPj1scmPBIJ+BwTdbu9ANkqYCb0T4usSWzvUPNaWH5UhrLlYBv3t9I
 Y8xJBm0XUvvEmU/RxOdrHzvSL0shP9QjkOVLCU/ozuc7IMBna+xP/0StXa4JPC4s9eQ+RlX/9/1
 5yU3ObdZpXw9csA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: sama5d2-piobu: use new GPIO line value setter callbacks
      gpio: sch311x: use new GPIO line value setter callbacks
      gpio: sch: use new GPIO line value setter callbacks
      gpio: siox: use new GPIO line value setter callbacks
      gpio: spear-spics: remove unneeded callbacks
      gpio: spear-spics: use new GPIO line value setter callbacks
      gpio: sprd: use new GPIO line value setter callbacks
      gpio: stmpe: use new GPIO line value setter callbacks
      gpio: stp-xway: use new GPIO line value setter callbacks
      gpio: syscon: use new GPIO line value setter callbacks
      gpio: tangier: use new GPIO line value setter callbacks
      gpio: tc3589x: use new GPIO line value setter callbacks

 drivers/gpio/gpio-sama5d2-piobu.c |  8 ++++----
 drivers/gpio/gpio-sch.c           |  9 +++++----
 drivers/gpio/gpio-sch311x.c       |  8 +++++---
 drivers/gpio/gpio-siox.c          | 11 ++++++-----
 drivers/gpio/gpio-spear-spics.c   | 21 +++++----------------
 drivers/gpio/gpio-sprd.c          |  8 +++++---
 drivers/gpio/gpio-stmpe.c         | 15 +++++++++------
 drivers/gpio/gpio-stp-xway.c      | 10 +++++-----
 drivers/gpio/gpio-syscon.c        | 33 ++++++++++++++++++---------------
 drivers/gpio/gpio-tangier.c       |  6 ++++--
 drivers/gpio/gpio-tc3589x.c       | 11 +++++++----
 11 files changed, 73 insertions(+), 67 deletions(-)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250625-gpiochip-set-rv-gpio-round2-08862ed27417

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


