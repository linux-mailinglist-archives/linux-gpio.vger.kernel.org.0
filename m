Return-Path: <linux-gpio+bounces-38494-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cl1aEwP1L2rlJwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38494-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:50:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 90619686658
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:50:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=D5PXKn7L;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38494-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38494-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D62AD3019450
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 12:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834973E832B;
	Mon, 15 Jun 2026 12:49:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC15E3E274D
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:49:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527788; cv=none; b=SFSXLvgjoeNJkoTQg9qClhsE9RPCevbLCkpQZWlTt89Fd5o6UJAy9G6OkiivXEE3TplmxZam4DEaEt6FrLVzc3zJ2PDKDLeZ1Ggs+PRhPdVyux6dO2LHT4CK4qf4uh4XF3bs9Ew8LODfWbTFsejA25NN1oECC+Yb2mfNBIFma4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527788; c=relaxed/simple;
	bh=io1/2r11HO51BPZXO/tRzlJTOUlpv8g3afd0+OUSQqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7HW9YHfnPE/OPW1/ayUoFueGsQVSVwcy8RlMjzGrmkR5kainNr0eSJSPlkEm31VqZlijJwH1wcZ52on+WUHqLvR/OSfrhLEky45k/Jj/prc0yK8w5Q26wvxCkU1griWK/GMvHlmYJG+j2cH5kS+XPyG9G4tUTYh1SZQASHkmlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=D5PXKn7L; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1839737f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781527784; x=1782132584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B1QHIUpga64KoOO69MKvFZ85iZtZeRcvr0EhP2ZBJr0=;
        b=D5PXKn7Lzhjwz/aKAfePCqBkw08DtV5f0/IIeDbvGkJ4bCI/9QEmPJ1/RXEK5Y91Ut
         9y9RWp2oTXzzgN9XEIg2+OcMifPKBBVlDyi5kUmF7SVulKGkTwtrXcEJNodWvTHzqPNv
         kyWug8reiE1RAblStPthfMwiPwLN3pi+SG+R9wFWfqjL9eCETEI1VKwi1R6XKEo/0v0+
         sJErgeRCFdELS8Cv/oXQC9KQb5wSL4OXEosLMGnBrEND5GxSyk4dGrkXwhKXm8PlHLUg
         IUY6QHSxCt83R5EhEkhISM2ZZ/w5XOPjTmmcZSQPXMlbcbBL8TyNsUZLcauFCmWZ944p
         rolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527784; x=1782132584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1QHIUpga64KoOO69MKvFZ85iZtZeRcvr0EhP2ZBJr0=;
        b=ghcofm6vt5ob0sgo0QLL2oHqZSbalm0Ye5hx8ioNCBNnLfSfjNTNUDhyDVQbFd6zR7
         HTNdnbm1w5cGqwnnCt1IrgAqr+whRGZjGrf0BnClWm+p9LTYIrJvtRA0CJulsSyF0DNR
         m5i1uVSlCIUQMUW5L8W2/1tYevOQtsftkaoF42Z+SMCY4xHl6Y+2Lq76xlElHp0UAoRm
         NFl0LzPXtHWFAnovSG3brWVRJwBWNB0Lyx1Z6hnupk6FxFb9aqz0bRdoEFXlgW8wDeFy
         7TJ8+aa3UCuOi4Htf32HPRDoM9aggp++F4ylR9YmVH/W8+c//3gAKfPq3/6J2z2wJ5Ko
         S1zw==
X-Forwarded-Encrypted: i=1; AFNElJ/WG7VYNxDCuKC+GShhxaRvukqmSeAXP1XahjxAuEAn38maR1yvv3obp9m9Kt4vA4NSJDMrApR7dBSn@vger.kernel.org
X-Gm-Message-State: AOJu0YxjpI2gMNrbIyOvQ2f/hFYdfwPpCxemHgrsf9g7/EKrcFtUaHMZ
	a1KasU2aW3kaKOkY8VPi8b11enZh6Oub4SOphnFpLBwqQS+u4M4Iq6yknm0W8UDihZk=
