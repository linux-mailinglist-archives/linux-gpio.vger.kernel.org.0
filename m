Return-Path: <linux-gpio+bounces-9876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 489D196ED08
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 10:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 652721C22B12
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 08:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED62E15575D;
	Fri,  6 Sep 2024 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DlxzZf3l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDD714BF8F
	for <linux-gpio@vger.kernel.org>; Fri,  6 Sep 2024 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609704; cv=none; b=tfVw8pHCiD+Mrr+T/JFfJt7pqIR3QxfpjxUb5OfepmQlr4JC4SWarLj1ncASLXhv9ZrxyHnBZr/OKHl1tlFN8et+B07LOuosWGXQLSIFz0OOgYmETdtsL4bgVuzGIviyrgfsx1yGQ/yxFo8iMDQISzavR3CpujsdvRrtw7BeHbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609704; c=relaxed/simple;
	bh=8gfjGT48Cv3oP3lHzZmSB96jJj+PzOxNCFzvs0HpDY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhpZmnxQp1nEw+0RuKj8M4uA/YzekgU9uzKYbnRpYsDxjcMTU7KBQeF+1n4NpjhqJIwUd8UeIWBMY22TZCQGvxLlGYc0J9vNQvQVnzdC7jJDoO8ZtEGF187onpELn9OM9RPHZFEFIFP75hzNjL6x2ZJpgCxKIX/UVqlFfC5p9GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DlxzZf3l; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so135024766b.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Sep 2024 01:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725609701; x=1726214501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jQvbYq6pNLNyrzB6hmoKjly+61yzZeAqFNQbX336muU=;
        b=DlxzZf3ls8sfuFYpRhdVY5IsBTG1zwUVjRVorpaFTSxDEOK9jg3ax4CbQGP6WXZw6z
         4FAL06IqgLI6jKtxm361UW7GO5YRhUUzW3W4huLuVtGWYx2yh9++VB1ef81p2RJoR3OF
         G6pJPTH1VNsERIKSgoKGTW/vuH1ZYnd93kBtK9lISSzRuvETrkMHKRFOVSuHuOkcyAH5
         oE86nB7+LNvAAukhbnsdSVeMtzjNjDzX9sh2+OB6OwtpDPhfJ9O7SYXOzkmRt0rm1UuV
         4qFmfqRMe0lg9hZSVptCmvvDpF9kDxGJaykv5NZROb75yfowIIMyLLJEIkzZo06rnZpc
         /Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725609701; x=1726214501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQvbYq6pNLNyrzB6hmoKjly+61yzZeAqFNQbX336muU=;
        b=G+zL9ukKn0fk8hQcaG6ikKeZ/Y9hzJeMSIhIvyr13klAOVvFDRksZk4zZmWsu4iAuq
         meiVYP9pupgkYIQB1X0gm7A2obCkWvmVpoeSz+oHu/QH9wf1dt0gRC2ZgZ96UFiA7ShS
         RJtJ0IdOAFggAoGZXvOWv+rIt6vzxY1n8BXOqkeB2OsWnG9Uk04mXnaJI+4lVpEk62Q7
         3AYXKUL5O+rTu6sMTD7vwcT5RXieBu5SzzowEq5v4HInCecU7xbVOyGfgbAli5+WdY9r
         CrPxXNFiE76uL5Ypi/HNFs3vMqAF4BuOTyZoDWekn9JljeQqV+jEOIsdNEmx1X+TdM8p
         b74A==
X-Forwarded-Encrypted: i=1; AJvYcCVRNeeQbCqbgZPG9g5xL7oP10TXmhPGrvOx/PUsycHaKP9tLebfPggnpJDh3ouX1iuBQou1frpB/Oxo@vger.kernel.org
X-Gm-Message-State: AOJu0YxokX6rZWBmOIkL+UZQZN+jb3ZZwt+b16Cmnpc8KqzRmGkS+Oql
	VUUW0irEz0muitC7jxS16K3TuK1nA9U+o+owbK8/Sgh6sf8MfvCtyaXxD9wYtGE=
X-Google-Smtp-Source: AGHT+IG8E3LOoiGm9tm0UMDa+bzSBffhey9xpittTq7KTbZV46TsbWgu10IWTfbVHXWDDgolB9jGjw==
X-Received: by 2002:a17:906:c156:b0:a80:bf0f:2256 with SMTP id a640c23a62f3a-a8a885c01admr130622566b.8.1725609700793;
        Fri, 06 Sep 2024 01:01:40 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623a6ca1sm243488366b.173.2024.09.06.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 01:01:40 -0700 (PDT)
Date: Fri, 6 Sep 2024 10:01:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 5/5] pwm: airoha: Add support for EN7581 SoC
Message-ID: <e53ye6cu5debj2jn5uv4vxdujedwf4gu3ocuk5ccbhzkhosk66@hovtzgbqhesm>
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
 <20240831-en7581-pinctrl-v3-5-98eebfb4da66@kernel.org>
 <yfqmlca6cnhrghpo5s6tml36tngmekcfbyjakxs7or7wtap3ka@7qlrxjowo4ou>
 <d9298199-fe10-4b28-8e28-dc252bd6832c@genexis.eu>
 <t2f5kockuvfi66qqumda6jxf5a4c4zf35ld5ainsnksavkchyj@kdueaqlhjoar>
 <b7e44fb2-6cf6-4530-a271-9e1730d4f431@genexis.eu>
 <xmlta4za6malgthd6cmt5fcipxgyzwmqwxqdg5e4qahcuqzcrt@eidsf6mexrkz>
 <a0a14b57-cc4e-43ef-984f-fb405949b41d@genexis.eu>
 <64zfjgmc2dutmsukg2bxhb44k3wu2y7tt3h26hej7d4fx5nc7z@5zvo3hsucipc>
 <2e8806fa-c476-4cfa-bc2e-dc02754830d1@genexis.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="65osrcmfvpzrxq5g"
