Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 302B42EF304
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 14:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbhAHN2g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 08:28:36 -0500
Received: from mail-lf1-f54.google.com ([209.85.167.54]:33605 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbhAHN2f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 08:28:35 -0500
Received: by mail-lf1-f54.google.com with SMTP id l11so22985246lfg.0;
        Fri, 08 Jan 2021 05:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=XWXA/W4A7VYDZCeu7RyYjtQ4AHjG+9LzWwWw1pvb/iA=;
        b=QKJTor8fK0h6F7NXNdeIHbH07r6Z/WX0hE8L0XwU3xhjEmcrymbh22j18vEunQC/Sv
         X4zqn0ubLCzksltqPzmph28w9ecOWOraBvStzbhu7WkWuZdVawFrsiFtRfN619EVfbAR
         7EiXY+WpThwiCpEZWKW4jgJcOhfrrYMkMqrv5i0A6290oMRz4qoHjnyDi36G10sVOyee
         bT0L1gka1R7I9/9dWMhAl8GEFh6y4b0SV1h3fA81GB+Z2+uPhabTnfJbNH7+OAdTJLZI
         69gEuMzwsUWVeAmb2d4rbKdK7WpunTnWbxt8C+seBTSscstRoA+7aT5hdeuDBt7qOZQO
         dIoA==
X-Gm-Message-State: AOAM53045xVzx2NLPvikBRmd8zgfTkKhc9CfLqxlzUylj+blX1gfX1lx
        neyu08N8kdXullgBSfTMqa0=
X-Google-Smtp-Source: ABdhPJySVsQlxXl/NaUUMRTow166ph9Z9KYmSNrdLhgWklFJaU++uQOYtIh4kPtIcby7SEPsZMpBXg==
X-Received: by 2002:a2e:9b8a:: with SMTP id z10mr1435924lji.126.1610112472294;
        Fri, 08 Jan 2021 05:27:52 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id w204sm1969331lff.241.2021.01.08.05.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 05:27:51 -0800 (PST)
Date:   Fri, 8 Jan 2021 15:27:44 +0200
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
Subject: [PATCH 00/15] Support ROHM BD71815 PMIC
Message-ID: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Patch series introducing support for ROHM BD71815 PMIC

Please note that this series depend on previously sent patches.

Already merged regulator patches (in regulator tree - not yet in Linus'
tree):
[PATCH] regulator: ROHM bd7xxxx: Do not depend on parent driver data
https://lore.kernel.org/lkml/20210105130221.GA3438042@localhost.localdomain/
[PATCH] regulator: bd718x7: Stop using parent data
https://lore.kernel.org/lkml/20210107122355.GA35080@localhost.localdomain/

Already merged GPIO patch (in GPIO tree - not yet in Linus' tree):
[PATCH] gpio: bd7xxxx: Do not depend on parent driver data
https://lore.kernel.org/lkml/20210105125335.GA3430233@localhost.localdomain/

Also, the patches 1 and 2 have been sent separately to clk and rtc
subsystems - but they have not yet been reviewed / applied. They are
present also in this series because the series depends on those changes.
I will drop those patches from this series if they get merged to clk/RTC
trees from previous submissions.

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

---

Matti Vaittinen (15):
  rtc: bd70528: Do not require parent data
  clk: BD718x7: Do not depend on parent driver data
  mfd: bd718x7: simplify by cleaning unnecessary device data
  dt_bindings: bd71828: Add clock output mode
  dt_bindings: mfd: Add ROHM BD71815 PMIC
  dt_bindings: regulator: Add ROHM BD71815 PMIC regulators
  mfd: Add ROHM BD71815 ID
  mfd: Support for ROHM BD71815 PMIC core
  gpio: support ROHM BD71815 GPOs
  regulator: helpers: Export helper voltage listing
  regulator: rohm-regulator: SNVS dvs and linear voltage support
  regulator: Support ROHM BD71815 regulators
  clk: bd718x7: Add support for clk gate on ROHM BD71815 PMIC
  rtc: bd70528: Support RTC on ROHM BD71815
  MAINTAINERS: Add ROHM BD71815AGW

 .../bindings/mfd/rohm,bd71815-pmic.yaml       | 198 +++++
 .../bindings/mfd/rohm,bd71828-pmic.yaml       |   7 +
 .../regulator/rohm,bd71815-regulator.yaml     | 104 +++
 MAINTAINERS                                   |   3 +
 drivers/clk/clk-bd718x7.c                     |  21 +-
 drivers/gpio/Kconfig                          |  10 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-bd71815.c                   | 160 +++++
 drivers/mfd/Kconfig                           |  15 +-
 drivers/mfd/rohm-bd71828.c                    | 416 ++++++++++-
 drivers/mfd/rohm-bd718x7.c                    |  43 +-
 drivers/regulator/Kconfig                     |  11 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/bd71815-regulator.c         | 675 ++++++++++++++++++
 drivers/regulator/helpers.c                   |  36 +-
 drivers/regulator/rohm-regulator.c            |  23 +-
 drivers/rtc/Kconfig                           |   6 +-
 drivers/rtc/rtc-bd70528.c                     | 104 +--
 include/linux/mfd/rohm-bd71815.h              | 584 +++++++++++++++
 include/linux/mfd/rohm-bd71828.h              |   3 +
 include/linux/mfd/rohm-bd718x7.h              |  13 -
 include/linux/mfd/rohm-generic.h              |   7 +-
 include/linux/regulator/driver.h              |   2 +
 23 files changed, 2300 insertions(+), 143 deletions(-)
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
