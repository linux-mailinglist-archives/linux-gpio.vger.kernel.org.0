Return-Path: <linux-gpio+bounces-31355-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK+BCUMBgWlyDgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31355-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 20:55:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF4DD0DE0
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 20:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74F56304022F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Feb 2026 19:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB313090C2;
	Mon,  2 Feb 2026 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOIYFPCc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32403033F9;
	Mon,  2 Feb 2026 19:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770062009; cv=none; b=ZwH7aiVrlP6HjIuCvq9ZnvEBpolUAM/PdfyVjvEycvt6boujWhkJHuw/7G0oEYJnjc7EZQaOrf3gkaVFIA6ZnAv8puZPxDyDWtuywkRk0/HGTCwpO0WBs7dUhKN+PsesPZeWh6s/vLspvsEqtnBubd4i0pu8IW0IaTnDOcc7k+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770062009; c=relaxed/simple;
	bh=0spu46ssPKz3oPoW/17GGyrKFZ2kACMj8wzMUt35PoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIEO0hMpQivZbGvNOb/Z1gfdcbNZdycQ7ZrmiTjuKNsXxzJLk2EER9PyERoX0NALSJI5FE+49GfWBiUttYQbKLpACOGfhew7/Wv1KZf7BxVA1kJC1LsGLjMfzLMYy1YCgH3T2Pc7Hdy4zlGwPqq/uBdst0F97jQcSooTnLOLw5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOIYFPCc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E024C116C6;
	Mon,  2 Feb 2026 19:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770062009;
	bh=0spu46ssPKz3oPoW/17GGyrKFZ2kACMj8wzMUt35PoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOIYFPCcusHQnO4lXB0dKdzfCHkEC0dyjVH+UKw/VfqcGsABFPG5tEBVsVBJgE8rs
	 /AgObU6QGkMmmrfSRWSuT0/LXKhn0Q/1ksTWEjRmqlDu4sYTBDts0Zf6YezmP3JfQX
	 Gi1GM0nFB3dJTFmZe/JxeNnwoRx8DWhwTIamE64oTxNlcByjSiDEBMMSbzHcZ7RX3G
	 KDIDcTFT2JhoOED3nsoV5HaDNxgLk+aBjQYe5Kj5QyTdv9NZMA6Uw/11cFl1ENQItj
	 iBUtDn0GROsVSiSNe53Yde4lzZ+DTREkVUJNvsXzN6OuZpWGBafmRjWuyfPcasMgVv
	 G9f8XZr14q9wA==
Date: Mon, 2 Feb 2026 19:53:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: polarfire: restore GENERIC_PINCONF dependency
Message-ID: <20260202-lushness-drier-ae0e40b56eee@spud>
References: <20260202095809.1318785-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+6xmGbO1cxA4h5rN"
Content-Disposition: inline
In-Reply-To: <20260202095809.1318785-1-arnd@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31355-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Queue-Id: 8EF4DD0DE0
X-Rspamd-Action: no action


--+6xmGbO1cxA4h5rN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 02, 2026 at 10:58:03AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Changing over to the new CONFIG_GENERIC_PINCTRL dropped the GENERIC_PINCO=
NF
> option, causing a build failure:
>=20
> WARNING: unmet direct dependencies detected for GENERIC_PINCTRL
>   Depends on [n]: PINCTRL [=3Dy] && GENERIC_PINCONF [=3Dy] && GENERIC_PIN=
CTRL_GROUPS [=3Dn] && GENERIC_PINMUX_FUNCTIONS [=3Dn]
>   Selected by [y]:
>   - PINCTRL_POLARFIRE_SOC [=3Dy] && PINCTRL [=3Dy] && (ARCH_MICROCHIP [=
=3Dy] || COMPILE_TEST [=3Dy]) && OF [=3Dy]
> drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c:296:29: error: 'pinctrl_ge=
neric_get_group_count' undeclared here (not in a function)
>   296 |         .get_groups_count =3D pinctrl_generic_get_group_count,
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Select both GENERIC_PINCTRL and GENERIC_PINCONF to address this.
>=20
> Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Does this show up with
https://lore.kernel.org/all/20260130-stoop-gleeful-29f2c525bd48@spud/
applied?
I considered what you have here, went with what I linked cos it matches
the other pinctrl core options.

> ---
>  drivers/pinctrl/microchip/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/pinctrl/microchip/Kconfig b/drivers/pinctrl/microchi=
p/Kconfig
> index e8bc01946324..a4ae57725fdb 100644
> --- a/drivers/pinctrl/microchip/Kconfig
> +++ b/drivers/pinctrl/microchip/Kconfig
> @@ -12,6 +12,9 @@ config PINCTRL_POLARFIRE_SOC
>  	bool "Polarfire SoC pinctrl drivers"
>  	depends on ARCH_MICROCHIP || COMPILE_TEST
>  	depends on OF
> +	select GENERIC_PINCONF
>  	select GENERIC_PINCTRL
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINMUX_FUNCTIONS
>  	help
>  	  This selects the pinctrl drivers for Microchip Polarfire SoC.
> --=20
> 2.39.5
>=20

--+6xmGbO1cxA4h5rN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYEAtQAKCRB4tDGHoIJi
0nSQAQCsCEoEgfOQRq0YXUwzG7nreWY4VkwNQxv1n7zrRzTRoQEA9OXfetoHyMWN
xhTqxum9QPzG5/RxIgk2nan3nsbeOQ8=
=SrmQ
-----END PGP SIGNATURE-----

--+6xmGbO1cxA4h5rN--

