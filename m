Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F8A33F2C7
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhCQOiR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbhCQOiH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:07 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC70C06174A;
        Wed, 17 Mar 2021 07:38:06 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 12so1600326wmf.5;
        Wed, 17 Mar 2021 07:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2s5YbuhuWTd3ttLYVEHI3IRKeL8Zb/h8ik0U5PGagpM=;
        b=BtmQ8+nn2p4UpZo1NuZ9J5LoYrh0cUtNOWlV0ecqfesjM6Z1fRAyPzDLcoDdZy7H22
         WghRx0g3K2YvJk8f7Oy/m+fu9FrHc9P26XlCtCEyykFx2fViu+HaxBRJ/Ep9TL5dIxfG
         NNLfxFZzzNnGd2sVtldNOmFK5HlC7K+W184sxETQklxkdkiwj1zrS/62mM1jsNa+UnI8
         FFC1rh/6EyccAVUntNymj29YNJKKiDVwKoONofyNNSgLB8Xdh6z+y2SJ2ENYMsO3/R7P
         MdMGXc5cKj6zVGB2MYyRD0VyC5R8OHdLwlJejDQpCng7DfAFg19J0tlAcZ8O4WxfaCDg
         Wl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2s5YbuhuWTd3ttLYVEHI3IRKeL8Zb/h8ik0U5PGagpM=;
        b=ALNALMqInxjPPPnQqh1ACf7Mi2oNlHkBCZWafR1rIXZINRz45B+6n6r4Jq/SfALWw2
         88nt85/Hh0M6bFGj3oyR2bMjHSYeaODLfgua0Xn7BFM9nwXCiuUtIA1IptRCXyFuTEMB
         UilKuCcmnj6nUz7ew4YrSnG4Jdz4HRkj2g8hG4Q6cRMO79j6kflfSvVDhMNYQt+JxrXD
         caIavGEFhfrtWXGdeBMbVVsCnALKMaDzCmO8oup90WvXb2W/3qoQG4bYBBVFtYXUn7bB
         3nhmFFht7A4+p6F7gpbl0Lia/Ot+pyFSLdEB6qn/m24loTpM2gcdDaM7wRL+vXoT8jPh
         bAZQ==
X-Gm-Message-State: AOAM532//AjDOBKLzi0ct4Jd60Ek0XQfO0j5EZ9xa6Ks/ndCpkrGHoN4
        Wag7xWLcugaONr412P2RX48=
X-Google-Smtp-Source: ABdhPJyZ2ub5Tvxww9TKqSmYfzFSl5/KmZ+goALIY+lUfCr+y62XoN3Zmwm94kvsNFJUTB5KKifgsw==
X-Received: by 2002:a1c:2587:: with SMTP id l129mr3955173wml.135.1615991885587;
        Wed, 17 Mar 2021 07:38:05 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:05 -0700 (PDT)
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
Subject: [PATCH v8 00/22] pinctrl: add BCM63XX pincontrol support
Date:   Wed, 17 Mar 2021 15:37:41 +0100
Message-Id: <20210317143803.26127-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Álvaro Fernández Rojas <noltari@gmail.com>
lun, 15 mar 12:42 (hace 2 días)
para Linus, Bartosz, Rob, Florian, bcm-kernel-feedback-list, Lee, Michael, mí, Jonas, Necip, Andy, linux-gpio, devicetree, linux-arm-kernel, linux-kernel

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
 .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  78 +++
 .../mfd/brcm,bcm6318-gpio-sysctl.yaml         | 177 +++++
 .../mfd/brcm,bcm63268-gpio-sysctl.yaml        | 194 ++++++
 .../mfd/brcm,bcm6328-gpio-sysctl.yaml         | 162 +++++
 .../mfd/brcm,bcm6358-gpio-sysctl.yaml         | 130 ++++
 .../mfd/brcm,bcm6362-gpio-sysctl.yaml         | 236 +++++++
 .../mfd/brcm,bcm6368-gpio-sysctl.yaml         | 246 +++++++
 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 145 ++++
 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 166 +++++
 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 127 ++++
 .../pinctrl/brcm,bcm6358-pinctrl.yaml         |  93 +++
 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 206 ++++++
 .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 219 ++++++
 drivers/gpio/gpio-regmap.c                    |   2 +
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
 27 files changed, 5462 insertions(+), 46 deletions(-)
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

