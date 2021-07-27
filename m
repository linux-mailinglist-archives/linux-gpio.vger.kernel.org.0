Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0C23D6E97
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 08:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235442AbhG0GCO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 02:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233553AbhG0GCN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 02:02:13 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423ACC061757;
        Mon, 26 Jul 2021 23:02:14 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id o12so6562540vst.3;
        Mon, 26 Jul 2021 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zSDe59vPWEj/SmgK0vEeTUqanfjKXhMLDM1NtWXR18M=;
        b=gAeURxgU5XGkJikDnBL8Wt24JlOIFb/N6RmcuF7N17mdMxxJN1ZWuCgF7TeHg5Bd7w
         zCrqAIIlzcEqY3LoGFcC+A401wGhgvTLSEkSgJV0vfx9iYVP2nEqCj/+8VMn67razSZB
         IJM87syjlsgDsfXI8wtSrzAq6h8BY85eCHLUDl6hSmNDxvqYEzCEF7+KlaS6rScfjEJE
         a69rPOL39OAVGYV7ufeS5t2snBs7199Jb5ltxCLUaDNTKQendAeMCONTn5YXAXESTix4
         lWVjd9SbtD8E9JC2hXHet7DwCbHYE2E7/yYq5IcH9gJn04qZnf+QeeIl4XS6ETQTJSNw
         GWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zSDe59vPWEj/SmgK0vEeTUqanfjKXhMLDM1NtWXR18M=;
        b=OLS4pC62WSIDleCUcJQwGV7jwkTXqN9iFSeb71UtKemPIJMPVvQpNwivybKJxpjHiP
         nCAKMhIrh4KyDQCnb6eTic4SAZwbKN6AmPaLYJKSi0HMCwfmcLe4CtnuucqaQYiU8tU8
         xiipOg4W1VlZvmBpc64UDCy9eOWazR9jS0Oz9vdfBAb74lwKSUsdmQwJwz7P9dm5AHcy
         i1GqVSm8or60bqU/Lm3o2AOrcsI+Vuu2gONRbVw7g8z72F7+8LfDoOmvB9g0giKrUTz3
         cQ4FSw+VaXCxiG8D1R4oDFxo5k1MewLBnOTp+lEmdKQQIQYIWhSFO16zw5AhTfIAM+RC
         hGQA==
X-Gm-Message-State: AOAM533y16iGH6EC/rRsOHWu0Sh+QjtkK+p86DC8iohcPzEjpi/CkJ3Y
        nyyBnwgghQ/nFXiG+e+Izh6STGdWerC9BRtd4Q7gn4sUZ0Y=
X-Google-Smtp-Source: ABdhPJxpxQ55+LbyITPZBLOSdQkCpHrFsXyCFzZKtzxxi2CTsd5OkKEiRCaCG8cgCHKaN3uw2Et/vPPp+/W7ratb+ms=
X-Received: by 2002:a67:e94c:: with SMTP id p12mr15058428vso.28.1627365733212;
 Mon, 26 Jul 2021 23:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 27 Jul 2021 08:02:01 +0200
Message-ID: <CAMhs-H9fbHMxxSaqMj=nyACAN6aDB-bYK1nF1dRh8a1krTdaZg@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip per device
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        NeilBrown <neil@brown.name>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 8, 2021 at 9:04 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> There are some unfortunate cases where the DT representation
> of the device and the Linux internal representation differs.
> Such drivers for devices are forced to implement a custom function
> to avoid the core code 'devprop_gpiochip_set_names' to be executed
> since in any other case every gpiochip inside will got repeated
> names through its internal gpiochip banks. To avoid this antipattern
> this changes are introduced trying to adapt core 'devprop_gpiochip_set_names'
> to get a correct behaviour for every single situation.
>
> This series introduces a new 'offset' field in the gpiochip structure
> that can be used for those unfortunate drivers that must define multiple
> gpiochips per device.
>
> Drivers affected by this situation are also updated. These are
> 'gpio-mt7621' and 'gpio-brcmstb'.
>
> Motivation for this series available at [0].
>
> Thanks in advance for your feedback.
>
> Best regards,
>     Sergio Paracuellos
>
> [0]: https://lkml.org/lkml/2021/6/26/198
>
> Sergio Paracuellos (3):
>   gpiolib: convert 'devprop_gpiochip_set_names' to support multiple
>     gpiochip baks per device
>   gpio: mt7621: support gpio-line-names property
>   gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'
>
>  drivers/gpio/gpio-brcmstb.c | 45 +------------------------------------
>  drivers/gpio/gpio-mt7621.c  |  1 +
>  drivers/gpio/gpiolib.c      | 34 +++++++++++++++++++++++-----
>  include/linux/gpio/driver.h |  4 ++++
>  4 files changed, 34 insertions(+), 50 deletions(-)

Hi!

Linus, Bartosz, any comments on this series?

Best regards,
    Sergio Paracuellos
>
> --
> 2.25.1
>
