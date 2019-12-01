Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8A1010E25A
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 16:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfLAPZY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 1 Dec 2019 10:25:24 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42559 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfLAPZY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Dec 2019 10:25:24 -0500
Received: by mail-ot1-f65.google.com with SMTP id 66so22769618otd.9
        for <linux-gpio@vger.kernel.org>; Sun, 01 Dec 2019 07:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eTLiolTFiEgD3s6sX6yUjsexNGb2qBKg0DGYAjXmaI0=;
        b=GH26PJ+LoTV+eUVZVfV1caCUC8KOMl0sg73b5fhTgydLGySpYVWfKEBfiJtBTpej0i
         q5z0cn8eaYx9h9XD0XIqz79CnQKYKThmMCcjdChTyeIYOvdmTJcFaUA9iGTThRXArHV5
         vtGDEDbHya8H2YKFE+ylTyk/b8gU0lBVtzlyfQz0rfuvU0KyWqp/YJ3eR8dSimX4QVdv
         f+12GVpe71+lvyL455DUHNNQNM6dvUYXYiOlLlawxZ9qSLB+3Fnt0baCYB2sftoXquw/
         ZG/hnP6DD+vG2+h9JXOpYVjXeGNvxhOb5Thknk2Z5UBNhUrriBkB5+fIuzEwumQyPeeA
         p0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eTLiolTFiEgD3s6sX6yUjsexNGb2qBKg0DGYAjXmaI0=;
        b=ouyLtTbFKzlFLawb7R008P1Q5grF9YVjPCqe1PHnGmkkojFwYbteM8zWJZU6SrMAB5
         QuG7IUxXJF8JodQAaG8V/PyjZybqBdpLrd8wrf61tsTgpBil2E0eQ9+Fbc0UzZeZsAPq
         aOPO1Ai331Sb6LJADPYAadxetlkeUOzNpWaljNTOoLHxjrz1uB+/3sL11eHecn8uEuyO
         IrQFWuy1VcA8mbHGftMUWoftbAJV/YwOLGEHr1NpVc0xMr3NHBBGP0uX4Z2jiwNWrnYk
         iN6EbV48emUN5g17VfOzVlnhipXILEmXEp1F9RakVIOOOFz+4Rt8ZhYL1F0cykX0VTdP
         xmCw==
X-Gm-Message-State: APjAAAUj/t5qx8mfPWhUAP7R402qldbEuEZ9Pxnjvi5P7gMrjI2IXAQs
        0jlQQ0C3xT7M7hediJ35JkM1IcwYMsYTxvfffGY+BQ==
X-Google-Smtp-Source: APXvYqxSgaeyM0JfVg/Bc5AhzezwJGNF2OYbg88csVTwUrVXBKrmutTOTbveaVejmKFB63TyMzyeS2aKAavcJ1aQv4o=
X-Received: by 2002:a9d:7a46:: with SMTP id z6mr77190otm.194.1575213920054;
 Sun, 01 Dec 2019 07:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20191127133510.10614-1-brgl@bgdev.pl> <20191127133510.10614-8-brgl@bgdev.pl>
 <20191127152410.GA24936@sol> <CAMRc=MdLnZFJQ+qMJSiSQSh6pOnKpLeU79u9ymA7HaujgK0kcg@mail.gmail.com>
 <20191127232330.GA3761@sol> <CAMRc=Me5kNUuPQCTM_H=2QjUL=7R-ii+uRvdNvAz3SqL_sPzcQ@mail.gmail.com>
 <20191128141028.GA15454@sol> <CAMRc=MeZzjuU25L_-qjP9n3O6Z3ucYUZkUoCA3sX0Z0yaXtgMw@mail.gmail.com>
 <20191128150200.GA16492@sol> <CAMRc=Md6aQobSoDVnAiLFQyZ1dKq8j4Wwm-_Zv9vrYReJvoCgA@mail.gmail.com>
 <20191129134907.GA24580@sol>
In-Reply-To: <20191129134907.GA24580@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 1 Dec 2019 16:25:08 +0100
Message-ID: <CAMpxmJUCjsWgZ0NHD2Uz-uG0F61J=BZe0G83=i=fewYYpWhrjQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpiolib: add new ioctl() for monitoring changes in
 line info
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 29 lis 2019 o 14:49 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> On Fri, Nov 29, 2019 at 10:43:32AM +0100, Bartosz Golaszewski wrote:
> > czw., 28 lis 2019 o 16:02 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > On Thu, Nov 28, 2019 at 03:36:19PM +0100, Bartosz Golaszewski wrote:
> > > > czw., 28 lis 2019 o 15:10 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
> > > > >
> > > > > On Thu, Nov 28, 2019 at 10:45:46AM +0100, Bartosz Golaszewski wro=
te:
> > > > > > czw., 28 lis 2019 o 00:23 Kent Gibson <warthog618@gmail.com> na=
pisa=C5=82(a):
> > > > > > >
> > > > > > > On Wed, Nov 27, 2019 at 04:50:43PM +0100, Bartosz Golaszewski=
 wrote:
