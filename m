Return-Path: <linux-gpio+bounces-8208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81862931093
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2024 10:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0C9F1C21ACF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2024 08:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567A7188CC6;
	Mon, 15 Jul 2024 08:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F1U7nYh4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7990188CAB
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jul 2024 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721033249; cv=none; b=GJpVOmLK23p1PDF8dEDSnOn4tYtyGNBpWRXQ5EeBo0CZOudHplJarSZkNyUSldgBn57EH1xUpFqQgkUybNarneOtwu8DHE4kJrr29E04prNPohCXbjuYoHIhMhNDTanoEp29R/APZ4e5AgbkKkgojdjwAMp52XkJZ1dCVVqhtIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721033249; c=relaxed/simple;
	bh=lQ6KxyCDmU/ai58B4TFYfDagIegmWEfOGaHQRQIc2CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p2KD+Rq+EwUWTx51zS2zRpVl+wv0Nn09dG7wbwfIIIs8AdsziJ++jQss/RolpJsWhhImIbC7Tab/bZY5KUBUKv96s9aDRov+snUEcliLvTvZbBT7XX9c9PsWn87DWuIGL6mNZwzR7Yrzr/BHqN4pQgMc2PnhpOTEMxKQ/ZVGRM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F1U7nYh4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ea2ce7abaso6932532e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jul 2024 01:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721033244; x=1721638044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Eb5BVX4zk5gTSRKhMYvaco55k80785UV3Z/D7oflCg=;
        b=F1U7nYh4fz1F1xky3Nm6rxZoTduFCw3CO4QtdqKvZq6Tn0iLgjZYmqRd+mv5k62y03
         nz1sKQTgW61czKBjz8C9pn0tFZTJXBHUBd3lXlSY6b0Zz7yWxrjnabHAJ9Qk4dRZHi9I
         jbehoCVTcorrX8m3oxiKzpIFFisSrfJWVKTac53akbQWa4744uT5ehn2svEELQVHh9PK
         ws/flDhvyepvMpPFpKYxvV8Jvgvhsv86gxyXJCPXkENktX2hJzHp2ysmWHJv0uizlH8b
         snVDV9/fvyolBCH+skMnAsFaCY30nR6XL56fnBGIFh3P0/i3p0KE2UvyBl///6BSJIHT
         noZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033244; x=1721638044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Eb5BVX4zk5gTSRKhMYvaco55k80785UV3Z/D7oflCg=;
        b=FvjZuDKwvMvCvF5mQjhCO4KLk8JwpsS/HbyyHY3VirgN6eT69Sw8aUXXg4buApyEVp
         MQ+bVwbCv+uN20ykyHr4gEB/c1ZhGqSMOo4qU2mtB+Waemc6wteroWiU0exgghoWLisk
         lNp7ykiX7bt9WWMKn3DmaKhz9f7wt4weQFdKjDC8AF+IgJOtd7F180q0OGyxtDbXLvla
         /oaBh78mOuCcsr39ASkyEEE0E6ambpHDLpgpdPDyHMmO86CF1TIxecOKhiEVt0dLF5o5
         DkNbHIoWT14zC2r4pXY8sug+T9quKkwpw+Yb3FpN0rr+EvXUaZQ8p+bafJLgdLEJ1Uka
         KYXA==
X-Forwarded-Encrypted: i=1; AJvYcCX94MPBPIS3qTvgKFoOrUlpys/UAKM01UErbB9so22IspcarIhwGWMGeEZVFMv4uNfZFecZjjVH7hcHkVD5h2YDPjklo5yn15xsYw==
X-Gm-Message-State: AOJu0YxPNOrFGa686npv4lYUK2udklEjmacv+yI5VhQ51ayEjH1hmnJz
	W/HM03HnH3LHhsf7M2tbc8C5l4B4iUI4ATRwH/OCjvAjAG3BZynrWPKO9Y3hp2g=
