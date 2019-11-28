Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE9E10CA74
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 15:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfK1Ogc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 09:36:32 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:43294 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbfK1Ogc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 09:36:32 -0500
Received: by mail-il1-f195.google.com with SMTP id r9so24362547ilq.10
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 06:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tUeFO2HwEzWNSci/KG8jhmeG4UiQCCpfL0kDQbOoFpg=;
        b=VEReZVQU3HY+sJf7GCq1W9JDeJOY9RRPAtG+MGNWX6Ix5+kMdr2F8u/jN/QYXr/dZ5
         UiFOAOMuwJfMq4R+umZp/1LRnTtmF8DmCQQ4hGP8beoasompiFJcFvbahZD3TGe/IAdo
         JtGlR3OPLwRxka2DXwUh4lwUorEs07FPe3ryccBGt6i/LjHjBih2BjNmTVaD8XH40CyC
         BHXcvg8peTafBDO/dU3/zkuwMTs0LIxbaOGDYfZvR1q8dFc3DlG8WUClpoSQ5+bTu3Eb
         qeaIn2qhACRRoH41kbsjt3UBmiXlyg1anW+reHrAnZCeOLOREZfFnIUJFJA02kRNCTbJ
         UkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tUeFO2HwEzWNSci/KG8jhmeG4UiQCCpfL0kDQbOoFpg=;
        b=uUGIuWN+urheg86tKu6Lzrjm7xtmOyvs74EwOt9q4+GUFN7Pasf/uh6KIvdqhITRmX
         wA6ON59trwplSMu7PySioUp/BdT0Bcov7QvVTkft0hG2y1tpetl3kUBRYT6pWsKtel3V
         TKsd4jnDu0dt17QnmQH4FxDOx2yBSa+fYpqB/mr/gO24JVtWSJn4qcU9T1LADFuimMo2
         csLWBZNcZ+3jZIFv3b/Nt7JfYx4Z6ohk7UEo8cfN+NOj7cN4KG5FUZxeypSemN2T81RZ
         PZHBMlM2OhS3nosNzgkd8eHgnUTShiLKRhkdjHkTBBNl5yVFEMrpv/CtYhgNBibxduoZ
         1ojQ==
X-Gm-Message-State: APjAAAUoy2Ky8nfWxSi9F8CitWdd6Y6BmI3f6PvG4fuOlS9jxwfmPsko
        LoR8NaUz42gfMf8kHKXggP+iUxNKAtU0/s2vWKmasQ==
X-Google-Smtp-Source: APXvYqwRzAdnnRPDDv1eLsfS+KZ59dtx84IaOVDtLBVlWRnsx+Vk90H5mGb0m/Pvmg5DDTwJe3pc1eAkf3mIAPi0I64=
X-Received: by 2002:a92:c8:: with SMTP id 191mr51825908ila.287.1574951790342;
 Thu, 28 Nov 2019 06:36:30 -0800 (PST)
MIME-Version: 1.0
References: <20191127133510.10614-1-brgl@bgdev.pl> <20191127133510.10614-8-brgl@bgdev.pl>
 <20191127152410.GA24936@sol> <CAMRc=MdLnZFJQ+qMJSiSQSh6pOnKpLeU79u9ymA7HaujgK0kcg@mail.gmail.com>
 <20191127232330.GA3761@sol> <CAMRc=Me5kNUuPQCTM_H=2QjUL=7R-ii+uRvdNvAz3SqL_sPzcQ@mail.gmail.com>
 <20191128141028.GA15454@sol>
In-Reply-To: <20191128141028.GA15454@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 28 Nov 2019 15:36:19 +0100
Message-ID: <CAMRc=MeZzjuU25L_-qjP9n3O6Z3ucYUZkUoCA3sX0Z0yaXtgMw@mail.gmail.com>
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

