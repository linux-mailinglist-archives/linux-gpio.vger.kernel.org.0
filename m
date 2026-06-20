Return-Path: <linux-gpio+bounces-38739-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +DalJJvDNmoyEgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38739-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 18:45:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 202856A93E3
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 18:45:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=AVrNoRLe;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38739-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38739-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E82E3004D1B
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2026 16:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0012417D1;
	Sat, 20 Jun 2026 16:45:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9700C23D7C2
	for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 16:45:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781973911; cv=none; b=l/7NzpTREh1ZTSY6wEX2Atap2LxL7qZIcItv2OCZ6UUl9EPpKAmQvqlyMi6FQ10Z7EAPJ04D2D0v2F/tLU6B2/JbzKMfa8ycBbsz8qJ8b62PvMOiQsPnPBFqFhZgw+8ydA9DipuwYqlxZvbz13JYdK4e4K5/exKtVPTboGM5SD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781973911; c=relaxed/simple;
	bh=1bVMMDDHYK1tbfK+FCWxigdi/hnT5yntnZxlk2KIw/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1DZYZHlv5sD3g5ZnkdExz/1BsE17FnREXeYhkQ5M+SRV4us4YWgJ7hmXdrmVYbWBR5DmILIx4DVjbqkzBhIt3tUffTo1Y1SMdLV23f67jILTExSKHDuktKZYTFJ6EbYRbsIOBItIR7t+FrBaW0bJK66zNIL/HT6Hn2IcC7I4Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AVrNoRLe; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso1532821f8f.2
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2026 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781973908; x=1782578708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4xf3coOPUWbMTxaPE5D9bU8iWGy1AKPG0AAw5vh3MH8=;
        b=AVrNoRLeT8u9tYN/aTIYYb32mpUYSYYbaeryobzbSlgbP4FvvlFfEfyZJdSVmbQsKG
         tocszXQpqzI/i4QCpGBfjnPUjV9t5R9IKIoycwm9jrOfyf395jXzCMZicbVGj19F8r6r
         +/tLoXWon/4Crlc3FF4pXj9T3OOzdpD5Fm8Sca9u8QreizfyZirLDh4wolfm6AYK+QCX
         mh9x8Sl4SYNUffThAKEVsWlFpDBGq9rbob7TpWvGSbpxcdPDYmcBUaxrLfRX0vk4/IJS
         l1Rs4uh6bqx4WTpRdsEgjGdHvC0CKsLT51yBxWSrg3Gr9hGfQfqv/xfNlK35j/Pf2Tff
         gRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781973908; x=1782578708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xf3coOPUWbMTxaPE5D9bU8iWGy1AKPG0AAw5vh3MH8=;
        b=RXUxfz/lXbzw1kbgq/aqWxN32tDUbwpHXYS10IcRlHN37JIeOQMqioRwLUPc26spHA
         ZDYnK8gg6o66uSzJMOKkXKnSnJfKnynoJMBZVbhVUaG4zJieGv9EN8RwCDaAC82++XBE
         /wDjevBq0rFQ1s62q/o7aK4v+uXeaq1nPzwqMdUT58k02xeHI+eOtUW7NEMz8vwP5I3A
         o+r+4JsBZjTbVHZMnyel4RV0evIYUu5RbnlVywopW1zBy6KfdvKc6edwpR5s3kA6yA5O
         2RsOEZS4JLZNEakhXcHgRwbnrlN6Lw/Gr9KXhHbJdFvRuta6PiP2/SL8tzyS0kwT0trc
         a+IA==
X-Forwarded-Encrypted: i=1; AFNElJ8hWvlyNUaPok6i4JjPfsDSfe5E8MsRlaJU5uVn8CreY8sebZVB5iJyZo0rzbnAtlChV5GgnCDDcQiS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/CFkWbv5wEmISK56/btZWA5JPh+ayru7G40fmPEKugf6Aw2CC
	nbS6glhpcBQVkzdSA5nVnGeWee4FfwXqdZbiz7LB4GjxAFtcj+ghZgbyv30ex3jv7YQ=
