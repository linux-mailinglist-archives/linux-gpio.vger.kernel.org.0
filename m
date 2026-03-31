Return-Path: <linux-gpio+bounces-34488-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKiUI3Ddy2lHMAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34488-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 16:42:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F2036B1E4
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 16:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8585301C13D
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 14:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9533FD124;
	Tue, 31 Mar 2026 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOFTTnnQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A175228150F;
	Tue, 31 Mar 2026 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774967774; cv=none; b=uTHG/3QcGvHMEqlVy6wPm9xjIIH7T3/o6kBhfxRQSpgNAZUKGJGaBUqKtgDFQ0+wYPSjT9Vd6tCqJENygvPhBixpHg5onRi9RPgsVs9ne+1zMJlneDqpxDBVHXss3lRznr2Hx0pqf7mCyTYqZNxVM20oGAN2H1aurTLLc2ML17M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774967774; c=relaxed/simple;
	bh=WuipAWbd8LzKDAYhXLX11litf3pJQChGrJT8VlXp5go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BS2tLgxD3CLYBf2U9Syy9wbKKlz8QAdvyWWAGD1Z9hueb0mwLPCcFTkDw6iekxfnF8GXltox8J5SH2d7phAADxwKB2tLmkIye1bVSOcllo/mi+j6gy5msKu6Xulc9ALe2NiStEW+AZOgG8eTZcTG7eQsaWzEATXhT7p4RXT/R+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOFTTnnQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9841EC19423;
	Tue, 31 Mar 2026 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774967774;
	bh=WuipAWbd8LzKDAYhXLX11litf3pJQChGrJT8VlXp5go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOFTTnnQcZ81Gs+max/xpNqAqNQstVbm1orhVfZe8UVkYx6MSX7c6BhQOcD38wMJd
	 Db9i1oawG5fhLlHd7CDM0ESTD9DTQxTZuARuiFHmV8VqwSEHgWwsW6fU7Rp0VzPG73
	 FzMggP501Tly4BD4YhTrdbXUeKqrGL7UN+ApV3U6m0DGba/KtPhqAmi/jIQ+mA0VlY
	 EYMP1gbgFdOJbOEpDJ8lnwnmZBjoaIt9uzZ7kh9d/DtfMaWuhw/Fn1X3gYU3OVa9ks
	 tYa2PsD45bwHqvl4m17JR0ocl3jHpOgBhqFzclE2JSmE+0oteu9FY1c/EyQhIqv/3k
	 KesxtMTfCxm8w==
Date: Tue, 31 Mar 2026 15:36:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: uda1380: Modernize the driver
Message-ID: <73689388-a323-4ef3-929c-8f8f15455116@sirena.org.uk>
References: <20260327-asoc-uda1380-v1-1-f6f91be9b7f8@kernel.org>
 <CAMRc=MeJ4eVx9HEWP6_4Yd-a=jb4SOyoWW=KgY_=od=ft1=7eA@mail.gmail.com>
 <CAD++jLniBA_9NzG3BwNpTpT8fC3QRF0yiM_=Wq4u409_fqWVcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U+SAKaxgJwZ5jaYv"
Content-Disposition: inline
In-Reply-To: <CAD++jLniBA_9NzG3BwNpTpT8fC3QRF0yiM_=Wq4u409_fqWVcQ@mail.gmail.com>
X-Cookie: I just had a NOSE JOB!!
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34488-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,pengutronix.de,perex.cz,suse.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 20F2036B1E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--U+SAKaxgJwZ5jaYv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 10:56:53AM +0200, Linus Walleij wrote:
> On Mon, Mar 30, 2026 at 10:45=E2=80=AFAM Bartosz Golaszewski <brgl@kernel=
=2Eorg> wrote:

> > $ git grep nxp,uda1380
> > arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts:           compatible =3D
> > "nxp,uda1380";
> > arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts:          compatible =3D
> > "nxp,uda1380";

> > I think these count as in-tree users of the driver, right? The compatib=
le is
> > not described in bindings but I think this still looks as ABI.

> Oh I didn't see *those*!

> Well we could just delete the platform data handling instead but fixing
> this properly is probably more fun and helpful.

Note that at least the ea3250 is trying to use wspll as the sysclk,
though the DT parsing code doesn't appear to actually exist so I'm not
expecting it to work currently.

--U+SAKaxgJwZ5jaYv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnL29gACgkQJNaLcl1U
h9DxDgf9HDXNyXEYBzmW+RFsdhkkN+xTocyRP0/NaU9hbVgy/zCfEumP3ERWSew0
BonhF2Q92DFu9ASDqiB6CQqiHmaajKI8B8sCdfCW/jGQxL/b7b2l3u1pmcQ2MotI
Oq/S1rA1yx26DdDRnvU9K5/cxnlVFbTws8tbabH8b/Vh2PctVCw9pAK0Rzf0TXlp
z4YIh2v2+aTHj/VZz4ZBX1ekfzmf8bg/w1/QiOIL+/+P+m1E4QXyzCm+KAaXl4B1
jZwkwjMQ5CPlWqgqRgLuDd5k+fY5vcWKkRHjxfcLq5wAl01oiYivpHs81S4xifDT
sUBGidNoMgXvdisA7bUClV6Joj5ECg==
=TtZW
-----END PGP SIGNATURE-----

--U+SAKaxgJwZ5jaYv--

