Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 138A910CA25
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 15:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfK1OKg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 09:10:36 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:45231 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfK1OKg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 09:10:36 -0500
Received: by mail-pj1-f68.google.com with SMTP id r11so4106781pjp.12;
        Thu, 28 Nov 2019 06:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Ebf+lGW0nrCbgdHSi/obLJen/EWBHlLFpEyfvtSUiZA=;
        b=dQyzBwAChV+R23PH0lAdDLR/L4CfvbpqnX1F4CncQQ8G4t5Kd8ccMvL4zGOHzFzyfX
         ZeBAX0aaFQB7IwTnLLFCIf5aysbgojpJDiLk1TyvK1OgQ0EkzbYzxCSOmT/kmkri67hg
         s+1X44h/QnkB17hz06OfS7eaSdihzgCoCvymWPSq5lUmO61AgJzjryS50wUcuH7sq50F
         znSU4962P/3wKvecJx8+39T7Il/ZJtgv+RAftzE99Qc6YGoVdptA4/S4wM4qmft9IGI0
         hHmQABNFIxd8srWGHLRTjQp/Ge8Izq8rgigOKnqjG5/COdqjIQfPtvCDCm2umf4cckN5
         7RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Ebf+lGW0nrCbgdHSi/obLJen/EWBHlLFpEyfvtSUiZA=;
        b=jW2GBMgvQXv2nHGQOCcIEV+q4qUj1GguFEEZUvixR8YLwawV0MWje6UIN9GUb+Oh0M
         IvXXvh1igKwd+vG75wAhxVXVAJgnssIewMtOkvAH5z/C34rtxvGNNFphotY/Ub1ItpwZ
         r+Btch52gMtnLWsb9Kvhrt+DPcns/zSdFwR+gGjdGIlEqcWroWintJfoHU/uje658O+t
         su1tHv2t0ALeGVjeFihvc8iM+Td6N8yrXhBdr0QKnC83gSDPFwkvR/PSIIoyrzf9HQxU
         rC0vMQPSUSIRgIaUI6OsqT9Sz6cDR5Oe5SHWIw51qxiYEz0RmQV4hbBhPflHbkfEkGFQ
         H5mg==
X-Gm-Message-State: APjAAAUoLF2RYzyI+Igoo9k6IXkI44oGcro68nDovScA/sI5LsaQ7joz
        RO6mE6jZ+bjuzhh1uvJRfc4=
X-Google-Smtp-Source: APXvYqzC3zXFmlMP0/AvuUJFjrdHtHI0tnhPOCBkRmqMMF/rhWmzEZe0x0SufjGoQkfWuElnLC/IHg==
X-Received: by 2002:a17:90a:2947:: with SMTP id x7mr12743649pjf.136.1574950234610;
        Thu, 28 Nov 2019 06:10:34 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id w5sm9936930pgb.78.2019.11.28.06.10.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2019 06:10:34 -0800 (PST)
Date:   Thu, 28 Nov 2019 22:10:28 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 7/8] gpiolib: add new ioctl() for monitoring changes in
 line info
Message-ID: <20191128141028.GA15454@sol>
References: <20191127133510.10614-1-brgl@bgdev.pl>
 <20191127133510.10614-8-brgl@bgdev.pl>
 <20191127152410.GA24936@sol>
 <CAMRc=MdLnZFJQ+qMJSiSQSh6pOnKpLeU79u9ymA7HaujgK0kcg@mail.gmail.com>
 <20191127232330.GA3761@sol>
 <CAMRc=Me5kNUuPQCTM_H=2QjUL=7R-ii+uRvdNvAz3SqL_sPzcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me5kNUuPQCTM_H=2QjUL=7R-ii+uRvdNvAz3SqL_sPzcQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 28, 2019 at 10:45:46AM +0100, Bartosz Golaszewski wrote:
