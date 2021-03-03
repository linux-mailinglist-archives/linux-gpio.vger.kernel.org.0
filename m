Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61B932C7D4
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238097AbhCDAcz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383509AbhCCOjI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 09:39:08 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90BC9C06178A;
        Wed,  3 Mar 2021 06:23:13 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id u187so5322868wmg.4;
        Wed, 03 Mar 2021 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQpzwtJdI15ee25ztpxpJETWP0dJNKVRVUGEhzQbTYI=;
        b=tLeAOwAlFtvcX5c2nCq/k9O3FtmgphgjThDiMWdxKh4+RXRkeUGL1SGOUZskuVU7Zl
         +FUAiqYvZsUNrX6zwKagVxSG104vOJML+pKVA51ylzCuDUPaDK1qGtbLd/PsqL0fZij0
         yXW5Bche84TdLZg1E4DgihEHAl2dYvtwH+FznHCjriaITN23uW97Co3Pmw4GyHWNU3jZ
         ltTXlmQNU7YURHr+XGqXN/h2vYWHqwHwqyOZtrTPF2U9YsA3VOwSCG6FNQNq7tUmfntd
         iTicznmkW2LFuV1NwnXMpI0QFx8KnUyHOAxu+41ILjLSn3viGneTsF4t/7dWtuTEmdvi
         A/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQpzwtJdI15ee25ztpxpJETWP0dJNKVRVUGEhzQbTYI=;
        b=e/cmfNYBK6ftqw+hv6vtYWwIyGfQR87p0Y0ehm4g5FwpXP4Y2hOgjZUPzYdDiqV1vO
         uZwmomLQEYrudloAUXVWvPw2SUwSYvHdrXzJqhKQx1jC4gfqwuGDP7lfSBBUVxG2IU+i
         bjyUHx6ilrx77p9aGd2AAtjFk+9lHUsoUSp1loHqY3/d00fl38xpXzEy3uvqhQA2p2s0
         MyrU0TxL2fk4jyFCyPhdAVDLxY3ekVqReXLxtG9llBecXBC/gNsiEcYM4MZ6YhZc10A1
         gvnLlghcBAO7se1q6CfrVD0qdJidFVRMU2U0Ljydr6fQ5PQLESpXbMmC/tAsqcFkXfLX
         YX8A==
X-Gm-Message-State: AOAM530JhsemexwuNbtQNCFxUD4EGg3hgc3NYLyXGjHXzi2PmV8JcoD0
        cCRX7gL8zUHCRtisBX+jxMM=
X-Google-Smtp-Source: ABdhPJzrpjZpfCmMbWNWObjpHLr0fn9U5xaj9E7kkly1YyGsipfHMxvY/iCQ7eITQxauOzH+hNKzdQ==
X-Received: by 2002:a1c:e041:: with SMTP id x62mr9070791wmg.95.1614781392247;
        Wed, 03 Mar 2021 06:23:12 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id b15sm7876219wmd.41.2021.03.03.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 06:23:11 -0800 (PST)
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
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 00/14] pinctrl: add BCM63XX pincontrol support
Date:   Wed,  3 Mar 2021 15:22:56 +0100
Message-Id: <20210303142310.6371-1-noltari@gmail.com>
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

v3: introduce new files for shared code and add more changes suggested by
 Linus Walleij. Also add a new patch needed for properly parsing gpio-ranges.
v2: introduce changes suggested by Linus Walleij and remove interrupts
 - In order to use GPIO_REGMAP, the need to get gpio_chip from gpio_regmap
 and use it for pinctrl_add_gpio_range() and gpio_chip.direction_input()
 and gpio_chip.direction_output().

Álvaro Fernández Rojas (14):
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
 drivers/pinctrl/bcm/Kconfig                   |  57 ++
 drivers/pinctrl/bcm/Makefile                  |   7 +
 drivers/pinctrl/bcm/pinctrl-bcm6318.c         | 496 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63268.c        | 643 ++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6328.c         | 403 +++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6358.c         | 369 ++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6362.c         | 617 +++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6368.c         | 523 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c         | 113 +++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h         |  46 ++
 include/linux/gpio/regmap.h                   |   3 +
 18 files changed, 4492 insertions(+)
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

