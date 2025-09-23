Return-Path: <linux-gpio+bounces-26517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F6B94A0A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 08:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D67443BA92F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 06:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5090330E84A;
	Tue, 23 Sep 2025 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="baVXzgA3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCAB25DB0A
	for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2025 06:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758610585; cv=none; b=tn9RtVJyEJ5YDG/maQYBAI39uWt++rmAAuxrbu+Xzz4zqiU8BEnPLufkNKyPNdCJF9mt8y4aSYloDBpnIdEAUGkvtNoS13M/Km0xGveHjf3BBk+2GTVlSc92A6b++EPdP8LiV0UhbzZH8+yJB8e8ocpurZMyjj0Q53lvjcevlzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758610585; c=relaxed/simple;
	bh=Q1JgOVWrgfnpXgIZeXWfz4VzvMC4tAbZhSpeEIsa6UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Es9JKdKNz02Ezv6H1lT5pqkXDLCT9uBo0eEe8eVfAAzLf+M73El7HURNEwppBCXrQjkKltOL/bchJJpmaIhJNAOU6YJGJNiwgpUwgRlj9c4Oo8y02T512GfwAoh7OJfJxZ5IpCBz8TRhWSw1VlKURbGIgg4qnyn48+BsVyqWg7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=baVXzgA3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Q1Jg
	OVWrgfnpXgIZeXWfz4VzvMC4tAbZhSpeEIsa6UA=; b=baVXzgA3gNuJRgNUduCT
	9YLAh8ao3jJ4T8cLsmn+INWGot11qAUosE9al7r+2vHxEHf1iIFaX7bt7SMgQiu8
	Uuo/UA5AIq7jQItsKC97WWxNK5Om8tZHAY2eUTzaaKlev0kiKa2lePNUh1Fs09dE
	njAyluDzD13VmPy4sxNUGZ/9wbjZK/p+k1wDFsL/iMJBwB7EoxAlosKYDrj47NMQ
	N16pFj+DMCceGAUjTmo/YJ1ok65CfjxH+sSRD00UAf2hkc4hWQ1YG+OXe0dYC1hI
	AIL5PkmSTXpLw2RT0AO+B4yj5cfnH5MufMOSNFfl6A4ESHTPULdp3eR5mk+C7Z9C
	Og==
Received: (qmail 1004437 invoked from network); 23 Sep 2025 08:56:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Sep 2025 08:56:18 +0200
X-UD-Smtp-Session: l3s3148p1@Rv/NbnI/LtggAwDPXwQHAL/S9V79e5yL
Date: Tue, 23 Sep 2025 08:56:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 4/8] irqchip/renesas-rza1: Use for_each_of_imap_item
 iterator
Message-ID: <aNJEkd9C2bDrowHP@shikoro>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
 <20250922152640.154092-5-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TIDIkyJ3Gg25L3Jq"
Content-Disposition: inline
In-Reply-To: <20250922152640.154092-5-herve.codina@bootlin.com>


--TIDIkyJ3Gg25L3Jq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 05:26:35PM +0200, Herve Codina (Schneider Electric)=
 wrote:
> The renesas-rza1 driver parses the interrupt-map property. It does it
> using open code.
>=20
> Recently for_each_of_imap_item iterator has been introduce to help
> drivers in this parsing.
>=20
> Convert the renesas-rza1 driver to use the for_each_of_imap_item
> iterator instead of open code.
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

SW6 on my Genmai board still delivers irqs via rza1-irqc, so:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--TIDIkyJ3Gg25L3Jq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjSRI0ACgkQFA3kzBSg
KbY/FxAAlVLFGL6AfVEsCD/oIUfVYSIxAjWEEjVSx/Le5JffJO2Ft1SgnZ9rH8ji
J1cpy3LuqstvKKD3u/BqrCMZRGjP/l+7iw6g/OSdetuKHf/VpDHpO47xD2LAZzBV
Y0t0YvhLDN7phe1AfpkL3fVEbLRFX5/h+AcyP9mDReCJqwzV3cs7TDkbfMwbM1L9
+nQ5/4zodr/wkG/jdoMTCR9Acw6rCTFExxy1ay2GbyOponId39hkBneZYpTS/QTZ
61b5ISD7aoEKu2CU4m32xOdNyep0bWjzgGlnSKl3KXpbKnpxSLvjbUTgBG/LTgXp
gaBN0qNtqzh47Uzhy1pNjjC9mT/PTkbMg/wHp6bSBV7uMwgvodtT5JXaiGalWKhg
SRGkvwUEOzRyVcF+07lBd23dP7QCMwkRc6vcI9VwlDQohnGQckIi+/9m2TnKzRtN
H/TGXeC8oqQYgEgi3JuVY280LOfV0wOnGVe0by48mji6njHcc8PafrkFxExU3JFW
Yexm+lUlqcVH6CzrGAJItO0aiUEZdeWjCGERIdPaU07M8LXIDbrLfqJkdVQdVief
NglHPzKbAtsMzRKCXzUZUcVgW2pD06BhBtBOY8vGBroGGQr6NcZCd+B6PpYhHuaX
DXDsLGKaG5modPfTEoUDF0i0M17lYLe5Cis6icEVXXMK/7EpVG0=
=YWOY
-----END PGP SIGNATURE-----

--TIDIkyJ3Gg25L3Jq--

