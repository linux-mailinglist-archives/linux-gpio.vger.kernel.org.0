Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC01C7881F6
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Aug 2023 10:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbjHYIWt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Aug 2023 04:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240408AbjHYIWT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Aug 2023 04:22:19 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D991199E
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 01:22:17 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d71c3a32e1aso641503276.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 01:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692951736; x=1693556536;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o68uwWvcryPEo9I+99+1NtHAcAJZT1r5DS6dMa5vFiM=;
        b=KVBeRb9dg7RBARo0lQfGOrys+IuortankdPxYkKbKvg22i1tHexzCIqi9Oz+al+1GR
         lcxqp0OjBoD2z5IkNYIOn3S8DWEk6j490jVQDfNItDRM142RhoMVwnurtshCsPAp6FUU
         cP+AvXhDcxw1MYUzuiPeUmvqHdutg2l+UoccLr58NI5Fd7NK1YB0InLUIlgN7EFPCplw
         i+6gF02NayySwudMDO7eRvIPWJqAU3oZAfhYbUQjlcwG5kLyVB9Vu73I0Dyi7UY66tCG
         TzBMmEPaV0ZW5JIRVY7FoaCMgiXElNbZu02wXumXtijwaM3IDf5q7Aj3Jl3jQqnwmmS8
         is+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692951736; x=1693556536;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o68uwWvcryPEo9I+99+1NtHAcAJZT1r5DS6dMa5vFiM=;
        b=XHqXVkU7mcjMQ6uVJjEHG2PRVNuTGYoT5GTvnxo35DUqmBkoeGJUy6nxWo/oRGGp2R
         +TYA/Csuc7H8JnLMz3VD6fzWWhCZjY4bZPsl4PLsNSX0Qc8H3k3YVwzhxwfSoE7+HzNR
         433kRLVHDkKwyafYZgiKPFVeQLtCtT1SIuvwF2GE0fRLP4ZgdgcWqRhpXhUuBv6I0WvQ
         3PwyDoXU6GxsnSkc1lAyH4qOgZW7WEnFroTEH5M1sJA/00Nyg4mGQSTdPkykFsgqC7MA
         0ydkmp6VYbwC1TOu23VBf6iBjq6x49XFQHcR+Tf9QqSsYXux+S+ufW62lPOg6PIa/sna
         FTUA==
X-Gm-Message-State: AOJu0Yy9xGWU/6SmZltUF5ZPo+uRSPYrC7up0dFTyabBc+I42jMYj+Rl
        AIS8DigkGgdqUpddYZinxHkQRGCE/yXGOgvEp0HyEA==
X-Google-Smtp-Source: AGHT+IGn/10xc6qOVoAMw9XSZ+e8Wh5RWFrDzZEtVp0zUkQhI9+88zxdp3f55Y+kbm/4Bepb+8ay71ZR9NxIdw9ZD5s=
X-Received: by 2002:a25:7352:0:b0:d0e:8b3b:1e12 with SMTP id
 o79-20020a257352000000b00d0e8b3b1e12mr17896157ybc.38.1692951736658; Fri, 25
 Aug 2023 01:22:16 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 25 Aug 2023 10:22:05 +0200
Message-ID: <CACRpkdYqWQ57FR95R31nbv=d+qqq2xGkj38Yd_SN2wDiOO3NTg@mail.gmail.com>
Subject: [GIT PULL] late pin control fixes for v6.5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

OK it's late in the cycle but the bugs don't accept that as usual.

Here are some Renesas and AMD driver fixes, the AMD fix affects
important laptops in the wild so this one is pretty important. It seems
a bit tough to get this right.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 706a741595047797872e669b3101429ab8d378ef:

  Linux 6.5-rc7 (2023-08-20 15:02:52 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.5-4

for you to fetch changes up to 6bc3462a0f5ecaa376a0b3d76dafc55796799e17:

  pinctrl: amd: Mask wake bits on probe again (2023-08-21 12:28:28 +0200)

----------------------------------------------------------------
Pin control fixes for the v6.5 kernel:

- Fix DT parsing and related locking in the Renesas driver.

- Fix wakeup IRQs in the AMD driver once again. Really tricky
  this one.

----------------------------------------------------------------
Biju Das (3):
      pinctrl: renesas: rzg2l: Fix NULL pointer dereference in
rzg2l_dt_subnode_to_map()
      pinctrl: renesas: rzv2m: Fix NULL pointer dereference in
rzv2m_dt_subnode_to_map()
      pinctrl: renesas: rza2: Add lock around
pinctrl_generic{{add,remove}_group,{add,remove}_function}

Linus Walleij (1):
      Merge tag 'renesas-pinctrl-fixes-for-v6.5-tag2' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into fixes

Mario Limonciello (1):
      pinctrl: amd: Mask wake bits on probe again

 drivers/pinctrl/pinctrl-amd.c           | 30 ++++++++++++++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rza2.c  | 17 +++++++++++++++--
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 15 ++++++++++++---
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 13 +++++++++++--
 4 files changed, 68 insertions(+), 7 deletions(-)
