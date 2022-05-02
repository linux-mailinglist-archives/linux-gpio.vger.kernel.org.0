Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73B4E516DAE
	for <lists+linux-gpio@lfdr.de>; Mon,  2 May 2022 11:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384353AbiEBJvW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 May 2022 05:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384432AbiEBJvM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2022 05:51:12 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD07C186EB
        for <linux-gpio@vger.kernel.org>; Mon,  2 May 2022 02:47:39 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id k23so26786037ejd.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2022 02:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GYCNul8cm8jd0FZKsO1ogduF16MMw2ed/rY6UMAW45w=;
        b=xyk9ASH5NDjKUNtzg25Ax6q2zbLei2pGvw+10kPKB7AabRknXwtMJa0UlK0Rrbv3j5
         CNJm/eW2/WPVJGOPdYspRczZT7Jsq87WpysEnd3bh/kjjKrAaeRL+nXm8Dd4yyvQsF7w
         9+ZN/iI1KJTfQAwz+RxHrXjUhfgzavfAVU+h/4SE08vzEjdqr/d7E6PlqN/77ulkq/DI
         g74AEKkdGgKkhOvjpyVLUtKxFHWwVEFIxe6cyS6cwWqw3u9Yyf5vr5QdOQ/ajXffS8Ht
         HTt/CQnDkqQqLLQ0ezvsHRO07i0iz4sT0YUEubBy5C+9zWua4mIcEhdd7Kml1cDVkdkW
         V7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GYCNul8cm8jd0FZKsO1ogduF16MMw2ed/rY6UMAW45w=;
        b=YpXsPn0PnIE8wSw+1moI72CXHA+orEUH5NY6Lgh2jwb50k4ERHuKyBjSZJaa9YKUYS
         QBGI5z2goDD+rvJcLdAUmnswfaDPN5oTtZzZHg4uuvOjK3PAzJaZUvr9+/viMh+/6+wO
         /AJKMpMWoj8aY47xdr5zpzMORT+VveliANrMydMQ1iXNlciRWsk/Qe+ANFEzuCyGbSzu
         AlBmBVlXXESU3r1J2yROnpGC4a7yJHOb5mZNSH+w1FqZ5xIci0I2fOOfxr6btSbpp9JX
         9Xe9hl0trx/wEzESFiEF5EJYNpJhpTUmW64U1g9giIqwGPYWE2p/QbRrKaK73IQw4BQr
         Wfyw==
X-Gm-Message-State: AOAM532oSo5eJe18JUmPICYkkk4CTBTro/XqcD4aPJ19SsCV/vbKREbB
        ae4hVe2sDkruxdWwwdon8xUD1Ctc/P9/M/21vgVRjS4UsNfrXw==
X-Google-Smtp-Source: ABdhPJyyV/fa25tU2u+owFmjOP5PPEnCp6avlC2YWULA5kcGY7K5xqFFovfXkR5KxbuljG72m+RSkG+EKHd0dowC2jw=
X-Received: by 2002:a17:907:c28:b0:6f4:2a80:f355 with SMTP id
 ga40-20020a1709070c2800b006f42a80f355mr7583490ejc.101.1651484858350; Mon, 02
 May 2022 02:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <YmwuK60FMGR2Kn0R@smile.fi.intel.com>
