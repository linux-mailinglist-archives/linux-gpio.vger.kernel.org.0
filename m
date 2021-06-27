Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3E43B52EC
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 12:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbhF0K6x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 06:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhF0K6x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 06:58:53 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79396C061574;
        Sun, 27 Jun 2021 03:56:28 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id x12so8272426vsp.4;
        Sun, 27 Jun 2021 03:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kLTwelHcXBJw8i+63n2Vewy+RJJirrdy+PrskcqPqcs=;
        b=XgOTGXF1fwhkgJohN8gb5ThJ9aYZFVVG4V7G/W+CdVurrRa98CYshGXEnh3rhRGoWw
         qC3ClikQkr2/YQWvBJKLdHZeK2qJjsKQgwXBJ1KEEtnftNnOwmIHPsqMD/MXbnPbbZES
         souwmswV2i9epMJiRWy5vfrBZKQn4sPXUE9tuOoivBRlQ2geEbiSamjSY8f9dEmNWKux
         StTIcIwSD4T6COqSEsIwm4z+skAdiXDaG8GW2rYt9R1//me0R6SbFTmw+AAnWHXU4iFC
         TyBcG5M15FNmtSRWYVYAU0HZQFudht7ehHLlAeuts3tzBe+6J8zvLAr+IRUaUhj2+39A
         B19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kLTwelHcXBJw8i+63n2Vewy+RJJirrdy+PrskcqPqcs=;
        b=O1s9L7/Op2+Ie+ShSZQ/8FYHYVWAnTK8UCOUtdQn+SM2TEWZX0BZFxRiZHYnzF7Ovl
         ROl5VBSrXkqCVlcqHOty4fytx6CHXpw2GDvcyG62AyuLXoHgtYWHJVaB9f6Gr0gFazQO
         kzsyUQE/wawo3gxzPnvjuWppCIEtZvuHtmyAqrSX9irlOkjZUHXtFsXq5SOkXXMtGI8r
         n4BodG/E6h9OGTX48lgDu3mUdOCJ5MWBzYAJXMlrr1gIIjtRTKOjN6r5UHNf/2pUmoQ7
         5xAaaI97BNg4KnqWVrh8B0nV09t3jX14MFDmsWKiodf2k5ZVP9jN3WrTK9fxU/6/5i3t
         2GmQ==
X-Gm-Message-State: AOAM533erNmGo/7Tq96mRyl74kn4byYuvcfAib4Bd788YUwO30+lhRXA
        UOH7ItWPsand+2M9OthBpZx3pXRLERvzdDzhMu0=
X-Google-Smtp-Source: ABdhPJzS7MsJrsOx8daq2JPR6u43D5Eth53kIY9wqlHvdk57uQP3KQk3GjJ0NczCeJMNSBCgxgFVS0MXwplX30PhEeM=
X-Received: by 2002:a05:6102:90f:: with SMTP id x15mr14453075vsh.28.1624791387598;
 Sun, 27 Jun 2021 03:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
 <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
 <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com> <CAHp75VeN+vww=Bj=g-nx9AT0FKSGAZ8CKQZn=ff2kfQWM+dxdw@mail.gmail.com>
In-Reply-To: <CAHp75VeN+vww=Bj=g-nx9AT0FKSGAZ8CKQZn=ff2kfQWM+dxdw@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sun, 27 Jun 2021 12:56:15 +0200
Message-ID: <CAMhs-H-WwCfPDspgxzN=W8QouZ7WPAeyJDYf_6=YezyCkTM=Vw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NeilBrown <neil@brown.name>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 27, 2021 at 12:51 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Jun 27, 2021 at 12:47 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> > On Sun, Jun 27, 2021 at 11:33 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Sat, Jun 26, 2021 at 7:18 PM Sergio Paracuellos
> > > <sergio.paracuellos@gmail.com> wrote:
> > > >
> > > > The default handling of the gpio-line-names property by the
> > > > gpiolib-of implementation does not work with the multiple
> > > > gpiochip banks per device structure used by the gpio-mt7621
> > > > driver.
> > > >
> > > > This commit adds driver level support for the device tree
> > > > property so that GPIO lines can be assigned friendly names.
>
> > > > This driver has three gpiochips with 32 gpios each. Core implementation
> > >
> > > implementation
> > >
> > >
> > > > got gpio's repeated along each gpio chip if chip.names is not assigned.
> > > > To avoid this behaviour driver will set this names as empty or
> > >
> > > the driver
> > > these names
> > >
> > > > with desired friendly line names. Consider the following sample with
> > > > minimal entries for the first chip with this patch changes applied:
> > >
> > > The same comment as per v1:
> > >
> > > Any idea why it's not a duplicate of
> > > https://elixir.bootlin.com/linux/v5.13-rc7/C/ident/devprop_gpiochip_set_names,
> > > and why the latter is not called in your case?
> >
> > The core properly calls this function but not in the way expected.
> > This driver implements three banks of 32 gpios each internally using
> > one gpiochip per bank, all of them in the same device. So the core
> > code you are pointing out here duplicates the same names along the
> > three gpiochips which is not the expected behaviour. So implementing
> > in this way and setting names at least reserved avoids the core code
> > to be run and also avoids the duplication getting expected behaviour
> > for all the banks and each line friendly name.
>
> Isn't it the problem of how we supply fwnode in that case?
> Another possibility is to fix DT (although I'm not sure it's now possible).

Since the fwnode is the same for all banks of the same device, each bank
repeats the first MTK_BANK_WIDTH label names in each bank.

This commit populates the gc.names member of each bank from the
device-tree node within the driver. This overrides the default behavior
since devprop_gpiochip_set_names() will only be called if names is NULL.

Best regards,
    Sergio Paracuellos

>
> Have you considered the above?
>
> --
> With Best Regards,
> Andy Shevchenko
