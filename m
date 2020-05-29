Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551261E8785
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 21:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgE2TQw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 15:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgE2TQv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 15:16:51 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AAE3C03E969;
        Fri, 29 May 2020 12:16:50 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id bh7so1616480plb.11;
        Fri, 29 May 2020 12:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=W8tHM5A9x7hCqXrGZPnl9PrgU0zBShy7MiBX6R7IaoQ=;
        b=vcuiL7NkFG8ibcD+t4OJB+dwcTKukbeTVrKXO6VB7PLb24zP+KGR/q7WmfKrlyL0g1
         2qyiprG+r2j83U+/1nRNIDegSL9MGMUBcdHwLP8j71QJ2v8OKQ5hSIzhMx6OMAtOCU30
         7tG2fhk9zL9qksdFlHKguAmz4SR4Zjf74/6M/z2CKhO7bBOZme5m4J3/2f5+MylBXrUc
         AgiSj+fM1UBbUruXsKRSVt7L0RUAR2wImmE+eMgCU3n/gbXr6Zl7mzZjs6U4EpcVNoJY
         PUN0pd7X2xTd07ik9+NxJTr7YYKA4+A4gp4/TCXkEpPDcPpj4Rthqzelse7XBqzpLrjI
         XKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=W8tHM5A9x7hCqXrGZPnl9PrgU0zBShy7MiBX6R7IaoQ=;
        b=ZvpmeZkv/0eu/g/qdl6EXNz++sM33XjvcTsimiafgN1boAVehzBftk0FGN//BDAFG2
         MvPJnkcpw52oramDimQT613E6aJw65M4vzknGpuFu+IWKOq+rRsnw+JEX/coA+XxtuwZ
         bwvyye35T1d1nY4UH/mVldhHKWZdTpgAwyAZEIKjnRj2lKPItwe5vrqYH7t3yb7D9Wfi
         Gb7+ISfNSAYJERGVViwUh2mtMLzY571zGvJiEKhur0sgA0QXKZ/3noP5F06WEj4usUVH
         s0BABmrXMmGzSxtGJS/szjgsDoOxokDMIS7/idc0J+9V9ZC5CHrUIQuLIW7jDfw+UBbD
         pYyw==
X-Gm-Message-State: AOAM531+kLxbRC0CF6nuEcScxZUTD6K4AebeUKnOEGgqYGMEZwKFG9r3
        cSBmHmIosra/dd1DwtHIa1xA30ax
X-Google-Smtp-Source: ABdhPJzEcRhz8HJANDPWTtoAXzpRH7F78bIl5xxDea2VL93YQoccdWOgpSwJNj5a/nZywqr9nj+hLA==
X-Received: by 2002:a17:902:bd47:: with SMTP id b7mr10457105plx.79.1590779809488;
        Fri, 29 May 2020 12:16:49 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id g92sm202505pje.13.2020.05.29.12.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 12:16:48 -0700 (PDT)
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
Subject: [PATCH v2 0/4] pinctrl: bcm2835: Support for wake-up interrupts
Date:   Fri, 29 May 2020 12:15:18 -0700
Message-Id: <20200529191522.27938-1-f.fainelli@gmail.com>
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

Changes in v2:

- fixed patch #3 to reference the correct data structure (Stefan)
- fixed patch #4 to use conditional initialization and fetching of
  interrupt resources to limit the memory overhead for non-7211 chips

Florian Fainelli (4):
  dt-bindings: pinctrl: Document 7211 compatible for
    brcm,bcm2835-gpio.txt
  dt-bindings: pinctrl: Document optional BCM7211 wake-up interrupts
  pinctrl: bcm2835: Match BCM7211 compatible string
  pinctrl: bcm2835: Add support for wake-up interrupts

 .../bindings/pinctrl/brcm,bcm2835-gpio.txt    |  5 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c         | 80 ++++++++++++++++++-
 2 files changed, 83 insertions(+), 2 deletions(-)

-- 
2.17.1

