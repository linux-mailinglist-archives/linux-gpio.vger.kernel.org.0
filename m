Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A32481E6AB7
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 21:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406336AbgE1TVX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 15:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406334AbgE1TVT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 15:21:19 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481C9C08C5C7;
        Thu, 28 May 2020 12:21:19 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t16so11988453plo.7;
        Thu, 28 May 2020 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=B8Hdvve5uJORZwdFRagi6o1BCEBLQjgLebb0Dnob25E=;
        b=r8SUqqrQNkixcPuUi9GwBFK+NW+JPPPsTTov0p+ezk1FGS7cu3lJrm0BPcqNKuJvpj
         rm3cm4LsUsS9XFSUB82mav+DmSeCKLSf+R5exs26EX1JmxptKoZefrAHUW6HCq1ljgw5
         mR6qmxwaXGE724U1mqLNBrUHbI4U2+LPem9AC9qA8OZC8f50T2R1E/LGbrvqWzBOM1Fu
         5jYTIvSI7MUrqHX44IY96w5W1f+cWSOWelpwGa/k5EXI3VGwPw0tHZ5naACRBx7HNmXY
         QIEaPblt5K9Kcc5VzWSRMaEWZTMDYm/NTKQQnT3HEZ+JxZy+xN+g6oldCJL6cpjzT0CY
         EPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=B8Hdvve5uJORZwdFRagi6o1BCEBLQjgLebb0Dnob25E=;
        b=SnJk3LddDGod1pL56ybz2lUVDZv0y4r6LHEbf/J8fN6cDWLpZG+YfqisP+2Ki8LAMp
         euxBPrUAC4ci1zaoNE9Kb9SKfyQfLjJMCjcfC3iFnM9/cLUeU1YpRGUAi9s9CIVvRV1B
         uZkJCfr2UBXTBHGW6VINXsyMfJUiD+ZXZey6fl7YIIABt5BMZ/MqfaCj8oDJ+7GJ3AzB
         uwlTAmqoCbtOQCFGYOD6HmLmR4bwTkioVPMMrcyb+/2Eug69YMwCLVxSrjxtz1rSsJTB
         fseQCfojT6xnsuhN6/D85rAznSASOZmPkvvTM3G+vD3yWB35SHWNqRntMgTULXex1XMg
         0HBA==
X-Gm-Message-State: AOAM530Nf9ckwFdq2Kzd/81uHOqYbhpfRrhihLakMtLni8cPfbpB4wdY
        LShu9RykPw5KjCwTQQktjT7KK6GQ
X-Google-Smtp-Source: ABdhPJzsaTAhbFH9bPSpGMqTYVYwf8Z9HNBSKJz5l4Np3QDbfQNWp+Ujm8NaLEnlihMIVuvErsXcRA==
X-Received: by 2002:a17:902:502:: with SMTP id 2mr4998553plf.134.1590693678392;
        Thu, 28 May 2020 12:21:18 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id h11sm5460561pjk.20.2020.05.28.12.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 12:21:17 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM
        BCM2711/BCM2835 ARM ARCHITECTURE),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM
        BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH 0/4] pinctrl: bcm2835: Support for wake-up interrupts
Date:   Thu, 28 May 2020 12:21:08 -0700
Message-Id: <20200528192112.26123-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

This patch series updates the bcm2835 pinctrl driver to support
the BCM7211 SoC which is quite similar to 2711 (Raspberry Pi 4)
except that it also supports wake-up interrupts.

Thanks!

Florian Fainelli (4):
  dt-bindings: pinctrl: Document 7211 compatible for
    brcm,bcm2835-gpio.txt
  dt-bindings: pinctrl: Document optional BCM7211 wake-up interrupts
  pinctrl: bcm2835: Match BCM7211 compatible string
  pinctrl: bcm2835: Add support for wake-up interrupts

 .../bindings/pinctrl/brcm,bcm2835-gpio.txt    |  5 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c         | 62 ++++++++++++++++++-
 2 files changed, 65 insertions(+), 2 deletions(-)

-- 
2.17.1

