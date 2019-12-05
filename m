Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E102113FAE
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 11:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729345AbfLEKuz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 05:50:55 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:33549 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729041AbfLEKuz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 05:50:55 -0500
Received: by mail-il1-f196.google.com with SMTP id r81so2604591ilk.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2019 02:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9BdHzs9O4amv4O1LyS6C8atucVQFEyL5BJWdTBk2m0s=;
        b=zN7Oc4OOhyO49lvahOqaj/byV4m7Aka0azhiGbZDv//1fM8Fnvb05a96GgWzSaNMJt
         /fyUAVWQQTxPOvKFrzsaCoZ8icxMbneRMoxWZEjTfyNOTpod0leQYVNILazwljM1vgA2
         RZqW2OOvpoFkLx3pEhKU7GmbLIoFOWaMWGPsBLsP4+zWh2HuInjBBxCBtU1ZtmYCGHbQ
         s5fBoRsD1DW2xrXSXEmX0P299wQl+bg7jE8Cpp5bbwqsinWSQ2XjzbjEJ1IxneOGO57W
         z9YaUMhH74NCkcU6du0oqIlnCAYy9lZ5Q+C7zYNnr25BwawpODOSG6ohfZYbXFcJUIK9
         LUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9BdHzs9O4amv4O1LyS6C8atucVQFEyL5BJWdTBk2m0s=;
        b=a1q+aVuh+E2mZ650gIYNUghUeN3vKT9K7FqrM0X7a+yV7G82h++JJlRgPwQmXFFrSZ
         2s2FbL3wrQo6f3UFTgtNQjstAjAP7qwcD6nuZFjwqAwLuDDzaJZYwrdFde0XnBZP1k+9
         Z8LhGIXldLIHyZ9GBIY5TvnAQRXw+LmDwWx1hI+aTi3db2S2fxurTnAfANp+c7UMv8iB
         dIT5wlgKQ9eJcUSuoStgQbsJIGuTrRXFBA84hv1w2Fez3itCgIHudYiE06jxyzwjDfb7
         8To4GiHS5MS+iWelnrkt+SOhWN1QnytxBBr/TAQc7zzQlpyvzKvgkabXVss+h5OLF6mH
         2d7w==
X-Gm-Message-State: APjAAAVm2Z+EE33VfGFJ+pqYVPl9qPGwa92EYJomQQ01orwP5/uzjrL8
        VqubopIu0OdI8iJElZkLXw+jQFMLzhgaSkhlHrSS1w==
X-Google-Smtp-Source: APXvYqxPjSnO/Y6qu+9Pk9B0sYfjXvJs4yIXhHSqt0Muh49VYKyktABljrowLdMK4Sa0rdJY6D0jUXrKHln30xWTYC8=
X-Received: by 2002:a92:96c2:: with SMTP id g185mr8264405ilh.40.1575543054004;
 Thu, 05 Dec 2019 02:50:54 -0800 (PST)
MIME-Version: 1.0
References: <20191204155941.17814-1-brgl@bgdev.pl> <20191205104728.GA9443@sol>
In-Reply-To: <20191205104728.GA9443@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 Dec 2019 11:50:42 +0100
Message-ID: <CAMRc=MePnUaLku6sL2aH1GRrsCKCvtXaF5+7GRWG102OQiAKFg@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] gpiolib: add new ioctl() for monitoring changes
 in line info
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

