Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41DAA10B2B3
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 16:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfK0Pu6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 10:50:58 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:36515 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfK0Pu5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 10:50:57 -0500
Received: by mail-io1-f68.google.com with SMTP id s3so25418524ioe.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 07:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h5gValmc4D2Or92V7Nq+oH7EcejFT62EqNujH8T+di8=;
        b=OrlK64CsRuAQS/M7zlsB6j/WFCb2dRJjwrmGjjj7h5Zn+RAIgCP7GrqNVu8cxZu343
         yrMGLh4ca/OHA+/KQ8BBmxAVcVn8j2Votm61br6BqdFZwuWkZnFEuG63/dRdE/JJJabv
         0egLq2SdJgwOoSV07Uycws2rodbXQPNzYqCF+UeW9NqjvXzt7IZldWGEBbKtqqT34/98
         w/1yotFfPl17TQkM7wgGMK7WVXtShAVKbqULjYyXfpFq11n/9QFMw3V+HAdBxaLsIXkh
         AcPH61KxtYzwLU2nbXYcyGRQLK6isjH1tku1lwupRMLaEZSpQb5/HolWeJDAPwGyi0As
         hyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h5gValmc4D2Or92V7Nq+oH7EcejFT62EqNujH8T+di8=;
        b=fV+8s0cr1ZbrFefDsLF8RxSi8gk6ut89xx4lmF4OuZzftjXFS8uYvzxbdpvmGhAr99
         pHWgwUEV6Kq94E9yWT91zTA9NT2o7Zy42iG0OiBZjJMZke1t37BJUOdxhBNqSaB/Wcpj
         EIs4SXu+YZqADE/R2c8GLqYWdsi8H8az6tRqIcgUZXDiqHDJqNnHGw+j2axD3jQ1gC30
         GaswaeGnNp6zlZv+oZ8iq0dVRb1FosLSb1M+vgK2I8yExLPwKGsO6vBjO/GIUxJEYEG2
         OVyo5AdoQkFezhLnar2EjO3ZLzNmBYqyzwCRbsn3kRY7OMwMaNiLIBhM3ubKm3zrOJ/M
         Tk3A==
X-Gm-Message-State: APjAAAUd/+21TmJtf7uIiIKU3q1VgGRqrsn9tHMr7NknYcivNCVagjb8
        DiykoTO0B5mbNQA8CzSoUx41zwJLN5vp7/U/nvEI2Q==
X-Google-Smtp-Source: APXvYqxlElh7NfR2zzjIZcgEL5sjIQhTz+KMIcAE83vSnXhWgYdi85b09jq3Y9e1c76qQZeJzUjieyIzGy+8wHIn3zg=
X-Received: by 2002:a5d:8b83:: with SMTP id p3mr35571854iol.189.1574869854248;
 Wed, 27 Nov 2019 07:50:54 -0800 (PST)
MIME-Version: 1.0
References: <20191127133510.10614-1-brgl@bgdev.pl> <20191127133510.10614-8-brgl@bgdev.pl>
 <20191127152410.GA24936@sol>
