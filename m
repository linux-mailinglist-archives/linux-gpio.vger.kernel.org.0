Return-Path: <linux-gpio+bounces-34135-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDRGKn7hw2lvugQAu9opvQ
	(envelope-from <linux-gpio+bounces-34135-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 14:22:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 68277325A1B
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 14:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6253D3102A12
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 13:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F92B3D8918;
	Wed, 25 Mar 2026 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlUEcTUS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8460B3D811F
	for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444303; cv=none; b=Hj+xXn2D3MBu66/yYQwF2PHkf4gSLpAdEYvGvujW/Ddq5mVOLomILrAfOKoAaLGiEMDnWYJHbPDF5G0pONxpIT0CwdS7fgoRrzGrLVb23D76uEE+KujdE7BDnRfLwNVfb0bT0kAhr9FJ9LQKt9iWXfIjG0gR6FX8k2efN1fRWAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444303; c=relaxed/simple;
	bh=g4wYbCrQQciM5eAA7bNgeswNgh+jLdm3yzIf2O7Ct2c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=or4Yfvh+Dq0Q1SHFKbyojwl2VXa6pWoK6SHdcEYtIuI9RLRvC0wP6UGwUmazQwtOn/c4/Vh61B29lpqSaH8n93/YYN/sXmU7n8EsuBz9SgEaGq00g86Lf7HtnNDJDuoQEefFsG8zbSdrkoPNzfxfjtuM5zWmL2ZA6FyBa4/HHpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlUEcTUS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486507134e4so29758935e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 06:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774444301; x=1775049101; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3GPRX2Yqkh2fKcDql2NbbWnYF5EebgqjYrmp0cfTJ5I=;
        b=FlUEcTUSYKpCxvw92RDkKefbBgYBLc4ykoYW58S+9zQ3sNCSyItFQKnJX0mKXARFO2
         E9oo13U9zxVGkgarArAhzOZQliIG4F3CzAppc+X/xd1UklAGVxE+Pyv8oVqSR8Nmk7pW
         D3/JeMcd/wjGKnW3U0iac994/Akstb/UZtq1CSVlJBeKPWLqELnkrYUAXL7CWpb1vgGH
         uRdr/b4OWGQhJTwuP2vZIpjKAFm519CweJHdSicKy3nE3BYWKzM8/f0/tOJmVnsWc3CK
         ofbPmE+kU383DzjJOFdNEjTZNRmX4Ospc/wb2eylB7QgKfdyW+OtmehKkRFnpycQdcm1
         EZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444301; x=1775049101;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GPRX2Yqkh2fKcDql2NbbWnYF5EebgqjYrmp0cfTJ5I=;
        b=lkEk8htlPLIRR9irOoMk7LZCMMUGB7nsedDH6uQOlRh/jMvSI0B3I6oJ5oqxZFam2x
         6Tol/oGwdUetCDqrF2bJd0LL/B++k488FYrj5tdYVdIroyPb8ly1ZYtsuWwwQenEFfVL
         gLeENE4Ud6rNNDEmilZ5kmVML/bDCcBqsUOGOHjmgNufzlbn0bYUX3QgfPioUlz5viav
         yg8GxvGpM+d9Z98ioC5rGuT+YgiCRW78aQpVgQKLNlWOvrBpGu8XA+8R9OFn8hWujUhb
         8gDUgS+Fbr5OXKIdqIgpHnlO2cU2YWxIXxNVXhTrP14bgsYGAn2+NYeo7G7CaJSpHHaJ
         0B8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxA++LK7eZrerrCYfDjHkE0uucmnTIOGfrj9BvkucxSaAF0pG2rIModqeDtVMGK/hLJkHupVo7bhM+@vger.kernel.org
X-Gm-Message-State: AOJu0YyCK3ls0AuLnfZ+H6f1DXWYC8SQDc3NOaZwGWntIbCYEn90lC+I
	shUd3bFEl4JQx76nQU7261AVv24pgPYLdXEpFoLEh9Vosa9BvdC1sIRU
X-Gm-Gg: ATEYQzy+aEeq3t0y8A3lJzXL3QV0Nwy+SlDXd4KSfwxmu5OHa0jOTHe235swDMZIJGh
	jIFPg8wCM5io3FOmouA9hrPLrONEJc6TWpoIfUlj2VxOGIsdLEbgizfjZzHCeRyG7OOLFbwQckx
	nt4HpiNYipEZPdSXb1LfTrV8vGS9bn5V4ZVL67JIX0BnqgozORDtxS+1g1W6wHgeRj5qKqM5g7D
	4ql6sWbYkMFQiMY6A83biFEXdDWhWmCepCGaI6tn94hlaq91bbGCG65TpS8O8HwSQjRvhR+ezoS
	foohLMhA/M4S+3VGlh4lj31tV2s/93RL/sSqaRtiRHuzrOUgS/BWTg+HKNEQXG48qx5DJF2Scik
	8+Iu7X57EhHQd+ILhjtkpvDFpY/prGsE5i/DsOsoluiNQQxM2m0GxKjaIdVnDq3vfUK6quYYDrO
	zGXRIUVjdR18I4YBiqmO6ReWAxyxxatx8=
X-Received: by 2002:a05:600c:4ecb:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-487160aa232mr49865885e9.31.1774444300774;
        Wed, 25 Mar 2026 06:11:40 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711709e95sm132827945e9.8.2026.03.25.06.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:11:40 -0700 (PDT)
Message-ID: <852233180cce9c9adffc491e4cdc16f281bfe09c.camel@gmail.com>
Subject: Re: [PATCH v4 3/4] iio: adc: ad4691: add triggered buffer support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>, Lars-Peter Clausen	
 <lars@metafoo.de>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, 
 Jonathan Cameron	 <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, "Sa, Nuno"	 <Nuno.Sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,  Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
 <linusw@kernel.org>,  Bartosz Golaszewski	 <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
 "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org"
	 <linux-pwm@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	 <linux-gpio@vger.kernel.org>
Date: Wed, 25 Mar 2026 13:12:26 +0000
In-Reply-To: <SA5PR03MB84250500F1FB9567F7FD2701F749A@SA5PR03MB8425.namprd03.prod.outlook.com>
References: 
	<20260320-ad4692-multichannel-sar-adc-driver-v4-0-052c1050507a@analog.com>
		 <20260320-ad4692-multichannel-sar-adc-driver-v4-3-052c1050507a@analog.com>
	 <83d87ff35002e5c7b9448a5ee7f2791a63c38c38.camel@gmail.com>
	 <SA5PR03MB84250500F1FB9567F7FD2701F749A@SA5PR03MB8425.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34135-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[analog.com,metafoo.de,kernel.org,baylibre.com,gmail.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 68277325A1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 2026-03-25 at 12:47 +0000, Sabau, Radu bogdan wrote:
>=20
>=20
> > -----Original Message-----
> > From: Nuno S=C3=A1 <noname.nuno@gmail.com>
> > Sent: Tuesday, March 24, 2026 2:23 PM
>=20
> ...
>=20
> > > +static int ad4691_cnv_burst_buffer_postdisable(struct iio_dev *indio=
_dev)
> > > +{
> > > +	struct ad4691_state *st =3D iio_priv(indio_dev);
> > > +	struct device *dev =3D regmap_get_device(st->regmap);
> > > +	int ret;
> > > +
> > > +	disable_irq(st->irq);
> >=20
> > Should we use disable_irq_sync()?
>=20
> Isn't disable_irq() already calling synchronize_irq() inside it? I can't =
see
> disable_irq_sync() in the current kernel, only disable_irq_nosync().

You're right! Sorry for the noise

- Nuno S=C3=A1

>=20
> > > +
> > > +	ret =3D ad4691_sampling_enable(st, false);
> > > +	if (ret)
> > > +		return ret;
> > > +

