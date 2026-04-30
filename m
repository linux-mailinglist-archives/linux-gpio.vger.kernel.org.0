Return-Path: <linux-gpio+bounces-35818-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC8KB1Ox8mlItgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35818-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 03:33:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B86249C066
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 03:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD47A301C975
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 01:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32946264612;
	Thu, 30 Apr 2026 01:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCszheGi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6525218EB1;
	Thu, 30 Apr 2026 01:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777512781; cv=none; b=Mc18qdrtf5tUjnGixJUk7BvuYkZ2OMe/qLnNRoaNROruA9OIGK7ZEMS/uFpU+mnaHh3/bmxT5JZtwDS5gj9Pbc65XBDTaWC7+Z3tiaKXbQFUG+jmAdeGae9IJbpNn5cwy6LEoFoxdlYYX8RhBIQsO0Y70oai3VHgPs/yOcy1sT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777512781; c=relaxed/simple;
	bh=i7DKF5WFF5Q8Rb2RXIWeQOHBYezeUVKdDpu9M5O4baA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZtQm6WDVHSFbxIf62szesWIHrYqrgnF3cPLyGxKyxTZGGIz5k6r5w2O3tJbjmVUqH3Z548U9WnU0VKzt9kS2MDjTLUdybSsUum4gzSIY58LA1JEiXIieJd/8vamRlzzcMAOgTkXIilXXRRrze0ErmuWf4IB97FqavGmZJmA7C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCszheGi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75424C19425;
	Thu, 30 Apr 2026 01:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777512780;
	bh=i7DKF5WFF5Q8Rb2RXIWeQOHBYezeUVKdDpu9M5O4baA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCszheGiQXAe5yn9Z++veLJzaGL3hmpLbQ2j9862D1S52cj8I7YjTav8ElZG3m5cb
	 rHhbnHNI/3iRADJHi2CUzQHrdFpAG0Ctqvm4itIQk6ta5P6CUjdWwtZ9/NqqsDjVAX
	 7h0rFmva5K7kKRPxrBFL0N/96zdtbjpvDwZXk1WstBfbknWhmb8K8yfWORAIywTMyV
	 zro0yoKxtlV65BYViiY/MVFOAYbTiXWbGj31jHodVaEU9Zc3HPLu9iOVypOLMwCe9z
	 5bufqZF1NJfXj8W7Vjs+QN/ms5YX956twT9RBax0+7gkSCCmpYhvbaH1dAkCyA+2n4
	 7TxHE+hfhboeA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D77B51AC585D; Thu, 30 Apr 2026 02:32:57 +0100 (BST)
Date: Thu, 30 Apr 2026 10:32:57 +0900
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 14/17] ASoC: simple-amplifier: gpio-audio-amp: Add
 support for gain-ranges
Message-ID: <afKxSWnQeQheAd3x@sirena.co.uk>
References: <20260429074356.118420-1-herve.codina@bootlin.com>
 <20260429074356.118420-15-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="shBljPdY0kdTjMii"
Content-Disposition: inline
In-Reply-To: <20260429074356.118420-15-herve.codina@bootlin.com>
X-Cookie: 667:
X-Rspamd-Queue-Id: 8B86249C066
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35818-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,csgroup.eu,bootlin.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.co.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]


--shBljPdY0kdTjMii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2026 at 09:43:50AM +0200, Herve Codina wrote:

> +static int *simple_amp_alloc_tlv_ranges(const struct simple_amp_ranges *ranges)
> +{
> +	unsigned int index;
> +	unsigned int *tlv;

> +	return tlv;
> +}

The function returns a pointer to int but everything else is pointer to
unsigned int.

> +static int simple_amp_check_new_range(const struct simple_amp_range *new_range,
> +				      const struct simple_amp_range *tab_ranges,
> +				      unsigned int nb_ranges)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nb_ranges; i++) {
> +		/* Check for range overlaps */
> +		if (new_range->min.gain_db >= tab_ranges[i].min.gain_db &&
> +		    new_range->min.gain_db <= tab_ranges[i].max.gain_db)
> +			return -EINVAL;
> +
> +		if (new_range->max.gain_db >= tab_ranges[i].min.gain_db &&
> +		    new_range->max.gain_db <= tab_ranges[i].max.gain_db)
> +			return -EINVAL;
> +	}
> +	return 0;
> +}

This checks if the new range is inside an existing range but won't
notice if the existing range is entirely inside the new one.

--shBljPdY0kdTjMii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnysUkACgkQJNaLcl1U
h9B2Twf/fxpVYs0BPZn9UxEkwvIDkkSmzznKA8O2sjvO1udwM7HugXl/6K72z0In
xH0Nf4OgHgC1CmBFXl/+wPx6wcSo5znCGIQCaQMOXaML+MppyDAhrqKgnrpRURZN
FWScZpxCAfMK05YVIY8/S7kOUJjdl6bs7uj6Qp4cIB4E8pP0H6T5wQcPi/eBDVo1
52xe7ev5UNfdtarWhBZCdk/T6LPZORXiR+/GeUN2fjbtFUk/NiyXXEPRH7CJkPHN
OlcYofp3dR+whzneWR9xl4Ccl2VVzxBfqRx2n8tmmN3qKgVqKXV8418vLiWrFAFh
As/6O5vA2NavQCqhFQKZlckdntEVTg==
=ClHY
-----END PGP SIGNATURE-----

--shBljPdY0kdTjMii--

