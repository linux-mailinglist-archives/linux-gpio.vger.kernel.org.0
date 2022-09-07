Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1334C5B0119
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 11:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiIGJ7h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 05:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiIGJ7N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 05:59:13 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D77C1B775D
        for <linux-gpio@vger.kernel.org>; Wed,  7 Sep 2022 02:58:40 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id nc14so29124284ejc.4
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2022 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=heSFzetbXWgbtnsASv1LZ6qPan1dJOs+6DCCGWIHMBc=;
        b=vHf0XP6Ze2kKCdhKxtVAgOHIr2JsfMKXNXZBFepV2YBWzCPoSXlPG+D1rz3Zg9Rch0
         ypMUtQMR9yyK7gQjXW2ZyJ2cnlHlg71InbxQR7ofH3deJAocrr+yORgDxvorjARevA1l
         tJHxHMkBbBa+CnVkksjAvgq0kmgk+59QTtXcjKW9zZhxRIFlhHlqchKmGRNkvoXe2Y85
         F23ax+ngd/IlSAB6HD0FpqhIOJKU7jZkyGDdKtaAWVwaraHMfa6YxvtZnPZFhff7znmT
         4e4T7YcqtsBKyZOiDnLNOkbTrFzdJQLHpf4Mu3ZhQsTPjK/8w9zsT/qHgDHipv7pBptk
         v+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=heSFzetbXWgbtnsASv1LZ6qPan1dJOs+6DCCGWIHMBc=;
        b=QAVhP9ojGupJUqZ8VdZn4lTI72PDXo35+uiR6gkEctEPZNVEeMR5Gw2tiFRpF6p5S8
         wfdwuymRK/H2en5178ethvWA3M90KEREArSPOZSHcSbKlvpojbFjiKMhYe1bRlvQ6XjQ
         lGWPbNmKQCGo0r82vXEXyhgJj8ZqtHq0foWaY0Kutlsi1OarFtcsvvRmNaYJ8n/yyMfU
         /NE2B0Opo+5rvETBByO+L3Upi3NU/+yVp7H11Uh03eWSobLXDluF35YPRCOUyFX1U2AV
         503yHTjn8g95Uy4xtK4HxOuH2AtScBK9PnPe1EL+r6U+XHm8HQD+glyVyzWaJiSUg0o+
         7AsA==
X-Gm-Message-State: ACgBeo0eAXMcJr0OJAkkToWAWToHyVGHWmZdAjEZc6wWDA2mkpfCB7rn
        zBo7T2rBDKNKQjLCMh4gbHoPU1IdaJiYZARq665IjQ==
X-Google-Smtp-Source: AA6agR47HMjnxQAohy22Di9zQNJim5dtH8VkOKRmZAWyo3gky2iLulW9tTE1/ctNbKsixVbNqreBKmb966LjP7FAmDg=
X-Received: by 2002:a17:906:4fd5:b0:74f:2bad:f9d with SMTP id
 i21-20020a1709064fd500b0074f2bad0f9dmr1687207ejw.697.1662544719244; Wed, 07
 Sep 2022 02:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662116601.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1662116601.git.christophe.leroy@csgroup.eu>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 7 Sep 2022 11:58:28 +0200
Message-ID: <CAMRc=MehcpT84-ucLbYmdVTAjT86bNb9NEfV6npCmPZHqbsArw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] gpio: Get rid of ARCH_NR_GPIOS (v2)
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Keerthy <j-keerthy@ti.com>, Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Davide Ciminaghi <ciminaghi@gnudd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GENERIC INCLUDE/ASM HEADER FILES" 
        <linux-arch@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 2, 2022 at 2:42 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Since commit 14e85c0e69d5 ("gpio: remove gpio_descs global array")
> there is no limitation on the number of GPIOs that can be allocated
> in the system since the allocation is fully dynamic.
>
> ARCH_NR_GPIOS is today only used in order to provide downwards
> gpiobase allocation from that value, while static allocation is
> performed upwards from 0. However that has the disadvantage of
> limiting the number of GPIOs that can be registered in the system.
>
> To overcome this limitation without requiring each and every
> platform to provide its 'best-guess' maximum number, rework the
> allocation to allocate from 512 upwards, allowing approx 2 millions
> of GPIOs.
>
> In the meantime, add a warning for drivers how are still doing
> static allocation, so that in the future the static allocation gets
> removed completely and dynamic allocation can start at base 0.
>
> Main changes in v2:
> - Adding a patch to remove sta2x11 GPIO driver instead of modifying it
> - Moving the base of dynamic allocation from 256 to 512 because there
> are drivers allocating gpios as high as 400.
>
> Christophe Leroy (8):
>   gpio: aggregator: Stop using ARCH_NR_GPIOS
>   gpio: davinci: Stop using ARCH_NR_GPIOS
>   gpiolib: Warn on drivers still using static gpiobase allocation
>   gpiolib: Get rid of ARCH_NR_GPIOS
>   Documentation: gpio: Remove text about ARCH_NR_GPIOS
>   x86: Remove CONFIG_ARCH_NR_GPIO
>   arm: Remove CONFIG_ARCH_NR_GPIO
>   arm64: Remove CONFIG_ARCH_NR_GPIO
>
> Davide Ciminaghi (1):
>   gpio: Remove sta2x11 GPIO driver
>
>  Documentation/driver-api/gpio/legacy.rst |   5 -
>  arch/arm/Kconfig                         |  21 --
>  arch/arm/include/asm/gpio.h              |   1 -
>  arch/arm64/Kconfig                       |  12 -
>  arch/x86/Kconfig                         |   5 -
>  drivers/gpio/Kconfig                     |   8 -
>  drivers/gpio/Makefile                    |   1 -
>  drivers/gpio/gpio-aggregator.c           |   7 +-
>  drivers/gpio/gpio-davinci.c              |   3 -
>  drivers/gpio/gpio-sta2x11.c              | 411 -----------------------
>  drivers/gpio/gpiolib.c                   |  13 +-
>  include/asm-generic/gpio.h               |  55 ++-
>  12 files changed, 33 insertions(+), 509 deletions(-)
>  delete mode 100644 drivers/gpio/gpio-sta2x11.c
>
> --
> 2.37.1
>

I'd like to take it through the GPIO tree if we can get acks for ARM and x86?

Bart