In-Reply-To: <20191127152410.GA24936@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 Nov 2019 16:50:43 +0100
Message-ID: <CAMRc=MdLnZFJQ+qMJSiSQSh6pOnKpLeU79u9ymA7HaujgK0kcg@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpiolib: add new ioctl() for monitoring changes in
 line info
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 27 lis 2019 o 16:24 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Wed, Nov 27, 2019 at 02:35:09PM +0100, Bartosz Golaszewski wrote:
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
> > This patch adds a new ioctl() that allows user-space processes to retri=
eve
> > a file-descriptor for given GPIO lines which can be polled for line sta=
tus
> > change events.
> >
> > Currently the events are generated on three types of status changes: wh=
en
> > a line is requested, when it's released and when its config is changed.
> > The first two are self-explanatory. For the third one: this will only
> > happen when another user-space process calls the new SET_CONFIG ioctl()
> > as any changes that can happen from within the kernel (i.e.
> > set_transitory() or set_debounce()) are of no interest to user-space.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  drivers/gpio/gpiolib.c    | 218 ++++++++++++++++++++++++++++++++++++++
> >  drivers/gpio/gpiolib.h    |   1 +
> >  include/uapi/linux/gpio.h |  36 +++++++
> >  3 files changed, 255 insertions(+)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index d094b1be334d..be5df4bdf44b 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -547,6 +547,9 @@ static long linehandle_set_config(struct linehandle=
_state *lh,
> >                       if (ret)
> >                               return ret;
> >               }
> > +
> > +             atomic_notifier_call_chain(&desc->gdev->notifier,
> > +                                        GPIOLINE_CHANGED_CONFIG, desc)=
;
> >       }
> >       return 0;
> >  }
> > @@ -1148,6 +1151,212 @@ static int lineevent_create(struct gpio_device =
*gdev, void __user *ip)
> >       return ret;
> >  }
> >
> > +struct linechanged_fd_state {
> > +     struct gpio_device *gdev;
> > +     struct gpio_desc *descs[GPIOHANDLES_MAX];
> > +     size_t numdescs;
> > +     wait_queue_head_t waitqueue;
> > +     DECLARE_KFIFO(events, struct gpioline_changed, 16);
> > +     struct mutex lock;
> > +     struct notifier_block changed_nb;
> > +};
> > +
> > +static int linechanged_fd_release(struct inode *inode, struct file *fi=
lep)
> > +{
> > +     struct linechanged_fd_state *lc_state =3D filep->private_data;
> > +
> > +     atomic_notifier_chain_unregister(&lc_state->gdev->notifier,
> > +                                      &lc_state->changed_nb);
> > +     put_device(&lc_state->gdev->dev);
> > +     kfree(lc_state);
> > +
> > +     return 0;
> > +}
> > +
> > +static __poll_t linechanged_fd_poll(struct file *filep,
> > +                                 struct poll_table_struct *pollt)
> > +{
> > +     struct linechanged_fd_state *lc_state =3D filep->private_data;
> > +     __poll_t events =3D 0;
> > +
> > +     poll_wait(filep, &lc_state->waitqueue, pollt);
> > +
> > +     mutex_lock(&lc_state->lock);
> > +     if (!kfifo_is_empty(&lc_state->events))
> > +             events =3D EPOLLIN | EPOLLRDNORM;
> > +     mutex_unlock(&lc_state->lock);
> > +
> > +     return events;
> > +}
> > +
> > +static ssize_t linechanged_fd_read(struct file *filep, char __user *bu=
f,
> > +                                size_t count, loff_t *off)
> > +{
> > +     struct linechanged_fd_state *lc_state =3D filep->private_data;
> > +     unsigned int copied;
> > +     int ret;
> > +
> > +     if (count < sizeof(struct gpioline_changed))
> > +             return -EINVAL;
> > +
> > +     do {
> > +             mutex_lock(&lc_state->lock);
> > +             if (kfifo_is_empty(&lc_state->events)) {
> > +                     mutex_unlock(&lc_state->lock);
> > +                     if (filep->f_flags & O_NONBLOCK)
> > +                             return -EAGAIN;
> > +
> > +                     ret =3D wait_event_interruptible(lc_state->waitqu=
eue,
> > +                                     !kfifo_is_empty(&lc_state->events=
));
> > +                     if (ret)
> > +                             return ret;
> > +             } else {
> > +                     mutex_unlock(&lc_state->lock);
> > +             }
> > +
> > +             if (mutex_lock_interruptible(&lc_state->lock))
> > +                     return -ERESTARTSYS;
> > +
> > +             ret =3D kfifo_to_user(&lc_state->events, buf, count, &cop=
ied);
> > +             mutex_unlock(&lc_state->lock);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             if (copied =3D=3D 0 && (filep->f_flags & O_NONBLOCK))
> > +                     return -EAGAIN;
> > +     } while (copied =3D=3D 0);
> > +
> > +     return copied;
> > +}
> > +
> > +static const struct file_operations linechanged_fd_fileops =3D {
> > +     .release =3D linechanged_fd_release,
> > +     .owner =3D THIS_MODULE,
> > +     .llseek =3D noop_llseek,
> > +     .poll =3D linechanged_fd_poll,
> > +     .read =3D linechanged_fd_read,
> > +};
> > +
> > +static struct linechanged_fd_state *
> > +to_linechanged_fd_state(struct notifier_block *nb)
> > +{
> > +     return container_of(nb, struct linechanged_fd_state, changed_nb);
> > +}
> > +
> > +static int linechanged_fd_notify(struct notifier_block *nb,
> > +                              unsigned long action, void *data)
> > +{
> > +     struct linechanged_fd_state *lc_state =3D to_linechanged_fd_state=
(nb);
> > +     struct gpio_desc *desc =3D data;
> > +     struct gpioline_changed chg;
> > +     int i, ret;
> > +
> > +     for (i =3D 0; i < lc_state->numdescs; i++) {
> > +             /* Are we watching this desc? */
> > +             if (desc =3D=3D lc_state->descs[i]) {
> > +                     /* Yes - prepare the event. */
> > +                     memset(&chg, 0, sizeof(chg));
> > +                     chg.line_offset =3D gpio_chip_hwgpio(desc);
> > +                     chg.event_type =3D action;
> > +
> > +                     mutex_lock(&lc_state->lock);
> > +                     ret =3D kfifo_put(&lc_state->events, chg);
> > +                     mutex_unlock(&lc_state->lock);
> > +                     if (ret)
> > +                             wake_up_poll(&lc_state->waitqueue, EPOLLI=
N);
> > +
> > +                     return NOTIFY_OK;
> > +             }
> > +     }
> > +
> > +     return NOTIFY_DONE;
> > +}
> > +
> > +static int linechanged_fd_create(struct gpio_device *gdev, void __user=
 *ip)
