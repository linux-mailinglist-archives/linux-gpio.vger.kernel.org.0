Return-Path: <linux-gpio+bounces-32344-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDLIJaHromml8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-32344-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 14:20:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E01771C331F
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 14:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 485CA304DF38
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 13:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9817B2741DF;
	Sat, 28 Feb 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZpQbd9f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ED31E1A33;
	Sat, 28 Feb 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772284829; cv=none; b=fDqBgAZy589ej1GKSx5odjih5W1q/SgBe2xa8S9Ha7jq+3zoiEmKbqSS5cMMnyYvBiatk6NW2ufXXvujaYO+bDg9b++SBeb20ZuonuWAdaf4XbAYJhKu5Q4lVn8dyR1BhAG08dx6BdUX54WvEwHEueeJlj432bQLTvTNCjIAwN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772284829; c=relaxed/simple;
	bh=ILeo1NHrhSIE3+u+Bl/AUJ3zLrzs1M+9gCIkj1SQhnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRQbVy3+X4CYP1wGsQxybigZmrT12n/qutWseiMKXOJ5tkGTV5oGPwdQZuLOu8UuSaP+z+7jsORlSp4Brllr5zc+lEmZ85r63Dy2zt87r5SzynwHziZSr5E9hscQN83AYfRMftRs8zxXN2uLMMR/5d73QcBRk4c2ixV1AI2ra8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZpQbd9f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838DBC116D0;
	Sat, 28 Feb 2026 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772284828;
	bh=ILeo1NHrhSIE3+u+Bl/AUJ3zLrzs1M+9gCIkj1SQhnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZpQbd9fAl5M86yF0YwmM3obiPWSThMpE/xk49hRoohCF1lUDDdKvEXO/O8czghCz
	 M3y1u+De3fAOSDoZI59xMVWMDSG5Nmo73b8eGvN8Rhh8HxUma0TSXic1cNOIG+tmyh
	 21qLWAjFlWPD+KQyXZtmp8sumFASJ73GPHIGD+wlE0t4RsvWnqaZQ5JKIFI9zdI4/H
	 HDPWcQYopJuUJR/mmjiEkkhdJ6r4QQtS2U6w29c53ZRbYJp8HwDFS9EEYcEovz/aKa
	 hdetfQITm9q1fp34cqbZp01y03PvJWIPY32onCoPAc7oceP9MW2tSGzAjHF7p1crUu
	 vU9262zM6TcAw==
Date: Sat, 28 Feb 2026 21:20:24 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Linus Walleij <linusw@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 4/6] gpio: Ensure struct gpio_chip for
 gpiochip_setup_dev()
Message-ID: <aaLrmGDGU5bCHM28@tzungbi-laptop>
References: <20260223061726.82161-1-tzungbi@kernel.org>
 <CGME20260227213613eucas1p2f2754ab3867fc422f44790eb34c79182@eucas1p2.samsung.com>
 <20260223061726.82161-5-tzungbi@kernel.org>
 <506ce9b3-d492-4fce-9d02-330e411911e2@samsung.com>
 <CAMRc=MfcEpvXT+Zxhhy9ei3ML3D9K1iW81aEZoO2cS7v=Djs+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfcEpvXT+Zxhhy9ei3ML3D9K1iW81aEZoO2cS7v=Djs+g@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32344-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,samsung.com:email]
