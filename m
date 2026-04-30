Return-Path: <linux-gpio+bounces-35817-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +I2RLjSt8mn/tQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35817-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 03:15:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6299149BF69
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 03:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 092B7302B74E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 01:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00932258CD0;
	Thu, 30 Apr 2026 01:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrkX8KhD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BA572631;
	Thu, 30 Apr 2026 01:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777511726; cv=none; b=hhVArP/1TFHvAwIns2wwh70gwp1gJyU/CEz0uq16VOkzQYahu/dm6FL4smgItIJXDyuIwigNeZrhtONrclp1Ww8QMFhif4coILijozxXuT1Qhil4tGpN1RMKU73dlBzVuddlBNjclAhQTVTRDnYdHFInDpynf7Ui1vdrKcb1nAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777511726; c=relaxed/simple;
	bh=vvDX/pA4obptcoB8r+zBlgS7GWuCXYfNLD3tyicSDSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJ76kKJ2I7KD+uRl2uOioSEVpywoeWtXwD9xUWSb5vj10sGygOZeifSpGYDJ/ARVM6hOHkhsrqa009TayhSPqlEc/FjnGoTMYMEZgwgJoBzSkbn7GqcEfpFNbOPjJyAa3egbf4xMItnGg9fjRWEuha5f2yDaLP6aF608jev/AG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrkX8KhD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36ECCC19425;
	Thu, 30 Apr 2026 01:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777511726;
	bh=vvDX/pA4obptcoB8r+zBlgS7GWuCXYfNLD3tyicSDSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrkX8KhD6zsAjd9QvQmk3O1y+6q9Guz8hJLyHRDNOV6HrOEbn7AKNvLnHFmyA67PV
	 hODjS9SgGMljY8wadLm2M3Fj1WUzzSxqpGcNPXL6IAn0iMFAHaYk/I2IslWkwym8nc
	 jHyggflWm8G9wxf1RkUUTiScGKu51kDNwpfhu1MksRu8gO4XMxm1VhsfwufeDBJGgI
	 bfSUTHfMmLjQCcgvpaW7PCqBzHlu1yKko488Jl9G+6UVzcRNd9Sn1q9IQpikIK/2MP
	 IZDL48bi1w+40BUHx/VWSrt+ZuLZYlm4VuUCEuZ5I4EniSUBhFxZ1K1/r0Y/TdGaR7
	 PEMQS56XB7t2g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9AA111AC585D; Thu, 30 Apr 2026 02:15:23 +0100 (BST)
Date: Thu, 30 Apr 2026 10:15:23 +0900
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
Subject: Re: [PATCH v2 08/17] ASoC: simple-amplifier: Remove DAPM widgets and
 routes from the ASoC component driver
Message-ID: <afKtK2r7oD9_ZSHe@sirena.co.uk>
References: <20260429074356.118420-1-herve.codina@bootlin.com>
 <20260429074356.118420-9-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YzX+qqkkFX9ZNKo4"
Content-Disposition: inline
In-Reply-To: <20260429074356.118420-9-herve.codina@bootlin.com>
X-Cookie: 667:
X-Rspamd-Queue-Id: 6299149BF69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35817-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,csgroup.eu,bootlin.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.co.uk:mid]


--YzX+qqkkFX9ZNKo4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2026 at 09:43:44AM +0200, Herve Codina wrote:

> +	ret = snd_soc_dapm_add_routes(dapm, simple_amp->data->dapm_routes,
> +				      simple_amp->data->num_dapm_routes);
> +	if (ret) {
> +		dev_err(dev, "Failed to basic dapm routes (%d)\n", ret);
> +		return ret;
> +	}

failed to add.

--YzX+qqkkFX9ZNKo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnyrSoACgkQJNaLcl1U
h9CxWwf7B7BwikowS64ll/nFyPsTdf1LTK2ejHsnmJSFmyb02Y+FFjNqnVYKPxRm
Wdsn5w5lbhN31hP6QvJNIRKjIKd3YPQI+ZFC1s55RaiJ1mDPHD3od9MQLhGSkEFn
GdaOJezgwQNS95ynCEqX8wDMBQCfLXNEGR7dVTXeSiIPD9oUeOETwnX+5C/kW3nd
K3GRX1sMq3OaV/HL8FlW0DVOAGXEY9RkyrlmQE/nvkolYkgsyDkZhoheRdXkLNZ3
ZuwyyM0os8aSiMcO9AA4sW/rLhi6Ixd5q3CnQiHMkqQKBfvfXAyGFcynG210YvWx
KB/q5Whb9r2x2DBNj0pAXIhvb4FRag==
=bN5d
-----END PGP SIGNATURE-----

--YzX+qqkkFX9ZNKo4--

