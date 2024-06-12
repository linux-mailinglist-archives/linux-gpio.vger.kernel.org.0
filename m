Return-Path: <linux-gpio+bounces-7402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB61905818
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 18:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1EB11C2152E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 16:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43951836CC;
	Wed, 12 Jun 2024 16:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CQwRuXXG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C65F183093
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 16:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208209; cv=none; b=pzsWYbPpxQOqWzLg2/ZWTdL5usr+yBN1RKOsvlbafPF6sEAF/ltyLjdoJG+SsxaeomEZ4awbpMBMy/506Sq35/i7BF9XusUVYMUBAZg7dz512PTeCoFvLDx6qoUNRMlVrQHhghn1tTobUmobtiO8pY2UrsZmF2rLLjOFM0P48Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208209; c=relaxed/simple;
	bh=332UBS0prHxkyUP4CYQFP5s8Gc011jBYVWz+9XPLa9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCe5Po3SvntLI5qF05t5PCdNPXmWvTHXs9Rz4AklE9jeKXgWWPcXkxhckMEsD+oo5Il1/LqJnbMCj8SUz5jYUS1ZzPBAxVkFmrH8wIEmSxc27cCki/SPrzJ0SdhMxIaoWssMCByc1Ig81iKFyqW6XESF/jF0NK2aXzq1ZW/drKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CQwRuXXG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=B54B
	e83JNs7nl+rMReElF3H5ROq4XTJOopa9NkI4U9s=; b=CQwRuXXGQsXzbkMKeRef
	BiEfLsMYDRrCKtKab3BTsl82biB8MvTwjBnrYoiycs8RjW7gmPyvazaDPOcnl6U0
	aFlBgPwJ1xdNtW0DCrCYwB9VuQz5miQRl2aRdNYdIPQCW6k+HTsi2GEnQGyTw5B5
	6TfsnUgfV1AadDA872fkj+330NTsC/wGUOJsLEG1WhiUxkFlISXTM9glWndbUI/w
	ZHfVmgx4NjSOY0mch35Z1s0NCXSTlfHqCWJIK9n/o2e6dg2bvDx4FGOJUdo1bARW
	0pTR6G//LlAPF0ruOVOY6NCE1sJce3YmBDdpT/jCall9c8/I/iTvfrtJ9W3DlhPE
	mQ==
Received: (qmail 864170 invoked from network); 12 Jun 2024 18:03:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2024 18:03:22 +0200
X-UD-Smtp-Session: l3s3148p1@fkR/hbMa7DNtKPIY
Date: Wed, 12 Jun 2024 18:03:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
 <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pvtrej2bwhzfyplx"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>


--pvtrej2bwhzfyplx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

> I really dislike drivers being called in an ambiguous way like
> "simple" or - in this case "sloppy". I understand why it is - in fact
> - sloppy but can we call it anything else? Like
> "gpio-logic-analyzer.c"?

Sure, we can if you prefer. I named it like this to make the limitations
super-clear. And even with that in place, I still got a private email
where someone wanted to build a 400MHz-RPi-based logic analyzer device
with it. Which would not only have the latency problems, but also
likely have a max sampling speed of whopping 400kHz.

> > +Note that you must provide a name for every GPIO specified. Currently a
> > +maximum of 8 probes are supported. 32 are likely possible but are not
> > +implemented yet.
> > +
>=20
> What happens on non-DT systems? Can you still create an analyzer in a
> different way? Can I maybe interest you in configfs for the purpose of
> device configuration like what gpio-sim and the upcoming gpio-virtuser
> does?

Frankly, I'd like to leave this to the person needing it. I've been
working on this for way too long already and am not up to major changes
anymore. Minor stuff, okay, I'll go one or two more rounds.

The GPIO analyzer is a debug tool aimed for development boards in remote
labs, and all boards I have access to use DT. Furthermore, debugfs is nice
because it is clear there is no stable ABI. It has been useful as-is in
the past. That's what I am offering. If that's not enough, no hard
feelings, but someone else needs to continue then.

All the best,

   Wolfram


--pvtrej2bwhzfyplx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZpxsEACgkQFA3kzBSg
Kbb5LhAAq7J+u9AU3h27i893hHfBUdMFaOWvXvYAUCE7Ihm1awM4jeRX7zVMZ2v/
NbXFUj7xY4aM40fIEhcHfv4+eESY5ba72+3w8n8xkUgepmYCbzirZ2CetqgA4R6S
y7bnz8Zb32bQAEPtLOeDc138+UOlI11LwYLk9aF5hdkRLGja0GVy8vXUb6N8Ioy9
ChOdx3OSqnhdkUOWHemErPpFC5QbtOVkXusvpdhSh3ixT+CMIXBAINHBeFgax8Z3
suaRT0jxA/F8utd3uGQZmW3BJTjpdJpPuzoRRD91TvfI4ZOTRmMSIJz+9nJlTfYw
0MIiNgRdIyD4xSjTIzOj5R2aZi6RgeJeqeyc9ILYoVaLG4/SGcZ0/LfE5IrJ/9rO
VqrPcndc5MgzNexkacS9jG+x0StUTD6FXpePN9xAJ8Mz9lvZU51kGo3KNNWFYmlV
TVqdLu73GdsCdn2IddJJ6L0lqb2pn+obcX1Hpjb/pcIn76swDehemGGEScmV4J65
pKRdc/5DrRf/jtlWVnU5Er+pKEL72nU7VyfQjfom62fQ5wRZVgyD6j0mp6jd63fZ
h7JzLl2rbr0+JaGDn6eZLhjpvv5JFnb9uWnoL5CJSexICOYLJ8pbk89y6aZ5gxl2
wm4SK454E0Hs5Lz2qWkn63OOWHCMg+7Mqu4MslSH9dHBT1i5e64=
=PsWW
-----END PGP SIGNATURE-----

--pvtrej2bwhzfyplx--

