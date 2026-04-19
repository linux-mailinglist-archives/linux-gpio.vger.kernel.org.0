Return-Path: <linux-gpio+bounces-35231-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMz1EHqr5Gl9YAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35231-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 12:16:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E24239CD
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 12:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E88C1300E39E
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 10:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCF130ACFB;
	Sun, 19 Apr 2026 10:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="acoJCEHc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A3929CE1;
	Sun, 19 Apr 2026 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776593764; cv=none; b=pXPhZA934uIos2AmCYfXDRQcQaqIsT99j1OCRb9omZcm7mKSarr47TzaIME7jFWNQa31ISKMEHTXLuM/9Cnkabiyds73Eka51kwbcucTLfqtFG/gJeTMxGlmKn8dXGo2eCqNvXPTdhDhT25AxWY/HJgXmFHKqVjr/q+ut39mg0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776593764; c=relaxed/simple;
	bh=Azs/OAFgrKC+zmaNo+iig0D2j/0xfMAyhNFe1KV+l5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QmVOBe9wfe35wJPoBCV+KBZlAKvgw6fIMdUqJqf2EHWd0iDrVVvttjnDMVLdWdGw/nhVLrPLZpNIA6+pIVUECXQK+OyPDHTUYgkIXd0coJrseOFw+yLv7eb9xHOFD1e46hvBM0GzglPnMcu8P3gghF4a3GvHwOO5gG5seJE6H+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=acoJCEHc; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=3hALoF0Oo7o1hFUzR9bl3PUJDzj00xQhW5r1yoXZYQs=; b=acoJCEHcollrpbOxAJevsKGWUM
	LbUHHMHCGAuFK9Z1DikrcPh+8Wl/rD3Md3X2Cx/OdphYPfYvGyUTnEULIcJlK7THYu0mgSX8w529Z
	em9wMX672M6pQNVNreXnvxDyY/FMX4NypD/Tm36Sd16YjCT5/dKva42QICdwpLWVdM3lPhij07qwb
	zh6NKZTZFn3inHqyKY0QU59vai1k73gSPggLD6GlpM+4Bz3tf6sZb5ut8Pa3UJ97Ns6hJlAojACsX
	TObHyVOp7ZG34IqpGJeY34RtyzH814kHmCZKP4ZYT4QYlBhU5+99/bQF8DVhPpaVU5DLfzltto3cl
	mapE4tZQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] gpio: rockchip: Fix GPIO after convert to dynamic base allocation
