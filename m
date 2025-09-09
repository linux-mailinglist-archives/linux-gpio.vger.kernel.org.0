Return-Path: <linux-gpio+bounces-25782-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF269B4A781
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76E8816572A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F2628852B;
	Tue,  9 Sep 2025 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iH0gXyKH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6480A2D641A
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409345; cv=none; b=ts+PKCp51+yNiSlg20b+GiTYjHck9yKms3vqzvnCcknWClsdx5YtM5L4LVfFQdS4lgl9vlBHy194fm4pj90NoQdPVTJ25pEBK6Yj6sonl12VRPyPvvOijtSHsNqqMmIM3Ui0Mv+hwB0bWrLeOXY/4zUD3EKqU7ZL0Vr/GJDfHGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409345; c=relaxed/simple;
	bh=sVPlOFYsePlUlVyNjlOXy8QPDA01db/Wvcm9y2+eUf8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QkYXeHrV2hCC10RuBAA6Dy+YFdjG+lH3TjdqLabASbB9GL4GaRPJ7988zQ/htzOEfi1QWYKmp7AGEnL4B4fBzf+AGnqlGLd20fM9kxiwEDAqCKjrDNHklpyT2C9t/uuGWJrcMmE1KoSJ/mkSnxvFlDqPxUyBeDTpq1YP66Wg1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iH0gXyKH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3df3be0e098so2920046f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409342; x=1758014142; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tP+ETbVnBSQFrRZK3WwBGuGE5HSVEMwxjNtKrFEHY8A=;
        b=iH0gXyKHBnyb9tjp6vpWY6VlMKF9VjNqWlXcNzWKwy2TsIqGZBr9gVvwaerHG7s3YL
         llS6Po+PrsliYsRPf36fLQELla1i8Ez23T1TnmL/NiS/kbZNYaaTQmanlMyb4kSLoDFo
         oYu6GwgL8kAiWfxCUXMrc6pUl9pSxc9schRCdYfXEch3LrPfGpHBw2cKWX/6WmSwik47
         gMuMFr0YQ4Ce47tGt6UpXP4iTdtp/iA/DHKBjCRSVCKZSGlIxuKcc4cJ9vdjathWgh4F
         kWeCRbMfrYHHdMagV7naFnIfMjWaFCh0X8yy6XOLcb9mDk9Vrzrc9tqDDIZAorgPDnoQ
         MdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409342; x=1758014142;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tP+ETbVnBSQFrRZK3WwBGuGE5HSVEMwxjNtKrFEHY8A=;
        b=pK8ug5M1CsKrqlVE0bFNhdSxFhoafbSYDgEELycp0BMyMofplT+u9okVPODGBFWzMD
         qQtBgqU+tP6lYX9Mv91CjMy8RjQIzB+yQyj0hOV0KeP8gtw2hwwldUoSuLbDtNtqeNkV
         T804BXKAu75eVsktRYiUDhK/6npUEhTIbMdiF9c5jR8IZkqyvss2ZvmTplVF/0UVWFXa
         pW2q9jeFwn8LqOdTXM4+GC6m/9UEMOcQAHfkroSn5ye5V0D/9uDy0hXyKiZpE3ogpsEf
         6l5ptX12/oEDspBSMXKXtloYDrvCDWdkcdrzZUkLpj0ZtxHtec3GkJ2eEoLGIKxlEwpL
         Azow==
X-Gm-Message-State: AOJu0YyClEiTW0UBWEaHraxeD347pMbX014CED+tFrc13a4s1aR6XRjh
	tXCEHm8aw0BIt7rdGLcHGOJKcjVk+2C7kJv9AmFt6jlUucxCF7EA0PGwPrKZ1xTgFvo=
X-Gm-Gg: ASbGncuDaD9+ebrE0IMsWCR9Plb1jGWiiC2FM1urRQ5mgPlc8HiYF0pv5YL2Hv8/iUZ
	pHWyhg2EeS96a0VHaX+xM7HKzxA6BsvT9wPZlx+QNfbVGvGni3jbJwU29OpGFmD/C3PdRARtuWY
	f2nZBNkNpJcEfPwYthX+f6CQ6B/ce8GOenEyAUVzhaBA+5QE7G3EurCG9hAzj6XmhzcLbLL3Mbu
	WX82x4MHA2vgjMbQN0rkk5D5/F1sxspXA0wwBShfoancEKX6VMu1vH+f8+n4qIDWnzXU+DH18ah
	nGu5KRDPaFBX3dUjdG8YZ0qRKmQ8sjqwu58AQC28gSHvA1nDhCak5EcgV+dTKHqIHCU+utF/4zY
	lMdNOVsAue1h46bc3Sg==
X-Google-Smtp-Source: AGHT+IFxM+HICQsKhDaBX2Rk22xBRkSqIHTShzXPmAQzNiNBdQoOhni1m43entJS3MAB8D5d0TZglQ==
X-Received: by 2002:a05:6000:3106:b0:3e6:116a:8fed with SMTP id ffacd0b85a97d-3e64bde97a5mr9793821f8f.45.1757409341378;
        Tue, 09 Sep 2025 02:15:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
