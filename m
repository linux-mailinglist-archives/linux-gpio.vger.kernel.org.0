Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C568EE3084
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 13:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfJXLk1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 07:40:27 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39465 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbfJXLk1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 07:40:27 -0400
Received: by mail-lj1-f196.google.com with SMTP id y3so24654174ljj.6;
        Thu, 24 Oct 2019 04:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=uSgig7KmNQdKc2MYqqBMJQw/qpd26XOI1r2j5DbH9XY=;
        b=g5ulz8b85Lnslj4+JnRh7dKtZ/O49P0GkejSA/0Yeuyel2dYjfj3M3tQ8QMUv2PPFe
         A91GmBgt2EhLB4xKMhpfZL+VV2j7n8odF1P8tpkGA05xgEsbZX8G0UUZ3vqQPjkQKJvu
         TnBTFvLJ24Srbg4s4LD8Ks7RRJnIJrHOT3PxTwLOCz4d5ckyK0C3BCP+qFJ92Y3qrhKg
         0iYZ2OUltYy9J8gDq/1YpfIB6sJ7DF4yNFdA5nBDdMkE1jDnKzBiXZNp7lfEMMitjrTC
         BR37IKwwKecSXgGX7Ks5M3DjQujyMmUp1ZnYsPGKK+TSDEaNkBHPqBOSo+ivAfyyGJaS
         R0+A==
X-Gm-Message-State: APjAAAVl65umtP6OoAhln80NbvEx2vf7UTAgS7VNaOkrA9wWrKHEWpU0
        y1maQ/Dm427T+8cVJHjA7pM=
X-Google-Smtp-Source: APXvYqxjec6OZ9BRsNQGsaXhb8I78IjpvaYjJNidtuoA7dfEvHAXv6LtAH75rrW77yW0ZWJevBXHGA==
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr26083774ljm.77.1571917222882;
        Thu, 24 Oct 2019 04:40:22 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id p6sm6545157lfc.35.2019.10.24.04.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 04:40:21 -0700 (PDT)
Date:   Thu, 24 Oct 2019 14:40:08 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC PATCH v2 00/13] Support ROHM BD71828 PMIC
Message-ID: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
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

This patch series adds support to regulators, clk, RTC, GPIOs and LEDs.
Power-supply driver for charger is "under construction" and not included
in this RFC series.

Reason for RFC status is the regulator grouping to run-levels. I don't
know what would be the best way to do what patches 8,9 and 10 intend to
provide. (Sure some of this is visible also patches 2 and 3 which
provide dt binding documents.) All suggestions are welcome. Rest of the
patches should be business as usual.

Changelog v2: Mainly RTC and GPIO fixes suggested by Alexandre and Bartosz.
	      LED changes are still under discussion and not included in
	      this version.
  General
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
	Power button support using GPIO keys.
Patch 5:
        CLK gate support using existing clk-bd718x7
Patch 6:
        Split existing bd718x7 regulator driver to generic ROHM dt
        parsing portion (used by more than one ROHM drivers) and
        bd718x8 specific parts
Patch 7:
        Basic regulator support (individual control via I2C). This
        should be pretty standard stuff.
Patch 8:
        Add support for getting regulator voltages when GPIO controlled
        run-levels are used. Allow specifying voltages for run-levels
        via DT. Allow controlling run-levels via sysfs entries (I am not
        happy about this. Probably should only provide in-kernel API for
        this or is there better ideas? Showing can be done vis sysfs?
        Debugfs?)
Patch 9:
        Support setting/getting run-levels when they are controlled via
        I2C instead of GPIO. Add in-kernel API for settin run-level
        voltages for regulators at run-time.
Patch 10:
        Add in-kernel APIs for changing the RUN-level. Safer than sysfs
        I guess. But is there some better method for controlling this
        kind of dynamic group of regulators?
Patch 11:
        Support BD71828 RTC block using BD70528 RTC driver
Patch 12:
        Allow control of GP(I)O pins on BD71828 via GPIO subsystem
Patch 13:
        Support toggling the LEDs

This patch series is based on v5.3-rc4

---

Matti Vaittinen (13):
  mfd: bd71828: Support ROHM BD71828 PMIC - core
  dt-bindings: mfd: Document ROHM BD71828 bindings
  dt-bindings: regulator: Document ROHM BD71282 regulator bindings
  mfd: input: bd71828: Add power-key support
  clk: bd718x7: Support ROHM BD71828 clk block
  regulator: bd718x7: Split driver to common and bd718x7 specific parts
  regulator: bd71828: Basic support for ROHM bd71828 PMIC regulators
  regulator: bd71828: Add GPIO based run-level control for regulators
  regulator: bd71828: enhanced run-level support
  regulator: bd71828: Support in-kernel APIs to change run-level
  rtc: bd70528 add BD71828 support
  gpio: bd71828: Initial support for ROHM BD71828 PMIC GPIOs
  led: bd71828: Support LED outputs on ROHM BD71828 PMIC

 .../bindings/mfd/rohm,bd71828-pmic.txt        |  180 ++
 .../regulator/rohm,bd71828-regulator.txt      |  164 ++
 drivers/clk/Kconfig                           |    6 +-
 drivers/clk/clk-bd718x7.c                     |   15 +-
 drivers/gpio/Kconfig                          |   12 +
 drivers/gpio/Makefile                         |    1 +
 drivers/gpio/gpio-bd71828.c                   |  151 ++
 drivers/leds/Kconfig                          |   10 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/leds-bd71828.c                   |   97 ++
 drivers/mfd/Kconfig                           |   15 +
 drivers/mfd/Makefile                          |    2 +-
 drivers/mfd/rohm-bd71828.c                    |  350 ++++
 drivers/regulator/Kconfig                     |   16 +
 drivers/regulator/Makefile                    |    2 +
 drivers/regulator/bd71828-regulator.c         | 1443 +++++++++++++++++
 drivers/regulator/bd718x7-regulator.c         |  183 +--
 drivers/regulator/rohm-regulator.c            |   95 ++
 drivers/rtc/Kconfig                           |    5 +-
 drivers/rtc/rtc-bd70528.c                     |  145 +-
 include/linux/mfd/rohm-bd70528.h              |   13 +-
 include/linux/mfd/rohm-bd71828.h              |  432 +++++
 include/linux/mfd/rohm-generic.h              |   45 +
 include/linux/mfd/rohm-shared.h               |   27 +
 24 files changed, 3247 insertions(+), 163 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.txt
 create mode 100644 drivers/gpio/gpio-bd71828.c
 create mode 100644 drivers/leds/leds-bd71828.c
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
