Return-Path: <linux-gpio+bounces-22062-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7A4AE6662
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 15:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17DA2189A7FA
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 13:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385882C158C;
	Tue, 24 Jun 2025 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iCrMAB/c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F72C158D
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 13:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771666; cv=none; b=bG1ZGh7wUp+wVlObkQJjxuWk1BNd/avrjmug3VAQx8q0k+ljVQFPhBxXIZC2Q3CFXInwCZvFfG5nPiMcFCAp1dp45aPMsT3Ko+DYE0RBLkyOkA+13v2jauJ2FX98/iovM1v1JddqrK2IWF0vI3GU9F3Q3Y1QLSBpvUOOwqPCypY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771666; c=relaxed/simple;
	bh=VxhS9gurOkU7dhnrqdfaQjeE3vC1wsKbo273ZJFI/qg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YX0mEooD//+8eehrg+E5rWp5pjo177yUBI50AP2AEdZtwoByekOxaSHjHCucElFcvLyEYKCUEhxox8TCQMZgnApx8/dPmB989w9oOWjd6YFXn8uahwL17mEoEmY6m9HvoqhKXCirN5QkkdvFa1hw8ALR1ZJhp0r0aFNOTzqs+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iCrMAB/c; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d6ade159so39873875e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771663; x=1751376463; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xr5T63g8kad0hyUnyb2z17hPNVawJrKJl2WFA8QSKgA=;
        b=iCrMAB/clz2bsbScO406uzJ2WFUDhAry9YZgsLAXyF4pg34yEWTqJCe2D8TPOA9JED
         H1MrNDtSdhnwKiPObiiWvazF6zBHHTamSdKFfG8M2GwLw9afnrsBhn8aSYrDUp72PMz9
         lC931xJKVCEW27QTiJLRWRGjDSwTfWNj4RDgXo+jUtVyjRJqARNrEU+FYMxIetm7e2AJ
         g1eI1OK9R2+kVu6b6E/DeEnSKPVv7xTFaOr1uNk/BENiP6CcIO5X6rQu84XFXPzBamkf
         FBLZSEkOUx7yzvwK3aELZz4brMOunfzL1wYjyQPvZT4Im7y3l1ZSlfys+GMeFNpVkju/
         EmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771663; x=1751376463;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xr5T63g8kad0hyUnyb2z17hPNVawJrKJl2WFA8QSKgA=;
        b=sCTQocTvLXA5/GjrD9krNfX5SkcihKuwYAzblOyim7NZRabMzzxlkexBJBLzQcG42K
         OvB8D78jg9ybzYZPEBmfKsiwwAGRrx5Ir+rVQa1QQHNBLz7aWz+H7iC0wLUiDT9wRTFv
         iZeKNwuOoHa/lOftB82iErghu1xCvraOf6zyN28E+zglPddoNErLC30JfMZ6P/LNE2DJ
         cCYAYmov83MtQr4aVwvJTRrnAor5vhwAxyyiLk0dgi1v0txJEc6Sm1timqIwyfkphSNP
         W5IMIX8hjgUPjk8CBz3n/t3kmXJLK/sCzhurH8VukrKVhjDuTL7cvCi9Kwm9jvMci3o+
         e+IA==
X-Forwarded-Encrypted: i=1; AJvYcCULSPqGkuOgLQPtYxVLBEzngGPEy3qoTrwDe8fWU4wbc1C2EGjgslxjeqs3f1l1EAVh/MdMu6zuegmS@vger.kernel.org
X-Gm-Message-State: AOJu0YweX5cmjiCcS8y5L6Sb9UrmjHEON0eP6hbHqaRQC6/mxLTu1vIs
	RbapYI4/UQTA6ilxcxFM8TQFYYiipm3q+0D7ycNcdQardH4WjnJzb0FigWU0KZloerA=
