Return-Path: <linux-gpio+bounces-31092-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALxFEqKYd2n0iwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31092-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 17:38:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C098AC7C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 17:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AFE4300693F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 16:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A6B344050;
	Mon, 26 Jan 2026 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ZqRrhOeX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF98242D62;
	Mon, 26 Jan 2026 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445531; cv=none; b=Dgnm8ktC0FHdmAYdJiDYtuky6daMTVUsHH9I3buXIRDZ/uY1+v6RTjBU40cI0Vgz/RU6jSLmJdC1wQHyTY9PnEcN1KHjg+NFKPD6IDHMg7oB3wTgJTDIXyq03A7sGZJi0rSEhREN8PXO+7jAfWViOArhpN2uRXHQPnbYOMKRa4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445531; c=relaxed/simple;
	bh=8fts/VZKJiC55nHj6gbEWZNzar+wv0FcNa5ouJZUEKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pcF5RWLM0R8yy5xN4APuHmZ1+A0EmwWorzEJhKzJU8vKq3T3++EStF11REgsru9B/XPXloFHTXGDavPMqtddaMdxcvHkVlXdcIwDPkltnINqEUx+KB6e8FQTJOxPZ2O/047TAhm99r1U+tnNu0nMWPnd6KgvjNKBTNAt1Y7ihpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ZqRrhOeX; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gzddAU+RboppgCwaNHzXk3IOvCbzpxU1v9uinFxITAQ=; b=ZqRrhOeX8v3fY66YMAulspBQhU
	mAHebhBX/PNvGnCyoTsp+sIqbJRWfuwDwOw4A5rdnKeiV5DEBnME/ZLPol/TRyjh/BLWuVaZkhrwJ
	Ygfznj2PYb8oEBzPldzr3g7MF8nrI0hktmTGyDgSynRS6oC8Zc15BhNpRNuh0M7uZRV/QP8psJAwH
	5OU0MnjXh6Xnh8xLuJMWVEW8v7RxMdbi0W8Eh3fPtOGjZElncHJIIWpnKVO2PT+fDbB9G2B0EB5Tz
	JhhopNvlOhT3h0yyYXg1xBqhuTEwGDJL+W5MKj2ZdXN5ASWJrFJvaWuxpGJ/xM3F3IRffJDS/k4WS
	4mXSHUTQ==;
Received: from i53875a0f.versanet.de ([83.135.90.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vkPbe-004dz9-4w; Mon, 26 Jan 2026 17:38:26 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: brgl@kernel.org, linusw@kernel.org, Robin Murphy <robin.murphy@arm.com>
Cc: sebastian.reichel@collabora.com, m.szyprowski@samsung.com,
 linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio/rockchip: Stop calling pinctrl for set_direction
Date: Mon, 26 Jan 2026 17:38:25 +0100
Message-ID: <10827351.CDJkKcVGEf@diego>
In-Reply-To:
 <bddc0469f25843ca5ae0cf578ab3671435ae98a7.1769429546.git.robin.murphy@arm.com>
References:
 <bddc0469f25843ca5ae0cf578ab3671435ae98a7.1769429546.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,none];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31092-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[sntech.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:email,sntech.de:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 70C098AC7C
X-Rspamd-Action: no action

Am Montag, 26. Januar 2026, 13:12:26 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Robin Murphy:
> Marking the whole controller as sleeping due to the pinctrl calls in the
> .direction_{input,output} callbacks has the unfortunate side effect that
> legitimate invocations of .get and .set, which cannot themselves sleep,
> in atomic context now spew WARN()s from gpiolib.
>=20
> However, as Heiko points out, the driver doing this is a bit silly to
> begin with, as the pinctrl .gpio_set_direction hook doesn't even care
> about the direction, the hook is only used to claim the mux. And sure
> enough, the .gpio_request_enable hook exists to serve this very purpose,
> so switch to that and remove the problematic business entirely.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as sleepin=
g")
> Suggested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

This really looks great and solves the problem of the sleeping gpio-driver
in a nice way. Especially as we really only need the pinmux on request
at all.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> If I don't have to redesign bits of the GPIO subsystem itself, this much
> I can do :)
>=20
> Tested on RK3399 NanoPC-T4 with GPIOs with and without explicit pinctrl,
> and PROVE_LOCKING and DEBUG_ATOMIC_SLEEP stayed quiet (although I don't
> think this board has any shared pins)
> ---
>  drivers/gpio/gpio-rockchip.c       | 8 --------
>  drivers/pinctrl/pinctrl-rockchip.c | 9 ++++-----
>  2 files changed, 4 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index bae2061f15fc..0fff4a699f12 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -18,7 +18,6 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> -#include <linux/pinctrl/consumer.h>
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -164,12 +163,6 @@ static int rockchip_gpio_set_direction(struct gpio_c=
hip *chip,
>  	unsigned long flags;
>  	u32 data =3D input ? 0 : 1;
> =20
> -
> -	if (input)
> -		pinctrl_gpio_direction_input(chip, offset);
> -	else
> -		pinctrl_gpio_direction_output(chip, offset);
> -
>  	raw_spin_lock_irqsave(&bank->slock, flags);
>  	rockchip_gpio_writel_bit(bank, offset, data, bank->gpio_regs->port_ddr);
>  	raw_spin_unlock_irqrestore(&bank->slock, flags);
> @@ -593,7 +586,6 @@ static int rockchip_gpiolib_register(struct rockchip_=
pin_bank *bank)
>  	gc->ngpio =3D bank->nr_pins;
>  	gc->label =3D bank->name;
>  	gc->parent =3D bank->dev;
> -	gc->can_sleep =3D true;
> =20
>  	ret =3D gpiochip_add_data(gc, bank);
>  	if (ret) {
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
=2Drockchip.c
> index e44ef262beec..2fc67aeafdb3 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3545,10 +3545,9 @@ static int rockchip_pmx_set(struct pinctrl_dev *pc=
tldev, unsigned selector,
>  	return 0;
>  }
> =20
> -static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
> -					   struct pinctrl_gpio_range *range,
> -					   unsigned offset,
> -					   bool input)
> +static int rockchip_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
> +					    struct pinctrl_gpio_range *range,
> +					    unsigned int offset)
>  {
>  	struct rockchip_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev);
>  	struct rockchip_pin_bank *bank;
> @@ -3562,7 +3561,7 @@ static const struct pinmux_ops rockchip_pmx_ops =3D=
 {
>  	.get_function_name	=3D rockchip_pmx_get_func_name,
>  	.get_function_groups	=3D rockchip_pmx_get_groups,
>  	.set_mux		=3D rockchip_pmx_set,
> -	.gpio_set_direction	=3D rockchip_pmx_gpio_set_direction,
> +	.gpio_request_enable	=3D rockchip_pmx_gpio_request_enable,
>  };
> =20
>  /*
>=20