> > +{
> > +     struct gpioline_changed_fd_request changed_req;
> > +     struct linechanged_fd_state *lc_state;
> > +     struct gpio_desc *desc;
> > +     struct file *file;
> > +     int ret, i, fd;
> > +     u32 offset;
> > +
> > +     ret =3D copy_from_user(&changed_req, ip, sizeof(changed_req));
> > +     if (ret)
> > +             return -EFAULT;
> > +
> > +     if ((changed_req.num_lines =3D=3D 0) ||
> > +         (changed_req.num_lines > GPIOHANDLES_MAX))
> > +             return -EINVAL;
> > +
> > +     lc_state =3D kzalloc(sizeof(*lc_state), GFP_KERNEL);
> > +     if (!lc_state)
> > +             return -ENOMEM;
> > +
> > +     lc_state->gdev =3D gdev;
> > +     get_device(&gdev->dev);
> > +
> > +     for (i =3D 0; i < changed_req.num_lines; i++) {
> > +             offset =3D changed_req.lineoffsets[i];
> > +             desc =3D gpiochip_get_desc(gdev->chip, offset);
> > +             if (IS_ERR(desc)) {
> > +                     ret =3D PTR_ERR(desc);
> > +                     goto out_free_lc_state;
> > +             }
> > +
> > +             lc_state->descs[i] =3D desc;
> > +     }
> > +
> > +     lc_state->numdescs =3D changed_req.num_lines;
> > +
> > +     init_waitqueue_head(&lc_state->waitqueue);
> > +     INIT_KFIFO(lc_state->events);
> > +     mutex_init(&lc_state->lock);
> > +
> > +     lc_state->changed_nb.notifier_call =3D linechanged_fd_notify;
> > +
> > +     ret =3D atomic_notifier_chain_register(&gdev->notifier,
> > +                                          &lc_state->changed_nb);
> > +     if (ret)
> > +             goto out_free_lc_state;
> > +
> > +     fd =3D get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> > +     if (fd < 0) {
> > +             ret =3D fd;
> > +             goto out_unregister_notifier;
> > +     }
> > +
> > +     file =3D anon_inode_getfile("gpio-line-changed-fd",
> > +                               &linechanged_fd_fileops,
> > +                               lc_state, O_RDONLY | O_CLOEXEC);
> > +     if (IS_ERR(file)) {
> > +             ret =3D PTR_ERR(file);
> > +             goto out_put_unused_fd;
> > +     }
> > +
> > +     changed_req.fd =3D fd;
> > +     ret =3D copy_to_user(ip, &changed_req, sizeof(changed_req));
> > +     if (ret) {
> > +             fput(file);
> > +             put_unused_fd(fd);
> > +             return -EFAULT;
> > +     }
> > +
> > +     fd_install(fd, file);
> > +
> > +     return 0;
> > +
> > +out_put_unused_fd:
> > +     put_unused_fd(fd);
> > +out_unregister_notifier:
> > +     atomic_notifier_chain_unregister(&gdev->notifier,
> > +                                      &lc_state->changed_nb);
> > +out_free_lc_state:
> > +     kfree(lc_state);
> > +
> > +     return ret;
> > +}
> > +
> >  /*
> >   * gpio_ioctl() - ioctl handler for the GPIO chardev
> >   */
> > @@ -1238,6 +1447,8 @@ static long gpio_ioctl(struct file *filp, unsigne=
d int cmd, unsigned long arg)
> >               return linehandle_create(gdev, ip);
> >       } else if (cmd =3D=3D GPIO_GET_LINEEVENT_IOCTL) {
> >               return lineevent_create(gdev, ip);
> > +     } else if (cmd =3D=3D GPIO_GET_LINECHANGED_FD_IOCTL) {
> > +             return linechanged_fd_create(gdev, ip);
> >       }
> >       return -EINVAL;
> >  }
> > @@ -1499,6 +1710,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
chip, void *data,
> >       for (i =3D 0; i < chip->ngpio; i++)
> >               gdev->descs[i].gdev =3D gdev;
> >
> > +     ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
> > +
> >  #ifdef CONFIG_PINCTRL
> >       INIT_LIST_HEAD(&gdev->pin_ranges);
> >  #endif
> > @@ -2837,6 +3050,8 @@ static int gpiod_request_commit(struct gpio_desc =
*desc, const char *label)
> >               spin_lock_irqsave(&gpio_lock, flags);
> >       }
> >  done:
> > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > +                                GPIOLINE_CHANGED_REQUESTED, desc);
> >       spin_unlock_irqrestore(&gpio_lock, flags);
> >       return ret;
> >  }
> > @@ -2934,6 +3149,8 @@ static bool gpiod_free_commit(struct gpio_desc *d=
esc)
> >               ret =3D true;
> >       }
> >
> > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > +                                GPIOLINE_CHANGED_RELEASED, desc);
> >       spin_unlock_irqrestore(&gpio_lock, flags);
> >       return ret;
> >  }
> > @@ -3097,6 +3314,7 @@ static int gpio_set_bias(struct gpio_chip *chip, =
struct gpio_desc *desc)
> >               if (ret !=3D -ENOTSUPP)
> >                       return ret;
> >       }
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> > index a1cbeabadc69..8e3969616cfe 100644
> > --- a/drivers/gpio/gpiolib.h
> > +++ b/drivers/gpio/gpiolib.h
> > @@ -54,6 +54,7 @@ struct gpio_device {
> >       const char              *label;
> >       void                    *data;
> >       struct list_head        list;
> > +     struct atomic_notifier_head notifier;
> >
> >  #ifdef CONFIG_PINCTRL
> >       /*
> > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > index 799cf823d493..c61429467dd4 100644
> > --- a/include/uapi/linux/gpio.h
> > +++ b/include/uapi/linux/gpio.h
> > @@ -59,6 +59,40 @@ struct gpioline_info {
> >  /* Maximum number of requested handles */
> >  #define GPIOHANDLES_MAX 64
> >
> > +/**
> > + * struct gpioline_changed_fd_request - Information about a linechange=
d fd
> > + * request
> > + * @lineoffsets: an array of desired lines, specified by offset index =
for the
> > + * associated GPIO device
> > + * @num_lines: number of lines requested in this request, i.e. the num=
ber of
> > + * valid fields in the above arrays, set to 1 to request a single line
> > + * @fd: if successful this field will contain a valid anonymous file h=
andle
> > + */
> > +struct gpioline_changed_fd_request {
> > +     __u32 lineoffsets[GPIOHANDLES_MAX];
> > +     __u32 num_lines;
> > +     int fd;
> > +};
> > +
>
> Wouldn't the most common case be to watch all the lines on a chip?
> How about an easy way to do that, say num_lines=3D0?
>

IMO this is too implicit - it's literally a magic value. I'd prefer to
keep it this way for the same reason I didn't want to have implicit
BIAS settings. I prefer the kernel uAPI to be explicit and then we can
wrap it in simple helpers in the library.

> > +/* Possible line status change events */
> > +enum {
> > +     GPIOLINE_CHANGED_REQUESTED =3D 1,
> > +     GPIOLINE_CHANGED_RELEASED,
> > +     GPIOLINE_CHANGED_CONFIG,
> > +};
> > +
> > +/**
> > + * struct gpioline_changed - Information about a change in status
> > + * of a GPIO line
> > + * @line_offset: offset of the line that changed relative to the gpioc=
hip
> > + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RE=
LEASED
> > + * and GPIOLINE_CHANGED_CONFIG
> > + */
> > +struct gpioline_changed {
> > +     __u32 line_offset;
> > +     __u32 event_type;
> > +};
> > +
>
> Rather than sending an event type, and requiring userspace to poll
> LINEINFO, which is racy, how about passing the updated info flags here?
> A change in the state of the GPIOLINE_FLAG_KERNEL implies the
> GPIOLINE_CHANGED_REQUESTED or GPIOLINE_CHANGED_RELEASED, so the
> event_type is then redundant.
> Userspace would then only have to poll LINEINFO if they were interested
> in the consumer on GPIOLINE_CHANGED_REQUESTED.
>
> To sync kernel and userspace state the current state of each line
> should be returned immediately via the fd as soon as the fd is created,
> and then subsequently on any change.
>

I guess you're right. You even made me think we could go as far as to
embed the whole gpioline_info structure in struct gpioline_changed.
I'd still keep the event type though - otherwise we'd have to assume
the user always calls LINEINFO_IOCTL before obtaining the LINECHANGED
fd.

> And a timestamp might be useful, as per gpioevent_data?

Sure thing!

Bart

>
> Kent.
>
> >  /* Linerequest flags */
> >  #define GPIOHANDLE_REQUEST_INPUT     (1UL << 0)
> >  #define GPIOHANDLE_REQUEST_OUTPUT    (1UL << 1)
> > @@ -176,6 +210,8 @@ struct gpioevent_data {
> >
> >  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
> >  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info=
)
> > +#define GPIO_GET_LINECHANGED_FD_IOCTL \
> > +             _IOWR(0xB4, 0x0b, struct gpioline_changed_fd_request)
> >  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_=
request)
> >  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_re=
quest)
> >
> > --
> > 2.23.0
> >
