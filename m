Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC1DC52D2E2
	for <lists+linux-gpio@lfdr.de>; Thu, 19 May 2022 14:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbiESMrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 May 2022 08:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238032AbiESMr1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 May 2022 08:47:27 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82ADFBA999
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 05:47:23 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2ef5380669cso55263467b3.9
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=kLtG7OuL+V8Ghl5QfqQdFtE39MVlYIU0wGiYL7z5Hpw=;
        b=SG3nnLmH8t0mZOvk2fV6XtByKoQMBoLT3EuigUsOsrWqP8wUNxQz77JZFnhdD8ZTy9
         lA78jfMoXv6NTXB0GCijGVYZad11cvk/0z2riDgFXnh5BAzrKUkFwtl3coW5GvgWUz3P
         gTLLcS204/lI4orTcV/9x3bjlt6kwZIkFXx6twfytS+tyETvbiEZLlfM3SzccNzhaCx3
         mc4ENg3uN3m2Nf7mjqwEs3s7fEnLhd7NOEkohJoG/Zsz5p5Ys/5TfkJg1gu7642LmPbP
         ChZjyogMgx5FWq4gGlL0cGyl7w7b8y9pqpClU0ewHML5ZpQcAENDGHIqLuvPxWl+A9l1
         XxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=kLtG7OuL+V8Ghl5QfqQdFtE39MVlYIU0wGiYL7z5Hpw=;
        b=Kh+uvjmZr3IHhdYQmxXyuXIVH0AdaabhiukD1vYFTEDvcOBVf9i6eYO+Bje+B4DvzF
         ry4jJTzmJL3kkvk3z97eSNODqGBF6+UTz6brVZ4r/Y7bu0LOdGJ9rRM89lgyduTP7Vrr
         VgmSCwMNBnFpizNTmnIJNJfCWbWgQWri3kmvXP6eUBZGm1gJ+T2npBKOPtfV0IyCrpgY
         hD4RVpc5S2/b6Dq6O1+yfTKRU0aWJR1oO7l1v5ugXmWh+icDoWxX0WMJWCm70ZwXh1Ai
         pJnfwlferhwEJHSltfjQy2Xn+1X+kcxLIeHhA5323C76vRMEd3UizSK1gexrqEwUINVK
         41wg==
X-Gm-Message-State: AOAM533zPYg7eQub6c1xm1qPwU0K3iMzzo6amGlTLC/8D24eaqKVIVEE
        oic7r4GHFH0wMgC7yLvFHOsOLrtiX3iWLdZOTrwMLA==
X-Google-Smtp-Source: ABdhPJyJQOGsI31cSREWUFTLf6gzy1jNeqTI1pL409PM4pAYq3GLoR48Kwtw8CtrNOYPaME6jGAot6K9mqB4lJBQcgA=
X-Received: by 2002:a0d:c4c2:0:b0:2f1:6c00:9eb4 with SMTP id
 g185-20020a0dc4c2000000b002f16c009eb4mr4682730ywd.448.1652964442644; Thu, 19
 May 2022 05:47:22 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 14:47:11 +0200
Message-ID: <CACRpkdY4_vWpeKKKNrKPuMy8wJ52Y0z6MjyxpM5RwQXM4652KA@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v5.18
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
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

some late pin control fixes for the v5.18 series. Only driver fixes
as is appropriate.

Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 672c0c5173427e6b3e2a9bbb7be51ceeec78093a:

  Linux 5.18-rc5 (2022-05-01 13:57:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.18-3

for you to fetch changes up to e199975b775a37750903025915f7bc0ccda829e5:

  pinctrl: sunxi: f1c100s: Fix signal name comment for PA2 SPI pin
(2022-05-14 01:07:08 +0200)

----------------------------------------------------------------
Pin control fixes for the v5.18 series:

- Fix an altmode in the Ocelot driver
- Fix the IES control pins in the Mediatek MT8365 driver
- Fix the UART2 function pin assignments in the
  Sunxi (AMLogic) driver
- Fix the signal name of the PA2 SPI pin in the Sunxi
  (AMLogic) driver

----------------------------------------------------------------
Andre Przywara (1):
      pinctrl: sunxi: f1c100s: Fix signal name comment for PA2 SPI pin

Horatiu Vultur (1):
      pinctrl: ocelot: Fix for lan966x alt mode

IotaHydrae (1):
      pinctrl: sunxi: fix f1c100s uart2 function

Mattijs Korpershoek (1):
      pinctrl: mediatek: mt8365: fix IES control pins

 drivers/pinctrl/mediatek/pinctrl-mt8365.c     | 2 +-
 drivers/pinctrl/pinctrl-ocelot.c              | 4 +++-
 drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)
