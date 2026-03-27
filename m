Return-Path: <linux-gpio+bounces-34294-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGEeDg3Jxmn5OgUAu9opvQ
	(envelope-from <linux-gpio+bounces-34294-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 19:14:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A96C348E6A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 19:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3D3B30567AD
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 18:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19272E7179;
	Fri, 27 Mar 2026 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJJjaQZG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6412B1F1518;
	Fri, 27 Mar 2026 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774634506; cv=none; b=qHV3UfLMqoAjsZ1bY73DZtfiB9Pv7mkicuT4FGTazR2IpHW6mjUqunYmrdATd6Gj6bLJ4aaSaiKAJ6fDpVU2hTiW4P1lAzm8WVsAMtOQIyX5g6r3kaBQAUYTkj7LYlhlGfGpv6JyRxYST/ybzcCwxM2DVRJo1DsYykDhiMmVD4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774634506; c=relaxed/simple;
	bh=uNRa8D0J+EJOvxqa0yJuMIxQEE2oDod7RVPwmY1lXBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnfwwzdBCvNFSFz8FXpIyZJxGejSqy2Ru2XpXDxoLEyBVqrAzyoFvWrvMJiFBYVNt9BrEsSeT6vNJpbXnLzumjuWLkglm13CA5Ilnzmjjbp+i8yfm5qMNSCZo7YAsVjyM0cCCAfK/8sPhEO2bfAhlVvnPkMBosg+j7bzb1Tb+6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJJjaQZG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D771CC19423;
	Fri, 27 Mar 2026 18:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774634506;
	bh=uNRa8D0J+EJOvxqa0yJuMIxQEE2oDod7RVPwmY1lXBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJJjaQZGWMhT1b1EXk9nhtw0fopECU8hxMgKNJeoGfvIHzuOVlBpWV5b/kEORrLwO
	 hxu5SgH1U5dY8p4Z8zCPXAmoej+hKguENRrSy+aycbgFAn/vdUq2/kCOoOaz4B0yCk
	 b7cdn8FRwx6jb8YZffnHwZSFNltI3Eoz3/Ta46BLJIESseColcu1jwjdLAh2dQ/XIT
	 +/RajgUFH6CQF/gc3GMkVkDatKA3zGszmRQGpEzg5AzSuI5tVXMSdf2uwyQCvX736W
	 CEVzr7PMFr5+9T0RkCbRJIJqUWbRnqbWlRKRG8FOCMR/NtnPkEfwLHsbvAN/I5KlYz
	 1eIn8aWCCeEIw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D32A91AC5847; Fri, 27 Mar 2026 18:01:42 +0000 (GMT)
Date: Fri, 27 Mar 2026 18:01:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ASoC: wsa881x: Move custom workaround to gpiolib-of
Message-ID: <acbGBtY0zsPntsoE@sirena.co.uk>
References: <20260327-asoc-wsa881x-v1-1-53dc05867e6b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rmzEYgXACgjFERUr"
Content-Disposition: inline
In-Reply-To: <20260327-asoc-wsa881x-v1-1-53dc05867e6b@kernel.org>
X-Cookie: Identify your visitor.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34294-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sirena.co.uk:mid]
X-Rspamd-Queue-Id: 0A96C348E6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--rmzEYgXACgjFERUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 27, 2026 at 12:10:46AM +0100, Linus Walleij wrote:
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -240,6 +240,14 @@ static void of_gpio_try_fixup_polarity(const struct device_node *np,
>  		 * treats it as "active low".
>  		 */
>  		{ "ti,tsc2005",		"reset-gpios",	false },
> +#endif
> +#if IS_ENABLED(CONFIG_SND_SOC_WSA881X)
> +		/*
> +		 * WSA881 powerdown is always active low, but some device trees
> +		 * missed this when first contributed. It also has a very strange
> +		 * compatible.
> +		 */
> +		{ "sdw10217201000",	"powerdown",	false },
>  #endif

The quirk in the hunk immediately above (and from a quick glance all the
others) has the -gpios suffix but this one doesn't - should it?

--rmzEYgXACgjFERUr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnGxgUACgkQJNaLcl1U
h9D/GQf9Huw5s2BIFgJSnpQLtcjmsqe8Gfzyggvd7kJMRhVrT91B/4lmO94mJFqp
6iPxlJv+AdiJ5YZvIP+iXyimy6IXLfLVOrZiaf+E2GPzOr871PHyH6CR6qd9lZNt
ep2l4eYx52Ym/kIU2cBXZUujwK2qSNI12C8OXVtHurhvdfprwVi59Y1GBUz19Ctr
FG8jvkTo5DQYnxZFtPamKFRg+IP57IIpN0I0KxaFMVgg5PITGW0TJZSvNu6jQ+5K
IIcuuz6tTdBgvdGd9DeERutHVPY5FYEwy40/rgKND/bDR7iw0o6oMyo8Bkn21BPi
b086nlQ0nm8Mlnl2ewIe0zIC1vY7xg==
=6Cpt
-----END PGP SIGNATURE-----

--rmzEYgXACgjFERUr--

