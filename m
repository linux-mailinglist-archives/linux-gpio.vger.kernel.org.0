Return-Path: <linux-gpio+bounces-16824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E67A49BE5
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 15:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87E647A6B38
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 14:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A7C26FA7D;
	Fri, 28 Feb 2025 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mpLjnaz3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350426D5A4
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740752723; cv=none; b=L/+3JLqTCqMUbwEjS17YfOkmTdcrUV9I1fYlbKjjQfNozZtehJaYM6Q2VzrX7HbdmS2bger3r2zOVp4OgwO85uaBOZk0k5TGxAK1Eb223lPyeIGfu9qwLbkZOBHsK1cPHRUo9qhBC3hqS289xgPpg/Kc4MsJOZuQMbBChfcIxXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740752723; c=relaxed/simple;
	bh=OD93U5dLFGEXTO1kuTl1runWg69809IBYyLtRqwrAoY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UHQ5+nyDQDoplXvKfwORjHKaLmm3oTJMEXFE9sjA25jGVqd0pVeOVNoZFfPjOugk299EaP9nERQv6ks5IyqG1xgdVzXc0+dzHZrkdr3RIHVLWrzdBlklM8zSrtlPH7lEZrx8UGi7h14ULEH9L6D649vGd6TEKP3qE1xk9Z8gSZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mpLjnaz3; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abf1da0cb66so242250166b.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 06:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740752720; x=1741357520; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFZdL+qGu3Kdlb1WY6EnuiLBqBXq0ImAyg3+u6p9lEQ=;
        b=mpLjnaz37u6hRW9CuZFaKCBU3y9dhSwUPzPJScEqe+wHOkNI2v+Ijrn8zOoYdcGfRq
         1bHzbg9wIbAQFz0VVY2yOFE7jQyAtrllsBMaGrI906reopsrWrlzNsWyPHBwqFlFWT/y
         HYqNdyG8wgUZyROov7LhhHOEu0Tvq4oSOWIl6vFt6h+ROIO4K0NMAnWALk9z0ceCEygX
         e1/z85RehL4FKMvgFPFPSHOSFh4G0ArEPI5QffgZkAjEieFQAs2mefZTNp/W+nhp9p6B
         FJMNT6C1wMnCvHMPvMyxvicm8jvRBfomgYWYn3XinTMi2Gpn06Zi5v77DJ9ntV7ps9f4
         iO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740752720; x=1741357520;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFZdL+qGu3Kdlb1WY6EnuiLBqBXq0ImAyg3+u6p9lEQ=;
        b=fFz//GB9ynmP+Q2qF7KXc3XDr/Dz5zzQN/xNpMqhKoUi+fcz9k4+zDcUiPz1XUBHhi
         LmOAJPAAFTAgSsKtZ4dcXO2CzEfTENzUakO5SsuBL65fEU+bH20/KK6qerfOPUs7TLye
         qYe7iDp0QGbBjmvhWfNxNccRHf4wFk0zx6iaj+GzJpi5KVGGE6USxw8ykhrJRl6Q5RtU
         03ebz0gVtQRZvnNknCT9LCmfR5E9D4VtuhbUWgFYbKH40q4PjkdHnYJbCD++ktVNwD0c
         ZF+fpalzgTfPwu6DOWrWZmWVIRiT++zTOsN3mFjlfodKr0rTRL4EYR81B8DRJ/OBOv0e
         BRVA==
X-Forwarded-Encrypted: i=1; AJvYcCUW0FQbIyT/Q80RwpU35wyN3JkXJewIXTaU3e6kz1Wfz099U021jgobKXrz36EpUHts80FMoRhtHDrr@vger.kernel.org
X-Gm-Message-State: AOJu0YyljmW8PTr9rlvu9Bi+DK13BAkIVLKNmM8ZCeYk618Tk01Bs9xW
	NMq65L5VtmPqWlEipijCDDyfr+DbMOs8MiorlP0I9eG0NcGoM7SVYb+y3lwxj7GqO/tOnGgzkFB
	g8s8=
X-Gm-Gg: ASbGncuPvVy3cUIXQgtF7o3Yqfwk5FBcKaVPvVaaQr+sF7H4giBXuFpS2ryhewKEcAE
	jymUs4gaGV1e0K6KZ6kgCM0sW8kaaM/pEPvzMBb43USLgdPkDSFW5DciGh/n3snrvKJoJLNtCHD
	1aV3gUlEd5Yirp1pm7Ri7uPtS9KAeFf411z4g7AxhkLeFYKOGBgMluFyJRLJzZfSJrdoIEoCkg7
	xbM4NRmeHnxsEf2rQ6UC+EQAGM5YK27wncUlp95iteDs03CT67/GdmXSmcE8xPwTqwOQ8LDtTgG
	6myR3SrSx57OBLpjLeyZuMod+B7ZgaR0UwqaOacldZL9UIKc7H2bgHx6YFG7rUV3/FMKD8bmc+A
	GkyphIvDd3g==
