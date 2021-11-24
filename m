Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED3045D0AE
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 00:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345925AbhKXXID (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 18:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbhKXXIC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 18:08:02 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3533DC061574;
        Wed, 24 Nov 2021 15:04:52 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bi37so11259653lfb.5;
        Wed, 24 Nov 2021 15:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xu4ZJzFogZrNX3XGLhtBKZKbbwbJR/nJXQ9VcrBljmI=;
        b=dgBujuUmsMqv7KONxnH+FFUgyLhIZz5fcr9OhY2liYYKViLh6Km5L5aohsYzLNyl0k
         VpYhqjNsG73cntqbY5xvKOVwLkikDFhuFSE+Oi2SjsuEdVIgykQI30Dw0AsqUnATzJfk
         Fylgfo0OWFeQUYr/+apnsfawreX10vgDS0/Auh8maU8npkxa1y3sTh8xQ0R+jhlbhVCF
         z/GYBgxtZQH8zQeqvBCeUdjb+JFODUrpobeMX//UymTT8XOK3pG2DmJteqMKKbPzwcFz
         IgEObgD5JMEs+8fgwOhZYEClfCzWHb6ztilV7JY43Xp4MIjoGS7wRFHDcnhdAWHLfjjl
         bV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xu4ZJzFogZrNX3XGLhtBKZKbbwbJR/nJXQ9VcrBljmI=;
        b=KmBKYT/XczclE6P7+Z9JNoZn3vge7A8KXahffZs1xnnQWHF3qIKtNW7FrQu3Vyl3pW
         0gp1tKw6kmkixaYleXZwJ5nnFx08PdpUHqjWG7fW+wFsJHrAJ6/FLIRoqcDYHk539rtX
         NrDMggZyiM/k79lyixXb+pR1A2GNJFBw3bkBlW/egZ/fhGxtwVKo6nD8LN0sU2/ksG3f
         uvRBnkj1kyxiPUyDH/KvXPDhpENzFS8s5h09/q1ECAfPkYIgpLgKD5VZj+7VIGllukol
         jLp4f2oCT/Hy062lddtQHyuDZ6jD5UA8ge3huzY5HGhv8jEE0/v2cacyAtuOODVL2Snm
         Uemg==
X-Gm-Message-State: AOAM53163dL4Yx17okW07XiWF5uyyIsUFV/ap4HgdlJsUnAe+ZnjZw40
        JwW1lizmnCy3zFG4I0JuG8E=
X-Google-Smtp-Source: ABdhPJxLCyIVOzcM1kvVipVfrJjEc52yxVOsPgpBY0OrMesf5AqGVt3InUc+lEOqGg+FX8coxEbxaQ==
X-Received: by 2002:a05:6512:3f91:: with SMTP id x17mr10309034lfa.5.1637795090421;
        Wed, 24 Nov 2021 15:04:50 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t15sm106243lfp.181.2021.11.24.15.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 15:04:50 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 0/6] pinctrl: support platform (e.g. DT) stored pins, groups & functions
Date:   Thu, 25 Nov 2021 00:04:33 +0100
Message-Id: <20211124230439.17531-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Two weeks ago I sent
[PATCH RFC] dt-bindings: pinctrl: support specifying pins
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20211110231436.8866-1-zajec5@gmail.com/

and week ago I sent
[PATCH 0/5] pinctrl: allow storing pins, groups & functions in DT
https://patchwork.ozlabs.org/project/linux-gpio/list/?series=272685

Initially I planned to allow putting some pinctrl hw details in DT and
later that evolved into a slightly more generic API.

Again:
Please note it's about describing hardware elements and not actual
programming way. It may be used with pinctrl-single.c one day but it's
designed as a generic solution for data.

Patches 1-5 are for linux-pinctrl.git. Patch 6 I found worth including
as DT big example. It can go through Linus with Florian's Ack or I can
send it to Florian later.

Rafał Miłecki (6):
  dt-bindings: pinctrl: support specifying pins, groups & functions
  dt-bindings: pinctrl: brcm,ns-pinmux: extend example
  pinctrl: prepare API for reading pins, groups & functions
  pinctrl: support reading pins, groups & functions from DT
  pinctrl: bcm: pinctrl-ns: supoprt DT specified pins, groups &
    functions
  ARM: dts: BCM5301X: add pinctrl pins, groups & functions

 .../bindings/pinctrl/brcm,ns-pinmux.yaml      |  24 +++-
 .../devicetree/bindings/pinctrl/pinctrl.yaml  |  40 ++++++
 arch/arm/boot/dts/bcm4709.dtsi                |  67 +++++++++
 arch/arm/boot/dts/bcm47094.dtsi               |  11 +-
 arch/arm/boot/dts/bcm5301x.dtsi               | 109 +++++++++++++++
 drivers/pinctrl/bcm/pinctrl-ns.c              |  90 ++++++++----
 drivers/pinctrl/core.c                        |  18 +++
 drivers/pinctrl/core.h                        |   4 +
 drivers/pinctrl/devicetree.c                  | 131 ++++++++++++++++++
 drivers/pinctrl/devicetree.h                  |  29 ++++
 drivers/pinctrl/pinmux.c                      |  10 ++
 drivers/pinctrl/pinmux.h                      |   2 +
 12 files changed, 494 insertions(+), 41 deletions(-)

-- 
2.31.1

