Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFD56114F8C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 11:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfLFK6L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 05:58:11 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33223 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbfLFK6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 05:58:11 -0500
Received: by mail-ot1-f67.google.com with SMTP id d17so5481112otc.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2019 02:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qCi2H+WKDY8CpUES0eafB7Bjt16Obq+xFoaUbyeG2tI=;
        b=YMUyW4OP2Mzp7p/jSw15XROQP60Gtejx+87UuaS6gK4VP4/X+cKeA2/Ld4iqEELLtH
         3EXa3c69ItFrF1QfFl10S7QoBIXArmJRiAf/sVD46rTtgcsuEQS2jg2w86owmt6jxqfz
         4a2n1i2XoUpjXneQ7LwUIjasdC3xY0L3lys3OOnz5F9KOfX9+dw5ntHg+Cy/i9J99qBh
         6C8B3C/DJnEGDAWAMXw0FnZaAK47iis3uO5IkX32R+HJT9VrFPUOoKQBcnzE2tnUx7Pc
         f5vu6x44dmbuRxG9h4z+Rbe8gF8MU0xE7Gs0vuLXhHe8MoDIZjAKssNHrjjHKBVwVJBm
         J+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qCi2H+WKDY8CpUES0eafB7Bjt16Obq+xFoaUbyeG2tI=;
        b=EJc7GsHDvx0d3D28Fd6sd21jUPYP96zLeuoexD5GyLCkVNAVCds5o2qdHFqRCoBe/J
         W3LABgUDGwtxTo4vZBCsMGtB7gQnlndD449SdCIAQCyBg07eOryRtYEW6mZPqK880m8j
         pQRA5bcM3z7a7b3GKoasknDK/NFsNEyQxnm9Gpvl0LJ3vHec40kauoUiFTLCxmDU1Cq/
         EAH6rwJ47EW4eV5YiC+SNejN6mZo9N7KoWzRWbBnsfskZMLr1fiCVyJV81FDvxZnrSsN
         /XuO+zla36T6LzBCQFsxJ6u5QcTfuYr43307/rW7r7fFBcguGoHAe9MWVBWrKtNzDZ1f
         6+OQ==
X-Gm-Message-State: APjAAAVvBkV+OV+3idUW8hmfBSdROs0vmScgxKV8rprtJLYO/4IxTe4c
        7roEW5lXvPGb8ZhIPlzi9cZqiKCskLe7O/KnYVKFfA==
X-Google-Smtp-Source: APXvYqzne3yNFjyZezK2n1tOFmb24uakUDsW4lpoAZPculCQRP6hLswEd04wjQ6l1Dl2bJNWpig/TCG3xZytFIWA7dA=
X-Received: by 2002:a9d:32e5:: with SMTP id u92mr10789455otb.85.1575629889955;
 Fri, 06 Dec 2019 02:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 6 Dec 2019 11:57:59 +0100
Message-ID: <CAMpxmJVH9fzheXhPYgKzPWgGYb=V_oO7haYJTSBTv4YeaxN-Yw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in compatible mode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
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

Linus,

please don't apply the patches from this series - I will incorporate
them into my LINEINFO_WATCH ioctl() series.

Best regards,
Bartosz Golaszewski
