Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDDD3AADC5
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 09:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhFQHj4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 03:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhFQHjz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 03:39:55 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C02CC061574
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jun 2021 00:37:48 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id nb6so8114976ejc.10
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jun 2021 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s7+p5mopcGPNeOpZtCt9thAeymr13+2bHjNv9xZ1nl8=;
        b=niYhYVfl46lvmqWIoCx871hzP9WrXbrxylSJ60+8RRaDkzZSQJn5A/UKdFSewsdYXd
         EN57hvkzdPYRg1VTDE94kRapKL9ee+2Th8XdiCgRjSuexDV3uiFyBjPvTElyCOxCt6SP
         LPRhijHzHTE7vuTYNXqhGOyM24QKdxQsWu9uzRexHprydb/jPOcEl8XaxUraEfJ9QYhP
         OBhD2BiKjlyJ1BE3qFHji1zc5yz0nmg3zHGXoj8ltHPnFpv4TjK+6rOpveO5FNf3i0eP
         r+ZbgC2Oj0f1BG7VE96JXSE/e7E9XbojIUMaO0pJ9/ccucZd5Gm7j+Ggnm7hAJqxvrco
         jZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s7+p5mopcGPNeOpZtCt9thAeymr13+2bHjNv9xZ1nl8=;
        b=LKHDbiwgBVDzTHTpY4w2S3pKDvhOc7/Xcfbyi3PuOa6ODXbz3fb1uC9/dV5RqbFsZT
         IdlhqlLw/QdFpk1J0pxS09AN44XZllmSJ+9DfY2CJ1eoxHSsR0n/gbVQOKq39MtA+YMn
         OQDTWEY7wQCYDroua/YiGccQrU3vXYMJa96hUsLEpM7/yC0jWSvzzsp2m79FGkjmu+4E
         fDnAC+LDr3h+IqiSGJsw8nCrDRXXtTvxSQT6fjED4PxDSo0Yc+Eh2WqwPzXj2cldF/fS
         S7a2C+tDD5DmI9NgVyxvyRAICaINTxcv/ZqM3XR0Nc0oJridggIvqnx2u9ovG2W4pwcf
         zkPw==
X-Gm-Message-State: AOAM532vwIM7i77OjF7NiojJxgBXbavj0rqvPFirEjXygxTOJGDcOHZJ
        ic98JIHT46FtD8DwnbA81QxSVfhq4vY7M6USdAp+hYcsh6Q=
X-Google-Smtp-Source: ABdhPJwUwVdSjxIyBbGgOX1LCI1VYjG+HDD21nIGmKO0SUzLBS1j92JXDVJhkQfHRmQhMTNvLzqN+Caq5MSIIVxy9ng=
X-Received: by 2002:a17:907:2648:: with SMTP id ar8mr3676065ejc.521.1623915466668;
 Thu, 17 Jun 2021 00:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210613220326.831040-1-pbrobinson@gmail.com> <CAHp75Vc91=PSj+4F652Wo4iEHsek_NuLGuQmyovWtQ1UMO2xeA@mail.gmail.com>
 <CAMpxmJWt0N_O+P=NrX2-GMtGmaLU6kz3W+JHJo2U+UTmEhcycw@mail.gmail.com>
In-Reply-To: <CAMpxmJWt0N_O+P=NrX2-GMtGmaLU6kz3W+JHJo2U+UTmEhcycw@mail.gmail.com>
From:   Peter Robinson <pbrobinson@gmail.com>
Date:   Thu, 17 Jun 2021 08:37:35 +0100
Message-ID: <CALeDE9PAUiQWBz=A-i=vyLqtGT2Kk3V6xY7NG1zHfM1=kvBWtA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add support for the On Semi pca9655
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 16, 2021 at 8:28 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Mon, Jun 14, 2021 at 10:10 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Jun 14, 2021 at 1:05 AM Peter Robinson <pbrobinson@gmail.com> wrote:
> > >
> > > The On Semi pca9655 is a 16 bit variant of the On Semi pca9654 GPIO
> > > expander, with 16 GPIOs and interrupt functionality.
> >
> > I don't remember the context...
> >
> > >         { .compatible = "onnn,cat9554", .data = OF_953X( 8, PCA_INT), },
> > >         { .compatible = "onnn,pca9654", .data = OF_953X( 8, PCA_INT), },
> > > +       { .compatible = "onnn,pca9655", .data = OF_953X( 16, PCA_INT), },
> >
> > ...but the first space (before 16) seems not necessary and the idea as
> > far as I can see from here is to have those columns to be indented
> > nicely.
> >
> > >         { .compatible = "exar,xra1202", .data = OF_953X( 8, 0), },
> > >         { }
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
>
> I applied the patch and fixed the indentation problem in my tree. Thanks!

Awesome, thanks!