Content-Disposition: inline
In-Reply-To: <2e8806fa-c476-4cfa-bc2e-dc02754830d1@genexis.eu>


--65osrcmfvpzrxq5g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Benjamin,

On Thu, Sep 05, 2024 at 08:35:17PM +0200, Benjamin Larsson wrote:
> On 05/09/2024 17:39, Uwe Kleine-K=F6nig wrote:
> > On Thu, Sep 05, 2024 at 02:18:41PM +0200, Benjamin Larsson wrote:
> > > On 2024-09-05 11:30, Uwe Kleine-K=F6nig wrote:
> > > > 1 second long pulses with a period size of 1 second, so a constant =
high
> > > > signal?
> > > Hi, I think I was unclear. The SoC documentation is not that detailed=
=2E But I
> > > think I understand how it works now.
> > >=20
> > > One register contains the minimum duration (d_min). And then there is=
 one 8
> > > bit register for the signal low period (lp) and then another 8bit reg=
ister
> > > for the high period (hp). Per my understanding a change of polarity i=
s then
> > > just a swap of lp and hp.
> > that doesn't sound right.
> >=20
> > A "normal" waveform with period =3D 10 ns and duty_cycle =3D 2 ns looks=
 as
> > follows:
> >=20
> >     _         _         _
> >    / \_______/ \_______/ \_______/
> >    ^         ^         ^         ^
> >=20
> > assuming a monospace font that's 1 char per ns, the ^ marking the period
> > start.
> >=20
> > Ignoring scaling, your hardware needs to have hp =3D 2 and lp =3D 8. If=
 you
> > switch that (assuming you mean switching in the same way as I do) to hp
> > =3D 8 and lp =3D 2, you get:
> >=20
> >     _______   _______   _______
> >    /       \_/       \_/       \_/
> >    ^         ^         ^         ^
> >=20
> > which is still a "normal" polarity output as a period starts with the
> > active part.
> >=20
> > I admit that's a bit artificial, because the waveform for
> >=20
> > 	period =3D 10 ns
> > 	duty_cycle =3D 2 ns
> > 	polarity =3D inversed
> >=20
> > looks as follows:
> >=20
> >       _______   _______   _______
> >    \_/       \_/       \_/       \_/
> >    ^         ^         ^         ^
> >=20
> > which isn't any different from the 2nd waveform above if you ignore the
> > period start markers (which are not observable apart from the moments
> > where you reconfigure the output).
> >=20
> > However it matters if you have a chip with >1 output that are not
> > independent.
>=20
>=20
> Ok that was a clear explanation,

\o/

> anyway the pwm hardware is then not capable
> of a polarity change. It is possible to change the polarity via other mea=
ns
> but there is no way for the pwm block (and driver) to handle this.

That's ok. Just do something like

	if (state->polarity !=3D PWM_POLARITY_NORMAL)
		return -EINVAL;

It's quite usual that drivers only support a single polarity.

> > > This means that when requesting a period and duty cycle you need to s=
earch
> > > through the configuration space to find the optimal value.
> > Or restrict yourself consistently to something simpler than a exhaustive
> > search through the complete configuration space.
>=20
> Is there a recommendation on what is more important? Period duration or d=
uty
> cycle percentage?

That really depends on your usage domain. Just pick an algorithm that is
sound, ideally easy to review and serves your purpose. If you pick
something that is too simple for the next consumer, we can add the
needed complexity still later.

So in my book even something like restricting the period to a single
fixed value and just modify the duty cycle is fine. In that case add a
comment that there is room for improvement and I'm happy.

Best regards
Uwe

--65osrcmfvpzrxq5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbatt8ACgkQj4D7WH0S
/k73SQgAsrvkq9kEh8aH3RvAEdsHuYA0ZIv7Ihe7JrjpgcbDe5blnQv651GAUjTa
zgJsSFmOJuktvsRM0j9G1dh544VxasDLkDRcVhb4nQYPrap8QgmKRtUPHY0EN8TG
+wWZmiqWJktR0RN8ph01Z25wSGwFbWIKV36Sl5fWzZl/jrUJXIQPF2RO1LeLuEci
bqMy893GGCkB4j0n8a1lLmRD/T8EakqXFB5Jc8eKhTGId/9BprtcXS+6n2u3cS+M
K6/mYB2/VUmm7JuSH117572R6cbsvlSqJ3Sk2yIPPxIgLvdG7+NVltvktsxjlV4t
OWDu+/QQl5PTldkXvIsm6PZKvXw3cQ==
=5qTG
-----END PGP SIGNATURE-----

--65osrcmfvpzrxq5g--

