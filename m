Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D6610E3F2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 00:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfLAXn0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Dec 2019 18:43:26 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37949 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfLAXn0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Dec 2019 18:43:26 -0500
Received: by mail-pf1-f195.google.com with SMTP id x185so4854796pfc.5;
        Sun, 01 Dec 2019 15:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=vOQy4GpDR9bn8AVN8wFI5YS8Qp5B6ll6JS+nqoOkPoA=;
        b=i/1aftnXjpN1WVZpsW3p946xuG9xhVpRSUKj04fYWGlDr12iywzJ/ZiqQgInW8YCpm
         +/v67d1JHNzqryLXmicjW609J8EyW5re3O9Psv+x6L2lQNe+4kthFPkirWA+jIfKS3qR
         LuJobgqJsWaZmT3BavgZR4DKqeg9Zrt6h5pfcnPLP93PxHY00QGHBwYC/c/JtEqJthEp
         eMMoVR6VMobueAgMmcOzftcOvF5tkkeqZXPAJFQCQrvQwgHQEDK3iQScUSQpZNnR7tWA
         oiy0g1XB1FacvrJr65lINUJQqbqR0lSmNSDWjQA5/GpuTpL//XUGN2wz3e8pZYKsfeXA
         bwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=vOQy4GpDR9bn8AVN8wFI5YS8Qp5B6ll6JS+nqoOkPoA=;
        b=JCMYZjFlnulBL7OcD+DCIKHpbALSa1WfmuJLA4Ey1I2rcdoB5tuam9nz5Q2nx7EMV8
         LhaF7FxNEsgeD2HKEygKydciIKWJ79aKgG5/Qeas2fZj4STk5k1fOcBbmK1Kd6O1EaqC
         VkQ1yRVo/0FIgSqCYdEchP+WEODLcI6QQ8pKXuyhKgM7I2XtJBt6a6AhdSjAbeYd+g50
         oUHbepeRbMXoI2+adTRnbOUwBZqFxWX7OFhsSqi1udiDRG5NGsLoDsdFk4V5t2qdy6KH
         CXBLfsAmjFAKHZ/MevirqPVfk/ahDuUUaDHATVWhfNaz8/7cM/GsI0oEFFO9srzrR9VT
         UPZw==
X-Gm-Message-State: APjAAAVItTPWN4/mFuuyUj6WTguj31LE1QWtCO2u+u/FGkvY3xYI3QlY
        AIiLxN0QAFdSppJ6BiFfjeE=
X-Google-Smtp-Source: APXvYqzxkcLcVvCkFoKxZCrkJdobR9vJ/RTNVYqW33inkRAYey1frZoZRMGX6p6J5qziwigg0fRkig==
X-Received: by 2002:a63:e316:: with SMTP id f22mr28124073pgh.102.1575243804535;
        Sun, 01 Dec 2019 15:43:24 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z17sm21768153pfr.18.2019.12.01.15.43.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2019 15:43:23 -0800 (PST)
Date:   Mon, 2 Dec 2019 07:43:18 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/8] gpiolib: add new ioctl() for monitoring changes in
 line info
Message-ID: <20191201234318.GA6832@sol>
References: <20191127152410.GA24936@sol>
 <CAMRc=MdLnZFJQ+qMJSiSQSh6pOnKpLeU79u9ymA7HaujgK0kcg@mail.gmail.com>
 <20191127232330.GA3761@sol>
 <CAMRc=Me5kNUuPQCTM_H=2QjUL=7R-ii+uRvdNvAz3SqL_sPzcQ@mail.gmail.com>
 <20191128141028.GA15454@sol>
 <CAMRc=MeZzjuU25L_-qjP9n3O6Z3ucYUZkUoCA3sX0Z0yaXtgMw@mail.gmail.com>
 <20191128150200.GA16492@sol>
 <CAMRc=Md6aQobSoDVnAiLFQyZ1dKq8j4Wwm-_Zv9vrYReJvoCgA@mail.gmail.com>
 <20191129134907.GA24580@sol>
 <CAMpxmJUCjsWgZ0NHD2Uz-uG0F61J=BZe0G83=i=fewYYpWhrjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUCjsWgZ0NHD2Uz-uG0F61J=BZe0G83=i=fewYYpWhrjQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 01, 2019 at 04:25:08PM +0100, Bartosz Golaszewski wrote:
