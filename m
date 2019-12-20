Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27B501279E6
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2019 12:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfLTL0L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Dec 2019 06:26:11 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:42820 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbfLTL0L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2019 06:26:11 -0500
Received: by mail-qk1-f196.google.com with SMTP id z14so6072185qkg.9
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2019 03:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k8kYT/giIfGkzEyDaTLw5uWSWD/PKdfRcdySeHBbOIc=;
        b=0X653SLfZNSEO/Z0hHuv1zWsbliVSJtZtWdOa+Ry7XnYv7DIc2ZmpunTfkv0OUH1tN
         7PGiHeNQqkzBha5MSgH9+CocziAqShdM8hEUIDqvaN9dqUOl+qV4DxxXxNkEYsmPVWFf
         pXyj5qP6i1t2JDQkRKPevT76mlTYWmF5vRd7mTPMnbqLHA2umw+jO1kyk4Ti5LeFdx90
         Bz/AV+xllb4m7jIefbgvzcCRg6EDthPUsYP6j/9+qWD2MwYKi0wScSRVKBwSbM0sMsEY
         GWRklvcHAFfZ9BuIMEHGxBvut6Yb3XiX2eMnyYIgqr7+qsURt8NEkRaRzEIVY053unM/
         5J+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k8kYT/giIfGkzEyDaTLw5uWSWD/PKdfRcdySeHBbOIc=;
        b=aG1EXp/OBOhy8VnskEM/i9kIEB+MDoADKRzukz1kzrIeFsJ3ThDW5VtxOBtw9zTdHD
         CgmizYdfsKOY+Uo8Nfuxu7UPzvsgNj8Zj4DnIqLAWPLCRaNO0oFGX+oY7W94RzyRhNQi
         jwlDxkfOCvwMdaop7mtS64QmzLRH5XcoeQ4q8/SYeK/BLSUN+wDmX2fU+skBg4/yyRdp
         gRIp9FGdAjdzBGmK2GqZmcDp99YwV0QMWk5OaHR2uV8NJTC3QkP8/nhx859FaiYqJ4K0
         yfv9ubQnEXvkftuNbusqvZnZePKl8rBlidMnfJFSubRN3vxiz5tUrP3ANGDHQGtKddbR
         7X0g==
X-Gm-Message-State: APjAAAWBzDtHRgiM1NaxlCqcV7ZvCfXSeBmEZAjZ2wyTXs/K0Bpph/83
        RvW5Gobu/Dm21+1efpdCnpUpM9onXS+KnR0GC2WWzg==
X-Google-Smtp-Source: APXvYqzhcyZgFVFv3H+mbO4rYzV1eboUn9h9EbLhQ6JMtk0i27uNsQVjcs0Y65TTI4yoGipZQRB7jphk4bVR2sC+gkM=
X-Received: by 2002:a37:744:: with SMTP id 65mr12553936qkh.323.1576841170045;
 Fri, 20 Dec 2019 03:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20191219171528.6348-1-brgl@bgdev.pl> <20191219171528.6348-13-brgl@bgdev.pl>
 <CAHp75VeMEngXiFmvTrsW7UZMz0ppR-W-J4D1xU+qKGfLXkG3kg@mail.gmail.com>
In-Reply-To: <CAHp75VeMEngXiFmvTrsW7UZMz0ppR-W-J4D1xU+qKGfLXkG3kg@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 20 Dec 2019 12:25:59 +0100
Message-ID: <CAMpxmJV4UU21x8rfNMaJ6G2OiRa3qC2vYQWH4C_T+nS4b_NcUw@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 19 gru 2019 o 19:17 Andy Shevchenko <andy.shevchenko@gmail.com>
napisa=C5=82(a):
>
> On Thu, Dec 19, 2019 at 7:17 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Currently there is no way for user-space to be informed about changes
> > in status of GPIO lines e.g. when someone else requests the line or its
> > config changes. We can only periodically re-read the line-info. This
> > is fine for simple one-off user-space tools, but any daemon that provid=
es
> > a centralized access to GPIO chips would benefit hugely from an event
> > driven line info synchronization.
> >
> > This patch adds a new ioctl() that allows user-space processes to reuse
> > the file descriptor associated with the character device for watching
> > any changes in line properties. Every such event contains the updated
> > line information.
> >
> > Currently the events are generated on three types of status changes: wh=
en
> > a line is requested, when it's released and when its config is changed.
> > The first two are self-explanatory. For the third one: this will only
> > happen when another user-space process calls the new SET_CONFIG ioctl()
> > as any changes that can happen from within the kernel (i.e.
> > set_transitory() or set_debounce()) are of no interest to user-space.
>
> > -       } else if (cmd =3D=3D GPIO_GET_LINEINFO_IOCTL) {
> > +       } else if (cmd =3D=3D GPIO_GET_LINEINFO_IOCTL ||
> > +                  cmd =3D=3D GPIO_GET_LINEINFO_WATCH_IOCTL) {
>
> Wouldn't be better for maintenance to have them separated from the day 1?
>

Sure. Will fix in v4.

> ...
>
> > +       if (test_bit(desc_to_gpio(desc), priv->watched_lines)) {
>
> if (!test_bit(...))
>   return NOTIFY_DONE;
>
> ?
>
> > +                       pr_debug_ratelimited(
> > +                               "%s: lineinfo event FIFO is full - even=
t dropped\n",
>
> > +                               __func__);
>
> This is in 99.9% cases redundant in *_dbg() calls.
>
> > +               ret =3D NOTIFY_OK;
> > +       }
> > +
> > +       return ret;
>
> return NOTIFY_OK;

Yeah, makes sense.

> ?
>
> > +}
>
> ...
>
> > @@ -3111,6 +3285,7 @@ static int gpio_set_bias(struct gpio_chip *chip, =
struct gpio_desc *desc)
> >                 if (ret !=3D -ENOTSUPP)
> >                         return ret;
> >         }
> > +
> >         return 0;
> >  }
> >
>
> This hunk doesn't belong to this patch.
>

Ha! Of course it doesn't. :)

> ...
>
> > +/**
> > + * struct gpioline_info_changed - Information about a change in status
> > + * of a GPIO line
> > + * @info: updated line information
> > + * @timestamp: estimate of time of status change occurrence, in nanose=
conds
> > + * and GPIOLINE_CHANGED_CONFIG
> > + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RE=
LEASED
> > + */
> > +struct gpioline_info_changed {
>
> > +       struct gpioline_info info;
>
> Is this guaranteed to be always 8 byte aligned?
> I'm expecting to see some comments there and / or here about it.
>

struct gpioline_info alone is 32-bit aligned but its size is 72 bytes
which works for 64-bit alignment. This new structure's biggest element
in 64-bit, so it's 64-bit aligned on 64-bit arch. We have 72 bytes of
gpioline_info, 8 bytes of timestamp, 32 bytes of event type and 5 * 32
bytes of padding. Should be fine, but I'll add comments to the header.

Bart

> > +       __u64 timestamp;
> > +       __u32 event_type;
> > +       __u32 padding[5]; /* for future use */
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
