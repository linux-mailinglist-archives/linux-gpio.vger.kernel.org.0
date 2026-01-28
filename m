Return-Path: <linux-gpio+bounces-31217-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLsWD+PpeWkF1AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31217-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 11:50:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 937F09FB1D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 11:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBC1C300B45A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E21C33123C;
	Wed, 28 Jan 2026 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CK7tWumR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F362DA769;
	Wed, 28 Jan 2026 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769597395; cv=none; b=EoBI4TBOYLHZgrd/y2iAoexnyKcbuMwapWpafGXLvUasZp6+pwk53dxnbfScP0UpbxGLAhPAV8qPFi9UQaaf34aHLtpbUr12hGxcGu7jcYWBw2ndvg2x0exhDTdSPUVqoWtxy8EhAnMbYdvxwcrhs4Pwj3I8Eoiyi46I2p1rAJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769597395; c=relaxed/simple;
	bh=ZlAZ/M706u5WyXvMWttbiROmjmttRHJjGnF8vXABLss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqREl8zBxzpHbMgOzW7VaqrQrHa4NiS+faFxLnuEjAnW1kTbAN5vw9Xo3b7W9rqB4hITkC3LK6YPWSOocTF2BQU75cIzwPZDB1DJnvyZdu9zcl4sT44UkO214xspKOs5x8gKsCKsyGiV6yy2VBPjMaeVIfYS1Okbwc/8r7Oxcpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CK7tWumR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D0FC4CEF1;
	Wed, 28 Jan 2026 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769597394;
	bh=ZlAZ/M706u5WyXvMWttbiROmjmttRHJjGnF8vXABLss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CK7tWumRbdFVNPAioN73u89MmjH0voae1VWHBfVarE+1pXqByC8OW7Keckx4FDD2p
	 GeLkmEWDdv+hdIbb/5divyTtSXeyOcdbCfDXvXHevaCoTD3WDQWEfoP1/2EId2Xwf0
	 vkx6RtvrEYysp2zzD6mDxGbBamtprecPt3KURandvUJRxJgwTXciaV6EFucM7pYF5/
	 LylIJD7jDrOuRrRZew8NY+oJzfOPVu7h4Eev5J5S6twSsr03sVnbucgTUbpLdGZz32
	 xl+LAnaGWy7K7AMxIBxNNXfpG+s69k2comQrf8Sq/IkEsLwNFRwQkSEHNHpP5A5aqw
	 TpGySY1Ch+yTg==
Date: Wed, 28 Jan 2026 10:49:51 +0000
From: Conor Dooley <conor@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [linusw-pinctrl:devel 39/46] kismet: WARNING: unmet direct
 dependencies detected for GENERIC_PINCTRL when selected by
 PINCTRL_POLARFIRE_SOC
Message-ID: <20260128-magenta-unsealed-f7586f14eed3@spud>
References: <202601271725.gqlQ8Jl7-lkp@intel.com>
 <20260127-habitual-suggest-c3f429569fb6@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bproHWhnrolimAuD"
Content-Disposition: inline
In-Reply-To: <20260127-habitual-suggest-c3f429569fb6@spud>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,pgazz.com,gmail.com,lists.linux.dev,vger.kernel.org,kernel.org];
	TAGGED_FROM(0.00)[bounces-31217-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,01.org:url,intel.com:email]
X-Rspamd-Queue-Id: 937F09FB1D
X-Rspamd-Action: no action


--bproHWhnrolimAuD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 10:13:31PM +0000, Conor Dooley wrote:
> On Tue, Jan 27, 2026 at 05:24:53PM +0100, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pi=
nctrl.git devel
> > head:   ebd2f48dff6ae15bc1cbc7c7ae3c5fe10ad08087
> > commit: 488d704ed7b7e7afeef24ee846c8223b607357b7 [39/46] pinctrl: add p=
olarfire soc mssio pinctrl driver
> > config: i386-kismet-CONFIG_GENERIC_PINCTRL-CONFIG_PINCTRL_POLARFIRE_SOC=
-0-0 (https://download.01.org/0day-ci/archive/20260127/202601271725.gqlQ8Jl=
7-lkp@intel.com/config)
> > reproduce: (https://download.01.org/0day-ci/archive/20260127/2026012717=
25.gqlQ8Jl7-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601271725.gqlQ8Jl7-l=
kp@intel.com/
> >=20
> > kismet warnings: (new ones prefixed by >>)
> > >> kismet: WARNING: unmet direct dependencies detected for GENERIC_PINC=
TRL when selected by PINCTRL_POLARFIRE_SOC
> >    WARNING: unmet direct dependencies detected for GENERIC_PINCTRL
> >      Depends on [n]: PINCTRL [=3Dy] && GENERIC_PINCONF [=3Dy] && GENERI=
C_PINCTRL_GROUPS [=3Dn] && GENERIC_PINMUX_FUNCTIONS [=3Dy]
> >      Selected by [y]:
> >      - PINCTRL_POLARFIRE_SOC [=3Dy] && PINCTRL [=3Dy] && (ARCH_MICROCHI=
P || COMPILE_TEST [=3Dy]) && OF [=3Dy]
>=20
> I guess I'll send a patch restoring the selects to the driver option
> Linus?

No, I don't think that's correct. It's the below, right?

-- >8 --
=46rom 9612e8daf992bc0f012745a6d36679b3511a88a3 Mon Sep 17 00:00:00 2001
=46rom: Conor Dooley <conor.dooley@microchip.com>
Date: Wed, 28 Jan 2026 10:46:49 +0000
Subject: [PATCH] pinctrl: fix kismet issues with GENERIC_PINCTRL

lkp reported that GENERIC_PINCTRL can be select when its dependencies
are not. Swap the "depends on" out for "select", as is used in other
parts of the pinctrl core that are expected to be selected by drivers.

Fixes: 43722575e5cd ("pinctrl: add generic functions + pins mapper")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601271725.gqlQ8Jl7-lkp@int=
el.com/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 6cc5e214f4f3..afecd9407f53 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -27,9 +27,9 @@ config GENERIC_PINCONF
=20
 config GENERIC_PINCTRL
 	bool
-	depends on GENERIC_PINCONF
-	depends on GENERIC_PINCTRL_GROUPS
-	depends on GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
=20
 config DEBUG_PINCTRL
 	bool "Debug PINCTRL calls"
--=20
2.51.0



--bproHWhnrolimAuD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXnpzwAKCRB4tDGHoIJi
0tbKAPsECTEk+5aQisXwZ9gkArj7fozl9u50zBnF/KPSRujhogD/ai23lWqS5iCy
1SveefUW6oJZJquGMDyLwF0q0I3fJQM=
=Ro3L
-----END PGP SIGNATURE-----

--bproHWhnrolimAuD--