> pt., 29 lis 2019 o 14:49 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Fri, Nov 29, 2019 at 10:43:32AM +0100, Bartosz Golaszewski wrote:
> > > czw., 28 lis 2019 o 16:02 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > On Thu, Nov 28, 2019 at 03:36:19PM +0100, Bartosz Golaszewski wrote:
> > > > > czw., 28 lis 2019 o 15:10 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > >
> > > > > > On Thu, Nov 28, 2019 at 10:45:46AM +0100, Bartosz Golaszewski wrote:
> > > > > > > czw., 28 lis 2019 o 00:23 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > >
> > > > > > > > On Wed, Nov 27, 2019 at 04:50:43PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > śr., 27 lis 2019 o 16:24 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > > > > > > > >
> > > > > > > > > > On Wed, Nov 27, 2019 at 02:35:09PM +0100, Bartosz Golaszewski wrote:
> > > > > > > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > > > > > > >
> > > > > > > > > > > Currently there is no way for user-space to be informed about changes
> > > > > > > > > > > in status of GPIO lines e.g. when someone else requests the line or its
> > > > > > > > > > > config changes. We can only periodically re-read the line-info. This
> > > > > > > > > > > is fine for simple one-off user-space tools, but any daemon that provides
> > > > > > > > > > > a centralized access to GPIO chips would benefit hugely from an event
> > > > > > > > > > > driven line info synchronization.
> > > > > > > > > > >
> > > > > > > > > > > This patch adds a new ioctl() that allows user-space processes to retrieve
> > > > > > > > > > > a file-descriptor for given GPIO lines which can be polled for line status
> > > > > > > > > > > change events.
> > > > > > > > > > >
> > > > > > > > > > > Currently the events are generated on three types of status changes: when
> > > > > > > > > > > a line is requested, when it's released and when its config is changed.
> > > > > > > > > > > The first two are self-explanatory. For the third one: this will only
> > > > > > > > > > > happen when another user-space process calls the new SET_CONFIG ioctl()
> > > > > > > > > > > as any changes that can happen from within the kernel (i.e.
> > > > > > > > > > > set_transitory() or set_debounce()) are of no interest to user-space.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/gpio/gpiolib.c    | 218 ++++++++++++++++++++++++++++++++++++++
> > > > > > > > > > >  drivers/gpio/gpiolib.h    |   1 +
> > > > > > > > > > >  include/uapi/linux/gpio.h |  36 +++++++
> > > > > > > > > > >  3 files changed, 255 insertions(+)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > > > > > > > > > index d094b1be334d..be5df4bdf44b 100644
> > > > > > > > > > > --- a/drivers/gpio/gpiolib.c
> > > > > > > > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > > > > > > > @@ -547,6 +547,9 @@ static long linehandle_set_config(struct linehandle_state *lh,
> > > > > > > > > > >                       if (ret)
> > > > > > > > > > >                               return ret;
> > > > > > > > > > >               }
> > > > > > > > > > > +
> > > > > > > > > > > +             atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > > > > > > > > +                                        GPIOLINE_CHANGED_CONFIG, desc);
> > > > > > > > > > >       }
> > > > > > > > > > >       return 0;
> > > > > > > > > > >  }
> > > > > > > > > > > @@ -1148,6 +1151,212 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
> > > > > > > > > > >       return ret;
> > > > > > > > > > >  }
> > > > > > > > > > >
> > > > > > > > > > > +struct linechanged_fd_state {
> > > > > > > > > > > +     struct gpio_device *gdev;
> > > > > > > > > > > +     struct gpio_desc *descs[GPIOHANDLES_MAX];
> > > > > > > > > > > +     size_t numdescs;
> > > > > > > > > > > +     wait_queue_head_t waitqueue;
> > > > > > > > > > > +     DECLARE_KFIFO(events, struct gpioline_changed, 16);
> > > > > > > > > > > +     struct mutex lock;
> > > > > > > > > > > +     struct notifier_block changed_nb;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +static int linechanged_fd_release(struct inode *inode, struct file *filep)
> > > > > > > > > > > +{
> > > > > > > > > > > +     struct linechanged_fd_state *lc_state = filep->private_data;
> > > > > > > > > > > +
> > > > > > > > > > > +     atomic_notifier_chain_unregister(&lc_state->gdev->notifier,
> > > > > > > > > > > +                                      &lc_state->changed_nb);
> > > > > > > > > > > +     put_device(&lc_state->gdev->dev);
> > > > > > > > > > > +     kfree(lc_state);
> > > > > > > > > > > +
> > > > > > > > > > > +     return 0;
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > > +static __poll_t linechanged_fd_poll(struct file *filep,
> > > > > > > > > > > +                                 struct poll_table_struct *pollt)
> > > > > > > > > > > +{
> > > > > > > > > > > +     struct linechanged_fd_state *lc_state = filep->private_data;
> > > > > > > > > > > +     __poll_t events = 0;
> > > > > > > > > > > +
> > > > > > > > > > > +     poll_wait(filep, &lc_state->waitqueue, pollt);
> > > > > > > > > > > +
> > > > > > > > > > > +     mutex_lock(&lc_state->lock);
> > > > > > > > > > > +     if (!kfifo_is_empty(&lc_state->events))
> > > > > > > > > > > +             events = EPOLLIN | EPOLLRDNORM;
> > > > > > > > > > > +     mutex_unlock(&lc_state->lock);
> > > > > > > > > > > +
> > > > > > > > > > > +     return events;
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > > +static ssize_t linechanged_fd_read(struct file *filep, char __user *buf,
> > > > > > > > > > > +                                size_t count, loff_t *off)
> > > > > > > > > > > +{
> > > > > > > > > > > +     struct linechanged_fd_state *lc_state = filep->private_data;
> > > > > > > > > > > +     unsigned int copied;
> > > > > > > > > > > +     int ret;
> > > > > > > > > > > +
> > > > > > > > > > > +     if (count < sizeof(struct gpioline_changed))
> > > > > > > > > > > +             return -EINVAL;
> > > > > > > > > > > +
> > > > > > > > > > > +     do {
> > > > > > > > > > > +             mutex_lock(&lc_state->lock);
> > > > > > > > > > > +             if (kfifo_is_empty(&lc_state->events)) {
> > > > > > > > > > > +                     mutex_unlock(&lc_state->lock);
> > > > > > > > > > > +                     if (filep->f_flags & O_NONBLOCK)
> > > > > > > > > > > +                             return -EAGAIN;
> > > > > > > > > > > +
> > > > > > > > > > > +                     ret = wait_event_interruptible(lc_state->waitqueue,
> > > > > > > > > > > +                                     !kfifo_is_empty(&lc_state->events));
> > > > > > > > > > > +                     if (ret)
> > > > > > > > > > > +                             return ret;
> > > > > > > > > > > +             } else {
> > > > > > > > > > > +                     mutex_unlock(&lc_state->lock);
> > > > > > > > > > > +             }
> > > > > > > > > > > +
> > > > > > > > > > > +             if (mutex_lock_interruptible(&lc_state->lock))
> > > > > > > > > > > +                     return -ERESTARTSYS;
> > > > > > > > > > > +
> > > > > > > > > > > +             ret = kfifo_to_user(&lc_state->events, buf, count, &copied);
> > > > > > > > > > > +             mutex_unlock(&lc_state->lock);
> > > > > > > > > > > +             if (ret)
> > > > > > > > > > > +                     return ret;
> > > > > > > > > > > +
> > > > > > > > > > > +             if (copied == 0 && (filep->f_flags & O_NONBLOCK))
> > > > > > > > > > > +                     return -EAGAIN;
> > > > > > > > > > > +     } while (copied == 0);
> > > > > > > > > > > +
> > > > > > > > > > > +     return copied;
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > > +static const struct file_operations linechanged_fd_fileops = {
> > > > > > > > > > > +     .release = linechanged_fd_release,
> > > > > > > > > > > +     .owner = THIS_MODULE,
> > > > > > > > > > > +     .llseek = noop_llseek,
> > > > > > > > > > > +     .poll = linechanged_fd_poll,
> > > > > > > > > > > +     .read = linechanged_fd_read,
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +static struct linechanged_fd_state *
> > > > > > > > > > > +to_linechanged_fd_state(struct notifier_block *nb)
> > > > > > > > > > > +{
> > > > > > > > > > > +     return container_of(nb, struct linechanged_fd_state, changed_nb);
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > > +static int linechanged_fd_notify(struct notifier_block *nb,
> > > > > > > > > > > +                              unsigned long action, void *data)
> > > > > > > > > > > +{
> > > > > > > > > > > +     struct linechanged_fd_state *lc_state = to_linechanged_fd_state(nb);
> > > > > > > > > > > +     struct gpio_desc *desc = data;
> > > > > > > > > > > +     struct gpioline_changed chg;
> > > > > > > > > > > +     int i, ret;
> > > > > > > > > > > +
> > > > > > > > > > > +     for (i = 0; i < lc_state->numdescs; i++) {
> > > > > > > > > > > +             /* Are we watching this desc? */
> > > > > > > > > > > +             if (desc == lc_state->descs[i]) {
> > > > > > > > > > > +                     /* Yes - prepare the event. */
> > > > > > > > > > > +                     memset(&chg, 0, sizeof(chg));
> > > > > > > > > > > +                     chg.line_offset = gpio_chip_hwgpio(desc);
> > > > > > > > > > > +                     chg.event_type = action;
> > > > > > > > > > > +
> > > > > > > > > > > +                     mutex_lock(&lc_state->lock);
> > > > > > > > > > > +                     ret = kfifo_put(&lc_state->events, chg);
> > > > > > > > > > > +                     mutex_unlock(&lc_state->lock);
> > > > > > > > > > > +                     if (ret)
> > > > > > > > > > > +                             wake_up_poll(&lc_state->waitqueue, EPOLLIN);
> > > > > > > > > > > +
> > > > > > > > > > > +                     return NOTIFY_OK;
> > > > > > > > > > > +             }
> > > > > > > > > > > +     }
> > > > > > > > > > > +
> > > > > > > > > > > +     return NOTIFY_DONE;
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > > +static int linechanged_fd_create(struct gpio_device *gdev, void __user *ip)
> > > > > > > > > > > +{
> > > > > > > > > > > +     struct gpioline_changed_fd_request changed_req;
> > > > > > > > > > > +     struct linechanged_fd_state *lc_state;
> > > > > > > > > > > +     struct gpio_desc *desc;
> > > > > > > > > > > +     struct file *file;
> > > > > > > > > > > +     int ret, i, fd;
> > > > > > > > > > > +     u32 offset;
> > > > > > > > > > > +
> > > > > > > > > > > +     ret = copy_from_user(&changed_req, ip, sizeof(changed_req));
> > > > > > > > > > > +     if (ret)
> > > > > > > > > > > +             return -EFAULT;
> > > > > > > > > > > +
> > > > > > > > > > > +     if ((changed_req.num_lines == 0) ||
> > > > > > > > > > > +         (changed_req.num_lines > GPIOHANDLES_MAX))
> > > > > > > > > > > +             return -EINVAL;
> > > > > > > > > > > +
> > > > > > > > > > > +     lc_state = kzalloc(sizeof(*lc_state), GFP_KERNEL);
> > > > > > > > > > > +     if (!lc_state)
> > > > > > > > > > > +             return -ENOMEM;
> > > > > > > > > > > +
> > > > > > > > > > > +     lc_state->gdev = gdev;
> > > > > > > > > > > +     get_device(&gdev->dev);
> > > > > > > > > > > +
> > > > > > > > > > > +     for (i = 0; i < changed_req.num_lines; i++) {
> > > > > > > > > > > +             offset = changed_req.lineoffsets[i];
> > > > > > > > > > > +             desc = gpiochip_get_desc(gdev->chip, offset);
> > > > > > > > > > > +             if (IS_ERR(desc)) {
> > > > > > > > > > > +                     ret = PTR_ERR(desc);
> > > > > > > > > > > +                     goto out_free_lc_state;
> > > > > > > > > > > +             }
> > > > > > > > > > > +
> > > > > > > > > > > +             lc_state->descs[i] = desc;
> > > > > > > > > > > +     }
> > > > > > > > > > > +
> > > > > > > > > > > +     lc_state->numdescs = changed_req.num_lines;
> > > > > > > > > > > +
> > > > > > > > > > > +     init_waitqueue_head(&lc_state->waitqueue);
> > > > > > > > > > > +     INIT_KFIFO(lc_state->events);
> > > > > > > > > > > +     mutex_init(&lc_state->lock);
> > > > > > > > > > > +
> > > > > > > > > > > +     lc_state->changed_nb.notifier_call = linechanged_fd_notify;
> > > > > > > > > > > +
> > > > > > > > > > > +     ret = atomic_notifier_chain_register(&gdev->notifier,
> > > > > > > > > > > +                                          &lc_state->changed_nb);
> > > > > > > > > > > +     if (ret)
> > > > > > > > > > > +             goto out_free_lc_state;
> > > > > > > > > > > +
> > > > > > > > > > > +     fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> > > > > > > > > > > +     if (fd < 0) {
> > > > > > > > > > > +             ret = fd;
> > > > > > > > > > > +             goto out_unregister_notifier;
> > > > > > > > > > > +     }
> > > > > > > > > > > +
> > > > > > > > > > > +     file = anon_inode_getfile("gpio-line-changed-fd",
> > > > > > > > > > > +                               &linechanged_fd_fileops,
> > > > > > > > > > > +                               lc_state, O_RDONLY | O_CLOEXEC);
> > > > > > > > > > > +     if (IS_ERR(file)) {
> > > > > > > > > > > +             ret = PTR_ERR(file);
> > > > > > > > > > > +             goto out_put_unused_fd;
> > > > > > > > > > > +     }
> > > > > > > > > > > +
> > > > > > > > > > > +     changed_req.fd = fd;
> > > > > > > > > > > +     ret = copy_to_user(ip, &changed_req, sizeof(changed_req));
> > > > > > > > > > > +     if (ret) {
> > > > > > > > > > > +             fput(file);
> > > > > > > > > > > +             put_unused_fd(fd);
> > > > > > > > > > > +             return -EFAULT;
> > > > > > > > > > > +     }
> > > > > > > > > > > +
> > > > > > > > > > > +     fd_install(fd, file);
> > > > > > > > > > > +
> > > > > > > > > > > +     return 0;
> > > > > > > > > > > +
> > > > > > > > > > > +out_put_unused_fd:
> > > > > > > > > > > +     put_unused_fd(fd);
> > > > > > > > > > > +out_unregister_notifier:
> > > > > > > > > > > +     atomic_notifier_chain_unregister(&gdev->notifier,
> > > > > > > > > > > +                                      &lc_state->changed_nb);
> > > > > > > > > > > +out_free_lc_state:
> > > > > > > > > > > +     kfree(lc_state);
> > > > > > > > > > > +
> > > > > > > > > > > +     return ret;
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > >  /*
> > > > > > > > > > >   * gpio_ioctl() - ioctl handler for the GPIO chardev
> > > > > > > > > > >   */
> > > > > > > > > > > @@ -1238,6 +1447,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> > > > > > > > > > >               return linehandle_create(gdev, ip);
> > > > > > > > > > >       } else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
> > > > > > > > > > >               return lineevent_create(gdev, ip);
> > > > > > > > > > > +     } else if (cmd == GPIO_GET_LINECHANGED_FD_IOCTL) {
> > > > > > > > > > > +             return linechanged_fd_create(gdev, ip);
> > > > > > > > > > >       }
> > > > > > > > > > >       return -EINVAL;
> > > > > > > > > > >  }
> > > > > > > > > > > @@ -1499,6 +1710,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
> > > > > > > > > > >       for (i = 0; i < chip->ngpio; i++)
> > > > > > > > > > >               gdev->descs[i].gdev = gdev;
> > > > > > > > > > >
> > > > > > > > > > > +     ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
> > > > > > > > > > > +
> > > > > > > > > > >  #ifdef CONFIG_PINCTRL
> > > > > > > > > > >       INIT_LIST_HEAD(&gdev->pin_ranges);
> > > > > > > > > > >  #endif
> > > > > > > > > > > @@ -2837,6 +3050,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
> > > > > > > > > > >               spin_lock_irqsave(&gpio_lock, flags);
> > > > > > > > > > >       }
> > > > > > > > > > >  done:
> > > > > > > > > > > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > > > > > > > > +                                GPIOLINE_CHANGED_REQUESTED, desc);
> > > > > > > > > > >       spin_unlock_irqrestore(&gpio_lock, flags);
> > > > > > > > > > >       return ret;
> > > > > > > > > > >  }
> > > > > > > > > > > @@ -2934,6 +3149,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
> > > > > > > > > > >               ret = true;
> > > > > > > > > > >       }
> > > > > > > > > > >
> > > > > > > > > > > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > > > > > > > > +                                GPIOLINE_CHANGED_RELEASED, desc);
> > > > > > > > > > >       spin_unlock_irqrestore(&gpio_lock, flags);
> > > > > > > > > > >       return ret;
> > > > > > > > > > >  }
> > > > > > > > > > > @@ -3097,6 +3314,7 @@ static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
> > > > > > > > > > >               if (ret != -ENOTSUPP)
> > > > > > > > > > >                       return ret;
> > > > > > > > > > >       }
> > > > > > > > > > > +
> > > > > > > > > > >       return 0;
> > > > > > > > > > >  }
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> > > > > > > > > > > index a1cbeabadc69..8e3969616cfe 100644
> > > > > > > > > > > --- a/drivers/gpio/gpiolib.h
> > > > > > > > > > > +++ b/drivers/gpio/gpiolib.h
> > > > > > > > > > > @@ -54,6 +54,7 @@ struct gpio_device {
> > > > > > > > > > >       const char              *label;
> > > > > > > > > > >       void                    *data;
> > > > > > > > > > >       struct list_head        list;
> > > > > > > > > > > +     struct atomic_notifier_head notifier;
> > > > > > > > > > >
> > > > > > > > > > >  #ifdef CONFIG_PINCTRL
> > > > > > > > > > >       /*
> > > > > > > > > > > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > > > > > > > > > > index 799cf823d493..c61429467dd4 100644
> > > > > > > > > > > --- a/include/uapi/linux/gpio.h
> > > > > > > > > > > +++ b/include/uapi/linux/gpio.h
> > > > > > > > > > > @@ -59,6 +59,40 @@ struct gpioline_info {
> > > > > > > > > > >  /* Maximum number of requested handles */
> > > > > > > > > > >  #define GPIOHANDLES_MAX 64
> > > > > > > > > > >
> > > > > > > > > > > +/**
> > > > > > > > > > > + * struct gpioline_changed_fd_request - Information about a linechanged fd
> > > > > > > > > > > + * request
> > > > > > > > > > > + * @lineoffsets: an array of desired lines, specified by offset index for the
> > > > > > > > > > > + * associated GPIO device
> > > > > > > > > > > + * @num_lines: number of lines requested in this request, i.e. the number of
> > > > > > > > > > > + * valid fields in the above arrays, set to 1 to request a single line
> > > > > > > > > > > + * @fd: if successful this field will contain a valid anonymous file handle
> > > > > > > > > > > + */
> > > > > > > > > > > +struct gpioline_changed_fd_request {
> > > > > > > > > > > +     __u32 lineoffsets[GPIOHANDLES_MAX];
> > > > > > > > > > > +     __u32 num_lines;
> > > > > > > > > > > +     int fd;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > >
> > > > > > > > > > Wouldn't the most common case be to watch all the lines on a chip?
> > > > > > > > > > How about an easy way to do that, say num_lines=0?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > IMO this is too implicit - it's literally a magic value. I'd prefer to
> > > > > > > > > keep it this way for the same reason I didn't want to have implicit
> > > > > > > > > BIAS settings. I prefer the kernel uAPI to be explicit and then we can
> > > > > > > > > wrap it in simple helpers in the library.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Or you could add a watch_all flag to make it explicit.
> > > > > > > > But fair enough to leave as is - it probably keeps the kernel cleaner.
> > > > > > > >
> > > > > > > > > > > +/* Possible line status change events */
> > > > > > > > > > > +enum {
> > > > > > > > > > > +     GPIOLINE_CHANGED_REQUESTED = 1,
> > > > > > > > > > > +     GPIOLINE_CHANGED_RELEASED,
> > > > > > > > > > > +     GPIOLINE_CHANGED_CONFIG,
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * struct gpioline_changed - Information about a change in status
> > > > > > > > > > > + * of a GPIO line
> > > > > > > > > > > + * @line_offset: offset of the line that changed relative to the gpiochip
> > > > > > > > > > > + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELEASED
> > > > > > > > > > > + * and GPIOLINE_CHANGED_CONFIG
> > > > > > > > > > > + */
> > > > > > > > > > > +struct gpioline_changed {
> > > > > > > > > > > +     __u32 line_offset;
> > > > > > > > > > > +     __u32 event_type;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > >
> > > > > > > > > > Rather than sending an event type, and requiring userspace to poll
> > > > > > > > > > LINEINFO, which is racy, how about passing the updated info flags here?
> > > > > > > > > > A change in the state of the GPIOLINE_FLAG_KERNEL implies the
> > > > > > > > > > GPIOLINE_CHANGED_REQUESTED or GPIOLINE_CHANGED_RELEASED, so the
> > > > > > > > > > event_type is then redundant.
> > > > > > > > > > Userspace would then only have to poll LINEINFO if they were interested
> > > > > > > > > > in the consumer on GPIOLINE_CHANGED_REQUESTED.
> > > > > > > > > >
> > > > > > > > > > To sync kernel and userspace state the current state of each line
> > > > > > > > > > should be returned immediately via the fd as soon as the fd is created,
> > > > > > > > > > and then subsequently on any change.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > I guess you're right. You even made me think we could go as far as to
> > > > > > > > > embed the whole gpioline_info structure in struct gpioline_changed.
> > > > > > > > > I'd still keep the event type though - otherwise we'd have to assume
> > > > > > > > > the user always calls LINEINFO_IOCTL before obtaining the LINECHANGED
> > > > > > > > > fd.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I suggested sending the current state of each line as soon as the fd
> > > > > > > > is created so that you don't have to assume anything.  That initial change
> > > > > > > > report is effectively the same as having the user call LINEINFO on each
> > > > > > > > line at the same time - without all the race issues.
> > > > > > > >
> > > > > > >
> > > > > > > Right, I didn't get this. That means you'd have to call the ioctl()
> > > > > > > and immediately follow up with a read(). I'm not a fan of this.
> > > > > > > Especially if we were to include a timestamp - what would it refer to?
> > > > > > >
> > > > > > > > I also considered the full gpioline_info structure, as well as reporting
> > > > > > > > bulk line changes (replacing line_offset with lineoffsets and num_lines),
> > > > > > > > but then I thought it was probably better to keep it minimal and simple.
> > > > > > > > The name and consumer are relatively large.
> > > > > > >
> > > > > > > In terms of performance - we're not really degrading it as this is
> > > > > > > still not a lot of data.
> > > > > > >
> > > > > > > How about the following:
> > > > > > > 1. Move the code filling out the struct gpioline_info to a separate
> > > > > > > function in the kernel.
> > > > > > > 2. Call the new ioctl() GET_LINEINFO_FD to indicate it's an extension
> > > > > > > of GET_LINEINFO.
> > > > > > > 3. Embed struct gpioline_info in struct gpioline_info_fd so that the
> > > > > > > initial info be read when the file descriptor is created.
> > > > > > > 4. Likewise embed struct gpioline_info in struct gpioline_changed and
> > > > > > > on every status change event provide the whole set of information?
> > > > > > >
> > > > > >
> > > > > > You mean an array of info in the ioctl return, along with the fd?
> > > > > > That would work too.
> > > > >
> > > > > I overlooked the fact that we can watch multiple lines. In this case
> > > > > it's either a separate fd for every watched line (not optimal) or
> > > > > doing what you proposed: read the initial lineinfo directly from the
> > > > > fd. But in this case again: what about the timestamp?
> > > > >
> > > >
> > > > It is set to the time the fd was created.
> > > > If you want you could also return that timestamp via the ioctl return
> > > > for comparison.
> > > > But most likely the userspace code will just ignore the timestamp for
> > > > those initial num_lines reports - those reports will get special
> > > > treatment anyway.
> > > >
> > > > Those initial reports are really part of the fd request handshake, so
> > > > I would expect the reading and handling of them to be part of the fd
> > > > request function in libgpiod, and they would be hidden from the end user.
> > > > The fd would only be returned to the user after the initial reports
> > > > have already been read and the line states synchronised.
> > > > OTOH I haven't put much thought into how the libgpiod API would look...
> > >
> > > So I can imagine a situation where we'd run into problems with this:
> > > when we start watching the maximum number of lines - 64 - the kfifo
> > > would be filled with reports from the start and we'd risk missing some
> > > later ones if we don't make this kfifo much larger and if the user
> > > doesn't manage to consume them all fast.
> > >
> > > How about reusing the already existing file descriptor associated with
> > > the chip itself? We currently only implement the ioctl() operation on
> > > it - the poll() and read() callbacks are empty.
> > >
> > > We'd need to add two new ioctls(): GPIOLINE_WATCH_IOCTL and
> > > GPIOLINE_UNWATCH_IOCTL. The structures for both would look like this:
> > >
> > > struct gpioline_watch_request {
> > >     __u32 lineoffset
> > >     struct gpioline_info info;
> > > };
> > >
> > > struct gpioline_unwatch_request {
> > >     __u32 lineoffset;
> > > };
> > >
> > > When GPIOLINE_WATCH_IOCTL is called, we'd setup a watch for given
> > > line: the embedded gpioline_info structure would be filled with
> > > initial info and we can now poll the gpiochip descriptor for events
> > > and read them. The event structure would looks like this:
> > >
> > > struct gpioline_changed {
> > >     __u32 event_type;
> > >     __u64 timestamp;
> > >     struct gpioline_info info;
> > > };
> > >
> > > Calling GPIOLINE_UNWATCH_IOCTL would of course make the kernel stop
> > > emitting events for given line.
> > >
> > > Does it make sense?
> > >
> >
> > That makes sense.  But it doesn't really address the underlying problem
> > that you have identified - it just makes it less likely that you will
> > fill the kfifo.
> >
> > Correct me if I'm wrong, but a pathological process or processes could
> > still swamp your kfifo with events, particularly if they are operating
> > on bulks.
> 
> Don't get me wrong - the assumption is that a process knows what it's
> doing. We expect that if it watches lines for events, then it will
> actually read them as soon as they arrive on the other end of the
> FIFO. If not - then this won't affect others, it will fill up the FIFO
> associated with this process' file descriptor and we'll just drop new
> events until it consumes old ones. In other words: I'm not worried
> about pathological processes.
> 

The reader can't guarantee that it can read faster than changes can occur,
no matter how well intentioned it is.

I am a bit worried if you just drop events, as there is no indication to
userspace that that has occured.

> The problem here is that the file descriptor is created and there are
> already several (up to 64) events waiting to be read. This just
> doesn't feel right. If the process doesn't manage to consume all
> initial events in time, we'll drop new ones. The alternative is to
> allocate a larger FIFO but I just have a feeling that this whole
> approach is wrong. I'm not sure any other subsystem does something
> like this.
> 
> >
> > I'd be happier with a solution that addresses what happens when the
> > kfifo is full, or even better prevents it from filling, and then see
> > how that feeds back to the startup case.
> >
> 
> You can't really prevent it from overflowing as you can't
> update/modify elements in the middle.
> 

You can if you let go of the idea of adding something to the fifo for
every change.  If you know the change you want to signal is already in
the fifo then you don't need to add it again.

The idea I'm suggesting now is for the fifo to contain "your info on
line X is stale" messages.  If that hasn't been ACKed by userspace then
there is no point adding another for that line.  So worst case you have 
num_lines messages in the fifo at any time.

> > Time to revisit your requirements...  Userspace doesn't need the details
> > of each change, all you are after is an asynchronous mechanism to
> > bring userspace up to date.  You only need to inform userspace that the
> > line has changed since it was last informed of a change (or the fd was
> > created).  You can collapse a set of changes that haven't reached
> > userspace down to the last one.  Then the outstanding messages for
> > userspace is at worst the number of lines being monitored.
> >
> > Wrt how to implement that, how about this:
> > When a line is changed you set a "needs_update" flag on that line, and
> > if not already set then issue a change to userspace via the fd.  That only
> > contains the line offset - no info.
> 
> Doesn't this bring us right back to my racy initial implementation?
> 

It is closer to your original, but the race is only relevant when you
are trying to match line info with changed events.  I'm suggesting we
give up trying to do that.  It was probably a mistake to go down that
particular rat hole - my bad.

All we do here is notify to userspace that their info is stale.
They ACK that by performing a LINEINFO ioctl on the monitoring fd (it
can't be the chip fd as we are introducing side effects - the ACK).
When the kernel sends the response to the LINEINFO ioctl we know the
kernel and userspace are in sync at that time.  And isn't that what you
want to achieve - bringing userspace back into sync with the kernel
without having to poll?

> > The userspace would then perform a LINEINFO ioctl to read the line state
> > and clear the "needs_update" flag in kernel.
> > At that point the kernel and userspace are back in sync for that line -
> > until the next change.
> > The LINEINFO ioctl would be on the monitor fd, not the chip fd, but
> > could otherwise be the same as the existing ioctl from the userspace pov.
> > This logic would apply for each monitoring fd which is monitoring that
> > line.
> 
> But then the kernel would assume that the user-space does a
> responsible thing with the event it reads, while the process may as
> well just discard all arriving data.
> 

The kernel doesn't assume anything - it just wont send another changed
event for a line until the userspace ACKs the previous.
If userspace doesn't ACK a changed event then they will not get any
more for that line, so they have a strong incentive to ACK it.
Note that the "your info is stale" message only contains the line
offset so the userspace is forced to perform the LINEINFO ioctl to find
out that the current state actually is.

Kent.

> Bart
> 
> >
> > Wrt the startup case, the userspace would create the monitor fd and then
> > call the LINEINFO ioctl on each monitored line.
> > Then you are in sync and good to go...
> >
> > There may well be better ways to implement that handshake - that is just
> > the first that comes to mind.
> >
> > Kent.
> >
> > > Bart
> > >
> > > >
> > > > Kent.
> > > >
> > > > > Bart
> > > > >
> > > > > >
> > > > > > I'm used to setting up streams like this in a networked environment
> > > > > > where returning data via the stream setup isn't an option, the only
> > > > > > option is to sync via the stream itself, so I overlooked the possibility
> > > > > > of using the ioctl return.
> > > > > >
> > > > > > > > The name is immutable(??), and so is pointless to include.
> > > > > > >
> > > > > > > It is now, but let's be future-proof. I can imagine having modifiable
> > > > > > > line names in the future. The code putting this info in struct
> > > > > > > gpioline_info wouldn't be really duplicated and the size of such small
> > > > > > > structures doesn't matter much - it's still a single context switch to
> > > > > > > read it.
> > > > > > >
> > > > > > > > The consumer only changes when the line is requested, so I was willing
> > > > > > > > to live with still having to poll for that.
> > > > > > > > And what you gain by reporting bulk lines you might lose in increased
> > > > > > > > report size and associated code.  OTOH it would make it explicit which
> > > > > > > > lines are being changed together...
> > > > > > > > So I could well be wrong on that - a full bulk report may be better.
> > > > > > >
> > > > > > > I'm not sure we need bulk reporting - just as we don't provide bulk
> > > > > > > GET_GPIOLINE_INFO. The corresponding ioctl() structure would get
> > > > > > > pretty complicated soon.
> > > > > > >
> > > > > >
> > > > > > That was my initial feeling as well.
> > > > > > And bulk is no longer an option if you want to include name in the change
> > > > > > report.
> > > > > >
> > > > > > Kent.
> > > > > >
> > > > > > > Bartosz
> > > > > > >
> > > > > > > >
> > > > > > > > Kent.
> > > > > > > >
> > > > > > > > > > And a timestamp might be useful, as per gpioevent_data?
> > > > > > > > >
> > > > > > > > > Sure thing!
> > > > > > > > >
> > > > > > > > > Bart
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Kent.
> > > > > > > > > >
> > > > > > > > > > >  /* Linerequest flags */
> > > > > > > > > > >  #define GPIOHANDLE_REQUEST_INPUT     (1UL << 0)
> > > > > > > > > > >  #define GPIOHANDLE_REQUEST_OUTPUT    (1UL << 1)
> > > > > > > > > > > @@ -176,6 +210,8 @@ struct gpioevent_data {
> > > > > > > > > > >
> > > > > > > > > > >  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
> > > > > > > > > > >  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
> > > > > > > > > > > +#define GPIO_GET_LINECHANGED_FD_IOCTL \
> > > > > > > > > > > +             _IOWR(0xB4, 0x0b, struct gpioline_changed_fd_request)
> > > > > > > > > > >  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
> > > > > > > > > > >  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
> > > > > > > > > > >
> > > > > > > > > > > --
> > > > > > > > > > > 2.23.0
> > > > > > > > > > >
