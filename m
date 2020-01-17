Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E311714065B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 10:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgAQJiO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 04:38:14 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39444 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgAQJiO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 04:38:14 -0500
Received: by mail-ed1-f68.google.com with SMTP id t17so21663508eds.6;
        Fri, 17 Jan 2020 01:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=GgM8D4zkfuSs5AEFDb8sLkSbICo7D/rh0GvA2KEvmlU=;
        b=mPQHqGFR+2x5aGhGgZRQ0VDdFg3X1LYv67hb9St01mlYaB/iXSgvd4T0cvmGHeJFcU
         oUbLYA88yG9UtkJRx/IZfH4tVlANkztJ3gVaHbIWLXMKTASxG6t6/yhoTk7YNX2Cbpd5
         kecYsNvroE+o1LVGWTP9PWEwDRmMpBs5jgDQ1qSxDb36vsQQLbrCOhrgpvvN7Ng11gtb
         bngV+flp4SgDSHMKs1Le2OT/GyKrimiJ8dczL7iEJg8GGfGpw31npM+YjjiUUPG9DPWG
         ucWKeQlfV6oIn8DAu9B1lajQqG/j/JGAzdCN146EikbWlkCfNcsdEwhQblz03283xxgn
         eTWA==
X-Gm-Message-State: APjAAAVb7lhJtSzxj17IBTq7dA3WxaaEov4FNq65X+hVaE2jNJModV9G
        7xvdyW0R91oIkI5x8VFrfhAw+xNh
X-Google-Smtp-Source: APXvYqyn1tS1Xj/zd72xK4d1yiyRUinWkSvLgh42CD6nbVNoQwdu9jZGvwJ3F67+DT6WpG3e7OWHBQ==
X-Received: by 2002:a19:9157:: with SMTP id y23mr4777043lfj.74.1579253417268;
        Fri, 17 Jan 2020 01:30:17 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id w17sm11727934lfn.22.2020.01.17.01.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 01:30:16 -0800 (PST)
Date:   Fri, 17 Jan 2020 11:30:02 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v10 00/13] Support ROHM BD71828 PMIC
Message-ID: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
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
regulators can be controlled individually via I2C. Bucks 1,2,6 and
7 can also be assigned to a "regulator group" controlled by run-levels.
Eg. Run level specific voltages and enable/disable statuses for each of
these bucks can be set via register interface. The buck run-level group
assignment (selection if buck is to be controlled individually or via
run-levels) can be changed at run-time via I2C.

This patch series brings only the basic support for controlling
regulators individually via I2C.

In addition to the bucks and LDOs there are:

- The usual clk gate
- 4 IO pins (mostly usable as GPO or tied to specific purpose)
- power button support
- RTC
- two LEDs
- battery charger
- HALL sensor input

This patch series adds support to regulators, clk, RTC, GPIOs and LEDs.

Power-supply driver for charger is not included in this series.

The series also adds LED DT-node lookup based on node name or given
property name/value pair in LED core. It also adds generic default-state
and default-trigger property handling to LED core. Follow-up patches
simplifying few other LED drivers should follow.

Changelog v10:
  - Split RTC patch to a BD70528 fix (which hopefully goes to 5.4) and to
    BD71828 support

Changelog v9: (Changes suggested by Lee)
  - Added kerneldoc to struct rohm_dvs_config
  - cleaned few comments
  - updated copyright date
  - renamed variable 'mfd' to 'parent'.

Changelog v8:
  LEDs:
    - Fixed bunch of typos.
    - Corrected the commit message which errorneously contained the
      'leds-compatible' which I dropped in favour of match_property.
    - use max_brightness instead of LED_FULL if it is given when
      handling the default_state, "on".
    - clean fwnode_owned at the end of unsuccessfull registration or
      at the end of deregistration.
    - fix the accidental linuxdoc comment.
    - rename led_find_fwnode to led_get_fwnode as it increases refcount.

Changelog v7:
  - Rebased on top of v5.5-rc2
  - Dropped already applied patches
    - basic regulator support (in regulator tree now)
    - regulator dt-bindings (in regulator tree now)
    - gpio devm function documentation (in GPIO tree now)
  - Dropped new devm-variant of gpio_array getting for MFD sub-devices who
    have consumer information in parent DT node as gpio consumer was
    dropped from the series
  - removed extra line-breaks from MFD driver and Makefile
  - fixed RTC patch subject line (added missing colon)
  - included a patch which adds compatible for ROHM BD71850 PMIC

Changelog v6:
  Rebased on top of v5.5-rc1
  LED core:
    - Do new fw-node look-up only if the new match data is given. That
      way behaviour for existing drivers is not changed
    - Handle generic LED properties by core only if explisitly requested
      in init-data. That way behaviour for existing drivers is not changed
      until they are verified to work.
  BD71828 LEDs:
    - Fix module loading by adding "dummy" of_device_id table.
  DT bindings:
    All:
    - Remove regulator run-level properties as run-level support was
      dropped for now.
    - Change SPDX to dual lisence
    LED:
    - added select: false
    - replace oneOf + const by enum
    Regulator:
    - remove forgotten comments
    - comment indenting
    MFD:
    - remove unnecessary descriptions
  Regulators:
    - Dropped patch 12 with run-level controls
    - Dropped unnecessary ramp_delay_supported() - ram_delay ops were
      already only filled for DVS bucks.
  GPIO:
    - rename internal function.
  RTC:
    - Added missing blank line
  
