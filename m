Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78DD7134895
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 17:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgAHQzv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 11:55:51 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:36521 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729015AbgAHQzv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 11:55:51 -0500
Received: by mail-il1-f194.google.com with SMTP id b15so3236642iln.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jan 2020 08:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1otWToj29hMezV4JMaks8PqTBWepruh9XfV6M8TCvsU=;
        b=nCfrnqH2TuHcWKw+gqbTFlRBtsM+1gJEXink7mJuJk0nmvtdrlFU+U/tbWkZz5lvA4
         dh07Owg6buNjoKYNVnWOh06dY6tSCJ4FFXsMQS5xM9fY2YoZ2K8d4h0vrrk0rcKiCjDg
         /zt7j1NoX9mNE6LKBm9rZQ0cWua+UdPI9ESaC/HRaqDM0l6Oc7Jd7kZNsC2BTgIRDFI4
         iA+z4DrmdMyAUoIUh+NMcZ7KO4KtcZOSpubVyY/xr4AyYShePoXKrSYY/MMd1F7z27bq
         Le9Q386olO/iPiTVvMnoWZWycMdtNI3ctdhfn+o2XKbjArzyeUB3Ou9iSd1gYdLdJO2v
         M4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1otWToj29hMezV4JMaks8PqTBWepruh9XfV6M8TCvsU=;
        b=NXgcKsb5E1zKiLXYXxSy3E5O8GkPpVMYmNGCHRpV/scbxDjrP7QncV9SvIG2I/VuOS
         3n5MNdziTGqAj8kmvvj7LZ7fNW51m1qxGPIsO+g4wJuY//9cXtJr6+k7lDUcTJQHRTtH
         YFNE9rK2fG3M8DUOhCBEN+C6wrH6izfRN0+Bs6yirPBHzAmAacdG7bwOwHsxvdWIRP7J
         FBAshV1prBVGXtQY1887fPH0sKF1IE5wYV+95Y1z6hrh6NAHOZuwzmjl+pve5BLj1Opc
         L7e9ZdQtQyVnCwq5MxHYreI9owb2mK2ytu2xN95/rpGBwIiAbSY+jQIiP//vPuagTlTL
         8swg==
X-Gm-Message-State: APjAAAVUJpVbp2Wf9t+QQmD+TZB8Lpz/ehOBr4F7GOws47sWeP7ZDC1Z
        gyvJWHde3f5dRjIjCBKRxWADCeD827ng1NtDmD0Kdg==
X-Google-Smtp-Source: APXvYqwXzt3Dr3coz5H6HOpE5yRjd+aaGYWdxOg2BItU2UZbx7shuxzvTAuTgRpxCkvnNo27mF+acMycT/1lh7iRvtU=
X-Received: by 2002:a92:8712:: with SMTP id m18mr4760361ild.40.1578502550789;
 Wed, 08 Jan 2020 08:55:50 -0800 (PST)
MIME-Version: 1.0
References: <20191224120709.18247-1-brgl@bgdev.pl> <20191224120709.18247-13-brgl@bgdev.pl>
 <20200108124650.GR32742@smile.fi.intel.com>
In-Reply-To: <20200108124650.GR32742@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Jan 2020 17:55:39 +0100
Message-ID: <CAMRc=McbH7be7Y1SDO3UtSSOgYiDnHde1Au2yhsJxMcviDiJGQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 8 sty 2020 o 13:46 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Tue, Dec 24, 2019 at 01:07:08PM +0100, Bartosz Golaszewski wrote:
> ...
>
> > -     } else if (cmd =3D=3D GPIO_GET_LINEINFO_IOCTL) {
> > +     } else if (cmd =3D=3D GPIO_GET_LINEINFO_IOCTL ||
> > +                cmd =3D=3D GPIO_GET_LINEINFO_WATCH_IOCTL) {
>
> What about to split the functionality to something like lineinfo_get() an=
d...
>
> >               struct gpioline_info lineinfo;
>
> > -             struct gpio_desc *desc;
>
> Hmm... Is it correct patch for this change?

Yes, because instead of declaring *desc in every branch, we declare it
once and use it twice.

>
> >
> >               if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
> >                       return -EFAULT;
> > @@ -1246,11 +1260,25 @@ static long gpio_ioctl(struct file *filp, unsig=
ned int cmd, unsigned long arg)
> >
> >               if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
> >                       return -EFAULT;
> > +
> > +             if (cmd =3D=3D GPIO_GET_LINEINFO_WATCH_IOCTL)
> > +                     set_bit(desc_to_gpio(desc), priv->watched_lines);
> > +
>
> ...simple use
>
>         } else if (cmd =3D=3D GPIO_GET_LINEINFO_IOCTL) {
>                 return lineinfo_get();
>         } else if {cmd =3D=3D GPIO_GET_LINEINFO_WATCH_IOCTL) {
>                 ret =3D lineinfo_get()
>                 set_bit();
>                 return ret;
>         }
>
> ?

You still need to retrieve *desc outside of lineinfo_get(). I think
it's not worth the hassle.

Bart
