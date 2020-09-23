Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9CD2757D0
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 14:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgIWMYQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 08:24:16 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:47485 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWMYQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 08:24:16 -0400
X-Greylist: delayed 305 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Sep 2020 08:24:15 EDT
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M42Ss-1kL3jp38CG-00073t; Wed, 23 Sep 2020 14:19:09 +0200
Received: by mail-qk1-f171.google.com with SMTP id 16so22527011qkf.4;
        Wed, 23 Sep 2020 05:19:09 -0700 (PDT)
X-Gm-Message-State: AOAM532lY0TkymKkkfGsxfS4qTG1PdcKRfkG5QkUgpBHUq8ChOlGlXLc
        B6vjfPxlRSuU7XoOGfGR3qS6XK4xTdmFQNL4MEA=
X-Google-Smtp-Source: ABdhPJxAoU+ktGhM6X5vHeBOmKMgXa8sAPdc3WEzRaTgogu5Y9l3wvDS7VbOFyv86fbAo5qaLdxZXiIMkcmj6HDMSaY=
X-Received: by 2002:a37:a483:: with SMTP id n125mr9513561qke.286.1600863548470;
 Wed, 23 Sep 2020 05:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-5-warthog618@gmail.com>
 <CAHp75VewJYDQ1Moi4jw=wbBMLNpaUGPgz+AsPjNdZqtHCgkjwA@mail.gmail.com>
 <20200923103031.GA579645@sol> <CAHp75VdQ4qWe-870QyH-E42=518vkbLSueQWQOs44M-qKudRsw@mail.gmail.com>
In-Reply-To: <CAHp75VdQ4qWe-870QyH-E42=518vkbLSueQWQOs44M-qKudRsw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 23 Sep 2020 14:18:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3AzqLfnT_SLXQMbzXAnGXtDnYFFxFry-_vRiYQyXjMXQ@mail.gmail.com>
Message-ID: <CAK8P3a3AzqLfnT_SLXQMbzXAnGXtDnYFFxFry-_vRiYQyXjMXQ@mail.gmail.com>
Subject: Re: [PATCH v9 04/20] gpio: uapi: define uAPI v2
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:KbD3LuXs/BYv76mIwRu51/92ImObZCetcHiM9pdlE77vH2rIxR6
 WqISgVkbB+YrZkdaXmVy04xPfz9w1LiUSwKRD+T7kCsa451KvM2gwqwYbfBArHkANwRD+BG
 Ea3QzX7o575LtWkIqDEEmXyv/INesS5WMV1UbKEJw4Fejo2SddChiV2ioOgwJkbvk2RPpbP
 89+9j945JabixBucHgOmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IZkeX9ch8WE=:Peyqy77kKsHCPlAiKC46MI
 tTCw2kHGwtgZNr01dU9UoMCK91pB4Fl9W9tGmlDXvved2CLRgdvas+JIP3RtXCXfCJ84OxRyu
 tmz9dIrr5Km+/nSFE8xN22uUFS2Wr9fTjJjA6gHCzRUAZLElPvC0ApmGdSUnSV4/AigCPo+cM
 mB7xegFEe0h9fywG3drIj5WZV9fZyf3+WeHJA88cm0GrMqK/db04S2FiQInWU+L/Ke5LW5g/o
 9VPXEPAkzcGElOjZMukjZjGWG1q/fnTK1hROHNLuN030+vekU/e6TDTLx00hY/taSIpeCkp+n
 ItpeiqH5w+C1M3HXtCmPPWQnZajcza2WOL1nB8943XObm5cqoe3XZYRhR9CL/2ffNiccsAH64
 myxZeOe7qV/PZAWcVyaKau2ekS3bTBxe6yY43FvcwKfJGmRydMZ46DdXAD+jpqLktU+McPL+v
 wCr11NHSUesNcs6NDp8myKN2mpOV6VpaiGRQ/+EDw2LOjO+Ztjom4SFa4B3GNpwU3USpvgG10
 SZxs7zjKZL7424wIAYOOjoMpw1D9riOcTyb/+bD0jWJAB0AG932NG5cun5+RQ7mk6E0uH24kl
 kea/ioD7Th2VYHAU3jZT7Gmd6alxMZVBJUpQgv2qhWMia6jSgpImbAQtNaJcDcUSY5JWaCfbW
 dbs1MszKtZxawGT9M7lc2CSHqzYOo3b+Ezwbos5U6Gqcim6Xrbz5ajt8BkpD8/k2WRBzhJcsy
 0oP9wRH/r8Kihiqcxvkn+NKlin5O0t/j3RroRp4QzI4Hu83B6FwLx/acTI/HFRnb0kyiZalhF
 /UYTDQyLXPIxYI7a8N/kXX7oWN6xAcAI77WkmJkZ/Oal8Ie2IwI/P6aj2OxD4hrhRNKZU/T
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 1:16 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Sep 23, 2020 at 1:30 PM Kent Gibson <warthog618@gmail.com> wrote:
> > On Wed, Sep 23, 2020 at 01:04:05PM +0300, Andy Shevchenko wrote:
> > > On Tue, Sep 22, 2020 at 5:34 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > There is also some minor renaming of fields for consistency compared to
> > > > their v1 counterparts, e.g. offset rather than lineoffset or line_offset,
> > > > and consumer rather than consumer_label.
> > > >
> > > > Additionally, v1 GPIOHANDLES_MAX becomes GPIO_V2_LINES_MAX in v2 for
> > > > clarity, and the gpiohandle_data __u8 array becomes a bitmap in
> > > > gpio_v2_line_values.
> > > >
> > > > The v2 uAPI is mostly a reorganisation and extension of v1, so userspace
> > > > code, particularly libgpiod, should readily port to it.
> > >
> > > ...
> > >
> > > > +struct gpio_v2_line_config {
> > > > +       __aligned_u64 flags;
> > > > +       __u32 num_attrs;
> > >
> > > > +       /* Pad to fill implicit padding and reserve space for future use. */
> > > > +       __u32 padding[5];
> > >
> > > Probably I somehow missed the answer, but why do we need 5 here and not 1?
> > >
> >
> > Sorry, I got tired of repeating myself, and just acked that we disagree
> > on the approach here.
> >
> > Your suggestion to use the size for version would result in an
> > explosion of ioctl signatures - every time we add a field we have to add
> > a new ioctl and handle it separately in gpio_ioctl() or linereq_ioctl().
>
> No, you just add
> __u32 version; // implies sizeof() check as well.
>
> Look for examples of existing ABIs (e.g. perf ABI).

Please don't ever add a version field to an ioctl structure, this
has been shown to cause more problems than it solves many
times in the past...

Having some reserved fields can be helpful, as long as the kernel
returns an error in case any of the unknown fields are nonzero.

I'd also prefer fewer than five reserved fields, but that is not as
important, just use as many as are likely to be used in the future,
but not more: It's easy to add one more ioctl command in case
the expectations are wrong, but I agree you wouldn't want a
new command every time another field gets added if the past
has shown that this happens a lot.

       Arnd
