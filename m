Return-Path: <linux-gpio+bounces-6851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6F68D37D7
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAEAFB24DA4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AFC17C6C;
	Wed, 29 May 2024 13:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ll+E8dbi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52617BBA;
	Wed, 29 May 2024 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716989825; cv=none; b=iWwgknAvt9YUf00KdqnZFYzRH9x2UEyk2wCbdD3CD7OFNuronFu5OSy7pA2hzwEo6j7pO8g/qh0eqS/Z8iiQP+wyrkinWDCwPaA/weHwhhF69SU4RNzXlPY98tOmoOPB+syvBH7wYlx2IaxVCAw9d07nmc10KBxUcqqcRlmn0TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716989825; c=relaxed/simple;
	bh=dzIZHm9PzT8tYi7Nd3b12wMJJCAtjWMs/bdPGPhCaSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSEo5VOK9kuZ/11XjHYS1wLZZ/xiNa2BNWlbRoOs1ETREjeDdUZ+6Osqsj4UHkrplIyghjL2jAXhqIo9sgEK40kVlKvmWiuIUnYaHIJ9WWjEiGtcN3d4t8gHQ+2zIVSuqLJ9dt1bxtlPyHAhPGY5xRgOc2kKnr6DHDQMCTLzFjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ll+E8dbi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2ABC32789;
	Wed, 29 May 2024 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716989825;
	bh=dzIZHm9PzT8tYi7Nd3b12wMJJCAtjWMs/bdPGPhCaSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ll+E8dbiRurohdsSONFsRGL7JoEPt8sVnvcyEU4CjNhQvhbVjPFZwKPCRBvWa+cMh
	 +E4rFIX6m84zgCzpNbqKBnRXR49sEEZki0SEKl+tOCivhgexC5uIT3YW6i3BibzKXA
	 u31xJzBCHikT/QAPjpyHAgHmgsMMI8BPyU+FKnmT0JqiQHJUVfORfddWXoji5cGFJF
	 1i9Zu4lM9fhDg7up7BfME8uUrmZxNkSEeANN0YopLAbAWLxmqxcdsu3GzTYASyrb8i
	 +LytvpDy8hrpohfOCribNrHwXgYi+Xb59n8QQ89IwZlRQOkvORETTm21YiKR0tCByA
	 YMMxo/p0cewzw==
Date: Wed, 29 May 2024 14:37:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] regulator: gpio: Correct default GPIO state to LOW
Message-ID: <4e641ee2-1170-436e-967b-a1809d0f3b06@sirena.org.uk>
References: <b80d65600641e6dcf00da53ae797f4a40a80e2d0.1716976062.git.geert+renesas@glider.be>
 <ee5798e5-bcc4-4715-9c93-913094160b97@sirena.org.uk>
 <CAMuHMdUud7=6dK3rUHXKC+qJPJr-vt-AjtxiOBe5ghQYp1viHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YpbkI0Z+0esEeWR0"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUud7=6dK3rUHXKC+qJPJr-vt-AjtxiOBe5ghQYp1viHg@mail.gmail.com>
X-Cookie: Everybody gets free BORSCHT!


--YpbkI0Z+0esEeWR0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 03:19:04PM +0200, Geert Uytterhoeven wrote:
> On Wed, May 29, 2024 at 3:15=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > The risk here is that we start glitching the power where previously we
> > didn't.  This does make me nervous.

> /me too

> The alternative is to change the GPIO regulator DT bindings document
> to match the code...

Yup, that makes me feel a lot safer than changing the code.

--YpbkI0Z+0esEeWR0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZXL3sACgkQJNaLcl1U
h9BnSgf/exwN+0/ss08gAfNBZ4sevQ4DuOiqvKh6Z8hPJr98Zg68xpVU6dO/X/dq
zucnX0ep9w4rsCX6e4eGaHBRuUJhdUrEuFKV5DHGqxiK47EYwKO1HahSKb3tAanQ
JwkXKZuZ9NIANUXXVG7t1YAugkkroVCjsjpXbnMTNYi02KB3a3M5ooSsINN2sXae
QLoSiVic+hhyuDMt1ya5GlHI6MDHBNbRoI6qb5XJQVu6IKwFmjEzsfCgZeawn1dm
PO8V2rC7RyF9ivzoN40sKo3iM1LtW2Dmdr4/5s4Lt4H95pH0tnK0ktRywM4gh6r6
pZ5TX65JQCcVqP/N9DxKWcCounzHOA==
=oOAc
-----END PGP SIGNATURE-----

--YpbkI0Z+0esEeWR0--