X-Google-Smtp-Source: AGHT+IGVokpbix8pAlplY8JkgGzC3xDQw+5+lcQXtZnUUEHop6EIS0U3DKMCsKAhgVSQJBAXSss8CQ==
X-Received: by 2002:a05:6512:2117:b0:52c:e03d:dfd7 with SMTP id 2adb3069b0e04-52eb99a19c3mr11053601e87.39.1721033243817;
        Mon, 15 Jul 2024 01:47:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:884f:7d23:2bfd:c44f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2cc244sm111069425e9.37.2024.07.15.01.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 01:47:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio updates for v6.11-rc1
Date: Mon, 15 Jul 2024 10:47:10 +0200
Message-ID: <20240715084712.17680-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Here's the pull-request from the GPIO tree for this merge window. The majority
of added lines are two new modules: the GPIO virtual consumer module that
improves our ability to add automated tests for the kernel API and the "sloppy"
logic analyzer module that uses the GPIO API to implement a coarse-grained
debugging tool for useful for remote development.

Other than that we have the usual assortment of various driver extensions,
improvements to the core GPIO code, DT-bindings and other documentation
updates as well as an extension to the interrupt simulator.

Details are in the signed tag. Please pull for rc1.

Best Regards,
Bartosz Golaszewski

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.11-rc1

for you to fetch changes up to dfda97e37de4c2fa4a079ae77737c6b9ed021f79:

  gpio: mc33880: Convert comma to semicolon (2024-07-10 14:30:27 +0200)

----------------------------------------------------------------
gpio updates for v6.11-rc1

GPIOLIB core:
- rework kfifo handling rework in the character device code
- improve the labeling of GPIOs requested as interrupts and show more info
  on interrupt-only GPIOs in debugfs
- remove unused APIs
- unexport interfaces that are only used from the core GPIO code
- drop the return value from gpiochip_set_desc_names() as it cannot fail
- move a string array definition out of a header and into a specific
  compilation unit
- convert the last user of gpiochip_get_desc() other than GPIO core to using
  a safer alternative
- use array_index_nospec() where applicable

New drivers:
- add a "virtual GPIO consumer" module that allows requesting GPIOs from actual
  hardware and driving tests of the in-kernel GPIO API from user-space over
  debugfs
- add a GPIO-based "sloppy" logic analyzer module useful for "first glance"
  debugging on remote boards

Driver improvements:
- add support for a new model to gpio-pca953x
- lock GPIOs as interrupts in gpio-sim when the lines are requested as irqs
  via the simulator domain + some other minor improvements
- improve error reporting in gpio-syscon
- convert gpio-ath79 to using dynamic GPIO base and range
- use pcibios_err_to_errno() for converting PCIBIOS error codes to errno
  vaues in gpio-amd8111 and gpio-rdc321x
- allow building gpio-brcmstb for the BCM2835 architecture

DT bindings:
- convert DT bindings for lsi,zevio, mpc8xxx, and atmel to DT schema
- document new properties for aspeed,gpio, fsl,qoriq-gpio and gpio-vf610
- document new compatibles for pca953x and fsl,qoriq-gpio

Documentation:
- document stricter behavior of the GPIO character device uAPI with regards to
  reconfiguring requested line without direction set
- clarify the effect of the active-low flag on line values and edges
- remove documentation for the legacy GPIO API in order to stop tempting
  people to use it
- document the preference for using pread() for reading edge events in the
  sysfs API

Other:
- add an extended initializer to the interrupt simulator allowing to specify
  a number of callbacks callers can use to be notified about irqs being
  requested and released

----------------------------------------------------------------
Andrew Davis (1):
      gpiolib: Remove data-less gpiochip_add() function

Andrew Jeffery (2):
      dt-bindings: gpio: aspeed,sgpio: Specify gpio-line-names
      dt-bindings: gpio: aspeed,sgpio: Specify #interrupt-cells

