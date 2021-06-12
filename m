Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 106A13A50CE
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 23:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhFLVPj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 17:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbhFLVPi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Jun 2021 17:15:38 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C399DC061574
        for <linux-gpio@vger.kernel.org>; Sat, 12 Jun 2021 14:13:37 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:a4dd:c59:8cbd:ee0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 8619120C9CB;
        Sat, 12 Jun 2021 23:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1623532413;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zY3uAKWoBS4HTwQVc15m3cJceRfFQ8cEND+kw0FBIxA=;
        b=Ttwn1Z/VZzlJV0k2mcMc29so5hE3c+NWahTxUPWmuJ3qTb1+xmKzlVUaX5JNex1qwFF2Bs
        ac430hyuUaFo6QjDUloYTPgRfvDzELOhUVAMmzB23l1dTMmEypnuRLGm0wHhhhShMxqy0J
        MIboM21u4X2sNn43GmzOIxLDP7JoH9+PlbRpN1hQxrHsagCifNSS3gX9FuGGw6sC2nBePq
        kweKp5fD5ekFLjaaH9pTKUa65dIw5YvpHkz/qMOu43G+QBM4E4uCp7E3ka9yjPQetdtTm0
        4v8MvgZzHmpPkCevVEn6tR7rMGxU144eFcQ6UGvNZ1cNNnmxY3pYMnHYwlRHAw==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v5 0/8] RTL8231 GPIO expander support
Date:   Sat, 12 Jun 2021 23:12:30 +0200
Message-Id: <cover.1623532208.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The RTL8231 GPIO and LED expander can be configured for use as an MDIO or SMI
bus device. Currently only the MDIO mode is supported, although SMI mode
support should be fairly straightforward, once an SMI bus driver is available.

Provided features by the RTL8231:
  - Up to 37 GPIOs
    - Configurable drive strength: 8mA or 4mA (currently unsupported)
    - Input debouncing on GPIOs 31-36
  - Up to 88 LEDs in multiple scan matrix groups
    - On, off, or one of six toggling intervals
    - "single-color mode": 2×36 single color LEDs + 8 bi-color LEDs
    - "bi-color mode": (12 + 2×6) bi-color LEDs + 24 single color LEDs
  - Up to one PWM output (currently unsupported)
    - Fixed duty cycle, 8 selectable frequencies (1.2kHz - 4.8kHz)

The GPIO controller uses gpio-regmap. To support the aliased data input and
output registers, the regmap interface is extended to supported atomic,
uncached register reads. This is then used with a new quirk for gpio-regmap.

Register access is provided through a new MDIO regmap provider. The required
MDIO regmap support was merged in Mark Brown's regmap repository, and can be
found under the regmap-mdio tag:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/tag/?h=regmap-mdio

---
Another revision of this patch series, now without (virtual) register paging.
After a few other (failed) attemps, I added a call to the regmap interface to
perform atomic, uncached register reads. Combined with the appropriate caching
of the register values, this can provide a split view of the data registers for
gpio-regmap. See patches 1/7 and 2/7.

These additions allowed the MFD core driver to be a bit less complex. The GPIO
support didn't see significant changes, so I've kept the review tags. The
bindings and LED driver are unchanged.

With this patch series (hopefully) nearing its final form, I was wondering if
this could be merged via the MFD tree, when all the necessary reviews and/or
acks are present. Would that be OK for everyone?

Changes since v4:
  - List myself as maintainer for this chip
  - Add uncached register reads to regmap; replaces virtual registers
Link: https://lore.kernel.org/lkml/cover.1622713678.git.sander@svanheule.net/

Changes since v3:
  - Drop gpio-regmap direction-before-value quirk
  - Use secondary virtual register range to enable proper read-modify-write
    behaviour on GPIO output values
  - Add pin debounce support
  - Switch to generic pinmux functions

Changes since v2:
  - MDIO regmap support was merged, so patch is dropped here
  - Implement feedback for DT bindings
  - Use correct module names in Kconfigs
  - Fix k*alloc return value checks
  - Introduce GPIO regmap quirks to set output direction first
  - pinctrl: Use static pin descriptions for pin controller
  - pinctrl: Fix gpio consumer resource leak
  - mfd: Replace CONFIG_PM-ifdef'ery
  - leds: Rename interval to interval_ms

Changes since v1:
  - Reintroduce MDIO regmap, with fixed Kconfig dependencies
  - Add configurable dir/value order for gpio-regmap direction_out call
  - Drop allocations for regmap fields that are used only on init
  - Move some definitions to MFD header
  - Add PM ops to replace driver remove for MFD
  - Change pinctrl driver to (modified) gpio-regmap
  - Change leds driver to use fwnode

Changes since RFC:
  - Dropped MDIO regmap interface. I was unable to resolve the Kconfig
    dependency issue, so have reverted to using regmap_config.reg_read/write.
  - Added pinctrl support
  - Added LED support
  - Changed root device to MFD, with pinctrl and leds child devices. Root
    device is now an mdio_device driver.

Sander Vanheule (8):
  regmap: Support atomic forced uncached reads
  gpio: regmap: Add quirk for aliased data registers
  dt-bindings: leds: Binding for RTL8231 scan matrix
  dt-bindings: mfd: Binding for RTL8231
  mfd: Add RTL8231 core device
  pinctrl: Add RTL8231 pin control and GPIO support
  leds: Add support for RTL8231 LED scan matrix
  MAINTAINERS: Add RTL8231 MFD driver

 .../bindings/leds/realtek,rtl8231-leds.yaml   | 166 +++++++
 .../bindings/mfd/realtek,rtl8231.yaml         | 190 ++++++++
 MAINTAINERS                                   |  10 +
 drivers/base/regmap/regmap.c                  |  33 ++
 drivers/gpio/gpio-regmap.c                    |   7 +-
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-rtl8231.c                   | 291 ++++++++++++
 drivers/mfd/Kconfig                           |   9 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rtl8231.c                         | 186 ++++++++
 drivers/pinctrl/Kconfig                       |  11 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-rtl8231.c             | 438 ++++++++++++++++++
 include/linux/gpio/regmap.h                   |  13 +
 include/linux/mfd/rtl8231.h                   |  71 +++
 include/linux/regmap.h                        |   8 +
 17 files changed, 1445 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
 create mode 100644 drivers/leds/leds-rtl8231.c
 create mode 100644 drivers/mfd/rtl8231.c
 create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c
 create mode 100644 include/linux/mfd/rtl8231.h

-- 
2.31.1

