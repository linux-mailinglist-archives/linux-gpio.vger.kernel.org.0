Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59A43EC1C7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 12:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbfKAL2Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 07:28:24 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37650 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfKAL2X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 07:28:23 -0400
Received: by mail-lf1-f68.google.com with SMTP id b20so6998142lfp.4;
        Fri, 01 Nov 2019 04:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=DGPEzlzjC2eK7jBTZmkkeyeVTq7qEDIORYurK5LJmdU=;
        b=p0ecw+jMORI49NPeLVxj+9UeCjSTIK15Bir2nyHimTD0JnOoJcVrZpuThkaYpNTP8P
         WpaFMXaKuIVOixeDK7u3jmVCmYCxXG3sshBghqDdGLIjHMOYu42LMXTu8WMTrVQcE77V
         4wRCmXxGqiOHkbMQy+gAho+Us8V9dARXPk7szrC5Z2Jg5Q0GMohLVaH27G09O+ZvVM4P
         cYRUBWFM5eA4vODKCmFS5z15kAoD5z5/xtHbnK34Lztw09jPYVL/xc+IZKYdCUwMhCmt
         IXbo1VdYUdANgiIN7iF86iUeqjO90bMMfCdEZrqIXQvMlG639dleIBcpW4OXSFG65FBT
         6BJA==
X-Gm-Message-State: APjAAAXAWToA4NS2OBV1EIF3jygMJRF5HvKZy0mGUvVqmI7Fpjtb+TaK
        Ns27yI28C1qFObvDSqt1N0A=
X-Google-Smtp-Source: APXvYqyVv7Z4QjcXS+Q8Oobr8MBvg6T1bPHiVeNEdL6+YYyiVFSZ2MnxmwdFYWL+WviBfWxrJW3ROA==
X-Received: by 2002:a19:654d:: with SMTP id c13mr6911067lfj.30.1572607699878;
        Fri, 01 Nov 2019 04:28:19 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id u11sm2220598ljo.17.2019.11.01.04.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:28:19 -0700 (PDT)
Date:   Fri, 1 Nov 2019 13:28:06 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC PATCH v3 00/15] Support ROHM BD71828 PMIC
Message-ID: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Patch series introducing support for ROHM BD71828 PMIC

ROHM BD71828 is a power management IC containing 7 bucks and 7 LDOs. All
regulators can either be controlled individually via I2C. Bucks 1,2,6 and
7 can also be assigned to a "regulator group" controlled by run-levels.
Eg. Run level specific voltages and enable/disable statuses for each of
these bucks can be set via register interface. The buck run-level group
assignment (selection if buck is to be controlled individually or via
run-levels) can be changed at run-time via I2C.

Run level changes can then be initiated wither via I2C writes or GPIO.
and when run-level is changed, state of all bucks which are set to be
controlled via run-levels are changed accrdingly.

This control mechanism selection (I2C or GPIO) is selected by data in
one time programmable PMIC memory area (during production) and can't be
changed later.

In addition to the bucks and LDOs there are:

- The usual clk gate
- 4 IO pins (mostly usable as GPO or tied to specific purpose)
- power button support
- RTC
- two LEDs
- battery charger
- HALL sensor input

This patch series adds support to regulators, clk, RTC, and GPIOs. LED
support will be added later when fate of RFC "Add DT node finding and
parsing to core" is known.

https://lore.kernel.org/lkml/cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com/

Power-supply driver for charger is "under construction" and not included
in this RFC series.

Reason for RFC status is the regulator grouping to run-levels.

Patches 8 and 9 bring more or less the usual regulator support.

Patches 10, 11, 12 add run-level control which I am not entirely happy
with. I don't like sysfs interface for run-level control. I am not
entirely happy with the in-kernel APIs either as those provide run-level
control via one *regulator pointer - but change impacts to more than one
regulator.

All suggestions are appreciated and welcome.

Rest of the patches should be business as usual.

Changelog v3:
  DT-Bindings:
    - yamlify
    - add LED binding doc
  CLK:
    - Move clk register definitions from MFD headers to clk driver
  GPIO:
    - Add generic direction define and use it.
  LED:
    - Drop LED driver from the series (for now).

Changelog v2: Mainly RTC and GPIO fixes suggested by Alexandre and Bartosz

  General:
    -Patch ordering changed to provide dt binding documents right after the
     MFD core.
  DT-Bindings for regulators (Patch 3)
    -Fix typo in PMIC model number
  RTC (patch 11)
    -Reverted renaming in order to reduce patch size.
    -Reworded commit message
  BD71828 regulator (patch 7)
    -Add MODULE_ALIAS
  GPIO (patch 12)
    -Remove file-name from comment
    -prefix IN and OUT defines with chip type
    -improved documentation for the INPUT only pin.
    -removed empty left-over function
    -removed unnecessary #ifdef CONFIG_OF_GPIO
    -removed unnecessary error print
    -Add MODULE_ALIAS

