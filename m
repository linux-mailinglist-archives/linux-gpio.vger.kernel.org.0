Return-Path: <linux-gpio+bounces-38479-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NNinKSfRL2psHQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38479-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 12:17:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 221A86854E2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 12:17:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=BmMNkF58;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38479-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38479-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1DDA3020127
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5594D3DCDA9;
	Mon, 15 Jun 2026 10:16:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAEC30C17B
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 10:16:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781518614; cv=none; b=FQtOgILt1odZuyZpNIO1BgsqJrKBobf3lEcUPdSseLozEb3+IhOiDyOq434s9KMMrTFce7FGDaXwW61cFqTsqfCGSv0zk8dx0laNQzZ2E/nmpIszRucIbrwv3AsuakAVBytJEGIRB1bXYvulziiZRYIzFK6VQhizHTy/aOO2q7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781518614; c=relaxed/simple;
	bh=CSW1bbWB+JKxzyHffHD3IiKi7yTqgbrl6T1hMOalYj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBQaoL04ZnwIFi6bz6xFsnMhQS53AD0Z56L2mc/C5yHRspLY3WwggxjYDuLlTfa41mFuKp3Vsb7UrmsNGvGWo759eAdVGL3+ElTOywgie4t0yCsrllI21BWfE02imPvhK4MmTnKWiNHU/Cto1DahfKIgCWHWEpmZtYe/OKm7bi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BmMNkF58; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-46013161068so1511129f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 03:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781518610; x=1782123410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2NoElw44+AuN1pkx76+sFuEqXYVRq6YrALiKO3OFEPs=;
        b=BmMNkF58niXORg4xzeXHgPwsFoTGl46773waCE+tV1YWveXd2YS37wmHhl+HptH56T
         ykYE6TTGpzrb0paaOy79HMN6jbjau5thUm7oaexXdxd5WJ5rrzxAY0eSmWEHdA9en8Ew
         vRz1Qkwsf9Yq4b8guiCcwzAVOkQ1IBEz9qtWWlF+bsZpUAE4X6bGuLAMOdflIpZ2yBj0
         pcsb12qd7BkgR0yB7RBJ+pSMBJ/At9fX6ZYTJDJ/pyOpWL0gUcnj7T/BZNhcHsnLSbas
         rx/pCJXz6B/7s2ZbHg8Bsr7Ns2gFhjhYiYDhKWI/mIkFTq6XgzhcR4s/s7lGBNPbf3a8
         64mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781518610; x=1782123410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NoElw44+AuN1pkx76+sFuEqXYVRq6YrALiKO3OFEPs=;
        b=bx45ovQgNRD34tUBIEhH0L9PJjDRnIFb5dY4MRAlJWxB76KCPwxMB18gL1HvBJemyv
         72uxdDU8OZvHdLzXNn84FXiPOjyKOg8QwimmwgnwtpDnnjGFKSIfQpRZz8YJCMUDwAle
         aSQDlnHyDped0mOSuwQyH17SSmF5NUJedAMWBYR4rtwLmVGDVevMdddNu66lNdto/gOG
         upx9FNzCI/kmQdjrWWz3K6HJuGnaaf/nK32ycBUkFGZkRY2G9xe6gV1h4sRZtFLTiz1P
         tFFYxJanrW8g3XTCAVzMtpIdP+0JJivN1I7sLJIV1G5/2msFVXmI4Mv4aUjV/lcsAKdQ
         BCBg==
X-Forwarded-Encrypted: i=1; AFNElJ8eiia9akVPN8BWzY9fnRuMKa4e4DG5Wzc8rnEJ5vF1LJI86noGP9/2mUPmavOi3rJ/8JPMeAtxAOiF@vger.kernel.org
X-Gm-Message-State: AOJu0YyDvA5cqUQpyLh/rCyastugqTjuas8cREN0I51xd7eseNoD89Y5
	GwhA5tor9W8rh9qiwsAGopotKiHE9OJPLl2tffiSS5XeuluMz//k+cLECYKCdoyOJfA=