czw., 5 gru 2019 o 11:47 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> On Wed, Dec 04, 2019 at 04:59:40PM +0100, Bartosz Golaszewski wrote:
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
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  drivers/gpio/gpiolib.c    | 177 ++++++++++++++++++++++++++++++++++++--
> >  drivers/gpio/gpiolib.h    |   2 +
> >  include/uapi/linux/gpio.h |  24 ++++++
> >  3 files changed, 195 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 711963aa9239..2ff15ef0bbe0 100644
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
> > @@ -1199,14 +1202,24 @@ static void gpio_desc_to_lineinfo(struct gpio_d=
esc *desc,
> >       spin_unlock_irqrestore(&gpio_lock, flags);
> >  }
> >
> > +struct gpio_chardev_data {
> > +     struct gpio_device *gdev;
> > +     wait_queue_head_t wait;
> > +     DECLARE_KFIFO(events, struct gpioline_info_changed, 32);
> > +     struct notifier_block lineinfo_changed_nb;
> > +};
> > +
> >  /*
> >   * gpio_ioctl() - ioctl handler for the GPIO chardev
> >   */
> >  static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned l=
ong arg)
> >  {
> > -     struct gpio_device *gdev =3D filp->private_data;
> > +     struct gpio_chardev_data *priv =3D filp->private_data;
> > +     struct gpio_device *gdev =3D priv->gdev;
> >       struct gpio_chip *chip =3D gdev->chip;
> >       void __user *ip =3D (void __user *)arg;
> > +     struct gpio_desc *desc;
> > +     __u32 offset;
> >
> >       /* We fail any subsequent ioctl():s when the chip is gone */
> >       if (!chip)
> > @@ -1228,9 +1241,9 @@ static long gpio_ioctl(struct file *filp, unsigne=
d int cmd, unsigned long arg)
> >               if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
> >                       return -EFAULT;
> >               return 0;
> > -     } else if (cmd =3D=3D GPIO_GET_LINEINFO_IOCTL) {
> > +     } else if (cmd =3D=3D GPIO_GET_LINEINFO_IOCTL ||
> > +                cmd =3D=3D GPIO_GET_LINEINFO_WATCH_IOCTL) {
> >               struct gpioline_info lineinfo;
> > -             struct gpio_desc *desc;
> >
> >               if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
> >                       return -EFAULT;
> > @@ -1243,11 +1256,25 @@ static long gpio_ioctl(struct file *filp, unsig=
ned int cmd, unsigned long arg)
> >
> >               if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
> >                       return -EFAULT;
> > +
> > +             if (cmd =3D=3D GPIO_GET_LINEINFO_WATCH_IOCTL)
> > +                     set_bit(FLAG_WATCHED, &desc->flags);
> > +
>
> The WATCHED flag is stored globally in the gdev->descs?
> Shouldn't it be stored in struct gpio_chardev_data?
> Otherwise I can open the chip and disable your watches.
>

Yes, I feel stupid now. :)

Of course. I guess a bitmap for all the lines as part of the
chardev_data will be fine.

Bart

