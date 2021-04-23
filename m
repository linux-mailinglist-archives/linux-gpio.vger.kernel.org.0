Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A90369D3F
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Apr 2021 01:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbhDWXX0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 19:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhDWXX0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Apr 2021 19:23:26 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60C1C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 23 Apr 2021 16:22:48 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id r9so76104780ejj.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Apr 2021 16:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=9KdCYVYjsxm43pdzjAW7S0Q2+F1LcWUUXR0r+zmo39s=;
        b=e3t/dADON64hxvBTxTkoSr3n+kMdchKnreD351DeJmixuumfC7fIkQSUbls7LMo8Ds
         7nADt0soBN11Td+VpBE8KUqzbkifFvV0cdfJ6OnHLLbxCDnV8KuU1VruL1PcMjrn2mRt
         6RkZJu5o1mUNUGh4GFb0m26TsBsqoyAjSYv0bmE13zeCjVb98qVCjX/bFRIRmQ2TZsqk
         OLyTxfQIsV4Ys5DLujQfjIPLekO2nsOTlVAu8Z21jdI493Nk/mfjVustBiVCpx8x2QsT
         jza1EFUhLL7hi+sl+ZoqTZ21Z60xLm51AlHXKET0RuN+8VzyuGy3Csh8GVKlmgUcrpcN
         94MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=9KdCYVYjsxm43pdzjAW7S0Q2+F1LcWUUXR0r+zmo39s=;
        b=Fwc6+fiSXm4+KAb9V3nvSmF7Tc+iGMjijEX0VTEl8tTrwkT6QT+G2HU7UbU+s1LKQo
         NvVt7ZUY6ox57/XxFP3rIWFjMl+F8Fy6l3MjwltQZk0g4Y2b8bsBEDlo5h3UMAiF4lxI
         NrHkpsspoqdxLwwj97VOK2su3wDJ3rr/HiveKwiLLOKb8hUXItFIjbLVAklfpm7ZePlY
         T0rqM2ENlKdaWymtgsPAYFZyATvz8CZ7lP95MqY9QwImVvs7KYb9d8optT1K6keBjuQd
         EG3Ske5P/ygAyrOTa0Kxbzae99GTrOU+dCmWvgOuIAFUl9mo9THvNDHqBTDD8OCmypIR
         onGw==
X-Gm-Message-State: AOAM5326V/KFc07dpDjb7Rby21kXzmBkUM38+NZyrTc+zssuum4P7W5U
        lJWd6CkN94UKJ1Qe3gfpBYatBLOHT9Dd3V1hUiC94g==
X-Google-Smtp-Source: ABdhPJyRYx8qR/OoKBcHt47tR0XtriE/q6Xr5yh5O4DmKN830KcuvaeeFVJPK4RVxsSfReNGrQ95KPpulby28bOjrro=
X-Received: by 2002:a17:906:f285:: with SMTP id gu5mr6736919ejb.226.1619220167200;
 Fri, 23 Apr 2021 16:22:47 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 24 Apr 2021 01:22:36 +0200
Message-ID: <CACRpkdY6g7eoqyJ-OHijbR_Gw2W7uoNF5Z6+-at5OBvaH9_kqw@mail.gmail.com>
Subject: [GIT PULL] final pin control fixes for v5.12
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

some late pin control fixes, would have been in the main pull request
normally but hey I got lucky and we got another week to polish up v5.12
so here we go.

One driver fix and one making the core debugfs work.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit e49d033bddf5b565044e2abe4241353959bc9120:

  Linux 5.12-rc6 (2021-04-04 14:15:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v5.12-3

for you to fetch changes up to 482715ff0601c836152b792f06c353464d826b9b:

  pinctrl: core: Show pin numbers for the controllers with base = 0
(2021-04-22 02:13:42 +0200)

----------------------------------------------------------------
Late pin control fixes for v5.12:

- Fix the number of pins in the community of the Intel
  Lewisburg SoC.

- Show pin numbers for controllers with base = 0 in the
  new debugfs feature.

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: core: Show pin numbers for the controllers with base = 0

Linus Walleij (1):
      Merge tag 'intel-pinctrl-v5.12-4' of
gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into fixes

Yuanyuan Zhong (1):
      pinctrl: lewisburg: Update number of pins in community

 drivers/pinctrl/core.c                    | 14 ++++++++------
 drivers/pinctrl/intel/pinctrl-lewisburg.c |  6 +++---
 2 files changed, 11 insertions(+), 9 deletions(-)
