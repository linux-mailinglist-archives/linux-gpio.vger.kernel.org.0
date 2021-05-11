Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D967337A68C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 14:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhEKM0n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 08:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbhEKM0i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 May 2021 08:26:38 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D18C061574
        for <linux-gpio@vger.kernel.org>; Tue, 11 May 2021 05:25:32 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:a5bf:613f:4f5:f348])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 33A251FCC1D;
        Tue, 11 May 2021 14:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1620735930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=pXFaVKy+wOmrEMOM/qypVknWMmqZIUQ8HWg1Wk58Nog=;
        b=TWR+oI/pYIXBY09oaovraxNH/t2wtW94gjy2gKL2OBx97uK6shZ6G7RyrHFGZNfi9Iq6zq
        zuTqQbRmQNCb0wFTw/xa35Eh+53NpIqjprfk79srhtc7xkQ7KoYy+QnBORgzzjTdwCwSwP
        ZkCqrqHNICjn20ppyc4APQXzURnIfBkIfINn7qZIJ17y5Vogot9ZaXLPD/YpDjLo8+DhvR
        x1+VEtu7qXWD+moX75raBZoX2J5Irb1dKH79BHzrSO+Yy91l4MbDkXPXQPxi99Uw5tISZH
        tIAmqh7Pk374OaHF7roTED/rhGphcVHgomUl6Sq5F1ECrqeN0OufZ8eUZNwUVQ==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 0/5] RTL8231 GPIO expander support
Date:   Tue, 11 May 2021 14:25:18 +0200
Message-Id: <cover.1620735871.git.sander@svanheule.net>
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
    - Input debouncing on high GPIOs (currently unsupported)
  - Up to 88 LEDs in multiple scan matrix groups
    - On, off, or one of six toggling intervals
    - "single-color mode": 2×36 single color LEDs + 8 bi-color LEDs
    - "bi-color mode": (12 + 2×6) bi-color LEDs + 24 single color LEDs
  - Up to one PWM output (currently unsupported)
    - Fixed duty cycle, 8 selectable frequencies (1.2kHz - 4.8kHz)

There remain some log warnings when probing the device, possibly due to the way
I'm using the MFD subsystem. Would it be possible to avoid these?
[    2.602242] rtl8231-pinctrl: Failed to locate of_node [id: -2]
[    2.609380] rtl8231-pinctrl rtl8231-pinctrl.0.auto: no of_node; not parsing pinctrl DT

When no 'leds' sub-node is specified:
[    2.922262] rtl8231-leds: Failed to locate of_node [id: -2]
[    2.967149] rtl8231-leds rtl8231-leds.1.auto: no of_node; not parsing pinctrl DT
[    2.975673] rtl8231-leds rtl8231-leds.1.auto: scan mode missing or invalid
[    2.983531] rtl8231-leds: probe of rtl8231-leds.1.auto failed with error -22

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

 .../bindings/leds/realtek,rtl8231-leds.yaml   | 159 ++++++
 .../bindings/mfd/realtek,rtl8231.yaml         | 202 +++++++
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-rtl8231.c                   | 281 ++++++++++
 drivers/mfd/Kconfig                           |   9 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rtl8231.c                         | 163 ++++++
 drivers/pinctrl/Kconfig                       |  10 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-rtl8231.c             | 497 ++++++++++++++++++
 include/linux/mfd/rtl8231.h                   |  49 ++
 12 files changed, 1383 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
 create mode 100644 drivers/leds/leds-rtl8231.c
 create mode 100644 drivers/mfd/rtl8231.c
 create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c
 create mode 100644 include/linux/mfd/rtl8231.h

-- 
2.31.1

