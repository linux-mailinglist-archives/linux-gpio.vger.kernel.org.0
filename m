Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B0D347344
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 09:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236056AbhCXIUL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 04:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhCXIT1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 04:19:27 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119CBC061763;
        Wed, 24 Mar 2021 01:19:27 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v4so23466328wrp.13;
        Wed, 24 Mar 2021 01:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7KTYRa1M2z/M7l2OycLEcjGE1R0wI+YbNxmKE4zI32E=;
        b=XNpoNoIG0eLshP8+I9tvxLPWtqLIy54nOG5uXq9K8zuG+F/spLeKcTncr6n3LUNYZ/
         5SF00wVdmpgmxKl3lhpZjo2VirB53h6Q8CtCJERgwy+bnev71owIim9EQYfqJt10ujZn
         0B4eri7z9t7LynMEb7G/kCPR8SkH3h2ji9nSkVqq2eA34Vxh2B2qWtva+6+L1/9EVRTK
         gAjcMWZshBO4i1XOhpWBG0KLg7N3KPLhlWXrUiU0AAhmOM356N6TRD+tzhvHp13sVuny
         buNXO+B7dAKJuvgBDO1rPa+STIoQWexvFvQlYEYeczZgF7jrNOf6Ooq8TM3GcGHd3Ujt
         trmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7KTYRa1M2z/M7l2OycLEcjGE1R0wI+YbNxmKE4zI32E=;
        b=iu/eLm+LUbZQqq9fQCA11+IrjUP2qAAixQDAfF87nHtxL4aIgS4IxosHPW422O91C2
         xmtYr0NpdMzjtWG9JelyeegTbeYxD/3kZ9MQdaZmgXACRrC4+FwEz073u0DBm9MOEjSD
         kb3efpjdR9SI5B9tqHld67PJ+2qzVOJ4qAzcnr8ZbKdpqJGvCHgTMU4dwkvo84Bs3grN
         kOcyuR5hw7qOV/7K+3NF/zuaadPQoXF9hSwyJN3T07hWh0/9bAPmq/cPUg1yvq1jStgw
         4wzoDhVFjI3CnQTVpDVcY7dZqCAtOEDwWItqC7Nd29ITuzqjTU7X7WeOsiWDaocUTVTa
         rkhA==
X-Gm-Message-State: AOAM53308zmqNEvhyOHCBk1ybSD60rhuVWPE28m2TlMC8bfn6wTtSv8e
        EjnUa+hkcjBM4QkHq9wwveE=
X-Google-Smtp-Source: ABdhPJzGz/Uces9lfJIfLy8CH8rb1WtOwV5mxqFN4U0BNPu6+6hDvV545FT4G90i0aFVsqTtDqa1eQ==
X-Received: by 2002:adf:e791:: with SMTP id n17mr2109596wrm.322.1616573965690;
        Wed, 24 Mar 2021 01:19:25 -0700 (PDT)
Received: from skynet.lan (51.red-83-44-13.dynamicip.rima-tde.net. [83.44.13.51])
        by smtp.gmail.com with ESMTPSA id x25sm1498578wmj.14.2021.03.24.01.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 01:19:25 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 00/22] pinctrl: add BCM63XX pincontrol support
Date:   Wed, 24 Mar 2021 09:19:01 +0100
Message-Id: <20210324081923.20379-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

First of all, I've based this on the patches sent by Jonas Gorski back in
2016:
https://www.spinics.net/lists/linux-gpio/msg15983.html
http://patchwork.ozlabs.org/project/linux-gpio/patch/1471604025-21575-2-git-send-email-jonas.gorski@gmail.com/

I've tried to address all coments from Linus Walleij, but I know that
this may still need some other modifications

This patchset adds appropriate binding documentation and drivers for
pin controller cores found in the BCM63XX MIPS SoCs currently supported.

While the GPIO part is always the same, the pinmux part varies quite a
lot between different SoCs. Sometimes they have defined groups which
can be muxed into different functions, sometimes each function has a
different group. Sometimes you can mux individual pins. Often it is a
combination of single pins and groups.

