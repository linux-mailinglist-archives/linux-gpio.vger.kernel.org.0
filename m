Return-Path: <linux-gpio+bounces-33889-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNyZA9DRvGlK3QIAu9opvQ
	(envelope-from <linux-gpio+bounces-33889-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 05:49:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D42D5D0A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 05:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF3B13013261
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 04:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D9428851F;
	Fri, 20 Mar 2026 04:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9Pp/6lM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A26C1A9F8D;
	Fri, 20 Mar 2026 04:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773982155; cv=none; b=mQ0doFZWZvRlIeQarurIzQ2OFxFq+xvnoQmjFzFwT8jfwIgCqldlzFZLqJOCcGbgrh1D8h7ZBPM1cZecKcqFZ6xRynLmcTtSvO4PQFC+IwZNqpPZoJLkf2+gtNt4eMNNwEOqWjF/aLv47rAT5TcvpZdF2QSyL67hnoVGjesKRf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773982155; c=relaxed/simple;
	bh=CkQidQJ3odYC6HpjbOxtsJSgA3FL9gymx8bc59ueXts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6Y7cwkdGcP6rpDwGnx8n/oRJeMAFSbsLyerKkJ6/1Q0gm3GmGroyUSIWRw3wOttU2INh7TQeXGRZazZhyM56Yh6YcaQDGKJY86byP08DT8J3yPH/CMCQjSQRJIv7SnIyQD+Aw8bXtSfxFAPzTAUY2BSj6842mDK9KgBa5h2y4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9Pp/6lM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB32C4CEF7;
	Fri, 20 Mar 2026 04:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773982154;
	bh=CkQidQJ3odYC6HpjbOxtsJSgA3FL9gymx8bc59ueXts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9Pp/6lMm/jrtq6qjNYzhelHJTJnrQL0xRL/1gkxXx8ZjoaeCloskFX0EM4zOGLKJ
	 JSeuRDLKigLsYk5PbhzdjfTCuiJugXMLT85YM5VyRAuSTcv2GVzaqQW7cXMU22dLHD
	 ZClvVEtgfqVe/ArKHG35FvDPeNdeSMX9vshUBVUn0JBh7gl82O0pB/oaA7fHO1kUBo
	 e5rSKppr2wHt6ZQgk6iXdO7xkN2Ye/eAIibv6bFGL64TBKozEMO1FcA624sfp35U6B
	 vM993usS3YVjkasT6MJz7tMs6UEDwoh7S5tiA96E+7YSZXqGimaJZCtI2JIm7s06+j
	 yfS+rlgffLqpw==
Date: Fri, 20 Mar 2026 04:49:11 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
Message-ID: <abzRxyoW4svizpRY@google.com>
References: <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
 <e217c9a6-e2a6-4413-8247-19b7ab72a53a@nvidia.com>
 <CAMRc=MfK_eqbWDdEQHHWgAyz-zMWyW5G=DF8eNh0o+iyt=BtOg@mail.gmail.com>
 <d05d4468-84f7-4692-8381-e0742f1f2749@nvidia.com>
 <CAMRc=McY9dcDLXPM8-QErxzAJuoe1bxy8BX5H2y0uCHXJSsAwA@mail.gmail.com>
 <CAMRc=McMCMuyB7ETefXaWJ6K=-nPcDHo964WZKtPRU9XVVky_w@mail.gmail.com>
 <6ea1e467-b0d0-4ec7-90b5-740ca2415460@nvidia.com>
 <CAMRc=McGaF2XYedgy4n_RZzbHSBBZ2=EMvBEF4f8+ejLbu+CPQ@mail.gmail.com>
 <ab009797-3b48-4568-8e80-b10a44b6fac1@nvidia.com>
 <CAMRc=MffhRN3bC0TpeNqe-8fMCeSc9wBMrDANS9mtFkipdsiUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MffhRN3bC0TpeNqe-8fMCeSc9wBMrDANS9mtFkipdsiUA@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33889-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A06D42D5D0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 02:41:07AM -0700, Bartosz Golaszewski wrote:
> On Wed, 18 Mar 2026 20:09:08 +0100, Jon Hunter <jonathanh@nvidia.com> said:
> >
> >>>> Does this patch fix the real problem on the tegra board that you
> >>>> reported initially? I doubt two separate GPIO keys, share the same pin
> >>>> in real life.
> >>>
> >>> Yes it fixes the initial issue. However, now I am seeing a different
> >>> error on the actual platform that is having the issue to begin with ...
> >>>
> >>
> >> This is *with* the fix?
> >
> > Yes.
> >
> >>>    ------------[ cut here ]------------
> >>>    WARNING: kernel/rcu/srcutree.c:757 at cleanup_srcu_struct+0xc0/0x1e0, CPU#2: kworker/u49:1/114
> >>>    Modules linked in:
> >>>    CPU: 2 UID: 0 PID: 114 Comm: kworker/u49:1 Not tainted 6.19.0-tegra #1 PREEMPT
> >>>    Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS buildbrain-gcid-44496888 03/15/2026
> >>>    Workqueue: events_unbound deferred_probe_work_func
> >>>    pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >>>    pc : cleanup_srcu_struct+0xc0/0x1e0
> >>>    lr : cleanup_srcu_struct+0xb4/0x1e0
> >>>    sp : ffff800081cbb930
> >>>    x29: ffff800081cbb930 x28: ffffd79ff96d0c40 x27: ffff000086059000
> >>>    x26: 00000000fffffff0 x25: ffff000086571200 x24: ffffd79ff94adb10
> >>>    x23: ffffd79ff86400c0 x22: ffff000086059390 x21: ffffd79ff94aa040
> >>>    x20: 0000000000000000 x19: fffffdffbf669d40 x18: 00000000ffffffff
> >>>    x17: 0000000000000000 x16: ffffd79ff62dc8a0 x15: 0081cf5fe0409838
> >>>    x14: 0000000000000000 x13: 0000000000000272 x12: 0000000000000000
> >>>    x11: 00000000000000c0 x10: f7c5d06d757a4b3a x9 : 15ccf89dfeffb5e1
> >>>    x8 : ffff800081cbb8c8 x7 : 0000000000000000 x6 : 000000000151e960
> >>>    x5 : 0800000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> >>>    x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000004
> >>>    Call trace:
> >>>     cleanup_srcu_struct+0xc0/0x1e0 (P)
> >>>     gpiochip_add_data_with_key+0x3dc/0xf68
> >>>     devm_gpiochip_add_data_with_key+0x30/0x84
> >>>     tegra186_gpio_probe+0x5e4/0x808
> >>>     platform_probe+0x5c/0xb0
> >>>     really_probe+0xbc/0x2b4
> >>>     __driver_probe_device+0x78/0x134
> >>>     driver_probe_device+0x3c/0x164
> >>>     __device_attach_driver+0xc8/0x15c
> >>>     bus_for_each_drv+0x88/0x100
> >>>     __device_attach+0xa0/0x198
> >>>     device_initial_probe+0x58/0x5c
> >>>     bus_probe_device+0x38/0xbc
> >>>     deferred_probe_work_func+0x88/0xc8
> >>>     process_one_work+0x16c/0x3fc
> >>>     worker_thread+0x2d8/0x3ec
> >>>     kthread+0x144/0x22c
> >>>     ret_from_fork+0x10/0x20
> >>>    ---[ end trace 0000000000000000 ]---
> >
> > It seems that when the gpiochip_add_data_with_key(), then to avoid the
> > above warning I needed to ...
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 27ea5bc9ed8a..3130acfeeb66 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1277,6 +1277,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> >                  goto err_print_message;
> >          }

