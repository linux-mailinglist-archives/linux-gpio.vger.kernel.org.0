Return-Path: <linux-gpio+bounces-31382-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADRhH6PCgWmjJgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31382-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 10:40:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA78D6F17
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 10:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E575306EA60
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 09:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4844C3101CE;
	Tue,  3 Feb 2026 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9eEfn3W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0D9396D07
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 09:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111327; cv=none; b=cFVfiXq6zod7oPEQgmt2hiV96tqE6N+AZEqiCY4wfjcLF1p8ZO0+pbJqGNl27AXNhEoiPRWZB0i1ic1/21za00rXuYMgvd2n35CXGG2cnxpUR9klNfh9MLP/BGG9sb05mBwwOStMd1IeerTeQAYHndrNFvdGz2CRekEul8Cs+vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111327; c=relaxed/simple;
	bh=md0MCLqSqXL0pe8mN6d/m5/nAWhddeTwgbwRMbWB5xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KiG0PTbpayRvAoO5n7HB1iQtzDhKx2607su6at46irqDNgDCwLO59Gl/nKYUHohDPMJarYzrk5itYWhnBj6APf0AKD2sNptnVttS6UthpckmrLjQv0huRY9zyPM46/5BfZVq/LNUpswDpXEtFLPwGEe0m6IzEx8MpnpONkxmY64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9eEfn3W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF56AC19421
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770111326;
	bh=md0MCLqSqXL0pe8mN6d/m5/nAWhddeTwgbwRMbWB5xo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e9eEfn3WH9H2tfchjrR2kV+COQMnoGu8u8Be56Gr6IJKqj4FHB9qKW9uqsdEI63Jv
	 c5jFFC61BZtC4hNOj6tOD09d2xYgqYg8XwHOKUfw+fJJVh8PoTGhm0rfJi5boMUyxT
	 6fINywjF3BAlr+1GZvzLgUP42PeKrQDILlGAV1x0gAM0fH7l00096Y3FWQHAx+KftG
	 YfAppIfIFXH1ZtiXuCqF94eO+3D34Df9Su4psMZmk8rkZUPRHT90LvVKLw36esc3VM
	 SUpskeW/jxViSP/lTe6oOVq89IpNjVUywZ05vanxyDrT1YJhaeBE21T6FtAO+GSv5x
	 RPqkz3brfaOwg==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-649389b1cc5so5015420d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 01:35:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZgbX3mqrmPxgGNCk01Ohlx863ofIV2JLo5gglUyM42TritDAInennIZI/De7asD8i3Gu+DMLzvfzk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkq9kuHVx+PohYdEC/Jkti4W1G0L27FMGMqpIetfEDKtPZrRUd
	Y7iXtLD2WiORyumxAp5C02xIIHA8lfisNoXuL5T98vCfr4Tnc7QqouyLvWFhOPpk1kfO9bxtvVu
	GUVIoqkH6XBb25kX4i8OKNe1l+XwSJ0o=
X-Received: by 2002:a05:690e:1247:b0:649:cd21:ff2d with SMTP id
 956f58d0204a3-649cd2205e8mr3145125d50.11.1770111325938; Tue, 03 Feb 2026
 01:35:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203060210.972243-1-tzungbi@kernel.org>
In-Reply-To: <20260203060210.972243-1-tzungbi@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 10:35:14 +0100
X-Gmail-Original-Message-ID: <CAD++jL=vkMYQSKxq+5LsEW7aQAkbvVf00gv64hYRjWwsqzSHZg@mail.gmail.com>
X-Gm-Features: AZwV_Qj0aDwF1esc-LscvSNaGGP23O7sWpUmoDhseGYrLIdQd_6RleW2FssFXh0
Message-ID: <CAD++jL=vkMYQSKxq+5LsEW7aQAkbvVf00gv64hYRjWwsqzSHZg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31382-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: ECA78D6F17
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 7:02=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:

> Since commit aab5c6f20023 ("gpio: set device type for GPIO chips"),
> `gdev->dev.release` is unset.  As a result, the reference count to
> `gdev->dev` isn't dropped on the error handling paths.
>
> Drop the reference on errors.
>
> Also reorder the instructions to make the error handling simpler.
> Now gpiochip_add_data_with_key() roughly looks like:
>
>    >>> Some memory allocation.  Go to ERR ZONE 1 on errors.
>    >>> device_initialize().
>
>    (gpiodev_release() takes over the responsibility for freeing the
>     resources of `gdev->dev`.  The subsequent error handling paths
>     shouldn't go through ERR ZONE 1 again which leads to double free.)

This doesn't need to be parenthesized, it should be pointed out
so people can follow it, also:

> @@ -1048,71 +1052,67 @@ int gpiochip_add_data_with_key(struct gpio_chip *=
gc, void *data,
>         int base =3D 0;
>         int ret;
>
> -       /*
> -        * First: allocate and populate the internal stat container, and
> -        * set up the struct device.
> -        */
>         gdev =3D kzalloc(sizeof(*gdev), GFP_KERNEL);
>         if (!gdev)
>                 return -ENOMEM;
> -
> -       gdev->dev.type =3D &gpio_dev_type;
> -       gdev->dev.bus =3D &gpio_bus_type;
> -       gdev->dev.parent =3D gc->parent;
> -       rcu_assign_pointer(gdev->chip, gc);
> -
>         gc->gpiodev =3D gdev;
>         gpiochip_set_data(gc, data);
>
> -       device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
> -
>         ret =3D ida_alloc(&gpio_ida, GFP_KERNEL);
>         if (ret < 0)
>                 goto err_free_gdev;
>         gdev->id =3D ret;
>
> -       ret =3D dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
> +       ret =3D init_srcu_struct(&gdev->srcu);
>         if (ret)
>                 goto err_free_ida;
> +       rcu_assign_pointer(gdev->chip, gc);
>
> -       if (gc->parent && gc->parent->driver)
> -               gdev->owner =3D gc->parent->driver->owner;
> -       else if (gc->owner)
> -               /* TODO: remove chip->owner */
> -               gdev->owner =3D gc->owner;
> -       else
> -               gdev->owner =3D THIS_MODULE;
> +       ret =3D init_srcu_struct(&gdev->desc_srcu);
> +       if (ret)
> +               goto err_cleanup_gdev_srcu;
> +
> +       ret =3D dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
> +       if (ret)
> +               goto err_cleanup_desc_srcu;
> +
> +       device_initialize(&gdev->dev);
> +       gdev->dev.type =3D &gpio_dev_type;


This is the point where, from this point on, gpiodev_release() will
get called from the type.

This is worth a comment in the code don't you think?

Something like:

/*
 * After this point any allocated resources will be free():d by
 * gpiodev_release(), if you add new resources then make sure
 * they get free():ed there.
 */
gdev->dev.type =3D &gpio_dev_type;

This helps developers to do the right thing.

With that added comment:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

