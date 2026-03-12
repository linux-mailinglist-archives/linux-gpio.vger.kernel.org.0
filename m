Return-Path: <linux-gpio+bounces-33219-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIacDq9GsmnpKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33219-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:53:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9026D3A3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A194A3033217
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 04:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800FD39A077;
	Thu, 12 Mar 2026 04:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nxc/IBnY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B611DDC28;
	Thu, 12 Mar 2026 04:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773291178; cv=none; b=ngfk9ZHJuaZf+hrsMHuWDJiiwYsSoiXOkU6hQj6E/ryo0h2Ofr7d1XheEoxVs7F7YPf1q66mTv1wxwwlZXYfm990cizUWWVULs0ArTC3BX/fx01cqKZP4MxgBRqBheKExvxLd7FKy/25/Jm074EK/8yeeGUDJt5DG2OoGBhAQ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773291178; c=relaxed/simple;
	bh=SBD/dmp8BPTvxKp8T1wibLDp6tEJo9cqmyfGT+xkaUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcQPLMlH5HqK6q4P9vBG0Igqf7lwxm3lbcINAD86pnImr25hfJnWyISdoT3piApwYTXXx+h4LX0glZkkBe4pl26m9MAOd99TR+btVLzzbAiS7sC/lXIkAmqosoYyFMpTvFm0TKsEEfuh2bulchhd1bFcJ0PxjlmFWveWbaezjIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nxc/IBnY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3ACEC4CEF7;
	Thu, 12 Mar 2026 04:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773291177;
	bh=SBD/dmp8BPTvxKp8T1wibLDp6tEJo9cqmyfGT+xkaUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nxc/IBnYSqS9cJj76LagMrz4AAvFI+8Rvna64PzDTc+p4ItB2T8PR41+A9P8QGDxk
	 LVHp79ZLrM/iqVQdu39fbJ12Gomz79dN30DTU0bLdbq/U5vNWGPAF7BZoO1IvPuQNU
	 e/18KXBm5HuhTfPq+syLDSqdGC+2hqCEHbAinfrU2525ZM1A5Znwab4/WtM11aBMb9
	 ckuGyyOiOOci4oTmFbCZFSBf4Huwk6nCGgvjfHTIqvKk80rnrD3rLmcL1eZ4HR1E0z
	 M4Ojkn7xUOEMUJ/cKswsMH7tqt9mSEgAfNeome3npIrAiU/rn0nsEP/Zr4U6+yWiTw
	 5k4IRF58plDag==
Date: Thu, 12 Mar 2026 04:52:54 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linusw@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 1/6] gpio: Access `gpio_bus_type` in
 gpiochip_setup_dev()
Message-ID: <abJGpo7t5KCvyGE1@google.com>
References: <20260223061726.82161-1-tzungbi@kernel.org>
 <20260223061726.82161-2-tzungbi@kernel.org>
 <CAMuHMdU0Xb=Moca5LUex+VxyHQa2-uYJgYf4hzHiSEjDCQQT=Q@mail.gmail.com>
 <CAMRc=McmrJLWGoXjKaqGuCWpLZU4mmcrgs9ESAaL8kG=_R89cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McmrJLWGoXjKaqGuCWpLZU4mmcrgs9ESAaL8kG=_R89cw@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33219-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: E0B9026D3A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 07:36:51AM -0700, Bartosz Golaszewski wrote:
> On Wed, 11 Mar 2026 12:44:31 +0100, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > Hi Tzung-Bi,
> >
> > On Mon, 23 Feb 2026 at 07:17, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >> To make the intent clear, access `gpio_bus_type` only when it's ready in
> >> gpiochip_setup_dev().
> >>
> >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> >
> > Thanks for your patch, which is now commit cc11f4ef666fbca0 ("gpio:
> > Access `gpio_bus_type` in gpiochip_setup_dev()") in gpio/gpio/for-next.
> >
> >> --- a/drivers/gpio/gpiolib.c
> >> +++ b/drivers/gpio/gpiolib.c
> >> @@ -901,6 +901,8 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
> >>         struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
> >>         int ret;
> >>
> >> +       gdev->dev.bus = &gpio_bus_type;
> >> +
> >>         /*
> >>          * If fwnode doesn't belong to another device, it's safe to clear its
> >>          * initialized flag.
> >> @@ -1082,7 +1084,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> >>          * then make sure they get free():ed there.
> >>          */
> >>         gdev->dev.type = &gpio_dev_type;
> >> -       gdev->dev.bus = &gpio_bus_type;
> >>         gdev->dev.parent = gc->parent;
> >>         device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
> >>
> >
> > Postponing this assignment does have an impact on early
> > messages. E.g. on RBTX4927:
> >
> >     -gpio gpiochip0: Static allocation of GPIO base is deprecated, use
> > dynamic allocation.
> >     + gpiochip0: Static allocation of GPIO base is deprecated, use
> > dynamic allocation.
> >
> > Or with CONFIG_DEBUG_GPIO=y, e.g. on BeagleBone black:
> >
> >     -gpio gpiochip0: (gpio-0-31): created GPIO range 0->7 ==>
> > 44e10800.pinmux PIN 0->7
> >     -gpio gpiochip0: (gpio-0-31): created GPIO range 8->11 ==>
> > 44e10800.pinmux PIN 90->93
> >     -gpio gpiochip0: (gpio-0-31): created GPIO range 12->27 ==>
> > 44e10800.pinmux PIN 12->27
> >     -gpio gpiochip0: (gpio-0-31): created GPIO range 28->31 ==>
> > 44e10800.pinmux PIN 30->33
> >     + gpiochip0: (gpio-0-31): created GPIO range 0->7 ==>
> > 44e10800.pinmux PIN 0->7
> >     + gpiochip0: (gpio-0-31): created GPIO range 8->11 ==>
> > 44e10800.pinmux PIN 90->93
> >     + gpiochip0: (gpio-0-31): created GPIO range 12->27 ==>
> > 44e10800.pinmux PIN 12->27
> >     + gpiochip0: (gpio-0-31): created GPIO range 28->31 ==>
> > 44e10800.pinmux PIN 30->33
> >      [...]
> >
> > Note the spaces at the beginning of the printed lines.
> > Reverting the commit re-adds the "gpio" prefix.

Thanks for catching this.

> >
> 
> As per the comment in gpiochip_add_data_with_key(): we may end up with
> a functional chip before gpiochip_setup_dev() is called and so before we
> assign the bus type.
> 
> dev_printk() helpers only read the name field of the bus type so it should
> be safe, I don't see anyone else accessing it before we register it.
> 
> I think it makes sense to revert this commit. Tzung-Bi: what do you think?

That makes sense.  I agree, let's revert it.