> > > > > > > > =C5=9Br., 27 lis 2019 o 16:24 Kent Gibson <warthog618@gmail=
.com> napisa=C5=82(a):
> > > > > > > > >
> > > > > > > > > On Wed, Nov 27, 2019 at 02:35:09PM +0100, Bartosz Golasze=
wski wrote:
> > > > > > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > > > > > >
> > > > > > > > > > Currently there is no way for user-space to be informed=
 about changes
> > > > > > > > > > in status of GPIO lines e.g. when someone else requests=
 the line or its
> > > > > > > > > > config changes. We can only periodically re-read the li=
ne-info. This
> > > > > > > > > > is fine for simple one-off user-space tools, but any da=
emon that provides
> > > > > > > > > > a centralized access to GPIO chips would benefit hugely=
 from an event
> > > > > > > > > > driven line info synchronization.
> > > > > > > > > >
> > > > > > > > > > This patch adds a new ioctl() that allows user-space pr=
ocesses to retrieve
> > > > > > > > > > a file-descriptor for given GPIO lines which can be pol=
led for line status
> > > > > > > > > > change events.
> > > > > > > > > >
> > > > > > > > > > Currently the events are generated on three types of st=
atus changes: when
> > > > > > > > > > a line is requested, when it's released and when its co=
nfig is changed.
> > > > > > > > > > The first two are self-explanatory. For the third one: =
this will only
> > > > > > > > > > happen when another user-space process calls the new SE=
T_CONFIG ioctl()
> > > > > > > > > > as any changes that can happen from within the kernel (=
i.e.
> > > > > > > > > > set_transitory() or set_debounce()) are of no interest =
to user-space.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylib=
re.com>
> > > > > > > > > > ---
> > > > > > > > > >  drivers/gpio/gpiolib.c    | 218 ++++++++++++++++++++++=
++++++++++++++++
> > > > > > > > > >  drivers/gpio/gpiolib.h    |   1 +
> > > > > > > > > >  include/uapi/linux/gpio.h |  36 +++++++
> > > > > > > > > >  3 files changed, 255 insertions(+)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpio=
lib.c
> > > > > > > > > > index d094b1be334d..be5df4bdf44b 100644
> > > > > > > > > > --- a/drivers/gpio/gpiolib.c
> > > > > > > > > > +++ b/drivers/gpio/gpiolib.c
> > > > > > > > > > @@ -547,6 +547,9 @@ static long linehandle_set_config(s=
truct linehandle_state *lh,
> > > > > > > > > >                       if (ret)
> > > > > > > > > >                               return ret;
> > > > > > > > > >               }
> > > > > > > > > > +
> > > > > > > > > > +             atomic_notifier_call_chain(&desc->gdev->n=
otifier,
> > > > > > > > > > +                                        GPIOLINE_CHANG=
ED_CONFIG, desc);
> > > > > > > > > >       }
> > > > > > > > > >       return 0;
> > > > > > > > > >  }
> > > > > > > > > > @@ -1148,6 +1151,212 @@ static int lineevent_create(str=
uct gpio_device *gdev, void __user *ip)
> > > > > > > > > >       return ret;
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > > +struct linechanged_fd_state {
> > > > > > > > > > +     struct gpio_device *gdev;
> > > > > > > > > > +     struct gpio_desc *descs[GPIOHANDLES_MAX];
> > > > > > > > > > +     size_t numdescs;
> > > > > > > > > > +     wait_queue_head_t waitqueue;
> > > > > > > > > > +     DECLARE_KFIFO(events, struct gpioline_changed, 16=
);
> > > > > > > > > > +     struct mutex lock;
> > > > > > > > > > +     struct notifier_block changed_nb;
> > > > > > > > > > +};
> > > > > > > > > > +
> > > > > > > > > > +static int linechanged_fd_release(struct inode *inode,=
 struct file *filep)
