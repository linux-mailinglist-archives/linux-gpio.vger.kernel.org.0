Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3172C399E48
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 12:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhFCKDD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 06:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbhFCKDC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 06:03:02 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E8CC061756
        for <linux-gpio@vger.kernel.org>; Thu,  3 Jun 2021 03:01:18 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:398f:956e:2c86:f184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 210C5208042;
        Thu,  3 Jun 2021 12:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622714476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IH3A9NYNMOqQYksVqwsvqHbo0clvcQccuKAwQC0l0YQ=;
        b=42ix+bJT/DUZcBc7i2oMW5oWVELx0LW7wc64uj4bZgwkz+z/wtDxryWBUbX3vT5Jcackqt
        0xeXg6804K+16UtzUGu2X0ocoS4ZNjrgiAQziFWasj/DmbTnlpBLAAQNhv2NzWkjcZHnML
        l2DCYElWG0MY5FCTQww5c+EP1Q/OlC144CNPLILIc9MQz0sKG9jam5Nr2l/CUOoGgXezo6
        s2nOlTB9UUCYO4bAgdgFpmkSKfSkDFDvG7LLA84VkrH2yZ3k9lK9Yi7qVgyrCUED4gEIV9
        NVrEmYTw4wL1cgjj2r3Y58KEeQ5mcC8Lvb88b8cMQhV7IlGKu9e6dGUu2iqJfg==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v4 0/5] RTL8231 GPIO expander support
Date:   Thu,  3 Jun 2021 12:00:39 +0200
Message-Id: <cover.1622713678.git.sander@svanheule.net>
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

The GPIO controller uses gpio-regmap. The assumed read-modify-write behaviour
of the data output is provided by using a cached virtual address range for the
output values.

Register access is provided through a new MDIO regmap provider. The required
MDIO regmap support was merged in Mark Brown's regmap repository, and can be
found under the regmap-mdio tag:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/tag/?h=regmap-mdio

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

Sander Vanheule (5):
  dt-bindings: leds: Binding for RTL8231 scan matrix
  dt-bindings: mfd: Binding for RTL8231
  mfd: Add RTL8231 core device
  pinctrl: Add RTL8231 pin control and GPIO support
  leds: Add support for RTL8231 LED scan matrix

 .../bindings/leds/realtek,rtl8231-leds.yaml   | 166 +++++++
 .../bindings/mfd/realtek,rtl8231.yaml         | 190 ++++++++
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-rtl8231.c                   | 291 ++++++++++++
 drivers/mfd/Kconfig                           |   9 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rtl8231.c                         | 240 ++++++++++
 drivers/pinctrl/Kconfig                       |  11 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-rtl8231.c             | 438 ++++++++++++++++++
 include/linux/mfd/rtl8231.h                   |  78 ++++
 12 files changed, 1436 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
 create mode 100644 drivers/leds/leds-rtl8231.c
 create mode 100644 drivers/mfd/rtl8231.c
 create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c
 create mode 100644 include/linux/mfd/rtl8231.h

-- 
2.31.1

