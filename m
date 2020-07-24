Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E975722C224
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 11:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbgGXJWb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 05:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728342AbgGXJWa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 05:22:30 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA2CC0619D3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 02:22:29 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q7so9293767ljm.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 02:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NIN2eG6kxQsTMBpOwVSU6dRg3bbC+qayNO9Wkv9P+PQ=;
        b=ueR30SwbJ+rAmb+W+yOnb26b9Bq1/lkv19P4z+FB0L2SeIkegmvr6F6TdSscAoD6JI
         3cERgk3EAOpgR3fsis+BCYgSh3bFlS+jKkpBZkSN/kY3V+B4+UmGrt6QxidB7/JijXJz
         lsD0e8pAcV7u4ePXMK5g0aRWn+oXYzksG/ZbyjRjofaBY68qvHzm20fk/kTyJbw1N4dQ
         G2dhUKBrUvIOGxW36HmMyC6QKxiZPr7W7piXKEqxYB1j22wXEbVhCS3dLZs4nTjy0KCv
         wH/rQHC0jK6EcdVdeZ1OWUzwqUNQUAWu8dHOOpiQBGMh0DpxsqiPuodFq0e8HJmv+caa
         KXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NIN2eG6kxQsTMBpOwVSU6dRg3bbC+qayNO9Wkv9P+PQ=;
        b=e8ShGaeoEg34z+ZTuukMILHCPhmEfT+M5I1T7vyWBIlht6KEbzCVfp25RQB7gg0C6g
         7lgS75zvcs3By046OnDvDpLaHNGddZ6harUNrP5uQP9SNQRcyUYWJUQtttALv8Cm+mY6
         B7gtzI7tF6w+2VgA73OtvTeQK3Y6M3WXvTKUfD+mgaFMuI8ZP6nxxO6ji37z05ok7y0s
         pVb4VEBtz53mN3pyLG07PVBRIvhbuzHCpCR+QTMZQocgC7SyeIMRYeTfeTrfvmTm4Lhp
         v60ZID6wmb7mGJQa6Aup6GUf+MUbU0ru4Hifi6LB08G9xkNlddPSZBXrZ++jhG0qLNdQ
         fB9Q==
X-Gm-Message-State: AOAM533wGsE2G/GsTlr+GKR1es16DuWYIlCPWepv3vO1KybiroLwfoal
        OAwryCUMz6DZQloVHXsNxklA3HlUNXzLswRFvE5g0Q==
X-Google-Smtp-Source: ABdhPJy1kxaa4/qH3lXM5ZPK1KAZ7uW0S11/tRncapyJVFPYOfPxHvEk9ABpsCyBSKAwlbvbZ811yX3n+1ZLG46V/7M=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr3848032ljg.144.1595582548179;
 Fri, 24 Jul 2020 02:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <1595513168-11965-3-git-send-email-srinivas.neeli@xilinx.com> <202007241241.Eamn0vcf%lkp@intel.com>
In-Reply-To: <202007241241.Eamn0vcf%lkp@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 Jul 2020 11:22:16 +0200
Message-ID: <CACRpkda0YiUQTUDOEo7gnuegtPFauUyeLWs7wDkapzrUC-nwAw@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] gpio: xilinx: Add interrupt support
To:     kernel test robot <lkp@intel.com>
Cc:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, kbuild-all@lists.01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 24, 2020 at 6:12 AM kernel test robot <lkp@intel.com> wrote:

>    drivers/gpio/gpio-xilinx.c: In function 'xgpio_probe':
>    drivers/gpio/gpio-xilinx.c:638:10: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
>      638 |  chip->gc.of_gpio_n_cells = cells;
>          |          ^
> >> drivers/gpio/gpio-xilinx.c:639:10: error: 'struct gpio_chip' has no member named 'of_xlate'
>      639 |  chip->gc.of_xlate = xgpio_xlate;
>          |          ^

This is probably because your driver needs:

depends on OF_GPIO

in KConfig

Yours,
Linus Walleij
