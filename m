Return-Path: <linux-gpio+bounces-36874-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD+sGmw+BmqmggIAu9opvQ
	(envelope-from <linux-gpio+bounces-36874-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 23:28:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C26965470CB
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 23:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1F59300CC15
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 21:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A033BF696;
	Thu, 14 May 2026 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEHNj7or"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC18530FF20;
	Thu, 14 May 2026 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778794078; cv=none; b=ZhC6ydo00SkTPvvZR4YPeYcF9Ok/KNd3HR1r178vzS0IS/UQZDdtzwRbETBDloBwOhBR9h6wZe6oayYAai7996hGijsB4i0EjnAELSJuD06tct0AtwLE9+3AgNtyIZFFKjsk5TBWhnZ95/HK1HLWOdtdKU/l0vdV95piGLVsroY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778794078; c=relaxed/simple;
	bh=gc45MH4tNA2Zbfirgv0Vs2Zj8hjZgaKvCHh9gipAfKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZeNmymrk+SvcAqOosx1+ju+u84AjUDZY7tqthQN8LolPeuqjRBTdi+4Kn+0OmOEa6hltLBfZOWvlJnTyTxgmNk5X9UOYPFJxiRCDJj4NcP5+3YEEkwqgtC/DXwq4XSxiLZmBxE73qUAMu0cz7CEge01NmdmlEyJ4AGYkpa+PI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEHNj7or; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4342CC2BCB3;
	Thu, 14 May 2026 21:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778794078;
	bh=gc45MH4tNA2Zbfirgv0Vs2Zj8hjZgaKvCHh9gipAfKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEHNj7or+o9UARK4AvxcAfJLge76uSCtWm3vMFjd6z6SEhiokMbE5K+g0QHQu3juz
	 iZIJUhapkHk/JRb0i/PKXlVtZ2AUhxYqouifx0i9IL7CENrltOd3yHoOa8vjg7+/1T
	 8dp6vKh0DqpfshrnD4Il6JX1Jl/PKas20XCjlVfyePJui4CrLNYqf4eTEz0h/12nd2
	 Wlo7Jb5QqLSPGpwRt9yoPfpx3l5RdXBcY6xrlSWXw3BNhJtwZjcfeEwBzzeSOguQoN
	 46UE5Vy9ZHSoykI9KgaC72bN954n3s6FROG7BTAaiyTMGJLYkXASTZOInaIFlGr6LW
	 H4VmvZVT4Paiw==
Date: Thu, 14 May 2026 22:27:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] pinctrl: Add OF dependency for PINCTRL_GENERIC_MUX
Message-ID: <20260514-animation-barn-9f3aaa4331be@spud>
References: <20260512144806.22447-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="as4Oxx7xElh3JQlV"
Content-Disposition: inline
In-Reply-To: <20260512144806.22447-1-Frank.Li@nxp.com>
X-Rspamd-Queue-Id: C26965470CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36874-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,intel.com:email]
X-Rspamd-Action: no action


--as4Oxx7xElh3JQlV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 10:48:05AM -0400, Frank Li wrote:
> Add an explicit OF dependency for PINCTRL_GENERIC_MUX to ensure the
> generic mux support is only enabled when device tree is available.
>=20
> Also fix the stub implementation of pinctrl_generic_to_map() by correcting
> its last argument to match the non-stub prototype.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604072013.aI84l57L-lkp@i=
ntel.com/
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Having been baited into sending a fix for the incorrect signature cos
the commit message here suggested that this was a dependency fix for
just the driver, I think this should be split into two patches,
especially since the commits fixed by each hunk here are different.

Additionally, looks like you're also missing fixes tags.

Cheers,
Conor.

> ---
> Linus Walleij:
> 	I am sorry for missed a previous fixes patch
> (https://lore.kernel.org/imx/20260408050702.2454661-1-Frank.Li@nxp.com/)
> when rebase since it is located another fixes tree.
>=20
> Frank
> ---
>  drivers/pinctrl/Kconfig   | 1 +
>  drivers/pinctrl/pinconf.h | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 31d698fbaa01d..f4ffe1f3b720f 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -275,6 +275,7 @@ config PINCTRL_GEMINI
>  config PINCTRL_GENERIC_MUX
>  	tristate "Generic Pinctrl driver by using multiplexer"
>  	depends on MULTIPLEXER
> +	depends on OF
>  	select PINMUX
>  	select GENERIC_PINCTRL
>  	help
> diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
> index fa8fb0d290d1d..9711d16c38b62 100644
> --- a/drivers/pinctrl/pinconf.h
> +++ b/drivers/pinctrl/pinconf.h
> @@ -195,7 +195,7 @@ pinctrl_generic_to_map(struct pinctrl_dev *pctldev, s=
truct device_node *parent,
>  		       unsigned int *num_maps, unsigned int *num_reserved_maps,
>  		       const char **group_name, unsigned int ngroups,
>  		       const char **functions, unsigned int *pins,
> -		       void *function_data)
> +		       unsigned int npins)
>  {
>  	return -ENOTSUPP;
>  }
> --=20
> 2.43.0
>=20

--as4Oxx7xElh3JQlV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagY+WgAKCRB4tDGHoIJi
0mUtAP0aSCPsYXs2gp49NArMcMu/OvVnuBHZ3DdRGlHtIFyXyAEAhO49MYUyQ4KD
VLUMDkdri+QCJcO6mTLH1RwLVX27FQE=
=8xRf
-----END PGP SIGNATURE-----

--as4Oxx7xElh3JQlV--

