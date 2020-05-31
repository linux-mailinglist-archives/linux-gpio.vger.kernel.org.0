Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8E61E94A3
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2020 02:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbgEaALM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 May 2020 20:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729522AbgEaALL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 May 2020 20:11:11 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3F9C03E969;
        Sat, 30 May 2020 17:11:11 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f185so7780028wmf.3;
        Sat, 30 May 2020 17:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=N1fNAY9W8nEz1STCUYqUNen8ccMRBFwNRvnI1O2D6Bk=;
        b=nR7OkrMZbdF68Iig0EWwolS+t4nAgQo0fHFUPfd4w53QSAJ2eZN+YOkwNLb+xWMglN
         gyn4w4FCEUqufm1WT5z7sik8zMY8VXHULDiqoqj6mIYOIIYLgNjERhh3QWtzVQ87JHD2
         Wqza2uvs0nfFPt36iilhAkM3gMUCZ0FMAGFYITBDbte2kFFXJACind9sKBZHoy52LzJC
         hJt5JmImr9MGLqV3rOUDCZ/bgz5Qegk/lUhn/I/VcvvKuO8zQ//+pzZxMj18f2tlMIlS
         faHXl49Kg59qeOiG76ciJxAYyKM8ZXWaCvMdn1WLV742dQTTG+YG/AXhV77GNhKEKRzQ
         8HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=N1fNAY9W8nEz1STCUYqUNen8ccMRBFwNRvnI1O2D6Bk=;
        b=cMDWlwJbeiCgU7LZe2ilTMsIgvLlT7VB9+gOD36rj2T3qUAcGdXinbLZrwJ8k03TWR
         gEIxameqc/eK2RMCfZ9/2IaqsD11k8N1IgseFWSKVXP2tj1TgJw+dqdQfFgr5jWcP2GX
         SincRT6q3i+bLUQTei0Pad0pOpYYTEJxFkv7ajkrpR2yJgqrtNQ6eGy0NLFj+zS3lwtm
         gdwfHc3QiD79yjaN0bRCqtd6HQekjFzJVav6UD6NtwmDwHLspOiLjOhKIwC//SzuFQsW
         CoPwgKkjpyEB4NPbJKxH4T5Imw8e3OGFUTkkYdy72Njk24kckDVcWBgCmsvOiOZ+CQgF
         6BDA==
X-Gm-Message-State: AOAM531P8vDXnK6qKQlbAP6u1pxIJZxI8peletdWZr3aJ3bdirw0MnZA
        cU4XHHnUgQYRr6P5IAyzI4W9uPlP
X-Google-Smtp-Source: ABdhPJzYEz/vDQ+dGMjZgZtLaTL+hqSIOROHuJY7+wHyuEMVcZKdl/wOm+YoLtweprg5342Kl8toOw==
X-Received: by 2002:a1c:6244:: with SMTP id w65mr13515496wmb.82.1590883869773;
        Sat, 30 May 2020 17:11:09 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d17sm15455807wrg.75.2020.05.30.17.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 17:11:09 -0700 (PDT)
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
Subject: [PATCH v3 0/4] pinctrl: bcm2835: Add support for wake-up interrupts
Date:   Sat, 30 May 2020 17:10:57 -0700
Message-Id: <20200531001101.24945-1-f.fainelli@gmail.com>
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

Changes in v3:

- added Rob's Acked-by for the binding patches (#1 and #2)
- correct check on the number of GPIOs in irq_set_irq_wake (Stefan)

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