> > > > > > > > > > +{
> > > > > > > > > > +     struct linechanged_fd_state *lc_state =3D filep->=
private_data;
> > > > > > > > > > +
> > > > > > > > > > +     atomic_notifier_chain_unregister(&lc_state->gdev-=
>notifier,
> > > > > > > > > > +                                      &lc_state->chang=
ed_nb);
> > > > > > > > > > +     put_device(&lc_state->gdev->dev);
> > > > > > > > > > +     kfree(lc_state);
> > > > > > > > > > +
> > > > > > > > > > +     return 0;
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +static __poll_t linechanged_fd_poll(struct file *filep=
,
> > > > > > > > > > +                                 struct poll_table_str=
uct *pollt)
> > > > > > > > > > +{
> > > > > > > > > > +     struct linechanged_fd_state *lc_state =3D filep->=
private_data;
> > > > > > > > > > +     __poll_t events =3D 0;
> > > > > > > > > > +
> > > > > > > > > > +     poll_wait(filep, &lc_state->waitqueue, pollt);
> > > > > > > > > > +
> > > > > > > > > > +     mutex_lock(&lc_state->lock);
> > > > > > > > > > +     if (!kfifo_is_empty(&lc_state->events))
> > > > > > > > > > +             events =3D EPOLLIN | EPOLLRDNORM;
> > > > > > > > > > +     mutex_unlock(&lc_state->lock);
> > > > > > > > > > +
> > > > > > > > > > +     return events;
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +static ssize_t linechanged_fd_read(struct file *filep,=
 char __user *buf,
> > > > > > > > > > +                                size_t count, loff_t *=
off)
> > > > > > > > > > +{
> > > > > > > > > > +     struct linechanged_fd_state *lc_state =3D filep->=
private_data;
> > > > > > > > > > +     unsigned int copied;
> > > > > > > > > > +     int ret;
> > > > > > > > > > +
> > > > > > > > > > +     if (count < sizeof(struct gpioline_changed))
> > > > > > > > > > +             return -EINVAL;
> > > > > > > > > > +
> > > > > > > > > > +     do {
> > > > > > > > > > +             mutex_lock(&lc_state->lock);
> > > > > > > > > > +             if (kfifo_is_empty(&lc_state->events)) {
> > > > > > > > > > +                     mutex_unlock(&lc_state->lock);
> > > > > > > > > > +                     if (filep->f_flags & O_NONBLOCK)
> > > > > > > > > > +                             return -EAGAIN;
> > > > > > > > > > +
> > > > > > > > > > +                     ret =3D wait_event_interruptible(=
lc_state->waitqueue,
> > > > > > > > > > +                                     !kfifo_is_empty(&=
lc_state->events));
> > > > > > > > > > +                     if (ret)
> > > > > > > > > > +                             return ret;
> > > > > > > > > > +             } else {
> > > > > > > > > > +                     mutex_unlock(&lc_state->lock);
> > > > > > > > > > +             }
> > > > > > > > > > +
> > > > > > > > > > +             if (mutex_lock_interruptible(&lc_state->l=
ock))
> > > > > > > > > > +                     return -ERESTARTSYS;
> > > > > > > > > > +
> > > > > > > > > > +             ret =3D kfifo_to_user(&lc_state->events, =
buf, count, &copied);
> > > > > > > > > > +             mutex_unlock(&lc_state->lock);
> > > > > > > > > > +             if (ret)
> > > > > > > > > > +                     return ret;
> > > > > > > > > > +
> > > > > > > > > > +             if (copied =3D=3D 0 && (filep->f_flags & =
O_NONBLOCK))
> > > > > > > > > > +                     return -EAGAIN;
> > > > > > > > > > +     } while (copied =3D=3D 0);
> > > > > > > > > > +
> > > > > > > > > > +     return copied;
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +static const struct file_operations linechanged_fd_fil=
eops =3D {
> > > > > > > > > > +     .release =3D linechanged_fd_release,
> > > > > > > > > > +     .owner =3D THIS_MODULE,
> > > > > > > > > > +     .llseek =3D noop_llseek,
> > > > > > > > > > +     .poll =3D linechanged_fd_poll,
> > > > > > > > > > +     .read =3D linechanged_fd_read,
> > > > > > > > > > +};
> > > > > > > > > > +
> > > > > > > > > > +static struct linechanged_fd_state *
> > > > > > > > > > +to_linechanged_fd_state(struct notifier_block *nb)
> > > > > > > > > > +{
> > > > > > > > > > +     return container_of(nb, struct linechanged_fd_sta=
te, changed_nb);
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +static int linechanged_fd_notify(struct notifier_block=
 *nb,
> > > > > > > > > > +                              unsigned long action, vo=
id *data)
> > > > > > > > > > +{
> > > > > > > > > > +     struct linechanged_fd_state *lc_state =3D to_line=
changed_fd_state(nb);
> > > > > > > > > > +     struct gpio_desc *desc =3D data;
> > > > > > > > > > +     struct gpioline_changed chg;
> > > > > > > > > > +     int i, ret;
> > > > > > > > > > +
> > > > > > > > > > +     for (i =3D 0; i < lc_state->numdescs; i++) {
> > > > > > > > > > +             /* Are we watching this desc? */
> > > > > > > > > > +             if (desc =3D=3D lc_state->descs[i]) {
> > > > > > > > > > +                     /* Yes - prepare the event. */
> > > > > > > > > > +                     memset(&chg, 0, sizeof(chg));
> > > > > > > > > > +                     chg.line_offset =3D gpio_chip_hwg=
pio(desc);
> > > > > > > > > > +                     chg.event_type =3D action;
> > > > > > > > > > +
> > > > > > > > > > +                     mutex_lock(&lc_state->lock);
> > > > > > > > > > +                     ret =3D kfifo_put(&lc_state->even=
ts, chg);
> > > > > > > > > > +                     mutex_unlock(&lc_state->lock);
> > > > > > > > > > +                     if (ret)
> > > > > > > > > > +                             wake_up_poll(&lc_state->w=
aitqueue, EPOLLIN);
> > > > > > > > > > +
> > > > > > > > > > +                     return NOTIFY_OK;
> > > > > > > > > > +             }
> > > > > > > > > > +     }
> > > > > > > > > > +
> > > > > > > > > > +     return NOTIFY_DONE;
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +static int linechanged_fd_create(struct gpio_device *g=
dev, void __user *ip)
> > > > > > > > > > +{
> > > > > > > > > > +     struct gpioline_changed_fd_request changed_req;
> > > > > > > > > > +     struct linechanged_fd_state *lc_state;
> > > > > > > > > > +     struct gpio_desc *desc;
> > > > > > > > > > +     struct file *file;
> > > > > > > > > > +     int ret, i, fd;
> > > > > > > > > > +     u32 offset;
> > > > > > > > > > +
> > > > > > > > > > +     ret =3D copy_from_user(&changed_req, ip, sizeof(c=
hanged_req));
> > > > > > > > > > +     if (ret)
> > > > > > > > > > +             return -EFAULT;
> > > > > > > > > > +
> > > > > > > > > > +     if ((changed_req.num_lines =3D=3D 0) ||
> > > > > > > > > > +         (changed_req.num_lines > GPIOHANDLES_MAX))
> > > > > > > > > > +             return -EINVAL;
> > > > > > > > > > +
> > > > > > > > > > +     lc_state =3D kzalloc(sizeof(*lc_state), GFP_KERNE=
L);
> > > > > > > > > > +     if (!lc_state)
> > > > > > > > > > +             return -ENOMEM;
> > > > > > > > > > +
> > > > > > > > > > +     lc_state->gdev =3D gdev;
> > > > > > > > > > +     get_device(&gdev->dev);
> > > > > > > > > > +
> > > > > > > > > > +     for (i =3D 0; i < changed_req.num_lines; i++) {
> > > > > > > > > > +             offset =3D changed_req.lineoffsets[i];
> > > > > > > > > > +             desc =3D gpiochip_get_desc(gdev->chip, of=
fset);
> > > > > > > > > > +             if (IS_ERR(desc)) {
> > > > > > > > > > +                     ret =3D PTR_ERR(desc);
> > > > > > > > > > +                     goto out_free_lc_state;
> > > > > > > > > > +             }
> > > > > > > > > > +
> > > > > > > > > > +             lc_state->descs[i] =3D desc;
> > > > > > > > > > +     }
> > > > > > > > > > +
> > > > > > > > > > +     lc_state->numdescs =3D changed_req.num_lines;
> > > > > > > > > > +
> > > > > > > > > > +     init_waitqueue_head(&lc_state->waitqueue);
> > > > > > > > > > +     INIT_KFIFO(lc_state->events);
> > > > > > > > > > +     mutex_init(&lc_state->lock);
> > > > > > > > > > +
> > > > > > > > > > +     lc_state->changed_nb.notifier_call =3D linechange=
d_fd_notify;
> > > > > > > > > > +
> > > > > > > > > > +     ret =3D atomic_notifier_chain_register(&gdev->not=
ifier,
> > > > > > > > > > +                                          &lc_state->c=
hanged_nb);
> > > > > > > > > > +     if (ret)
> > > > > > > > > > +             goto out_free_lc_state;
> > > > > > > > > > +
> > > > > > > > > > +     fd =3D get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> > > > > > > > > > +     if (fd < 0) {
> > > > > > > > > > +             ret =3D fd;
> > > > > > > > > > +             goto out_unregister_notifier;
> > > > > > > > > > +     }
> > > > > > > > > > +
> > > > > > > > > > +     file =3D anon_inode_getfile("gpio-line-changed-fd=
",
> > > > > > > > > > +                               &linechanged_fd_fileops=
,
> > > > > > > > > > +                               lc_state, O_RDONLY | O_=
CLOEXEC);
> > > > > > > > > > +     if (IS_ERR(file)) {
> > > > > > > > > > +             ret =3D PTR_ERR(file);
> > > > > > > > > > +             goto out_put_unused_fd;
> > > > > > > > > > +     }
> > > > > > > > > > +
> > > > > > > > > > +     changed_req.fd =3D fd;
> > > > > > > > > > +     ret =3D copy_to_user(ip, &changed_req, sizeof(cha=
nged_req));
> > > > > > > > > > +     if (ret) {
> > > > > > > > > > +             fput(file);
> > > > > > > > > > +             put_unused_fd(fd);
> > > > > > > > > > +             return -EFAULT;
> > > > > > > > > > +     }
> > > > > > > > > > +
> > > > > > > > > > +     fd_install(fd, file);
> > > > > > > > > > +
> > > > > > > > > > +     return 0;
> > > > > > > > > > +
> > > > > > > > > > +out_put_unused_fd:
> > > > > > > > > > +     put_unused_fd(fd);
> > > > > > > > > > +out_unregister_notifier:
> > > > > > > > > > +     atomic_notifier_chain_unregister(&gdev->notifier,
> > > > > > > > > > +                                      &lc_state->chang=
ed_nb);
> > > > > > > > > > +out_free_lc_state:
> > > > > > > > > > +     kfree(lc_state);
> > > > > > > > > > +
> > > > > > > > > > +     return ret;
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > >  /*
> > > > > > > > > >   * gpio_ioctl() - ioctl handler for the GPIO chardev
> > > > > > > > > >   */
> > > > > > > > > > @@ -1238,6 +1447,8 @@ static long gpio_ioctl(struct fil=
e *filp, unsigned int cmd, unsigned long arg)
> > > > > > > > > >               return linehandle_create(gdev, ip);
> > > > > > > > > >       } else if (cmd =3D=3D GPIO_GET_LINEEVENT_IOCTL) {
> > > > > > > > > >               return lineevent_create(gdev, ip);
> > > > > > > > > > +     } else if (cmd =3D=3D GPIO_GET_LINECHANGED_FD_IOC=
TL) {
> > > > > > > > > > +             return linechanged_fd_create(gdev, ip);
> > > > > > > > > >       }
> > > > > > > > > >       return -EINVAL;
> > > > > > > > > >  }
> > > > > > > > > > @@ -1499,6 +1710,8 @@ int gpiochip_add_data_with_key(st=
ruct gpio_chip *chip, void *data,
> > > > > > > > > >       for (i =3D 0; i < chip->ngpio; i++)
> > > > > > > > > >               gdev->descs[i].gdev =3D gdev;
> > > > > > > > > >
> > > > > > > > > > +     ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
> > > > > > > > > > +
> > > > > > > > > >  #ifdef CONFIG_PINCTRL
> > > > > > > > > >       INIT_LIST_HEAD(&gdev->pin_ranges);
> > > > > > > > > >  #endif
> > > > > > > > > > @@ -2837,6 +3050,8 @@ static int gpiod_request_commit(s=
truct gpio_desc *desc, const char *label)
> > > > > > > > > >               spin_lock_irqsave(&gpio_lock, flags);
> > > > > > > > > >       }
> > > > > > > > > >  done:
> > > > > > > > > > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > > > > > > > +                                GPIOLINE_CHANGED_REQUE=
STED, desc);
> > > > > > > > > >       spin_unlock_irqrestore(&gpio_lock, flags);
> > > > > > > > > >       return ret;
> > > > > > > > > >  }
> > > > > > > > > > @@ -2934,6 +3149,8 @@ static bool gpiod_free_commit(str=
uct gpio_desc *desc)
> > > > > > > > > >               ret =3D true;
> > > > > > > > > >       }
> > > > > > > > > >
> > > > > > > > > > +     atomic_notifier_call_chain(&desc->gdev->notifier,
> > > > > > > > > > +                                GPIOLINE_CHANGED_RELEA=
SED, desc);
> > > > > > > > > >       spin_unlock_irqrestore(&gpio_lock, flags);
> > > > > > > > > >       return ret;
> > > > > > > > > >  }
> > > > > > > > > > @@ -3097,6 +3314,7 @@ static int gpio_set_bias(struct g=
pio_chip *chip, struct gpio_desc *desc)
> > > > > > > > > >               if (ret !=3D -ENOTSUPP)
> > > > > > > > > >                       return ret;
> > > > > > > > > >       }
> > > > > > > > > > +
> > > > > > > > > >       return 0;
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpio=
lib.h
> > > > > > > > > > index a1cbeabadc69..8e3969616cfe 100644
> > > > > > > > > > --- a/drivers/gpio/gpiolib.h
> > > > > > > > > > +++ b/drivers/gpio/gpiolib.h
> > > > > > > > > > @@ -54,6 +54,7 @@ struct gpio_device {
> > > > > > > > > >       const char              *label;
> > > > > > > > > >       void                    *data;
> > > > > > > > > >       struct list_head        list;
> > > > > > > > > > +     struct atomic_notifier_head notifier;
> > > > > > > > > >
> > > > > > > > > >  #ifdef CONFIG_PINCTRL
> > > > > > > > > >       /*
> > > > > > > > > > diff --git a/include/uapi/linux/gpio.h b/include/uapi/l=
inux/gpio.h
> > > > > > > > > > index 799cf823d493..c61429467dd4 100644
> > > > > > > > > > --- a/include/uapi/linux/gpio.h
> > > > > > > > > > +++ b/include/uapi/linux/gpio.h
> > > > > > > > > > @@ -59,6 +59,40 @@ struct gpioline_info {
> > > > > > > > > >  /* Maximum number of requested handles */
> > > > > > > > > >  #define GPIOHANDLES_MAX 64
> > > > > > > > > >
> > > > > > > > > > +/**
> > > > > > > > > > + * struct gpioline_changed_fd_request - Information ab=
out a linechanged fd
> > > > > > > > > > + * request
> > > > > > > > > > + * @lineoffsets: an array of desired lines, specified =
by offset index for the
> > > > > > > > > > + * associated GPIO device
> > > > > > > > > > + * @num_lines: number of lines requested in this reque=
st, i.e. the number of
> > > > > > > > > > + * valid fields in the above arrays, set to 1 to reque=
st a single line
> > > > > > > > > > + * @fd: if successful this field will contain a valid =
anonymous file handle
> > > > > > > > > > + */
> > > > > > > > > > +struct gpioline_changed_fd_request {
> > > > > > > > > > +     __u32 lineoffsets[GPIOHANDLES_MAX];
> > > > > > > > > > +     __u32 num_lines;
> > > > > > > > > > +     int fd;
> > > > > > > > > > +};
> > > > > > > > > > +
> > > > > > > > >
> > > > > > > > > Wouldn't the most common case be to watch all the lines o=
n a chip?
> > > > > > > > > How about an easy way to do that, say num_lines=3D0?
> > > > > > > > >
> > > > > > > >
> > > > > > > > IMO this is too implicit - it's literally a magic value. I'=
d prefer to
> > > > > > > > keep it this way for the same reason I didn't want to have =
implicit
> > > > > > > > BIAS settings. I prefer the kernel uAPI to be explicit and =
then we can
> > > > > > > > wrap it in simple helpers in the library.
> > > > > > > >
> > > > > > >
> > > > > > > Or you could add a watch_all flag to make it explicit.
> > > > > > > But fair enough to leave as is - it probably keeps the kernel=
 cleaner.
> > > > > > >
> > > > > > > > > > +/* Possible line status change events */
> > > > > > > > > > +enum {
> > > > > > > > > > +     GPIOLINE_CHANGED_REQUESTED =3D 1,
> > > > > > > > > > +     GPIOLINE_CHANGED_RELEASED,
> > > > > > > > > > +     GPIOLINE_CHANGED_CONFIG,
> > > > > > > > > > +};
> > > > > > > > > > +
> > > > > > > > > > +/**
> > > > > > > > > > + * struct gpioline_changed - Information about a chang=
e in status
> > > > > > > > > > + * of a GPIO line
> > > > > > > > > > + * @line_offset: offset of the line that changed relat=
ive to the gpiochip
> > > > > > > > > > + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPI=
OLINE_CHANGED_RELEASED
> > > > > > > > > > + * and GPIOLINE_CHANGED_CONFIG
> > > > > > > > > > + */
> > > > > > > > > > +struct gpioline_changed {
> > > > > > > > > > +     __u32 line_offset;
> > > > > > > > > > +     __u32 event_type;
> > > > > > > > > > +};
> > > > > > > > > > +
> > > > > > > > >
> > > > > > > > > Rather than sending an event type, and requiring userspac=
e to poll
> > > > > > > > > LINEINFO, which is racy, how about passing the updated in=
fo flags here?
> > > > > > > > > A change in the state of the GPIOLINE_FLAG_KERNEL implies=
 the
> > > > > > > > > GPIOLINE_CHANGED_REQUESTED or GPIOLINE_CHANGED_RELEASED, =
so the
> > > > > > > > > event_type is then redundant.
> > > > > > > > > Userspace would then only have to poll LINEINFO if they w=
ere interested
> > > > > > > > > in the consumer on GPIOLINE_CHANGED_REQUESTED.
> > > > > > > > >
> > > > > > > > > To sync kernel and userspace state the current state of e=
ach line
> > > > > > > > > should be returned immediately via the fd as soon as the =
fd is created,
> > > > > > > > > and then subsequently on any change.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I guess you're right. You even made me think we could go as=
 far as to
> > > > > > > > embed the whole gpioline_info structure in struct gpioline_=
changed.
> > > > > > > > I'd still keep the event type though - otherwise we'd have =
to assume
> > > > > > > > the user always calls LINEINFO_IOCTL before obtaining the L=
INECHANGED
> > > > > > > > fd.
> > > > > > > >
> > > > > > >
> > > > > > > I suggested sending the current state of each line as soon as=
 the fd
> > > > > > > is created so that you don't have to assume anything.  That i=
nitial change
> > > > > > > report is effectively the same as having the user call LINEIN=
FO on each
> > > > > > > line at the same time - without all the race issues.
> > > > > > >
> > > > > >
> > > > > > Right, I didn't get this. That means you'd have to call the ioc=
tl()
> > > > > > and immediately follow up with a read(). I'm not a fan of this.
> > > > > > Especially if we were to include a timestamp - what would it re=
fer to?
> > > > > >
> > > > > > > I also considered the full gpioline_info structure, as well a=
s reporting
> > > > > > > bulk line changes (replacing line_offset with lineoffsets and=
 num_lines),
> > > > > > > but then I thought it was probably better to keep it minimal =
and simple.
> > > > > > > The name and consumer are relatively large.
> > > > > >
> > > > > > In terms of performance - we're not really degrading it as this=
 is
> > > > > > still not a lot of data.
> > > > > >
> > > > > > How about the following:
> > > > > > 1. Move the code filling out the struct gpioline_info to a sepa=
rate
> > > > > > function in the kernel.
> > > > > > 2. Call the new ioctl() GET_LINEINFO_FD to indicate it's an ext=
ension
> > > > > > of GET_LINEINFO.
> > > > > > 3. Embed struct gpioline_info in struct gpioline_info_fd so tha=
t the
> > > > > > initial info be read when the file descriptor is created.
> > > > > > 4. Likewise embed struct gpioline_info in struct gpioline_chang=
ed and
> > > > > > on every status change event provide the whole set of informati=
on?
> > > > > >
> > > > >
> > > > > You mean an array of info in the ioctl return, along with the fd?
> > > > > That would work too.
> > > >
> > > > I overlooked the fact that we can watch multiple lines. In this cas=
e
> > > > it's either a separate fd for every watched line (not optimal) or
> > > > doing what you proposed: read the initial lineinfo directly from th=
e
> > > > fd. But in this case again: what about the timestamp?
> > > >
> > >
> > > It is set to the time the fd was created.
> > > If you want you could also return that timestamp via the ioctl return
> > > for comparison.
> > > But most likely the userspace code will just ignore the timestamp for
> > > those initial num_lines reports - those reports will get special
> > > treatment anyway.
> > >
> > > Those initial reports are really part of the fd request handshake, so
> > > I would expect the reading and handling of them to be part of the fd
> > > request function in libgpiod, and they would be hidden from the end u=
ser.
> > > The fd would only be returned to the user after the initial reports
> > > have already been read and the line states synchronised.
> > > OTOH I haven't put much thought into how the libgpiod API would look.=
..
> >
> > So I can imagine a situation where we'd run into problems with this:
> > when we start watching the maximum number of lines - 64 - the kfifo
> > would be filled with reports from the start and we'd risk missing some
> > later ones if we don't make this kfifo much larger and if the user
> > doesn't manage to consume them all fast.
> >
> > How about reusing the already existing file descriptor associated with
> > the chip itself? We currently only implement the ioctl() operation on
> > it - the poll() and read() callbacks are empty.
> >
> > We'd need to add two new ioctls(): GPIOLINE_WATCH_IOCTL and
> > GPIOLINE_UNWATCH_IOCTL. The structures for both would look like this:
> >
> > struct gpioline_watch_request {
> >     __u32 lineoffset
> >     struct gpioline_info info;
> > };
> >
> > struct gpioline_unwatch_request {
> >     __u32 lineoffset;
> > };
> >
> > When GPIOLINE_WATCH_IOCTL is called, we'd setup a watch for given
> > line: the embedded gpioline_info structure would be filled with
> > initial info and we can now poll the gpiochip descriptor for events
> > and read them. The event structure would looks like this:
> >
> > struct gpioline_changed {
> >     __u32 event_type;
> >     __u64 timestamp;
> >     struct gpioline_info info;
> > };
> >
> > Calling GPIOLINE_UNWATCH_IOCTL would of course make the kernel stop
> > emitting events for given line.
> >
> > Does it make sense?
> >
>
> That makes sense.  But it doesn't really address the underlying problem
> that you have identified - it just makes it less likely that you will
> fill the kfifo.
>
> Correct me if I'm wrong, but a pathological process or processes could
> still swamp your kfifo with events, particularly if they are operating
> on bulks.

Don't get me wrong - the assumption is that a process knows what it's
doing. We expect that if it watches lines for events, then it will
actually read them as soon as they arrive on the other end of the
FIFO. If not - then this won't affect others, it will fill up the FIFO
associated with this process' file descriptor and we'll just drop new
events until it consumes old ones. In other words: I'm not worried
about pathological processes.

The problem here is that the file descriptor is created and there are
already several (up to 64) events waiting to be read. This just
doesn't feel right. If the process doesn't manage to consume all
initial events in time, we'll drop new ones. The alternative is to
allocate a larger FIFO but I just have a feeling that this whole
approach is wrong. I'm not sure any other subsystem does something
like this.

>
> I'd be happier with a solution that addresses what happens when the
> kfifo is full, or even better prevents it from filling, and then see
> how that feeds back to the startup case.
>

You can't really prevent it from overflowing as you can't
update/modify elements in the middle.

> Time to revisit your requirements...  Userspace doesn't need the details
> of each change, all you are after is an asynchronous mechanism to
> bring userspace up to date.  You only need to inform userspace that the
> line has changed since it was last informed of a change (or the fd was
> created).  You can collapse a set of changes that haven't reached
> userspace down to the last one.  Then the outstanding messages for
> userspace is at worst the number of lines being monitored.
>
> Wrt how to implement that, how about this:
> When a line is changed you set a "needs_update" flag on that line, and
> if not already set then issue a change to userspace via the fd.  That onl=
y
> contains the line offset - no info.

Doesn't this bring us right back to my racy initial implementation?

> The userspace would then perform a LINEINFO ioctl to read the line state
> and clear the "needs_update" flag in kernel.
> At that point the kernel and userspace are back in sync for that line -
> until the next change.
> The LINEINFO ioctl would be on the monitor fd, not the chip fd, but
> could otherwise be the same as the existing ioctl from the userspace pov.
> This logic would apply for each monitoring fd which is monitoring that
> line.

But then the kernel would assume that the user-space does a
responsible thing with the event it reads, while the process may as
well just discard all arriving data.

Bart

>
> Wrt the startup case, the userspace would create the monitor fd and then
> call the LINEINFO ioctl on each monitored line.
> Then you are in sync and good to go...
>
> There may well be better ways to implement that handshake - that is just
> the first that comes to mind.
>
> Kent.
>
> > Bart
> >
> > >
> > > Kent.
> > >
> > > > Bart
> > > >
> > > > >
> > > > > I'm used to setting up streams like this in a networked environme=
nt
> > > > > where returning data via the stream setup isn't an option, the on=
ly
> > > > > option is to sync via the stream itself, so I overlooked the poss=
ibility
> > > > > of using the ioctl return.
> > > > >
> > > > > > > The name is immutable(??), and so is pointless to include.
> > > > > >
> > > > > > It is now, but let's be future-proof. I can imagine having modi=
fiable
> > > > > > line names in the future. The code putting this info in struct
> > > > > > gpioline_info wouldn't be really duplicated and the size of suc=
h small
> > > > > > structures doesn't matter much - it's still a single context sw=
itch to
> > > > > > read it.
> > > > > >
> > > > > > > The consumer only changes when the line is requested, so I wa=
s willing
> > > > > > > to live with still having to poll for that.
> > > > > > > And what you gain by reporting bulk lines you might lose in i=
ncreased
> > > > > > > report size and associated code.  OTOH it would make it expli=
cit which
> > > > > > > lines are being changed together...
> > > > > > > So I could well be wrong on that - a full bulk report may be =
better.
> > > > > >
> > > > > > I'm not sure we need bulk reporting - just as we don't provide =
bulk
> > > > > > GET_GPIOLINE_INFO. The corresponding ioctl() structure would ge=
t
> > > > > > pretty complicated soon.
> > > > > >
> > > > >
> > > > > That was my initial feeling as well.
> > > > > And bulk is no longer an option if you want to include name in th=
e change
> > > > > report.
> > > > >
> > > > > Kent.
> > > > >
> > > > > > Bartosz
> > > > > >
> > > > > > >
> > > > > > > Kent.
> > > > > > >
> > > > > > > > > And a timestamp might be useful, as per gpioevent_data?
> > > > > > > >
> > > > > > > > Sure thing!
> > > > > > > >
> > > > > > > > Bart
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Kent.
> > > > > > > > >
> > > > > > > > > >  /* Linerequest flags */
> > > > > > > > > >  #define GPIOHANDLE_REQUEST_INPUT     (1UL << 0)
> > > > > > > > > >  #define GPIOHANDLE_REQUEST_OUTPUT    (1UL << 1)
> > > > > > > > > > @@ -176,6 +210,8 @@ struct gpioevent_data {
> > > > > > > > > >
> > > > > > > > > >  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struc=
t gpiochip_info)
> > > > > > > > > >  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, stru=
ct gpioline_info)
> > > > > > > > > > +#define GPIO_GET_LINECHANGED_FD_IOCTL \
> > > > > > > > > > +             _IOWR(0xB4, 0x0b, struct gpioline_changed=
_fd_request)
> > > > > > > > > >  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, st=
ruct gpiohandle_request)
> > > > > > > > > >  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, str=
uct gpioevent_request)
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > 2.23.0
> > > > > > > > > >