Patch 1:
        BD71828 MFD core.
Patch 2:
	dt-bindings for BD71828 PMIC
Patch 3:
        dt-bindings for regulators on BD71828 PMIC
Patch 4:
        dt-bindings for LEDs on BD71828 PMIC
Patch 5:
	Power button support using GPIO keys.
Patch 6:
        CLK gate support using existing clk-bd718x7
Patch 7:
        Move clk register definitions from headers to driver
Patch 8:
        Split existing bd718x7 regulator driver to generic ROHM dt
        parsing portion (used by more than one ROHM drivers) and
        bd718x8 specific parts
Patch 9:
        Basic regulator support (individual control via I2C). This
        should be pretty standard stuff.
Patch 10:
        Add support for getting regulator voltages when GPIO controlled
        run-levels are used. Allow specifying voltages for run-levels
        via DT. Allow controlling run-levels via sysfs entries (I am not
        happy about this. Probably should only provide in-kernel API for
        this or is there better ideas? Showing can be done vis sysfs?
        Debugfs?)
Patch 11:
        Support setting/getting run-levels when they are controlled via
        I2C instead of GPIO. Add in-kernel API for settin run-level
        voltages for regulators at run-time.
Patch 12:
        Add in-kernel APIs for changing the RUN-level. Safer than sysfs
        I guess. But is there some better method for controlling this
        kind of dynamic group of regulators?
Patch 13:
        Support BD71828 RTC block using BD70528 RTC driver
Patch 14:
        Add generic GPIO direction defines
Patch 15:
        Allow control of GP(I)O pins on BD71828 via GPIO subsystem
Patch 16:
        Support toggling the LEDs

This patch series is based on v5.4-rc5

---

Matti Vaittinen (15):
  mfd: bd71828: Support ROHM BD71828 PMIC - core
  dt-bindings: mfd: Document ROHM BD71828 bindings
  dt-bindings: regulator: Document ROHM BD71282 regulator bindings
  dt-bindings: leds: ROHM BD71282 PMIC LED driver
  mfd: input: bd71828: Add power-key support
  clk: bd718x7: Support ROHM BD71828 clk block
  clk: bd718x7: simplify header dependencies
  regulator: bd718x7: Split driver to common and bd718x7 specific parts
  regulator: bd71828: Basic support for ROHM bd71828 PMIC regulators
  regulator: bd71828: Add GPIO based run-level control for regulators
  regulator: bd71828: enhanced run-level support
  regulator: bd71828: Support in-kernel APIs to change run-level
  rtc: bd70528 add BD71828 support
  gpio: Add definition for GPIO direction
  gpio: bd71828: Initial support for ROHM BD71828 PMIC GPIOs

 .../bindings/leds/rohm,leds-bd71828.yaml      |   46 +
 .../bindings/mfd/rohm,bd71828-pmic.yaml       |  249 +++
 .../regulator/rohm,bd71828-regulator.yaml     |  123 ++
 drivers/clk/Kconfig                           |    6 +-
 drivers/clk/clk-bd718x7.c                     |   37 +-
 drivers/gpio/Kconfig                          |   12 +
 drivers/gpio/Makefile                         |    1 +
 drivers/gpio/gpio-bd71828.c                   |  149 ++
 drivers/mfd/Kconfig                           |   15 +
 drivers/mfd/Makefile                          |    2 +-
 drivers/mfd/rohm-bd71828.c                    |  350 ++++
 drivers/regulator/Kconfig                     |   16 +
 drivers/regulator/Makefile                    |    2 +
 drivers/regulator/bd71828-regulator.c         | 1443 +++++++++++++++++
 drivers/regulator/bd718x7-regulator.c         |  183 +--
 drivers/regulator/rohm-regulator.c            |   95 ++
 drivers/rtc/Kconfig                           |    3 +-
 drivers/rtc/rtc-bd70528.c                     |  150 +-
 include/linux/gpio/driver.h                   |    3 +
 include/linux/mfd/rohm-bd70528.h              |   19 +-
 include/linux/mfd/rohm-bd71828.h              |  428 +++++
 include/linux/mfd/rohm-bd718x7.h              |    6 -
 include/linux/mfd/rohm-generic.h              |   45 +
 include/linux/mfd/rohm-shared.h               |   27 +
 24 files changed, 3230 insertions(+), 180 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
 create mode 100644 drivers/gpio/gpio-bd71828.c
 create mode 100644 drivers/mfd/rohm-bd71828.c
 create mode 100644 drivers/regulator/bd71828-regulator.c
 create mode 100644 drivers/regulator/rohm-regulator.c
 create mode 100644 include/linux/mfd/rohm-bd71828.h
 create mode 100644 include/linux/mfd/rohm-shared.h

-- 
2.21.0


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
