Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCE6330B63
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 11:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbhCHKji (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 05:39:38 -0500
Received: from mail-lj1-f179.google.com ([209.85.208.179]:44863 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbhCHKjQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 05:39:16 -0500
Received: by mail-lj1-f179.google.com with SMTP id r25so15390315ljk.11;
        Mon, 08 Mar 2021 02:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=2ix2Opgr3c569Pm2cWE4kGR7oYQ1dcLNUE+xhanB+/Y=;
        b=S/lMnSGWbIa3sXOf5tU+v5ycpSXlh3xuQMhquXxO1awmWSykXVonxVbRQZysi8FWqn
         jHlFQ9JntfxNs7EuTFYwB6OGSAG5aban8pvKpLjtDIb37EaJn0gm5CoqvShGbr4pcUU3
         kpb1Wt9wgOQgYjZLcRqg+mOpUmrpwstTraFYcugYXSfCrNxAKrg2KPV8T2QpLRv04QGI
         j2X8vnChwFXweQjAWwlS2ym7oOh/qU9LNL567tel16hZMOs+n6VuSnY40YEZL8PeTelq
         CQ/zz8XREnYVS/LFO/ZhW47Hsj9/+SeGhnX6UP/C9mVQiW47+PFyXkiBAyJ6rzU7Vnra
         m6VA==
X-Gm-Message-State: AOAM532CeU6k/FAdPBIbNL9jXKs6e1ewYY1zciBae0illkmOyZKtQLTB
        cYYkaRIWRlrcsxI8ySY2lKo=
X-Google-Smtp-Source: ABdhPJyxDZK+J/TI4Sd7AOsQgW4DIy4exeiSY5pvwI8sPJty57hh/Uuni4jiAEA8cM/nXjbAytiS/A==
X-Received: by 2002:a2e:9857:: with SMTP id e23mr13640811ljj.78.1615199954536;
        Mon, 08 Mar 2021 02:39:14 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id h18sm1315801lft.4.2021.03.08.02.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 02:39:13 -0800 (PST)
Date:   Mon, 8 Mar 2021 12:39:07 +0200
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
Subject: [PATCH v3 00/15] Support ROHM BD71815 PMIC
Message-ID: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
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


Matti Vaittinen (15):
  rtc: bd70528: Do not require parent data
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
 drivers/regulator/bd71815-regulator.c         | 682 ++++++++++++++++++
 drivers/regulator/helpers.c                   |  36 +-
 drivers/regulator/rohm-regulator.c            |  23 +-
 drivers/rtc/Kconfig                           |   6 +-
 drivers/rtc/rtc-bd70528.c                     | 104 ++-
 include/linux/mfd/rohm-bd71815.h              | 563 +++++++++++++++
 include/linux/mfd/rohm-bd71828.h              |   3 +
 include/linux/mfd/rohm-bd718x7.h              |  13 -
 include/linux/mfd/rohm-generic.h              |   7 +-
 include/linux/regulator/driver.h              |   2 +
 23 files changed, 2289 insertions(+), 228 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
 create mode 100644 drivers/gpio/gpio-bd71815.c
 create mode 100644 drivers/regulator/bd71815-regulator.c
 create mode 100644 include/linux/mfd/rohm-bd71815.h


base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
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