X-Gm-Gg: ASbGncvILdG3btXm4jIsWooNqS+PeIDGOIep3GbS/MA8BT0nTHVb21SD+Tq1FUen3dV
	jcTb/mKFnVIsw0HzZSERmjTuuzYs1TC2quRJvg1coVpkA7mb/rXiQf8kdKcpSY5GJWwBl2KxClx
	Bv/XfPE8biKxPURetmj4/GflhcF9vtiseSvnrf/PYDO7oSLdnn3PJOn/KGVJN9iMIKaLZ0K/8yS
	a3Cr9kOIa/vqt3AVx3IFbjwnlx6LNqeYv8t1IUoRPM6jWE3j2J7S76lB4+L4eXCf22xsBcknYBA
	LzMuAsmjCMTE8zQfZ0qY2NypPBEmhhMGyB7rTvttsgX4hHZRKoYd0zR9LGM2bujgVg==
X-Google-Smtp-Source: AGHT+IEDM7qOcKUT37OmwC0H/zYPAKAnyMCScrG0HcioRFGKCbILTeRWcj8jgXSKnFtTmxdDjlYJ5w==
X-Received: by 2002:a05:600c:34d0:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-453653af999mr201047715e9.9.1750771662650;
        Tue, 24 Jun 2025 06:27:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/8] gpio: move generic GPIO chip fields out of the
 top-level gpio_chip struct
Date: Tue, 24 Jun 2025 15:27:32 +0200
Message-Id: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMSnWmgC/x2MQQqAIBAAvxJ7TjArwb4SHaRWW8KMFSoQ/550G
 ZjDTIaETJhgajIw3pQonlW6toF1t6dHQVt1UFKNUkst/EVRhFDB+EQ+hFVuWIfeWGs01OxidPT
 +y3kp5QNurW+8YgAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2322;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VxhS9gurOkU7dhnrqdfaQjeE3vC1wsKbo273ZJFI/qg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfLb7OwZ4HoG17O7P/urNWdrBoinBpsIVoHj
 cekug/KLz+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnywAKCRARpy6gFHHX
 cnc/D/9PCW+gsjiIgn490oa+jnPJD+8w4io8zZhK7ur+9dSFoHj7XWiEIaAl27clpuLPBrPt6nu
 JI14EVBCzuZ1+kaNqlptszH2MGnao0O1MwoK9+EuUGvooxWSqTZrzk3HuWTP+yd26KOdCh8R23v
 v7aEe7Lw7sBztpqL3jNhJN1V9TBFU0nfLPPubuYPZbBV/USJl/WWPsLp/VrHhB1W8epxk4riaqn
 MVEVTthO0CJVrln+8bKcCGnbtyEYqpx/MXEEXcZv5Vqz7qjeB4Ln3czVmaRKv1Rp7LQo637okNr
 0v/TS2PFvb1MR/E/r2MkMJFNRT/oVusI1aZetjTAWJEZZsOAXN8OqA/KqImhme2zYKFtHtrG7UL
 FKkSl3/Ha3WwQfLgezlYM2pGsb+0jB1vvDZvsiH4akvOATvZraFmcU/qaUreg4VJS0A1VStYybh
 0C2yHb080SuZNuSId7npX0tQDuic/WYP52ErevWPIzMYtigtMvB1YVCk7W2X0InchRziX96iRDy
 Y6DzgxAc0+Nlt5nMTCFjulJeTXJd5fuQkM+E5Xu+ZqvYbEz9TMRcEOCYBTjg5aNzN6j8NRSu4sy
 BBIOemcsFWzWjV/zERunvVPf/WtXvoRdh3KZcXv7Q2jcaewL7hKBx6SX1BtXwNomleKEEZfDjX1
 6ESLphE+meiLFbA==
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
 drivers/gpio/gpio-clps711x.c  |  29 +++++-----
 drivers/gpio/gpio-en7523.c    |  36 ++++++-------
 drivers/gpio/gpio-mxc.c       |  87 +++++++++++++++---------------
 include/linux/gpio/generic.h  | 120 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 244 insertions(+), 120 deletions(-)
---
base-commit: cb908f3699fb137e28017a8fdf506c35762b3eb6
change-id: 20250606-gpio-mmio-rework-a2f4c439aa96

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


