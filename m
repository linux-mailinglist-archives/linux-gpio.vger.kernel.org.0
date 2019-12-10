Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 078CA118E6A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 18:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfLJRAS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 12:00:18 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44365 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbfLJRAS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 12:00:18 -0500
Received: by mail-pf1-f196.google.com with SMTP id d199so126321pfd.11;
        Tue, 10 Dec 2019 09:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZFKlWQYzATIj8BUwTv8rG3mbBwuIfmhDJIot2BqPZBw=;
        b=tzeiMfMMzLH4G4Ap/oa2Ea27HLwraGIdNxL6U+vejLGkcyin0eaWiweRVL1/Oytyfw
         Ztzj+1RRSaUkBKWlkBoQ7J9qidN5NtBEckDjvUQK2RIOJQ+zHJ+XrSK9QYAgkNz7+k0k
         fVNIuPhzJXEnB8PKWy3MzQsonzEaQexJs77zKm0fdB3co85hK8z7xh+rSeztHugP5qoC
         LnK9McCQl1xr4VZfo/LJjpTqCikujJ5Y/xHXUERGjzMGkRt9fpmkLKN8UbGjFXcV9gRM
         KKMWhnm6wWg2QApf1B5dU0gb5XlgAOXPzmmFTTXHtLhzDKvmWIdPBpjThSPSDiADqzct
         tfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZFKlWQYzATIj8BUwTv8rG3mbBwuIfmhDJIot2BqPZBw=;
        b=XOHTgTAXM9LzKNuta9cteVifgx+hyrPbj36ylVyGH+gv1BnFtw+0rJmMOujMADO+Ju
         hgoW8jecCIIXRy9eNraXo7yN9kv5gsy9XO3cKZ5wEmqOmX9Opf74wMlUn4UG0LGQD3w+
         wcL9bAee6BSOlFQ7L8NY2glQCRd8Zf7XYCWsti34Y0JxjM9WtYC+K21Ivt0YcZeQWCWK
         8JkrCUG3PTrcZI9nJZsGxI56XaQzEySXj6/owMucqLq3S/ImK6XQULl/hUMF0yOequq1
         VZHpIcFPAbM+iBMKghZ9FIWzyVFiJcGT95ldzsxWvJN136wtPh5ab5WmPDTPl6GYO6De
         gaKg==
X-Gm-Message-State: APjAAAUS7kbOTHfj94CE6E0ShtZDmcvkfZ97cuNTCYpobmXwWWSY5ZFb
        4mgKa7E/Kl/x48uT3n1zgQ+AHGPQ7NEFJ2sSfo0=
X-Google-Smtp-Source: APXvYqyd/Hvkckh0c67pIQztaOGqa5DW2Lfrnf4rSZ7pSN0uX/cvp07YTV8RaV+HElWvtt0zxikvoRVXK9ZJMLlxkx4=
X-Received: by 2002:a62:7590:: with SMTP id q138mr35346746pfc.241.1575997217452;
 Tue, 10 Dec 2019 09:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20191204155941.17814-1-brgl@bgdev.pl> <CAHp75VdiAtHtdrUP2EmLULh86oO37ha8si10gFKYRavXCEwRRQ@mail.gmail.com>
 <CAMpxmJVXVVVMPA_hRbs3mUsFs=s_VtQK9SvvYK3Xc5X27NPTKw@mail.gmail.com>
 <CAHp75VfXc88Fa6=zs=9iToz27QdXHqRCDPQwBPs2P-rsBF8nHw@mail.gmail.com>
 <CAMRc=Me4xWsQggmr=BvJrA9-FnPkxFkOYsRTsSXCtyNwFnsHNw@mail.gmail.com>
 <CAHp75VfzP8-0wKmPTTKYe+fc6=r_4sVcJPyOsM8YTuH=i4rxmA@mail.gmail.com> <CAMRc=MfxteQDmeZn_Et0uFs2cPvLGpJ5BTeBOn37o=2Oo_eU=Q@mail.gmail.com>
In-Reply-To: <CAMRc=MfxteQDmeZn_Et0uFs2cPvLGpJ5BTeBOn37o=2Oo_eU=Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Dec 2019 19:00:07 +0200
Message-ID: <CAHp75VfeEB5RudwMaoiMTMMY3zW-kz-h=rJ3Cu5_tyRL6ZuF1w@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Bartosz Golaszewski <brgl@bgdev.pl>
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

On Fri, Dec 6, 2019 at 11:20 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> czw., 5 gru 2019 o 18:02 Andy Shevchenko <andy.shevchenko@gmail.com> napi=
sa=C5=82(a):
> > On Thu, Dec 5, 2019 at 3:47 PM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> > > czw., 5 gru 2019 o 11:27 Andy Shevchenko <andy.shevchenko@gmail.com> =
napisa=C5=82(a):
> > > > On Thu, Dec 5, 2019 at 11:42 AM Bartosz Golaszewski
> > > > <bgolaszewski@baylibre.com> wrote:
> > > > > =C5=9Br., 4 gru 2019 o 23:34 Andy Shevchenko <andy.shevchenko@gma=
il.com> napisa=C5=82(a):
> > > > > > On Wed, Dec 4, 2019 at 6:03 PM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > > > So, the test cases, I can imagine of, should include (k - kernel, u=
 - user):
> > > > - 64k-64u: LE and BE
> > > > - 64k-32u: LE and BE
> > > > - 32k-32u: LE and BE
> > >
> > > I usually use qemu VMs built with yocto for testing but I don't see
> > > any way of creating a 32-bit user-space with 64-bit kernel. Any ideas
> > > on how to prepare a testing environment?
> >
> > In my case it's very easy. I do
> > - compile kernel as 64-bit separately;
> > - compile initramfs of Buildroot distro with external kernel build prov=
ided.
> >
>
> Any specific config options are needed on x86-64 kernel to use 32-bit
> user-space? I'm not well versed in x86 architectures, that's why I'm
> asking. I built a 32-bit userspace qemu image with yocto and then
> manually built a 64-bit kernel. I tried running it but I'm getting a
> kernel panic when the rootfs is being mounted.

Just published set of scripts [1] we are using internally for our developme=
nt.
Find README.coreteam in the source root and read how to use that.

> On a different note: why would endianness be an issue here? 32-bit
> variables with 64-bit alignment should still be in the same place in
> memory, right?

With explicit padding, yes.

> Any reason not to use __packed for this structure and not deal with
> this whole compat mess?

Have been suggested that explicit padding is better approach.
(See my answer to Kent)

> I also noticed that my change will only allow user-space to read one
> event at a time which seems to be a regression with regard to the
> current implementation. I probably need to address this too.

Yes, but we have to have ABI v2 in place.

[1]: https://github.com/andy-shev/buildroot/tree/intel

--=20
With Best Regards,
Andy Shevchenko
