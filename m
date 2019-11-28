Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17FE010C622
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 10:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfK1Jp7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 04:45:59 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:43910 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK1Jp7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 04:45:59 -0500
Received: by mail-il1-f193.google.com with SMTP id r9so23653493ilq.10
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 01:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=n8nBDGoN0K3s86w3qAOLIFa+QTL71HaL6QaGvULODQY=;
        b=gGUWEfrwZ8fyY0iWUXoMHbWxMwh4vmo6k2uBz1f3eyHX8GOG8rlcbqqXqBHNWRhCoZ
         Be/MJJWw6Z3ZC8tQEGi1qg3CgflCspNUnFp7qFv0rcUgE7+R9TQmv5tbYbO1RVZA6c7u
         c6o+lIDopnu9EYmPmztVkMvjeTRxg4JJKpH+WRhVAY3osXVk+0lrs86L4/NVWreFrFow
         ATTC8xOJCHMfg/OGTUfiAFCckOCoq+ltup4GX3sDqIe7xV5CiuNKmOJYVZcE5vuDt9F5
         OmL5h8xBiJgBcly8v9D078Q7t4zpvA2kND8KEheYWj1pn+KBcUPuRxF6N2exxzF3D9UT
         MQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=n8nBDGoN0K3s86w3qAOLIFa+QTL71HaL6QaGvULODQY=;
        b=JQRX1iNCcjQ0yo2fLoED1n71rHMhOA7ZOA76fvf88u2xgmQjqFsdEVO45P2zSCD6QI
         lNjgpNeIx59oohArS6xy2/B6CWAgHFJj//BmRW2SwGQbzeOfTXlIMTL1bvnV5RQP0Qrr
         B7WB85ENTLfH6ccp7f72BXp8MvW4hmMU/nuaDB2GkVUd0SdtfW+v5jIk/iqLhkofFTDd
         2HkLjob8NuDAXaRVlpp4CA+WiulETDP0yzLLUMPorSKL4fxWmI/Jjx46KEy3NTc0ZAG3
         wnUp6e1xbeJcMMdhInS0rqDeZE9GynKy958knmgXSRr0OwbwnH9Ou0ivIcv8b/o28/wm
         Bybw==
X-Gm-Message-State: APjAAAX8m8eGNew0orsHZX8O/lLAT4s+suPBntzoIwR5df4quhKC1Xsl
        EyvLwFwpLwqS0MS5QSzocbMijfCr8SLtpb3SH/9+hw==
X-Google-Smtp-Source: APXvYqylEVRoCTKS1rWbqmLAQ4JB60BN2DuHHcWRXXlSV/wZKagaqsY10XtSc65y3/QaLfVSkkCw6HhXJB7CHxfU8DU=
X-Received: by 2002:a92:96c2:: with SMTP id g185mr11796534ilh.40.1574934357636;
 Thu, 28 Nov 2019 01:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20191127133510.10614-1-brgl@bgdev.pl> <20191127133510.10614-8-brgl@bgdev.pl>
 <20191127152410.GA24936@sol> <CAMRc=MdLnZFJQ+qMJSiSQSh6pOnKpLeU79u9ymA7HaujgK0kcg@mail.gmail.com>
 <20191127232330.GA3761@sol>
In-Reply-To: <20191127232330.GA3761@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 28 Nov 2019 10:45:46 +0100
Message-ID: <CAMRc=Me5kNUuPQCTM_H=2QjUL=7R-ii+uRvdNvAz3SqL_sPzcQ@mail.gmail.com>
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

czw., 28 lis 2019 o 00:23 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> On Wed, Nov 27, 2019 at 04:50:43PM +0100, Bartosz Golaszewski wrote:
> > =C5=9Br., 27 lis 2019 o 16:24 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > >
> > > On Wed, Nov 27, 2019 at 02:35:09PM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > Currently there is no way for user-space to be informed about chang=
es
> > > > in status of GPIO lines e.g. when someone else requests the line or=
 its
