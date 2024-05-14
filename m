Return-Path: <linux-gpio+bounces-6363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8438C4ED9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 12:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02ACC282E56
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 10:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEC612D76E;
	Tue, 14 May 2024 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNKd76c5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4532F12D761;
	Tue, 14 May 2024 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715679170; cv=none; b=Ix+8SLuHbVBKyRokE+mhk+LgyrDb+J2rBVx28MK9ftdDJ9zy7D59W32B1N9zszaUaYL4muYJkXt8q1UZq2ci1IWavkArRbmKVCnMEJeUCzZd/tONT+eQAct0lb2x1l4aJz+62o/zDgyVOVIKtALFU5IrhR1qY4WTUSlTMMfgb5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715679170; c=relaxed/simple;
	bh=xl2Y0XwgJT/Ar/0cuoTl1AAPtkGPWQehhvGFxEo0aXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOv1cqhCEuprsjeIburrAlMEIDQ/NCuliWiU47lE1BSp70kpNvD6ZD/qFkPan6o9CaopeJSlEc1boPKsYpy1X1+5lIvJM9PVNmVmB0TLRjslq30W8D0QtQU7mFUZ8YgRRgvN3F6Fs53VR7a2b6Y2Mk9fq77NikeMWCd/5qTbqQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNKd76c5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3964C2BD11;
	Tue, 14 May 2024 09:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715679169;
	bh=xl2Y0XwgJT/Ar/0cuoTl1AAPtkGPWQehhvGFxEo0aXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNKd76c5QKRrqOvo1jNUI+RPfN7n8qytbLk/D5mhQebrv5sE8do1i/2EDl7cPERaq
	 4EnfubLEmelNSCYhfCJtUdVyfGDPnTRzy5dC2YKulIJciOrm1gTV4n36nBMLnuynTc
	 kKTM+U7xZtICAIA1q+qBtgnn3ghYUCDLztRLd6xtcPCu2DWWEB/p/9leY/gvl3grfg
	 TPAtGUgyslwmh5nNYsDXaGX4SL7CCzp6m4MdYuNlVZVopjd4krOTa3O46BUaCVc9P8
	 BvWbnVgj1vh1p8Y8cscAA7/X4JNHDNNxQPZU1zJpPMeuz8OCNqu18KlkBtoMOQ3B8V
	 Vod4Y0CaGYlUQ==
Date: Tue, 14 May 2024 10:30:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	naresh.solanki@9elements.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cy8c95x0: Cache muxed registers
Message-ID: <2008e2e7-59f6-437c-a3c6-1fb9e31bf635@sirena.org.uk>
References: <20231219125350.4031370-1-patrick.rudolph@9elements.com>
 <ZkL2Sdf0NcqaZRZ4@surfacebook.localdomain>
 <CACRpkdbUye6RhbRNGn6sapARwVUyi5hKS-5VEVBr6ZR6W_KdQw@mail.gmail.com>
 <CALNFmy33wMHBcoU9ei0vVsn0gUM7-0jdkDDq_Loa3=mMWXiWcw@mail.gmail.com>
 <CACRpkdZhY_Yz2jHGXWO5_t8Qdey8me0Gytds7V64GYOFoEC2Dg@mail.gmail.com>
 <CAHp75VfA8G6KyhD5_HDyKWp5AdpsnnQ27gzTDRRjDRCVXkT-ag@mail.gmail.com>
 <d4c03f3b-a8ce-44bd-8897-8a2f276dede6@sirena.org.uk>
 <CAHp75VdDMOLuRhDNQ=dzoE6Yyah+k-pGm8vY8B2DmFiyPBuftw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wVv4mP3Bc7+QJDE6"
Content-Disposition: inline
In-Reply-To: <CAHp75VdDMOLuRhDNQ=dzoE6Yyah+k-pGm8vY8B2DmFiyPBuftw@mail.gmail.com>
X-Cookie: In the war of wits, he's unarmed.


--wVv4mP3Bc7+QJDE6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 12:23:19PM +0300, Andy Shevchenko wrote:
> On Tue, May 14, 2024 at 12:02=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > If there's paging of registers then regmap supports this with the ranges
> > feature, you can tell regmap where the window is in the physical
> > register map and which register to use to switch pages and have regmap
> > export the underlying registers as a linear range of virtual registers.

> In this chip there are two ranges that are dependent on a selector,
> one is for port selection (which the original change is about) and
> another is for PWM (IIRC). Note that they are orthogonal to each
> other, meaning they have their own selector registers.

That's fine, you can have as many ranges as you like.

--wVv4mP3Bc7+QJDE6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZDLz0ACgkQJNaLcl1U
h9BzNgf9GfN9MZ5e6oaGtY+Ipa0A6tL2poXDyqpEp9EvhvwwtcRqxyybQqM/Lqn0
uM7Zfrdc4uuE1q7zfhcIIa7eFhiv+vthUPJxXiNDrdFEBfbLUkZAAeR4yEO4BRgu
6QLTLeunPcUJO5+LirQgD/HBa7tv37OMQmfw8uJ19HCs/nteS62E/P1Fiy5vEsQD
Vw8WjztE0aPu8mTulgJnL0rd5QnxoOjN/b92oKGyDdpmHu5uejylYkOTWtyRvpt0
QQPqvcKbvmNVyFAnK9duyUHxkNfzY2jJHdKRXJtcsyd4xg5ogylKQJc7QR3EAqy5
qLBqj5VA37qFv3bAldN8cT7VeV0eBQ==
=uQse
-----END PGP SIGNATURE-----

--wVv4mP3Bc7+QJDE6--

