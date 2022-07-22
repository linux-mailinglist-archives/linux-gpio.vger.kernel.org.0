Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDA0657E162
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jul 2022 14:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiGVMYl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jul 2022 08:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbiGVMYk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2022 08:24:40 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B652D40BD8
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2022 05:24:39 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id j22so8329847ejs.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2022 05:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Af4uecrSEcPyJJPCN4Xrg+yN2+gumEHMnB9vzCspvJo=;
        b=Rlc3rdta3EL0QYKqGtfY6ypooa+LaNW36wHqO/PIhxTqga+gbJTzEhSYXnaz7kzQjF
         SVImkM0e2hvTgIxwwdQFrC4RFEzqmKurBHxXx1TBFboDBTO0kGDFkYsBJ/upSiW8LR9s
         7tFO3e0YCqny2XCiX2dvsqrgYoj6Y28+w4IjBXorYATle1pGRR7wwzaZCkG0zQAVtRmH
         j0lfvMY/CyEPalJulolydNKzya6Vob6atfprdEsXhtqXsUUzX+uZMMxAp/ReaUX+kX7+
         CVy6+DY2aRSSyBOi9VrbGBuhv45ocPwdvhwcUC8r4JVchueJjrPCETTWJyLn0DjHGbvR
         3EeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Af4uecrSEcPyJJPCN4Xrg+yN2+gumEHMnB9vzCspvJo=;
        b=H/3EvOXPa0FQTsA8O3T/IDOKRHE4g3do4IMp5PfR6rDgHDj8AyBdJwCzzlpG5ms7vk
         mE3MI6d4S7LoAvGwRj7RARu7TXWxn0tECp71fONfsZPKfUairEIP+aG3+Bp9xIu37Zx+
         wiwYdZi7jI+AVFP4dCopla3vCdzlM28X6EcBSh9tOs7N3Z7Ht4rbebbfy1w0nVK5OfBT
         gowTz/gh55lNsyAOr0FZKzIuQykz6SEkc6w/AckQEy0mdIifl8kMO8FynLDjCaZIStZs
         uEj5FP+SzIGu2kgPu+3C58cGLVik6yMpidSjv8XkXRqd7sVWK0VfegXW7GXP6SBG2TqV
         GnvA==
X-Gm-Message-State: AJIora/M1QZmM9gNDpSvMc0uwXdYxlnponYD3whQJCWsV6UG/cUwLOK7
        5EJ5dvDoU2eLEuAKzqWRadio95aJfxjcI/F5bPCyTQ==
X-Google-Smtp-Source: AGRyM1suBtBuZNMz/He+SYKu0nmjZBKQ6XJUU06KvEBMCTo1C79OQKyGJw6fu2X+hPD8dCiQ7GhQfud9rmT/BFTNG2M=
X-Received: by 2002:a17:907:28c8:b0:72b:97cd:d628 with SMTP id
 en8-20020a17090728c800b0072b97cdd628mr303674ejc.208.1658492677987; Fri, 22
 Jul 2022 05:24:37 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jul 2022 14:24:27 +0200
Message-ID: <CACRpkdYD6anQsCdZcC=RbRUVRraWm2hOauYB314bE0rxJ9PN=A@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.19
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some late pin control fixes for the v5.19 series.

Only driver fixes. Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 32346491ddf24599decca06190ebca03ff9de7f8:

  Linux 5.19-rc6 (2022-07-10 14:40:51 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.19-3

for you to fetch changes up to 4546760619cfa9b718fe2059ceb07101cf9ff61e:

  pinctrl: armada-37xx: use raw spinlocks for regmap to avoid invalid
wait context (2022-07-19 00:57:38 +0200)

----------------------------------------------------------------
Pin control fixes for the v5.19 kernel cycle:

- NULL check for the ralink and sunplus drivers.

- Add Jacky Bai as maintainer for the Freescale pin controllers.

- Fix pin config ops for the Ocelot LAN966x and SparX5.

- Disallow AMD pin control to be a module: the GPIO lines
  need to be active in early boot, so no can do.

- Fix the Armada 37xx to use raw spinlocks in the interrupt
  handler path to avoid wait context.

----------------------------------------------------------------
Horatiu Vultur (2):
      pinctrl: ocelot: Fix pincfg for lan966x
      pinctrl: ocelot: Fix pincfg

Jacky Bai (1):
      MAINTAINERS: Update freescale pin controllers maintainer

Mario Limonciello (1):
      pinctrl: Don't allow PINCTRL_AMD to be a module

Vladimir Oltean (2):
      pinctrl: armada-37xx: make irq_lock a raw spinlock to avoid
invalid wait context
      pinctrl: armada-37xx: use raw spinlocks for regmap to avoid
invalid wait context

William Dean (2):
      pinctrl: ralink: Check for null return of devm_kcalloc
      pinctrl: sunplus: Add check for kcalloc

 MAINTAINERS                                 |   2 +-
 drivers/pinctrl/Kconfig                     |   2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |  65 +++++----
 drivers/pinctrl/pinctrl-ocelot.c            | 214 ++++++++++++++++++----------
 drivers/pinctrl/ralink/pinctrl-ralink.c     |   2 +
 drivers/pinctrl/sunplus/sppctl.c            |   3 +
 6 files changed, 184 insertions(+), 104 deletions(-)
