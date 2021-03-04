Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7099A32CEF7
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236915AbhCDI6F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236954AbhCDI54 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:57:56 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CD5C061574;
        Thu,  4 Mar 2021 00:57:15 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id u16so8706542wrt.1;
        Thu, 04 Mar 2021 00:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3oAkVo4bUtNk2syG2eiAd8DZ4+uW2EV8B2cJWAv57Ag=;
        b=GeMyvmQRKZlrFF90QBFnajKEbIHsYBI8CLj2+kSS1IBdt13fiZzsYN8uietG0xhMPC
         sUQ4tpEgccZ/VPlRLGbtP7PzwTg2y6CN1nzeDi2dhyUPs/hIUQWxbB/YpxqlxLbZCcI7
         k2FLidUzJnOzPCwsJr9oEXyQSZRCTtDK6P/Ys7TSFjRtDlIa6/G4vpzRBgTHVKcJpwr4
         Igw6ITx5rQPWrXvSucEXgszSQOTn+q2Cqpb5dIy93L6tgl7UkVrlPIOJetum9+hM6hq9
         p7LqtD+x7nLkXZXYo7T/YTnt1msiDJeXJuJf55kXRBCcW3Ge4RKBk1QMiaXwndd0ypF4
         eibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3oAkVo4bUtNk2syG2eiAd8DZ4+uW2EV8B2cJWAv57Ag=;
        b=kna00h+eBPajDyBTsIitulAqmNPgIHTs0iFVOWxJ9OZ1H2J2yLxKRoa0NhTxGwj1YI
         NZOC1EEKTTOuNzQU4Tuo4KKs8CvvpZSSATxKgVxpiHOWF5+dAnXy3x0f8IpQ03aVt9ou
         +27wuAU+tPj6x7bWBpjEAJQRfY7ZjB/TUG7y7Won5ZHovkhaL/ezV0cfIVP/NRbR8zMl
         ATSzx8V6+AVVvNzDOFydxCO56FUCIX34+Tg0/7mT9v6al3oV4xmIJ44mCfiPElrrZ/XW
         RU+JMYVGOIxsoR0vfq5q1tBO5XtGjn1mNgHRJ3zNO4UhglZP6RcXWNCMohNRo5b5v+de
         byDA==
X-Gm-Message-State: AOAM530oac8apt+ctTA/5IIFhP3IV4xT0QGGs3LKpL8wzDaHSaRMM2++
        qdWp2tRQZVWQK5/u/SZMDU4=
X-Google-Smtp-Source: ABdhPJzhhFXAcqSR3705Zmi79MHosJpFzYBI9ZYcopjAY65Ndai/9yPIGhEbPhGRjACOTZO4pi/Jsg==
X-Received: by 2002:adf:ea8d:: with SMTP id s13mr2879947wrm.32.1614848234550;
        Thu, 04 Mar 2021 00:57:14 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id q15sm2828976wrx.56.2021.03.04.00.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 00:57:14 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 00/15] pinctrl: add BCM63XX pincontrol support
Date:   Thu,  4 Mar 2021 09:56:55 +0100
Message-Id: <20210304085710.7128-1-noltari@gmail.com>
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
  Documentation: add BCM6328 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6328
  Documentation: add BCM6358 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6358
  Documentation: add BCM6362 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6362
  Documentation: add BCM6368 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6368
  Documentation: add BCM63268 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM63268
  Documentation: add BCM6318 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6318

 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 187 +++++
 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 208 ++++++
 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 171 +++++
 .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 137 ++++
 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 250 +++++++
 .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 261 +++++++
 drivers/gpio/gpio-regmap.c                    |   1 +
 drivers/pinctrl/bcm/Kconfig                   |  55 ++
 drivers/pinctrl/bcm/Makefile                  |   7 +
 drivers/pinctrl/bcm/pinctrl-bcm6318.c         | 496 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63268.c        | 643 ++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6328.c         | 403 +++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6358.c         | 369 ++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6362.c         | 617 +++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6368.c         | 523 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c         | 114 ++++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h         |  46 ++
 include/linux/gpio/driver.h                   |   9 +
 include/linux/gpio/regmap.h                   |   3 +
 19 files changed, 4500 insertions(+)
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

