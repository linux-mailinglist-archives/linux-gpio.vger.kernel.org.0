Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD7C3126342
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 14:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfLSNR2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 08:17:28 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:42860 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfLSNR1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 08:17:27 -0500
Received: by mail-io1-f66.google.com with SMTP id n11so4158278iom.9
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 05:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jw4pmutuy+Vq97iclaQ8+r0oYbBvDyG4Nv1qzyzsrWU=;
        b=LFUH1vdr/zB8R4iQUX1VdCJ5DJbOKe7GdTOH3PkFeydwmE7naIinE52ec+tOae3k/x
         kSQS/nO31+WMKhPzYbamyaOj0rObU6yFQ7ODCYON+v2cBs5M0vgSeL3NFDTgmoZS660p
         UXyaIiQkMBm6ssxqh9nlTRlHsu4WQwZHPQK11HTs5GxXnFZofQcFBQLpZpSi6uyqamu/
         DZtEFUYLWUbb1RCtYp0ZG9XbbY+m4H5Rs/BMfCWQoKOdH7ZBGMhpaSbJzWJW2rOp3lE8
         3cyR6LWuVLfGIfEnXWYG0dLqFHSo79RbSftItp1+9DGtTXVoeQgp9W5xjlqaoKOd650E
         WVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jw4pmutuy+Vq97iclaQ8+r0oYbBvDyG4Nv1qzyzsrWU=;
        b=F7Hakwl5OJC74iTbVJ8E7nmbRKwxf6OaXHrnl4VecxWtf+DR9XTA6/71xu1Y6moNXQ
         g1ULGtCktSlweGA4n3Xt4J06/wNuCxGKlTM7Ygfrjf6MgmTG9/hBF7yn1iwsbfBN0L1d
         DJLr0c6S6pWXsktSqEGy5DWtoMj52OwrPeZ1crF7i5mwqCvlPnbxQNCwvhDk6DNIz2W3
         Nf1FleCxu96r8R0kNlhMrNaWOp/anlbZaE6j0WBJwVFXFoEOp0Unp89r+l57BmEh19jZ
         rhbKBQDb9fvmk7moiHvGxCLlg19m1VHwU50MVJfzdoJsErdZOT5s+db5TN+/ueWQLCYG
         Z9SQ==
X-Gm-Message-State: APjAAAVhTa/alLlMfjRMbC1CavWXpv1FKhkQSxV19N7GkyMc8Yk56Kty
        zE87bete7A4v3XBvnOpqZCEFsn5Gj5cuo78CkP3ixQ==
X-Google-Smtp-Source: APXvYqwvNyyAhHwXAbfyd3QPNsoCzCD1REk3C8Va6CVWCncIMlprP/hrEm3OHy84MRRJ8VpUBzSY/wXGzh0D6GLiUfY=
X-Received: by 2002:a02:c85b:: with SMTP id r27mr6964167jao.57.1576761446932;
 Thu, 19 Dec 2019 05:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20191204155941.17814-1-brgl@bgdev.pl> <CAHp75VdiAtHtdrUP2EmLULh86oO37ha8si10gFKYRavXCEwRRQ@mail.gmail.com>
 <CAMpxmJVXVVVMPA_hRbs3mUsFs=s_VtQK9SvvYK3Xc5X27NPTKw@mail.gmail.com>
 <CAHp75VfXc88Fa6=zs=9iToz27QdXHqRCDPQwBPs2P-rsBF8nHw@mail.gmail.com>
 <CAMRc=Me4xWsQggmr=BvJrA9-FnPkxFkOYsRTsSXCtyNwFnsHNw@mail.gmail.com>
 <CAHp75VfzP8-0wKmPTTKYe+fc6=r_4sVcJPyOsM8YTuH=i4rxmA@mail.gmail.com>
 <CAMRc=MfxteQDmeZn_Et0uFs2cPvLGpJ5BTeBOn37o=2Oo_eU=Q@mail.gmail.com>
 <CAHp75VfeEB5RudwMaoiMTMMY3zW-kz-h=rJ3Cu5_tyRL6ZuF1w@mail.gmail.com>
 <CAMRc=Mcy=Q+9Eb6mb5JEq+CCbxgBY1CfTDsYj1Rt9bcLXgeY=g@mail.gmail.com> <20191219131249.GA12008@firefly>
In-Reply-To: <20191219131249.GA12008@firefly>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 19 Dec 2019 14:17:16 +0100
Message-ID: <CAMRc=MfS49ENPS=ousx0EY-_-HM7QGtevknb9PBkewcbk7YJ4Q@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 19 gru 2019 o 14:13 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> On Thu, Dec 19, 2019 at 02:05:19PM +0100, Bartosz Golaszewski wrote:
> > wt., 10 gru 2019 o 18:00 Andy Shevchenko <andy.shevchenko@gmail.com> na=
pisa=C5=82(a):
> > >
> > > > On a different note: why would endianness be an issue here? 32-bit
> > > > variables with 64-bit alignment should still be in the same place i=
n
> > > > memory, right?
> > >
> > > With explicit padding, yes.
> > >
> > > > Any reason not to use __packed for this structure and not deal with
> > > > this whole compat mess?
> > >
> > > Have been suggested that explicit padding is better approach.
> > > (See my answer to Kent)
> > >
> > > > I also noticed that my change will only allow user-space to read on=
e
> > > > event at a time which seems to be a regression with regard to the
> > > > current implementation. I probably need to address this too.
> > >
> > > Yes, but we have to have ABI v2 in place.
> >
> > Hi Andy,
> >
> > I was playing with some ideas for the new ABI and noticed that on
> > 64-bit architecture the size of struct gpiochip_info is reported to be
> > 68 bytes, not 72 as I would expect. Is implicit alignment padding not
> > applied to a struct if there's a non-64bit-aligned 32-bit field at the
> > end of it? Is there something I'm missing here?
> >
>
> Struct alignment is based on the size of the largest element.
> The largest element of struct gpiopchip_info is a __u32, so the struct
> gets 32-bit alignment, even on 64-bit.
>
> The structs with the problems all contain a __u64, and so get padded out
> to a 64-bit boundary.
>

Thanks for the clarification, now it makes sense. I assumed memory
alignment depends on the architecture. I need to educate myself more
on this subject I guess.

Bart
