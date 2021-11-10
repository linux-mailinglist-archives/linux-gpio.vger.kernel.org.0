Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F35644B982
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 01:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhKJAGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 19:06:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbhKJAGj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 19:06:39 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11AFBC061764
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 16:03:53 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id be32so1777418oib.11
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 16:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ex3FTl74QW3tE5vZKlAyIh2nQ76GasOzWY712By4q7Q=;
        b=nz35NBQpCwebMfC4qJ/iN9iKacj6CluV5tZh9dWADjGXBTRFXfPHCnA3/gPH/AOEFy
         Qi68PxiTe3kXlIkJa/KeHy35jUV78n1QxqOdj5NEldZdW56idj04p3aHuFkNUI2uaJL9
         BO5OEKTP+VGR4h5JelX0jJ9jYP5kFg/gQTzLOyZJnq+UADTMnHzewZLq711v1660zgMy
         1MlUEkdlCNKJHaB/z/tjwWEbf2iCQXPujfMF89KDGa/u8H9/HSM2Ch5aMLQFfZ1wL02S
         9FXF9rq7+J+pyXAXLR2M5PtYI0/3XOrXQ0F6CfDuE9/ssJ9/AS8vLGepUkkdZAVWZ6cA
         mulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ex3FTl74QW3tE5vZKlAyIh2nQ76GasOzWY712By4q7Q=;
        b=Rvj6yu2wwEo1LiQbQ6D7EvrOjHuNEgse3LFRjSMiQPnoHfPft1fe3N3vUkedyKjSTF
         Z8+hdssXc7EQUHM8gtActNaZmx/jzgmldsU2aU6tMjf4yc42jZUI77NTCOMak22+VOd/
         4PsN54AbVO/Da4/HnleSzvzXxw1WosKThJBAdNdHFlkBw25hidxEb05rCkt6G/Ox+yrl
         Dd0vCK8bIhP2/cl70Oo4NkLEYQLUMFSeBvxxR4vQpPmoW4Jb8ZEsZL452mHnc7xJkXLQ
         /TDZeNGvpuyQhLlaLsFLHuyl3cpdPAgA6J8AmlI2FL6Fmsf45x1Mv/SUh4Qpe3PPHBXT
         jNUQ==
X-Gm-Message-State: AOAM532qBEAQMh9vZ8NA6bYb0/FR4FmtkfZ/aWUSkoQzhbdeKw2Tvv9B
        MBBSk8rSSTIx1iei7ODdQ8gY8DXUtlRX2ebvUMrzOw==
X-Google-Smtp-Source: ABdhPJwoBG6zw/ToNJoeYVsxzPxnjF1p3mLyfasl2FJHFDY84Mv43Y9zsw+ptdymwyhGsYw1VT5GEI7H46VItvzLaE8=
X-Received: by 2002:a54:4791:: with SMTP id o17mr9816139oic.114.1636502632428;
 Tue, 09 Nov 2021 16:03:52 -0800 (PST)
MIME-Version: 1.0
References: <20211109100207.2474024-1-arnd@kernel.org> <20211109100207.2474024-7-arnd@kernel.org>
 <YYpN3LzXz638l6FG@smile.fi.intel.com> <CAK8P3a24wkBEAnWG8=LYoVR1oiTo0VKZ3iME+FYbDuHXJDjMOw@mail.gmail.com>
 <CACRpkdZaJQqwyosnXhaOc=mF5jJxaDKDKAQxJGJvQAWpU7MNQQ@mail.gmail.com> <CAK8P3a0J1f9+o6Uqdn4QeQ=30oW6p+fOaFU7-5L0cW-zihfNxg@mail.gmail.com>
In-Reply-To: <CAK8P3a0J1f9+o6Uqdn4QeQ=30oW6p+fOaFU7-5L0cW-zihfNxg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Nov 2021 01:03:40 +0100
Message-ID: <CACRpkda8mL9DGenPaGtXEiK9v4-pWo_kA5khK6Mk0i5i5fs1SA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] gpiolib: remove legacy gpio_export
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 11:47 PM Arnd Bergmann <arnd@kernel.org> wrote:

> v3.18 676
> v4.1 669
> v4.4 646
> v4.9 639
> v4.14 614
> v4.19 553
> v5.4 465
> v5.10 381
> v5.15 354

Hey :D I didn't know it was working out that well. OK this give me hope!

> I've also started a patch series to remove some of the less common
> of_gpio portions, which gets rid of of_get_gpio(), of_get_gpio_flags()
> and of_get_named_gpio_flags() but leaves of_get_named_gpio() in
> place for now. I'm much less confident about that work though, so I
> haven't posted that. I think killing off the of_gpio consumer-side
> interfaces entirely would likely make the biggest impact, as those
> appear to still be used a lot in relatively modern drivers, while the
> traditional gpio_request() interfaces are mainly used in drivers for
> legacy boards that don't have a long future ahead of them unless
> they get converted to DT.

OK you got a point. I am running around in SA1100 systems and
stuff like that :/ getting rid of of_gpio.h would be a real nice feat.

Yours,
Linus Walleij
