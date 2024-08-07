Return-Path: <linux-gpio+bounces-8661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A1994AEC5
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 19:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9F6A1F21767
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 17:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943A713C699;
	Wed,  7 Aug 2024 17:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owWgzSrk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4849C6BB4B;
	Wed,  7 Aug 2024 17:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723051349; cv=none; b=jy6Gs3451Z60NZqYFMKXAdGSaHxVtuA9NtXnPW8QVdfTQ/8jc7aX7kb9+uQteCCujrAf2sHA90l3UAVq1roWM46vPDHJtusfF94zwbIE5705o8AV8TEZ+PJNH/jEuGRe/Wf8wjpJMIKKPTJ6Jbjz12F87vBeSPS+DoZ846le3lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723051349; c=relaxed/simple;
	bh=y6mJiL+/McAto5QWkflfrjZFdn6Y74RBYK1IE0EbZGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6BsEtz2h7aLKPkSpN2DeFJ3B3/v9LCkZrqlsj9chPyPCmC/mP57MKXKLZdl9jzWO062bMLdiJZYp4xnT/CtwPk4ftCC7pzSPiHbW16UGYoEtmnzhJLRoGszkjS0J5AoJ01sT4uEL3uz+MHEVF4LQkvDEBrIQqyqccwLjsfn3wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owWgzSrk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85A0C32781;
	Wed,  7 Aug 2024 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723051348;
	bh=y6mJiL+/McAto5QWkflfrjZFdn6Y74RBYK1IE0EbZGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owWgzSrkOEo9kWqWUr5x4wRzvi88VoT4jyWIx4s9aUtJ4IjvpB5xpLTsI+nCi09gj
	 lRw+2eWqz0Rg0CS59/LJD0bJA4JRd/koUNFZ+rZk+QVKEyxV4dRYPdjestJAO1Rhvp
	 ZuchR+43Vc612jJdJlt1Yh3lJ4+2XOlsH5/KvZaAGspGfz2+m18CSPqCvM/H2OAbuA
	 ksq7IdAiYcwfL2/TnfGSs/Cjilr0KZ6YWdoAUYo9j5gQTWOLWfS5RnMqFpDkx87Q3g
	 Xssz6QmBN+iHUNaeVfuyzx/v29adPahGaDjVJyfjL2mtuZqa8/0vZPEQq+86pwdPGk
	 J0JR7yRdGP2hg==
Date: Wed, 7 Aug 2024 18:22:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
Message-ID: <20240807-epileptic-pessimism-a7866dbadae4@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
 <20240806-breeze-crazily-84d4e4af8f4e@spud>
 <CACRpkdbMxuhe2HQZ-Av1R7JW94rS0FosPO-utYNsFO8avR3TbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2+uJzAu790xEQaKU"
Content-Disposition: inline
In-Reply-To: <CACRpkdbMxuhe2HQZ-Av1R7JW94rS0FosPO-utYNsFO8avR3TbQ@mail.gmail.com>


--2+uJzAu790xEQaKU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2024 at 06:55:58PM +0200, Linus Walleij wrote:
> On Tue, Aug 6, 2024 at 7:18=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> > On Mon, Aug 05, 2024 at 10:04:53AM +0200, Linus Walleij wrote:
>=20
> > > Is it possible to use augmented generic MMIO, i.e just override these
> > > two functions that
> > > need special handling?
> >
> > I'll look into it - as I mentioned under the --- line, I really didn't
> > touch most of the driver and there's comments from Lewis' submission
> > that still apply.
>=20
> Thanks Conor, thanks for taking this over, too many patch sets fall
> on the floor.

Meh, it always bugged me that upstreaming driver was given up on because
fixing the interrupts was "hard". It'd be a poor example to others if I
le the driver sit downstream as a result.

> I'm mostly fine merging it like this and then improving
> it in-tree as well, I'm not as insistent on things being perfect before
> merging as long as they are maintained.

The gpio side of things might not be too bad, but the irqchip side is
crap (it has an of_iomap() in it for example*), and if the irqchip driver
needs work it feels sensible to improve on both before merging anything.
Unless of course, you think it would be reasonable to rip the interrupt
support out of the gpio driver, merge that and incrementally add it
while also improving the things you and the earlier review mentioned
w.r.t. regmap?

Cheers,
Conor.

* Getting rid of the of_iomap() needs me to rewrite parts of the clock
driver, which seemed overkill until I knew whether or not the approach
was permitted.

--2+uJzAu790xEQaKU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrOtTwAKCRB4tDGHoIJi
0gNfAQCL3AK7b7Rag0SuAREO6VHwuSZM26U4wr2nM7r1q6SmAwD9HTu8K4xzfaDX
SbK/WfgJsXClolZ0GfJezsgv+yu4RAw=
=Sm0o
-----END PGP SIGNATURE-----

--2+uJzAu790xEQaKU--

