Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F18A1161D2E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 23:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgBQWJp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 17:09:45 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:39013 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgBQWJp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 17:09:45 -0500
Received: by mail-io1-f67.google.com with SMTP id c16so20071739ioh.6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 14:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Omu0NuzaolVnSx+lzNIehq/LH4WJjwka83BM14aUe54=;
        b=iCVpOe7WsfoX/5+MZ7nl4keAYitzKy0yV7RlA0i4AO/J36knvEx8lMaYo/OXa8Rvjs
         xkuw887fAWD1+yXzmaB4+sdQS6RL5fCV/Ou+94O3RQyXjLfs+VHut1Tmwtdrl39nxck/
         gQbVWU5sKU+7RAc5i2by5TEL+kqzqnotCEm6f9XxghErud7lXxBHwxLsv1/v0DV6dfl3
         4RXZ4GCoQu/LBntfMP9WI6Eidd7SrBpppEcRp+Rl4AuU11PpY6aj94+NvMP/JTIkfA7H
         hJdefnIk7nGEo6HsNJdHMM7WK5nFz04oSHgqmCjfuHzop0id+dend0MtGyHtyAaLdYZy
         d9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Omu0NuzaolVnSx+lzNIehq/LH4WJjwka83BM14aUe54=;
        b=CSjO+H2YJXMLFmiL7w/oB2PrnxF6W2/8r5hv8buGrUNClipdViw+8cXB9WEVh9gN0F
         H2UEUuGSc+Me6IY8L14NVt7f6nyqdUOWzcqjAqq736mNnRhJl6r2IlKTMgD8ls/pT0dx
         +sMm3widZyz+EBc38uKAPa0aT7cyrrnFU2XlgUtDz1v4TXaxx50bSR/Gcx4gIWP0RjLB
         bbQs4ZgvnD1fHEPjGNc4xE7BWLzME/LxxLU/h2A0IFL1L2SsthQDNKHAr6TmJtD1axuf
         jIzBjNvlNxuT3BMWJ/67GRJavsiDULf3kuHCsIqKm/3duRehhvDm29b1upM51k9xOi5r
         Aoeg==
X-Gm-Message-State: APjAAAVEmYlJ1BoR6tZhH4A0VoWy38AE6BemlQfr9VK8V7zlTtRGh8pT
        oYGJ3ySYRYNigxNtJsybOiXCaluwqGmO5DWAyMfGtw==
X-Google-Smtp-Source: APXvYqzONE5LXJ9iPg+x6SUKk/LzrP5otAyAI4puc1UkiSI0bZWhfMMZy6M6j7oq6XHKO7wn2VIMiIcWLx/NtAUjdPw=
X-Received: by 2002:a5d:8952:: with SMTP id b18mr13653283iot.40.1581977383891;
 Mon, 17 Feb 2020 14:09:43 -0800 (PST)
MIME-Version: 1.0
References: <20200217195435.9309-1-brgl@bgdev.pl> <20200217195435.9309-7-brgl@bgdev.pl>
 <CAMuHMdWAxhUWPt06vcaHwD34=k=ihzVAxSTtFnO4r2bY7nAmjA@mail.gmail.com>
In-Reply-To: <CAMuHMdWAxhUWPt06vcaHwD34=k=ihzVAxSTtFnO4r2bY7nAmjA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 17 Feb 2020 23:09:33 +0100
Message-ID: <CAMRc=MdPhJqsqZUO59m+s2tfQxx+Q8w4fbNxgXReW4UEDVNV+w@mail.gmail.com>
Subject: Re: [PATCH 6/6] nvmem: increase the reference count of a gpio passed
 over config
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 17 lut 2020 o 22:13 Geert Uytterhoeven <geert@linux-m68k.org> napisa=
=C5=82(a):
>
> Hi Bartosz,
>
> On Mon, Feb 17, 2020 at 8:56 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > We can obtain the write-protect GPIO in nvmem_register() by requesting
> > it ourselves or by storing the gpio_desc passed in nvmem_config. In the
> > latter case we need to increase the reference count so that it gets
> > freed correctly.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Thanks for your patch!
>
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
> > @@ -349,11 +349,13 @@ struct nvmem_device *nvmem_register(const struct =
nvmem_config *config)
> >                 return ERR_PTR(rval);
> >         }
> >
> > -       if (config->wp_gpio)
> > +       if (config->wp_gpio) {
> >                 nvmem->wp_gpio =3D config->wp_gpio;
> > -       else
> > +               gpiod_ref(config->wp_gpio);
>
> If gpiod_ref() would return the passed GPIO, or an error code, you could =
write
>
>         nvmem->wp_gpio =3D gpiod_ref(config->wp_gpio);
>

Yes, makes perfect sense - v2 coming up tomorrow.

Bart