Changelog v5:
  Only LED patch (patch 15) changed, rest as in v4.
  LED:
    - Fixed issues reported by Dan Carpenter and kbuild-bot static
      analysis.
Changelog v4 (first non RFC):
  General:
    - Changed subdevice loading and chip version identification to use
      platform ID.
    - License identifiers changed to GPL-2.0-only
  MFD:
    - Styling fixes mostly
  DT-Bindings:
    - a few more checks as suggested by Rob Herring.
    - Order of DT patches changed.
    - me as maintainer
    - standard units to new properties (microvolts, ohms)
    - runlevel values in an array
  LED:
    - BD71828 driver added (back)
      - Added DT support
    - Added LED DT node lookup in led framework when init_data is given
      with DT node match information.
    - Added common property parsing for default-state and
      default-trigger.
  Regulators:
    - dropped sysfs interfaces
    - fixed module unload/reload by binding gpio consumer information to
      regulator device not to MFD.
  GPIO:
    - Added devm_gpiod_get_parent_array
    - added few missing devm functions to documentation

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
        dt-bindings for LEDs on BD71828 PMIC
Patch 2:
	dt-bindings for BD71828 PMIC
Patch 3:
	Convert rohm PMICs with common sub-devices to use platform_
	device_id to match MFD sub-devices
Patch 4:
	Add compatible for BD71850
Patch 5:
        BD71828 MFD core.
Patch 6:
	Power button support using GPIO keys.
Patch 7:
        CLK gate support using existing clk-bd718x7
Patch 8:
        Split existing bd718x7 regulator driver to generic ROHM dt
        parsing portion (used by more than one ROHM drivers) and
        bd718x8 specific parts
Patch 9:
        Fix BD70528 RTC HOUR mask
Patch 10:
        Support BD71828 RTC block using BD70528 RTC driver
Patch 11:
        Allow control of GP(I)O pins on BD71828 via GPIO subsystem
Patch 12:
	Add LED node lookup and common LED binding parsing support
	to LED class/core
Patch 13:
        Support toggling the LEDs on BD71828.

---

Matti Vaittinen (13):
  dt-bindings: leds: ROHM BD71282 PMIC LED driver
  dt-bindings: mfd: Document ROHM BD71828 bindings
  mfd: rohm PMICs - use platform_device_id to match MFD sub-devices
  mfd: bd718x7: Add compatible for BD71850
  mfd: bd71828: Support ROHM BD71828 PMIC - core
  mfd: input: bd71828: Add power-key support
  clk: bd718x7: Support ROHM BD71828 clk block
  regulator: bd718x7: Split driver to common and bd718x7 specific parts
  mfd: bd70528: Fix hour register mask
  rtc: bd70528: add BD71828 support
  gpio: bd71828: Initial support for ROHM BD71828 PMIC GPIOs
  leds: Add common LED binding parsing support to LED class/core
  led: bd71828: Support LED outputs on ROHM BD71828 PMIC

 .../bindings/leds/rohm,bd71828-leds.yaml      |  52 +++
 .../bindings/mfd/rohm,bd71828-pmic.yaml       | 193 ++++++++
 drivers/clk/Kconfig                           |   6 +-
 drivers/clk/clk-bd718x7.c                     |  50 ++-
 drivers/gpio/Kconfig                          |  12 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-bd71828.c                   | 159 +++++++
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/led-class.c                      | 115 ++++-
 drivers/leds/led-core.c                       | 258 +++++++++--
 drivers/leds/leds-bd71828.c                   | 118 +++++
 drivers/mfd/Kconfig                           |  15 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rohm-bd70528.c                    |   3 +-
 drivers/mfd/rohm-bd71828.c                    | 344 ++++++++++++++
 drivers/mfd/rohm-bd718x7.c                    |  43 +-
 drivers/regulator/Kconfig                     |   4 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/bd718x7-regulator.c         | 200 +++------
 drivers/regulator/rohm-regulator.c            |  95 ++++
 drivers/rtc/Kconfig                           |   3 +-
 drivers/rtc/rtc-bd70528.c                     | 220 +++++++--
 include/linux/leds.h                          |  94 +++-
 include/linux/mfd/rohm-bd70528.h              |  19 +-
 include/linux/mfd/rohm-bd71828.h              | 423 ++++++++++++++++++
 include/linux/mfd/rohm-bd718x7.h              |   6 -
 include/linux/mfd/rohm-generic.h              |  70 ++-
 include/linux/mfd/rohm-shared.h               |  21 +
 29 files changed, 2248 insertions(+), 289 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
 create mode 100644 drivers/gpio/gpio-bd71828.c
 create mode 100644 drivers/leds/leds-bd71828.c
 create mode 100644 drivers/mfd/rohm-bd71828.c
 create mode 100644 drivers/regulator/rohm-regulator.c
 create mode 100644 include/linux/mfd/rohm-bd71828.h
 create mode 100644 include/linux/mfd/rohm-shared.h


base-commit: b3a987b0264d ("Linux 5.5-rc6")
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
