Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC58E383D4A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 21:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233598AbhEQT3v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 15:29:51 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:57302 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233590AbhEQT3u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 15:29:50 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:404a:340a:91cb:c07b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 8287C1FFBF5;
        Mon, 17 May 2021 21:28:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621279710;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z892+cBMUoR6h2qwKMWaHXpyck1ubQ4aEjm1aZtw54w=;
        b=zih5OlFARljwGDVd2qvYp/GSifRKtFvaWFyQ/5ka2KVzWmZh2ZwvZ5xDxFfDIGVRW/YJyS
        XF0wv0kJKPLkWieJ9AUcsZ79yyuGW82xeBiL8BrSeny+IBXCgarzV5erxUTHOC5X+HXU7H
        wdbdlwhT1zYIt9z6voiXX4OyYCqPl424SRL0gg6fgQ8uujrBm+sKjA+x28F2V6bMYKGbkQ
        yOTkDfDNTH5Fx1xKgTameT5b7F7y6Iz78Pykc/MdYajACzRzAOZo7DjeNPScQDEDEGB3qO
        G5iglzOsI/ycZ0/Eqov/W3xq3c7kgJxC4uqJzRq7/Zm5ooFgU3xJ5I3dG/rogg==
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
Subject: [PATCH v2 0/7] RTL8231 GPIO expander support
Date:   Mon, 17 May 2021 21:28:02 +0200
Message-Id: <cover.1621279162.git.sander@svanheule.net>
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

There remain some log warnings when probing the device, possibly due to the way
I'm using the MFD subsystem. Would it be possible to avoid these?
[    2.602242] rtl8231-pinctrl: Failed to locate of_node [id: -2]
[    2.609380] rtl8231-pinctrl rtl8231-pinctrl.0.auto: no of_node; not parsing pinctrl DT

When no 'leds' sub-node is specified:
[    2.922262] rtl8231-leds: Failed to locate of_node [id: -2]
[    2.967149] rtl8231-leds rtl8231-leds.1.auto: no of_node; not parsing pinctrl DT
[    2.975673] rtl8231-leds rtl8231-leds.1.auto: scan mode missing or invalid
[    2.983531] rtl8231-leds: probe of rtl8231-leds.1.auto failed with error -22

Changes since v1:
  - Reintroduce MDIO regmap, with fixed Kconfig dependencies
  - Add configurable dir/value order for gpio-regmap direction_out call
  - Drop allocations for regmap fields that are used only on init
  - Move some definitions to MFD header
  - Add PM ops to replace driver remove for MFD
  - Change pinctrl driver to (modified) gpio-regmap
  - Change leds driver to use fwnode
Link: https://lore.kernel.org/lkml/cover.1620735871.git.sander@svanheule.net/

Changes since RFC:
  - Dropped MDIO regmap interface. I was unable to resolve the Kconfig
    dependency issue, so have reverted to using regmap_config.reg_read/write.
  - Added pinctrl support
  - Added LED support
  - Changed root device to MFD, with pinctrl and leds child devices. Root
    device is now an mdio_device driver.
Link: https://lore.kernel.org/linux-gpio/cover.1617914861.git.sander@svanheule.net/

Sander Vanheule (7):
  regmap: Add MDIO bus support
  gpio: regmap: Add configurable dir/value order
  dt-bindings: leds: Binding for RTL8231 scan matrix
  dt-bindings: mfd: Binding for RTL8231
  mfd: Add RTL8231 core device
  pinctrl: Add RTL8231 pin control and GPIO support
  leds: Add support for RTL8231 LED scan matrix

 .../bindings/leds/realtek,rtl8231-leds.yaml   | 159 ++++++++
 .../bindings/mfd/realtek,rtl8231.yaml         | 202 ++++++++++
 drivers/base/regmap/Kconfig                   |   6 +-
 drivers/base/regmap/Makefile                  |   1 +
 drivers/base/regmap/regmap-mdio.c             |  57 +++
 drivers/gpio/gpio-regmap.c                    |  20 +-
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-rtl8231.c                   | 293 ++++++++++++++
 drivers/mfd/Kconfig                           |   9 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rtl8231.c                         | 153 +++++++
 drivers/pinctrl/Kconfig                       |  11 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-rtl8231.c             | 377 ++++++++++++++++++
 include/linux/gpio/regmap.h                   |   3 +
 include/linux/mfd/rtl8231.h                   |  57 +++
 include/linux/regmap.h                        |  36 ++
 18 files changed, 1393 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
 create mode 100644 drivers/base/regmap/regmap-mdio.c
 create mode 100644 drivers/leds/leds-rtl8231.c
 create mode 100644 drivers/mfd/rtl8231.c
 create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c
 create mode 100644 include/linux/mfd/rtl8231.h

-- 
2.31.1

