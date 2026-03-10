Return-Path: <linux-gpio+bounces-32904-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCekCXrjr2nkdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32904-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:25:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83251248558
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8610E3018406
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C1443CEF5;
	Tue, 10 Mar 2026 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="RLL5cx9M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B662C0F6D;
	Tue, 10 Mar 2026 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134709; cv=none; b=lp6A7IxCkWdC4JQpbIHVnI4EhVV20ITsV24h9UHd4wkQTCqHrUhztZLnz8LV8oxUgx5e/wQgdZx/c5JcFzHlsMjNcWTZlBovDTVvzeJf2F4LeHra6wQdy/RBltwWFARz8OH3vxiak3TKyrukiwotGQuqJ78ST3jfafQr3PE+5JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134709; c=relaxed/simple;
	bh=ZYPZP303acQimntExRwnf0OKXbz/OJ7MyaDMh8CkayU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0/SMB3Vc2nVEaDCwdKm8O+j9ZdPtoXyTWLzW8fjbAHyEkDaFBQQbDh0JrPYH38pNXR9ry1JBUdHS6m1tO0peoxqfP0cf2g5+TPYCRR/WDnieeR+3P8dfRvQNZPUCK/kKFW8ixkV24BZ8yVBNqNHZIhrBuAACQ/YDf3p0MXaCWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=pass smtp.mailfrom=stdin.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=RLL5cx9M; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stdin.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Jurke3t2EyAB5+kik9FcOqNaKymdC6aoDQcLoDZKbXc=; b=RLL5cx9MD2m8r+X9gRVzVpVqZs
	RWsU1OHvsr6fp+kbOZjI/bIzss324l6KeKJJJjUdmkUWLz585TZR5otE81+7jCvOv3OD+3/PWAXZx
	2G4mvfUSS7uyy2+r8v8M6c1B10ZJ7iZ45+kw3/c/mJkeAotgH2hCq5OmzMrESIJEwRJU=;
X-Preliminary-Spam-Score: -4.4 (----)
Received: from [10.42.0.16] (helo=login.tika.stderr.nl)
	by tika.stderr.nl with smtp (Exim 4.96)
	(envelope-from <matthijs@stdin.nl>)
	id 1vzsqH-0002Jb-2J;
	Tue, 10 Mar 2026 09:53:32 +0100
Received: (nullmailer pid 2675120 invoked by uid 2001);
	Tue, 10 Mar 2026 08:53:29 -0000
Date: Tue, 10 Mar 2026 09:53:29 +0100
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH RESEND 1/2] arm64: dts: rockchip: rk3308: Add gpio-ranges
 properties
Message-ID: <aa_cCCc7FqdSv8eX@login.tika.stderr.nl>
Mail-Followup-To: Matthijs Kooijman <matthijs@stdin.nl>,
	Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
References: <20260302202121.197288-1-matthijs@stdin.nl>
 <20260302202121.197288-3-matthijs@stdin.nl>
 <e439f2f7-0b25-41a5-951a-d8d3bc9f2bf2@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y0Af1s2EGjNyxXmK"
Content-Disposition: inline
In-Reply-To: <e439f2f7-0b25-41a5-951a-d8d3bc9f2bf2@kwiboo.se>
X-PGP-Fingerprint: E7D0 C6A7 5BEE 6D84 D638  F60A 3798 AF15 A156 5658
X-PGP-Key: http://www.stderr.nl/static/files/gpg_pubkey.asc
X-Rspamd-Queue-Id: 83251248558
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_DKIM_REJECT(1.00)[mail.tikatika.nl:s=201709.tika];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32904-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[stdin.nl];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[mail.tikatika.nl:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthijs@stdin.nl,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,login.tika.stderr.nl:mid]
X-Rspamd-Action: no action


--Y0Af1s2EGjNyxXmK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

Thanks for your review.

