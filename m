Return-Path: <linux-gpio+bounces-28390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9546C52A2E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 15:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21DCA4260C7
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 13:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3952723F40D;
	Wed, 12 Nov 2025 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FYMhWJun"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1171523E355
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955743; cv=none; b=FV3Pbg8ksQpc4xcpC1sxbGiXAGhC9ByPd0qB8EvYWMr1augw6nQukaA01Bzoy+N3uWd9ZURIQqs+quHUfGASUjJGJ2eeSxV33I/xNc3HyhA3LqOwT36WB093KWGRVG6qRk4rWrSAO0k5yqTtTUHQS5Jj0/Bro9m5zoCzKySI62s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955743; c=relaxed/simple;
	bh=ml3z2pXKnumVWoVR4wBDLwJ0K3TTyVqmRXtK2nzVm5A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GRgdqdIVFuMabeKEqdF9EQroPaFLDGh4lm20Z09iIo8F5uRqwcFcWysAT9g2FEzvUdh4ManVi22uY3UZ+qcU5gG8Vps09HzklA3d6ShDR5iiUscXF3XrhSNaPsLT24haNiz3/uPY0EK4MXW2f7FUYxROHcnmdcgqXkF4iAUXUfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FYMhWJun; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4774f41628bso4356825e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 05:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955738; x=1763560538; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBFAMrOJQxMwscqUKdzjpajXl7OxXxRyAGXjE2x3Poc=;
        b=FYMhWJunB245ylKDnxfCQ3MPPBrSi3daQCeKtp2u9fAVliGAITs17iVZUms/ZdPwYc
         3a9dv1YW5GM6sjXzLqbH3P2jFzCGUYki9UQAcm8SGxD3apD2sAXYDoHsZsGlao8aNbJ6
         EbVlaoDFdTq2UgsBKiZwjWpOoPK7ymDwEU/thtkznb5n5ivFGLyPFJUBdZBhqOpYMiVf
         68/lKbt/lY2GqOMgH6ry4DAzsxzX5PW3oSmR5GVNRNo2rVBVD2Oic6INPnAzG6PBhluT
         fe70xVhuw/58ZYC+i9OqR0EycTy2TYyuqgNabfU9T7VSdaFJ6d9b9Fk9rmHMbxx+yaKQ
         9CLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955738; x=1763560538;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBFAMrOJQxMwscqUKdzjpajXl7OxXxRyAGXjE2x3Poc=;
        b=rtfScnGN4OE41hRl8LhJRh3L3AWojLMzQA74/J/bmtwmbPx8dsT6GlgBI7fXaaUiOT
         aL+sAcYYVa6VqrfRcXz9KFBR1w68Y8XLhVoK8uYiOcDSjU7XCmhV2zVUyA3BvhHFzxoB
         iOiDViR2q6xdyiHs/Qvyns0l/OE2R4nFZPX+3ZJFke4QDgJIG+WYcPXM6OSntkjTqzJ3
         1cozMdkqLXnqeLSRdnltS9RYOOLxSxz+p66vrIZO4PGaonJkQb5Mx9eUVU0gWRkOX12A
         jmOSdfhB6C4zXRItTIzPk2zzWJqFac0cC5iEoDbwUfqMumv7ZGO47wlHjXTB0OQfBqO4
         Ydhg==
X-Forwarded-Encrypted: i=1; AJvYcCW9NR0l+c4nqi1CDFu10L6itIPhv9+fdOjmVnFz/nqJ7Fc/ja9nKpAeTOBfg9RXNxpU2yrhBTsqUknu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9vIFZeV47dN9O/4Xvp/nzHyOWTZA9GqOKH+vJ2ivieQQ2Trsw
	jn4OxnYmGHsb91ooX/qCV+BWsy3WLLARNfxXQGaAlKPdAjpIF5km4MW3njzXYICoDnU=
X-Gm-Gg: ASbGncuQDaoNis+1573gaqR7EMAB3EYZOyRF2fJcq5WdaUH3dQ7V7B5oY5gBNciNg+u
	4uXLym1Sw4Ek8rDePr9WCoCl578G0MGrZvCa+bb4uitsOawqs6DpiXtUYFWhuUDdb/nk6X9mssg
	ORcOksLiYyOdJkEOw5j/tQy6wphrI+78zFnNOO/Q8/I9Ja0dC1EhcEqaluOx7XFMi5TmZUQ6Zdm
	hnNk1Y24tbARpNmvF0rUnuBSHqZoMcY3fsmEa8xALxa3yGYb7o3xgohzERvqt5TQbZDud2vPZGU
	bQbrRwbK0NQp6w3gzyI81kNOaW+TxdpR2xG1EzaflqvQ8a6m4jhobk3uihvv+PRMfNnly72Fu7S
	s+jT80izPcNdgUSl+ymOOY1DhiHTenQmskeCK3ekO7yXeHB8dbchEjY5sdJqS6G7q3Odg0aFf+D
	H70w==
