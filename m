Return-Path: <linux-gpio+bounces-30380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50095D0C927
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 00:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D31073026AD3
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 23:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312733396F7;
	Fri,  9 Jan 2026 23:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="auJW8HSa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B89F500970;
	Fri,  9 Jan 2026 23:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768002949; cv=pass; b=BlR2WY09gpeBlfmkW85xJqMbQ/DlY0wrzXnmZShqJdWpqxy5bZ2KyAhYNg+7w9KRbcJkBlAc/QQ7U8zxjCZg/Y0r4jCA24a3e8D/bYlgsBsq0mmrKzEiIZ30kxNPB7FWRdUmSQ/TM6LR1BspyllyritIcjd1wGa3tzGG6JJ/f0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768002949; c=relaxed/simple;
	bh=ROuF2oSpzd8c4QiCEc+hD6nAk2bycBRppZcBg9982no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYVUT6HpeA3qgiWrrPfyp1FNKJvGLzP1j2/L4dH++56e2JkqABvD/uVX5NcA+wcgG/uwXmgKXxuzuHrRaBuclhuxMJVBnFHElmbu2TKIS4v+5uki2hd9qt2A0VA2SZtujZs2VQFNjCfzvXoPGOGQu/G6RSauEugDo2yXeWe2F9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=auJW8HSa; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1768002934; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NN3OwAe3jAgm4sj+vobEY2X8WnSQF/J1fsHm6sqoA1Gicef08O3Wqj8jPMRcM/xS2+Av91XGqAOy50JylgxFk2atLFBm3R+6hiIvt3vHipdMhFq042yrExh8xCEtlx3DHikLXbiuQFoTLnro2GEkBO0HSJrA5OOqq8mRZmo0NtE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768002934; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=s24MoONrvK08rlo8bvl9m7ipijoyg03naqbwQJacKSM=; 
	b=gcMaQHkYds4p20B7x9uTLQbzUzkpazPoezzcbhWhqrPem+slEkzjusurzeCC18WqiYbbtsd+PnoRGXTFwib1T4giFcHd20FJbuMG/GqudXwWdSQwGf0HxR5rJqiGAUqtAxQPW04BwDYjLoo3X8kKc9AYLxWR35KUKr7rJdIEvCw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768002933;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=s24MoONrvK08rlo8bvl9m7ipijoyg03naqbwQJacKSM=;
	b=auJW8HSabqLSRaDzXx3HgRLo2lU27TAvemK1wH7fWCrlPYBVav0uSLTWIFpIBTvp
	ddmUq7dX39NmGurcAUxJreSqqr4nWbhHmQSHBccT4JELT3oh4nV0DvMDdvPsW/PCUQ5
	woxYuKlTj2D9aB4IR4zce3RKJvrgCNVvZLpPuGZU=
Received: by mx.zohomail.com with SMTPS id 1768002932813394.04223648136076;
	Fri, 9 Jan 2026 15:55:32 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 8DBCD180789; Sat, 10 Jan 2026 00:55:28 +0100 (CET)
Date: Sat, 10 Jan 2026 00:55:28 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
Message-ID: <aWGSQYCXP4R08koQ@venus>
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="shwp5pkjv7w45ocl"
Content-Disposition: inline
In-Reply-To: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.5.1/267.941.65
X-ZohoMailClient: External


--shwp5pkjv7w45ocl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
MIME-Version: 1.0

Hi,

