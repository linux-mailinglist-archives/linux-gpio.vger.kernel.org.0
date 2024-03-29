Return-Path: <linux-gpio+bounces-4896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 670738924D7
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 21:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BB1828599E
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 20:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739D613B5AD;
	Fri, 29 Mar 2024 20:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eidlxR6g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFA113B2BF
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 20:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711742745; cv=none; b=h4a4epXCsqr4ZxcWQthpnh9sMFdhhqZiFnHDprpz7z91ICzlUUtqpav/+36CorBY6vfsQq+fU0tp/seuIs3UAs6aijF+LLnYwYAzthl2w0dY4m6d+diJcLowg69QE9q3T/+wy4PA8dL8vgNDGUBWs2V9aq2EYKNMQ1rR3bnCJ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711742745; c=relaxed/simple;
	bh=Ec/6RCVI90+5kmMw9qGEqm40uw69VDZKsIVsE5g5+vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkRiOKS41jHBwTR1YN7J0uS/kGj0agl26K6M2lZTPKRm2VrKf6lKNo299LVnNzGuqruOyPWIORjrlj/01bqaKWgQ3lfa2s9hFgTa6OlDCpKa9/MFpm8VPv/p4cvzoU2CSmkCf8L+0rfdWQhxE/uioTShAq1LlcCjSCi1bEPNZpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eidlxR6g; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dee917abd5so135745ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 13:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711742742; x=1712347542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u6QCIVlmxeNX27UI/K3Cf9MpcNJg/YZGD58e6DLHxcU=;
        b=eidlxR6gUc7zXBx8jiexJ5HQ5ZWI70JWCZII2GSPLhZkzXUyqfVfZ/yCrSn1+rLbrh
         4bap3BnMdjVJUMiaRZEveMjAGGZPSvEgJCtEv9rJHp8qZ6CpRpBQO8RUmYkuTXoAZ8bU
         2WV90nnr1tjJHEp61sPWBluavltTZTJ9mFyK84j30IuOwI6JHFnFs1DxYHdDVz0kUWoc
         IBU9YqIEJNeHxeui3Fh24A0KivN9RcaOW8uhhNgX40/GRoklalsmWR/W8atoburGZ/uQ
         g1CRZKc2QcERXzqKztOr30z/WIse4TC+gP8M3mLtvVP+jC78kOi1dd3fxOaKGM3YmF78
         y37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711742742; x=1712347542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6QCIVlmxeNX27UI/K3Cf9MpcNJg/YZGD58e6DLHxcU=;
        b=rhVes2FyAmAEBkh49FellolsDwDNt/dLc37dB1BbjGkA/Quo1iWp99oZUxF5fAZC4P
         4gA/HTHfXY3+3wBV/7yN2veTefIuxDOsVJLqHl+zcLlGnHZrHgJI7FmLvPdKyPZ0qf/f
         vPlsdC/YaOttaq5wtc8Oxn0hcXvzkt5pbxqYAxVBr2IppwfROLiLhSl6Vq9r99qjMF3S
         jJDgRCBGOB1Pt07tf+iGhz0KjFCJ9tvxlL8vim2G8cq6skp/o1szi2HHU5abhmwkq2kW
         uTwT+/iYvkjMxHj6zDseGo9dKu4ov3bFpjjRINYwuvDZffb0A8Co4IdXJeumeedCvA5F
         D5Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/DKf3gDsOC0I1VN0y2XHpE6BBQb9cAhP23iTox6/GryKWhT1uhB/UqcP0RE4vZQn79o8U+dnDKORkXhyHFvoCchmZdLrd3ckfQ==
X-Gm-Message-State: AOJu0YzABdT3q4WRIqM1hv56rH6ZsbwhtUukLgV3gim68Wlf5sVnRMkg
	+knhEvyChj8VF8RvHEPfHEr73w1GhuAxAtUtuz4K/hxWZOY3KZp0b4/OzgvCxA==
X-Google-Smtp-Source: AGHT+IHR2u6fSNoMRhcUTnBmHEFrAZS31d9cCSSGyjAe7qEaUStQSLdDMooRsOItZpLKvV8bNIfR3w==
X-Received: by 2002:a17:902:d48d:b0:1e2:573:eecd with SMTP id c13-20020a170902d48d00b001e20573eecdmr227044plg.3.1711742742020;
        Fri, 29 Mar 2024 13:05:42 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id w8-20020a056a0014c800b006eac4b45a88sm3467873pfu.90.2024.03.29.13.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:05:41 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:05:37 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 01/18] media: platform: cros-ec: provide ID table for
 avoiding fallback match
Message-ID: <ZgcfEcWh8_MLRD4v@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-2-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rRhNzJnLQNBrfqfa"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-2-tzungbi@kernel.org>


--rRhNzJnLQNBrfqfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:13PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/m=
edia/cec/platform/cros-ec/cros-ec-cec.c
> index 48ed2993d2f0..8fbbb4091455 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -8,6 +8,7 @@
> =20
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>  #include <linux/dmi.h>
>  #include <linux/pci.h>
> @@ -573,6 +574,12 @@ static void cros_ec_cec_remove(struct platform_devic=
e *pdev)
>  	}
>  }
> =20
> +static const struct platform_device_id cros_ec_cec_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_cec_id);
> +
>  static struct platform_driver cros_ec_cec_driver =3D {
>  	.probe =3D cros_ec_cec_probe,
>  	.remove_new =3D cros_ec_cec_remove,
> @@ -580,6 +587,7 @@ static struct platform_driver cros_ec_cec_driver =3D {
>  		.name =3D DRV_NAME,
>  		.pm =3D &cros_ec_cec_pm_ops,
>  	},
> +	.id_table =3D cros_ec_cec_id,
>  };
> =20
>  module_platform_driver(cros_ec_cec_driver);
> @@ -587,4 +595,3 @@ module_platform_driver(cros_ec_cec_driver);
>  MODULE_DESCRIPTION("CEC driver for ChromeOS ECs");
>  MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
>  MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--rRhNzJnLQNBrfqfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcfEQAKCRBzbaomhzOw
wp+oAP0fv6/WzZqGqWPQmJLOlfe6a+iJ8ttOgCDy1MUS6lE6DQEAv3lYNnAzPfRH
16H5TWGS1gh5RMmp5cgSHWlwluqezgU=
=R7pN
-----END PGP SIGNATURE-----

--rRhNzJnLQNBrfqfa--