X-Google-Smtp-Source: AGHT+IFyRz2Nj6++7qxonxO3Nf2WD5ZJe4f3ewJ3NG6rh/2TILHAfxTAqIAZeb/hWN4bQCpsEml6Ag==
X-Received: by 2002:a17:907:7851:b0:abf:425d:5d3 with SMTP id a640c23a62f3a-abf425d09bcmr105655966b.40.1740752719572;
        Fri, 28 Feb 2025 06:25:19 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c75bffcsm298754466b.143.2025.02.28.06.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:25:19 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 0/6] Maxim Integrated MAX77759 PMIC MFD-based drivers
Date: Fri, 28 Feb 2025 14:25:14 +0000
Message-Id: <20250228-max77759-mfd-v3-0-0c3627d42526@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEvHwWcC/3XMQQ7CIBCF4as0rMXAVCB15T2Mi6GFdhJbDBhS0
 /Tu0q7UxOV7yfcvLLlILrFztbDoMiUKUxn1oWLtgFPvOHVlMxCgBMCJjzgbY1TDR99xRDRYS5B
 WAyvkEZ2nec9db2UPlJ4hvvZ6ltv7J5QlFxys97X2TSeUutxpwhiOIfZsK2X41PpHQ9GolbMOb
 Cuw+dLrur4BB777OOcAAAA=
X-Change-ID: 20250224-max77759-mfd-aaa7a3121b62
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Hi,

This series improves support for the Maxim Integrated MAX77759
companion PMIC for USB Type-C applications using the MFD framework.

This series must be applied in-order, due to interdependencies of some
of the patches:
* to avoid use of undocumented compatibles by the newly added drivers,
  the bindings are added first in this series
* patch 1 ("dt-bindings: gpio: add max77759 binding") also creates a
  new MAINTAINERS entry, including a wildcard match for the other
  bindings in this series
* patch 3 ("dt-bindings: mfd: add max77759 binding") references the
  bindings added in patch 1 and 2 and can not work if those aren't
  available
* patch 4 ("mfd: max77759: add Maxim MAX77759 core mfd driver") adds
  the core MFD driver, which also exposes an API to its leaf drivers
  and is used by patches 5 and 6
* patches 5 and 6 won't compile without patch 4

The MAX77759 PMIC includes Battery Charger, Fuel Gauge, temperature
sensors, USB Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.

This PMIC is used on the Google Pixel 6 and 6 Pro (oriole / raven).

This series adds support for the top-level MFD device, the gpio, and
nvmem cells. Other components are excluded for the following reasons:

    While in the same package, Fuel Gauge and TCPC have separate and
    independent I2C addresses, register maps, interrupt lines, and
    aren't part of the top-level package interrupt hierarchy.
    Furthermore, a driver for the TCPC part exists already (in
    drivers/usb/typec/tcpm/tcpci_maxim_core.c).

    I'm leaving out temperature sensors and charger in this submission,
    because the former are not in use on Pixel 6 and I therefore can
    not test them, and the latter can be added later, once we look at
    the whole charging topic in more detail.

To make maintainers' work easier, I am planning to send the relevant
DTS and defconfig changes via a different series, unless everything
is expected to go via Lee's MFD tree in one series?

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v3:
- collect tags
- mfd: drop gpio-controller and gpio-cells, GPIO is provided by the
  child (Rob)
- gpio: drop duplicate init of 'handled' variable in irq handler
- gpio: use boolean with IRQ_RETVAL() (Linus)
- gpio: drop 'virq' variable inside irq handler to avoid confusion
  (Linus)
- gpio: drop assignment of struct gpio_chip::owner (Linus)
- Link to v2: https://lore.kernel.org/r/20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org

Changes in v2:
- reorder bindings patches to avoid validation failures
- add dependency information to cover letter (Krzysztof)
- fix max77759_gpio_direction_from_control() in gpio driver
- gpio: drop 'interrupts' property from binding and sort properties
  alphabetically (Rob)
- nvmem: drop example from nvmem binding as the MFD binding has a
  complete one (Rob)
- nvmem: rename expected nvmem subdev nodename to 'nvmem-0' (Rob)
- mfd: add kernel doc
- mfd: fix an msec / usec typo
- mfd: error handling of devm_mutex_init (Christophe)
- whitespace fixes & tidy-ups (Christophe)
- Link to v1: https://lore.kernel.org/r/20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org

---
André Draszik (6):
      dt-bindings: gpio: add max77759 binding
      dt-bindings: nvmem: add max77759 binding
      dt-bindings: mfd: add max77759 binding
      mfd: max77759: add Maxim MAX77759 core mfd driver
      gpio: max77759: add Maxim MAX77759 gpio driver
      nvmem: max77759: add Maxim MAX77759 NVMEM driver

 .../bindings/gpio/maxim,max77759-gpio.yaml         |  44 ++
 .../devicetree/bindings/mfd/maxim,max77759.yaml    |  99 +++
 .../bindings/nvmem/maxim,max77759-nvmem.yaml       |  32 +
 MAINTAINERS                                        |  10 +
 drivers/gpio/Kconfig                               |  13 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-max77759.c                       | 524 +++++++++++++++
 drivers/mfd/Kconfig                                |  20 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/max77759.c                             | 737 +++++++++++++++++++++
 drivers/nvmem/Kconfig                              |  12 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/max77759-nvmem.c                     | 156 +++++
 include/linux/mfd/max77759.h                       |  98 +++
 14 files changed, 1749 insertions(+)
---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250224-max77759-mfd-aaa7a3121b62

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


