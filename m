Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACCB12D71F5
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 09:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405481AbgLKIjZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 03:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405480AbgLKIjQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 03:39:16 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A09C0613D3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 00:38:36 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id a8so12261141lfb.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 00:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Q7ZgrovpCBzqgAGbqdv4/9NdqxY6s59Bi3Lq1+DyvvE=;
        b=DiA14UryjHTwv+yV74bKyHmrMzG63/6bNbW1EaOU23ijUD094ojY3TbBvG3QUWqIgq
         loaZEDj4iHuxMTDj5iNv0xUMegMlMfpDkorj4HbOHHWepadBB3m8dIA6U8/MwSa7xTTp
         pzWTM/TD7FtBRS/o+FRTWppBgxYRMdmSjwpukk+JiXWHhbMXGY9DiJ6y8A5iPnwAMe3/
         NHwOz/tBrY/o6tqyWtQhlfpQBP0UI38/OALeiMW6EvcmrFM8F2eUVd85sT2+Ps5oaFvN
         /PHGsQ0IWFLs4DhenCw3g+onWLrjV5+MymNk+nQPeXD5jz3NJDQjusR4buE/v2Ld2Lad
         kkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Q7ZgrovpCBzqgAGbqdv4/9NdqxY6s59Bi3Lq1+DyvvE=;
        b=nIg0rf9Xe3D17AaqlQSyh/0u1DqB3LtZBwZJ7LYTUcnmWyum6YlbP45usANwSlC/Xv
         CfAO8vYdiw3gzoarRCLEYhaVOVMQ9rOjUuWyOk/UKRbjZ53Lqh9Yrt/1dSKDj4cYJgfa
         rF3gCGkUMZE/Ik92zfiSWiH7q+fSAbOZCqylbP6T9Uz4qdCCWBKQwFyfrxb8asS694fL
         ryN5/dIetC2dd9vH/GGHdmY1UYRtpnP0WvkVnZDltiNYCH6iBWofY+j4qsvlXuXxnhjD
         7wId9fd5IuFxajd6N6o7dDFiLce2mgkyxEx3zizgHnzmInpN8DTlW7/jKAHwpgeRIdtR
         bkzw==
X-Gm-Message-State: AOAM5331jNKmKsKgdcmSqY/vTlmM5PntbJmhbWwFPRtGN/wQVnhqhaJ+
        Q/bmlUdnZRBZKWuVni9o5GkS9dB3uL95555hfPodmg==
X-Google-Smtp-Source: ABdhPJwDM0owtGgUOGZECwePcDEoL1uCg8+/OjpChYLm33vdjTX0brE6ZTcJxzIqrFgUay8kxGWTUSLjebk0MhYbMuQ=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr4442461lfe.29.1607675914891;
 Fri, 11 Dec 2020 00:38:34 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Dec 2020 09:38:23 +0100
Message-ID: <CACRpkdbVVZPFs-=pyDO-HpR4yY-f2nyYRgTTwNbA3nMzXaYSNQ@mail.gmail.com>
Subject: [GIT PULL] Late GPIO fixes for v5.10
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

these are hopefully the last GPIO fixes for this cycle. All are driver
fixes except a small resource leak for pin ranges in the gpiolib.
Two are PM related, which is nice because when developers start
to find PM bugs it is usually because they have smoked out the
bugs of more severe nature.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:

  Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/v5.10-3

for you to fetch changes up to 263ade7166a2e589c5b605272690c155c0637dcb:

  gpio: eic-sprd: break loop when getting NULL device resource
(2020-12-09 09:41:49 +0100)

----------------------------------------------------------------
GPIO fixes for the v5.10 kernel series:

- Fix runtime PM balancing on the errorpath of the Arizona driver.
- Fix a suspend NULL pointer reference in the dwapb driver.
- Balance free:ing in gpiochip_generic_free()
- Fix runtime PM balancing on the errorpath of the zynq driver.
- Fix irqdomain use-after-free in the mvebu driver.
- Break an eternal loop in the spreadtrum EIC driver.

----------------------------------------------------------------
Baruch Siach (1):
      gpio: mvebu: fix potential user-after-free on probe

Chunyan Zhang (1):
      gpio: eic-sprd: break loop when getting NULL device resource

Edmond Chung (1):
      gpiolib: Don't free if pin ranges are not defined

Linus Walleij (1):
      Merge tag 'gpio-fixes-for-v5.10-rc7' of
git://git.kernel.org/.../brgl/linux into fixes

Luo Jiaxing (1):
      gpio: dwapb: fix NULL pointer dereference at dwapb_gpio_suspend()

Qinglang Miao (1):
      gpio: zynq: fix reference leak in zynq_gpio functions

Zheng Liang (1):
      gpio: arizona: disable pm_runtime in case of failure

 drivers/gpio/gpio-arizona.c  |  1 +
 drivers/gpio/gpio-dwapb.c    |  2 ++
 drivers/gpio/gpio-eic-sprd.c |  2 +-
 drivers/gpio/gpio-mvebu.c    | 16 +++++++++++-----
 drivers/gpio/gpio-zynq.c     |  4 ++--
 drivers/gpio/gpiolib.c       |  5 +++++
 6 files changed, 22 insertions(+), 8 deletions(-)
