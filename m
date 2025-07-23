Return-Path: <linux-gpio+bounces-23660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1CB0EB2A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 09:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB0DC189A068
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 07:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89E6271A7B;
	Wed, 23 Jul 2025 07:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZSmlLAXB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B5C25A659
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 07:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753254128; cv=none; b=JpWffTI16ZHYFQK+FjaZd47/vX0NkjbPNECTbHyYZ7zneiCi/JpKoPvsr9sRZ573S/8KL9EIDh/uyBwe9ju3y6NZZiZdmJ1E8mhXB7PwIVf3YE04IIECBYyLJeQIzHvNUiJgsAl/ultRTbn3A772VK86wOOQqad7WM31n2EYcZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753254128; c=relaxed/simple;
	bh=4GU+tu8nzBuGyAsdEsa+Gls5HWp0DZA00S2gvtcxbKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aW8WQAsalMQ8kifO9fGT6Px1f8DHputXXef6n2G73VBthetcwM+eLqTDkwykgT8BUFt23e8/uEAtC+mKAU7fBZmWyM5Sxt73pjhl1ntD73oNyPnAjNTv6CgwtBjalzdzkd0phOe4Bv1CmvyASoLXEREzB/g5kCiVo/mRpWIPnlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZSmlLAXB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mSr8
	IKKs7FMIvqGwaTTFy3byBTfAKTTuwfKpgozIJWE=; b=ZSmlLAXB/xGj1J31D3Tg
	CE+HwcVG7Yx4NJo6Kt/MqfIA/IByuvhOVKEC2IltTrPawTXRlBUOC8PNv0tiC+Sn
	5rn1ZagotDeNhy1mowxHyMvekg64IgIVUgkxslHFGoH6GHSGR2FrtTwcVDMTgQ0M
	goslmTh9E5rHuQ4At/VwN26aqy5UNmcMOkkm1e91vQi480RrEWQmm9lAfchMJK6q
	dUvIMRRobnnTXr97szCLkeAtmVjBICXHZfZHJBKT46N6DnkfFD8x5L8EVkBzmuPA
	uhUw+QCjunhmsw3f2XWkp8vJs+mTnTaNLHyjHofMUD+ic9V+SwQZxaWgVlmIc6EE
	GA==
Received: (qmail 1603188 invoked from network); 23 Jul 2025 09:02:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jul 2025 09:02:01 +0200
X-UD-Smtp-Session: l3s3148p1@NpESSZM6sLgujnvr
Date: Wed, 23 Jul 2025 09:02:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Magnus Damm <damm@opensource.se>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rza1: Check pin state before
 configuring
Message-ID: <aICI6M61N9_PH35L@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <damm@opensource.se>, linux-renesas-soc@vger.kernel.org,
	geert+renesas@glider.be, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org
References: <175233393885.19419.10468322450742766513.sendpatchset@Bjoern-Magnuss-MacBook-Pro.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3cOu1BoFFHlvuf5k"
Content-Disposition: inline
In-Reply-To: <175233393885.19419.10468322450742766513.sendpatchset@Bjoern-Magnuss-MacBook-Pro.local>


--3cOu1BoFFHlvuf5k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Magnus,

On Sat, Jul 12, 2025 at 05:25:38PM +0200, Magnus Damm wrote:
> From: Magnus Damm <damm@opensource.se>
>=20
> Add code to the RZ/A1 pinctrl driver to check the state of the pin before
> writing any registers. As it is without this patch, resetting the pin sta=
te
> for every pin regardless of preious state might negatively be affecting
> certain shared pins like for instance address and data bus pins.
>=20
> Signed-off-by: Magnus Damm <damm@opensource.se>
> ---
>=20
>   This makes the following patch work with Linux:
>   [PATCH] Update r7s72100 Genmai DTS to include NOR Flash pinctrl

True that.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I can't say if it is feasible to have this code in the driver. I leave
this for Geert or the RZ team. But I can say it works with the above DTS
patch.

> +static int rza1_pin_mux_needs_update(struct rza1_pinctrl *rza1_pctl,
> +				     struct rza1_mux_conf *mux_conf)

Minor: I'd make this a bool, though...

> +	if (!!(mux_flags & MUX_FLAGS_BIDIR) !=3D
> +	  !!rza1_get_bit(port, RZA1_PBDC_REG, pin))
> +		return 1;

=2E.. and treturn true / false.

Happy hacking,

   Wolfram


--3cOu1BoFFHlvuf5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiAiOQACgkQFA3kzBSg
KbZKBQ/9FR2bjnbomSW9E3+np9pGJyrAgwLWKJnq14hW/pDiemH+TvGMFvQw1hTz
9GzXaupFZwx4wf14QN7X3DPCoOqgd1qpQFwsvTWvpV9DoyilVzY5AgKWoohwxkS8
EAsY052UAayrQJVI/CFOsjxPxAxgiWxEtM8vLjWyG4g/VII2CTADPRVeoFGPPJ0H
CRjce9zAg85PsYjOhyyUeLRMhmsS01WkCzz+5sCtU+9xMB+6GhvtV6f5nIma89Ti
6Ep8yb9iAviuxLze+4C5gGXn5bFs0wdNhF7BVQvZTc/4UEa3CBGA42psonvkMV8V
+hO87Fzto/DD9DBA4MzauyDBYRMrkOerX3qb6/m4MCEkVpTC1Ueb6QA3CzVzKAt1
NygkSRwfRnQqG/vLsfpiSccka5HagxJdSreQhW2WmdlKDvPZBn/Fh7eMDobpGIeK
hd2p3v/MIDUBQjIvCeepiBdeQKfA+WEP0bNUnsIC9v9gP2IafpvyThrMzB2XuoGw
Eym0EU7NMLYYaHvRHNjEzulwz5xn4VVvqB/VNCU/LXySW5aYou1FVlqmQJigqeUT
GyhaFZs3XKrzwHs9KtP4vh2Q7fWhAHqY/WoqzRZySFnYajRY86k13Irfi8bkbXe+
ykvwFifqQecw8qqmWb/JLsRfo58Ifd20dkaZ9s7xDNn9hCPW5ps=
=NZby
-----END PGP SIGNATURE-----

--3cOu1BoFFHlvuf5k--

