Return-Path: <linux-gpio+bounces-27439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA3FBFC1AA
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1614F3B6109
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE481347BC4;
	Wed, 22 Oct 2025 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i1FCsYHM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9E915A85A
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138661; cv=none; b=dtP+cQkGeSptU3ACZXFS5urm47exh9ToMrvNGpcsWpwGYPjrYJIkDz4/yJniQzkIVLr8jnyhMSd+0Bsz3P8R7fabg1nUGp/QGQmnGzvbbmbht7j4I/TACx1Goz7ElR1D6ZHLbMX2ah6fM+C+BOuJ69VOmNlf8jIJCBxC3sHNt1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138661; c=relaxed/simple;
	bh=ahWl67TQ9XpBLPshdCkjxixfaIbnhlzVC6EeMq2/mus=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MilQCdmxSrKyUH7J3aSHg+ON2nHdyBh+KeFzM2NjN2MJY4gRxJADuATysdfSJQsySf9/vZ5zda73hDDAuFzeETSnU2RH+OUTspAowcftIwClLgYumMI1mZBgpjm1ruhaAhCJGWBcgzu/R49Rrkg4iGslRKhJnryYiZ1967tV0zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i1FCsYHM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-471bde1e8f8so17805105e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138657; x=1761743457; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6QXbhE5WpAHG+UuY9oJTJMeHQhbXeGIA/P16dT2l+d0=;
        b=i1FCsYHMdPJD7bStbNA/0d7P1MRbi/6RiPJRcSUSBHOhw5yWJKTleIj3hLncOPzHHB
         FFr8QRYSTy0tciL+Uy0yhc5F0VwqmQ7sjj6LK1Zps8VdESH47efdtrF1ivBmiePwe5uT
         35vs2olm3OTTCnk0CQRSXfpvi4FJ37IBejmY4cryCJ7U8fMFTOKuqK1qjYwXz33XCkIF
         9iV7fAMwG8F0sv1dxwhCUWci3aX3QirchtHIDfc37sOAy6Uo1iofmAK21oC5EOdH7ZXo
         fYbRJ+wiUmf8uIdd6c9czkvt/b9v0KvCGtUU6sOFhymw3084wA3LMST4d1ITxHteZ0md
         q2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138657; x=1761743457;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QXbhE5WpAHG+UuY9oJTJMeHQhbXeGIA/P16dT2l+d0=;
        b=mRg11LM2OBv9NseDG+oG+K1oR3eJSKrKlruulc3RzR5JvldhizjSUXfQxE3rBcdiSR
         nGzHrRP6m0B3mkdi8XWN5Ke0WUMtEGke0SZdNqVbc7q2HCWpic4fsKZP9Gb+r/MeDW6u
         jyS2TT3zDoVrEdD2jRahpq9eVZtdy0bfctVwl//jJ5ikRrRt1Uv4UvyF8Ab3S7QOZa1K
         WyB32COyNglNTZ+yCFeq521kKNDWvFFn4SjX9kJLGRfTt/2z5miKrE37kwGJUPJL6apM
         MPjjhWsAQzmMKm0yw30wtu3TCWNJcro+b7cGyKuSm+ILY6AYghSRXGQFvG4I1LHKVGFy
         3DMA==
X-Forwarded-Encrypted: i=1; AJvYcCXoq94HSr/66VAyTxOEJXtmJilhEG/uV3jPXV7g6HLRbI4tNSk3NxzM3g6ZE6gO0n2e9M/B0poRb/lE@vger.kernel.org
X-Gm-Message-State: AOJu0YwyPYSZGt6P/r8q7NFntkOq2WroCt9Kic1V4fBZ/3ZqsLg4LdWa
	m+NDXy+RNXaiczDCIu36ne28VYjhHYfNke+03MtA9dstGCwbBx+SW7kuthwVL+ENGic=
