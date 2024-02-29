Return-Path: <linux-gpio+bounces-4001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CA086D2CF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 20:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A111F23DB9
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 19:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB331361B3;
	Thu, 29 Feb 2024 19:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="L2M1CdA/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876E179933
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 19:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709233645; cv=none; b=mxCPnY9sUVQ6K9yEWEz5N0rcM0ObhtDJoVQ+V0nWUvg7jDnZEezIN8kQakZyJc2pfWHycHVZGAOQWHuNh3+7J44gBsh+Zcj28MfZfqHrKzaX16SGVrEvJaQy2zN3WSFL4RJRRpTHcm22xuHt8IExkCLlAbphKPYZnpIaMdwtnF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709233645; c=relaxed/simple;
	bh=sFEaFEP0W3WnyIYmVSeCbgOhkwzpK5w+B5dJBznneEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKvUAf57MJCqLhoO6igh3nj0HeFC4VEwMGu1M5skbnggxkTy+gNI0pbKAsSqwIPd3QOGsyGgzAjfL6GX5PtA8ju3sorNtBDWxwrdWr7iwOSy6ybBCQg05f/BKIbxYp9L8JkpalmkrQ6apeAB8lJ41EqmoJZM6eOLZ6SYpb4tLoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=none smtp.mailfrom=stdin.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=L2M1CdA/; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stdin.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sFEaFEP0W3WnyIYmVSeCbgOhkwzpK5w+B5dJBznneEA=; b=L2M1CdA/b6ENyhfSPG9ps1zYRt
	t8uZ/h8miRHLOYrJLjByp6PhO8N+MtzQCHaaLPcECz7aAS/G9jSXMBCC87vtcH2Y3XcM7DNgfadeD
	Wkc1Xpp5XoQ0Tb//EZ+arEFtXYR7+/Ynke3Ez9w7pbF/o+492Q9aUBh5dVaSS8i4jlVE=;
X-Preliminary-Spam-Score: -3.2 (---)
Received: from [10.42.0.16] (helo=login.tika.stderr.nl)
	by tika.stderr.nl with smtp (Exim 4.96)
	(envelope-from <matthijs@stdin.nl>)
	id 1rflkJ-004TYK-1Z;
	Thu, 29 Feb 2024 20:07:07 +0100
Received: (nullmailer pid 357456 invoked by uid 2001);
	Thu, 29 Feb 2024 19:07:07 -0000
Date: Thu, 29 Feb 2024 20:07:06 +0100
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org, Haojian Zhuang <haojian.zhuang@linaro.org>
Subject: Re: pinctrl: single: Cannot disable bias - PIN_CONFIG_BIAS_DISABLE
 not handled
Message-ID: <ZeDV2tpQi1H2q5PP@login.tika.stderr.nl>
Mail-Followup-To: Matthijs Kooijman <matthijs@stdin.nl>,
	Nathan Chancellor <nathan@kernel.org>,
	Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@linaro.org>
References: <Zd8hYYDvvk2Q-GcG@login.tika.stderr.nl>
 <20240229073211.GB5299@atomide.com>
 <20240229183115.GA2905548@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PhxeTTtHdiuOoKDL"
Content-Disposition: inline
In-Reply-To: <20240229183115.GA2905548@dev-arch.thelio-3990X>
X-PGP-Fingerprint: E7D0 C6A7 5BEE 6D84 D638  F60A 3798 AF15 A156 5658
X-PGP-Key: http://www.stderr.nl/static/files/gpg_pubkey.asc


--PhxeTTtHdiuOoKDL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

On Thu, Feb 29, 2024 at 11:31:15AM -0700, Nathan Chancellor wrote:
> On Thu, Feb 29, 2024 at 09:32:11AM +0200, Tony Lindgren wrote:
> > > cause. I also do not have a good toolchain setup for compiling custom
> > > kernels for this setup (and limited time for setting up one), so I do
> > > not expect to be able to provide more testing or a patch anytime soon.

Thanks for the suggestions for buildall, but when I said "toolchain",
I did not really refer to the actual gcc toolchain (I have that from
Debian packages), I meant more like knowing what kernel tree is used on
the board I am using (I've asked the maintainer of the image, no reply
yet), what kernel configuration to use, figuring out the right way to
deploy the kernel for that particular board. Maybe I should have used
workflow rather than "toolchain".


Wrt the suggestion made earlier to submit a patch even if untested - I'll
see if I can whip something up next week.


Gr.

Matthijs

--PhxeTTtHdiuOoKDL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMyF3AetYrDfGJ9el6ZMxy91tJYwFAmXg1dgACgkQ6ZMxy91t
JYyQLxAAv9XFBHHLkzj//q4cHO8S5eI+BLALRu3b9ulQd9dyAKnolPk9cLvCpflQ
LqPvidx5jjcckPzPtcBS15i2ggP7AdrcJYuNmuEZ9R2GosAUPRpfFAwvb5+2ozup
OtgQiaYOE/fBwId2vDn4YI83c4RrEJxxUmtgnWHO/EuxR4TEbyPEr+69qu0e4xnp
wn6cqUypfoLiJVL8uAHboFj9agXcDU7Vl7e6TlZWtrvAg+LvzUrKJhHhf6nbCvSl
YxfvbzQGtrOLp9rG7zou6PkUC+gVIVjt9/gAZPWTdqD2b575NZ/k6y4ljhYAnyfR
Yi97e8QpgPypiS1UZAf3KOrfbfUFJ22/pVG19b+DVUEGU8kJ06bnPFzin273hIhx
Hfnw9xkp/UZkYM6WfStGpaExR5OLf4vgqx/3w9yQygLtrUz59DE7EmOrnwoZU7rI
SMnvoEtdbNiavnoSbN3nEBv4KDZ8DsNMyWxS2ZOdyjvszbjQdH+AFxW5LzSrDTVU
qeQz573iRrlUumagaSGt4TUB2ahWkR45wOnvXy0L/waHouwrGU31+87VwunegwN/
Q3Pm0+/FFHsyFYt+h3wiq0CbXbyxeeoTVnkT828tjyzBBLD8ZqVOAGKcELuEV0C7
6U4Atq6tHFl6B2zeNF7JtvZKXqtG7ENAALtvrdHvCc5ceQZU7Fk=
=ABfD
-----END PGP SIGNATURE-----

--PhxeTTtHdiuOoKDL--

