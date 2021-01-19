Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C52A2FB29F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 08:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbhASHPg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 02:15:36 -0500
Received: from mail-lf1-f44.google.com ([209.85.167.44]:44803 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbhASHOm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 02:14:42 -0500
Received: by mail-lf1-f44.google.com with SMTP id m25so27590192lfc.11;
        Mon, 18 Jan 2021 23:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=P+qSMLDwGxE2JaNJxyZHsDHJ0xuN3IOTE+zNh6TVqf0=;
        b=B5sPLwMmSGZ7a3yW+x8NAT0VpgSHT/Op2olujQsRZTZnfFxla7Y577uXQnRZWwfUKb
         vSkop34dz+pbnvJqxeARW5I1QWSbkJ8WZ5YzjKYZr5+DyCW0ye+RYc+ivJhyIWHrDubx
         52wEBzNCPcCLQQER+jfJpFzBAyVT4PaYTI5idwU+r51633Erb24xKIxGhjc6W2h4FOJD
         qykgOaDLBTcfgejuNVxtJK4ArDMyzz+hLa71r5+NjNqeC9xbjzsMO/0Py6BLFWLsayOe
         x9JABhWWth/v6KNHte/h16Q4UhTJumT1f8roA4g0fvruw8m6FyLPKkx7H/xFZacqpC/v
         gWMA==
X-Gm-Message-State: AOAM530mVHf31ZrlJu7zq7qVC62f2+hWR64lvpvY0yQDoMvatHWRV0lm
        XYP1QskGrN0RUe2rM6jmflM=
X-Google-Smtp-Source: ABdhPJyhPq5gBNyzuAtHByHBCEaWug1JFAfsuCEmg7e4TK6mPMxRbbYp3M7Qkz63uDppCQb0efK8wQ==
X-Received: by 2002:a19:dc5:: with SMTP id 188mr1254716lfn.513.1611040438809;
        Mon, 18 Jan 2021 23:13:58 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id m13sm1905288ljo.121.2021.01.18.23.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 23:13:57 -0800 (PST)
Date:   Tue, 19 Jan 2021 09:13:49 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
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
Subject: [PATCH v2 00/17] Support ROHM BD71815 PMIC
Message-ID: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Patch series introducing support for ROHM BD71815 PMIC

Please note that this series depends on previously sent patches.

Already merged regulator patches (in regulator tree - not yet in Linus'
tree):
[PATCH] regulator: ROHM bd7xxxx: Do not depend on parent driver data
https://lore.kernel.org/lkml/20210105130221.GA3438042@localhost.localdomain/
[PATCH] regulator: bd718x7: Stop using parent data
https://lore.kernel.org/lkml/20210107122355.GA35080@localhost.localdomain/

Already merged GPIO patch (in GPIO tree - not yet in Linus' tree):
[PATCH] gpio: bd7xxxx: Do not depend on parent driver data
https://lore.kernel.org/lkml/20210105125335.GA3430233@localhost.localdomain/


This series also includes already sent patches:
The patches 1, 2 and 3 have been sent separately to mfd/regulator, rtc and clk
subsystems - but they have not yet been reviewed / applied. They are present
also in this series because the series depends on those changes.
I will drop those patches from this series if they get merged to
(MFD or regulator)/RTC/clk trees from previous submits.

patch 1 previous submit:
regulator: bd718x7, bd71828, Fix dvs voltage levels
https://lore.kernel.org/lkml/20210118075851.GA1016281@localhost.localdomain/

patch 2 previous submit:
rtc: bd70528: Do not require parent data
https://lore.kernel.org/lkml/20210105152350.GA3714833@localhost.localdomain/

patch 3 previous submit:
clk: BD718x7: Do not depend on parent driver data
https://lore.kernel.org/lkml/20210105123028.GA3409663@localhost.localdomain/


Please note that due to the dependencies all of the patches are probably
not applying cleanly to all subsystem trees. (regulator/RTC patches to
other subsystems). I understand it perfectly well if this series can't be
merged before all dependencies are merged to all relevant subsystem trees
but I would be grateful if I got the first set of review comments even
before that.


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

Matti Vaittinen (17):
  regulator: bd718x7, bd71828, Fix dvs voltage levels
  rtc: bd70528: Do not require parent data
  clk: BD718x7: Do not depend on parent driver data
  mfd: bd718x7: simplify by cleaning unnecessary device data
  dt_bindings: bd71828: Add clock output mode
  dt_bindings: regulator: Add ROHM BD71815 PMIC regulators
  dt_bindings: mfd: Add ROHM BD71815 PMIC
  mfd: Add ROHM BD71815 ID
  mfd: Support for ROHM BD71815 PMIC core
  gpio: support ROHM BD71815 GPOs
  regulator: helpers: Export helper voltage listing
  regulator: rohm-regulator: linear voltage support
  regulator: rohm-regulator: Support SNVS HW state.
  regulator: Support ROHM BD71815 regulators
  clk: bd718x7: Add support for clk gate on ROHM BD71815 PMIC
  rtc: bd70528: Support RTC on ROHM BD71815
  MAINTAINERS: Add ROHM BD71815AGW

 .../bindings/mfd/rohm,bd71815-pmic.yaml       | 202 ++++++
 .../bindings/mfd/rohm,bd71828-pmic.yaml       |   6 +
 .../regulator/rohm,bd71815-regulator.yaml     | 116 +++
 MAINTAINERS                                   |   3 +
 drivers/clk/clk-bd718x7.c                     |  21 +-
 drivers/gpio/Kconfig                          |  10 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-bd71815.c                   | 171 +++++
 drivers/mfd/Kconfig                           |  15 +-
 drivers/mfd/rohm-bd71828.c                    | 416 ++++++++++-
 drivers/mfd/rohm-bd718x7.c                    |  43 +-
 drivers/regulator/Kconfig                     |  11 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/bd71815-regulator.c         | 682 ++++++++++++++++++
 drivers/regulator/helpers.c                   |  36 +-
 drivers/regulator/rohm-regulator.c            |  32 +-
 drivers/rtc/Kconfig                           |   6 +-
 drivers/rtc/rtc-bd70528.c                     | 104 ++-
 include/linux/mfd/rohm-bd71815.h              | 561 ++++++++++++++
 include/linux/mfd/rohm-bd71828.h              |   3 +
 include/linux/mfd/rohm-bd718x7.h              |  13 -
 include/linux/mfd/rohm-generic.h              |  19 +-
 include/linux/regulator/driver.h              |   2 +
 23 files changed, 2321 insertions(+), 153 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
 create mode 100644 drivers/gpio/gpio-bd71815.c
 create mode 100644 drivers/regulator/bd71815-regulator.c
 create mode 100644 include/linux/mfd/rohm-bd71815.h

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
