Return-Path: <linux-gpio+bounces-15609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D2BA2D7BD
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Feb 2025 18:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0053D7A37BE
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Feb 2025 17:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A31178372;
	Sat,  8 Feb 2025 17:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+egu9+6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B2F241CBE;
	Sat,  8 Feb 2025 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739036018; cv=none; b=s5Ni4amMylAlNN0waBf0mbnx8fm8N+5HT3veM30h5Jace4iSDq3bNxC3daRWaoK7ik9dKSBovp/QI/HPKq5K1FxtP/6M7ZC/DOt7Pn9KgZOzbOymM3966cqwkZcuG4igdDgs7fQsVni1zZ+AM0mur2sAaH3+tP3UfBXOYPHe9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739036018; c=relaxed/simple;
	bh=57gd+e0DSkvmdpHjAnnGEvlQyQAfsLt1JdEwr4SZsPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDbLECIqurTgviL0xCF3+FiT0O69e/vCJLg+2PJxezq1aTRhSeE25L81mmhuVD64tMn8hQPqWHrp197F3kjnO1XKplwRDd58t6s3qhYzeODu6i2EwfCNu8kcbutFiD6X2tni1gJ+TYGsconMLYktlUP+egU6oRlXZBFg+IXhacM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+egu9+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DD4C4CED6;
	Sat,  8 Feb 2025 17:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739036018;
	bh=57gd+e0DSkvmdpHjAnnGEvlQyQAfsLt1JdEwr4SZsPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+egu9+6Udf5wi2UagCTvvQ5RPfl2Ymre41tud+m3Y175wreFJzsMejRzYznBOOX5
	 emJUBMqnkx7/zLH1B+VYvqAJSXpCNPYz5QSS1idNCZTYOEcM9hMxJWSX27FAnNsdAT
	 /NdsjshqOm9oEPNGviIZ9drn+3q2Z3jgHFnJgzACiqtO0IK7DYoWgOX0rxqepMBMdK
	 l7OoWEbDRZ4UiH4f98ih1C0UmmxPUYCo8M+uDi92RM8MrIFoxVq+yJC4iddXh7orr/
	 LODPdqPR/Leh3Fn250NI9dSbKOjpqPwanlUd+XpIKn/PultiYgMdkeXVFj9cV9HpPY
	 tahEW4R1Qv/9g==
Received: by venus (Postfix, from userid 1000)
	id C495A180616; Sat, 08 Feb 2025 18:33:35 +0100 (CET)
Date: Sat, 8 Feb 2025 18:33:35 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Mastykin <mastichi@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, e.shatokhin@yadro.com, arturas.moskvinas@gmail.com
Subject: Re: [PATCH] pinctrl: mcp23s08: Get rid of spurious level interrupts
Message-ID: <d26ukzhmjmvqle5zsc54lhnfaaheg5cox6hdttt42frj3sbwb4@eryduawlkyka>
References: <20250122120504.1279790-1-mastichi@gmail.com>
 <CACRpkdbtjS54+g-K1azE2hHeTsiyzA_gFa2NBX6QZZ3D_H5Ryg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="blov3ccqy2p2jfq4"
Content-Disposition: inline
In-Reply-To: <CACRpkdbtjS54+g-K1azE2hHeTsiyzA_gFa2NBX6QZZ3D_H5Ryg@mail.gmail.com>


--blov3ccqy2p2jfq4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: mcp23s08: Get rid of spurious level interrupts
MIME-Version: 1.0

Hi,

On Thu, Feb 06, 2025 at 10:25:51AM +0100, Linus Walleij wrote:
> On Wed, Jan 22, 2025 at 1:05=E2=80=AFPM Dmitry Mastykin <mastichi@gmail.c=
om> wrote:
>=20
> > irq_mask()/irq_unmask() are not called for nested interrupts. So level
> > interrupts are never masked, chip's interrupt output is not cleared on
> > INTCAP or GPIO read, the irq handler is uselessly called again. Nested
> > irq handler is not called again, because interrupt reason is cleared by
> > its first call.
> > /proc/interrupts shows that number of chip's irqs is greater than
> > number of nested irqs.
> >
> > This patch adds masking and unmasking level interrupts inside irq handl=
er.
> >
> > Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
>=20
> Patch tentatively applied as non-urgent fix.
>=20
> If this is urgent, I need a Fixes: tags and we should also tag it
> for stable, is this a big problem for users? I don't have the big picture
> here.
>=20
> Adding Sebastian, if he's still using this expander.

I use the 16 bit I2C version of this chip in the hackerspace
together with gpio-keys and haven't noticed any IRQ issues. But the
system is running a Debian stable (incl. its kernel), so quite far
=66rom mainline :)

Greetings,

-- Sebastian

--blov3ccqy2p2jfq4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmenlWsACgkQ2O7X88g7
+ppKig//Rm0mFej2hDCkcPp5Q8lAJkBhuQ5f/iqnqZPFvZbe7QhUij+seg3H9ZRJ
nmr80u496DEI3uioQ/Ub+5F/sC/nV5yUIObuRmo8Yg8SFkeFIkaE5xHuHgYxd+NU
reMDs3ekWIx5WKhGF4qOjy8OqKqdyw48QTVNSawxGPGKM1hY9aafh0HPnqg2tlhr
3JiGZvNXSIxza301yyjEPpDNu+SCuL/EEb/Kcb3Y54PJUtY4aqlU1nA15Yt0tJwU
gVD1EjfcxdAYyPJuSQSvXM4FTnKnPigPRcWuxhkBHV6FVOTbhUqYnzj+IYq7WhFW
BLK15q6vszyB5bg3jX3LD2fnYEtPQU+G1rcPv++bpYcmGPibhVM4PAeXlntU0e5E
zwCs3UiDv+BJSXNn0e4rq2d/oJm/sy7OtAIrLWUlw+AY/NyG8i1sVCjODgWZQgAc
3treSZ++iRiRRY05zqtfDySL8EFbf/q04TUNDw/17u9bM/ZkNR0Zv5rOBvHwdgre
fOGPQF/vpVcLlZfXaj7rSmL1EiL9vNZCUzS80wU/S5eFNzHtwElo1j/Dl3QTUVUT
GrVy8WX4V3Qf7plRJwM8A6l4hmm4R6e3vnf1pQSfEKhllm/t5XrFX7XtJxmlOegR
MH7Wjmlsd35Cl5Hz8z6uk4m00YHPsUy1tCXHZY7SOIdFuwSXHWg=
=Mzkr
-----END PGP SIGNATURE-----

--blov3ccqy2p2jfq4--

