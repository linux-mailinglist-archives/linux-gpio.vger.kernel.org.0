Return-Path: <linux-gpio+bounces-17938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F41CA6EB04
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E50616FB59
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A724C254868;
	Tue, 25 Mar 2025 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xpmSvU+Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523B8185B5F
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742889776; cv=none; b=OgJitDcxI7fvgdIh862SUizs787n3d+0Fi9blbbhK2uHRn7yoIDGbHb+GNlvTBJIaqJrOV+nBYENh4WQR+2wExdIgnoEZGOBJ9yhQPU8+BffPRu57+SxM4qOmU6N/OFgqz7ho3CHELwSuHz1hwuR1/5zikL/xZBwFV/jPEhIWy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742889776; c=relaxed/simple;
	bh=fnJn1n5cC3lO5qK+yvd28vbfNIP+jolvcrh664PQTpM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TIFALUM/7iVaDJFSRQ2W8VNul65x5O7PP+PTyriyUEl681PwjVAnPB2g6ndUrl2AmX95CNkbZmLKt1yI6mG/o3KI6ySSYPQrikG0E5AVt2l9wh+B/ARYzun+Fo1WwvC4PoswMVjzyOVVH5YL5gt299pdUyT+de0haZTQh7REuOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xpmSvU+Y; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso3649299a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 01:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742889773; x=1743494573; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KEEhhgNwBGBOp2aDar0YIKvMrukvujn7rY7eFpRmo7Y=;
        b=xpmSvU+YqKs8cwqQKWp/2CXgz3yvhWm/Q8ii8ijRJapUhebteUwH/BH6RADg6zX/VR
         uWMRTiOA7B2Rd2pk0zBaXufvAM5u6o4RRuWWA4y04cdKwB7DOW3/tY/A4bHNfS9mXDsm
         z0DJyy+bGqCGyOr0gNL3aY2rzP32/ngIoKBFqhow7bH/OTM5XPsq8e2f+hbubXYNnjUB
         JierrvK6alU4ivJvQ+MJa0GcNTrIhiHkBbTVKt3MRRV3ZRaRJeK0FvnpMT1pwDdcMqiY
         gjOXm0vpfMIlFKKCXbwcw1ekCtLvGf/2uZS/5WuCqUV9xj0xM8DJRBHN87zO5Nie24oq
         mRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742889773; x=1743494573;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEEhhgNwBGBOp2aDar0YIKvMrukvujn7rY7eFpRmo7Y=;
        b=YHvP2DTL2/GoB0Ya3uSQgNBRQbkHrD49+861JHLffvqaFnNRDjAFPhYXI5vBDk5bkt
         YdZGbKWdEfPKb0b/4AGXDX/ATP8SXHWxtkOBUQ5vmBa3jwfhGFqyeN8V7xHSW8OchkKv
         cE5D6pG34WIXjsy7mygRuSw4QU0TkhkRzhwJdYEIVqp7KFrdnwwnjw3B9yC4DQAi+jt2
         iJYH3NlWDIPOsypf1A6MQvtqa0Ytft9U7Q+JFsEdqoQCLUX7B6UPOr28iaDOB2p+DDB2
         NnOFyMY+SwZt3K89nIen/66kKtofejhirFSEgl50w1dCjhAyJpjU1W0if+38Ol7TMawO
         rjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU401jsRfDYYvg6DtrEM6hPSkyAitFzXDf4FOvsQJp3qFMxlveFxz6ZvCwWwwYRF3f+LGbF9s8knW86@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx2muu1nsADf+5Wa8aATknlChHhNoIlXNrrnI6AYYcWoPY6kJE
	IQX5viGRmSTov5IpibW3ye5+ShDn557iKOO8O7iJmsv53FWJ56M1Npehoz7IHSI=
X-Gm-Gg: ASbGncvSgzjIW6HrcZ3pYRSLhhEStM7if0eKcFcYoGa72ODsEzum+1cUOT1+ntZ9OAL
	k0tC/HOW2j4fNzn6CaLLZ45i+CfnPCV0cMiktS3xzbKlLf1pZ1/mgnFxnH1gEXZwcY4qdpZ1mNv
	/0BA87slTB6Ii7U/c64JQ6A06CgC8FT99Nwl99oOYdnMt9LGOaAj36SQ5+zYjdl+hw9MJPFAhso
	IcH1jG0WVZLqLz2AiG+/GWr9uUpHXMoahiDv7d2UaUaX0INcUXsSiSlrtUHBADdMGx7Zqldki+u
	t8JhN8lkXb/67r4Xv4cTvN3ggeWCWzHFc7tA9Sp2QPCcJAFrDBBzhLhhc+Tt6DgmkKDxZ72xm4s
	uDQ4ogAf9fwPibxqFhVlkppTIkzC+
X-Google-Smtp-Source: AGHT+IHShC3wMV0FWHxrl7mVrEyihFCWXqhDiP8Dej8ATBjXvjSXNTJUgtgCgNUNuyPtbLpQHha0Dg==
X-Received: by 2002:a05:6402:1d4b:b0:5e8:bcf2:832a with SMTP id 4fb4d7f45d1cf-5eb9a017617mr19531945a12.10.1742889769098;
        Tue, 25 Mar 2025 01:02:49 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccfb004fsm7446785a12.40.2025.03.25.01.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 01:02:48 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v5 0/6] Maxim Integrated MAX77759 PMIC MFD-based drivers
Date: Tue, 25 Mar 2025 08:02:23 +0000
Message-Id: <20250325-max77759-mfd-v5-0-69bd6f07a77b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA9j4mcC/3XPywrCMBCF4VeRrI0kk1vryvcQF5NbG9BGUimK9
 N2NbtSKyzPw/TB3MoaSwki2qzspYUpjykMdar0irsehCzT5ugkwUAxA0hNejTGqpafoKSIaFBy
 41UAqOZcQ0/WV2x/q7tN4yeX2qk/8ef0TmjhlFGyMQsfWM6V2xzRgyZtcOvIsTfCp9UJD1ahVs
 AGsY9j+aPGpm4UWVTMnNBgvQYH+0fKt67MLLau2LWu8Zto1zn7peZ4fA90ZRWMBAAA=
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
Changes in v5:
- core: incorporate Lee's comments (hoping I didn't miss any :-)
- Link to v4: https://lore.kernel.org/r/20250312-max77759-mfd-v4-0-b908d606c8cb@linaro.org

Changes in v4:
- collect tags
- mfd: add missing build_bug.h include
- mfd: update an irq chip comment
- mfd: fix a whitespace in register definitions
- Link to v3: https://lore.kernel.org/r/20250228-max77759-mfd-v3-0-0c3627d42526@linaro.org

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
 drivers/gpio/gpio-max77759.c                       | 524 ++++++++++++++++
 drivers/mfd/Kconfig                                |  20 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/max77759.c                             | 690 +++++++++++++++++++++
 drivers/nvmem/Kconfig                              |  12 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/max77759-nvmem.c                     | 156 +++++
 include/linux/mfd/max77759.h                       | 165 +++++
 14 files changed, 1769 insertions(+)
---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250224-max77759-mfd-aaa7a3121b62

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