X-Google-Smtp-Source: AGHT+IFKbQP8SOa1kCByQ4QNAMeH3OJkwfo0T2LCw/ncI1JxiJlrem/nOWVbpAKDdbocGkE7atAYEw==
X-Received: by 2002:a7b:c3ca:0:b0:475:dadd:c474 with SMTP id 5b1f17b1804b1-477814424a6mr41685355e9.10.1762955737889;
        Wed, 12 Nov 2025 05:55:37 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:37 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 00/10] gpio: improve support for shared GPIOs
Date: Wed, 12 Nov 2025 14:55:29 +0100
Message-Id: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANGRFGkC/2XNTQrCMBCG4atI1kby27SuvIe4SNNJOyBNSSQop
 Xc3LSIWl9/A885MEkSERM6HmUTImDCMZajjgbjBjj1Q7MomggnNGlbTfsJA02AjdLQy4KQWda3
 aihQxRfD43GrXW9kDpkeIry2e+Xr9dITadTKnjBqjwYCHllt5ueNoYziF2JM1lMUXcybEHouCO
 6ms5b7tPKv+sPzFzR7L9TN3uqqt88q4HV6W5Q1O6cYmIQEAAA==
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
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5266;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ml3z2pXKnumVWoVR4wBDLwJ0K3TTyVqmRXtK2nzVm5A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHUGKHmIdlssRyuI2zDM2oFpYK4thJPAm+An
 vHpyc0KzgaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1AAKCRAFnS7L/zaE
 w33fD/4wxGJ2NszFom9FCtcgZxRPtXC4TIw0cdgBDpHnMlLRoRgOAjdfUJihy0bw6eS2jS7ljuF
 xl+cvSgGjYZKuVQ9KhCVKpDSqiVJL04dSv+zJVRrShx7nRCM4wF3iMJ6CKgZcNw77haE9dlLp/m
 YG4swj9fw7Huu/DrvNJYEVevDnUOWOUHcq8BBT3F31cqHz7nROXVUOQG72XkSv6qWDmth5+heLG
 RQ4hzKrShyu9Uq6lEtmyGeW/WoCa1Cg2AM25q8a9TF+FxAjOc3lblwDpzJnUFwluqiYs57b60Cl
 a19ONlSGyD43DGZ1PE+RxelEz21/fY/3ZOsVyoKRKs8FbKaJVpSPIJ9HoKEgSnbm6m2k02MGeVn
 KtGdBzVa5LA9oIDJzoi4264FN2pzMc3lCcLDe3bht5K410FQxoMOEmWbPEOMvapBeMyNqC7YDi+
 89I2llq8RZt6kTdrtTsVbIJvUEq2MphlgBo7crobjaqWe4kjaodXe6FZK/UDZWi82s6g5f374Jf
 YQE7UzlHuW0iJeFZjwocqK5NwOQiOen7mVIonjAGkQUGpoLYR1CpLzkEIBsTUm+n/P3QuEy2Ycw
 ArR5jiJEL6GoiqMTZUtZ11BjOQg5A+/xtxylAdWow8iwqEymoQ1S2EreHkiy83bfB4vpkmE9g9G
 HS6Gr22pXsrOo7Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
this series however impacts Qualcomm platforms. It's a runtime dependency
of patches 8 and 9. Would you mind Acking it so that I can take it into
an immutable branch that I'll make available to Mark Brown for him to
take patches 8-10 through the ASoC and regulator trees for v6.19?

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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v4:
- Collect tags
- Extend Cc list
- Link to v3: https://lore.kernel.org/r/20251029-gpio-shared-v3-0-71c568acf47c@linaro.org

Changes in v3:
- Make strends() a static inline function
- Use an empty release() callback for auxiliary devices
- Refactor the code for finding the shared descriptors in the GPIOLIB
  shared module, split it into several smaller functions
- Use str_high_low() where applicable
- Use non-atomic bit ops where atomicity is not required
- Link to v2: https://lore.kernel.org/r/20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org

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
 drivers/gpio/gpio-shared-proxy.c | 333 +++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.c    | 558 +++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.h    |  71 +++++
 drivers/gpio/gpiolib.c           |  70 ++++-
 drivers/gpio/gpiolib.h           |   2 +
 drivers/regulator/core.c         |   8 +
 include/linux/gpio/consumer.h    |   9 +
 include/linux/string.h           |  18 ++
 lib/tests/string_kunit.c         |  13 +
 sound/soc/codecs/wsa881x.c       |   3 +-
 sound/soc/codecs/wsa883x.c       |   7 +-
 14 files changed, 1096 insertions(+), 16 deletions(-)
---
base-commit: 96bf1bb63977b67d1a3e4a3645f857bc3fa03f48
change-id: 20250908-gpio-shared-67ec352884b6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