In-Reply-To: <YmwuK60FMGR2Kn0R@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 May 2022 11:47:27 +0200
Message-ID: <CAMRc=MdYDjA3PRfQmVtO1fPOgtX9b6WF_4zVoKM2F9kKgntzkg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.19-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 29, 2022 at 8:28 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> Supposed to be an immutable tag to be included in GPIO and pin control subsystems.
> Have been in Linux Next for a while w.o. any issues reported. Please, pull.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit 0c2cae09a765b1c1d842eb9328982976ec735926:
>
>   gpiolib: acpi: Convert type for pin to be unsigned (2022-04-08 15:13:22 +0300)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.19-1
>
> for you to fetch changes up to edc5601db66411a8c9c6b08b3aacf7e154a34c6d:
>
>   pinctrl: meson: Replace custom code by gpiochip_node_count() call (2022-04-18 16:18:52 +0300)
>
> ----------------------------------------------------------------
> intel-gpio for v5.19-1
>
> * Introduce helpers to iterate over GPIO chip nodes and covert some drivers
>
> The following is an automated git shortlog grouped by driver:
>
> gpiolib:
>  -  Introduce a helper to get first GPIO controller node
>  -  Introduce gpiochip_node_count() helper
>  -  Introduce for_each_gpiochip_node() loop helper
>
> pinctrl:
>  -  meson: Replace custom code by gpiochip_node_count() call
>  -  meson: Enable COMPILE_TEST
>  -  meson: Rename REG_* to MESON_REG_*
>  -  armada-37xx: Reuse GPIO fwnode in armada_37xx_irqchip_register()
>  -  armada-37xx: Switch to use fwnode instead of of_node
>  -  samsung: Switch to use for_each_gpiochip_node() helper
>  -  samsung: Drop redundant node parameter in samsung_banks_of_node_get()
>  -  npcm7xx: Switch to use for_each_gpiochip_node() helper
>  -  renesas: rza1: Switch to use for_each_gpiochip_node() helper
>  -  renesas: rza1: Replace custom code by gpiochip_node_count() call
>  -  stm32: Switch to use for_each_gpiochip_node() helper
>  -  stm32: Replace custom code by gpiochip_node_count() call
>
> ----------------------------------------------------------------
> Andy Shevchenko (15):
>       gpiolib: Introduce for_each_gpiochip_node() loop helper
>       gpiolib: Introduce gpiochip_node_count() helper
>       pinctrl: stm32: Replace custom code by gpiochip_node_count() call
>       pinctrl: stm32: Switch to use for_each_gpiochip_node() helper
>       pinctrl: renesas: rza1: Replace custom code by gpiochip_node_count() call
>       pinctrl: renesas: rza1: Switch to use for_each_gpiochip_node() helper
>       pinctrl: npcm7xx: Switch to use for_each_gpiochip_node() helper
>       pinctrl: samsung: Drop redundant node parameter in samsung_banks_of_node_get()
>       pinctrl: samsung: Switch to use for_each_gpiochip_node() helper
>       gpiolib: Introduce a helper to get first GPIO controller node
>       pinctrl: armada-37xx: Switch to use fwnode instead of of_node
>       pinctrl: armada-37xx: Reuse GPIO fwnode in armada_37xx_irqchip_register()
>       pinctrl: meson: Rename REG_* to MESON_REG_*
>       pinctrl: meson: Enable COMPILE_TEST
>       pinctrl: meson: Replace custom code by gpiochip_node_count() call
>
>  drivers/pinctrl/meson/Kconfig               |   2 +-
>  drivers/pinctrl/meson/pinctrl-meson.c       |  52 +++++-----
>  drivers/pinctrl/meson/pinctrl-meson.h       |  28 +++---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |  34 ++-----
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c   | 142 ++++++++++++----------------
>  drivers/pinctrl/renesas/pinctrl-rza1.c      |  47 +++------
>  drivers/pinctrl/samsung/pinctrl-exynos.c    |   8 +-
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c   |   2 +-
>  drivers/pinctrl/samsung/pinctrl-s3c64xx.c   |   4 +-
>  drivers/pinctrl/samsung/pinctrl-samsung.c   |  30 +++---
>  drivers/pinctrl/samsung/pinctrl-samsung.h   |   2 +-
>  drivers/pinctrl/stm32/pinctrl-stm32.c       |  80 +++++++---------
>  include/linux/gpio/driver.h                 |  28 +++++-
>  13 files changed, 210 insertions(+), 249 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bart