Some core versions require the GPIO direction to be set according to the
function, most do not. Sometimes the mux register(s) contain bits for
unrelated other functions.

v9: introduce changes suggested by Rob Herring and Andy Shevchenko.
v8: introduce changes suggested by Rob Herring.
v7: introduce changes suggested by Rob Herring.
v6: introduce changes suggested by Rob Herring and Andy Shevchenko.
v5: introduce changes suggested by Andy Shevchenko.
v4: fix gpiochip_irqchip_add_domain(), remove IRQ Kconfig selections and add
 missing of_node_put().
v3: introduce new files for shared code and add more changes suggested by
 Linus Walleij. Also add a new patch needed for properly parsing gpio-ranges.
v2: introduce changes suggested by Linus Walleij and remove interrupts
 - In order to use GPIO_REGMAP, the need to get gpio_chip from gpio_regmap
 and use it for pinctrl_add_gpio_range() and gpio_chip.direction_input()
 and gpio_chip.direction_output().

Álvaro Fernández Rojas (22):
  gpio: guard gpiochip_irqchip_add_domain() with GPIOLIB_IRQCHIP
  gpio: regmap: set gpio_chip of_node
  dt-bindings: improve BCM6345 GPIO binding documentation
  pinctrl: bcm: add bcm63xx base code
  dt-bindings: add BCM6328 pincontroller binding documentation
  dt-bindings: add BCM6328 GPIO sysctl binding documentation
  pinctrl: add a pincontrol driver for BCM6328
  dt-bindings: add BCM6358 pincontroller binding documentation
  dt-bindings: add BCM6358 GPIO sysctl binding documentation
  pinctrl: add a pincontrol driver for BCM6358
  dt-bindings: add BCM6362 pincontroller binding documentation
  dt-bindings: add BCM6362 GPIO sysctl binding documentation
  pinctrl: add a pincontrol driver for BCM6362
  dt-bindings: add BCM6368 pincontroller binding documentation
  dt-bindings: add BCM6368 GPIO sysctl binding documentation
  pinctrl: add a pincontrol driver for BCM6368
  dt-bindings: add BCM63268 pincontroller binding documentation
  dt-bindings: add BCM63268 GPIO sysctl binding documentation
  pinctrl: add a pincontrol driver for BCM63268
  dt-bindings: add BCM6318 pincontroller binding documentation
  dt-bindings: add BCM6318 GPIO sysctl binding documentation
  pinctrl: add a pincontrol driver for BCM6318

 .../bindings/gpio/brcm,bcm6345-gpio.txt       |  46 --
 .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  86 +++
 .../mfd/brcm,bcm6318-gpio-sysctl.yaml         | 177 +++++
 .../mfd/brcm,bcm63268-gpio-sysctl.yaml        | 194 ++++++
 .../mfd/brcm,bcm6328-gpio-sysctl.yaml         | 162 +++++
 .../mfd/brcm,bcm6358-gpio-sysctl.yaml         | 130 ++++
 .../mfd/brcm,bcm6362-gpio-sysctl.yaml         | 236 +++++++
 .../mfd/brcm,bcm6368-gpio-sysctl.yaml         | 246 +++++++
 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 143 ++++
 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 164 +++++
 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 127 ++++
 .../pinctrl/brcm,bcm6358-pinctrl.yaml         |  93 +++
 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 206 ++++++
 .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 217 ++++++
 drivers/gpio/gpio-regmap.c                    |   5 +
 drivers/pinctrl/bcm/Kconfig                   |  55 ++
 drivers/pinctrl/bcm/Makefile                  |   7 +
 drivers/pinctrl/bcm/pinctrl-bcm6318.c         | 498 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63268.c        | 643 ++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6328.c         | 404 +++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6358.c         | 369 ++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6362.c         | 617 +++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6368.c         | 523 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c         | 109 +++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h         |  43 ++
 include/linux/gpio/driver.h                   |   9 +
 include/linux/gpio/regmap.h                   |   4 +
 27 files changed, 5467 insertions(+), 46 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6318.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63268.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6328.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6358.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6362.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6368.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63xx.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63xx.h

-- 
2.20.1