> > > > config changes. We can only periodically re-read the line-info. Thi=
s
> > > > is fine for simple one-off user-space tools, but any daemon that pr=
ovides
> > > > a centralized access to GPIO chips would benefit hugely from an eve=
nt
> > > > driven line info synchronization.
> > > >
> > > > This patch adds a new ioctl() that allows user-space processes to r=
etrieve
> > > > a file-descriptor for given GPIO lines which can be polled for line=
 status
> > > > change events.
> > > >
> > > > Currently the events are generated on three types of status changes=
: when
> > > > a line is requested, when it's released and when its config is chan=
ged.
> > > > The first two are self-explanatory. For the third one: this will on=
ly
> > > > happen when another user-space process calls the new SET_CONFIG ioc=
tl()
> > > > as any changes that can happen from within the kernel (i.e.
> > > > set_transitory() or set_debounce()) are of no interest to user-spac=
e.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > ---
> > > >  drivers/gpio/gpiolib.c    | 218 ++++++++++++++++++++++++++++++++++=
++++
> > > >  drivers/gpio/gpiolib.h    |   1 +
> > > >  include/uapi/linux/gpio.h |  36 +++++++
> > > >  3 files changed, 255 insertions(+)
> > > >
> > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > index d094b1be334d..be5df4bdf44b 100644
> > > > --- a/drivers/gpio/gpiolib.c
> > > > +++ b/drivers/gpio/gpiolib.c
> > > > @@ -547,6 +547,9 @@ static long linehandle_set_config(struct lineha=
ndle_state *lh,
> > > >                       if (ret)
> > > >                               return ret;
> > > >               }
> > > > +
> > > > +             atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > +                                        GPIOLINE_CHANGED_CONFIG, d=
esc);
> > > >       }
> > > >       return 0;
> > > >  }
> > > > @@ -1148,6 +1151,212 @@ static int lineevent_create(struct gpio_dev=
ice *gdev, void __user *ip)
> > > >       return ret;
> > > >  }
> > > >
> > > > +struct linechanged_fd_state {
> > > > +     struct gpio_device *gdev;
> > > > +     struct gpio_desc *descs[GPIOHANDLES_MAX];
> > > > +     size_t numdescs;
> > > > +     wait_queue_head_t waitqueue;
> > > > +     DECLARE_KFIFO(events, struct gpioline_changed, 16);
> > > > +     struct mutex lock;
> > > > +     struct notifier_block changed_nb;
> > > > +};
> > > > +
> > > > +static int linechanged_fd_release(struct inode *inode, struct file=
 *filep)