> Kent.
>
>
> >               return 0;
> >       } else if (cmd =3D=3D GPIO_GET_LINEHANDLE_IOCTL) {
> >               return linehandle_create(gdev, ip);
> >       } else if (cmd =3D=3D GPIO_GET_LINEEVENT_IOCTL) {
> >               return lineevent_create(gdev, ip);
> > +     } else if (cmd =3D=3D GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
> > +             if (copy_from_user(&offset, ip, sizeof(offset)))
> > +                     return -EFAULT;
> > +
> > +             desc =3D gpiochip_get_desc(chip, offset);
> > +             if (IS_ERR(desc))
> > +                     return PTR_ERR(desc);
> > +
> > +             clear_bit(FLAG_WATCHED, &desc->flags);
> > +             return 0;
> >       }
> >       return -EINVAL;
> >  }
> > @@ -1260,6 +1287,99 @@ static long gpio_ioctl_compat(struct file *filp,=
 unsigned int cmd,
> >  }
> >  #endif
> >
> > +static struct gpio_chardev_data *
> > +to_gpio_chardev_data(struct notifier_block *nb)
> > +{
> > +     return container_of(nb, struct gpio_chardev_data, lineinfo_change=
d_nb);
> > +}
> > +
> > +static int lineinfo_changed_notify(struct notifier_block *nb,
> > +                                unsigned long action, void *data)
> > +{
> > +     struct gpio_chardev_data *priv =3D to_gpio_chardev_data(nb);
> > +     struct gpioline_info_changed chg;
> > +     struct gpio_desc *desc =3D data;
> > +     int ret =3D NOTIFY_DONE;
> > +
> > +     if (test_bit(FLAG_WATCHED, &desc->flags)) {
> > +             memset(&chg, 0, sizeof(chg));
> > +             chg.info.line_offset =3D gpio_chip_hwgpio(desc);
> > +             chg.event_type =3D action;
> > +             chg.timestamp =3D ktime_get_real_ns();
> > +             gpio_desc_to_lineinfo(desc, &chg.info);
> > +
> > +             ret =3D kfifo_in_spinlocked(&priv->events, &chg,
> > +                                       1, &priv->wait.lock);
> > +             if (ret)
> > +                     wake_up_poll(&priv->wait, EPOLLIN);
> > +             else
> > +                     pr_debug_ratelimited(
> > +                             "%s: lineinfo event FIFO is full - event =
dropped\n",
> > +                             __func__);
> > +
> > +             ret =3D NOTIFY_OK;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static __poll_t lineinfo_watch_poll(struct file *filep,
> > +                                 struct poll_table_struct *pollt)
> > +{
> > +     struct gpio_chardev_data *priv =3D filep->private_data;
> > +     __poll_t events =3D 0;
> > +
> > +     poll_wait(filep, &priv->wait, pollt);
> > +
> > +     spin_lock(&priv->wait.lock);
> > +     if (!kfifo_is_empty(&priv->events))
> > +             events =3D EPOLLIN | EPOLLRDNORM;
> > +     spin_unlock(&priv->wait.lock);
> > +
> > +     return events;
> > +}
> > +
> > +static ssize_t lineinfo_watch_read(struct file *filep, char __user *bu=
f,
> > +                                size_t count, loff_t *off)
> > +{
> > +     struct gpio_chardev_data *priv =3D filep->private_data;
> > +     struct gpioline_info_changed event;
> > +     int ret;
> > +
> > +     if (count < sizeof(event))
> > +             return -EINVAL;
> > +
> > +     for (;;) {
> > +             spin_lock(&priv->wait.lock);
> > +             if (kfifo_is_empty(&priv->events)) {
> > +                     if (filep->f_flags & O_NONBLOCK) {
> > +                             spin_unlock(&priv->wait.lock);
> > +                             return -EAGAIN;
> > +                     }
> > +
> > +                     ret =3D wait_event_interruptible_locked(priv->wai=
t,
> > +                                     !kfifo_is_empty(&priv->events));
> > +                     if (ret) {
> > +                             spin_unlock(&priv->wait.lock);
> > +                             return ret;
> > +                     }
> > +             }
> > +
> > +             ret =3D kfifo_out(&priv->events, &event, 1);
> > +             spin_unlock(&priv->wait.lock);
> > +             if (ret =3D=3D 1)
> > +                     break;
> > +
> > +             /* We should never get here. See lineevent_read(). */
> > +     }
> > +
> > +     ret =3D copy_to_user(buf, &event, sizeof(event));
> > +     if (ret)
> > +             return -EFAULT;
> > +
> > +     return sizeof(event);
> > +}
> > +
> >  /**
> >   * gpio_chrdev_open() - open the chardev for ioctl operations
> >   * @inode: inode for this chardev
> > @@ -1270,14 +1390,42 @@ static int gpio_chrdev_open(struct inode *inode=
, struct file *filp)
> >  {
> >       struct gpio_device *gdev =3D container_of(inode->i_cdev,
> >                                             struct gpio_device, chrdev)=
;
> > +     struct gpio_chardev_data *priv;
> > +     int ret;
> >
> >       /* Fail on open if the backing gpiochip is gone */
> >       if (!gdev->chip)
> >               return -ENODEV;
> > +
> > +     priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     init_waitqueue_head(&priv->wait);
> > +     INIT_KFIFO(priv->events);
> > +     priv->gdev =3D gdev;
> > +
> > +     priv->lineinfo_changed_nb.notifier_call =3D lineinfo_changed_noti=
fy;
> > +     ret =3D atomic_notifier_chain_register(&gdev->notifier,
> > +                                          &priv->lineinfo_changed_nb);
> > +     if (ret)
> > +             goto out_free_priv;
> > +
> >       get_device(&gdev->dev);
> > -     filp->private_data =3D gdev;
> > +     filp->private_data =3D priv;
> > +
> > +     ret =3D nonseekable_open(inode, filp);
> > +     if (ret)
> > +             goto out_unregister_notifier;
> >
> > -     return nonseekable_open(inode, filp);
> > +     return ret;
> > +
> > +out_unregister_notifier:
> > +     atomic_notifier_chain_unregister(&gdev->notifier,
> > +                                      &priv->lineinfo_changed_nb);
> > +out_free_priv:
> > +     kfree(priv);
> > +     return ret;
> >  }
> >
> >  /**
> > @@ -1288,17 +1436,22 @@ static int gpio_chrdev_open(struct inode *inode=
, struct file *filp)
> >   */
> >  static int gpio_chrdev_release(struct inode *inode, struct file *filp)
> >  {
> > -     struct gpio_device *gdev =3D container_of(inode->i_cdev,
> > -                                           struct gpio_device, chrdev)=
;
> > +     struct gpio_chardev_data *priv =3D filp->private_data;
> > +     struct gpio_device *gdev =3D priv->gdev;
> >
> > +     atomic_notifier_chain_unregister(&gdev->notifier,
> > +                                      &priv->lineinfo_changed_nb);
> >       put_device(&gdev->dev);
> > +     kfree(priv);
> > +
> >       return 0;
> >  }
> >
> > -
> >  static const struct file_operations gpio_fileops =3D {
> >       .release =3D gpio_chrdev_release,
> >       .open =3D gpio_chrdev_open,
> > +     .poll =3D lineinfo_watch_poll,
> > +     .read =3D lineinfo_watch_read,
> >       .owner =3D THIS_MODULE,
> >       .llseek =3D no_llseek,
> >       .unlocked_ioctl =3D gpio_ioctl,
> > @@ -1509,6 +1662,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
chip, void *data,
> >       for (i =3D 0; i < chip->ngpio; i++)
> >               gdev->descs[i].gdev =3D gdev;
> >
> > +     ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
> > +
> >  #ifdef CONFIG_PINCTRL
> >       INIT_LIST_HEAD(&gdev->pin_ranges);
> >  #endif
> > @@ -2848,6 +3003,8 @@ static int gpiod_request_commit(struct gpio_desc =
*desc, const char *label)
> >       }
> >  done:
> >       spin_unlock_irqrestore(&gpio_lock, flags);
> > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > +                                GPIOLINE_CHANGED_REQUESTED, desc);
> >       return ret;
> >  }
> >
> > @@ -2945,6 +3102,9 @@ static bool gpiod_free_commit(struct gpio_desc *d=
esc)
> >       }
> >
> >       spin_unlock_irqrestore(&gpio_lock, flags);
> > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > +                                GPIOLINE_CHANGED_RELEASED, desc);
> > +
> >       return ret;
> >  }
> >
> > @@ -3107,6 +3267,7 @@ static int gpio_set_bias(struct gpio_chip *chip, =
struct gpio_desc *desc)
> >               if (ret !=3D -ENOTSUPP)
> >                       return ret;
> >       }
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> > index a1cbeabadc69..4fca77241fb0 100644
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
> > @@ -112,6 +113,7 @@ struct gpio_desc {
> >  #define FLAG_PULL_UP    13   /* GPIO has pull up enabled */
> >  #define FLAG_PULL_DOWN  14   /* GPIO has pull down enabled */
> >  #define FLAG_BIAS_DISABLE    15      /* GPIO has pull disabled */
> > +#define FLAG_WATCHED 16      /* GPIO line is being watched by user-spa=
ce */
> >
> >       /* Connection label */
> >       const char              *label;
> > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > index 799cf823d493..2401028ae7de 100644
> > --- a/include/uapi/linux/gpio.h
> > +++ b/include/uapi/linux/gpio.h
> > @@ -59,6 +59,28 @@ struct gpioline_info {
> >  /* Maximum number of requested handles */
> >  #define GPIOHANDLES_MAX 64
> >
> > +/* Possible line status change events */
> > +enum {
> > +     GPIOLINE_CHANGED_REQUESTED =3D 1,
> > +     GPIOLINE_CHANGED_RELEASED,
> > +     GPIOLINE_CHANGED_CONFIG,
> > +};
> > +
> > +/**
> > + * struct gpioline_info_changed - Information about a change in status
> > + * of a GPIO line
> > + * @timestamp: estimate of time of status change occurrence, in nanose=
conds
> > + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RE=
LEASED
> > + * and GPIOLINE_CHANGED_CONFIG
> > + * @info: updated line information
> > + */
> > +struct gpioline_info_changed {
> > +     __u64 timestamp;
> > +     __u32 event_type;
> > +     struct gpioline_info info;
> > +     __u32 padding[4]; /* for future use */
> > +};
> > +
> >  /* Linerequest flags */
> >  #define GPIOHANDLE_REQUEST_INPUT     (1UL << 0)
> >  #define GPIOHANDLE_REQUEST_OUTPUT    (1UL << 1)
> > @@ -176,6 +198,8 @@ struct gpioevent_data {
> >
> >  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
> >  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info=
)
> > +#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0b, struct gpiolin=
e_info)
> > +#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0c, __u32)
> >  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_=
request)
> >  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_re=
quest)
> >
> > --
> > 2.23.0
> >
