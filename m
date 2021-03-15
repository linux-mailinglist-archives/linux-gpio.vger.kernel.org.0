Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0349C33B15B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhCOLms (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhCOLmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:19 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51EE4C061574;
        Mon, 15 Mar 2021 04:42:18 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so2144988wmq.1;
        Mon, 15 Mar 2021 04:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CZ4o44VN67SngoagcuOsHI3wdJFUzIRPY1Jka8gdm00=;
        b=OLR/pPqJwWErDKHhxpklSMpwDpjG+8mMVjxCWj1MlDFUR1RdzPCwNe1KEQ3kDM5J/l
         YZbqzgA5Jq72GIVGEBi5rXOW2y0KeBu9Z1kO/dryyOXKjP+ncGOQWg+uCP+j2v3Aek1i
         +8gZnvTcMRLc/wSZZY1tS+8E6ZQyWd7XePQZ2xKjnNPu1G02FijdIlaWq1b6SisKw80Y
         c85YWPHdfmaMkjT9O8i22Yk7oKV53RRmQw0YYWmh7Zq9s/17X5thdOhpZ6aBinJOdgF4
         BG3BjTF2vfhY5I+YFkD3cpAS2PbhmccvcfF4GyEexPtQ3/FQibBG5cfbi7vLe6P087eL
         +U5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CZ4o44VN67SngoagcuOsHI3wdJFUzIRPY1Jka8gdm00=;
        b=sT/FQuqglBsmDR1LQ3Kt5aT9JdDktxfgjc/zsZoelc4UcvU1nJCTTfAwu3mpPNCQDA
         cw+LjBKJEG/EBGo7M61vmzZLM7nR5lIyhHpRHmP0s5w7MPWKCmyRniPIgUtPQqElUSn9
         e9STzkuQHE1UbFnw1TCgYog+zArmFwSoLBFLMWy1DB5q+g6nLzcm8FAORguJOEYwX4kx
         VQLjNwYt2SNZ/QRAL5OBZn78K0Yqd+OR+n9qVFJI9NZ5uYTsgssH4RcJghr/31dz2q1j
         aSr3GhBOiU7lzczB1EO9JoHt2HxM3tg7Q4fC9zUCYWKFHy+M7ZUrVPv56Lq4pI7fBnCX
         FGxw==
X-Gm-Message-State: AOAM532tzn4Fp5h+QBzjhbp2P9mzDupyq5kP/sVQOwDtnq8uAOgOclwX
        eFRdoLxs45zkNNYGRtRdhoY=
X-Google-Smtp-Source: ABdhPJyIb2L+D5GFNzesGuoKgblo8rS1r0ZQZGKEu8TCFf7bO2Z3ep9sgLZ5nHyiOOkgPwHi3EolsQ==
X-Received: by 2002:a7b:c3c1:: with SMTP id t1mr25326625wmj.47.1615808536906;
        Mon, 15 Mar 2021 04:42:16 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:16 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 00/22] pinctrl: add BCM63XX pincontrol support
Date:   Mon, 15 Mar 2021 12:41:52 +0100
Message-Id: <20210315114214.3096-1-noltari@gmail.com>
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
  dt-bindings: add BCM63XX GPIO binding documentation
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

 .../bindings/gpio/brcm,bcm63xx-gpio.yaml      |  83 +++
 .../mfd/brcm,bcm6318-gpio-sysctl.yaml         | 179 +++++
 .../mfd/brcm,bcm63268-gpio-sysctl.yaml        | 196 ++++++
 .../mfd/brcm,bcm6328-gpio-sysctl.yaml         | 164 +++++
 .../mfd/brcm,bcm6358-gpio-sysctl.yaml         | 132 ++++
 .../mfd/brcm,bcm6362-gpio-sysctl.yaml         | 238 +++++++
 .../mfd/brcm,bcm6368-gpio-sysctl.yaml         | 248 +++++++
 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 148 ++++
 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 169 +++++
 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 132 ++++
 .../pinctrl/brcm,bcm6358-pinctrl.yaml         |  98 +++
 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 211 ++++++
 .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 222 ++++++
 drivers/gpio/gpio-regmap.c                    |   2 +
 drivers/pinctrl/bcm/Kconfig                   |  55 ++
 drivers/pinctrl/bcm/Makefile                  |   7 +
 drivers/pinctrl/bcm/pinctrl-bcm6318.c         | 498 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63268.c        | 643 ++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6328.c         | 404 +++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6358.c         | 369 ++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6362.c         | 617 +++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6368.c         | 523 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c         | 113 +++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h         |  43 ++
 include/linux/gpio/driver.h                   |   9 +
 include/linux/gpio/regmap.h                   |   4 +
 26 files changed, 5507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
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

