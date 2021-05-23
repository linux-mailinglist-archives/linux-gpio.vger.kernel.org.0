Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E900538DD75
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 00:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbhEWWfu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 May 2021 18:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232041AbhEWWfu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 May 2021 18:35:50 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01090C061756
        for <linux-gpio@vger.kernel.org>; Sun, 23 May 2021 15:34:22 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:bd37:7535:eb00:6fa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id BB7F0202A53;
        Mon, 24 May 2021 00:34:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621809261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rgBcEqonLWzW3nDOTf2//5MFXneO/lh6fiWXZ8TFyMI=;
        b=VkjP4a64DV4ne6Ld4FychRQJlNBiD22RBXbpdc8uF6y0db1IBP7k1KNl2N2lTP9G+QcrKz
        t8k/Ss7+VajklAlbrH2pvbcnGFISdWNZa6ZMOtGT1gpU3z7JkX40hWBnzLB/rTfe0XTgQV
        RWJK0dEavYgefNBiCbK0hQOOdI50xpJDcsZDnLVUAnblUa+umWJc8lKgveslbqqErsu0Fp
        VYTGaX2mkNHYOjKMKlerQZs2pV1pG/fswerNMjgWb8+UplPprkbAOZ4P8MfHRxYm7VqT93
        OofFzc04rMbF8I3B3p472kV3FgcUg4THcIyjzTcAEYUiZOcxONfC2gXfJ9Dbog==
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
Subject: [PATCH v3 0/6] RTL8231 GPIO expander support
Date:   Mon, 24 May 2021 00:33:58 +0200
Message-Id: <cover.1621809029.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620735871.git.sander@svanheule.net>
References: <cover.1620735871.git.sander@svanheule.net>
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
    - Input debouncing on high GPIOs (currently unsupported)
  - Up to 88 LEDs in multiple scan matrix groups
    - On, off, or one of six toggling intervals
    - "single-color mode": 2×36 single color LEDs + 8 bi-color LEDs
    - "bi-color mode": (12 + 2×6) bi-color LEDs + 24 single color LEDs
  - Up to one PWM output (currently unsupported)
    - Fixed duty cycle, 8 selectable frequencies (1.2kHz - 4.8kHz)

Register access is provided through a new MDIO regmap provider. The GPIO
controller uses gpio-regmap, although a patch is required to support a
limitation of the chip.

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

Sander Vanheule (6):
  gpio: regmap: Add quirk for output data register
  dt-bindings: leds: Binding for RTL8231 scan matrix
  dt-bindings: mfd: Binding for RTL8231
  mfd: Add RTL8231 core device
  pinctrl: Add RTL8231 pin control and GPIO support
  leds: Add support for RTL8231 LED scan matrix

 .../bindings/leds/realtek,rtl8231-leds.yaml   | 166 ++++++++
 .../bindings/mfd/realtek,rtl8231.yaml         | 190 +++++++++
 drivers/gpio/gpio-regmap.c                    |  15 +-
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-rtl8231.c                   | 291 +++++++++++++
 drivers/mfd/Kconfig                           |   9 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rtl8231.c                         | 143 +++++++
 drivers/pinctrl/Kconfig                       |  11 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-rtl8231.c             | 398 ++++++++++++++++++
 include/linux/gpio/regmap.h                   |  13 +
 include/linux/mfd/rtl8231.h                   |  57 +++
 14 files changed, 1304 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
 create mode 100644 drivers/leds/leds-rtl8231.c
 create mode 100644 drivers/mfd/rtl8231.c
 create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c
 create mode 100644 include/linux/mfd/rtl8231.h

-- 
2.31.1