czw., 28 lis 2019 o 15:10 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> On Thu, Nov 28, 2019 at 10:45:46AM +0100, Bartosz Golaszewski wrote:
> > czw., 28 lis 2019 o 00:23 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > On Wed, Nov 27, 2019 at 04:50:43PM +0100, Bartosz Golaszewski wrote:
> > > > =C5=9Br., 27 lis 2019 o 16:24 Kent Gibson <warthog618@gmail.com> na=
pisa=C5=82(a):
> > > > >
> > > > > On Wed, Nov 27, 2019 at 02:35:09PM +0100, Bartosz Golaszewski wro=
te:
> > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > >
> > > > > > Currently there is no way for user-space to be informed about c=
hanges
> > > > > > in status of GPIO lines e.g. when someone else requests the lin=
e or its
> > > > > > config changes. We can only periodically re-read the line-info.=
 This
> > > > > > is fine for simple one-off user-space tools, but any daemon tha=
t provides
> > > > > > a centralized access to GPIO chips would benefit hugely from an=
 event
> > > > > > driven line info synchronization.
> > > > > >
> > > > > > This patch adds a new ioctl() that allows user-space processes =
to retrieve
> > > > > > a file-descriptor for given GPIO lines which can be polled for =
line status
> > > > > > change events.
> > > > > >
> > > > > > Currently the events are generated on three types of status cha=
nges: when
> > > > > > a line is requested, when it's released and when its config is =
changed.
> > > > > > The first two are self-explanatory. For the third one: this wil=
l only
> > > > > > happen when another user-space process calls the new SET_CONFIG=
 ioctl()
