Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB0732AD30
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383862AbhCBV2e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:28:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1581706AbhCBTQ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 14:16:58 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D08C061793;
        Tue,  2 Mar 2021 11:16:18 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id u187so3154524wmg.4;
        Tue, 02 Mar 2021 11:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Ei0wx7aMgKdFu8tGo8KzY1/b9HCMezdr+Ds0iFU6RA=;
        b=ZnK6LEexHWhlJgjJ3Szgrazaz9Mjhq6XnLE5/Ro1uJNitRNLL2wB4Li/aEiRZ4aEC2
         ohitChQcGvgMb1rIT0uJZMMTi61UPgql0gFNH7y38rqkal4ZpqxzN09gjA0nsfo7yFkZ
         RhcqSh8rT8lTaIyzrwNK+0Sy/gIJSPB/NEShoUfyn1PPWSuXiGQAGtdpa5iPj4LuDC+O
         tZq7crf3Op9kVYKbJajOrIVUS7uTQ/EuZ2n+Mk5Nap9EUObDf3kdq4e4OtBJj7HcGWtI
         A5IK+2/FqNizUYOQnQ6JS+EeROaOkGLbEce+z/+WNILyYUbJn+1b17z8lN0j4yx9GqSP
         YnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Ei0wx7aMgKdFu8tGo8KzY1/b9HCMezdr+Ds0iFU6RA=;
        b=O7TDsUbk8w1Dol3l8WC76oK/9/tSVSL/oUTmekVfHrJ1aHC6L+fyqwvk6dHuPuk5bY
         4H3bRUAOAvivQbtIC5vnTp3OW5qmcsXHkqdPeJAY1FHJMj3PljJrp4gofCdyvaIxYt6d
         yb/apjaZ7V0pkIZlXO0UuypszKz5z0L6m3YIhhDqRh8CvW6eK2G5nwLjKxTRv1jLvMDn
         9QPq/Bu4auT9ALSXR9uiehyrFcZjMwWL0ENTp+F/LNte+B4D8HUFlMFO2BipI7vNDOMQ
         OWVCBxgiH/VeLBjdCuSTg5wUVS/AuydCHaJmwjCmDQrzGth9W7ymgYjh84WoXQHp4ph6
         aaGA==
X-Gm-Message-State: AOAM530f/0Vv/FItBgZuwhsVrBrfd+t02qYJNLoMqn0+LmO09T/K29Pt
        wiZbgGQswWcPXzW5/cZA9000UUe4eNcXtw==
X-Google-Smtp-Source: ABdhPJxiSghn5fHNkZkuCU1ZRa7ubzIyNRTHD75bWl0D1lnPk1Mna9xUaMxHWoieDaJZD3liZS2Ftg==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr5438951wmc.152.1614712576915;
        Tue, 02 Mar 2021 11:16:16 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id l15sm3578862wmh.21.2021.03.02.11.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 11:16:15 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Michael Walle <michael@walle.cc>, f.fainelli@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/12] pinctrl: add BCM63XX pincontrol support
Date:   Tue,  2 Mar 2021 20:16:01 +0100
Message-Id: <20210302191613.29476-1-noltari@gmail.com>
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

v2: introduce changes suggested by Linus Walleij and remove interrupts
 - In order to use GPIO_REGMAP, the need to get gpio_chip from gpio_regmap
 and use it for pinctrl_add_gpio_range() and gpio_chip.direction_input()
 and gpio_chip.direction_output().

Álvaro Fernández Rojas (12):
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

 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 161 ++++
 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 182 +++++
 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 145 ++++
 .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 111 +++
 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 224 ++++++
 .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 235 ++++++
 drivers/pinctrl/bcm/Kconfig                   |  68 ++
 drivers/pinctrl/bcm/Makefile                  |   6 +
 drivers/pinctrl/bcm/pinctrl-bcm6318.c         | 574 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63268.c        | 726 ++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6328.c         | 481 ++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6358.c         | 429 +++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6362.c         | 699 +++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6368.c         | 587 ++++++++++++++
 14 files changed, 4628 insertions(+)
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

-- 
2.20.1