> czw., 28 lis 2019 o 00:23 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Wed, Nov 27, 2019 at 04:50:43PM +0100, Bartosz Golaszewski wrote:
> > > śr., 27 lis 2019 o 16:24 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > On Wed, Nov 27, 2019 at 02:35:09PM +0100, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > >
> > > > > Currently there is no way for user-space to be informed about changes
> > > > > in status of GPIO lines e.g. when someone else requests the line or its
> > > > > config changes. We can only periodically re-read the line-info. This
> > > > > is fine for simple one-off user-space tools, but any daemon that provides
> > > > > a centralized access to GPIO chips would benefit hugely from an event
> > > > > driven line info synchronization.
> > > > >
> > > > > This patch adds a new ioctl() that allows user-space processes to retrieve
> > > > > a file-descriptor for given GPIO lines which can be polled for line status
> > > > > change events.
> > > > >
> > > > > Currently the events are generated on three types of status changes: when
> > > > > a line is requested, when it's released and when its config is changed.
> > > > > The first two are self-explanatory. For the third one: this will only
> > > > > happen when another user-space process calls the new SET_CONFIG ioctl()
> > > > > as any changes that can happen from within the kernel (i.e.
> > > > > set_transitory() or set_debounce()) are of no interest to user-space.
> > > > >
> > > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > ---
> > > > >  drivers/gpio/gpiolib.c    | 218 ++++++++++++++++++++++++++++++++++++++
> > > > >  drivers/gpio/gpiolib.h    |   1 +
> > > > >  include/uapi/linux/gpio.h |  36 +++++++
> > > > >  3 files changed, 255 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > > index d094b1be334d..be5df4bdf44b 100644
> > > > > --- a/drivers/gpio/gpiolib.c
> > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > @@ -547,6 +547,9 @@ static long linehandle_set_config(struct linehandle_state *lh,
> > > > >                       if (ret)
> > > > >                               return ret;
> > > > >               }
> > > > > +
> > > > > +             atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > > +                                        GPIOLINE_CHANGED_CONFIG, desc);
> > > > >       }
> > > > >       return 0;
> > > > >  }
> > > > > @@ -1148,6 +1151,212 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
> > > > >       return ret;
> > > > >  }
> > > > >
> > > > > +struct linechanged_fd_state {
> > > > > +     struct gpio_device *gdev;
> > > > > +     struct gpio_desc *descs[GPIOHANDLES_MAX];
> > > > > +     size_t numdescs;
> > > > > +     wait_queue_head_t waitqueue;
> > > > > +     DECLARE_KFIFO(events, struct gpioline_changed, 16);
> > > > > +     struct mutex lock;
> > > > > +     struct notifier_block changed_nb;
> > > > > +};
> > > > > +
> > > > > +static int linechanged_fd_release(struct inode *inode, struct file *filep)
> > > > > +{
> > > > > +     struct linechanged_fd_state *lc_state = filep->private_data;
> > > > > +
> > > > > +     atomic_notifier_chain_unregister(&lc_state->gdev->notifier,
> > > > > +                                      &lc_state->changed_nb);
> > > > > +     put_device(&lc_state->gdev->dev);
> > > > > +     kfree(lc_state);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static __poll_t linechanged_fd_poll(struct file *filep,
> > > > > +                                 struct poll_table_struct *pollt)
> > > > > +{
> > > > > +     struct linechanged_fd_state *lc_state = filep->private_data;
> > > > > +     __poll_t events = 0;
> > > > > +
> > > > > +     poll_wait(filep, &lc_state->waitqueue, pollt);
> > > > > +
> > > > > +     mutex_lock(&lc_state->lock);
> > > > > +     if (!kfifo_is_empty(&lc_state->events))
> > > > > +             events = EPOLLIN | EPOLLRDNORM;
> > > > > +     mutex_unlock(&lc_state->lock);
> > > > > +
> > > > > +     return events;
> > > > > +}
> > > > > +
> > > > > +static ssize_t linechanged_fd_read(struct file *filep, char __user *buf,
> > > > > +                                size_t count, loff_t *off)
> > > > > +{
> > > > > +     struct linechanged_fd_state *lc_state = filep->private_data;
> > > > > +     unsigned int copied;
> > > > > +     int ret;
> > > > > +
> > > > > +     if (count < sizeof(struct gpioline_changed))
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     do {
> > > > > +             mutex_lock(&lc_state->lock);
> > > > > +             if (kfifo_is_empty(&lc_state->events)) {
> > > > > +                     mutex_unlock(&lc_state->lock);
> > > > > +                     if (filep->f_flags & O_NONBLOCK)
> > > > > +                             return -EAGAIN;
> > > > > +
> > > > > +                     ret = wait_event_interruptible(lc_state->waitqueue,
> > > > > +                                     !kfifo_is_empty(&lc_state->events));
> > > > > +                     if (ret)
> > > > > +                             return ret;
> > > > > +             } else {
> > > > > +                     mutex_unlock(&lc_state->lock);
> > > > > +             }
> > > > > +
> > > > > +             if (mutex_lock_interruptible(&lc_state->lock))
> > > > > +                     return -ERESTARTSYS;
> > > > > +
> > > > > +             ret = kfifo_to_user(&lc_state->events, buf, count, &copied);
> > > > > +             mutex_unlock(&lc_state->lock);
> > > > > +             if (ret)
> > > > > +                     return ret;
> > > > > +
> > > > > +             if (copied == 0 && (filep->f_flags & O_NONBLOCK))
> > > > > +                     return -EAGAIN;
> > > > > +     } while (copied == 0);
> > > > > +
> > > > > +     return copied;
> > > > > +}
> > > > > +
> > > > > +static const struct file_operations linechanged_fd_fileops = {
> > > > > +     .release = linechanged_fd_release,
> > > > > +     .owner = THIS_MODULE,
> > > > > +     .llseek = noop_llseek,
> > > > > +     .poll = linechanged_fd_poll,
> > > > > +     .read = linechanged_fd_read,
> > > > > +};
> > > > > +
> > > > > +static struct linechanged_fd_state *
> > > > > +to_linechanged_fd_state(struct notifier_block *nb)
> > > > > +{
> > > > > +     return container_of(nb, struct linechanged_fd_state, changed_nb);
> > > > > +}
> > > > > +
> > > > > +static int linechanged_fd_notify(struct notifier_block *nb,
> > > > > +                              unsigned long action, void *data)
> > > > > +{
> > > > > +     struct linechanged_fd_state *lc_state = to_linechanged_fd_state(nb);
> > > > > +     struct gpio_desc *desc = data;
> > > > > +     struct gpioline_changed chg;
> > > > > +     int i, ret;
> > > > > +
> > > > > +     for (i = 0; i < lc_state->numdescs; i++) {
> > > > > +             /* Are we watching this desc? */
> > > > > +             if (desc == lc_state->descs[i]) {
> > > > > +                     /* Yes - prepare the event. */
> > > > > +                     memset(&chg, 0, sizeof(chg));
> > > > > +                     chg.line_offset = gpio_chip_hwgpio(desc);
> > > > > +                     chg.event_type = action;
> > > > > +
> > > > > +                     mutex_lock(&lc_state->lock);
> > > > > +                     ret = kfifo_put(&lc_state->events, chg);
> > > > > +                     mutex_unlock(&lc_state->lock);
> > > > > +                     if (ret)
> > > > > +                             wake_up_poll(&lc_state->waitqueue, EPOLLIN);
> > > > > +
> > > > > +                     return NOTIFY_OK;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     return NOTIFY_DONE;
> > > > > +}
> > > > > +
> > > > > +static int linechanged_fd_create(struct gpio_device *gdev, void __user *ip)
> > > > > +{
> > > > > +     struct gpioline_changed_fd_request changed_req;
> > > > > +     struct linechanged_fd_state *lc_state;
> > > > > +     struct gpio_desc *desc;
> > > > > +     struct file *file;
> > > > > +     int ret, i, fd;
> > > > > +     u32 offset;
> > > > > +
> > > > > +     ret = copy_from_user(&changed_req, ip, sizeof(changed_req));
> > > > > +     if (ret)
> > > > > +             return -EFAULT;
> > > > > +
> > > > > +     if ((changed_req.num_lines == 0) ||
> > > > > +         (changed_req.num_lines > GPIOHANDLES_MAX))
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     lc_state = kzalloc(sizeof(*lc_state), GFP_KERNEL);
> > > > > +     if (!lc_state)
> > > > > +             return -ENOMEM;
> > > > > +
> > > > > +     lc_state->gdev = gdev;
> > > > > +     get_device(&gdev->dev);
> > > > > +
> > > > > +     for (i = 0; i < changed_req.num_lines; i++) {
> > > > > +             offset = changed_req.lineoffsets[i];
> > > > > +             desc = gpiochip_get_desc(gdev->chip, offset);
> > > > > +             if (IS_ERR(desc)) {
> > > > > +                     ret = PTR_ERR(desc);
> > > > > +                     goto out_free_lc_state;
> > > > > +             }
> > > > > +
> > > > > +             lc_state->descs[i] = desc;
> > > > > +     }
> > > > > +
> > > > > +     lc_state->numdescs = changed_req.num_lines;
> > > > > +
> > > > > +     init_waitqueue_head(&lc_state->waitqueue);
> > > > > +     INIT_KFIFO(lc_state->events);
> > > > > +     mutex_init(&lc_state->lock);
> > > > > +
> > > > > +     lc_state->changed_nb.notifier_call = linechanged_fd_notify;
> > > > > +
> > > > > +     ret = atomic_notifier_chain_register(&gdev->notifier,
> > > > > +                                          &lc_state->changed_nb);
> > > > > +     if (ret)
> > > > > +             goto out_free_lc_state;
> > > > > +
> > > > > +     fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> > > > > +     if (fd < 0) {
> > > > > +             ret = fd;
> > > > > +             goto out_unregister_notifier;
> > > > > +     }
> > > > > +
> > > > > +     file = anon_inode_getfile("gpio-line-changed-fd",
> > > > > +                               &linechanged_fd_fileops,
> > > > > +                               lc_state, O_RDONLY | O_CLOEXEC);
> > > > > +     if (IS_ERR(file)) {
> > > > > +             ret = PTR_ERR(file);
> > > > > +             goto out_put_unused_fd;
> > > > > +     }
> > > > > +
> > > > > +     changed_req.fd = fd;
> > > > > +     ret = copy_to_user(ip, &changed_req, sizeof(changed_req));
> > > > > +     if (ret) {
> > > > > +             fput(file);
> > > > > +             put_unused_fd(fd);
> > > > > +             return -EFAULT;
> > > > > +     }
> > > > > +
> > > > > +     fd_install(fd, file);
> > > > > +
> > > > > +     return 0;
> > > > > +
> > > > > +out_put_unused_fd:
> > > > > +     put_unused_fd(fd);
> > > > > +out_unregister_notifier:
> > > > > +     atomic_notifier_chain_unregister(&gdev->notifier,
> > > > > +                                      &lc_state->changed_nb);
> > > > > +out_free_lc_state:
> > > > > +     kfree(lc_state);
> > > > > +
> > > > > +     return ret;
> > > > > +}
> > > > > +
> > > > >  /*
> > > > >   * gpio_ioctl() - ioctl handler for the GPIO chardev
> > > > >   */
> > > > > @@ -1238,6 +1447,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> > > > >               return linehandle_create(gdev, ip);
> > > > >       } else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
> > > > >               return lineevent_create(gdev, ip);
> > > > > +     } else if (cmd == GPIO_GET_LINECHANGED_FD_IOCTL) {
> > > > > +             return linechanged_fd_create(gdev, ip);
> > > > >       }
> > > > >       return -EINVAL;
> > > > >  }
> > > > > @@ -1499,6 +1710,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
> > > > >       for (i = 0; i < chip->ngpio; i++)
> > > > >               gdev->descs[i].gdev = gdev;
> > > > >
> > > > > +     ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
> > > > > +
> > > > >  #ifdef CONFIG_PINCTRL
> > > > >       INIT_LIST_HEAD(&gdev->pin_ranges);
> > > > >  #endif
> > > > > @@ -2837,6 +3050,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
> > > > >               spin_lock_irqsave(&gpio_lock, flags);
> > > > >       }
> > > > >  done:
> > > > > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > > +                                GPIOLINE_CHANGED_REQUESTED, desc);
> > > > >       spin_unlock_irqrestore(&gpio_lock, flags);
> > > > >       return ret;
> > > > >  }
> > > > > @@ -2934,6 +3149,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
> > > > >               ret = true;
> > > > >       }
> > > > >
> > > > > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > > +                                GPIOLINE_CHANGED_RELEASED, desc);
> > > > >       spin_unlock_irqrestore(&gpio_lock, flags);
> > > > >       return ret;
> > > > >  }
> > > > > @@ -3097,6 +3314,7 @@ static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
> > > > >               if (ret != -ENOTSUPP)
> > > > >                       return ret;
> > > > >       }
> > > > > +
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> > > > > index a1cbeabadc69..8e3969616cfe 100644
> > > > > --- a/drivers/gpio/gpiolib.h
> > > > > +++ b/drivers/gpio/gpiolib.h
> > > > > @@ -54,6 +54,7 @@ struct gpio_device {
> > > > >       const char              *label;
> > > > >       void                    *data;
> > > > >       struct list_head        list;
> > > > > +     struct atomic_notifier_head notifier;
> > > > >
> > > > >  #ifdef CONFIG_PINCTRL
> > > > >       /*
> > > > > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > > > > index 799cf823d493..c61429467dd4 100644
> > > > > --- a/include/uapi/linux/gpio.h
> > > > > +++ b/include/uapi/linux/gpio.h
> > > > > @@ -59,6 +59,40 @@ struct gpioline_info {
> > > > >  /* Maximum number of requested handles */
> > > > >  #define GPIOHANDLES_MAX 64
> > > > >
> > > > > +/**
> > > > > + * struct gpioline_changed_fd_request - Information about a linechanged fd
> > > > > + * request
> > > > > + * @lineoffsets: an array of desired lines, specified by offset index for the
> > > > > + * associated GPIO device
> > > > > + * @num_lines: number of lines requested in this request, i.e. the number of
> > > > > + * valid fields in the above arrays, set to 1 to request a single line
> > > > > + * @fd: if successful this field will contain a valid anonymous file handle
> > > > > + */
> > > > > +struct gpioline_changed_fd_request {
> > > > > +     __u32 lineoffsets[GPIOHANDLES_MAX];
> > > > > +     __u32 num_lines;
> > > > > +     int fd;
> > > > > +};
> > > > > +
> > > >
> > > > Wouldn't the most common case be to watch all the lines on a chip?
> > > > How about an easy way to do that, say num_lines=0?
> > > >
> > >
> > > IMO this is too implicit - it's literally a magic value. I'd prefer to
> > > keep it this way for the same reason I didn't want to have implicit
> > > BIAS settings. I prefer the kernel uAPI to be explicit and then we can
> > > wrap it in simple helpers in the library.
> > >
> >
> > Or you could add a watch_all flag to make it explicit.
> > But fair enough to leave as is - it probably keeps the kernel cleaner.
> >
> > > > > +/* Possible line status change events */
> > > > > +enum {
> > > > > +     GPIOLINE_CHANGED_REQUESTED = 1,
> > > > > +     GPIOLINE_CHANGED_RELEASED,
> > > > > +     GPIOLINE_CHANGED_CONFIG,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct gpioline_changed - Information about a change in status
> > > > > + * of a GPIO line
> > > > > + * @line_offset: offset of the line that changed relative to the gpiochip
> > > > > + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELEASED
> > > > > + * and GPIOLINE_CHANGED_CONFIG
> > > > > + */
> > > > > +struct gpioline_changed {
> > > > > +     __u32 line_offset;
> > > > > +     __u32 event_type;
> > > > > +};
> > > > > +
> > > >
> > > > Rather than sending an event type, and requiring userspace to poll
> > > > LINEINFO, which is racy, how about passing the updated info flags here?
> > > > A change in the state of the GPIOLINE_FLAG_KERNEL implies the
> > > > GPIOLINE_CHANGED_REQUESTED or GPIOLINE_CHANGED_RELEASED, so the
> > > > event_type is then redundant.
> > > > Userspace would then only have to poll LINEINFO if they were interested
> > > > in the consumer on GPIOLINE_CHANGED_REQUESTED.
> > > >
> > > > To sync kernel and userspace state the current state of each line
> > > > should be returned immediately via the fd as soon as the fd is created,
> > > > and then subsequently on any change.
> > > >
> > >
> > > I guess you're right. You even made me think we could go as far as to
> > > embed the whole gpioline_info structure in struct gpioline_changed.
> > > I'd still keep the event type though - otherwise we'd have to assume
> > > the user always calls LINEINFO_IOCTL before obtaining the LINECHANGED
> > > fd.
> > >
> >
> > I suggested sending the current state of each line as soon as the fd
> > is created so that you don't have to assume anything.  That initial change
> > report is effectively the same as having the user call LINEINFO on each
> > line at the same time - without all the race issues.
> >
> 
> Right, I didn't get this. That means you'd have to call the ioctl()
> and immediately follow up with a read(). I'm not a fan of this.
> Especially if we were to include a timestamp - what would it refer to?
> 
> > I also considered the full gpioline_info structure, as well as reporting
> > bulk line changes (replacing line_offset with lineoffsets and num_lines),
> > but then I thought it was probably better to keep it minimal and simple.
> > The name and consumer are relatively large.
> 
> In terms of performance - we're not really degrading it as this is
> still not a lot of data.
> 
> How about the following:
> 1. Move the code filling out the struct gpioline_info to a separate
> function in the kernel.
> 2. Call the new ioctl() GET_LINEINFO_FD to indicate it's an extension
> of GET_LINEINFO.
> 3. Embed struct gpioline_info in struct gpioline_info_fd so that the
> initial info be read when the file descriptor is created.
> 4. Likewise embed struct gpioline_info in struct gpioline_changed and
> on every status change event provide the whole set of information?
> 

You mean an array of info in the ioctl return, along with the fd?
That would work too.

I'm used to setting up streams like this in a networked environment
where returning data via the stream setup isn't an option, the only
option is to sync via the stream itself, so I overlooked the possibility
of using the ioctl return.

> > The name is immutable(??), and so is pointless to include.
> 
> It is now, but let's be future-proof. I can imagine having modifiable
> line names in the future. The code putting this info in struct
> gpioline_info wouldn't be really duplicated and the size of such small
> structures doesn't matter much - it's still a single context switch to
> read it.
> 
> > The consumer only changes when the line is requested, so I was willing
> > to live with still having to poll for that.
> > And what you gain by reporting bulk lines you might lose in increased
> > report size and associated code.  OTOH it would make it explicit which
> > lines are being changed together...
> > So I could well be wrong on that - a full bulk report may be better.
> 
> I'm not sure we need bulk reporting - just as we don't provide bulk
> GET_GPIOLINE_INFO. The corresponding ioctl() structure would get
> pretty complicated soon.
> 

That was my initial feeling as well.
And bulk is no longer an option if you want to include name in the change
report.

Kent.

> Bartosz
> 
> >
> > Kent.
> >
> > > > And a timestamp might be useful, as per gpioevent_data?
> > >
> > > Sure thing!
> > >
> > > Bart
> > >
> > > >
> > > > Kent.
> > > >
> > > > >  /* Linerequest flags */
> > > > >  #define GPIOHANDLE_REQUEST_INPUT     (1UL << 0)
> > > > >  #define GPIOHANDLE_REQUEST_OUTPUT    (1UL << 1)
> > > > > @@ -176,6 +210,8 @@ struct gpioevent_data {
> > > > >
> > > > >  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
> > > > >  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
> > > > > +#define GPIO_GET_LINECHANGED_FD_IOCTL \
> > > > > +             _IOWR(0xB4, 0x0b, struct gpioline_changed_fd_request)
> > > > >  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
> > > > >  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
> > > > >
> > > > > --
> > > > > 2.23.0
> > > > >
