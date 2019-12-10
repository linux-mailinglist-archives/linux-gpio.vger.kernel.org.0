Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A01D118300
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 10:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbfLJJGQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 04:06:16 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:40928 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfLJJGQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 04:06:16 -0500
Received: by mail-il1-f194.google.com with SMTP id b15so15447002ila.7
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2019 01:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r4IVzcFQr5f5jAVBJFbbNra/TEBcWfZTDHd8et1P0n4=;
        b=Quo4LcuZXB1U1RSq4R8uFAWyB0Pz0IdhPJy7q9s/dSuoe4oDneAcHShhPbc6D6CNDK
         HE55kFj5uuVwZSO7LHOiMYbAmzmh2NaqGArW0BLPDiLsxHOjSe/xxOfoDshkc0QUSnBT
         OIUIcN5U/0EVH62fkURqigFdS/FChO0uapmuh8j4WpvfAZNhewn99RhIIBwGym6Rqyn4
         TBVHb7VE9T2z6HaAmd5AXDWj8sTZTi9SPGtkb7V/cHEUE49BLCUfqsrrbfwmEGp+0irj
         b/I+x5lbohW5pGIwDgix9Rs7ALsjqIvs2XMDaFazt7Zj/iZOSOlb4Ze4vknKzIQYdei4
         x+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r4IVzcFQr5f5jAVBJFbbNra/TEBcWfZTDHd8et1P0n4=;
        b=D7dnoUtkal0YIodOuIEJe057iVt8i9qfUCxCFf2FGYMrf/U6Rsotl6HdYb4my854yU
         BkHmdqHWGPGOdBIzrsWsqK4Y2HOWDt56K5xp4wG7ZStZsVLiRUQ+Ntg0CktqDeo6SmfR
         Bw8FFYVBKCwwcEhuwBerMMn2S9v6yJSpE2ZWif+wOBrm971g0rbHi/G3ytApElW0KFg4
         ZrdV7pKKXgxXRNyDR8LO7oxB9rwsAZ23JEUMpGGNefOy+p8VTxxujZWkNwSiGqrhSZjw
         4tmp8TEu30Wbw3zYFET1hroFPb1hfvcw50BQ7MYeEd0Yf7ttFRhXfDjOq94OfKFRQahc
         6/yQ==
X-Gm-Message-State: APjAAAU9J81noMn260u5OJ6n5nQxHYSeLDo/6aP0w8coNjXFjYucKXRD
        Vi1sD5RVQES11VBC4oCPV9zZk0NyEveS08QQzD3vrA==
X-Google-Smtp-Source: APXvYqxh/PxjbUnbu9OvmZhTfzneGfe7J/9s5kFncHXaX0KXxvUTrPkAxtPC+4KEvpMMLbWANiGBbwWftc0HxXThQDA=
X-Received: by 2002:a92:aa46:: with SMTP id j67mr31502963ili.189.1575968775645;
 Tue, 10 Dec 2019 01:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Dec 2019 10:06:04 +0100
Message-ID: <CAMRc=Mc88eiLtu7_0y51nGDzM0nRmwaOurLx9isf=qRB0uj7KA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in compatible mode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 4 gru 2019 o 20:42 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> The introduced line even handling ABI in the commit
>
>   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
>
> missed the fact that 64-bit kernel may serve for 32-bit applications.
> In such case the very first check in the lineevent_read() will fail
> due to alignment differences.
>
> To workaround this we do several things here:
> - put warning comment to UAPI header near to the structure description
> - derive the size of the structure in the compatible mode from its member=
s
> - check for the size of this structure in the ->read() callback
> - return only one event in the compatible mode at a time
>
> Above mitigation will work at least with libgpiod which does one event
> at a time.
>
> Since the bug hasn't been reported earlier we assume that there is close
> to zero actual users of the compatible mode to monitor GPIO events and th=
us
> we might consider to rework this ABI in the future.
>

How come this only affects the read operation but not the structures
passed as arguments to ioctl() calls?

Bart

> Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c    | 51 ++++++++++++++++++++++++++++++++++++---
>  include/uapi/linux/gpio.h |  6 +++++
>  2 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 7340e4d0e873..134985210619 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -825,17 +825,26 @@ static __poll_t lineevent_poll(struct file *filep,
>         return events;
>  }
>
> -
>  static ssize_t lineevent_read(struct file *filep,
>                               char __user *buf,
>                               size_t count,
>                               loff_t *f_ps)
>  {
>         struct lineevent_state *le =3D filep->private_data;
> +       struct gpioevent_data event, *e =3D &event;
> +       /* We need size of each member to avoid endianess issues below */
> +       size_t ts_sz =3D sizeof(e->timestamp), id_sz =3D sizeof(e->id), e=
_sz;
>         unsigned int copied;
>         int ret;
>
> -       if (count < sizeof(struct gpioevent_data))
> +       /*
> +        * In compatible mode, when kernel is 64-bit and user space is 32=
-bit,
> +        * we may not tell what user wanted here when count is bigger tha=
n size
> +        * of one event, so, we just assume that user asks for precisely =
one
> +        * event.
> +        */
> +       e_sz =3D in_compat_syscall() ? ts_sz + id_sz : sizeof(*e);
> +       if (count < e_sz)
>                 return -EINVAL;
>
>         do {
> @@ -851,7 +860,43 @@ static ssize_t lineevent_read(struct file *filep,
>
>                 if (mutex_lock_interruptible(&le->read_lock))
>                         return -ERESTARTSYS;
> -               ret =3D kfifo_to_user(&le->events, buf, count, &copied);
> +               if (in_compat_syscall()) {
> +                       /*
> +                        * First we peek the one event and, if there is
> +                        * no error during copying to user space, skip it
> +                        * later.
> +                        */
> +                       if (kfifo_peek(&le->events, e))
> +                               copied =3D e_sz;
> +                       else
> +                               copied =3D 0;
> +
> +                       /* Do not try to copy garbage to the user */
> +                       ret =3D copied ? 0 : -EFAULT;
> +
> +                       /*
> +                        * Due to endianess concerns we have to copy this
> +                        * member-by-member. Luckily there are no members
> +                        * less than 32-bit.
> +                        */
> +                       if (!ret)
> +                               ret =3D copy_to_user(buf, &e->timestamp, =
ts_sz);
> +                       if (!ret)
> +                               ret =3D copy_to_user(buf + ts_sz, &e->id,=
 id_sz);
> +
> +                       if (ret) {
> +                               /*
> +                                * Either we have got nothing from the FI=
FO or
> +                                * one of copy_to_user() calls failed.
> +                                */
> +                               ret =3D -EFAULT;
> +                       } else {
> +                               /* Skip peeked event if no error happened=
 */
> +                               kfifo_skip(&le->events);
> +                       }
> +               } else {
> +                       ret =3D kfifo_to_user(&le->events, buf, count, &c=
opied);
> +               }
>                 mutex_unlock(&le->read_lock);
>
>                 if (ret)
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 799cf823d493..054756bf6991 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -168,6 +168,12 @@ struct gpioevent_request {
>   * struct gpioevent_data - The actual event being pushed to userspace
>   * @timestamp: best estimate of time of event occurrence, in nanoseconds
>   * @id: event identifier
> + *
> + * Warning! This structure has issues in the compatible mode, when
> + * kernel is 64-bit and user space is 32-bit, due to alignment
> + * differences.
> + *
> + * It's not recommended to retrieve more than one event at a time.
>   */
>  struct gpioevent_data {
>         __u64 timestamp;
> --
> 2.24.0
>