X-Gm-Gg: AfdE7ckMIFTENubOK8e1oEm3hnDOBPfeT+uYRN2yGpbEXH1uUIADt56cNEVvrlZuTc2
	JH5wIDl3ZGYcJQES5MZHCFvqjySO2XiCpxsN3oF4owKFHecWJSg82pVa7I6lJ7sAOF+c3GhsVJh
	acj65zhZn5/rTWwgIA+ZsjRRHwGfCaQn0sS622em2DcpHSMord+1AGxiz4OMpMCxEVFrEpUUjsW
	R6jxMkm0Q1KcDgHPza+ZAXYRuUsxocTppWvgYirUznOwYqOHEg6vxJCsOZaHOgf2LMl+ht91+Cv
	JmIegjBwUXwmhQ0Ti96t8eVQLKtJc/JTOXSqvlxzWIrI8HKUipr+8TAULevhTSgSZEBTXsfCsJy
	nYGjX75VFY8Sj+Kids7+caj/j5RbpEZqLW+KbT/tiet7Y/2kOnwGb7i2I/jdwlduCT2GlaSX9yf
	XS9TTAodF3K5OM+MAUsw==
X-Received: by 2002:a05:6000:1ac8:b0:463:1885:6b72 with SMTP id ffacd0b85a97d-4656dd07880mr10691770f8f.11.1781973907657;
        Sat, 20 Jun 2026 09:45:07 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46667221da1sm9100756f8f.36.2026.06.20.09.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 09:45:05 -0700 (PDT)
Date: Sat, 20 Jun 2026 18:45:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: initialize return value in
 gpiochip_set_multiple()
Message-ID: <ajbCt5hAiqanKZ2f@monoceros>
References: <20260620155319.79994-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="odetph3dhn35maqc"
Content-Disposition: inline
In-Reply-To: <20260620155319.79994-1-ruoyuw560@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38739-lists,linux-gpio=lfdr.de];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime,monoceros:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 202856A93E3


--odetph3dhn35maqc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpiolib: initialize return value in
 gpiochip_set_multiple()
MIME-Version: 1.0

On Sat, Jun 20, 2026 at 11:53:19PM +0800, Ruoyu Wang wrote:
> gpiochip_set_multiple() falls back to setting lines one by one when the
> chip does not provide set_multiple(). If the fallback path receives an
> empty mask, the loop is skipped and ret is returned without being
> initialized.
>=20
> Initialize ret to 0 so an empty mask is treated as a successful no-op.
>=20
> Fixes: 9b407312755f ("gpiolib: rework the wrapper around gpio_chip::set_m=
ultiple()")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 1e6dce430dca..cd2a619da456 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -3778,7 +3778,7 @@ static int gpiochip_set_multiple(struct gpio_chip *=
gc,
>  				 unsigned long *mask, unsigned long *bits)
>  {
>  	unsigned int i;
> -	int ret;
> +	int ret =3D 0;
> =20
>  	lockdep_assert_held(&gc->gpiodev->srcu);

While I think it's questionable to call gpiochip_set_multiple with an
empty mask, returning a random value isn't the right reaction.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Did you find that by manual code inspection, or using a tool?

Best regards
Uwe
> =20

--odetph3dhn35maqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo2w4MACgkQj4D7WH0S
/k7yHAf8CX68ols8FPRkdTrVTDmef9hIRHF5uJB6fdHuJFJa+XLYZDc/NofvYsTP
o5WiuEQE405X7QbTyY/y2m0/IzX+9eLTeFm3EVFpIi9dcGxMDxnMnBYlGcXto1OP
GnURX4htpr4LyqRZm9ZM1gGt4gDcEdSTOUCPEgxK1XmWLrmAzBLL1xC2rah/vEKM
pzd1LkFqaHC+m1RjPaA0B0oqMFm8APhthxQ2QU5P5anPZrCgaqWXIRIpXrtObKyt
pqIlQbcDDXyE66XQJ0gsvE0LyrX7ivPVt/IMVGM66EASaInOh6zN+/jsIpl9KgGN
AIxpawWSNNF/fxi+ufEbfoDZ6jXVuw==
=kUMF
-----END PGP SIGNATURE-----

--odetph3dhn35maqc--

