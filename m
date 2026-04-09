Return-Path: <linux-gpio+bounces-34972-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNDbD1wA2GktWAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34972-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 21:39:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D7D3CF115
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 21:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3E3E30087B7
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 19:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B14030F53C;
	Thu,  9 Apr 2026 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIEMmMum"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC083002DC;
	Thu,  9 Apr 2026 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775763537; cv=none; b=gvejguYZhyjt3IfoDJtc5mtm31qoI1kH1yjdkGIUFNriPS8MpBfA1gHcKTpR+tWboprNie6wgIRdCSCKEEoaRlm7nKlXqOofm//MgeGaACVDHJBH5xvnQeurU424R20wj5q0cU2pFEKagh7MfUnnJHcRxY0+AkzXgISCF13Y+eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775763537; c=relaxed/simple;
	bh=zzPwLipKtSXYmft9jKL7F+YuBKt98uxsZx70dOz14gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnKnc5jCVprbkHTnVrNet4IxVO8ccJWiL+e25ll0lIQ7y8yRz2Mty2ljZHvNiTC9rnZKIDF3CvxXYCpdNIr2sD8QufE3W9C5oaCoO2YBsezF4Mmf/W2QzC+gT0Qy4vzrNGICwkcmpb0LiZ22WSaE1OkX1UThYAQgpWF9MUgAD+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIEMmMum; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48E5C4CEF7;
	Thu,  9 Apr 2026 19:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775763536;
	bh=zzPwLipKtSXYmft9jKL7F+YuBKt98uxsZx70dOz14gM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bIEMmMum9HbiTU2PcL8KEZ72ZTmR88Plz9CfN3fv7xRjKgB1VMDaD0Cq841jn/k7i
	 +t9RoGm4vb78ggpGOLdVZvHrdbh0A+552k/RlSkE8ooA7PmG/R9nzQiGgByT56xD5M
	 yWWEqP001lZd13CcIEajI8mxVYKutnm0RYF5ueb89sBNCrtUvQ6ElqWtlGQAbC9J4q
	 SgFTHn/54oPZbxTfQ1JXxji+4fZx8Sp/bX5S4PHJ/Mn+eAAIft6JSTe1YBTLvXIW0R
	 quQjxvUeqgwzUlvTi3CFAxSrN21cq7jhYvWLSWGXIgt0gQVhaQDSlyC0gf2l4zSJjg
	 LGCnjvtfAufPw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 77FAE1AC589F; Thu, 09 Apr 2026 20:32:06 +0100 (BST)
Date: Thu, 9 Apr 2026 20:32:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: uda1380: Modernize the driver
Message-ID: <adf-tmIfkLgosjRJ@sirena.co.uk>
References: <20260409-asoc-uda1380-v2-1-42d02079ecd5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IBQlhWmMOANbG5oH"
Content-Disposition: inline
In-Reply-To: <20260409-asoc-uda1380-v2-1-42d02079ecd5@kernel.org>
X-Cookie: Are we not men?
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34972-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,perex.cz,suse.com,gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3D7D3CF115
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--IBQlhWmMOANbG5oH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2026 at 09:17:14PM +0200, Linus Walleij wrote:

> This makes the driver usable on contemporary Linux, maybe it will
> even work, I can't test it.

Don't think so...

> @@ -742,6 +745,7 @@ static const struct snd_soc_component_driver soc_component_dev_uda1380 = {
>  static int uda1380_i2c_probe(struct i2c_client *i2c)
>  {
>  	struct uda1380_platform_data *pdata = i2c->dev.platform_data;
> +	struct device *dev = &i2c->dev;
>  	struct uda1380_priv *uda1380;
>  	int ret;

We still have the platform data above, and just below this we have:

        if (!pdata)
                return -EINVAL;

so I'm not sure how the driver is going to instantiate, there's
mandatory platform data still.  Not that the driver would've
instantiated before either with anyhing in mainline...

--IBQlhWmMOANbG5oH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnX/rUACgkQJNaLcl1U
h9DfYgf+KVeOLZYMhO/HcnDw03Wz3PAlixx7D8sTvsS9JC/ihgE7CpKdNzX1AtQs
/L4wFfXjXmzG5nOF8L/lL2FaldbZh2Dqwik+mJPh+ZDwW01lTubfD5jozFZX2kY+
30O8CuVfjgfP34I6P7jKj7MtjhS+BUUgX5T2+b7t+6WqxYEwred2hKmsYStA+Rl/
9cLNmSbgH+xkeCv95vZISrUNImdAH2ilVbsndcLWPws3xb3Zbg+97BmfGGwUI80B
T4rKopCjkALMGIWvA4YCqk4ygUrrvsfWhUOE4TJyMZgw8FmAsVE5pN5h1cGVqS2N
ygQL7LHngts+17QKOmazH2h2nFIbXQ==
=TVEk
-----END PGP SIGNATURE-----

--IBQlhWmMOANbG5oH--