> > This does not immediately change functionality, because the
> > gpio-rockchip.c driver has a workaround that defines ranges when they
> > are not present in DT, but that relies on global gpio numbering (so
> > AFAICS only works when the rockchip gpio banks are initialized first and
> > in-order).
>=20
> This is strictly not correct, the driver use the gpioX alias id as
> defined in the device tree and does not depend on the initialization
> order.

Ah, I had not realized these aliases existed. However, it seems they are
not actually relevant in this case. My assumption was that gpio
numbering was based on initalizating order, but I see in the code that
GPIO drivers decide themselves (by setting gc->base statically or maybe
based on DT). For the gpio-rockchip driver, these base numbers are
hardcoded to start from 0 in rockchip_pinctrl_get_soc_data(). Dynamic
initialization-order based numbering is also done for drivers that do
not set gc->base, but that starts at GPIO number 512 to prevent
conflicts.

In any case, I will update my commit message to better reflect what is
happening.


> > --- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> > @@ -889,6 +889,7 @@ gpio0: gpio@ff220000 {
> >  			interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks =3D <&cru PCLK_GPIO0>;
> >  			gpio-controller;
> > +			gpio-ranges =3D <&pinctrl 0 0 32>;
>=20
> This matches the driver, but not the hardware according to datasheet, it
> only lists gpio0 A0-C5 used, and not all 32 pins supported by the gpio0
> controller.

Indeed, this seems to be the case, but I wonder if this is a problem?

Isee other rockchip devicetree definitions (rk3528, rk3562, rk356x,
rk3576, rk3588) do not care about this and just map all 32 pins. See

	git grep -C 20 rockchip,gpio-bank | grep gpio-ranges

I also think there is no other provision for these missing GPIOs
anywhere - both pinctrl and gpiod seem to expose all 32 pins, even the
one that do not exist.

Limiting the gpio-ranges definitions would prevent writing to reserved
pinctrl registers via the userspace gpio API, which might be useful, but
you would still be able to write to them via a custom devicetree (that
uses non-existing pinctrl pins) and you would still be able to write to
non-existent gpio registers via the userspace API.

Given the above, do you still think it would be good to limit the
gpio-ranges to the existing GPIOs only (I have no strong opinion)?

Gr.

Matthijs

--Y0Af1s2EGjNyxXmK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMyF3AetYrDfGJ9el6ZMxy91tJYwFAmmv3AUACgkQ6ZMxy91t
JYyNZA//VogIWO55rSmcEXGC0p9rrWm93PtZhjLMawss6RQXPtmAwnQUSDF7xCoy
jsoOT8xFlARRDQC0v0ONBNhmOOYzH14emEqudzdjV6auGr8GW0vBdMF04xjWigEC
nL1Jiqp+yoC1Rgk8C19H3fOiyx5VpEIkw5IHKrSQQH49gRkHjvHkTMDPLqeH32eY
iH68S6mCp705yDVUXrRWCL4uRSfu5EaHpfRyfmqEf4gAz46Yxi4grxV9US7fjjZO
x3PSE3XtNCleshCP/97xKPt8yAzir3NCRiXWFqTX58lwbK81s/ygVQSY914lJ88L
gzNWmCMuhy01+4CF7GGnDE6C7jWSavixnrUhXRggIPq393OOs93sN5sXs2JnHP43
qSAdwbPMf8ob4/JYyr9AdL90DKWXuqaN2PisAMn3p0+4Emr16LkQ5J4H20b5T1eW
S8rg4jxHJdGd35IJzo0DC50kXp/s7T4EAdNmwKlcruubWMrCelyJ60kETqqI2noF
Ov7vD3BV8XZUngJC0qeo8Cx62d13KZr4o1xKYvxA4Tmgi7ptx4XR6DDdZ2Utl9R9
vlkTkR6tuEaOAOoJrniRQ9eOZYOgd2+JRyqJ9wNvfyvEK1YWZEfbaMy3/BWYrTlq
YqjZkeflsS7QFjnSHLvkGMFe6OOTGlZMCVUjCKr8Mo6Kcv15bAc=
=tkhC
-----END PGP SIGNATURE-----

--Y0Af1s2EGjNyxXmK--