> > > > > > as any changes that can happen from within the kernel (i.e.
> > > > > > set_transitory() or set_debounce()) are of no interest to user-=
space.
> > > > > >
> > > > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > > ---
> > > > > >  drivers/gpio/gpiolib.c    | 218 ++++++++++++++++++++++++++++++=
++++++++
> > > > > >  drivers/gpio/gpiolib.h    |   1 +
> > > > > >  include/uapi/linux/gpio.h |  36 +++++++
> > > > > >  3 files changed, 255 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > > > index d094b1be334d..be5df4bdf44b 100644
> > > > > > --- a/drivers/gpio/gpiolib.c
> > > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > > @@ -547,6 +547,9 @@ static long linehandle_set_config(struct li=
nehandle_state *lh,
> > > > > >                       if (ret)
> > > > > >                               return ret;
> > > > > >               }
> > > > > > +
> > > > > > +             atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > > > +                                        GPIOLINE_CHANGED_CONFI=
G, desc);
> > > > > >       }
> > > > > >       return 0;
> > > > > >  }
> > > > > > @@ -1148,6 +1151,212 @@ static int lineevent_create(struct gpio=
_device *gdev, void __user *ip)
> > > > > >       return ret;
> > > > > >  }
> > > > > >
> > > > > > +struct linechanged_fd_state {
> > > > > > +     struct gpio_device *gdev;
> > > > > > +     struct gpio_desc *descs[GPIOHANDLES_MAX];
> > > > > > +     size_t numdescs;
> > > > > > +     wait_queue_head_t waitqueue;
> > > > > > +     DECLARE_KFIFO(events, struct gpioline_changed, 16);
> > > > > > +     struct mutex lock;
> > > > > > +     struct notifier_block changed_nb;
> > > > > > +};
> > > > > > +
> > > > > > +static int linechanged_fd_release(struct inode *inode, struct =
file *filep)
> > > > > > +{
> > > > > > +     struct linechanged_fd_state *lc_state =3D filep->private_=
data;
> > > > > > +
> > > > > > +     atomic_notifier_chain_unregister(&lc_state->gdev->notifie=
r,
> > > > > > +                                      &lc_state->changed_nb);
> > > > > > +     put_device(&lc_state->gdev->dev);
> > > > > > +     kfree(lc_state);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static __poll_t linechanged_fd_poll(struct file *filep,
> > > > > > +                                 struct poll_table_struct *pol=
lt)
> > > > > > +{
> > > > > > +     struct linechanged_fd_state *lc_state =3D filep->private_=
data;
> > > > > > +     __poll_t events =3D 0;
> > > > > > +
> > > > > > +     poll_wait(filep, &lc_state->waitqueue, pollt);
> > > > > > +
> > > > > > +     mutex_lock(&lc_state->lock);
> > > > > > +     if (!kfifo_is_empty(&lc_state->events))
> > > > > > +             events =3D EPOLLIN | EPOLLRDNORM;
> > > > > > +     mutex_unlock(&lc_state->lock);
> > > > > > +
> > > > > > +     return events;
> > > > > > +}
> > > > > > +
> > > > > > +static ssize_t linechanged_fd_read(struct file *filep, char __=
user *buf,
> > > > > > +                                size_t count, loff_t *off)
> > > > > > +{
> > > > > > +     struct linechanged_fd_state *lc_state =3D filep->private_=
data;
> > > > > > +     unsigned int copied;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     if (count < sizeof(struct gpioline_changed))
> > > > > > +             return -EINVAL;
> > > > > > +
> > > > > > +     do {
> > > > > > +             mutex_lock(&lc_state->lock);
> > > > > > +             if (kfifo_is_empty(&lc_state->events)) {
> > > > > > +                     mutex_unlock(&lc_state->lock);
> > > > > > +                     if (filep->f_flags & O_NONBLOCK)
> > > > > > +                             return -EAGAIN;
> > > > > > +
> > > > > > +                     ret =3D wait_event_interruptible(lc_state=
->waitqueue,
> > > > > > +                                     !kfifo_is_empty(&lc_state=
->events));
> > > > > > +                     if (ret)
> > > > > > +                             return ret;
> > > > > > +             } else {
> > > > > > +                     mutex_unlock(&lc_state->lock);
> > > > > > +             }
> > > > > > +
> > > > > > +             if (mutex_lock_interruptible(&lc_state->lock))
> > > > > > +                     return -ERESTARTSYS;
> > > > > > +
> > > > > > +             ret =3D kfifo_to_user(&lc_state->events, buf, cou=
nt, &copied);
> > > > > > +             mutex_unlock(&lc_state->lock);
> > > > > > +             if (ret)
> > > > > > +                     return ret;
> > > > > > +
> > > > > > +             if (copied =3D=3D 0 && (filep->f_flags & O_NONBLO=
CK))
> > > > > > +                     return -EAGAIN;
> > > > > > +     } while (copied =3D=3D 0);
> > > > > > +
> > > > > > +     return copied;
> > > > > > +}
> > > > > > +
> > > > > > +static const struct file_operations linechanged_fd_fileops =3D=
 {
> > > > > > +     .release =3D linechanged_fd_release,
> > > > > > +     .owner =3D THIS_MODULE,
> > > > > > +     .llseek =3D noop_llseek,
> > > > > > +     .poll =3D linechanged_fd_poll,
> > > > > > +     .read =3D linechanged_fd_read,
> > > > > > +};
> > > > > > +
> > > > > > +static struct linechanged_fd_state *
> > > > > > +to_linechanged_fd_state(struct notifier_block *nb)
> > > > > > +{
> > > > > > +     return container_of(nb, struct linechanged_fd_state, chan=
ged_nb);
> > > > > > +}
> > > > > > +
> > > > > > +static int linechanged_fd_notify(struct notifier_block *nb,
> > > > > > +                              unsigned long action, void *data=
)
> > > > > > +{
> > > > > > +     struct linechanged_fd_state *lc_state =3D to_linechanged_=
fd_state(nb);
> > > > > > +     struct gpio_desc *desc =3D data;
> > > > > > +     struct gpioline_changed chg;
> > > > > > +     int i, ret;
> > > > > > +
> > > > > > +     for (i =3D 0; i < lc_state->numdescs; i++) {
> > > > > > +             /* Are we watching this desc? */
> > > > > > +             if (desc =3D=3D lc_state->descs[i]) {
> > > > > > +                     /* Yes - prepare the event. */
> > > > > > +                     memset(&chg, 0, sizeof(chg));
> > > > > > +                     chg.line_offset =3D gpio_chip_hwgpio(desc=
);
> > > > > > +                     chg.event_type =3D action;
> > > > > > +
> > > > > > +                     mutex_lock(&lc_state->lock);
> > > > > > +                     ret =3D kfifo_put(&lc_state->events, chg)=
;
> > > > > > +                     mutex_unlock(&lc_state->lock);
> > > > > > +                     if (ret)
> > > > > > +                             wake_up_poll(&lc_state->waitqueue=
, EPOLLIN);
> > > > > > +
> > > > > > +                     return NOTIFY_OK;
> > > > > > +             }
> > > > > > +     }
> > > > > > +
> > > > > > +     return NOTIFY_DONE;
> > > > > > +}
> > > > > > +
> > > > > > +static int linechanged_fd_create(struct gpio_device *gdev, voi=
d __user *ip)
> > > > > > +{
> > > > > > +     struct gpioline_changed_fd_request changed_req;
> > > > > > +     struct linechanged_fd_state *lc_state;
> > > > > > +     struct gpio_desc *desc;
> > > > > > +     struct file *file;
> > > > > > +     int ret, i, fd;
> > > > > > +     u32 offset;
> > > > > > +
> > > > > > +     ret =3D copy_from_user(&changed_req, ip, sizeof(changed_r=
eq));
> > > > > > +     if (ret)
> > > > > > +             return -EFAULT;
> > > > > > +
> > > > > > +     if ((changed_req.num_lines =3D=3D 0) ||
> > > > > > +         (changed_req.num_lines > GPIOHANDLES_MAX))
> > > > > > +             return -EINVAL;
> > > > > > +
> > > > > > +     lc_state =3D kzalloc(sizeof(*lc_state), GFP_KERNEL);
> > > > > > +     if (!lc_state)
> > > > > > +             return -ENOMEM;
> > > > > > +
> > > > > > +     lc_state->gdev =3D gdev;
> > > > > > +     get_device(&gdev->dev);
> > > > > > +
> > > > > > +     for (i =3D 0; i < changed_req.num_lines; i++) {
> > > > > > +             offset =3D changed_req.lineoffsets[i];
> > > > > > +             desc =3D gpiochip_get_desc(gdev->chip, offset);
> > > > > > +             if (IS_ERR(desc)) {
> > > > > > +                     ret =3D PTR_ERR(desc);
> > > > > > +                     goto out_free_lc_state;
> > > > > > +             }
> > > > > > +
> > > > > > +             lc_state->descs[i] =3D desc;
> > > > > > +     }
> > > > > > +
> > > > > > +     lc_state->numdescs =3D changed_req.num_lines;
> > > > > > +
> > > > > > +     init_waitqueue_head(&lc_state->waitqueue);
> > > > > > +     INIT_KFIFO(lc_state->events);
> > > > > > +     mutex_init(&lc_state->lock);
> > > > > > +
> > > > > > +     lc_state->changed_nb.notifier_call =3D linechanged_fd_not=
ify;
> > > > > > +
> > > > > > +     ret =3D atomic_notifier_chain_register(&gdev->notifier,
> > > > > > +                                          &lc_state->changed_n=
b);
> > > > > > +     if (ret)
> > > > > > +             goto out_free_lc_state;
> > > > > > +
> > > > > > +     fd =3D get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> > > > > > +     if (fd < 0) {
> > > > > > +             ret =3D fd;
> > > > > > +             goto out_unregister_notifier;
> > > > > > +     }
> > > > > > +
> > > > > > +     file =3D anon_inode_getfile("gpio-line-changed-fd",
> > > > > > +                               &linechanged_fd_fileops,
> > > > > > +                               lc_state, O_RDONLY | O_CLOEXEC)=
;
> > > > > > +     if (IS_ERR(file)) {
> > > > > > +             ret =3D PTR_ERR(file);
> > > > > > +             goto out_put_unused_fd;
> > > > > > +     }
> > > > > > +
> > > > > > +     changed_req.fd =3D fd;
> > > > > > +     ret =3D copy_to_user(ip, &changed_req, sizeof(changed_req=
));
> > > > > > +     if (ret) {
> > > > > > +             fput(file);
> > > > > > +             put_unused_fd(fd);
> > > > > > +             return -EFAULT;
> > > > > > +     }
> > > > > > +
> > > > > > +     fd_install(fd, file);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +
> > > > > > +out_put_unused_fd:
> > > > > > +     put_unused_fd(fd);
> > > > > > +out_unregister_notifier:
> > > > > > +     atomic_notifier_chain_unregister(&gdev->notifier,
> > > > > > +                                      &lc_state->changed_nb);
> > > > > > +out_free_lc_state:
> > > > > > +     kfree(lc_state);
> > > > > > +
> > > > > > +     return ret;
> > > > > > +}
> > > > > > +
> > > > > >  /*
> > > > > >   * gpio_ioctl() - ioctl handler for the GPIO chardev
> > > > > >   */
> > > > > > @@ -1238,6 +1447,8 @@ static long gpio_ioctl(struct file *filp,=
 unsigned int cmd, unsigned long arg)
> > > > > >               return linehandle_create(gdev, ip);
> > > > > >       } else if (cmd =3D=3D GPIO_GET_LINEEVENT_IOCTL) {
> > > > > >               return lineevent_create(gdev, ip);
> > > > > > +     } else if (cmd =3D=3D GPIO_GET_LINECHANGED_FD_IOCTL) {
> > > > > > +             return linechanged_fd_create(gdev, ip);
> > > > > >       }
> > > > > >       return -EINVAL;
> > > > > >  }
> > > > > > @@ -1499,6 +1710,8 @@ int gpiochip_add_data_with_key(struct gpi=
o_chip *chip, void *data,
> > > > > >       for (i =3D 0; i < chip->ngpio; i++)
> > > > > >               gdev->descs[i].gdev =3D gdev;
> > > > > >
> > > > > > +     ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
> > > > > > +
> > > > > >  #ifdef CONFIG_PINCTRL
> > > > > >       INIT_LIST_HEAD(&gdev->pin_ranges);
> > > > > >  #endif
> > > > > > @@ -2837,6 +3050,8 @@ static int gpiod_request_commit(struct gp=
io_desc *desc, const char *label)
> > > > > >               spin_lock_irqsave(&gpio_lock, flags);
> > > > > >       }
> > > > > >  done:
> > > > > > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > > > +                                GPIOLINE_CHANGED_REQUESTED, de=
sc);
> > > > > >       spin_unlock_irqrestore(&gpio_lock, flags);
> > > > > >       return ret;
> > > > > >  }
> > > > > > @@ -2934,6 +3149,8 @@ static bool gpiod_free_commit(struct gpio=
_desc *desc)
> > > > > >               ret =3D true;
> > > > > >       }
> > > > > >
> > > > > > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > > > +                                GPIOLINE_CHANGED_RELEASED, des=
c);
> > > > > >       spin_unlock_irqrestore(&gpio_lock, flags);
> > > > > >       return ret;
> > > > > >  }
> > > > > > @@ -3097,6 +3314,7 @@ static int gpio_set_bias(struct gpio_chip=
 *chip, struct gpio_desc *desc)
