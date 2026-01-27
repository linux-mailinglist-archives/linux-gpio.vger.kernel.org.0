Return-Path: <linux-gpio+bounces-31184-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGcmL6M4eWkJwAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31184-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 23:13:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E0E9AF1B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 23:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 513C43030B2F
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 22:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3DC34EEF6;
	Tue, 27 Jan 2026 22:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKYwogTj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9ED346AD9;
	Tue, 27 Jan 2026 22:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769552014; cv=none; b=o8Gqetz9qMBRlA3DyTiaiCjzMhIcAyA5tEHpC5zKLPSVgLbJbDsM6DOONN2Qq46h/ttiX8Ifxzoqpt+6iJxXYR9x+ukMmyzL6N6bCJ+03958QviTf00SKCWeZb0+A2aYPGOivwwz5kk0bn+w3tN/nwdPDQA4RaJ/bSRlVYZpSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769552014; c=relaxed/simple;
	bh=tatN23tenWNRFoQgcpLR1AWmBd5uDsA2y3KuOTtwtIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXOg1EbNwsIkDLmVL1pJ9T0Pxu72m/WS6zls4lGVH5fLls0gWf7lSKpeBajW2JH9c8hPXtO41QCpZAy0SnuIVyHE6v3UA9zi6Az+pzBMqJRTu3Sgk57R7hocYXAfd06n8hv5+YlOvlBWD7tc199y0TzoNgX3QgD37lpuy7quY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKYwogTj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45942C116C6;
	Tue, 27 Jan 2026 22:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769552014;
	bh=tatN23tenWNRFoQgcpLR1AWmBd5uDsA2y3KuOTtwtIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKYwogTjYu6oyUyl1CUIvmebJj66jUtzn96qocehm8PKIXFa0VXKpPuw8eA+xma5a
	 JgsgLlxTH/DYrsQWCyN69MfoZYDp3GpURB3Rx3QdYIyMtJrNaw+8Daz3IRLuR5Hq1v
	 HgeeO5CudJfsfcBB6A3X/bsx9n34Jns7KGGs2NSx9WSrzLjxMIs7apPQ0WlTKCcwPI
	 Vmdk3Z2HR+qHeTrYNBjYaxFYwtHGENFGbpeU8CuBO/v1sKbamjDx7VUcpL+JB1wcvF
	 oxPjaqkRGqDxISZMcDEYRi2xig9zWYRz0nV7lOYyTKGyC05M15QbrReS3DHtJ0aFFd
	 /En2qwfWshz4Q==
Date: Tue, 27 Jan 2026 22:13:31 +0000
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
Message-ID: <20260127-habitual-suggest-c3f429569fb6@spud>
References: <202601271725.gqlQ8Jl7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sB/B79g2sJNTti0u"
Content-Disposition: inline
In-Reply-To: <202601271725.gqlQ8Jl7-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-31184-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 15E0E9AF1B
X-Rspamd-Action: no action


--sB/B79g2sJNTti0u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 05:24:53PM +0100, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinc=
trl.git devel
> head:   ebd2f48dff6ae15bc1cbc7c7ae3c5fe10ad08087
> commit: 488d704ed7b7e7afeef24ee846c8223b607357b7 [39/46] pinctrl: add pol=
arfire soc mssio pinctrl driver
> config: i386-kismet-CONFIG_GENERIC_PINCTRL-CONFIG_PINCTRL_POLARFIRE_SOC-0=
-0 (https://download.01.org/0day-ci/archive/20260127/202601271725.gqlQ8Jl7-=
lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20260127/202601271725=
=2EgqlQ8Jl7-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601271725.gqlQ8Jl7-lkp=
@intel.com/
>=20
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for GENERIC_PINCTR=
L when selected by PINCTRL_POLARFIRE_SOC
>    WARNING: unmet direct dependencies detected for GENERIC_PINCTRL
>      Depends on [n]: PINCTRL [=3Dy] && GENERIC_PINCONF [=3Dy] && GENERIC_=
PINCTRL_GROUPS [=3Dn] && GENERIC_PINMUX_FUNCTIONS [=3Dy]
>      Selected by [y]:
>      - PINCTRL_POLARFIRE_SOC [=3Dy] && PINCTRL [=3Dy] && (ARCH_MICROCHIP =
|| COMPILE_TEST [=3Dy]) && OF [=3Dy]

I guess I'll send a patch restoring the selects to the driver option
Linus?

--sB/B79g2sJNTti0u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXk4igAKCRB4tDGHoIJi
0lIHAQDmQpu2bWDDiR4Lvi3OltPVc5SpMAJNba5B64YqKncwyAD+LQDaGbWWjin5
DeyRU24BPivXYPpfWfPbbsJAZO7DKg8=
=aV/B
-----END PGP SIGNATURE-----

--sB/B79g2sJNTti0u--

