Return-Path: <linux-gpio+bounces-23926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 406A4B1755F
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 19:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88C32544E7B
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 17:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA9E23D28E;
	Thu, 31 Jul 2025 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVREDD5o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C825672637;
	Thu, 31 Jul 2025 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753981429; cv=none; b=tDjqE8w5oVP57zAKuNEW9HkrDJnRyCceuY4W09h+iP1dNnpwBUKm25rDr4LTne0lX5s5zBsxr8UbDnPki64CtFhiSwbrxpGZqXRP2SrhvZZel0/fFy7gQu6j0ZNDTpB2EqWuRRxR+FpWJ05h4V10WMaQyjGeMch01JsjFSILXkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753981429; c=relaxed/simple;
	bh=2tAXVB1zS0fbFV07QHRS1lfeC13o7s8/xB6aOEqZZXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1oksldy0zRsM6bfynILDxDur8JowULp3f0gVE4hXUaV593cXvhiDgVyoD8lW4xA/+otz5MISKIdPBp+uIUr8fBrfPVpM2RMVRPWwluGHuLpmW08c1fiyFBFJ0YI1Hgw+NVJajjPyIrNi6Ny5Ofu+poPIDw8HANQ/EIELQscVnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVREDD5o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397C0C4CEEF;
	Thu, 31 Jul 2025 17:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753981429;
	bh=2tAXVB1zS0fbFV07QHRS1lfeC13o7s8/xB6aOEqZZXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVREDD5oM7qlnIbwf1Wj5hFuD1tNvkwj1WyUZTh018aioIRvnMVClfne5dGEoaKBm
	 TRSVRtSnr5In3JnYK/JND7PavqV0A5XNQksGR0kdNHOuEtK1dal7Rny/HBDyQLe0EC
	 FznM9FQwHOhDuj+9x5kcrL0/8qWAJ+FJ6ahQyFdS22IGGd2f8R4+Fd9a26HvrVmcav
	 FcMTcWOch0IH4XmXJJv+28ecMylOC8kma0T58a2PbAEQ2AqbEOpif3Z6LHRTpGLSTx
	 ypDsTa1bZx4YTWAVkTpgePJFPUlFjevN3g74kV9sKKcPbylZAwgds5HRExqnTWejK8
	 Lo3aBLrm97FHA==
Date: Thu, 31 Jul 2025 18:03:43 +0100
From: Mark Brown <broonie@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [BUG] 6.16-rc7: lockdep failure with max77620-gpio/max77686-rtc
Message-ID: <b91dd3c5-c24e-43d1-8d06-8ec4d01f2762@sirena.org.uk>
References: <aIpdVejR3Jkh9Z_I@shell.armlinux.org.uk>
 <97f0e27f-3128-4821-bc09-2acde1ebf81a@kernel.org>
 <aItfC4AjjH-IdBfy@shell.armlinux.org.uk>
 <68c210a2-49b2-4fd2-97ad-27af85369d9f@sirena.org.uk>
 <aItk4vWPnFk6lYjn@shell.armlinux.org.uk>
 <4f80be02-0bbe-4c10-a3d2-324916ea2ca4@sirena.org.uk>
 <aIuSdnV8sWnUqLOq@shell.armlinux.org.uk>
 <14c68c29-68d8-4119-8f70-616c07397dc4@sirena.org.uk>
 <aIuZt3asLeiYncH1@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KpKo0V2Zeoh83XWp"
Content-Disposition: inline
In-Reply-To: <aIuZt3asLeiYncH1@shell.armlinux.org.uk>
X-Cookie: Gloffing is a state of mine.


--KpKo0V2Zeoh83XWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 05:28:39PM +0100, Russell King (Oracle) wrote:
> On Thu, Jul 31, 2025 at 05:16:13PM +0100, Mark Brown wrote:

> > Yeah, and that's all internals which we're not super encouraged to peer
> > at.  There should be something that'll give us a nesting level
> > somewhere... =20

> > Lockdep's handling of nesting is generally fun.

> As I said, I'm just going to disable lockdep to shut up the warning and
> not pursue any further time on this. If someone else cares about it
> (which I doubt) they can try to come up with a solution. I suspect
> nested regmap-irq is extremely rare.

I'm pretty sure it's extremely rare, and I'll have to construct a
virtual setup to actually test.  After poking at it some more I think
we're actually going to need an explicit lock_class_key for each
regmap-irq rather than relying on the default lockdep one.  I'll try to
send out a patch for that today or tomorrow but likely not really tested
- if you could find time to give it a spin on the affected system that'd
be good, but if not no worries.  Thanks for the report and analysis.

--KpKo0V2Zeoh83XWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiLoe8ACgkQJNaLcl1U
h9B70Af/fPQQnTSrEJoBi3G6dpKvW4ILIdn+PknXcFwEHbZSW25xzdkz8i8Ba43t
DoV6K/CKVG1fZENnBjxy3P/kbMlteCjrsHgrS7aNEkJAdq8PtzLp7m6xeR7iO+wF
QFeDaAE7vNl4WJ2OUTTPF75PYichOp7pCCZldfqiIeRRy8naN8bcNzh2W0GKihN4
+U0YcHo6BopotCK0kJgThXWTfyIPzGDJNSZY3cEu8T2bIum+YI0rjcwvlXnnj66d
bLiCOmk5U7rHrLP8t5QVq+RyDZru5GVWN88StCdRNZvPuElJNTBs3aP+SNjN/qd6
LBjYAk+yW37sF4EoYXtAcddvodCzbQ==
=fbAi
-----END PGP SIGNATURE-----

--KpKo0V2Zeoh83XWp--

