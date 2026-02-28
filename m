Return-Path: <linux-gpio+bounces-32341-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPZGMI69omkS5QQAu9opvQ
	(envelope-from <linux-gpio+bounces-32341-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 11:03:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 285CB1C1DFB
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 11:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95ACA303D315
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 10:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F295038736D;
	Sat, 28 Feb 2026 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSpRZnpg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FCE410D3A
	for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772273029; cv=none; b=sf9EAhKlIuoYM7SRNpSnHkCIDjEbU2NH4nM1PPr3Pzy330tCf2Si1I1pJUxjMf7W33EqaLY3WPZG+C0pr1Ezb8VPwj+R7yr2dOkqyLBFhVIJTLW/AXRyEN7GYZOP0vi9K2Y8Z1rpoNBA8bqR3vxfEFCA3F3dG/Zp43X5dHrVFjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772273029; c=relaxed/simple;
	bh=sw0IeRsZlctYuxqCDFb7qmPWrNUaj9jVvJCUdUmJseo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P63tAl/BrDLsAYJE30WBxEoRfawZ+EwOeQ2J/UZWQVqQnkk5AFqTMM3RXWgj8VXp1pvWZ55VppcuN8vF3QYeViD1E+dZ2ydfp1R9h9C1JMBDvHdcQYVJuWhbjt7SfupMFFp60aNHU6q4XmxTYnV2IYtghSD/lVWw72mRUXTI4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSpRZnpg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E23C4AF0B
	for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 10:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772273028;
	bh=sw0IeRsZlctYuxqCDFb7qmPWrNUaj9jVvJCUdUmJseo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QSpRZnpgzljbgrXNhQ3QFzXW5ptyzH7k/xqTk/a4nT/TPNGxEPXvhiZSB0ccrz6Mh
	 6zfEXKKtFyqpT1bIYk+zFgNuXSijWcq+s+vf/LJaPAMZwOCCPREEZ0RFmZQAAHRJ53
	 TwHT0no48764ghoVQhguTSe44RQucF3y70IZzl1mB5oQAw+nLOQGteAuvnyOhgRzyN
	 xZaxAjuXdLOjUOkBZKoVqYnP6vkek+PqzgquuOuOIiU9PgWGSGmS2wtzlzzNQ08bn6
	 ulTyTjf2+UwqxdmSY30SQdnEBrJTzxjWIFGCYJhmdPSr8mqxoGA0/RLioSnJQusW0T
	 7bkOc5rMsA2Xw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3870acaf78eso11994231fa.2
        for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 02:03:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOGTV70wag7CzpWD0zgMVZ0W8qcXD4AqJKAswqQ1XzNVSxA/DsKnTbT61mh66rgLLLgTUgjquEq/Ko@vger.kernel.org
X-Gm-Message-State: AOJu0YwLbEOa+9kuOXXpZq9Ly6fhnmj9OZqt2TCtC+Xz5h/irU6hhYqD
	N/U7/u4+nOcE6YGKY8QD+39Ypr8QyB8/TpOlpeUkMa1n5Zr9cZArZ2MLPrdPMQ7E/KhWexl+JJp
	1Aekdm0x7aN5PXUibNGcPmUONdqAbY/nkS8WHZMW+wQ==
X-Received: by 2002:a2e:7406:0:b0:385:fbff:ab2e with SMTP id
 38308e7fff4ca-389ff13b72amr23361041fa.14.1772273027219; Sat, 28 Feb 2026
 02:03:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223061726.82161-1-tzungbi@kernel.org> <CGME20260227213613eucas1p2f2754ab3867fc422f44790eb34c79182@eucas1p2.samsung.com>
 <20260223061726.82161-5-tzungbi@kernel.org> <506ce9b3-d492-4fce-9d02-330e411911e2@samsung.com>
In-Reply-To: <506ce9b3-d492-4fce-9d02-330e411911e2@samsung.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Sat, 28 Feb 2026 11:03:35 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfcEpvXT+Zxhhy9ei3ML3D9K1iW81aEZoO2cS7v=Djs+g@mail.gmail.com>
X-Gm-Features: AaiRm50MBfozSayj0J8eql9jJMHU1Vw03GY7xmZFdkmaSk7kvtco6PUjp75EIik
Message-ID: <CAMRc=MfcEpvXT+Zxhhy9ei3ML3D9K1iW81aEZoO2cS7v=Djs+g@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Linus Walleij <linusw@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32341-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,samsung.com:email]
X-Rspamd-Queue-Id: 285CB1C1DFB
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:36=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 23.02.2026 07:17, Tzung-Bi Shih wrote:
> > Ensure struct gpio_chip for gpiochip_setup_dev().  This eliminates a fe=
w
> > checks for struct gpio_chip.
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
>
> This patch landed in today's linux-next as commit cf674f1a0c98 ("gpio:
> Ensure struct gpio_chip for gpiochip_setup_dev()"). In my tests I found
> that it triggers a warning on every test board I have, so I suspect that
> something is missing in the code. Here is an example of such warning:
>
> ------------[ cut here ]------------
> WARNING: drivers/gpio/gpiolib-cdev.c:2735 at
> gpiolib_cdev_register+0x114/0x140, CPU#1: swapper/0/1
> Modules linked in:
> CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 7.0.0-rc1-next-20260227-00065-g6af4b9cfeded #12259 PREEMPT
> Hardware name: Samsung Exynos (Flattened Device Tree)
> Call trace:
>   unwind_backtrace from show_stack+0x10/0x14
>   show_stack from dump_stack_lvl+0x68/0x88
>   dump_stack_lvl from __warn+0x94/0x210
>   __warn from warn_slowpath_fmt+0x1b0/0x1bc
>   warn_slowpath_fmt from gpiolib_cdev_register+0x114/0x140
>   gpiolib_cdev_register from gpiochip_setup_dev+0x4c/0xd0
>   gpiochip_setup_dev from gpiochip_add_data_with_key+0x960/0xad4
>   gpiochip_add_data_with_key from devm_gpiochip_add_data_with_key+0x20/0x=
5c
>   devm_gpiochip_add_data_with_key from samsung_pinctrl_probe+0x8fc/0xbe8
>   samsung_pinctrl_probe from platform_probe+0x5c/0x98
>   platform_probe from really_probe+0xe0/0x424
>   really_probe from __driver_probe_device+0x9c/0x1f4
>   __driver_probe_device from driver_probe_device+0x30/0xc0
>   driver_probe_device from __device_attach_driver+0xbc/0x180
>   __device_attach_driver from bus_for_each_drv+0x84/0xdc
>   bus_for_each_drv from __device_attach+0xb0/0x214
>   __device_attach from device_initial_probe+0x3c/0x48
>   device_initial_probe from bus_probe_device+0x24/0x80
>   bus_probe_device from device_add+0x5c0/0x810
>   device_add from of_platform_device_create_pdata+0xac/0x104
>   of_platform_device_create_pdata from of_platform_bus_create+0x210/0x534
>   of_platform_bus_create from of_platform_bus_create+0x27c/0x534
>   of_platform_bus_create from of_platform_populate+0x90/0x150
>   of_platform_populate from of_platform_default_populate_init+0xd0/0xe0
>   of_platform_default_populate_init from do_one_initcall+0x70/0x3bc
>   do_one_initcall from kernel_init_freeable+0x1c0/0x248
>   kernel_init_freeable from kernel_init+0x18/0x12c
>   kernel_init from ret_from_fork+0x14/0x28
> Exception stack(0xf082dfb0 to 0xf082dff8)
> dfa0:                                     00000000 00000000 00000000
> 00000000
> dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
> dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> irq event stamp: 55167
> hardirqs last  enabled at (55387): [<c01c3578>] __up_console_sem+0x50/0x6=
0
> hardirqs last disabled at (55398): [<c01c3564>] __up_console_sem+0x3c/0x6=
0
> softirqs last  enabled at (55352): [<c013c8fc>] handle_softirqs+0x32c/0x5=
c0
> softirqs last disabled at (55419): [<c013cd3c>] __irq_exit_rcu+0x144/0x1f=
0
> ---[ end trace 0000000000000000 ]---
>
>
> > ---
> > v4:
> > - To be consistent, rename `chip` -> `gc`.
> > - Add lockdep checks.
> >
> > v3: https://lore.kernel.org/all/20260213092958.864411-5-tzungbi@kernel.=
org
> > - Pass struct gpio_chip * only.
> >
> > v2: https://lore.kernel.org/all/20260203061059.975605-5-tzungbi@kernel.=
org
> > - No changes.
> >
> > v1: https://lore.kernel.org/all/20260116081036.352286-10-tzungbi@kernel=
.org
> >
> >   drivers/gpio/gpiolib-cdev.c  | 14 ++++----------
> >   drivers/gpio/gpiolib-cdev.h  |  2 +-
> >   drivers/gpio/gpiolib-sysfs.c | 21 ++++++++-------------
> >   drivers/gpio/gpiolib-sysfs.h |  4 ++--
> >   drivers/gpio/gpiolib.c       | 24 +++++++++++++++++-------
> >   5 files changed, 32 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > index 73ae77f0f213..a154b04e9316 100644
> > --- a/drivers/gpio/gpiolib-cdev.c
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -2782,11 +2782,13 @@ static const struct file_operations gpio_fileop=
s =3D {
> >   #endif
> >   };
> >
> > -int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
> > +int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
> >   {
> > -     struct gpio_chip *gc;
> > +     struct gpio_device *gdev =3D gc->gpiodev;
> >       int ret;
> >
> > +     lockdep_assert_held(&gdev->srcu);
> > +
> >       cdev_init(&gdev->chrdev, &gpio_fileops);
> >       gdev->chrdev.owner =3D THIS_MODULE;
> >       gdev->dev.devt =3D MKDEV(MAJOR(devt), gdev->id);
> > @@ -2802,14 +2804,6 @@ int gpiolib_cdev_register(struct gpio_device *gd=
ev, dev_t devt)
> >               return ret;
> >       }
> >
> > -     guard(srcu)(&gdev->srcu);
> > -     gc =3D srcu_dereference(gdev->chip, &gdev->srcu);
> > -     if (!gc) {
> > -             cdev_device_del(&gdev->chrdev, &gdev->dev);
> > -             destroy_workqueue(gdev->line_state_wq);
> > -             return -ENODEV;
> > -     }
> > -
> >       gpiochip_dbg(gc, "added GPIO chardev (%d:%d)\n", MAJOR(devt), gde=
v->id);
> >
> >       return 0;
> > diff --git a/drivers/gpio/gpiolib-cdev.h b/drivers/gpio/gpiolib-cdev.h
> > index b42644cbffb8..4a9cb3335d99 100644
> > --- a/drivers/gpio/gpiolib-cdev.h
> > +++ b/drivers/gpio/gpiolib-cdev.h
> > @@ -7,7 +7,7 @@
> >
> >   struct gpio_device;
> >
> > -int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt);
> > +int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt);
> >   void gpiolib_cdev_unregister(struct gpio_device *gdev);
> >
> >   #endif /* GPIOLIB_CDEV_H */
> > diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.=
c
> > index 1c25a7dd3db4..748a3eb1bf35 100644
> > --- a/drivers/gpio/gpiolib-sysfs.c
> > +++ b/drivers/gpio/gpiolib-sysfs.c
> > @@ -983,13 +983,15 @@ void gpiod_unexport(struct gpio_desc *desc)
> >   }
> >   EXPORT_SYMBOL_GPL(gpiod_unexport);
> >
> > -int gpiochip_sysfs_register(struct gpio_device *gdev)
> > +int gpiochip_sysfs_register(struct gpio_chip *gc)
> >   {
> > +     struct gpio_device *gdev =3D gc->gpiodev;
> >       struct gpiodev_data *data;
> > -     struct gpio_chip *chip;
> >       struct device *parent;
> >       int err;
> >
> > +     lockdep_assert_held(&gdev->srcu);
> > +
> >       /*
> >        * Many systems add gpio chips for SOC support very early,
> >        * before driver model support is available.  In those cases we
> > @@ -999,18 +1001,12 @@ int gpiochip_sysfs_register(struct gpio_device *=
gdev)
> >       if (!class_is_registered(&gpio_class))
> >               return 0;
> >
> > -     guard(srcu)(&gdev->srcu);
> > -
> > -     chip =3D srcu_dereference(gdev->chip, &gdev->srcu);
> > -     if (!chip)
> > -             return -ENODEV;
> > -
> >       /*
> >        * For sysfs backward compatibility we need to preserve this
> >        * preferred parenting to the gpio_chip parent field, if set.
> >        */
> > -     if (chip->parent)
> > -             parent =3D chip->parent;
> > +     if (gc->parent)
> > +             parent =3D gc->parent;
> >       else
> >               parent =3D &gdev->dev;
> >
> > @@ -1029,7 +1025,7 @@ int gpiochip_sysfs_register(struct gpio_device *g=
dev)
> >                                                   MKDEV(0, 0), data,
> >                                                   gpiochip_groups,
> >                                                   GPIOCHIP_NAME "%d",
> > -                                                 chip->base);
> > +                                                 gc->base);
> >       if (IS_ERR(data->cdev_base)) {
> >               err =3D PTR_ERR(data->cdev_base);
> >               kfree(data);
> > @@ -1085,10 +1081,9 @@ void gpiochip_sysfs_unregister(struct gpio_chip =
*gc)
> >    */
> >   static int gpiofind_sysfs_register(struct gpio_chip *gc, const void *=
data)
> >   {
> > -     struct gpio_device *gdev =3D gc->gpiodev;
> >       int ret;
> >
> > -     ret =3D gpiochip_sysfs_register(gdev);
> > +     ret =3D gpiochip_sysfs_register(gc);
> >       if (ret)
> >               gpiochip_err(gc, "failed to register the sysfs entry: %d\=
n", ret);
> >
> > diff --git a/drivers/gpio/gpiolib-sysfs.h b/drivers/gpio/gpiolib-sysfs.=
h
> > index fd5db5384681..d0998de043a2 100644
> > --- a/drivers/gpio/gpiolib-sysfs.h
> > +++ b/drivers/gpio/gpiolib-sysfs.h
> > @@ -7,12 +7,12 @@ struct gpio_device;
> >
> >   #ifdef CONFIG_GPIO_SYSFS
> >
> > -int gpiochip_sysfs_register(struct gpio_device *gdev);
> > +int gpiochip_sysfs_register(struct gpio_chip *gc);
> >   void gpiochip_sysfs_unregister(struct gpio_chip *gc);
> >
> >   #else
> >
> > -static inline int gpiochip_sysfs_register(struct gpio_device *gdev)
> > +static inline int gpiochip_sysfs_register(struct gpio_chip *gc)
> >   {
> >       return 0;
> >   }
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index d5070c538ba5..44635e9a29c3 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -881,14 +881,14 @@ static const struct device_type gpio_dev_type =3D=
 {
> >   };
> >
> >   #ifdef CONFIG_GPIO_CDEV
> > -#define gcdev_register(gdev, devt)   gpiolib_cdev_register((gdev), (de=
vt))
> > +#define gcdev_register(gc, devt)     gpiolib_cdev_register((gc), (devt=
))
> >   #define gcdev_unregister(gdev)              gpiolib_cdev_unregister((=
gdev))
> >   #else
> >   /*
> >    * gpiolib_cdev_register() indirectly calls device_add(), which is st=
ill
> >    * required even when cdev is not selected.
> >    */
> > -#define gcdev_register(gdev, devt)   device_add(&(gdev)->dev)
> > +#define gcdev_register(gc, devt)     device_add(&(gc)->gpiodev->dev)
> >   #define gcdev_unregister(gdev)              device_del(&(gdev)->dev)
> >   #endif
> >
> > @@ -896,8 +896,9 @@ static const struct device_type gpio_dev_type =3D {
> >    * An initial reference count has been held in gpiochip_add_data_with=
_key().
> >    * The caller should drop the reference via gpio_device_put() on erro=
rs.
> >    */
> > -static int gpiochip_setup_dev(struct gpio_device *gdev)
> > +static int gpiochip_setup_dev(struct gpio_chip *gc)
> >   {
> > +     struct gpio_device *gdev =3D gc->gpiodev;
> >       struct fwnode_handle *fwnode =3D dev_fwnode(&gdev->dev);
> >       int ret;
> >
> > @@ -910,11 +911,11 @@ static int gpiochip_setup_dev(struct gpio_device =
*gdev)
> >       if (fwnode && !fwnode->dev)
> >               fwnode_dev_initialized(fwnode, false);
> >
> > -     ret =3D gcdev_register(gdev, gpio_devt);
> > +     ret =3D gcdev_register(gc, gpio_devt);
> >       if (ret)
> >               return ret;
> >
> > -     ret =3D gpiochip_sysfs_register(gdev);
> > +     ret =3D gpiochip_sysfs_register(gc);
> >       if (ret)
> >               goto err_remove_device;
> >
> > @@ -961,13 +962,22 @@ static void machine_gpiochip_add(struct gpio_chip=
 *gc)
> >   static void gpiochip_setup_devs(void)
> >   {
> >       struct gpio_device *gdev;
> > +     struct gpio_chip *gc;
> >       int ret;
> >
> >       guard(srcu)(&gpio_devices_srcu);
> >
> >       list_for_each_entry_srcu(gdev, &gpio_devices, list,
> >                                srcu_read_lock_held(&gpio_devices_srcu))=
 {
> > -             ret =3D gpiochip_setup_dev(gdev);
> > +             guard(srcu)(&gdev->srcu);
> > +
> > +             gc =3D srcu_dereference(gdev->chip, &gdev->srcu);
> > +             if (!gc) {
> > +                     dev_err(&gdev->dev, "Underlying GPIO chip is gone=
\n");
> > +                     continue;
> > +             }
> > +
> > +             ret =3D gpiochip_setup_dev(gc);
> >               if (ret) {
> >                       gpio_device_put(gdev);
> >                       dev_err(&gdev->dev,
> > @@ -1225,7 +1235,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
gc, void *data,
> >        * (i.e., `gpio_bus_type` is ready).  Otherwise, defer until late=
r.
> >        */
> >       if (gpiolib_initialized) {
> > -             ret =3D gpiochip_setup_dev(gdev);
> > +             ret =3D gpiochip_setup_dev(gc);
> >               if (ret)
> >                       goto err_teardown_shared;
> >       }
>

gpiolib_cdev_register() is only called from
gpiochip_add_data_with_key(). I don't think we need the lockdep check
in the former?

Tzung-Bi: Can you take a look at it and confirm?

Bartosz

