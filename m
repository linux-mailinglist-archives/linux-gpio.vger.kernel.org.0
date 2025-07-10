Return-Path: <linux-gpio+bounces-23076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81DB0000F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 13:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 642391C821F9
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 11:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04692185B1;
	Thu, 10 Jul 2025 11:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUOlv+1a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7766F13A3F7;
	Thu, 10 Jul 2025 11:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752145470; cv=none; b=Y8a1DzZEGDToQMWowInKmd7GTOwc7MoT3ZUv4vaEIv3op62FieqHiogbr5Tjc90Iiv9BYcPTvdfFfxdg4O6KLiLzNK1bkNxm3uHS9XECJztrk3GCLTuqrlaTLRgtSKnl6MEHub4bQP5KpsSVjD4t1Y2hqI71VMmIx01ar8TFrEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752145470; c=relaxed/simple;
	bh=1x3NYBBTsupBB7WLvmPOB3tNBrIQbsz92bq+l+SFrL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krEK/lLsM02YE9etkOSUXvg48laR37yYNyPM9gEHEfDm/wZinZeOV0EPqplRyA/AEMq2sWgim2WIyTmnvtEj2QowpHQkYVcfcj5rOcxS6VBCxzug+49s5e65Z1Z1SMGHAjEej9e26gS6tLOphs8eQd20s0YgJFz2sCVuDdFExkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUOlv+1a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F770C4CEE3;
	Thu, 10 Jul 2025 11:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752145469;
	bh=1x3NYBBTsupBB7WLvmPOB3tNBrIQbsz92bq+l+SFrL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUOlv+1a+sww5010PMrNjc/k7iojHGRLHeYaRqO8WU1lcDzCXQXpZkTDA5b5AGVn4
	 diyxy4Sr0vpsV4udWox6CzPSuUgF4ic6gcOmI8wdrRxUPGNf9WF72Ybu5WXLmuGAiI
	 jSVk/YfaMmayjG1ybwebgnf5Ox0LMls+AuSmUu28cdMVAYw1UU/pBFUl3ZOJJvAoef
	 VxgWxnlq9MbWZu5B0PF3sO5mC1OQ0d/lXq3/O1YNUJhu+8Llma15yG8DNShB7IKipT
	 83miEkRDvCBtYC4eW6fPlmJ+mUosN8E6RebEPghNBFyVIXtxlIeMEQ3YAAHVMq5++i
	 p49xgnF/z2WMg==
Date: Thu, 10 Jul 2025 12:04:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD, Misc and Pinctrl due
 for the v6.17 merge window
Message-ID: <aG-eOvS6-XHvLOpb@finisterre.sirena.org.uk>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250710094906.GG1431498@google.com>
 <aG-OmSNn-oULfEuB@finisterre.sirena.org.uk>
 <DB8BCV6V36YE.20KJC5V0BJ1CN@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NYRHwGxhMPkUjlsm"
Content-Disposition: inline
In-Reply-To: <DB8BCV6V36YE.20KJC5V0BJ1CN@kernel.org>
X-Cookie: Do not cut switchbacks.


--NYRHwGxhMPkUjlsm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 10, 2025 at 12:46:52PM +0200, Michael Walle wrote:
> On Thu Jul 10, 2025 at 11:57 AM CEST, Mark Brown wrote:

> > Is there some reason you didn't also pick up the regulator patches?

> The regulator patches don't apply on the MFD tree because there are
> two new patches [1, 2] in the regulator tree. Also my patches rely
> on them. Thus, the idea was that Lee will provide an immutable tag,
> that you can pull together with the remaining regulator patches.

OK, if there's a situation like this then please don't send the patches
that can't be applied, that way maintainers for the other trees don't
need to see all the resends for something they can't act on.  Instead
ask for the teg, then send a pull request for the tag as part of the
cover letter for the series with the additional patches.

--NYRHwGxhMPkUjlsm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhvnjcACgkQJNaLcl1U
h9AO9wf/SttqipGFRQzotfTzdhU/snwTMxhbXDQgZtK7MfQHkPVYDwC6j0GhR5Ng
ouaLam6RhQkg1v2TI+w6GCzw9VxriH57LzDxe8fmp/GWVSgLkjFFHnND/cR+eC0x
VaoHtUpj5wPjdWf4JdiVvobvDxhZeaaZ1HtuWmEHeh05qI7dN3y+cXnRwOAot+vn
Sy/yKK1/rkpfHWbNuBBklEIBb00hkmvABQcimrCauBtOq7gpKNhUY5l4fBTo/TqS
a0qWtCtZS22U4HaO4U7/l6YXxYUyUqPXg3BBE4VeuK/ME9jd+2G31KqTtCi+Y1eh
+mmmW/MUuN+KLx9IZ+XWLiGZj4CFvw==
=aSka
-----END PGP SIGNATURE-----

--NYRHwGxhMPkUjlsm--