Date: Tue, 09 Sep 2025 11:15:27 +0200
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC/wv2gC/x2MywqAIBBFf0Vm3YCKIfUr0cJqsln4QCOC6N+TN
 od7Fvc8UKkwVRjFA4UurpxiE9UJWA8XPSFvzUFL3ctBGvSZE4bQ8K81xQuzK6fBntRurV6c1Qb
 aPxfa+f7b0/y+HxskalRrAAAA
X-Change-ID: 20250904-gpio-mmio-gpio-conv-part4-5e1f772ba724
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sVPlOFYsePlUlVyNjlOXy8QPDA01db/Wvcm9y2+eUf8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/Ays28j7tkwm0rJbaeX4j6Qex2lOj/LqMAOK
 1PDzm34psOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wMgAKCRARpy6gFHHX
 ciEyD/4rjlTpLHFFOAETzbM8BZ7x3WlTsL5ofRL45hTWSkD3Bsd0OZjcixkAe0OHW2e3zFw2szF
 KeXpnt2sCS7J2vacxQtg0jH2fWZAf5bZ+OoGUTAieReshYzmxRi1YJFUgIrAX33d2SDzSvQrZvR
 VCG+aKnwtsgLIS3bpQ1AqNCIuxAy4Ry9lCAY3GF9UpNsbYioHxmLpykb53ferurCzD0dP9d2FfA
 qniXI92yE/VlFaWTo+gqGjUntxHg8iOH4ZhmUCDpE+Jd4zHfEBtw+OfWRmZkRnTp79FeNdacHx5
 p6k4r4XWU7dQ7BVOwC7MAvwAE8H7OI0viWBqD/6NVLyk6JNskJqsOwu8e94Ddt2gGDw0ARDpeD+
 I7mJlpyD/qmL48+7obrP2XRtew+5bs1uUUL9Agv17b6I59tLZFIO+8lix4XEyj9/Fg2w8cNkyZY
 c24JWXw0s0j+0JaiJKzZ5d6j7Bt4uYvxV2CCUoJ7bN1qi60NyHcPYrP2AwQ8sZKU1xtPedwTG+O
 KxwLrf9Cweg0/cRvkk6QQ82ss5f+Y7QsEwe7HuuKRKPRU9azoXk5BTPKu4ym9w5yjZDgjO+RreU
 OYdfHdNscHAHrLf43/UNtW2sSEmvItWokNn8tfM/e/oZXWUa6NjPf7lUXt62Wdv9ck60Df/2/bM
 oqEJP5tTEFOaNGA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Here's the final part of the generic GPIO chip conversions. Once all the
existing users are switched to the new API, the final patch in the
series removes bgpio_init(), moves the gpio-mmio fields out of struct
gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
the new situation.

Down the line we could probably improve gpio-mmio.c by using lock guards
and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" or
something similar but this series is already big as is so I'm leaving
that for the future.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (15):
      gpio: loongson1: allow building the module with COMPILE_TEST enabled
      gpio: loongson1: use new generic GPIO chip API
      gpio: hlwd: use new generic GPIO chip API
      gpio: ath79: use new generic GPIO chip API
      gpio: ath79: use the generic GPIO chip lock for IRQ handling
      gpio: xgene-sb: use generic GPIO chip register read and write APIs
      gpio: brcmstb: use new generic GPIO chip API
      gpio: mt7621: use new generic GPIO chip API
      gpio: mt7621: use the generic GPIO chip lock for IRQ handling
      gpio: menz127: use new generic GPIO chip API
      gpio: sifive: use new generic GPIO chip API
      gpio: spacemit-k1: use new generic GPIO chip API
      gpio: sodaville: use new generic GPIO chip API
      gpio: mmio: use new generic GPIO chip API
      gpio: move gpio-mmio-specific fields out of struct gpio_chip

 drivers/gpio/Kconfig            |   2 +-
 drivers/gpio/TODO               |   5 -
 drivers/gpio/gpio-ath79.c       |  88 +++++-----
 drivers/gpio/gpio-brcmstb.c     | 112 +++++++------
 drivers/gpio/gpio-hlwd.c        | 105 ++++++------
 drivers/gpio/gpio-loongson1.c   |  40 +++--
 drivers/gpio/gpio-menz127.c     |  31 ++--
 drivers/gpio/gpio-mlxbf2.c      |   2 +-
 drivers/gpio/gpio-mmio.c        | 350 +++++++++++++++++++++-------------------
 drivers/gpio/gpio-mpc8xxx.c     |   5 +-
 drivers/gpio/gpio-mt7621.c      |  80 ++++-----
 drivers/gpio/gpio-sifive.c      |  73 +++++----
 drivers/gpio/gpio-sodaville.c   |  20 ++-
 drivers/gpio/gpio-spacemit-k1.c |  28 +++-
 drivers/gpio/gpio-xgene-sb.c    |   5 +-
 include/linux/gpio/driver.h     |  44 -----
 include/linux/gpio/generic.h    |  67 +++++---
 17 files changed, 548 insertions(+), 509 deletions(-)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250904-gpio-mmio-gpio-conv-part4-5e1f772ba724

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


