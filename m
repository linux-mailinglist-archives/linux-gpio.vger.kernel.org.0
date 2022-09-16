Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D44D25BAD2F
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Sep 2022 14:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbiIPMPU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Sep 2022 08:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiIPMPS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2022 08:15:18 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD9857252
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 05:15:17 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id e17so31228841edc.5
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 05:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date;
        bh=ayXbl0YgR9+wADs9gFb01FkaCinZZlK1kdsl3LS0mm4=;
        b=S/IKFce0NcFpL/uIMTYMuGqryU6h4vlk+dWwN0V1wgFbXWf+TBJAS0FQ21KwCLFSVc
         SUsPFHstOyyqQa34flBQ2P6hzGG/YDe9pPJgOuN2H++vuEZzG1EonCMUUJKFogAOQ4M/
         t2E9YvwRWUo8z57+qi+3dEIByNggHJ/l52KHh3w3ohE7Vfg+gikSKAetBUu1P4GZZ9kS
         osAUSoStRxa1URvRMI4iWFP/E8kYJ7FPDgLwysN5urDmRMfFEuxsvLemH7KiXlmz0QNq
         QDbkwfmQSqeCYkHvzySC8mfPWLA14oWsbSJVRchc6AdoJBa5DSEKYzNkEPrWFDHsz8/g
         IGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ayXbl0YgR9+wADs9gFb01FkaCinZZlK1kdsl3LS0mm4=;
        b=mnRuCyUCkjLln5HiTD0WX8h9ICRODkmcd2e9M+hNXHaZtC4AnNThfE4eIPIbzd3Nwh
         zR8XcCqQ/1rc3QEOHrR1pCG3MEZhgyv1W/7jBxisREgE0W7wVNPLvwk5LuVIC/rm2ipj
         GndQ1lQzPDfiQO7gt5ic2Dyvz4xG3C/C/bFmvtJp56BDzVZuQ93lzBiCosNpKx+NVip/
         /AlwILerkoIKH+hhCqwAeB0UYBvL4VNZyaPVzTBtj1W8RrhisSweqIQTXF7lxC7548tw
         7lqlZc9Q56kyflyGCdnNBM+vCctKwAMbHlppSFX3ClqjdwApgwlJAll1Fz7BtqxamjK5
         5C5g==
X-Gm-Message-State: ACrzQf1hhCeDMlYW0qXhv436IKXTSKwZ8V7+wyuzlqq9CYA1a6hifFq1
        bkEvLmuqsG+h5Xnc17pxj6parQvCjLpqCEUak4vtSA==
X-Google-Smtp-Source: AMsMyM5Ux5YNW+ePbMT3v1ATtqKJl1uJqigth3slPjvDg67Ram2wPpvIn6jX0Srf1G5Ht82dvKLMHjYAs4+bvpos4N8=
X-Received: by 2002:a05:6402:190f:b0:452:d6ba:a150 with SMTP id
 e15-20020a056402190f00b00452d6baa150mr3761522edz.126.1663330515919; Fri, 16
 Sep 2022 05:15:15 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 16 Sep 2022 14:15:04 +0200
Message-ID: <CACRpkdZZU51xqQgQA3tDC6ccaZ2WbDc_CPk79c3DgXPS6Wsivw@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for the v6.0 series
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

here are some pin control fixes for the v6.0 series.
Nothing special, just driver fixes. Details in the signed
tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868=
:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.0-2

for you to fetch changes up to c297561bc98ad0f2a37ce0178ee3ba89ab586d70:

  pinctrl: ocelot: Fix interrupt controller (2022-09-14 15:00:16 +0200)

----------------------------------------------------------------
Some pin control fixes for v6.0:

- Fix IRQ wakeup and pins for UFS and SDC2 issues on the
  Qualcomm SC8180x
- Fix the Rockchip driver to support interrupt on both rising
  and falling edges.
- Name the Allwinner A100 R_PIO properly
- Fix several issues with the Ocelot interrupts.

----------------------------------------------------------------
Horatiu Vultur (1):
      pinctrl: ocelot: Fix interrupt controller

Jo=C3=A3o H. Spies (1):
      pinctrl: rockchip: Enhance support for IRQ_TYPE_EDGE_BOTH

Michael Wu (1):
      pinctrl: sunxi: Fix name for A100 R_PIO

Molly Sophia (2):
      pinctrl: qcom: sc8180x: Fix gpio_wakeirq_map
      pinctrl: qcom: sc8180x: Fix wrong pin numbers

 drivers/gpio/gpio-rockchip.c                  |   4 +-
 drivers/pinctrl/pinctrl-ocelot.c              | 111 ++++++++++++++++++++++=
----
 drivers/pinctrl/qcom/pinctrl-sc8180x.c        |  10 +--
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c |   2 +-
 4 files changed, 105 insertions(+), 22 deletions(-)