X-Gm-Gg: ASbGncuma+Gf0TSgCzekWNLPw79S28zwfdbxbeRic2M6VHe31qGHUHGNpNmqXTC9QuQ
	54upjDdAvdeAN2RlAigOPoYcyqWvj5rok5wKCxZzV9ocmNGisBLA15L9IjabIexUlXd0o5/LUgn
	pwkbl0CwUG2TeVtGgi3K81NKzdfq37ex2PPtNf8wqggXJUg28CAe40Ew88Loc/51MAIU1mfOH1D
	gWMyGA8RqBIsuviTDHVZ1rc+M3baJ/uINkv9od02KQ95sbTJnfkYRRrM6roYtXRVLw3z5BObCQH
	IPJIs9nw6/x62jBgzaonb6V1hOn7HfaWywKP0t80ifpFbppv53Uul99ob7XeJYsnTSly1IuD4QA
	rWaOJfvxWfQ8X1IA6kXslNpKObBw5aGhrmeE1lOk8+RGABV7Texq+nR9DAfVRwjdO/LopILEVAJ
	awDjc19Q==
X-Google-Smtp-Source: AGHT+IFdFKFen7tV5F5VONCvLyYsh80AvPduy1QT8kUGqdlbVQ4K9dlnnT93BxJMM7KKevL6B+Uz8g==
X-Received: by 2002:a05:600c:3e8f:b0:46f:a95d:e9e7 with SMTP id 5b1f17b1804b1-471177ab11dmr157009085e9.0.1761138656539;
        Wed, 22 Oct 2025 06:10:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:10:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 00/10] gpio: improve support for shared GPIOs
Date: Wed, 22 Oct 2025 15:10:39 +0200
Message-Id: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/X+GgC/1XMywrCMBCF4VcpszaSppdEV76HdJG202RAmjKRo
 JS8u7G4cfkfON8OEZkwwrXagTFRpLCWUKcKJm9Xh4Lm0qCk6uRFGuE2CiJ6yziLXuPUdMqYduy
 hPDbGhV6Hdh9Ke4rPwO8DT/V3/Tmq/XNSLaTQukONC461bW4PWi2Hc2AHQ875A3Ok0EWnAAAA
X-Change-ID: 20250908-gpio-shared-67ec352884b6
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4494;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ahWl67TQ9XpBLPshdCkjxixfaIbnhlzVC6EeMq2/mus=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfYNqmF4drtJq0Z6oJq+JwZ4haDxyCaNcoG9
 hkxD7YiG8yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX2AAKCRARpy6gFHHX
 cpjtD/4/vho3ipov3Dx5Y/4GxVEafxt6SamY2SVevdOPyKVbKtxd61VbE+zPenLYIVbaV1oj+eL
 ynoWZ+1NQBqGrvwkHD7glUlhTbHSgEpgwGGhw7nyG83I1fRy5dPF6nvsx5MpJfkKlxFslMi59nU
 b/GmBNPzvOXSiNMXZpUgWHQY/ZuPYiRIEGbHh2iTaN4aY8oCiA8iKmM44xm724yXXZOeaej3uJB
 rjH92H+R5jtpHfhWIfzUoRtfNTa9GFdNzjNyrAXstJZchwwPpdAGZ6tIeyGh6imd7jBVBHXvley
 RcyU0+zJ+pbXAGmZEYdZVetTIOA0w1ieMwyp6XSlmVcr6u+B0fwf+rZVDNFPfcr7iIcF0b/0GJY
 CnYRooG9rhhd5kq4/nXV1XFXT6SL5to2XrEpRMwvIQyoEIvFuCUEnj5js8aknvhlj6MQ48vrhdp
 ctTQ55YFo4DV1UuWTJWvWwRWGW7KqewirICWUaJElWOYyCkD7ciyoAZnmULnrK1xBQ/4uLT+kQt
 RW1l3pssUgaQ9HCLaIxbXV7SpPYeQrczIHh2g1VIDCl4yZ6gLwlMP5O6NQkBAcd+cAwfw0IOaxB
 BFHd9m/paQktx4JHi5buXXAmR9fAarg0cDzF++xhOakTscMp1cR3toj0sGqdcNXVf1HYG8yF5/N
 60fFoddfTjDxa+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Problem statement: GPIOs are implemented as a strictly exclusive
