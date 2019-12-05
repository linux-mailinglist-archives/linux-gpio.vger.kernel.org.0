Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6AB21141E5
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 14:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729473AbfLENrl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 08:47:41 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:45441 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729187AbfLENrl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 08:47:41 -0500
Received: by mail-io1-f68.google.com with SMTP id i11so3592377ioi.12
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2019 05:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F1r6bkuEgTVPA/sHRf3ZXJ9F5TKgMqD4MX5r/fBzobg=;
        b=ZIFFnJBqLN/6IdRGI1+Ng6EjWxgJf3yiAG6DhscHjReQD9TQQIXwNwSSFtRP9WbWNH
         a9538vG9HoGCIdi7owZ1/+7GuxawncmtBAB5kf3W4Znhs6gOJjBM36o4kj1DqU2GvLup
         tkShLaHnbrqfB5Yo8zyZS+F1OwBNhRt+N0wERiwDBkSTSEQUzDMrskKy+wlDWuRCqfHB
         TTctxqHrTTUh/2O5NQIS6zh6L2c0MKEsy7kJshChlQ1Jmg35IGZmOgCApEA3gJI1paiI
         aP8z8ZyM6F5aCw584lIP/Qr6fdNO2yd3K1I+sahsr9VtxLJMfPyg9RYyuctnwnlv6DSW
         W9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F1r6bkuEgTVPA/sHRf3ZXJ9F5TKgMqD4MX5r/fBzobg=;
        b=gG4zWkh3kac4pSX2H5BRKpnlqInftHDQAUqDfwwEdOk5dhuwjlQ85q8RLgommx2lLD
         ty2D/PtcW51MLPtudlS4yrlR4oApSJOjVm7RKna1njOuG+jmXmsrPyVijVyC+FQWHaA7
         0ks3JPubTbEA0bEr+S2nfrQXsbyEogOkiO0SnyF2la154XUyFHn3Z8xXBIplxd8K5dle
         i5v+mBJPDf3L0dg6tp7U2sAN3uEwMiuBzesU+4H8xVWWdMLJkYLW7bM38DsV87sYHMFt
         XjZTbZBp4E4UtosWyi+b0x9A1sqbIYELo8WrQsnX0gngTR37CJqdZtwuOyBm/RVMUCzn
         D4iQ==
X-Gm-Message-State: APjAAAVKiUq+gzG+IGhJ+FUaUN7+5a2cYXDGcy3Kzscg5puj1wKqz3EF
        ItuVW52bJW+qZ1yT16p1hq7uQ30ULrAKROW3ugxnsA==
X-Google-Smtp-Source: APXvYqyX2J+9mYLKnKDUFzFsIxp+qagIuJC+HCi1QrsAVJB60kZK6B/lWE85l8QMRomb26AbU0vc7CWrtBC2EmOL8p0=
X-Received: by 2002:a5e:9314:: with SMTP id k20mr1175995iom.6.1575553660941;
 Thu, 05 Dec 2019 05:47:40 -0800 (PST)
MIME-Version: 1.0
References: <20191204155941.17814-1-brgl@bgdev.pl> <CAHp75VdiAtHtdrUP2EmLULh86oO37ha8si10gFKYRavXCEwRRQ@mail.gmail.com>
 <CAMpxmJVXVVVMPA_hRbs3mUsFs=s_VtQK9SvvYK3Xc5X27NPTKw@mail.gmail.com> <CAHp75VfXc88Fa6=zs=9iToz27QdXHqRCDPQwBPs2P-rsBF8nHw@mail.gmail.com>
In-Reply-To: <CAHp75VfXc88Fa6=zs=9iToz27QdXHqRCDPQwBPs2P-rsBF8nHw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 Dec 2019 14:47:29 +0100
Message-ID: <CAMRc=Me4xWsQggmr=BvJrA9-FnPkxFkOYsRTsSXCtyNwFnsHNw@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 5 gru 2019 o 11:27 Andy Shevchenko <andy.shevchenko@gmail.com> napisa=
=C5=82(a):
>
> On Thu, Dec 5, 2019 at 11:42 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > =C5=9Br., 4 gru 2019 o 23:34 Andy Shevchenko <andy.shevchenko@gmail.com=
> napisa=C5=82(a):
> > > On Wed, Dec 4, 2019 at 6:03 PM Bartosz Golaszewski <brgl@bgdev.pl> wr=
ote:
>
> > > > +struct gpioline_info_changed {
> > > > +       __u64 timestamp;
> > > > +       __u32 event_type;
> > > > +       struct gpioline_info info;
> > > > +       __u32 padding[4]; /* for future use */
> > > > +};
> > >
> > > Has this been tested against 64-bit kernel / 32-bit userspace case?
> > >
> >
> > No. Since this is a new thing - do you think it's possible to simply
> > arrange the fields or add padding such that the problem doesn't even
> > appear in the first place?
>
> Yes. this can be done, though be careful about potential endianess
> issues (the ABI must be tested on BE as well).
>
> So, the test cases, I can imagine of, should include (k - kernel, u - use=
r):
> - 64k-64u: LE and BE
> - 64k-32u: LE and BE
> - 32k-32u: LE and BE

I usually use qemu VMs built with yocto for testing but I don't see
any way of creating a 32-bit user-space with 64-bit kernel. Any ideas
on how to prepare a testing environment?

Bart

>
> --
> With Best Regards,
> Andy Shevchenko