Andy Shevchenko (3):
      gpio: Remove legacy API documentation
      gpiolib: Return label, if set, for IRQ only line
      gpiolib: Show more info for interrupt only lines in debugfs

Bartosz Golaszewski (11):
      gpiolib: make gpiochip_set_desc_names() return void
      gpio: sim: use device_match_name() instead of strcmp(dev_name(...
      gpio: sim: drop kernel.h include
      gpio: sim: use devm_mutex_init()
      gpiolib: put gpio_suffixes in a single compilation unit
      pinctrl: da9062: replace gpiochip_get_desc() with gpio_device_get_desc()
      gpiolib: unexport gpiochip_get_desc()
      genirq/irq_sim: add an extended irq_sim initializer
      gpio: sim: lock GPIOs as interrupts when they are requested
      gpio: virtuser: new virtual testing driver for the GPIO API
      gpio: virtuser: actually use the "trimmed" local variable

Chen Ni (1):
      gpio: mc33880: Convert comma to semicolon

Etienne Buira (1):
      gpio: syscon: do not report bogus error

Fabio Estevam (2):
      gpio: pca953x: Add support for TI TCA9535 variant
      dt-bindings: gpio: pca95xx: Document the TI TCA9535 variant

Frank Li (3):
      dt-bindings: gpio: mpc8xxx: Convert to yaml format
      dt-bindings: gpio: fsl,qoriq-gpio: add common property gpio-line-names
      dt-bindings: gpio: fsl,qoriq-gpio: Add compatible string fsl,ls1046a-gpio

Frieder Schrempf (1):
      dt-bindings: gpio: vf610: Allow gpio-line-names to be set

Hagar Hemdan (1):
      gpio: prevent potential speculation leaks in gpio_device_get_desc()

Huichun Feng (1):
      docs: gpio: prefer pread(2) for interrupt reading

Ilpo Järvinen (2):
      gpio: amd8111: Convert PCIBIOS_* return codes to errnos
      gpio: rdc321x: Convert PCIBIOS_* return codes to errnos

Kent Gibson (7):
      gpiolib: cdev: Add INIT_KFIFO() for linereq events
      gpiolib: cdev: Refactor allocation of linereq events kfifo
      gpiolib: cdev: Cleanup kfifo_out() error handling
      Documentation: gpio: Clarify effect of active low flag on line values
      Documentation: gpio: Clarify effect of active low flag on line edges
      Documentation: gpio: Reconfiguration with unset direction (uAPI v1)
      Documentation: gpio: Reconfiguration with unset direction (uAPI v2)

Manikandan Muralidharan (1):
      dt-bindings: gpio: convert Atmel GPIO to json-schema

Peter Robinson (1):
      gpio: brcmstb: Allow building driver for ARCH_BCM2835

Pratik Farkase (1):
      dt-bindings: gpio: lsi,zevio-gpio: convert to dtschema

Shiji Yang (1):
      gpio: ath79: convert to dynamic GPIO base allocation

Wolfram Sang (1):
      gpio: add sloppy logic analyzer using polling

 Documentation/admin-guide/gpio/gpio-virtuser.rst   |  177 ++
 Documentation/admin-guide/gpio/index.rst           |    1 +
 .../dev-tools/gpio-sloppy-logic-analyzer.rst       |   93 +
 Documentation/dev-tools/index.rst                  |    1 +
 .../devicetree/bindings/gpio/aspeed,sgpio.yaml     |   10 +
 .../bindings/gpio/atmel,at91rm9200-gpio.yaml       |   81 +
 .../devicetree/bindings/gpio/fsl,qoriq-gpio.yaml   |   87 +
 .../devicetree/bindings/gpio/gpio-mpc8xxx.txt      |   53 -
 .../devicetree/bindings/gpio/gpio-pca95xx.yaml     |    1 +
 .../devicetree/bindings/gpio/gpio-vf610.yaml       |    4 +
 .../devicetree/bindings/gpio/gpio-zevio.txt        |   16 -
 .../devicetree/bindings/gpio/gpio_atmel.txt        |   31 -
 .../devicetree/bindings/gpio/lsi,zevio-gpio.yaml   |   43 +
 Documentation/driver-api/gpio/board.rst            |    6 -
 Documentation/driver-api/gpio/consumer.rst         |    4 +-
 Documentation/driver-api/gpio/driver.rst           |    5 +-
 Documentation/driver-api/gpio/index.rst            |    1 -
 Documentation/driver-api/gpio/intro.rst            |   12 -
 Documentation/driver-api/gpio/legacy.rst           |  679 --------
 .../translations/zh_CN/driver-api/gpio/index.rst   |    2 -
 .../translations/zh_CN/driver-api/gpio/legacy.rst  |  618 -------
 Documentation/translations/zh_TW/gpio.txt          |  574 -------
 .../gpio/gpio-handle-get-line-values-ioctl.rst     |    7 +
 .../gpio/gpio-handle-set-config-ioctl.rst          |    5 +-
 .../gpio/gpio-handle-set-line-values-ioctl.rst     |    7 +
 .../gpio/gpio-lineevent-data-read.rst              |    5 +
 .../userspace-api/gpio/gpio-v2-line-event-read.rst |    5 +
 .../gpio/gpio-v2-line-get-values-ioctl.rst         |    7 +
 .../gpio/gpio-v2-line-set-config-ioctl.rst         |    7 +-
 .../gpio/gpio-v2-line-set-values-ioctl.rst         |    7 +
 Documentation/userspace-api/gpio/sysfs.rst         |    7 +-
 drivers/gpio/Kconfig                               |   33 +-
 drivers/gpio/Makefile                              |    2 +
 drivers/gpio/gpio-amd8111.c                        |    4 +-
 drivers/gpio/gpio-ath79.c                          |    2 -
 drivers/gpio/gpio-mc33880.c                        |    2 +-
 drivers/gpio/gpio-pca953x.c                        |    1 +
 drivers/gpio/gpio-rdc321x.c                        |    6 +-
 drivers/gpio/gpio-sim.c                            |   60 +-
 drivers/gpio/gpio-sloppy-logic-analyzer.c          |  344 ++++
 drivers/gpio/gpio-syscon.c                         |   27 +-
 drivers/gpio/gpio-virtuser.c                       | 1807 ++++++++++++++++++++
 drivers/gpio/gpiolib-acpi.c                        |    4 +-
 drivers/gpio/gpiolib-cdev.c                        |   80 +-
 drivers/gpio/gpiolib-of.c                          |    4 +-
 drivers/gpio/gpiolib.c                             |   36 +-
 drivers/gpio/gpiolib.h                             |    4 +-
 drivers/pinctrl/pinctrl-da9062.c                   |    2 +-
 drivers/staging/greybus/gpio.c                     |    2 +-
 include/linux/gpio.h                               |    6 +-
 include/linux/gpio/driver.h                        |    5 -
 include/linux/irq_sim.h                            |   17 +
 kernel/irq/irq_sim.c                               |   60 +-
 tools/gpio/gpio-sloppy-logic-analyzer.sh           |  246 +++
 54 files changed, 3187 insertions(+), 2123 deletions(-)
 create mode 100644 Documentation/admin-guide/gpio/gpio-virtuser.rst
 create mode 100644 Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
 create mode 100644 Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-zevio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_atmel.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/lsi,zevio-gpio.yaml
 delete mode 100644 Documentation/driver-api/gpio/legacy.rst
 delete mode 100644 Documentation/translations/zh_CN/driver-api/gpio/legacy.rst
 delete mode 100644 Documentation/translations/zh_TW/gpio.txt
 create mode 100644 drivers/gpio/gpio-sloppy-logic-analyzer.c
 create mode 100644 drivers/gpio/gpio-virtuser.c
 create mode 100755 tools/gpio/gpio-sloppy-logic-analyzer.sh