Date: Sun, 19 Apr 2026 12:15:35 +0200
Message-ID: <3847682.RUnXabflUD@phil>
In-Reply-To: <20260416154928.2103388-1-jonas@kwiboo.se>
References: <20260416154928.2103388-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35231-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[sntech.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sntech.de:dkim,sntech.de:email,kwiboo.se:email,ff790000:email,ff720000:email]
X-Rspamd-Queue-Id: 900E24239CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am Donnerstag, 16. April 2026, 17:49:28 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Jonas Karlman:
> The commit c8079f83e0bf ("gpio: rockchip: convert to dynamic GPIO base
> allocation") broke GPIO on devices using device trees which don't set
> the gpio-ranges property, something only Rockchip RK35xx SoC DTs do.
>=20
> On a Rockchip RK3399 device something like following is now observed:
>=20
> [    0.082771] rockchip-gpio ff720000.gpio: probed /pinctrl/gpio@ff720000
> [    0.083531] rockchip-gpio ff730000.gpio: probed /pinctrl/gpio@ff730000
> [    0.084110] rockchip-gpio ff780000.gpio: probed /pinctrl/gpio@ff780000
> [    0.084746] rockchip-gpio ff788000.gpio: probed /pinctrl/gpio@ff788000
> [    0.085389] rockchip-gpio ff790000.gpio: probed /pinctrl/gpio@ff790000
> --
> [    0.212208] rockchip-pinctrl pinctrl: pin 637 is not registered so it =
cannot be requested
> [    0.212271] rockchip-pinctrl pinctrl: error -EINVAL: pin-637 (gpio3:63=
7)
> [    0.212344] leds-gpio leds: error -EINVAL: Failed to get GPIO '/leds/l=
ed-0'
> [    0.212389] leds-gpio leds: probe with driver leds-gpio failed with er=
ror -22
> --
> [    0.607545] rockchip-pinctrl pinctrl: pin 519 is not registered so it =
cannot be requested
> [    0.608775] rockchip-pinctrl pinctrl: error -EINVAL: pin-519 (gpio0:51=
9)
> [    0.610003] dwmmc_rockchip fe320000.mmc: probe with driver dwmmc_rockc=
hip failed with error -22
> --
> [    0.805882] rockchip-pinctrl pinctrl: pin 547 is not registered so it =
cannot be requested
> [    0.806672] rockchip-pinctrl pinctrl: error -EINVAL: pin-547 (gpio1:54=
7)
> [    0.807301] reg-fixed-voltage regulator-vbus-typec: error -EINVAL: can=
't get GPIO
> [    0.807307] rockchip-pinctrl pinctrl: pin 602 is not registered so it =
cannot be requested
> [    0.807970] reg-fixed-voltage regulator-vbus-typec: probe with driver =
reg-fixed-voltage failed with error -22
> [    0.808692] rockchip-pinctrl pinctrl: error -EINVAL: pin-602 (gpio2:60=
2)
> [    0.810279] reg-fixed-voltage regulator-vcc3v3-pcie: error -EINVAL: ca=
n't get GPIO
> [    0.810284] rockchip-pinctrl pinctrl: pin 665 is not registered so it =
cannot be requested
> [    0.810299] rockchip-pinctrl pinctrl: error -EINVAL: pin-665 (gpio4:66=
5)
> [    0.810960] reg-fixed-voltage regulator-vcc3v3-pcie: probe with driver=
 reg-fixed-voltage failed with error -22
> [    0.811679] reg-fixed-voltage regulator-vcc5v0-host: error -EINVAL: ca=
n't get GPIO
> [    0.813943] reg-fixed-voltage regulator-vcc5v0-host: probe with driver=
 reg-fixed-voltage failed with error -22
> --
> [    0.867788] rockchip-pinctrl pinctrl: pin 522 is not registered so it =
cannot be requested
> [    0.868537] rockchip-pinctrl pinctrl: error -EINVAL: pin-522 (gpio0:52=
2)
> [    0.869166] pwrseq_simple sdio-pwrseq: error -EINVAL: reset GPIOs not =
ready
> [    0.869798] pwrseq_simple sdio-pwrseq: probe with driver pwrseq_simple=
 failed with error -22
> --
> [    0.940365] rockchip-pinctrl pinctrl: pin 623 is not registered so it =
cannot be requested
> [    0.941084] rockchip-pinctrl pinctrl: error -EINVAL: pin-623 (gpio3:62=
3)
> [    0.941823] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: Cannot reg=
ister the MDIO bus
> [    0.942542] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: MDIO bus (=
id: 0) registration failed
> [    0.943772] rk_gmac-dwmac fe300000.ethernet: probe with driver rk_gmac=
=2Ddwmac failed with error -22
>=20
> Restore GPIO to a working state on devices using older Rockchip SoCs
> and/or DTs not having the gpio-ranges property set by restoring prior
> use of bank->pin_base as the pin_offset value.
>=20
> Also change to use bank->nr_pins as the npins value to align and prevent
> a possible future breakage if gc->ngpio is ever changed to match the 32
> GPIOs each controller theoretically can handle.
>=20
> Fixes: c8079f83e0bf ("gpio: rockchip: convert to dynamic GPIO base alloca=
tion")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/gpio/gpio-rockchip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 08ea64434f8f..44d7ebd12724 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -617,7 +617,7 @@ static int rockchip_gpiolib_register(struct rockchip_=
pin_bank *bank)
>  			return -ENODEV;
> =20
>  		ret =3D gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
> -					     gc->base, gc->ngpio);
> +					     bank->pin_base, bank->nr_pins);
>  		if (ret) {
>  			dev_err(bank->dev, "Failed to add pin range\n");
>  			goto fail;
>=20