On Tue, Jan 06, 2026 at 10:00:11AM +0100, Bartosz Golaszewski wrote:
> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization.
>=20
> This can cause the following lockdep splat with shared GPIOs enabled on
> boards which have multiple devices using the same GPIO:
>=20
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:591
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 12, name:
> kworker/u16:0
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> 6 locks held by kworker/u16:0/12:
>   #0: ffff0001f0018d48 ((wq_completion)events_unbound#2){+.+.}-{0:0},
> at: process_one_work+0x18c/0x604
>   #1: ffff8000842dbdf0 (deferred_probe_work){+.+.}-{0:0}, at:
> process_one_work+0x1b4/0x604
>   #2: ffff0001f18498f8 (&dev->mutex){....}-{4:4}, at:
> __device_attach+0x38/0x1b0
>   #3: ffff0001f75f1e90 (&gdev->srcu){.+.?}-{0:0}, at:
> gpiod_direction_output_raw_commit+0x0/0x360
>   #4: ffff0001f46e3db8 (&shared_desc->spinlock){....}-{3:3}, at:
> gpio_shared_proxy_direction_output+0xd0/0x144 [gpio_shared_proxy]
>   #5: ffff0001f180ee90 (&gdev->srcu){.+.?}-{0:0}, at:
> gpiod_direction_output_raw_commit+0x0/0x360
> irq event stamp: 81450
> hardirqs last  enabled at (81449): [<ffff8000813acba4>]
> _raw_spin_unlock_irqrestore+0x74/0x78
> hardirqs last disabled at (81450): [<ffff8000813abfb8>]
> _raw_spin_lock_irqsave+0x84/0x88
> softirqs last  enabled at (79616): [<ffff8000811455fc>]
> __alloc_skb+0x17c/0x1e8
> softirqs last disabled at (79614): [<ffff8000811455fc>]
> __alloc_skb+0x17c/0x1e8
> CPU: 2 UID: 0 PID: 12 Comm: kworker/u16:0 Not tainted
> 6.19.0-rc4-next-20260105+ #11975 PREEMPT
> Hardware name: Hardkernel ODROID-M1 (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>   show_stack+0x18/0x24 (C)
>   dump_stack_lvl+0x90/0xd0
>   dump_stack+0x18/0x24
>   __might_resched+0x144/0x248
>   __might_sleep+0x48/0x98
>   __mutex_lock+0x5c/0x894
>   mutex_lock_nested+0x24/0x30
>   pinctrl_get_device_gpio_range+0x44/0x128
>   pinctrl_gpio_direction+0x3c/0xe0
>   pinctrl_gpio_direction_output+0x14/0x20
>   rockchip_gpio_direction_output+0xb8/0x19c
>   gpiochip_direction_output+0x38/0x94
>   gpiod_direction_output_raw_commit+0x1d8/0x360
>   gpiod_direction_output_nonotify+0x7c/0x230
>   gpiod_direction_output+0x34/0xf8
>   gpio_shared_proxy_direction_output+0xec/0x144 [gpio_shared_proxy]
>   gpiochip_direction_output+0x38/0x94
>   gpiod_direction_output_raw_commit+0x1d8/0x360
>   gpiod_direction_output_nonotify+0x7c/0x230
>   gpiod_configure_flags+0xbc/0x480
>   gpiod_find_and_request+0x1a0/0x574
>   gpiod_get_index+0x58/0x84
>   devm_gpiod_get_index+0x20/0xb4
>   devm_gpiod_get_optional+0x18/0x30
>   rockchip_pcie_probe+0x98/0x380
>   platform_probe+0x5c/0xac
>   really_probe+0xbc/0x298
>=20
> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> Cc: stable@vger.kernel.org
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/d035fc29-3b03-4cd6-b8ec-001f93540bc6@=
samsung.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/gpio/gpio-rockchip.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 47174eb3ba76..bae2061f15fc 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -593,6 +593,7 @@ static int rockchip_gpiolib_register(struct rockchip_=
pin_bank *bank)
>  	gc->ngpio =3D bank->nr_pins;
>  	gc->label =3D bank->name;
>  	gc->parent =3D bank->dev;
> +	gc->can_sleep =3D true;

This means all operations are marked as can_sleep, even though
pinctrl operations are only used for the direction setting.
I.e. the common get/set operations always worked in atomic mode,
but now complain. See for example:

https://lore.kernel.org/all/20260108-media-synopsys-hdmirx-fix-gpio-canslee=
p-v1-1-3570518d8bab@kernel.org/

It's not a big issue for the hdmirx driver specifically, but I wonder
how many more (less often tested) rockchip drivers use GPIOs from their
IRQ handler.

Considering setting or getting the GPIO from atomic context is much
more common than changing the direction - is there some way to
describe the sleep behavior in a more specific way in the GPIO
controller?

Greetings,

-- Sebastian

--shwp5pkjv7w45ocl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlhlW0ACgkQ2O7X88g7
+pptgBAAqh8+3YVQeIEjk22P/v18zzNGOuX29yWFErdZn7R8KUGlNqXEklmrgdJ8
MVHvoisa0IuCRm/O7AHTKy3SR9MOt9BpUoozoVThpoNWlmjbcQ8wGCrQDnzTRePm
8u/ZgmsNyHkf+CeYy1SkuJxwuFibYFfPQE1naXeDQp+kN2LSrLIeg25QdgWX9nP8
dAJghSuVvYMu5Sg78nvollkgXk245dq2LSAqMxc6FfA7XF1RFURvOk4XdGdDjmJb
E/nnx1lWfoy2lMITtW7QukH5Mko03PDdGflG8PnaTJCumumcBBO7EMnMRqPcxSUm
K4q+amfrIW8EH8GJleIzJhSRijC1WzslEy4b74V+EMwlgeZbbzZI9yaT2bIImfZi
T8MRwyl3+tZsfoQFtXDQeeuQcQusoec43jEhFpdd5PRf7D2I/0F/qRXP7yKvgsvT
Vf7YTxFaojf5ELnv6DWGW7MPSx6js/+0CJSeA5nU92ooJG+ogVi9fFhXYmcAtiSG
52ifwTG0yBy/sXNp05M2SN98rCzOyWuNpS7/o40gBasszuxK2Imxw4YnlCeeYZPM
2rBhcWeYNy9Qj2ih54hWCHMnjAxhlLMQHf+c/suGvR9tBcNRcY6Y29Zc4+LjJnJl
ArrfYls9QZQUFmbwaWEg5GCLKg0offR0aoQc6iKXwulG+QzBonE=
=2/cV
-----END PGP SIGNATURE-----

--shwp5pkjv7w45ocl--