The context '}' here suggests that commit 16fdabe143fc ("gpio: Fix resource
leaks on errors in gpiochip_add_data_with_key()") might not be applied in
your code base.  After applying that commit, this code should look like:

    err_put_device:
        gpio_device_put(gdev);
        goto err_print_message;

    err_cleanup_desc_srcu:
        cleanup_srcu_struct(&gdev->desc_srcu);

I'll use v6.19 (i.e., without the commit) for the following examples.

> >   err_cleanup_desc_srcu:
> > +       synchronize_srcu(&gdev->desc_srcu);
> >          cleanup_srcu_struct(&gdev->desc_srcu);
> >   err_cleanup_gdev_srcu:
> >          cleanup_srcu_struct(&gdev->srcu);
> >
> 
> Hi Tzung-Bi, allow me to Cc you. It looks like someone takes the SRCU lock
> during the call to gpiochip_add_data_with_key() and this is why the cleanup
> path complains. Does it make sense to add this synchronize_srcu() call here?

No, I think this is very unusual: `gdev` is still initializing in
gpiochip_add_data_with_key(), but someone else already starts to access
members of `gdev`.

> 
> >
> >>>    gpiochip_add_data_with_key: GPIOs 512..675 (tegra234-gpio) failed to register, -16
> >>>    tegra186-gpio 2200000.gpio: probe with driver tegra186-gpio failed with error -16

Along with the above patch, the -16 (-EBUSY) should be from
gpiodev_add_to_list_unlocked()[1].

    scoped_guard(mutex, &gpio_devices_lock) {
        ...

        ret = gpiodev_add_to_list_unlocked(gdev);
        if (ret) {
            gpiochip_err(gc, "GPIO integer space overlap, cannot add chip\n");
            goto err_cleanup_desc_srcu;
        }
    }

[1] https://elixir.bootlin.com/linux/v6.19/source/drivers/gpio/gpiolib.c#L1151

My understanding is that within this function, there appear to be no other
users of `gdev->desc_srcu` between the calls to init_srcu_struct() and
gpiodev_add_to_list_unlocked().

At the point gpiodev_add_to_list_unlocked() is called, `gc->gpiodev` and
`gdev->descs` have also been set.

Jon: My main concern is about potential races from other threads.  Is it
possible that another thread could start accessing struct gpio_desc elements
(e.g., via gpiochip_request_own_desc() and desc_set_label()) before
gpiochip_add_data_with_key() has fully completed the initialization of `gdev`?

> >
> > Which leaves the above.
> >
> >> There's a change to how gpiochip_add_data_with_key() error path works in
> >> linux-next at the moment but it's not in any stable branch yet.
> >>
> >
> > This commit?
> >
> > 16fdabe143fc ("gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()")
> >
> 
> Yes, I Cc'ed the author above.
> 
> >
> >> -EBUSY can typically only happen if gpiod_request_commit() is called twice on
> >> the same descriptor. Is that the case here?
> >
> > I have been looking at this today and now I can see that we have a
> > 'gpio-hog' set for the same pins that are shared and hence it is
> > getting request twice. If I drop the hog it goes away. This is a
> > produce device-tree, not upstream, for some camera modules so I am
> > wondering if we are doing something here we should not be. I am
> > taking a closer look.
> >
> 
> Ah, yes that definitely will not work. Hogs are taken first during the chip's
> bringup and hogged lines will not be available to users. The error returned is
> -EBUSY so it makes perfect sense and is expected.
> 
> Bart