X-Gm-Gg: Acq92OGRJFEbYHctzpBsuQgE6GgNTfRwWeDt6uZoQAXAkZkZT3aN055WYQX3oySKmUD
	oDMyaAMTJYsG50SCGpZJu2We/4MPj4b+yVTs4x5s3Bu8O6sCaLIzCRZBeEq0kFGgczKcf14F8LW
	tiINfqWEopcFt/NTaIhjUyQ8Ut9PR4yZBXgRH5T8V3gOTYnlSpWNghbyMrpU9G4CDY/NmZQAZ8a
	JZPTf2Mjv6F1RMVVGkseeeLwchc1XLIyPoRkmo71KdJ0pG1TFgIB1c9zwU6nNz7tBQQoibo3/56
	vqAVAqJxEsjQTGDS6+dRBYPISybhCZHUfmIL4BWhO9m9Gs+EZsplWhXIU2n31UnRZICXn4VydC+
	5q01HZL2WK+bhAq9kzoK8tM3A1ZVivuczB7tKDshcH0ti6EgqadAuNLWvw6gFJKMJaI+mOWbl/e
	LI6V7ZO7fW8Hl4vW+o2RMpXYnhymjZrQrwcDxXQsbTCre1L3tiqBRInyHZ5xPKn7BFr8nXEzanz
	u6ehqrQ/IG3wiE=
X-Received: by 2002:a5d:59ac:0:b0:460:3234:4474 with SMTP id ffacd0b85a97d-4606dbe4f1fmr19012334f8f.42.1781518610248;
        Mon, 15 Jun 2026 03:16:50 -0700 (PDT)
Received: from localhost (p200300f65f47db04b1d4be4b87a025dc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b1d4:be4b:87a0:25dc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4606f2b0c35sm34103322f8f.22.2026.06.15.03.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:16:49 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:16:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Jia Wang <wangjia@ultrarisc.com>, linux-gpio@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] pinctrl: Export pinctrl_get_group_selector()
Message-ID: <ai_QMNydoXXoOFmB@monoceros>
References: <20260613-export-get-group-selector-v1-1-fc4451a9ff0e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rglut4oamlhefwgt"
Content-Disposition: inline
In-Reply-To: <20260613-export-get-group-selector-v1-1-fc4451a9ff0e@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.70 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:wangjia@ultrarisc.com,m:linux-gpio@vger.kernel.org,m:nathan@kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38479-lists,linux-gpio=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 221A86854E2


--rglut4oamlhefwgt
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: Export pinctrl_get_group_selector()
MIME-Version: 1.0

Hello,

On Sat, Jun 13, 2026 at 10:02:30PM +0200, Linus Walleij wrote:
> The recently added UltraRISC DP1000 is using this symbol, and in
> a reasonable way as well, so export it.
>=20
> Reported-by: Nathan Chancellor <nathan@kernel.org>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606130210.ytVPxHlm-lkp@i=
ntel.com/
> Fixes: cb7037924836 ("pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl dr=
iver")
> Signed-off-by: Linus Walleij <linusw@kernel.org>

I stumbled over this one, too, and see that

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fo=
r-next

already has that patch. Checkpatch criticises:

	WARNING: Reported-by: should be immediately followed by Closes: or Link: w=
ith a URL to the report
	#9:
	Reported-by: Nathan Chancellor <nathan@kernel.org>
	Reported-by: kernel test robot <lkp@intel.com>

=2E Not sure if you consider this relevant to fix (i.e. add:

	Link: https://lore.kernel.org/linux-gpio/20260613164847.GA3152104@ax162/

), but if you do, feel free to also add:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--rglut4oamlhefwgt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmov0QsACgkQj4D7WH0S
/k6xzgf+J7tA+/iaChJRRjpcjKIzBj7ZN8YXVsJUAQJT9ZWalmCYGRDpNKryQAQq
mqOIrp9wnMIPmSqK+ghUaGnk4L50I2eTRIvl/zOQTia1D4ZQDMs8m8nczP23/R1M
2i11pqNYq4DtwQRq/h/dnvCybnEeGIij3w7M322ckuDfO/SorPJeBbmRMYCvSv1S
6ZfMYssTG84acGBY+dzjt9+2QJ9j15nhadQ9vsD/B+p8QPjytLYKa5A92udbyqF9
NdU8JCy01CYMXcKBRNoSCCyibKASs3Y01L3ErVhVubv8XzL7I1Y96CI9c8Vbq/oX
iV1oJgztVGFxvL8WqnYykzgVbJrH7Q==
=+drd
-----END PGP SIGNATURE-----

--rglut4oamlhefwgt--