resource in the kernel but there are lots of platforms on which single
pin is shared by multiple devices which don't communicate so need some
way of properly sharing access to a GPIO. What we have now is the
GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
doesn't do any locking or arbitration of access - it literally just hand
the same GPIO descriptor to all interested users.

The proposed solution is composed of three major parts: the high-level,
shared GPIO proxy driver that arbitrates access to the shared pin and
exposes a regular GPIO chip interface to consumers, a low-level shared
GPIOLIB module that scans firmware nodes and creates auxiliary devices
that attach to the proxy driver and finally a set of core GPIOLIB
changes that plug the former into the GPIO lookup path.

The changes are implemented in a way that allows to seamlessly compile
out any code related to sharing GPIOs for systems that don't need it.

The practical use-case for this are the powerdown GPIOs shared by
speakers on Qualcomm db845c platform, however I have also extensively
tested it using gpio-virtuser on arm64 qemu with various DT
configurations.

I'm Cc'ing some people that may help with reviewing/be interested in
this: OF maintainers (because the main target are OF systems initially),
Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
in audio or regulator drivers and one of the goals of this series is
dropping the hand-crafted GPIO enable counting via struct
regulator_enable_gpio in regulator core), Andy and Mika because I'd like
to also cover ACPI (even though I don't know about any ACPI platform that
would need this at the moment, I think it makes sense to make the
solution complete), Dmitry (same thing but for software nodes), Mani
(because you have a somewhat related use-case for the PERST# signal and
I'd like to hear your input on whether this is something you can use or
maybe it needs a separate, implicit gpio-perst driver similar to what
Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
last week in person and I also use the auxiliary bus for the proxy
devices).

Merging strategy: patches 1-6 should go through the GPIO tree and then
ARM-SoC, ASoC and regulator trees can pull these changes from an
immutable branch and apply the remaining patches.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Fix a memory leak in error path in gpiolib-shared
- Drop the gpio-wcd934x fix that already went upstream
- Free resources used during scanning by GPIOs that turned out to be
  unique
- Rework the OF property scanning
- Add patches making the regulator subsystem aware of shared GPIOs
  managed by GPIOLIB
- Link to v1: https://lore.kernel.org/r/20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org

---
Bartosz Golaszewski (10):
      string: provide strends()
      gpiolib: define GPIOD_FLAG_SHARED
      gpiolib: implement low-level, shared GPIO support
      gpio: shared-proxy: implement the shared GPIO proxy driver
      gpiolib: support shared GPIOs in core subsystem code
      gpio: provide gpiod_is_shared()
      arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
      ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
      ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
      regulator: make the subsystem aware of shared GPIOs

 arch/arm64/Kconfig.platforms     |   1 +
 drivers/gpio/Kconfig             |  17 ++
 drivers/gpio/Makefile            |   2 +
 drivers/gpio/gpio-shared-proxy.c | 329 ++++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.c    | 530 +++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.h    |  71 ++++++
 drivers/gpio/gpiolib.c           |  70 +++++-
 drivers/gpio/gpiolib.h           |   2 +
 drivers/regulator/core.c         |   8 +
 include/linux/gpio/consumer.h    |   9 +
 include/linux/string.h           |   2 +
 lib/string.c                     |  19 ++
 lib/tests/string_kunit.c         |  13 +
 sound/soc/codecs/wsa881x.c       |   3 +-
 sound/soc/codecs/wsa883x.c       |   7 +-
 15 files changed, 1067 insertions(+), 16 deletions(-)
---
base-commit: 304d18863e6e62a8f2d0350ce0a59596e2e42768
change-id: 20250908-gpio-shared-67ec352884b6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


