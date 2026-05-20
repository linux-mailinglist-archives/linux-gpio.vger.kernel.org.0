Return-Path: <linux-gpio+bounces-37204-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBFwI8DGDWrg3AUAu9opvQ
	(envelope-from <linux-gpio+bounces-37204-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 16:35:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 062FC58FB57
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 16:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1AF53226633
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 14:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC333EDADC;
	Wed, 20 May 2026 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpL99mZ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEE43EEAE5;
	Wed, 20 May 2026 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286391; cv=none; b=n66OWMF3JNhRRzJs3LCH0Qd8hXusAD71C1EecuT5HuedvFcpTr8an6dDbqdmA9X0AezNHu7FMk8TUJA9j3vmZcsCVxdS63yvA+NN7UO+UoISardhkdAiOssYjy/LxEd034ZTBZLH+irHzq4ZzBXzkqcvJShOS4CYUFovwOUEEDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286391; c=relaxed/simple;
	bh=NRpwV9MWffZpYr7NgX302LhiIKxA0mi64NK7bsgefAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1BThc5xS0ilrKTO7NpB7WM2HrXntOfULRLVCQ8MpbfXIsCRU5h/5u6JzXu/9rUlDx+IuxALz/a7qEen/+xSUSEHeaL/x1yIGAYM4GObYuKSHfv3g4aiDkzXhT0LjSKZSOgzzsoN40CYBfOHsoIYHRE7fmgNW0tFwJFIjQ8iDvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpL99mZ/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857421F000E9;
	Wed, 20 May 2026 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779286389;
	bh=KJr/URFxym0ZMrb5azCafonUL/4VJBqkePAae8JJsz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jpL99mZ/X1Yi3AGGp5lqJRUj0cDzTjB90sBRdEz0n2Df3Cn8qHiZCqlKXRn7j98vb
	 BFBgNXvbmPnBnYfRgEDpPDOahgvDVpCqlZBWXWJY/Jj7lB4NrHaXkHdqlKfdCBNbox
	 x8pOFW26zC7zF8ySBy3YC97W/ZxqGM+hQlaD0EElVaSyOYivuVJgolYFVx/kXYzQ/j
	 dQJ714QceRRTLMxedO2bIFNQf14CC288FQjRkq/LcJgMdBKPh5DUoR53vEdaag2vNJ
	 yOboU7/HJduK/w62FkRKZsBEJa8cI6/MdwdL+HIPtzjQ8VR1i6G3MTwqjsP+vkqKLN
	 4B6DNrDfxLfUw==
Date: Wed, 20 May 2026 15:13:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: avoid duplicate function definitions
Message-ID: <20260520-princess-garden-a6d5ad4f164a@spud>
References: <20260520075125.1514312-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BwO04UgHN+DSnFRs"
Content-Disposition: inline
In-Reply-To: <20260520075125.1514312-1-arnd@kernel.org>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,microchip.com,arndb.de,intel.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37204-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,arndb.de:email,microchip.com:email]
X-Rspamd-Queue-Id: 062FC58FB57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--BwO04UgHN+DSnFRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 09:51:14AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The pinctrl_generic_to_map() and pinctrl_generic_pins_function_dt_node_to=
_map()
> functions are built whenever CONFIG_GENERIC_PINCTRL is enabled, including
> configurations without CONFIG_OF.
>=20
> When CONFIG_OF is disabled, the dummy definitions are also present in the=
 header,
> which causes the build to fail:
>=20
> drivers/pinctrl/pinctrl-generic.c:20:5: error: conflicting types for 'pin=
ctrl_generic_to_map'; have 'int(struct pinctrl_dev *, struct device_node *,=
 struct device_node *, struct pinctrl_map **, unsigned int *, unsigned int =
*, const char **, unsigned int,  const char **, unsigned int *, unsigned in=
t)'
>    20 | int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct de=
vice_node *parent,
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/pinctrl/pinctrl-generic.c:16:
> drivers/pinctrl/pinconf.h:193:1: note: previous definition of 'pinctrl_ge=
neric_to_map' with type 'int(struct pinctrl_dev *, struct device_node *, st=
ruct device_node *, struct pinctrl_map **, unsigned int *, unsigned int *, =
const char **, unsigned int,  const char **, unsigned int *, void *)'
>   193 | pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device=
_node *parent,
>       | ^~~~~~~~~~~~~~~~~~~~~~
> drivers/pinctrl/pinctrl-generic.c:130:5: error: redefinition of 'pinctrl_=
generic_pins_function_dt_node_to_map'
>   130 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_d=
ev *pctldev,
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/pinctrl/pinconf.h:184:1: note: previous definition of 'pinctrl_ge=
neric_pins_function_dt_node_to_map' with type 'int(struct pinctrl_dev *, st=
ruct device_node *, struct pinctrl_map **, unsigned int *)'
>   184 | pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *=
pctldev,
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Removing either set of definitions is sufficient to avoid the problem.
>=20
> Remove the copy from the header for simplicity.
>=20
> Fixes: aaaf31be0426 ("pinctrl: extract pinctrl_generic_to_map() from pinc=
trl_generic_pins_function_dt_node_to_map()")
> Fixes: 43722575e5cd ("pinctrl: add generic functions + pins mapper")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

And all of the of functions it uses have NOP variants don't they, so
this is the correct fix from a build coverage point of view.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  drivers/pinctrl/pinconf.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
> index fa8fb0d290d1..60c0e9ac0464 100644
> --- a/drivers/pinctrl/pinconf.h
> +++ b/drivers/pinctrl/pinconf.h
> @@ -167,7 +167,7 @@ pinconf_generic_parse_dt_pinmux(struct device_node *n=
p, struct device *dev,
>  }
>  #endif
> =20
> -#if defined(CONFIG_GENERIC_PINCTRL) && defined (CONFIG_OF)
> +#if defined(CONFIG_GENERIC_PINCTRL)
>  int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pct=
ldev,
>  						 struct device_node *np,
>  						 struct pinctrl_map **maps,
> --=20
> 2.39.5
>=20

--BwO04UgHN+DSnFRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag3BWwAKCRB4tDGHoIJi
0jF8AP9X9T3DeHGpAkhYhIF3tdQjH9tI+mmqqCHSNW85SH6Q1QEA09pB7SPIU45v
hG+8zmrGO3oZDA6ya3qmmhIHK1SD/Qk=
=RK/z
-----END PGP SIGNATURE-----

--BwO04UgHN+DSnFRs--

