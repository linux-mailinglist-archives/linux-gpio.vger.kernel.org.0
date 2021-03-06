Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11AD832FB7F
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Mar 2021 16:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhCFP5q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Mar 2021 10:57:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhCFP5P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Mar 2021 10:57:15 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 614E4C06174A;
        Sat,  6 Mar 2021 07:57:15 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id l11so2539924wrp.7;
        Sat, 06 Mar 2021 07:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PQalZdsjMeEdzdHCYcxnWVC/5dbAJ8TFy9uCuDo9Ako=;
        b=o3NKgj/ML2Fdw3E3yqJK5tuk6SLXj26vmLVv5fwSdc4pxjpCTcshUzfYV2L6wIE32S
         3nOt3rRhgz4lSC2GbCVbwKvZAoLQW5xob2xKo+dCcedY0gyVJo4ajLoOEtqY5CNrUY94
         lLhbmTrwMFPpkcYLFKicqGKdBmL3QxyCD2uBKwFqPQB58i7JYzhLz7ZlYITykrbaovdH
         DGzaqOG5vSFrHs1k9uYMij9+0K6rNk6kysG1o7Djad2YpP46okk54vYXw32eZCG9pAGG
         8fz5nuLqZD56llqKMXb1Dk81az47n1a9Op6TPgNJu1O1sYzd1t/kjAbpGHsFd1T/Mc9i
         VlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PQalZdsjMeEdzdHCYcxnWVC/5dbAJ8TFy9uCuDo9Ako=;
        b=RvYXE4zPchuKkexzW64EHT0zf+HJfrro4UkjAby1ntb+lfflnzKRGuJcBp2e7fdCWO
         X3hIUEikNjjUSnpSPecal7ihQSLr8oY22DJzY3OAumm/Rsfr7P0DcgovjQMr1z7y271A
         KmYezh7tAKO+MTLLcfsNKyA7JSW8jclIP12iXGlzejOblQP0B8Ya6+B9F97lU39o/V3b
         0h/hruReADj+bZF7K4oKVBr9SF3Y97BtjI5xusQdqlYZlOvAOh2jpkgvN/FvV4R46RYg
         oSHrRtY90aKGfdYIzvhRdCDAdLuu2fiAEuXapToq24ZcHLNYktlZPmb7XcZmpXlzHK0p
         DSYQ==
X-Gm-Message-State: AOAM532s6CEar4N/w+rt9VWOS5qmQPiSa5257P2PspgoUuIYRojSIDga
        mCK/NV36STYXA9DCOeCToD8=
X-Google-Smtp-Source: ABdhPJzEBvk+0qZ4wvxReTAxapkrIp8filPkdGIzJhEQdXgrvO5MFR2TVnQtuRf70m0gy4D42Cj61A==
X-Received: by 2002:a5d:6307:: with SMTP id i7mr14876883wru.305.1615046234018;
        Sat, 06 Mar 2021 07:57:14 -0800 (PST)
Received: from skynet.lan (224.red-2-138-103.dynamicip.rima-tde.net. [2.138.103.224])
        by smtp.gmail.com with ESMTPSA id p6sm9315188wru.2.2021.03.06.07.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 07:57:13 -0800 (PST)
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
Subject: [PATCH v5 00/15] pinctrl: add BCM63XX pincontrol support
Date:   Sat,  6 Mar 2021 16:56:57 +0100
Message-Id: <20210306155712.4298-1-noltari@gmail.com>
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

 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 187 +++++
 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 208 ++++++
 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 171 +++++
 .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 137 ++++
 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 250 +++++++
 .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 261 +++++++
 drivers/gpio/gpio-regmap.c                    |   4 +
 drivers/pinctrl/bcm/Kconfig                   |  55 ++
 drivers/pinctrl/bcm/Makefile                  |   7 +
 drivers/pinctrl/bcm/pinctrl-bcm6318.c         | 498 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63268.c        | 643 ++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6328.c         | 404 +++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6358.c         | 369 ++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6362.c         | 617 +++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6368.c         | 523 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c         | 112 +++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h         |  43 ++
 include/linux/gpio/driver.h                   |   9 +
 include/linux/gpio/regmap.h                   |   3 +
 19 files changed, 4501 insertions(+)
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

