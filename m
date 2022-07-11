Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50BE3569E42
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 11:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233004AbiGGJF5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 05:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbiGGJF5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 05:05:57 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5301FCE4
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jul 2022 02:05:56 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-31c8bb90d09so109985977b3.8
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jul 2022 02:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=zlOeCkIki6PJyWBNRiw36kI6SNKSOmci2Nqouica840=;
        b=OItsImZM/QYb5LQ9evTfoTMcN/zucchGaWz1ri9JInDOmSPsTXteMNhP/lM04GDdv3
         qivocRq6lMtSP025yyeXQ+gKXZJGr8XLz7p0td+uONy6NYDhFjZvFOjKU7qtJPLwoCQk
         hjMhIVmfNvCX8xYP6OPeDyRYzJDg9va8ejhIvghxTlcSP8ncAOg/re8m+GMGmfGUk24e
         TjFDIaHl29agDQImf+/pwWAoV4Xp/d4n8i0Ap4iOBcx8mdpQu+FW4VmGur2qCUamvSD1
         k8hOTMTXDsl8TQ1JKQNluQyaLsFyzjikXY/r+nzb6v48WuSBNOr9b46AD8j8KW9dMQ2H
         /05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=zlOeCkIki6PJyWBNRiw36kI6SNKSOmci2Nqouica840=;
        b=NzZzZZC5FEf4twCxv7LflyJoGy6wWf5jxGNTlHNEp1zqmYvtw8N6lbQecukcXHISMQ
         KePr3vqykUH8BKLLI58ocAEojRwoi67XOISGUbPaRC5U2qlLVopqirAzyJfv1p5VfFoL
         SR6gmGyVPBaEwtKwedEq3fc5U6SPSXtGBTF3x41Y96P97JHRGU9LP12ovdYpzhY3WUlP
         AXqNMOyiod7lgrHOE/eg65CbQP13Z3b1n9tC5t8HMMd4/YBBrnOfEQP/BIn2OwtsWnAQ
         QGSc350DpAcwBXFO5Aat0MHHc9RoZ8ZgCndJJ9Rmq3ViM+JSJ2daGbGZS2br9JdPDaho
         iKug==
X-Gm-Message-State: AJIora9FhS2cFoNUcXntDBBzmSeU/ax4DM2Njn/Gv4Y/p0WSSSUq9rov
        nStp3npfotkvmQ0SalZwqWuZnY0wgC3zFM6TNGf2cg==
X-Google-Smtp-Source: AGRyM1vi0SZgs7vqZxK7BiMF62vcQgS0TcVvEQyxltMKWNuoqcYS8FlqBkjLZxE+SmJCx2ju1yLIHNdAeZ5uI18siGQ=
X-Received: by 2002:a0d:f801:0:b0:31d:851:96b8 with SMTP id
 i1-20020a0df801000000b0031d085196b8mr2657332ywf.448.1657184755082; Thu, 07
 Jul 2022 02:05:55 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Jul 2022 11:05:44 +0200
Message-ID: <CACRpkdYD-mnt-vypLAXP9J2pgzXOOYhS7fNeEKLK7T2q-45USg@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.19
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some minor pin control fixes, all driver-related.

Details in the signed tag, please pull it in!

Yours,
Linus Walleij

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.19-2

for you to fetch changes up to a1d4ef1adf8bbd302067534ead671a94759687ed:

  pinctrl: stm32: fix optional IRQ support to gpios (2022-06-28 16:12:40 +0200)

----------------------------------------------------------------
Pin control fixes for the v5.19 kernel series:

- Tag Intel pin control as supported in MAINTAINERS
- Fix a NULL pointer exception in the Aspeed driver
- Correct some NAND functions in the Sunxi A83T driver
- Use the right offset for some Sunxi pins
- Fix a zero base offset in the Freescale (NXP) i.MX93
- Fix the IRQ support in the STM32 driver

----------------------------------------------------------------
Andrei Lalaev (1):
      pinctrl: sunxi: sunxi_pconf_set: use correct offset

Andy Shevchenko (1):
      MAINTAINERS: Update Intel pin control to Supported

Fabien Dessenne (1):
      pinctrl: stm32: fix optional IRQ support to gpios

Haowen Bai (1):
      pinctrl: aspeed: Fix potential NULL dereference in aspeed_pinmux_set_mux()

Jacky Bai (1):
      pinctrl: imx: Add the zero base flag for imx93

Linus Walleij (1):
      Merge tag 'intel-pinctrl-v5.19-3' of
gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into fixes

Samuel Holland (1):
      pinctrl: sunxi: a83t: Fix NAND function name for some pins

 MAINTAINERS                                |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    |  4 ++--
 drivers/pinctrl/freescale/pinctrl-imx93.c  |  1 +
 drivers/pinctrl/stm32/pinctrl-stm32.c      | 20 ++++++++++++--------
 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c | 10 +++++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.c      |  2 ++
 6 files changed, 23 insertions(+), 16 deletions(-)
