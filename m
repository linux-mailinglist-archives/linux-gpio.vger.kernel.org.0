Return-Path: <linux-gpio+bounces-26402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7BCB8A61A
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 17:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DF1D16D8E3
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B170F31BC94;
	Fri, 19 Sep 2025 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cZawCdZY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BAC31A811
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296831; cv=none; b=O4W2Vx1+5GMEinxu3bTlU8IeROaW88avYBgoKIslcsFNkCr3yNXeDayEyOhgltT/sgYPX6HsGGEKIX5f8qCTdgPWTYOo9v+R3emycRiOc8Ix8trcWMokat5Lufg3Pv6UBmvN9gGWfUPKX5h9IMkUiTGEHUswFbSklLhtWjwMVsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296831; c=relaxed/simple;
	bh=bZhMTjNs0YcdGY/cp9K2ELuzBsbeI/AjHbVeOQdERBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9jcnraR5SKOhH5EoWMAB1XEmNkXFWEmZMAL9eUWysUyVPYatrjHtf1vnvWcvss2hXUgMH9G/KHAY51i7rKER1okIky9sVT7z1h0v1wZMyfMbH+Mw8uJc3mRJn9rF6mpVAouiZrsy5lMqPA+yLV7PDhIzCP+Hv/PuqneGz48Log=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cZawCdZY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=C1Yt
	3wDpRx/hWaDw4sYAQXyPZ9mCqlXDREwSUU83R8o=; b=cZawCdZYRZw2+cukQmNB
	KoVXCO7O35/qLi+uwN+K9k6g+kRzjuI3+zMVPXaBeKDQcta+QlRUn2KyjN3TphD7
	zwCnM1bwzp28nuDWFwFO21fPWFd1jyx3hDrslDM6IYknlQJoClmvuCxho1XuuAEy
	KoOskgCPGML8nkNlIVnzVXRUBhjeKcMjgJP1Ox6SmYYvhMBmu8L+M1QHaMovGJaZ
	xC3YY4CMJow5pqegyE+TlFdNQYpCG6x6ZutCSnMbL0ugi7QR07T9UO2EGVXAlXEW
	y12uTTciltBqH6JrItrqjTekEBpWMN6NcNJMHUAKNSJiMZYKSVFSmg0fbRI3QoPc
	Lw==
Received: (qmail 3967997 invoked from network); 19 Sep 2025 17:47:05 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2025 17:47:05 +0200
X-UD-Smtp-Session: l3s3148p1@0sWqYSk/PKwgAwDPXxLYAMR913XberYj
Date: Fri, 19 Sep 2025 17:47:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
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
Subject: Re: [PATCH v3 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <aM16-DDi7OVSRbjG@shikoro>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-8-herve.codina@bootlin.com>
 <aM0lU01x1w2wB3LG@ninjato>
 <20250919151448.14f8719a@bootlin.com>
 <aM1rRuiJH9dlwBjL@shikoro>
 <20250919173011.4b32a928@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lGy/8oDdan6XB7Xf"
Content-Disposition: inline
In-Reply-To: <20250919173011.4b32a928@bootlin.com>


--lGy/8oDdan6XB7Xf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> kind of:
>   static u8 reg_index[8] =3D {103, 104, 105, ... , 110};
>=20
> Base on GIC IRQ number retrieve from the interrupt-map item, we search for
> the index in reg_index that match this number. The index found is the ind=
ex
> used to access the register.
>=20
> What do you think about this?

I sure like it better than a fixed ordering in DT. And the advantage
compared to subtracting 103 is that reg_index can be flexible in case we
want to support other SoCs than RZ/N1?


--lGy/8oDdan6XB7Xf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjNevQACgkQFA3kzBSg
KbbK3w/9EAnr3+PwQmgvwpXfxXsG5pvpSDSa74RKDXBPik4xj/2AxbEQbjuI6ThV
hdWPaPzEZIms40E0+1Ei8dzmO2EbNzExXs0VO+bIoizSECCo7btYJq0vItZgKAcQ
tqTskGmEBGdCYBg+F75T9GvYgBhfiQ45WgnJCtFKoZiSaMGVlFowY8DiQlY9P/V7
MRWkdcpIDU9NIOU8i52+DxDeCZnJ9fSJsmZUwtGFRjJpDNvB3ErVxf6XzsLDKupP
oQEYULzP97xC+k33org7ek8n7YKoSN0SPZFtDx6HoqJAi4YTpJ15zSodVbOFa89t
LpFFAArkTlIYoVcbu59Ceilw1+xhIF7Tgr05R8jo4HP7nyb7/lRTfQBpAZVMs8FY
tvBl/j6Pn1baMxT1f4YJVELap/yDTYG/Nazqpjz61MqEUWytFlfmqHyDDj79F8nF
oTTXC2hWEb41Fgvama5jCGL5GBPa19FApzmviDiYAFPMl+btAtc7jbxGz80xdL9u
9qMeO7/LTqQ9C7MP3UZvhHsfpewM+JhFUDH/H3WO8m/tMZ5dvweH+WHXzaLoS0b7
X1lQ79s9MMJehn0K6+H2LA7Bx9AutSF66aO6wZmNMYfVvy/5FmN0ZI4Y8zfmr2eI
VLsFQBk620BUoKRR7VnrM5FjGY+Conp/g7CJfpJzvetRkr+UOfo=
=f6/y
-----END PGP SIGNATURE-----

--lGy/8oDdan6XB7Xf--

