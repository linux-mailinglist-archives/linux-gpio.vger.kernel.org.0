Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A3B455C8B
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 14:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhKRNZK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 08:25:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhKRNZK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 08:25:10 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D69C061570;
        Thu, 18 Nov 2021 05:22:10 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id u3so25936016lfl.2;
        Thu, 18 Nov 2021 05:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jjMWmw57eJoizn/MdkVd1BrZJOz35EE2CVOU92rSq/4=;
        b=hZf5UnOcyzLEh9qBLP6XQaEXhRD3KuDDIXkH9pn8Okmdy9F/5MmOeolZUU9ZgtXzAt
         GYbMB+PvtoU0y8/mPeLeHxFAAG8SKdTbVyq9PWVisqf0WyndumYj75nOe1b2A8p/GG1u
         Q0VWyqVbHShWi5Q7JLRfep0JfLz4qy+QinNkFpkYrtfoXg2AbjjBvWqfl8mrlIxp+9f4
         Eo2GBNIMrYKqTWVqQr3tDbXDI84ix3kLZFj4Y/ez8U7DHmFDQ61/GgNhP6ohMt/Atm4Z
         W0nKkuZCJdYkkHEMRcagjvXtEixhAEO3I+Hibf+6qViKJj/G1+IXjdd+t1cpOb2UFfQE
         b5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jjMWmw57eJoizn/MdkVd1BrZJOz35EE2CVOU92rSq/4=;
        b=RqwhbEzrJjIwvcA73VLAUzGfzDV0gklMYe6zZMcBiGUw3Cs0cFxwkVlDF1FJ+exwoq
         1yBI+x4W1yHARMOcp0NW/lVnK2Zrb4HgXfqugwemhPFhh2fF9O1xZNeEG16zKHf+TqIc
         aZmzlufZI3REuOtX4/8Dx54+M2bUMv8QJ8k6TTp7pCkZzVJCCJxJ0pGiZu+OuVhOW6bP
         SF8+hdywdBTgvPL93/4jS9mPGZ5FUNb2F/hUA2BnMAHoYXxu7oH+Aqp7iRWRyd8A55j+
         Wg/V6qEV0QyiRTzdBWT4LahpRq4SqdfnJ5HlLCxdUKFvF+RPk1X+lpgwh3YHBi3ciF0F
         saQg==
X-Gm-Message-State: AOAM532O4ykhUVun5hy+w+Ez6ibeBm8zJTsDOudU5ECm70eWHkd7VuIa
        x1PU+J9Gn/tbhYmXtZlXHYE=
X-Google-Smtp-Source: ABdhPJy8R7ZJQyi3lcjMDV9QAMDL0q5pOG30pY+enhtBxo7zcBuKN9hCqOq+sZ7FpzXH2I3ciZRjEQ==
X-Received: by 2002:a05:6512:1310:: with SMTP id x16mr4000688lfu.436.1637241728204;
        Thu, 18 Nov 2021 05:22:08 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id bp36sm356550lfb.0.2021.11.18.05.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 05:22:07 -0800 (PST)
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
Subject: [PATCH 0/5] pinctrl: allow storing pins, groups & functions in DT
Date:   Thu, 18 Nov 2021 14:21:47 +0100
Message-Id: <20211118132152.15722-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

A week ago I sent
[PATCH RFC] dt-bindings: pinctrl: support specifying pins
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20211110231436.8866-1-zajec5@gmail.com/

From short discussion in that thread it seems that using DT to store
pinctrl pins, groups & functions may be an option. I'd like to ask for
reviewing my patchset implementing that.

Please note it's about describing hardware elements and not actual
programming way. It may be used with pinctrl-single.c one day but it's
designed as a generic solution for data.

Patches 1-4 are for linux-pinctrl.git. Patch 5 I found worth including
as DT big example. It can go through Linus with Florian's Ack or I can
send it to Florian later.

Rafał Miłecki (5):
  dt-bindings: pinctrl: support specifying pins, groups & functions
  dt-bindings: pinctrl: brcm,ns-pinmux: extend example
  pinctrl: add helpers reading pins, groups & functions from DT
  pinctrl: bcm: pinctrl-ns: supoprt DT specified pins, groups &
    functions
  ARM: dts: BCM5301X: add pinctrl pins, groups & functions

 .../bindings/pinctrl/brcm,ns-pinmux.yaml      |  29 ++++-
 .../devicetree/bindings/pinctrl/pinctrl.yaml  |  50 +++++++
 arch/arm/boot/dts/bcm4709.dtsi                |  74 +++++++++++
 arch/arm/boot/dts/bcm47094.dtsi               |  11 +-
 arch/arm/boot/dts/bcm5301x.dtsi               | 123 ++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-ns.c              |  90 ++++++++-----
 drivers/pinctrl/core.c                        |  89 +++++++++++++
 drivers/pinctrl/core.h                        |   5 +
 drivers/pinctrl/pinmux.c                      |  43 ++++++
 drivers/pinctrl/pinmux.h                      |   2 +
 10 files changed, 475 insertions(+), 41 deletions(-)

-- 
2.31.1