> > > > +{
> > > > +     struct linechanged_fd_state *lc_state =3D filep->private_data=
;
> > > > +
> > > > +     atomic_notifier_chain_unregister(&lc_state->gdev->notifier,
> > > > +                                      &lc_state->changed_nb);
> > > > +     put_device(&lc_state->gdev->dev);
> > > > +     kfree(lc_state);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static __poll_t linechanged_fd_poll(struct file *filep,
> > > > +                                 struct poll_table_struct *pollt)
> > > > +{
> > > > +     struct linechanged_fd_state *lc_state =3D filep->private_data=
;
> > > > +     __poll_t events =3D 0;
> > > > +
> > > > +     poll_wait(filep, &lc_state->waitqueue, pollt);
> > > > +
> > > > +     mutex_lock(&lc_state->lock);
> > > > +     if (!kfifo_is_empty(&lc_state->events))
> > > > +             events =3D EPOLLIN | EPOLLRDNORM;
> > > > +     mutex_unlock(&lc_state->lock);
> > > > +
> > > > +     return events;
> > > > +}
> > > > +
> > > > +static ssize_t linechanged_fd_read(struct file *filep, char __user=
 *buf,
> > > > +                                size_t count, loff_t *off)
> > > > +{
> > > > +     struct linechanged_fd_state *lc_state =3D filep->private_data=
;
> > > > +     unsigned int copied;
> > > > +     int ret;
> > > > +
> > > > +     if (count < sizeof(struct gpioline_changed))
> > > > +             return -EINVAL;
> > > > +
> > > > +     do {
> > > > +             mutex_lock(&lc_state->lock);
> > > > +             if (kfifo_is_empty(&lc_state->events)) {
> > > > +                     mutex_unlock(&lc_state->lock);
> > > > +                     if (filep->f_flags & O_NONBLOCK)
> > > > +                             return -EAGAIN;
> > > > +
> > > > +                     ret =3D wait_event_interruptible(lc_state->wa=
itqueue,
> > > > +                                     !kfifo_is_empty(&lc_state->ev=
ents));
> > > > +                     if (ret)
> > > > +                             return ret;
> > > > +             } else {
> > > > +                     mutex_unlock(&lc_state->lock);
> > > > +             }
> > > > +
> > > > +             if (mutex_lock_interruptible(&lc_state->lock))
> > > > +                     return -ERESTARTSYS;
> > > > +
> > > > +             ret =3D kfifo_to_user(&lc_state->events, buf, count, =
&copied);
> > > > +             mutex_unlock(&lc_state->lock);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +
> > > > +             if (copied =3D=3D 0 && (filep->f_flags & O_NONBLOCK))
> > > > +                     return -EAGAIN;
> > > > +     } while (copied =3D=3D 0);
> > > > +
> > > > +     return copied;
> > > > +}
> > > > +
> > > > +static const struct file_operations linechanged_fd_fileops =3D {
> > > > +     .release =3D linechanged_fd_release,
> > > > +     .owner =3D THIS_MODULE,
> > > > +     .llseek =3D noop_llseek,
> > > > +     .poll =3D linechanged_fd_poll,
> > > > +     .read =3D linechanged_fd_read,
> > > > +};
> > > > +
> > > > +static struct linechanged_fd_state *
> > > > +to_linechanged_fd_state(struct notifier_block *nb)
> > > > +{
> > > > +     return container_of(nb, struct linechanged_fd_state, changed_=
nb);
> > > > +}
> > > > +
> > > > +static int linechanged_fd_notify(struct notifier_block *nb,
> > > > +                              unsigned long action, void *data)
> > > > +{
> > > > +     struct linechanged_fd_state *lc_state =3D to_linechanged_fd_s=
tate(nb);
> > > > +     struct gpio_desc *desc =3D data;
> > > > +     struct gpioline_changed chg;
> > > > +     int i, ret;
> > > > +
> > > > +     for (i =3D 0; i < lc_state->numdescs; i++) {
> > > > +             /* Are we watching this desc? */
> > > > +             if (desc =3D=3D lc_state->descs[i]) {
> > > > +                     /* Yes - prepare the event. */
> > > > +                     memset(&chg, 0, sizeof(chg));
> > > > +                     chg.line_offset =3D gpio_chip_hwgpio(desc);
> > > > +                     chg.event_type =3D action;
> > > > +
> > > > +                     mutex_lock(&lc_state->lock);
> > > > +                     ret =3D kfifo_put(&lc_state->events, chg);
> > > > +                     mutex_unlock(&lc_state->lock);
> > > > +                     if (ret)
> > > > +                             wake_up_poll(&lc_state->waitqueue, EP=
OLLIN);
> > > > +
> > > > +                     return NOTIFY_OK;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     return NOTIFY_DONE;
> > > > +}
> > > > +
> > > > +static int linechanged_fd_create(struct gpio_device *gdev, void __=
user *ip)
> > > > +{
> > > > +     struct gpioline_changed_fd_request changed_req;
> > > > +     struct linechanged_fd_state *lc_state;
> > > > +     struct gpio_desc *desc;
> > > > +     struct file *file;
> > > > +     int ret, i, fd;
> > > > +     u32 offset;
> > > > +
> > > > +     ret =3D copy_from_user(&changed_req, ip, sizeof(changed_req))=
;
> > > > +     if (ret)
> > > > +             return -EFAULT;
> > > > +
> > > > +     if ((changed_req.num_lines =3D=3D 0) ||
> > > > +         (changed_req.num_lines > GPIOHANDLES_MAX))
> > > > +             return -EINVAL;
> > > > +
> > > > +     lc_state =3D kzalloc(sizeof(*lc_state), GFP_KERNEL);
> > > > +     if (!lc_state)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     lc_state->gdev =3D gdev;
> > > > +     get_device(&gdev->dev);
> > > > +
> > > > +     for (i =3D 0; i < changed_req.num_lines; i++) {
> > > > +             offset =3D changed_req.lineoffsets[i];
> > > > +             desc =3D gpiochip_get_desc(gdev->chip, offset);
> > > > +             if (IS_ERR(desc)) {
> > > > +                     ret =3D PTR_ERR(desc);
> > > > +                     goto out_free_lc_state;
> > > > +             }
> > > > +
> > > > +             lc_state->descs[i] =3D desc;
> > > > +     }
> > > > +
> > > > +     lc_state->numdescs =3D changed_req.num_lines;
> > > > +
> > > > +     init_waitqueue_head(&lc_state->waitqueue);
> > > > +     INIT_KFIFO(lc_state->events);
> > > > +     mutex_init(&lc_state->lock);
> > > > +
> > > > +     lc_state->changed_nb.notifier_call =3D linechanged_fd_notify;
> > > > +
> > > > +     ret =3D atomic_notifier_chain_register(&gdev->notifier,
> > > > +                                          &lc_state->changed_nb);
> > > > +     if (ret)
> > > > +             goto out_free_lc_state;
> > > > +
> > > > +     fd =3D get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> > > > +     if (fd < 0) {
> > > > +             ret =3D fd;
> > > > +             goto out_unregister_notifier;
> > > > +     }
> > > > +
> > > > +     file =3D anon_inode_getfile("gpio-line-changed-fd",
> > > > +                               &linechanged_fd_fileops,
> > > > +                               lc_state, O_RDONLY | O_CLOEXEC);
> > > > +     if (IS_ERR(file)) {
> > > > +             ret =3D PTR_ERR(file);
> > > > +             goto out_put_unused_fd;
> > > > +     }
> > > > +
> > > > +     changed_req.fd =3D fd;
> > > > +     ret =3D copy_to_user(ip, &changed_req, sizeof(changed_req));
> > > > +     if (ret) {
> > > > +             fput(file);
> > > > +             put_unused_fd(fd);
> > > > +             return -EFAULT;
> > > > +     }
> > > > +
> > > > +     fd_install(fd, file);
> > > > +
> > > > +     return 0;
> > > > +
> > > > +out_put_unused_fd:
> > > > +     put_unused_fd(fd);
> > > > +out_unregister_notifier:
> > > > +     atomic_notifier_chain_unregister(&gdev->notifier,
> > > > +                                      &lc_state->changed_nb);
> > > > +out_free_lc_state:
> > > > +     kfree(lc_state);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > >  /*
> > > >   * gpio_ioctl() - ioctl handler for the GPIO chardev
> > > >   */
> > > > @@ -1238,6 +1447,8 @@ static long gpio_ioctl(struct file *filp, uns=
igned int cmd, unsigned long arg)
> > > >               return linehandle_create(gdev, ip);
> > > >       } else if (cmd =3D=3D GPIO_GET_LINEEVENT_IOCTL) {
> > > >               return lineevent_create(gdev, ip);
> > > > +     } else if (cmd =3D=3D GPIO_GET_LINECHANGED_FD_IOCTL) {
> > > > +             return linechanged_fd_create(gdev, ip);
> > > >       }
> > > >       return -EINVAL;
> > > >  }
> > > > @@ -1499,6 +1710,8 @@ int gpiochip_add_data_with_key(struct gpio_ch=
ip *chip, void *data,
> > > >       for (i =3D 0; i < chip->ngpio; i++)
> > > >               gdev->descs[i].gdev =3D gdev;
> > > >
> > > > +     ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
> > > > +
> > > >  #ifdef CONFIG_PINCTRL
> > > >       INIT_LIST_HEAD(&gdev->pin_ranges);
> > > >  #endif
> > > > @@ -2837,6 +3050,8 @@ static int gpiod_request_commit(struct gpio_d=
esc *desc, const char *label)
> > > >               spin_lock_irqsave(&gpio_lock, flags);
> > > >       }
> > > >  done:
> > > > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > +                                GPIOLINE_CHANGED_REQUESTED, desc);
> > > >       spin_unlock_irqrestore(&gpio_lock, flags);
> > > >       return ret;
> > > >  }
> > > > @@ -2934,6 +3149,8 @@ static bool gpiod_free_commit(struct gpio_des=
c *desc)
> > > >               ret =3D true;
> > > >       }
> > > >
> > > > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > +                                GPIOLINE_CHANGED_RELEASED, desc);
> > > >       spin_unlock_irqrestore(&gpio_lock, flags);
> > > >       return ret;
> > > >  }
> > > > @@ -3097,6 +3314,7 @@ static int gpio_set_bias(struct gpio_chip *ch=
ip, struct gpio_desc *desc)
> > > >               if (ret !=3D -ENOTSUPP)
> > > >                       return ret;
> > > >       }
> > > > +
> > > >       return 0;
> > > >  }
> > > >
> > > > diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> > > > index a1cbeabadc69..8e3969616cfe 100644
> > > > --- a/drivers/gpio/gpiolib.h
> > > > +++ b/drivers/gpio/gpiolib.h
> > > > @@ -54,6 +54,7 @@ struct gpio_device {
> > > >       const char              *label;
> > > >       void                    *data;
> > > >       struct list_head        list;
> > > > +     struct atomic_notifier_head notifier;
> > > >
> > > >  #ifdef CONFIG_PINCTRL
> > > >       /*
> > > > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > > > index 799cf823d493..c61429467dd4 100644
> > > > --- a/include/uapi/linux/gpio.h
> > > > +++ b/include/uapi/linux/gpio.h
> > > > @@ -59,6 +59,40 @@ struct gpioline_info {
> > > >  /* Maximum number of requested handles */
> > > >  #define GPIOHANDLES_MAX 64
> > > >
> > > > +/**
> > > > + * struct gpioline_changed_fd_request - Information about a linech=
anged fd
> > > > + * request
> > > > + * @lineoffsets: an array of desired lines, specified by offset in=
dex for the
> > > > + * associated GPIO device
> > > > + * @num_lines: number of lines requested in this request, i.e. the=
 number of
> > > > + * valid fields in the above arrays, set to 1 to request a single =
line
> > > > + * @fd: if successful this field will contain a valid anonymous fi=
le handle
> > > > + */
> > > > +struct gpioline_changed_fd_request {
> > > > +     __u32 lineoffsets[GPIOHANDLES_MAX];
> > > > +     __u32 num_lines;
> > > > +     int fd;
> > > > +};
> > > > +
> > >
> > > Wouldn't the most common case be to watch all the lines on a chip?
> > > How about an easy way to do that, say num_lines=3D0?
> > >
> >
> > IMO this is too implicit - it's literally a magic value. I'd prefer to
> > keep it this way for the same reason I didn't want to have implicit
> > BIAS settings. I prefer the kernel uAPI to be explicit and then we can
> > wrap it in simple helpers in the library.
> >
>
> Or you could add a watch_all flag to make it explicit.
> But fair enough to leave as is - it probably keeps the kernel cleaner.
>
> > > > +/* Possible line status change events */
> > > > +enum {
> > > > +     GPIOLINE_CHANGED_REQUESTED =3D 1,
> > > > +     GPIOLINE_CHANGED_RELEASED,
> > > > +     GPIOLINE_CHANGED_CONFIG,
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct gpioline_changed - Information about a change in status
> > > > + * of a GPIO line
> > > > + * @line_offset: offset of the line that changed relative to the g=
piochip
> > > > + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGE=
D_RELEASED
> > > > + * and GPIOLINE_CHANGED_CONFIG
> > > > + */
> > > > +struct gpioline_changed {
> > > > +     __u32 line_offset;
> > > > +     __u32 event_type;
> > > > +};
> > > > +
> > >
> > > Rather than sending an event type, and requiring userspace to poll
> > > LINEINFO, which is racy, how about passing the updated info flags her=
e?
> > > A change in the state of the GPIOLINE_FLAG_KERNEL implies the
> > > GPIOLINE_CHANGED_REQUESTED or GPIOLINE_CHANGED_RELEASED, so the
> > > event_type is then redundant.
> > > Userspace would then only have to poll LINEINFO if they were interest=
ed
> > > in the consumer on GPIOLINE_CHANGED_REQUESTED.
> > >
> > > To sync kernel and userspace state the current state of each line
> > > should be returned immediately via the fd as soon as the fd is create=
d,
> > > and then subsequently on any change.
> > >
> >
> > I guess you're right. You even made me think we could go as far as to
> > embed the whole gpioline_info structure in struct gpioline_changed.
> > I'd still keep the event type though - otherwise we'd have to assume
> > the user always calls LINEINFO_IOCTL before obtaining the LINECHANGED
> > fd.
> >
>
> I suggested sending the current state of each line as soon as the fd
> is created so that you don't have to assume anything.  That initial chang=
e
> report is effectively the same as having the user call LINEINFO on each
> line at the same time - without all the race issues.
>

Right, I didn't get this. That means you'd have to call the ioctl()
and immediately follow up with a read(). I'm not a fan of this.
Especially if we were to include a timestamp - what would it refer to?

> I also considered the full gpioline_info structure, as well as reporting
> bulk line changes (replacing line_offset with lineoffsets and num_lines),
> but then I thought it was probably better to keep it minimal and simple.
> The name and consumer are relatively large.

In terms of performance - we're not really degrading it as this is
still not a lot of data.

How about the following:
1. Move the code filling out the struct gpioline_info to a separate
function in the kernel.
2. Call the new ioctl() GET_LINEINFO_FD to indicate it's an extension
of GET_LINEINFO.
3. Embed struct gpioline_info in struct gpioline_info_fd so that the
initial info be read when the file descriptor is created.
4. Likewise embed struct gpioline_info in struct gpioline_changed and
on every status change event provide the whole set of information?

> The name is immutable(??), and so is pointless to include.

It is now, but let's be future-proof. I can imagine having modifiable
line names in the future. The code putting this info in struct
gpioline_info wouldn't be really duplicated and the size of such small
structures doesn't matter much - it's still a single context switch to
read it.

> The consumer only changes when the line is requested, so I was willing
> to live with still having to poll for that.
> And what you gain by reporting bulk lines you might lose in increased
> report size and associated code.  OTOH it would make it explicit which
> lines are being changed together...
> So I could well be wrong on that - a full bulk report may be better.

I'm not sure we need bulk reporting - just as we don't provide bulk
GET_GPIOLINE_INFO. The corresponding ioctl() structure would get
pretty complicated soon.

Bartosz

>
> Kent.
>
> > > And a timestamp might be useful, as per gpioevent_data?
> >
> > Sure thing!
> >
> > Bart
> >
> > >
> > > Kent.
> > >
> > > >  /* Linerequest flags */
> > > >  #define GPIOHANDLE_REQUEST_INPUT     (1UL << 0)
> > > >  #define GPIOHANDLE_REQUEST_OUTPUT    (1UL << 1)
> > > > @@ -176,6 +210,8 @@ struct gpioevent_data {
> > > >
> > > >  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_i=
nfo)
> > > >  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_=
info)
> > > > +#define GPIO_GET_LINECHANGED_FD_IOCTL \
> > > > +             _IOWR(0xB4, 0x0b, struct gpioline_changed_fd_request)
> > > >  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohan=
dle_request)
> > > >  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioeven=
t_request)
> > > >
> > > > --
> > > > 2.23.0
> > > >
