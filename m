Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930D034724D
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 08:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235847AbhCXHWK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 03:22:10 -0400
Received: from mail-lj1-f172.google.com ([209.85.208.172]:39511 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbhCXHVy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 03:21:54 -0400
Received: by mail-lj1-f172.google.com with SMTP id u4so28895803ljo.6;
        Wed, 24 Mar 2021 00:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=79q9b1ueHy2XcsygQxFoUSTUPDLk9ge5PzTNt5zbaLI=;
        b=fbngdJXQSzafrg8/VeWnaMfnKqR79Au7ARD+91duyDI81X42Kd60QgkmagF7IbQzgX
         4PbAXPNpd+TiStmnAcJU9IzL/CXmHkQ7ha60sFSPYyGUbBCdgiY29I+nvqKEKZ8OY994
         Ez/aj7+YXN83PskbREy+LpHi4mkCFqRj0d+OmIVfvkT0wmzhST0jTHWbwuVA3WuLpYoT
         KW43LOlv4yzpzODgsQV6G7uQFhlGKWTSRHWzugiAupb54NArm+0wfcVXpUrt9px+CoKv
         LXus2YQKhW1ymu5lC0w0CDdHxx0WHUzCMmUmlhUKwOCFHtk20B0Du0YtLCztYPjlKDUY
         bSeQ==
X-Gm-Message-State: AOAM531ya8n5Mo5fSTVbOAlzeJZdWPrgXeBNy/HawicWZYNbUAamxBBC
        giL3q2KHta1jTPT/vfun+DoSboVS304=
X-Google-Smtp-Source: ABdhPJzFlVRf9X3HmFO3EmvNW5p59i3ejDRipZEMdLAVTyIm30SqgUxxb1F5ZaL3VUTWAK5FsVxH+A==
X-Received: by 2002:a2e:87d8:: with SMTP id v24mr1174821ljj.387.1616570512908;
        Wed, 24 Mar 2021 00:21:52 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id u9sm191137ljd.130.2021.03.24.00.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 00:21:51 -0700 (PDT)
Date:   Wed, 24 Mar 2021 09:21:45 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v4 00/16] Support ROHM BD71815 PMIC
Message-ID: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Patch series introducing support for ROHM BD71815 PMIC

ROHM BD71815 is a power management IC used in some battery powered
systems. It contains regulators, GPO(s), charger + coulomb counter, RTC
and a clock gate.

All regulators can be controlled via I2C. LDO4 can additionally be set to
be enabled/disabled by a GPIO. LDO3 voltage could be selected from two
voltages written into separate VSEL reisters using GPIO but this mode is
not supported by driver. On top of that the PMIC has the typical HW
state machine which is present also on many other ROHM PMICs.

IC contains two GPOs - but one of the GPOs is marked as GND in
data-sheet. Thus the driver by default only exposes one GPO. The second
GPO can be enabled by special DT property.

RTC is almost similar to what is on BD71828. For currently used features
only the register address offset to RTC block differs.

The charger driver is not included in this series. ROHM has a charger
driver with some fuel-gauging logig written in but this is not included
here. I am working on separating the logic from HW specific driver and
supporting both BD71815 and BD71828 chargers in separate patch series.

Changelog v4:
  - Sorted ROHM chip ID enum
  - Statcized DVS structures in regulator driver
  - Minor styling for regulator driver
  - rebased on v5.12-rc4
Changelog v3:
  - GPIO clean-up as suggested by Bartosz
  - MFD clean-up as suggested by Lee
  - clk-mode dt-binding handling in MFD driver corrected to reflect new
    property values.
  - Dropped already applied patches
  - Rebased on v5.12-rc2
Changelog v2:
  - Rebased on top of v5.11-rc3
  - Added another "preliminary patch" which fixes HW-dvs voltage
    handling (patch 1)
  - split regulator patch to two.
  - changed dt-binding patch ordering.
  regulators:
    - staticized probe
    - removed some unnecessary defines
    - updated comments
    - split rohm-regulator patch adding SNVS and supporting simple
      linear mapping into two - one adding support for mapping, other
      adding SNVS.
  GPIO:
    - removed unnecessary headers
    - clarified dev/parent->dev usage
    - removed forgotten #define DEBUG
  dt-bindings:
    - changed patch order to meet ref-dependencies
    - added missing regulator nodes
    - changed string property for clk mode to tristated
  MFD:
    - header cleanups.
  CLK:
    - fixed commit message

--

Matti Vaittinen (16):
  rtc: bd70528: Do not require parent data
  mfd: bd718x7: simplify by cleaning unnecessary device data
  dt_bindings: bd71828: Add clock output mode
  dt_bindings: regulator: Add ROHM BD71815 PMIC regulators
  dt_bindings: mfd: Add ROHM BD71815 PMIC
  mfd: Add ROHM BD71815 ID
  mfd: Sort ROHM chip ID list for better readability
  mfd: Support for ROHM BD71815 PMIC core
  gpio: support ROHM BD71815 GPOs
  regulator: helpers: Export helper voltage listing
  regulator: rohm-regulator: linear voltage support
  regulator: rohm-regulator: Support SNVS HW state.
  regulator: Support ROHM BD71815 regulators
  clk: bd718x7: Add support for clk gate on ROHM BD71815 PMIC
  rtc: bd70528: Support RTC on ROHM BD71815
  MAINTAINERS: Add ROHM BD71815AGW

 .../bindings/mfd/rohm,bd71815-pmic.yaml       | 201 ++++++
 .../bindings/mfd/rohm,bd71828-pmic.yaml       |   6 +
 .../regulator/rohm,bd71815-regulator.yaml     | 116 +++
 MAINTAINERS                                   |   3 +
 drivers/clk/clk-bd718x7.c                     |   9 +-
 drivers/gpio/Kconfig                          |  10 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-bd71815.c                   | 176 +++++
 drivers/mfd/Kconfig                           |  15 +-
 drivers/mfd/rohm-bd71828.c                    | 486 +++++++++----
 drivers/mfd/rohm-bd718x7.c                    |  43 +-
 drivers/regulator/Kconfig                     |  11 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/bd71815-regulator.c         | 676 ++++++++++++++++++
 drivers/regulator/helpers.c                   |  36 +-
 drivers/regulator/rohm-regulator.c            |  23 +-
 drivers/rtc/Kconfig                           |   6 +-
 drivers/rtc/rtc-bd70528.c                     | 104 +--
 include/linux/mfd/rohm-bd71815.h              | 562 +++++++++++++++
 include/linux/mfd/rohm-bd71828.h              |   3 +
 include/linux/mfd/rohm-bd718x7.h              |  13 -
 include/linux/mfd/rohm-generic.h              |  15 +-
 include/linux/regulator/driver.h              |   2 +
 23 files changed, 2286 insertions(+), 232 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
 create mode 100644 drivers/gpio/gpio-bd71815.c
 create mode 100644 drivers/regulator/bd71815-regulator.c
 create mode 100644 include/linux/mfd/rohm-bd71815.h


base-commit: 0d02ec6b3136c73c09e7859f0d0e4e2c4c07b49b
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
