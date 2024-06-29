Return-Path: <linux-gpio+bounces-7832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39091CB91
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2024 10:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE6B11C20F85
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2024 08:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A9D38FA5;
	Sat, 29 Jun 2024 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2o+yKsnI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE811109
	for <linux-gpio@vger.kernel.org>; Sat, 29 Jun 2024 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719648519; cv=none; b=OCiZBdRy7tfS1oIHDAq/eGoJXawV2h35lkqmhUyECwPHidCGaY6M+uH0G8Gn5zHAnQtnvx/w24CScLzQhDch+fb13nmzICWX0/LYfYyUKOlieMrRwC1mZHMAAfyelZQwblDtRep+Qg66ZOksqQqKi7//jCtP5hqYSV6w53ioU6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719648519; c=relaxed/simple;
	bh=BBCyaQxLREiLslktbppCVuX5IJLqgoO4r239wd0ABN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDj7lGGh9rBnboEkh6WDlZQrL2t+VK2KY8R5wOdOSJRwjCpQaF/4uWQDL/+gmspUZS5zzO3lXCKuEgjoDZrdnQ+aYV7re3l8g4WwrQRxthp7X11fsmw1WBruPCfiex/V831I70FGhu/n8UIWKUUJU5dZJdVJx5kSMd2/Fwy0Bps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2o+yKsnI; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52e7d2278d8so1982164e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jun 2024 01:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719648513; x=1720253313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O+ZkvhHwk7750FqBEhJS3DcahoN5BOHgNv+lFscO4cQ=;
        b=2o+yKsnIodi6PgVHPFXIJ0BMDl0L+arGFPJF4OilTyeyIFYb+fkuM74L0H1y4grh0y
         8LAc4Vdqm6w/BpmZDsdpqq7vfQA2Gifxq1bmTdKFotYW7H3e8jboEzsotm10LH8NRR9W
         MbdQqxfOgZWIb/fv0xUYD/uyl5sP+f71e63iXI2+DjfCWDVw7PdEDQGlszhundQnRbB1
         Ay0O0itysZGqF6oZsGyvXj0QMvL8gdWv0SEaJ+5pLS+QpEWuL2MsqqKTIWl/6huT1vmh
         LzfHfcKoNrpDbTfk+wMSrBfPz+XEKfSfBKv8tBLE2jeHIV0O4LCz0EYsHNAnx2g036CM
         LpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719648513; x=1720253313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+ZkvhHwk7750FqBEhJS3DcahoN5BOHgNv+lFscO4cQ=;
        b=W8hsMVc3r6Oq4oM+M26gX36raSnJdTT4Dd1np0418K8Zkj/l1N8la7JkrBwZTEZfun
         bE+JNHiyKoAHZ85izhw11YrJe2XIEA3IuInLpFTfvGORN+dU/4/IhAEY3sTS0Fi1u53m
         lP9Blfkpsu1AxjTr/IbqeP3zDEoRKnTJ0T23sG2iqhg+/YYTosKwlCw1Hvm/nnhIdamf
         nUVp1Is6yGOCF4KZSqb4rbf2vk8Wlzl2OAwdGFfY0oBoemNxzav1TwsghD5N7wAKcof5
         Zo2sJusVT95VAd0lHIe4aArVv9eSbuOKbGFRSw7GPsvH0igZgSwgPXwmD9aRAxKq4hhh
         j1tw==
X-Forwarded-Encrypted: i=1; AJvYcCUTISsBjSaXkjhAsV6wFac5P2cvAP1/f4DiuaoT6VRqJXqFf/8oj6wp0BGgtSl6pKtjPjkE21QrDZvi/PZMgM8U1OtJu2pFGto2Wg==
X-Gm-Message-State: AOJu0YxXxexBxiraS8Ic25/YyzqDRiOfbCNNz+KAqo40EHDBpNIqbND4
	vyOlnjdj7HtQNQJ2HRJpC5G9cjI5ALm7QQrBxglCyEpx+Q9I8MXzYOwWEcTTnqI=
