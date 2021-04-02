Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64FC352DD9
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Apr 2021 18:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234673AbhDBQjA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Apr 2021 12:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhDBQi7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Apr 2021 12:38:59 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A947BC0613E6
        for <linux-gpio@vger.kernel.org>; Fri,  2 Apr 2021 09:38:58 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id o2so2750483plg.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Apr 2021 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nI/YcJWB6mwe6cqtpFafS5vBZiJQ4R+wqncTbSXKoeY=;
        b=r695GHHBv/3+GRYVQDCSXry8KOvpxYTzGPi2EkseG+EhmPi8NgacUzJZoRl4jApFw9
         XVcRMhsXcJlbWnD7XGlHyohDQa9uOFDSPlUX8HeaTzo4kTn0c7i9lM/MSwh21mNoBxp8
         YQacqVFWtus7gw09x7Y7ujlFrpwqldNhAmJg7sQIvVSMs3gaHw8e7R9vCgK+rX0cwRCd
         yhSLQWVBuT8RNLudemjSOixEA3P88avFL+uNlWnjQ4uJX4XdsDAdspWSsmPoeIGF6uRC
         gB8c50rqbzYma7EewcXP5ze/Pl7qX1kx+NpKnGj7nhIIT79thPIHtIFHO209fCu/z0gH
         AtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nI/YcJWB6mwe6cqtpFafS5vBZiJQ4R+wqncTbSXKoeY=;
        b=jecwtRbmOmnjpWJNx05H9t/1h+tMNmj5NvkCYxV7M6SqMp2lAGMmydJIj33nvYFIoY
         h6IRF+7rKGxxMUnG01ar4dHP/mv1EH+CwRIzUUINWk0XV3BqEHyNToUg9I18dYrCcXHS
         QihbYhipZYpRS5EFwaV3wLU+V73OH1Xa0REHF+PsCIE4JhyHtR+axNNjepBLUGGEfDwk
         WyheCtJ2g/2ZU7Vq0ys/6XW4Gm51/9tjznX+j7eV00lJbH7t6MVMmL0D6N9qkmkT3f59
         lFyq5O6h6nT5OP8kQtwmsh9AcW37TmuVB61cJ2K+dWQpHO6ndrlHyKo7Q1EtANwcigZi
         dN3w==
X-Gm-Message-State: AOAM531/cYgJ6HTaPd1Tq3gAh8BbJvaU40i9Wi7D+i/928K0bVbMteSQ
        QkYVb0U4Hbdz+0fZje6t+1+UVXp1CQkZRDB8DzQ=
X-Google-Smtp-Source: ABdhPJyM6Xg3InUow+dQQ8JkjsM1fAt4JtKc1e5g9NlbFz1eLDBuyl4atyIfVpjC8/h2zbRHZLd0aWwN+6cSEdvExcM=
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr15106010pjb.129.1617381538180;
 Fri, 02 Apr 2021 09:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210402161751.7683-1-rdunlap@infradead.org>
In-Reply-To: <20210402161751.7683-1-rdunlap@infradead.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Apr 2021 19:38:41 +0300
Message-ID: <CAHp75VeARca4PzLkd+1SFr72AP=KWx3sAONPfwVSmHzjL9U+LA@mail.gmail.com>
Subject: Re: [PATCH -next v2] gpio: GPIO_SCH: depends on LPC_SCH
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Denis Turischev <denis@compulab.co.il>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 2, 2021 at 7:18 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Since LPC_SCH provides GPIO functionality, GPIO_SCH should depend on
> LPC_SCH to prevent kconfig warning and build errors:
>
> WARNING: unmet direct dependencies detected for LPC_SCH
>   Depends on [n]: HAS_IOMEM [=3Dy] && PCI [=3Dn]
>   Selected by [y]:
>   - GPIO_SCH [=3Dy] && GPIOLIB [=3Dy] && X86 [=3Dy] && (X86 [=3Dy] || COM=
PILE_TEST [=3Dn]) && ACPI [=3Dy]
>
> and
>
> ../drivers/mfd/lpc_sch.c:204:1: warning: data definition has no type or s=
torage class
>  module_pci_driver(lpc_sch_driver);
>  ^~~~~~~~~~~~~~~~~
> ../drivers/mfd/lpc_sch.c:204:1: error: type defaults to =E2=80=98int=E2=
=80=99 in declaration of =E2=80=98module_pci_driver=E2=80=99 [-Werror=3Dimp=
licit-int]
> ../drivers/mfd/lpc_sch.c:204:1: warning: parameter names (without types) =
in function declaration
> ../drivers/mfd/lpc_sch.c:197:26: warning: =E2=80=98lpc_sch_driver=E2=80=
=99 defined but not used [-Wunused-variable]
>  static struct pci_driver lpc_sch_driver =3D {
>                           ^~~~~~~~~~~~~~

Thanks!

Bart, please, take it in your tree directly, or if you wish I may
collect this one together with Hans' one and send a PR.

> Fixes: 6c46215d6b62 ("gpio: sch: Hook into ACPI GPE handler to catch GPIO=
 edge events")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Denis Turischev <denis@compulab.co.il>
> ---
> v2: change to "depends on LPC_SCH" as suggested by Andy
>
>  drivers/gpio/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20210401.orig/drivers/gpio/Kconfig
> +++ linux-next-20210401/drivers/gpio/Kconfig
> @@ -861,9 +861,9 @@ config GPIO_IT87
>  config GPIO_SCH
>         tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
>         depends on (X86 || COMPILE_TEST) && ACPI
> +       depends on LPC_SCH
>         select GPIOLIB_IRQCHIP
>         select MFD_CORE
> -       select LPC_SCH
>         help
>           Say yes here to support GPIO interface on Intel Poulsbo SCH,
>           Intel Tunnel Creek processor, Intel Centerton processor or



--=20
With Best Regards,
Andy Shevchenko
