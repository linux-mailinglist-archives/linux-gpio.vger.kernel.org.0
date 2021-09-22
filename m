Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D934149E0
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 14:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhIVM7A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 08:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbhIVM67 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 08:58:59 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C35C061574;
        Wed, 22 Sep 2021 05:57:29 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id ee50so9360393edb.13;
        Wed, 22 Sep 2021 05:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IYMQ9ACrEdRDsP2K3+6jWRI3Aj2dDIsmUqKI8f05xR8=;
        b=B94zVtSl/4XPrmp+3vx398rxdnqQD93JAYM4ExI0UFq5/39S492j+WAAgEjjL7+gJ6
         65lITQ7hTdaTT3WdpE0fNoaKQM0Z+KH5wcRwa38R6IN6pxVlF5+usI9Ogkg9Xh1Xz+9F
         rIdJ20hbMhORDoE+USy7dFVp/pJjVTrx0U2FpMv4Jgiw5eCx3ZaCamdj3WLhT2w41kZd
         vvXD18EpkK9TFaaie6g1R4XuTJKBwTRkY379jXBewGuCuNgbhkRRD8ja3/js9MDjGQCv
         CvG9ZEPf1EjZ4tDqJbs1VNE9RhMZXEHwnqXvE0HTHD3yvpGBtOO2BwfbCCvnyZc/tVPW
         nWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IYMQ9ACrEdRDsP2K3+6jWRI3Aj2dDIsmUqKI8f05xR8=;
        b=KGP3fDoHZ0HHC7yqHMzxhitxUjbQ7ZvKLpV7TqcX3ujYbMeRAjJ9HL90QlrDVE221n
         wnnPiW+MKfkLVI1w0rRg3Gi4W/mxTh1M/ugJjoqLSf/lqp1aI75MjNGESzHJWBt2aqCM
         Fr2Tz3xodcC7lo4yTeaQypgPTNUF3ymSRgwPEUzpMh2XU1dgiTlExeyt+gcUVHYC8c7e
         VKQu8PaHd+rb3sDzREpE3DON4XikmYMax6syMOxsCa/KTYs5ngDkjsyYAeW8liuxn7wT
         On1dhmB/H1xeMzKlL+XxLU8n2NkZf5nQR8/RA2rIrMDrDUzifuT3SaPo2xOD5WfkiGcY
         dXQA==
X-Gm-Message-State: AOAM532Xde+ntzPTGIEK6vXouvn25JNp1ZgmAwNZYbwmsnomv1p9YooN
        GDaCkuxcjwd+2TPWMMyXxdE08ha04+j+vW4m5zs=
X-Google-Smtp-Source: ABdhPJxGl8p6R2D/QhplhuwCR3GnVZLv/adsUEK33kvmOajwVnZPjv3UmTMwMbgMY0JVIztDkgEKOltkik5fa223DCk=
X-Received: by 2002:a05:6402:358a:: with SMTP id y10mr41135079edc.238.1632315448101;
 Wed, 22 Sep 2021 05:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210717045627.1739959-1-daniel@0x0f.com> <CACRpkdbE+_DJFhBCmtz5JwJupf7QkkWZhXrgf1KG_3rPqvEm0w@mail.gmail.com>
 <CAFr9PXmFHanrx4Frg3hQwo-RbAY-UXxC=FOAj++cshSHa99z3g@mail.gmail.com>
 <CAMpxmJUoG7qPhy2CxapCn1M=w_AssOQsEmyvXO18OpedM6hBjw@mail.gmail.com>
 <CAHp75VdU52rwKY3AA0Nxt3VGOFr71XtjCDqZbSxR4GNczSqihQ@mail.gmail.com> <CAMpxmJUSvBSa=T1a1Bq_YhAGib9BcXf4xYMSOfyprHbG0t_QWw@mail.gmail.com>
In-Reply-To: <CAMpxmJUSvBSa=T1a1Bq_YhAGib9BcXf4xYMSOfyprHbG0t_QWw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Sep 2021 15:56:50 +0300
Message-ID: <CAHp75Vct29uVYYTVVpuNbpEwZRsGJ+BBMNWBQbLDaof5o2neGg@mail.gmail.com>
Subject: Re: [PATCH 00/10] gpio: msc313: Add gpio support for ssd20xd
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Romain Perier <romain.perier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 3:50 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Wed, Sep 22, 2021 at 12:52 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Sep 22, 2021 at 1:21 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > > On Wed, Aug 25, 2021 at 1:50 PM Daniel Palmer <daniel@0x0f.com> wrote:

...

> > > I only have a part of this series in my inbox and patchwork doesn't
> > > have it at all - can you resend it with me in Cc?
> >
> > Have you tried to use the `b4` tool? It is capable of getting
> > everything from the lore archive.
>
> I haven't tried it because I have never heard of it. :) Thanks for the heads-up.

You're welcome!

> At the same time - is it too much to ask of people to just use
> scripts/get_maintainer.pl? It's so much easier to just actually get
> the patches in my inbox than to have to look for them manually.

Of course not. I completely agree with you on the point.
Btw, I advertise a script I wrote [1] exactly due to misses of this in the past.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh


--
With Best Regards,
Andy Shevchenko