X-Google-Smtp-Source: AGHT+IHSv5ihn1P8nevgMRliFhmUKmMh5e2Mdjl2yEP3hmMQ7slo4hojvW0p6v4hYOoAt+gWbx6ylA==
X-Received: by 2002:a05:6512:6cf:b0:52c:83c7:936a with SMTP id 2adb3069b0e04-52e8270b86bmr434039e87.42.1719648511415;
        Sat, 29 Jun 2024 01:08:31 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:850d:6139:5a25:72d0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a75101e4f76sm35601466b.192.2024.06.29.01.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 01:08:30 -0700 (PDT)
Date: Sat, 29 Jun 2024 10:08:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Aisheng Dong <aisheng.dong@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH V3 1/3] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Message-ID: <vy2jjh73agfhbovxt3isc626dru3daxwxba7gql6cj3ftpq2qx@pye5xiepzdc4>
References: <20240627131721.678727-1-peng.fan@oss.nxp.com>
 <20240627131721.678727-2-peng.fan@oss.nxp.com>
 <dldl7dkdcsuajjjpg2pczfnupqrsghmpz27i45xi5beeou5ntg@y2ysounw3pqq>
 <DB7PR04MB59481B0994BE9D1175C4949A88D12@DB7PR04MB5948.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fntpmbabhhgn6lo3"
Content-Disposition: inline
In-Reply-To: <DB7PR04MB59481B0994BE9D1175C4949A88D12@DB7PR04MB5948.eurprd04.prod.outlook.com>


--fntpmbabhhgn6lo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Jun 29, 2024 at 01:32:15AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH V3 1/3] pinctrl: ti: iodelay: Use scope based
> > of_node_put() cleanups
> >=20
> > Hello Peng,
> >=20
> > On Thu, Jun 27, 2024 at 09:17:19PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Use scope based of_node_put() cleanup to simplify code.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 43
> > > +++++++++----------------
> > >  1 file changed, 15 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> > > b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> > > index ef9758638501..f5e5a23d2226 100644
> > > --- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> > > +++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> > > @@ -822,53 +822,48 @@ MODULE_DEVICE_TABLE(of,
> > ti_iodelay_of_match);
> > > static int ti_iodelay_probe(struct platform_device *pdev)  {
> > >  	struct device *dev =3D &pdev->dev;
> > > -	struct device_node *np =3D of_node_get(dev->of_node);
> > > +	struct device_node *np __free(device_node) =3D
> > > +of_node_get(dev->of_node);
> >=20
> > of_node_put? -------------------------------------------^
>=20
> You mean use of_node_put here?
> of_node_get should be used here. The __free will automatically
> do of_node_put when function return.

Ah, I misinterpreted the syntax. I thought your code registers
of_node_get() as cleanup handler.

Sorry for the noise,
Uwe

--fntpmbabhhgn6lo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ/wPoACgkQj4D7WH0S
/k49FQf6A1ST0ozfIDojlpA4JikoIS8wCnOr+3tnyb+aUL93oVwWgcctdiBPIUPr
yBotdPy4myrfd3Rducnik2BvhkbGUe+pxRGBMxrXdPm7MtUyADJOJVsOzQFhfE5h
MtGrbEKpBVWbDM/8XU6p7KrwfZ/43y3AxVIlT/GsGHcvYkftuelV4kadao6hOK45
sPaOQaWQt0z3nYySrs/0O1VvDoK2NphgcFJ74TDmLhaU/7AMdlJD83gjtcFnIE9T
jA91hOEmeLk87SBFq54xGBZkVtbSGjOszbAnYF1nGx0KsRJy2RV6U9g0q91w/HB5
1WeFWctqcbTZ9vkWz3HL6m4004cIRA==
=TJVm
-----END PGP SIGNATURE-----

--fntpmbabhhgn6lo3--