X-Gm-Gg: Acq92OF4jpDXaP6zgtOiNZR/ibAij96gvVUQh8pmk4yZ5R2gyCP/yR2NjMjh3NgnqZF
	Oxpt61v4zHbHwAyaMwMn/WFkjRfl8KhZa74BdGy0pw/Wpru80Cuzq5AR26FojslQaumuB5wtJIS
	g8j0lH+l5PlqNCA/4gS1Q9sURHDe0uolWEfCdM9s2RYg4waG4HJFly7xnPSaKmEsFEEx9DDKbWc
	4bSdd4fw/WNN+bHVaKGUyHXMVbc9s/poDuBisDr5lth33aAl5OylUyz2B3ZthIqdsHTB05tChlS
	YDRL/7PnmWg+eT8v1UoU3odNJOo7n2jQAVsHTzGTbTbrt6q9a4zwPWWm6mBJYS4sLklt+ORGh/r
	LiXJLji8ncNojzjqLF4hK611doyc4TgOIUB2S5XeeYqeEHexi3xE/y97otP5smjKL4SP8V93zo5
	vNCEzOL1UDSklvj1c6/Gyb47bpbObE
X-Received: by 2002:a05:6000:1842:b0:45e:e5d1:8a72 with SMTP id ffacd0b85a97d-46076a24946mr14442075f8f.28.1781527784380;
        Mon, 15 Jun 2026 05:49:44 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4606f26f309sm33140486f8f.14.2026.06.15.05.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:49:43 -0700 (PDT)
Date: Mon, 15 Jun 2026 14:49:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Jia Wang <wangjia@ultrarisc.com>, linux-gpio@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] pinctrl: Export pinctrl_get_group_selector()
Message-ID: <ai_0i2cicHHzwIXj@monoceros>
References: <20260613-export-get-group-selector-v1-1-fc4451a9ff0e@kernel.org>
 <ai_QMNydoXXoOFmB@monoceros>
 <CAD++jLm+rv+Tm-WxvD51ynKeDUrPMAG=nfTNxRbf8FvSNy+dGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="spvkojtcfrr7x2eo"
Content-Disposition: inline
In-Reply-To: <CAD++jLm+rv+Tm-WxvD51ynKeDUrPMAG=nfTNxRbf8FvSNy+dGQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-38494-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 90619686658


--spvkojtcfrr7x2eo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: Export pinctrl_get_group_selector()
MIME-Version: 1.0

On Mon, Jun 15, 2026 at 02:27:59PM +0200, Linus Walleij wrote:
> On Mon, Jun 15, 2026 at 12:16=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> > Checkpatch criticises:
> >
> >         WARNING: Reported-by: should be immediately followed by Closes:=
 or Link: with a URL to the report
> >         #9:
> >         Reported-by: Nathan Chancellor <nathan@kernel.org>
> >         Reported-by: kernel test robot <lkp@intel.com>
>=20
> Now that is just checkpatch being silly, because what in in next looks
> like this:
>=20
>     Reported-by: Nathan Chancellor <nathan@kernel.org>
>     Reported-by: kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202606130210.ytVPxHlm-l=
kp@intel.com/
>     Fixes: cb7037924836 ("pinctrl: ultrarisc: Add UltraRISC DP1000
> pinctrl driver")
>     Signed-off-by: Linus Walleij <linusw@kernel.org>

Yeah, so the kernel test robot report has a Closes, but Nathan's
doesn't.

Best regards
Uwe

--spvkojtcfrr7x2eo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmov9OMACgkQj4D7WH0S
/k4lUAf+KFDcQ+g3aWzBANz5YIePToL2qga0SjR7Qb/9K0oxID9Btbw9CPIW8K86
jax9iI12yqLpnCug+o9p5HFxCdc515qbzoJBcJsSuPxPNVGtA4HmZBYuHs5YOB87
Ys70WfwQwMXV9PKTsXfdaU5Z5uWxSl5mi89UTiKfLIrNro7WPmEACfOZcwICyvJ1
Ghk0igvHAQpdsotYQUxqVjfhZOTmK44sIBYJh6k4qIY2qZ9/JuMYmQnwBiF516xf
3YNwJECyeAfkHjwGxVn8myXii3MxC/M9x9cnwBoHCyDIQYHF/XXAK1DOPht4SDbe
jqTdjUPmlJbJ/nmw5eXXYY8wRLcpVg==
=oM18
-----END PGP SIGNATURE-----

--spvkojtcfrr7x2eo--