X-Rspamd-Queue-Id: E01771C331F
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 11:03:35AM +0100, Bartosz Golaszewski wrote:
> On Fri, Feb 27, 2026 at 10:36 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> >
> > On 23.02.2026 07:17, Tzung-Bi Shih wrote:
> > > Ensure struct gpio_chip for gpiochip_setup_dev().  This eliminates a few
> > > checks for struct gpio_chip.
> > >
> > > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> >
> > This patch landed in today's linux-next as commit cf674f1a0c98 ("gpio:
> > Ensure struct gpio_chip for gpiochip_setup_dev()"). In my tests I found
> > that it triggers a warning on every test board I have, so I suspect that
> > something is missing in the code. Here is an example of such warning:
> >
> > ------------[ cut here ]------------
> > WARNING: drivers/gpio/gpiolib-cdev.c:2735 at
> > gpiolib_cdev_register+0x114/0x140, CPU#1: swapper/0/1
> > Modules linked in:
> > CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> > 7.0.0-rc1-next-20260227-00065-g6af4b9cfeded #12259 PREEMPT
> > Hardware name: Samsung Exynos (Flattened Device Tree)
> > Call trace:
> >   unwind_backtrace from show_stack+0x10/0x14
> >   show_stack from dump_stack_lvl+0x68/0x88
> >   dump_stack_lvl from __warn+0x94/0x210
> >   __warn from warn_slowpath_fmt+0x1b0/0x1bc
> >   warn_slowpath_fmt from gpiolib_cdev_register+0x114/0x140
> >   gpiolib_cdev_register from gpiochip_setup_dev+0x4c/0xd0
> >   gpiochip_setup_dev from gpiochip_add_data_with_key+0x960/0xad4
> >   gpiochip_add_data_with_key from devm_gpiochip_add_data_with_key+0x20/0x5c
> >   devm_gpiochip_add_data_with_key from samsung_pinctrl_probe+0x8fc/0xbe8
[...]
> > > ---
> > > v4:
> > > - To be consistent, rename `chip` -> `gc`.
> > > - Add lockdep checks.
> > >
[...]
> > > -int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
> > > +int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
> > >   {
> > > -     struct gpio_chip *gc;
> > > +     struct gpio_device *gdev = gc->gpiodev;
> > >       int ret;
> > >
> > > +     lockdep_assert_held(&gdev->srcu);
> > > +
> > >       cdev_init(&gdev->chrdev, &gpio_fileops);
> > >       gdev->chrdev.owner = THIS_MODULE;
> > >       gdev->dev.devt = MKDEV(MAJOR(devt), gdev->id);
> > > @@ -2802,14 +2804,6 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
> > >               return ret;
> > >       }
> > >
> > > -     guard(srcu)(&gdev->srcu);
> > > -     gc = srcu_dereference(gdev->chip, &gdev->srcu);
> > > -     if (!gc) {
> > > -             cdev_device_del(&gdev->chrdev, &gdev->dev);
> > > -             destroy_workqueue(gdev->line_state_wq);
> > > -             return -ENODEV;
> > > -     }
> > > -
> > >       gpiochip_dbg(gc, "added GPIO chardev (%d:%d)\n", MAJOR(devt), gdev->id);
> > >
> > >       return 0;
[...]
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index d5070c538ba5..44635e9a29c3 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -881,14 +881,14 @@ static const struct device_type gpio_dev_type = {
> > >   };
> > >
> > >   #ifdef CONFIG_GPIO_CDEV
> > > -#define gcdev_register(gdev, devt)   gpiolib_cdev_register((gdev), (devt))
> > > +#define gcdev_register(gc, devt)     gpiolib_cdev_register((gc), (devt))
[...]
> > > -static int gpiochip_setup_dev(struct gpio_device *gdev)
> > > +static int gpiochip_setup_dev(struct gpio_chip *gc)
> > >   {
> > > +     struct gpio_device *gdev = gc->gpiodev;
> > >       struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
> > >       int ret;
> > >
> > > @@ -910,11 +911,11 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
> > >       if (fwnode && !fwnode->dev)
> > >               fwnode_dev_initialized(fwnode, false);
> > >
> > > -     ret = gcdev_register(gdev, gpio_devt);
> > > +     ret = gcdev_register(gc, gpio_devt);
> > >       if (ret)
> > >               return ret;
> > >
> > > -     ret = gpiochip_sysfs_register(gdev);
> > > +     ret = gpiochip_sysfs_register(gc);
> > >       if (ret)
> > >               goto err_remove_device;
> > >
> > > @@ -961,13 +962,22 @@ static void machine_gpiochip_add(struct gpio_chip *gc)
> > >   static void gpiochip_setup_devs(void)
> > >   {
> > >       struct gpio_device *gdev;
> > > +     struct gpio_chip *gc;
> > >       int ret;
> > >
> > >       guard(srcu)(&gpio_devices_srcu);
> > >
> > >       list_for_each_entry_srcu(gdev, &gpio_devices, list,
> > >                                srcu_read_lock_held(&gpio_devices_srcu)) {
> > > -             ret = gpiochip_setup_dev(gdev);
> > > +             guard(srcu)(&gdev->srcu);
> > > +
> > > +             gc = srcu_dereference(gdev->chip, &gdev->srcu);
> > > +             if (!gc) {
> > > +                     dev_err(&gdev->dev, "Underlying GPIO chip is gone\n");
> > > +                     continue;
> > > +             }
> > > +
> > > +             ret = gpiochip_setup_dev(gc);
> > >               if (ret) {
> > >                       gpio_device_put(gdev);
> > >                       dev_err(&gdev->dev,
> > > @@ -1225,7 +1235,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> > >        * (i.e., `gpio_bus_type` is ready).  Otherwise, defer until later.
> > >        */
> > >       if (gpiolib_initialized) {
> > > -             ret = gpiochip_setup_dev(gdev);
> > > +             ret = gpiochip_setup_dev(gc);
> > >               if (ret)
> > >                       goto err_teardown_shared;
> > >       }
> >
> 
> gpiolib_cdev_register() is only called from
> gpiochip_add_data_with_key(). I don't think we need the lockdep check
> in the former?

It the calling path is:

  gpiochip_setup_devs()
  -> gpiochip_setup_dev()
  -> ...

The lockdep check should work.

If the calling path is:

  gpiochip_add_data_with_key()
  -> gpiochip_setup_dev()
  -> gcdev_register()
  -> gpiolib_cdev_register()

The SRCU won't be held as `gc` is ensured, and the lockdep check emits
the warning.  gpiochip_sysfs_register() shares the similar concern.

This is easily to reproduce as most cases should fall into the latter calling
path.  I overlooked the case because I always tested with revocable rework
series which eliminates the lockdep checks...

Given that both gpiolib_cdev_register() and gpiochip_sysfs_register() are
only called from gpiolib but no external users, maybe a simple fix is
removing the lockdep checks?

  gpiolib_cdev_register()
  -> (called from) gcdev_register()
    -> (called from) gpiochip_setup_dev()

  gpiochip_sysfs_register()
  -> (called from) gpiochip_setup_dev()
  or
  -> (called from) gpiofind_sysfs_register()
    -> (called from) gpiolib_sysfs_init()

Proposed a fix in:
https://lore.kernel.org/all/20260228131430.102388-1-tzungbi@kernel.org

