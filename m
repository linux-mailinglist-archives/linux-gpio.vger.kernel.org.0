Return-Path: <linux-gpio+bounces-23928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A6B176C9
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 21:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4A6062294C
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 19:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1DA24EAB1;
	Thu, 31 Jul 2025 19:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSmPU6wP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C4315533F;
	Thu, 31 Jul 2025 19:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753991431; cv=none; b=eXgdgQv9L295Qo25AlT2Ri1y4d3uue2j0QC0wOGTphQzfFH097r0HH/dRDmbAf2dK+21fOY3nb8SpuD/OyyN6XYAfGY5NxQOb52hVri5PuTQZuOPM0bFEvggAe37xrNyLUT3egjf3H2VXgtnslmKhMI16rFB44SasrSzGGAwS4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753991431; c=relaxed/simple;
	bh=wHHdwi555LSUCs8fy2BKukjUKmCeQeyBVIJjWXpMqpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDIbVmbqdlXvelxP9QgDMt2v1waAEMuK0AiPijfqC3EVUunzHp2mB74DIjU5rkpTSEkHCN8yzXGv8fgWzNIEhd2MZ+4sNaQ1mBsdGxrNHGqMtKEJ6tadoktwYpD4+tRwpBdTCyzo6/5g18JuWnCCgGBkWRKcLh+pT5IdwGF0VRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSmPU6wP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A325C4CEEF;
	Thu, 31 Jul 2025 19:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753991431;
	bh=wHHdwi555LSUCs8fy2BKukjUKmCeQeyBVIJjWXpMqpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSmPU6wPzGmDNBOjo1p0nZdSMhwexlQKEIUzglJM5VAuWSHFPxf05HE6wUtOOD/Lp
	 sf+vWnufWeYLi1rN/wUXx2GK4jRLWcmmHcxPv1SevBWuEppLemd0fDLh+7gAXN1vuS
	 kKxvZ0R7gzQKXhDrSvrHmTeXoekV9BcKIUOjGO9P3jS3RtqbvSvdpkhGJNcBCgqJN5
	 JGqCVMYhKPrRDzEo/vf5LrP4XF4kurpURDAcwldh6GzIvRyPgVLZ0EtEPNrEPoXnfF
	 z3HSgfcSk876IiSle/2Ca++ShrG60EfMJo60+2KKt7/idWAVJfTXIxCKQkQap2Ihg/
	 fk7hSCCMJmiNA==
Date: Thu, 31 Jul 2025 20:50:25 +0100
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
Message-ID: <db1d1256-8911-4db1-98e2-4f5808cbd712@sirena.org.uk>
References: <97f0e27f-3128-4821-bc09-2acde1ebf81a@kernel.org>
 <aItfC4AjjH-IdBfy@shell.armlinux.org.uk>
 <68c210a2-49b2-4fd2-97ad-27af85369d9f@sirena.org.uk>
 <aItk4vWPnFk6lYjn@shell.armlinux.org.uk>
 <4f80be02-0bbe-4c10-a3d2-324916ea2ca4@sirena.org.uk>
 <aIuSdnV8sWnUqLOq@shell.armlinux.org.uk>
 <14c68c29-68d8-4119-8f70-616c07397dc4@sirena.org.uk>
 <aIuZt3asLeiYncH1@shell.armlinux.org.uk>
 <b91dd3c5-c24e-43d1-8d06-8ec4d01f2762@sirena.org.uk>
 <aIvCE4x24RigKBKF@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="clFkggijA/AbTF/J"
Content-Disposition: inline
In-Reply-To: <aIvCE4x24RigKBKF@shell.armlinux.org.uk>
X-Cookie: Gloffing is a state of mine.


--clFkggijA/AbTF/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 31, 2025 at 08:20:51PM +0100, Russell King (Oracle) wrote:
> On Thu, Jul 31, 2025 at 06:03:43PM +0100, Mark Brown wrote:

> > I'm pretty sure it's extremely rare, and I'll have to construct a
> > virtual setup to actually test.  After poking at it some more I think
> > we're actually going to need an explicit lock_class_key for each
> > regmap-irq rather than relying on the default lockdep one.  I'll try to

> I hope we don't have too many regmap-irq's in a system - see the
> section on "Troubleshooting" in the lockdep documentation. There's
> a limit on the numbe of classes over the entire kernel.

Yeah, we shouldn't I'd hope but obviously there could be some use case
I'm not aware of that results in huge numbers in normal operation.

> As I understand from the documentation, lock classes are create-only,
> there's no way of "freeing" them later, so we better not get into a
> situation where the number of classes steadily increase while the
> system is running!

There is a free function, and it does actually seem to do something
useful these days - looking at the code and changelog the documentation
is bitrotted there, dynamic keys were added in 2019.

--clFkggijA/AbTF/J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiLyQEACgkQJNaLcl1U
h9DYJgf9HyXxQp/PKFSpIu/kHjHTHH7AUt1l/TRWCW2xttVFyKwHKfDzYKgUg6wf
mTWK0yWAxgu+9dMPsd53kznxbv4FoCvAfkvM4tWCiDbLgAT2b1QxqvQ7Q7IpQED4
Xhp9SdZpCCjbqNvPkUyXV09IJDmAwEYzANhqUYyUkGtszJUt4HaMoZ3ida2rFE3M
XCrQNMC3yHVeoPqCKD39ifKmqpaAUA8p31XEq7gtJhpvlr+P1OkuGVyBlb+/u7WN
LmVcYfPYzOp7tzdA6B4FAFQz1kjKFsidbeEEoQkoaDG+hcSPSgrYa7n4bfY2ZB16
l0y8yPibF3Lyo1dLOrxSQ+ZMas47BQ==
=rx6w
-----END PGP SIGNATURE-----

--clFkggijA/AbTF/J--

