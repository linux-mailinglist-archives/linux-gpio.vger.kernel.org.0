Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82D8275B51
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 17:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgIWPQS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 11:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbgIWPQF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 11:16:05 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9CBC0613D1;
        Wed, 23 Sep 2020 08:16:05 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id y1so14578561pgk.8;
        Wed, 23 Sep 2020 08:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8uuRcUi7VseW+fhB7FzElcAxAShcJ8N2cjEBJRFjPbw=;
        b=fpfBJA762JQYNWivINKT3tnO6pGNlJmq23wBnS3g23r+y3mgxlS71Bf6D7SdgdTUjj
         TdVme6YphMECmmBc1ZTFx5o4rtTvtpGf2jDarXRX308vBkWIcjUsOhfJ7L4j1JoDZZXk
         3ny2uUzBzeLsZmrez+/p85N0736V6+D0q9Jv7+EaV5JmVC6LZH4J1Q/7kpkVWXaIPjC7
         K0o/fH1eGeMazaiwX3c07PZtAUImsJWoO8MP46SUhUj79Uo0qIhkVAdNi4wFUrPB3ydd
         jhVAscg/ESiCg0hkQt6Tl/IFllHXNvA36+b8gooaZQ+oo5aJzAjxdN6x/2TAQkzf1dio
         QtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8uuRcUi7VseW+fhB7FzElcAxAShcJ8N2cjEBJRFjPbw=;
        b=Gqf4/CzhSMmvmjh/kn720jI09fGkd4BMrkGkvwbpQLAzHRwC9YIeltqzGHFZ/dWgwt
         up8RHelvVft2a4HPhZY33aXRLZRsYNxbC9qzk/LP11Xlokeg45SK6fqQA4QO75K1wx2A
         waGnVS24sP34N9I4zAlybXirvrXHpBeR3cRktFD2fH4EGU56rN7buPUcRHhZurJuvWrp
         spZcqhfl0MHfjeuIRlyhdUJcGmxI+Ktph5URPiCfESQhph8okVeWIFEasJLYVimoR+uZ
         /Xwz4+k6cq4GZEC483wMcUbAK2+TUv/ap8n9chPJy18cBKRu5uW3u4/9+bAVN3w0idrg
         5JlA==
X-Gm-Message-State: AOAM530s2Sf+mjwiMfDAJ+WB9jURfUkudDn5zL0VjfCWZHhqcc/YheJt
        /hGGIQzT8d1UYGWTON4Mz+1HhMy7/pCiaiFBhrwuzni2B7xA/Q==
X-Google-Smtp-Source: ABdhPJx4psZAkuVPizsjHh/Ik15YZEFkej/c2veMiQtFFfNvNwYs08a4CdtIvmU5SHmXFnx+KxWN1T0WVgrF9aK7TAg=
X-Received: by 2002:aa7:9201:0:b029:13e:d13d:a10c with SMTP id
 1-20020aa792010000b029013ed13da10cmr398622pfo.40.1600874164666; Wed, 23 Sep
 2020 08:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-5-warthog618@gmail.com>
 <CAHp75VewJYDQ1Moi4jw=wbBMLNpaUGPgz+AsPjNdZqtHCgkjwA@mail.gmail.com>
 <20200923103031.GA579645@sol> <CAHp75VdQ4qWe-870QyH-E42=518vkbLSueQWQOs44M-qKudRsw@mail.gmail.com>
 <CAK8P3a3AzqLfnT_SLXQMbzXAnGXtDnYFFxFry-_vRiYQyXjMXQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3AzqLfnT_SLXQMbzXAnGXtDnYFFxFry-_vRiYQyXjMXQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Sep 2020 18:15:46 +0300
Message-ID: <CAHp75Vf-Naww6pv4h+dzPwqbVs+sv1ObggVGspKMVVR0oDNGRA@mail.gmail.com>
Subject: Re: [PATCH v9 04/20] gpio: uapi: define uAPI v2
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 3:19 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Sep 23, 2020 at 1:16 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Sep 23, 2020 at 1:30 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > On Wed, Sep 23, 2020 at 01:04:05PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Sep 22, 2020 at 5:34 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > There is also some minor renaming of fields for consistency compared to
> > > > > their v1 counterparts, e.g. offset rather than lineoffset or line_offset,
> > > > > and consumer rather than consumer_label.
> > > > >
> > > > > Additionally, v1 GPIOHANDLES_MAX becomes GPIO_V2_LINES_MAX in v2 for
> > > > > clarity, and the gpiohandle_data __u8 array becomes a bitmap in
> > > > > gpio_v2_line_values.
> > > > >
> > > > > The v2 uAPI is mostly a reorganisation and extension of v1, so userspace
> > > > > code, particularly libgpiod, should readily port to it.
> > > >
> > > > ...
> > > >
> > > > > +struct gpio_v2_line_config {
> > > > > +       __aligned_u64 flags;
> > > > > +       __u32 num_attrs;
> > > >
> > > > > +       /* Pad to fill implicit padding and reserve space for future use. */
> > > > > +       __u32 padding[5];
> > > >
> > > > Probably I somehow missed the answer, but why do we need 5 here and not 1?
> > > >
> > >
> > > Sorry, I got tired of repeating myself, and just acked that we disagree
> > > on the approach here.
> > >
> > > Your suggestion to use the size for version would result in an
> > > explosion of ioctl signatures - every time we add a field we have to add
> > > a new ioctl and handle it separately in gpio_ioctl() or linereq_ioctl().
> >
> > No, you just add
> > __u32 version; // implies sizeof() check as well.
> >
> > Look for examples of existing ABIs (e.g. perf ABI).
>
> Please don't ever add a version field to an ioctl structure, this
> has been shown to cause more problems than it solves many
> times in the past...

> Having some reserved fields can be helpful, as long as the kernel
> returns an error in case any of the unknown fields are nonzero.
>
> I'd also prefer fewer than five reserved fields, but that is not as
> important, just use as many as are likely to be used in the future,
> but not more: It's easy to add one more ioctl command in case
> the expectations are wrong, but I agree you wouldn't want a
> new command every time another field gets added if the past
> has shown that this happens a lot.

Thanks for caution and explanation. Let's go then with this.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


-- 
With Best Regards,
Andy Shevchenko
