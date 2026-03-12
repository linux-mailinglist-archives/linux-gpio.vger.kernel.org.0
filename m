Return-Path: <linux-gpio+bounces-33299-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLepLHcas2mDSAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33299-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:56:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD42785F6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3409A311E4A0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F5D394478;
	Thu, 12 Mar 2026 19:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdvyO2d2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0F2DDCD;
	Thu, 12 Mar 2026 19:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773345393; cv=none; b=rTc+YS/2Sp0pSlkmuLa1V1hdBzUpkovMdVOD1jCh20sIuGKeweqANsK1hA9NDeN77vLfHm9PMrvEoNM7PSeOI+NZr4H76tirwRMxq7OU7dseqm5XKDh0Ui23DNG+KABel8d/lga+vFxp+YmXHFDVzX2EjedWXL1rGqd93silk68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773345393; c=relaxed/simple;
	bh=NjMdNKX+/UxCnp6e7j2/bWlIiNwme1uhQHNWdLdMGHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCEf57eTbmSo1JirnAZlutDKVwQoov32HBJqZDP0aY9v6xpxsGcHA8gvqW7ZQYlyIe6F8rbyIthtwAejAiajz/uHsQ/IQ4ROT1DEtMRCGWYfinZRAK0tZ77BROYrYXExLbINT4fEorwyCF+KZ23TanDAtDzocRApq8LyvCuOy4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdvyO2d2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBACCC4CEF7;
	Thu, 12 Mar 2026 19:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773345393;
	bh=NjMdNKX+/UxCnp6e7j2/bWlIiNwme1uhQHNWdLdMGHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdvyO2d2s9QKkc7zTkMLibjVOoIYJtCKSZ83dnNUdA1CrZ5NvtMXO/NuD3Z6nUAFz
	 p47JxUKmFdvYjXFsizhE08OWzj1bm7gYGOJWSJWHA7ICqf98ZiGeG37kkbn40Jj3gb
	 8kIOMIDMLi0CwKBeXUXshYVfUBEunfHsV5VlRm4Wy4xliKxwDpshx5a9Te29k+D50o
	 OtYEmUUtEYkF1sG55kNFyW/hpZWen8E0mtiOMW01TrkbxxF2qhpmVLXzklLb3ey65q
	 ea8byQMIC1plQcvxuuKOUVrhieyGahOf4hbo6+u/7gx/dsIzup4qGOJO+Q04MOumU9
	 aaRLNmr44vG+w==
Date: Thu, 12 Mar 2026 19:56:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	lee@kernel.org, linusw@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nb@tipi-net.de, navada@ti.com,
	v-hampiholi@ti.com, sandeepk@ti.com, baojun.xu@ti.com,
	shenghao-ding@ti.com
Subject: Re: [PATCH v1 7/8] ASoC: tac5x1x: Add TI TAC5x1x codec driver
Message-ID: <a13f104d-f8b0-4e23-baac-ecf5d6d0fc13@sirena.org.uk>
References: <20260312184833.263-1-niranjan.hy@ti.com>
 <20260312184833.263-8-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LjM/NfYqjLgygBG1"
Content-Disposition: inline
In-Reply-To: <20260312184833.263-8-niranjan.hy@ti.com>
X-Cookie: I feel better about world problems now!
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33299-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com,tipi-net.de,ti.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 18BD42785F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--LjM/NfYqjLgygBG1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 12:18:32AM +0530, Niranjan H Y wrote:

> +/* ADC Analog source Selection */
> +static const char *const tac5x1x_input_analog_sel_text[] = {
> +	"Differential",
> +	"Single-ended",
> +	"Single-ended mux INxP",
> +	"Single-ended mux INxM",
> +};
> +
> +static const char *const tac5x1x_input_analog2_sel_text[] = {
> +	"Differential",
> +	"Single-ended",
> +};

Should these be configurd from DT given that they'll likely depend on
wiring (I know a lot of drivers, especially old ones) make them runtime
configurable)?

> +static s32 tac5x1x_add_ip_diag_controls(struct snd_soc_component *component)
> +{
> +	struct tac5x1x_priv *tac5x1x_priv =
> +	    snd_soc_component_get_drvdata(component);
> +	struct tac5x1x *tac5x1x = tac5x1x_priv->tac5x1x;
> +	struct tac5x1x_input_diag_config *input_diag_config =
> +	    &tac5x1x_priv->tac5x1x->input_diag_config;
> +	s32 ret = 0;
> +
> +	switch (tac5x1x->codec_type) {
> +	case TAA5212:
> +		break;
> +	case TAA5412:
> +	case TAC5301:
> +	case TAC5311:
> +	case TAC5312:
> +	case TAC5411:
> +	case TAC5412:
> +		if (input_diag_config->in_ch_en) {
> +			ret = snd_soc_add_component_controls(component,
> +							     taa_ip_controls,
> +							     ARRAY_SIZE(taa_ip_controls));

These...

> +static s32 tac5x1x_add_controls(struct snd_soc_component *component)
> +{

> +	case TAA5412:
> +		ret =
> +		    snd_soc_add_component_controls(component, tolerance_ctrls,
> +						   ARRAY_SIZE(tolerance_ctrls));
> +		if (ret)
> +			return ret;
> +		ret =
> +		    snd_soc_add_component_controls(component,
> +						   taa_ip_controls,
> +						   ARRAY_SIZE(taa_ip_controls));

..are also added unconditionally here which will fail due to duplciate
registration?

> +static int tac5x1x_soc_resume(struct snd_soc_component *component)
> +{
> +	return 0;
> +}

Just delete the function if there's nothig to do.

--LjM/NfYqjLgygBG1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmzGmkACgkQJNaLcl1U
h9AWuwf+O2I1VNKLNMp5FX2IxevKnTF1iTGdgzWNXtHQGsOzC0Z44+H+UmHj9Y7L
uVwyZGSzeQptrApPRux7LTV8+NWdrH5gwRVnK8eRn/3De1jmaOGDT/SZgXfm3Bxh
CV4lDziszjZa7qWgIhfme/H+pVLurja4eBbOhx5O9nyLnEJYaHFu3G8/o+I0SByY
UytItHTikJ77REQklov3gt0CwMmCqSrdoX+tSUadsciwsXCTvuQJdrAnvU9AW4AH
yDzndpELdUkKk1Xj3ebs95syZg1OSeYsNDgQ5mPQUjMgq3Z7ygT0//nsuff96MAH
DOttvzmM70nJTlTDGlFmizKlBi1Z+g==
=Xpge
-----END PGP SIGNATURE-----

--LjM/NfYqjLgygBG1--

