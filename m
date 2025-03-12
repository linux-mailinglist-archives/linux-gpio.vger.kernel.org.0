Return-Path: <linux-gpio+bounces-17480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 690E1A5D958
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 10:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ECAB189BD04
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 09:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F378523BCF7;
	Wed, 12 Mar 2025 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I7e/l9JF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E6B23A998
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771577; cv=none; b=F3qaDKTJhBDZ63BPAerBOoyBosj3AATuXrXlwGgk+jiEAihmBT538MAyrEnqCCpF5s3qmF9IoqD+GplDieknc2JEQaUXRMRdU2AAlYzfjBGhYN8sg1D63AlS+l0ioUFmCk49j83sjmulrH/3aZtNXp2NIvHoaQ8yNIY7iuPaT/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771577; c=relaxed/simple;
	bh=WrKCHVU9WeE23NeOMrdhi+N2H8I570pU6Ew1AKLcPyg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d0SVoIVaUqms2CPLqdp0dLznfsA5qK9lVnp348QevDdGTLhyOIGNXhcDsZK5J3q7S3Dd5zvyOSX43079phqvTckQbpYkoX/rEAZnzhaNFy6eWHXD4lkn1RcFCTI5/foSBL/aWKfHJSWBvA6K8uL6dNCCtl67HH0CYNM71ZKEeDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I7e/l9JF; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaec111762bso1266416866b.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 02:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741771574; x=1742376374; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lfobpgc3Deyg3z2F30QYKZenkvsowTCFz1IUvtrFV4=;
        b=I7e/l9JFBGWxUbrBYIb4KZpPlvnLot4Ae2gGS8Dso5uL9snVibcdocOt1MxJtC7BqI
         WytDUEZERenf/tCfvE8bzFofzLY4gBhXryEqMleBJXzdkqj1XxDHD8Buuy8L63tSF8ul
         CMO6fpN6yL+0AUV9SkUjYaZRfgTTulYyanMc9afNei7bWqJDKX9ODNH6rPDeZ/9Q4co8
         lxNuLUVNJDmetoIDzsnnZmQXf3zjpogJvnhaFVuS5iGVGk+8U8jJzYxZONjmT37orvHg
         b2IPJphha+8BsSl5dUPYwuFoMj3klPAxfgdk+Pcoa/a839CcYbL/S0xIMewgYbaCEkqi
         XGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741771574; x=1742376374;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Lfobpgc3Deyg3z2F30QYKZenkvsowTCFz1IUvtrFV4=;
        b=v4KhA+Dyc5dqSV/52Zb11TP+aCN8DqoEhyT3dq0b5S19YqD6K0dw09IOHR1MSmGIP8
         oXzFMjf3UkT1Z0RL7CqpDKmXuHcKAwTgRLNubM6SKQqYSIEYtd1AgGJN6Yean+DJJgBt
         L9nMN+JqHzgYMTvq3KQjIHJdu2i47woXlg7e4tXYdw7zJDazqR8pLSzBPKm8+vo1oWwb
         ERoeXagSh9JOX61oKSGBUf4epCAGyz6OBfbD+LNJ9AppxAhDIxGcJjxRhJAB8Ztunmnx
         1mWmVWOjVKTvl8/Jbz4kLdXv78GyBgjjITkp5O3EknWIfzaEiT/jrou1wiZaMzPov3YC
         dZfw==
X-Forwarded-Encrypted: i=1; AJvYcCXyHPd4Wk9ULJx2YbZ1BKZnj44EQq6O1w1cB+1pEi5C1rwZzChHhJ8K0WPNGu138fxH3YYztAldRuj7@vger.kernel.org
X-Gm-Message-State: AOJu0YzHBbXSMcNgUB05i1//KBjhI+PBSRYbwVudUQDiRWJfJDjTZn64
	CXetyMxuZleuM0TpR1p+HLuT0A6koxEewKYe4nG2tTpMfAI0cnmX5Ab1UT9y+AU=
X-Gm-Gg: ASbGnctPdTccPcJRWvY+szLwbo47t/BqioF7qy6m+Gzop12lsR2x6Git50gYo1Xj75A
	SbiqPhfYG+fGjt0XbgLp6xK9jFsd/Rp3Ys0qlifDUItaEz3+xmdJ5j5AuREVm/k+Tp3SFBgWJUT
	+W50jw9e6LR5JDLl7ojfG3dTQjysSbHgmiCtOIKeHH+GEaRXgdfOFfFAO6sM/np0qoF6hRg05j2
	TbEFSNaoF32q1me/koqdwf8sQSvrr1zBGqMuITGlcQ8HW1K+tnqVA/Gaf16BtVVLe4/kXI1yf5u
	2D+tfFN3OcSzB4B7IkceFzhbqfYH3IbjSK6ue4K0JRWgAGm/bTPT1jA9pCotqmffmjKyspvLQxh
	uj3VzAx09JvlC5wWH9P9/yzCCkLmNcSCht+BrHKc=
X-Google-Smtp-Source: AGHT+IGMqDlLwT7rGvz8I6XYBpku/gmPdWmh/R1p3fJdAcAGTYdKy3MrEXnddG5CRbYlt4DioQT3/Q==
X-Received: by 2002:a17:907:828a:b0:ac2:c424:c316 with SMTP id a640c23a62f3a-ac2c424cd75mr606058866b.57.1741771573595;
        Wed, 12 Mar 2025 02:26:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac25777c748sm894535266b.2.2025.03.12.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 02:26:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v4 0/6] Maxim Integrated MAX77759 PMIC MFD-based drivers
Date: Wed, 12 Mar 2025 09:25:58 +0000
Message-Id: <20250312-max77759-mfd-v4-0-b908d606c8cb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACZT0WcC/3XM0Q6CIBiG4VtxHEeDH4HsqPtoHfwIKFtpw8Zsz
 nsPPTJbh9+3Pe9EBheDG8i5mEh0KQyh7/IoDwWpW+waR4PNmwADyQBK+sBRay0r+vCWIqJGwYE
 bBSSTZ3Q+jGvuesu7DcOrj++1nvjy/gklThkF471QvrJMyss9dBj7Yx8bspQSbLXaacgalXTGg
 akZVj9abPVpp0XWrBYKtC1BgvrS8zx/AAKKFmMlAQAA
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
 drivers/gpio/gpio-max77759.c                       | 524 +++++++++++++++
 drivers/mfd/Kconfig                                |  20 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/max77759.c                             | 738 +++++++++++++++++++++
 drivers/nvmem/Kconfig                              |  12 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/max77759-nvmem.c                     | 156 +++++
 include/linux/mfd/max77759.h                       |  98 +++
 14 files changed, 1750 insertions(+)
---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250224-max77759-mfd-aaa7a3121b62

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


