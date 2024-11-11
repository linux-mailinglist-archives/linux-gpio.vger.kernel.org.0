Return-Path: <linux-gpio+bounces-12835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 595029C4986
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 00:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 177CB288358
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 23:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CA81A08A3;
	Mon, 11 Nov 2024 23:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="XBmuFp3x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D31224FD;
	Mon, 11 Nov 2024 23:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731366144; cv=pass; b=SE/A04Pmvs92qj9oxW+JQTeSM07aYJ1/c8YOUPG3wNMsk1I9rl57HeFoU+JrlcPZln3iESO4fVCLbKPWsWe7lxGPOBIPwOnisHZutzcoVsb0axyRyRwmizbBO8wjmQvYef2yOIqpaCwnzsQis+8UkuIAwIvHJo6vck0R8ZU0AOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731366144; c=relaxed/simple;
	bh=L3YqrZ8c1afv2KPFq5IYUPEZ7m8x9Zd+jTFEWvmDMuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbQ+wRt18FHvRXqsZPG6bLWFfizM5m4e5zF2cR8wPc/XyEiZaLdGrqY/GVl40AoZPgz2HTUWwrQaekYjWNj1s5YaESegts9zwUDT2mA+DkAtqst5qvrAC0uYF/Q092KkzOeSO/o30wkLgGCSLi0mDAyM8jUDz/rhGxFbtbSCiLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=XBmuFp3x; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731366126; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g/Yz57YJhY2Ik8qETjfI+9U/OftgnBNe8hwqlteJebKRwk3SBSiNGfLaYhT5LRv6HZ+O5yzzH9S478IY4fkVPPsB02gS8g3GmurF8K8Ls66YO70wLY2GkEMAu38pZb5+wqbzdpMUhEWuLrWyOsQ6MH8HUfXJ/f+fyVY9LEY3XUI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731366126; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hPRVom/8RjWezWblZ3K3t1teLpTNa9AC8C0X/PUx5JY=; 
	b=mO9AklKbipJKU/jmI1JT9+eJUMyLsdN6sNJqegi+0MqLeFTWbw4KFx5AZKj3+xYjF9DRwl0qPKGpRdTl195XHqhl1c02bgmtqzp32iAKme/N+79NJFgE5X0UEVMiB+Oejc45wUcXJQM8YgUT7d+1AZknqy0key0SVSvqYVZFaVs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731366126;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=hPRVom/8RjWezWblZ3K3t1teLpTNa9AC8C0X/PUx5JY=;
	b=XBmuFp3x1T2HyEZ9JwdSrp8Fl2KmEs23PL7Fu8ANTMpFTxtcB9OCqM7ElmmQdmsP
	WhlPcowqe9Nf4f8L4hfmpWxxGDAZQ0cMsdW5ZGcz7wwe3dNYHN+s2SPf1gOcl3hcKgI
	ag4F052wStl89jMlk9D5yo2vW6PI0Nnly9v+PeZI=
Received: by mx.zohomail.com with SMTPS id 1731366125552486.2187532054958;
	Mon, 11 Nov 2024 15:02:05 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
	id BA8611060457; Tue, 12 Nov 2024 00:02:00 +0100 (CET)
Date: Tue, 12 Nov 2024 00:02:00 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, finley.xiao@rock-chips.com, 
	tim.chen@rock-chips.com, elaine.zhang@rock-chips.com
Subject: Re: [PATCH v4 4/4] gpio: rockchip: Set input direction when request
 irq
Message-ID: <tqve7heg2dwbxzbmcinyt6qhsjzlnddmbf6toxizxixghfth5y@d6g22ith7eqf>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
 <20241111023412.3466161-5-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eqdhcrysbp4nlnmm"
Content-Disposition: inline
In-Reply-To: <20241111023412.3466161-5-ye.zhang@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/231.287.20
X-ZohoMailClient: External


--eqdhcrysbp4nlnmm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 4/4] gpio: rockchip: Set input direction when request
 irq
MIME-Version: 1.0

Hi,

On Mon, Nov 11, 2024 at 10:34:12AM +0800, Ye Zhang wrote:
> Since the GPIO can only generate interrupts when its direction is set to
> input, it is set to input before requesting the interrupt resources.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpio/gpio-rockchip.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index b7a43e492965..40c2476699aa 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -476,8 +476,11 @@ static int rockchip_irq_reqres(struct irq_data *d)
>  {
>  	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>  	struct rockchip_pin_bank *bank =3D gc->private;
> +	irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> =20
> -	return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
> +	rockchip_gpio_direction_input(&bank->gpio_chip, hwirq);
> +
> +	return gpiochip_reqres_irq(&bank->gpio_chip, hwirq);
>  }
> =20
>  static void rockchip_irq_relres(struct irq_data *d)
> --=20
> 2.34.1
>=20
>=20

--eqdhcrysbp4nlnmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmcyjOgACgkQ2O7X88g7
+pp6lw/8CQDrUfA+mk0LAGtKVejWOvdaGfNTnCa7DY5P3llWNqKwCJfQyKbHlKH/
5SE//XbN6eODOyLRxw46HxFN4CCGpkIKIga1cpUWFA5HXCLLLVellpdXOsJ4U917
Fp4SDGlzyX9Mv6hTyMHvDbPmnsD+xKaf+H2/szyqUCB/sqLSx7TFzkee1JbgYKmW
xZEQ7AWnzqtZ6SEEUBXv8zVxYwc/mUybhf7X+67H7DGGgfF8dZ7TDdPQ55TR8LxK
72BF8VcTDIZCA0yJPAmOkBRlUABtyMff9IIrTN7vAdra8IXIjY0t3nnJKgD/7Zx/
1XncXqdTz7Zvyjzx/gy7m4OfNIgrAIJjQeXgiSr69plQvYkasPF9pi+BTa/rZo7E
kzkM9tlJ0wj7uIR2x8pss40s/bLOR7GCh78gAiCBsE4IToiW5OTtTJxvc0kE4j8X
VBOViWxYYXXDiXptInpronVaRp2H3Np5vodXHTRgC4mpyyG9Lx/QVrZp/e708/mN
agbxOBRl6ZNPqLiFKSNaaVxqfeF8PJeusuJHgU+5CswN3ensorw5NHRGfl2QyV5M
7YBrUr9BWEd1MqdxXHtlYuL5vnRECJMjN/4BhtZaPTFRUDFrtNYhivkKDYmPK3o3
8itQUu/BhsJXA9Rw5doEEiJ53rxOByLygcGJbbsdwyObmk9xxEw=
=pqGX
-----END PGP SIGNATURE-----

--eqdhcrysbp4nlnmm--

