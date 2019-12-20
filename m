Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4967312816F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2019 18:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbfLTR3R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Dec 2019 12:29:17 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36407 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727394AbfLTR3R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2019 12:29:17 -0500
Received: by mail-qt1-f193.google.com with SMTP id q20so8844965qtp.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2019 09:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NvaP12stWHwbnnpA0grDoLpklRVhy2RqwgLcEKcFbXU=;
        b=U/B1Za8EZ5MDW/sPPEaa7S5ULPHLaQoiFAeVPwfRrbvwq7HI3v8by7uDez1XEbcVPe
         s62kal4+gzaM1MaB3NWiLeAP3vjc5q+bkb3gl2+XIplVMXxRX2AbQBBQiokjY4ovR5N+
         3ELAP0QnVlBPpVRqVbg92dNNND9bZCche77UbL7OM4yxeRz3hTSLd8nxz4VvWeeOjiPd
         Mfn8vSGKzXnMG5urxkIZlABZNGdJwbwi7rvHmnlkjdtmZBzGc8wRh3ymnXyn32wHxk0i
         whGVHynNSWJB3mnqMsDkDZiZAe3U9gh+etslnO2FK/Y8n4FuJRx/jrVRK31K6zf4JDhT
         Uh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NvaP12stWHwbnnpA0grDoLpklRVhy2RqwgLcEKcFbXU=;
        b=rN8nuQf7Azw7HBpKlvAPB8BfncL8xJ2djKwLaYFIW+6GTSFr5Ibj1kAo3SdiiRgwUh
         4AZ5xjTta/5edhUwDTyqkfgmSy7LQALxhlZff4jX4+Ka1nMyq1IxUO3ipon9/dXSA2w1
         lCWwXTAiy7kGyUeyK9wUh2hcLakwYYTp0VPv5xi7XbvLXRga/Q2Ah/DE8zM/9ftFI1LS
         vSKU4YFoPB6zbNC5gMtIIynXklnkVEuWwn5+rbdHs1F41ruxbaMdOX1chGgua3YkVq5h
         OF56J9A3tBr7kZc8UMQ1JNgsymfxbupE1ssF/zeP9FLwKSELXW1AIxs8EU5uamRKd1He
         NoLA==
X-Gm-Message-State: APjAAAWXJcTwYRRX/+GWgWkfAyQblWQPazSVBUw+r1Yk/gtzLbMdj0qx
        kizsyqytjeXYXegojCfR1gnvKYjANjx2cYJOfDPUTA==
X-Google-Smtp-Source: APXvYqxQmApYGNweLQL9Z4X5O38OuyshbAqiO67ggasEhsZP56VRMfctD1Gd7A7RC8/3U+Xym3cyC3lEj6OzgQePbeQ=
X-Received: by 2002:ac8:3703:: with SMTP id o3mr12503169qtb.208.1576862956229;
 Fri, 20 Dec 2019 09:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20191219171528.6348-1-brgl@bgdev.pl> <20191219171528.6348-13-brgl@bgdev.pl>
 <CAHp75VeMEngXiFmvTrsW7UZMz0ppR-W-J4D1xU+qKGfLXkG3kg@mail.gmail.com>
 <CAMpxmJV4UU21x8rfNMaJ6G2OiRa3qC2vYQWH4C_T+nS4b_NcUw@mail.gmail.com> <20191220121543.GY32742@smile.fi.intel.com>
In-Reply-To: <20191220121543.GY32742@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 20 Dec 2019 18:29:05 +0100
Message-ID: <CAMpxmJWPmhqadKcd6b62fScAs5N1TRtoXBq+5MPtC0Q=-p3ALg@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 20 gru 2019 o 13:15 Andy Shevchenko <andy.shevchenko@gmail.com> napisa=
=C5=82(a):
>
> On Fri, Dec 20, 2019 at 12:25:59PM +0100, Bartosz Golaszewski wrote:
> > czw., 19 gru 2019 o 19:17 Andy Shevchenko <andy.shevchenko@gmail.com>
> > napisa=C5=82(a):
> > > On Thu, Dec 19, 2019 at 7:17 PM Bartosz Golaszewski <brgl@bgdev.pl> w=
rote:
>
> ...
>
> > > > +/**
> > > > + * struct gpioline_info_changed - Information about a change in st=
atus
> > > > + * of a GPIO line
> > > > + * @info: updated line information
> > > > + * @timestamp: estimate of time of status change occurrence, in na=
noseconds
> > > > + * and GPIOLINE_CHANGED_CONFIG
> > > > + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGE=
D_RELEASED
> > > > + */
> > > > +struct gpioline_info_changed {
> > >
> > > > +       struct gpioline_info info;
> > >
> > > Is this guaranteed to be always 8 byte aligned?
> > > I'm expecting to see some comments there and / or here about it.
> > >
> >
> > struct gpioline_info alone is 32-bit aligned but its size is 72 bytes
> > which works for 64-bit alignment. This new structure's biggest element
> > in 64-bit, so it's 64-bit aligned on 64-bit arch. We have 72 bytes of
> > gpioline_info, 8 bytes of timestamp, 32 bytes of event type and 5 * 32
> > bytes of padding. Should be fine, but I'll add comments to the header.
>
> Yes, what I meant is to add comment at least to struct gpioline_info defi=
nition
> that if somebody would like to change it there (which also might be a
> problematic here, if there is no versioning scheme / length member).
>
> > > > +       __u64 timestamp;
> > > > +       __u32 event_type;
> > > > +       __u32 padding[5]; /* for future use */
> > > > +};
>
> Offtopic a bit, had you had a chance to look at Buildroot and our scripts
> I shared?
>

Not yet, I'll do that over the weekend.

Bart