> > > > > >               if (ret !=3D -ENOTSUPP)
> > > > > >                       return ret;
> > > > > >       }
> > > > > > +
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> > > > > > index a1cbeabadc69..8e3969616cfe 100644
> > > > > > --- a/drivers/gpio/gpiolib.h
> > > > > > +++ b/drivers/gpio/gpiolib.h
> > > > > > @@ -54,6 +54,7 @@ struct gpio_device {
> > > > > >       const char              *label;
> > > > > >       void                    *data;
> > > > > >       struct list_head        list;
> > > > > > +     struct atomic_notifier_head notifier;
> > > > > >
> > > > > >  #ifdef CONFIG_PINCTRL
> > > > > >       /*
> > > > > > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpi=
o.h
> > > > > > index 799cf823d493..c61429467dd4 100644
> > > > > > --- a/include/uapi/linux/gpio.h
> > > > > > +++ b/include/uapi/linux/gpio.h
> > > > > > @@ -59,6 +59,40 @@ struct gpioline_info {
> > > > > >  /* Maximum number of requested handles */
> > > > > >  #define GPIOHANDLES_MAX 64
> > > > > >
> > > > > > +/**
> > > > > > + * struct gpioline_changed_fd_request - Information about a li=
nechanged fd
> > > > > > + * request
> > > > > > + * @lineoffsets: an array of desired lines, specified by offse=
t index for the
> > > > > > + * associated GPIO device
> > > > > > + * @num_lines: number of lines requested in this request, i.e.=
 the number of
> > > > > > + * valid fields in the above arrays, set to 1 to request a sin=
gle line
> > > > > > + * @fd: if successful this field will contain a valid anonymou=
s file handle
> > > > > > + */
> > > > > > +struct gpioline_changed_fd_request {
> > > > > > +     __u32 lineoffsets[GPIOHANDLES_MAX];
> > > > > > +     __u32 num_lines;
> > > > > > +     int fd;
> > > > > > +};
> > > > > > +
> > > > >
> > > > > Wouldn't the most common case be to watch all the lines on a chip=
?
> > > > > How about an easy way to do that, say num_lines=3D0?
> > > > >
> > > >
> > > > IMO this is too implicit - it's literally a magic value. I'd prefer=
 to
> > > > keep it this way for the same reason I didn't want to have implicit
> > > > BIAS settings. I prefer the kernel uAPI to be explicit and then we =
can
> > > > wrap it in simple helpers in the library.
> > > >
> > >
> > > Or you could add a watch_all flag to make it explicit.
> > > But fair enough to leave as is - it probably keeps the kernel cleaner=
.
> > >
> > > > > > +/* Possible line status change events */
> > > > > > +enum {
> > > > > > +     GPIOLINE_CHANGED_REQUESTED =3D 1,
> > > > > > +     GPIOLINE_CHANGED_RELEASED,
> > > > > > +     GPIOLINE_CHANGED_CONFIG,
> > > > > > +};
> > > > > > +
> > > > > > +/**
> > > > > > + * struct gpioline_changed - Information about a change in sta=
tus
> > > > > > + * of a GPIO line
> > > > > > + * @line_offset: offset of the line that changed relative to t=
he gpiochip
> > > > > > + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CH=
ANGED_RELEASED
> > > > > > + * and GPIOLINE_CHANGED_CONFIG
> > > > > > + */
> > > > > > +struct gpioline_changed {
> > > > > > +     __u32 line_offset;
> > > > > > +     __u32 event_type;
> > > > > > +};
> > > > > > +
> > > > >
> > > > > Rather than sending an event type, and requiring userspace to pol=
l
> > > > > LINEINFO, which is racy, how about passing the updated info flags=
 here?
> > > > > A change in the state of the GPIOLINE_FLAG_KERNEL implies the
> > > > > GPIOLINE_CHANGED_REQUESTED or GPIOLINE_CHANGED_RELEASED, so the
> > > > > event_type is then redundant.
> > > > > Userspace would then only have to poll LINEINFO if they were inte=
rested
> > > > > in the consumer on GPIOLINE_CHANGED_REQUESTED.
> > > > >
> > > > > To sync kernel and userspace state the current state of each line
> > > > > should be returned immediately via the fd as soon as the fd is cr=
eated,
> > > > > and then subsequently on any change.
> > > > >
> > > >
> > > > I guess you're right. You even made me think we could go as far as =
to
> > > > embed the whole gpioline_info structure in struct gpioline_changed.
> > > > I'd still keep the event type though - otherwise we'd have to assum=
e
> > > > the user always calls LINEINFO_IOCTL before obtaining the LINECHANG=
ED
> > > > fd.
> > > >
> > >
> > > I suggested sending the current state of each line as soon as the fd
> > > is created so that you don't have to assume anything.  That initial c=
hange
> > > report is effectively the same as having the user call LINEINFO on ea=
ch
> > > line at the same time - without all the race issues.
> > >
> >
> > Right, I didn't get this. That means you'd have to call the ioctl()
> > and immediately follow up with a read(). I'm not a fan of this.
> > Especially if we were to include a timestamp - what would it refer to?
> >
> > > I also considered the full gpioline_info structure, as well as report=
ing
> > > bulk line changes (replacing line_offset with lineoffsets and num_lin=
es),
> > > but then I thought it was probably better to keep it minimal and simp=
le.
> > > The name and consumer are relatively large.
> >
> > In terms of performance - we're not really degrading it as this is
> > still not a lot of data.
> >
> > How about the following:
> > 1. Move the code filling out the struct gpioline_info to a separate
> > function in the kernel.
> > 2. Call the new ioctl() GET_LINEINFO_FD to indicate it's an extension
> > of GET_LINEINFO.
> > 3. Embed struct gpioline_info in struct gpioline_info_fd so that the
> > initial info be read when the file descriptor is created.
> > 4. Likewise embed struct gpioline_info in struct gpioline_changed and
> > on every status change event provide the whole set of information?
> >
>
> You mean an array of info in the ioctl return, along with the fd?
> That would work too.

I overlooked the fact that we can watch multiple lines. In this case
it's either a separate fd for every watched line (not optimal) or
doing what you proposed: read the initial lineinfo directly from the
fd. But in this case again: what about the timestamp?

Bart

>
> I'm used to setting up streams like this in a networked environment
> where returning data via the stream setup isn't an option, the only
> option is to sync via the stream itself, so I overlooked the possibility
> of using the ioctl return.
>
> > > The name is immutable(??), and so is pointless to include.
> >
> > It is now, but let's be future-proof. I can imagine having modifiable
> > line names in the future. The code putting this info in struct
> > gpioline_info wouldn't be really duplicated and the size of such small
> > structures doesn't matter much - it's still a single context switch to
> > read it.
> >
> > > The consumer only changes when the line is requested, so I was willin=
g
> > > to live with still having to poll for that.
> > > And what you gain by reporting bulk lines you might lose in increased
> > > report size and associated code.  OTOH it would make it explicit whic=
h
> > > lines are being changed together...
> > > So I could well be wrong on that - a full bulk report may be better.
> >
> > I'm not sure we need bulk reporting - just as we don't provide bulk
> > GET_GPIOLINE_INFO. The corresponding ioctl() structure would get
> > pretty complicated soon.
> >
>
> That was my initial feeling as well.
> And bulk is no longer an option if you want to include name in the change
> report.
>
> Kent.
>
> > Bartosz
> >
> > >
> > > Kent.
> > >
> > > > > And a timestamp might be useful, as per gpioevent_data?
> > > >
> > > > Sure thing!
> > > >
> > > > Bart
> > > >
> > > > >
> > > > > Kent.
> > > > >
> > > > > >  /* Linerequest flags */
> > > > > >  #define GPIOHANDLE_REQUEST_INPUT     (1UL << 0)
> > > > > >  #define GPIOHANDLE_REQUEST_OUTPUT    (1UL << 1)
> > > > > > @@ -176,6 +210,8 @@ struct gpioevent_data {
> > > > > >
> > > > > >  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpioch=
ip_info)
> > > > > >  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpiol=
ine_info)
> > > > > > +#define GPIO_GET_LINECHANGED_FD_IOCTL \
> > > > > > +             _IOWR(0xB4, 0x0b, struct gpioline_changed_fd_requ=
est)
> > > > > >  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpi=
ohandle_request)
> > > > > >  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpio=
event_request)
> > > > > >
> > > > > > --
> > > > > > 2.23.0
> > > > > >
