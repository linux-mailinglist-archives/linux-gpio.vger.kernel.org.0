Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF52333CEB
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 13:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhCJMzc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 07:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232587AbhCJMzI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 07:55:08 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79908C061761;
        Wed, 10 Mar 2021 04:55:08 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id w7so7027595wmb.5;
        Wed, 10 Mar 2021 04:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z9wafjPmliogQilYQ/SiuahhJr0k+q3femmouDI2IPQ=;
        b=GnGmjSvP81qVujYQaO8vAOoxvzoCz63Gh1OAU9amDWWXXY5Sh0s2+28ALqRcM0EJdX
         +x51MSt5umL6Y/B8rykylZqZ7nGwyzN/wWJZFfHIRs65gGDh+lsOkHH9WeKR9fdWCyRG
         HjyjPaY4W5cymyy2AvT5y3pElkpxoy+JWWj+yF9dhU9Mrx0OeBHBVSZPlSipS2xED+g0
         wUQLXVCRvuHoNGawE02AQsPFBFRGdPKu0alNjrMiFoYBWH/D07xPTHe9Md0+L8QWhOmW
         2GGl9BaU+XmxWoGry/9MdVm+AVRXxj/rwAMhAgvkpy6N2T2wuJXE/ccEKnBLVzH0om+4
         trQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z9wafjPmliogQilYQ/SiuahhJr0k+q3femmouDI2IPQ=;
        b=EHNG7J/E6pxY1IaJ9vyBSg4KpexAOBvvkwoK+yb6ZOeLg9oFkHMZqM1M2w+6xjAkPX
         T69J1EvEAhtPO42obo9MVcVul1SS8EQ1WxF3W1geAv+2m4shbwNd9dSOo2tRQEtnDVdX
         E8N7DsVFbkkBuQIDOSzkt+zyYT3oPJ3iC3eZNhetlnnkY3ycmEsuWTPKWQ1yuif+7o9H
         PEsB+vr2oBdiodN3NbuUmy4rhZ0ZpfcNUw39L/KlCTOjutVMVN8K/dJydwyS9cgG7j6R
         Ad8WnSQr/QrZ6k8HXN3OlpNi7X7fuX7+/Z4JwSOhK+EXlH8XgoTO/4b7pKixvZsaesMQ
         ZbCw==
X-Gm-Message-State: AOAM531gwL+hklUTj/26Jq0gHd/27Vk62HoqpWFS2IMNAYD0i98GDPZi
        Cg8IWlDiYEgjVlb3iBL3EeA=
X-Google-Smtp-Source: ABdhPJzPMNjl9Bu4OpYJp5hMRraEC7fFVMMjBS7mWnkqs4LpWC2CM7OSkjjm6ZR0azGS+TQMeraNOw==
X-Received: by 2002:a1c:bc8a:: with SMTP id m132mr3156396wmf.6.1615380906998;
        Wed, 10 Mar 2021 04:55:06 -0800 (PST)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v6sm29403398wrx.32.2021.03.10.04.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 04:55:06 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 00/15] pinctrl: add BCM63XX pincontrol support
Date:   Wed, 10 Mar 2021 13:54:48 +0100
Message-Id: <20210310125504.31886-1-noltari@gmail.com>
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

Álvaro Fernández Rojas (15):
  gpio: guard gpiochip_irqchip_add_domain() with GPIOLIB_IRQCHIP
  gpio: regmap: set gpio_chip of_node
  pinctrl: bcm: add bcm63xx base code
  dt-bindings: add BCM6328 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6328
  dt-bindings: add BCM6358 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6358
  dt-bindings: add BCM6362 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6362
  dt-bindings: add BCM6368 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6368
  dt-bindings: add BCM63268 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM63268
  dt-bindings: add BCM6318 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6318

 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 190 ++++++
 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 211 ++++++
 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 174 +++++
 .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 140 ++++
 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 253 +++++++
 .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 264 +++++++
 drivers/gpio/gpio-regmap.c                    |   1 +
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
 19 files changed, 4518 insertions(+)
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

