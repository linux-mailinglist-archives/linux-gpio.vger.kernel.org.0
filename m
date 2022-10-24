Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 629D4609B44
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 09:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbiJXHZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 03:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbiJXHYz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 03:24:55 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3612B610
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 00:24:51 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id i21so6780885edj.10
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 00:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O8+nApusbsmKp9mxGLOoz0SuIwkqoThCwbGonk0Kal0=;
        b=ioXhV3skxY+ebJcCRfwhTL8rWqam52dYoOT8fW6Oq0ZZJCBCNOVLZ+C2+a2vW3QPC6
         QeC2BIm6pGstC7pOZXLjKCX7Fx4W/z1qR4ge9HL/323eNlt7i5xCIWMCSxyX74nW0sk1
         jfVIIPuuCknvNQIct0TVlJUF/6YBzYJ4UDS5Ju8C8AY4Cl5io8900KaZoS6woqP0i6xp
         +Ya2akj8qpjxPQ0Hx2ApymdqcZVXLN/emNwg+NbJSV8GGvZtlrSHEY6e8Y+s/fPMmySd
         v0HDS2LERL2P/7xPrenXACjMGTdf224p+OgcxoMwjIUBzaEjrlYsPtgeBLmkDfc32Rjk
         YnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8+nApusbsmKp9mxGLOoz0SuIwkqoThCwbGonk0Kal0=;
        b=G6PrC48N174SzVhY8WFh78w/4Pk559+DRRweSM3abN8l1AHTHoN6+XmiKgR+X+P7Gm
         aBIoThrO/WRfI5jLjm4E1i/BYxG8diVkJykL1M9q6Xv9CjswaGAn75qjCK0n7G36+hQg
         SJknci3ENQPSaHjRsM6lrqV3PcuCE0p8wWjEaBw345tfSnppOFcsnYVeCyKog2N92ahN
         rbNVE0dlXHnqOBQy0FTCfuvqadbyuURFo9brQ60GvpylH77Lx2QzMoKJMh/Xu/gRSTdE
         CKPzr4XiQ19RH5iLiCWFTmcsdSUWyJZAPVxNtJur1oLXz+ojJREq0MzTh2LNBimQ9X7u
         x/DQ==
X-Gm-Message-State: ACrzQf1VXwF8ntxzPhRZofckjmlbcS/iQFH5kiCcG1dmzS6joLMz2x3J
        dXLpouyUzh1bBbvuJYjEtRo5hXLPiDJ3xmhRf9S0Dg==
X-Google-Smtp-Source: AMsMyM49FK2tGwVZLYkhI/grbk963XafTKaBRQLpdp9qCIgPKUZMigP0pUGOQV5XVzSf86aep2RtRJu7r+GP5plMpL0=
X-Received: by 2002:a17:906:dc8f:b0:7a5:8160:1995 with SMTP id
 cs15-20020a170906dc8f00b007a581601995mr5303847ejc.500.1666596289813; Mon, 24
 Oct 2022 00:24:49 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 24 Oct 2022 09:24:38 +0200
Message-ID: <CACRpkdbG5kktL1qV1BTVvcp178sS6YZa8Uq4m7pbRNFbZe2zyw@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for the v6.1 series, nocheinmal
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

OK we try again. This time I made sure to have my morning
coffee *before* sending pull requests.

What happened last time was: tag the branch, then screw
something up with the tagging pers se (reuse old tag name
by mistake), so erase it and re-push, re-tag and in the
process forget that I moved back to the master branch,
incidentally a clean v6.1-rc1.

This time I made sure to do the right thing by eating my own
dogfood and pulling the branch I pushed back to make
sure it contains the desired changes.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.1-3

for you to fetch changes up to e9945b2633deccda74a769d94060df49c53ff181:

  pinctrl: ocelot: Fix incorrect trigger of the interrupt. (2022-10-18
10:42:10 +0200)

----------------------------------------------------------------
Some pin control fixes for v6.1:

- Fix typos in UART1 and MMC in the Ingenic driver.

- A really well researched glitch bug fix to the Qualcomm driver
  that was tracked down and fixed by Dough Anderson from
  Chromium. Hats off for this one!

- Revert two patches on the Xilinx ZynqMP driver: this needs a
  proper solution making use of firmware version information to
  adapt to different firmware releases.

- Fix interrupt triggers in the Ocelot driver.

----------------------------------------------------------------
Douglas Anderson (1):
      pinctrl: qcom: Avoid glitching lines when we first mux to output

Horatiu Vultur (1):
      pinctrl: ocelot: Fix incorrect trigger of the interrupt.

Sai Krishna Potthuri (2):
      Revert "pinctrl: pinctrl-zynqmp: Add support for output-enable
and bias-high-impedance"
      Revert "dt-bindings: pinctrl-zynqmp: Add output-enable configuration"

Siarhei Volkau (1):
      pinctrl: Ingenic: JZ4755 bug fixes

 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml       |  4 ----
 drivers/pinctrl/pinctrl-ingenic.c                   |  4 ++--
 drivers/pinctrl/pinctrl-ocelot.c                    | 17 +++++++++++++----
 drivers/pinctrl/pinctrl-zynqmp.c                    |  9 ---------
 drivers/pinctrl/qcom/pinctrl-msm.c                  | 21 +++++++++++++++++++++
 5 files changed, 36 insertions(+), 19 deletions(-)
