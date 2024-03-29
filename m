Return-Path: <linux-gpio+bounces-4913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5F3892538
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 21:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D727C287FA8
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 20:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DFA13BC0C;
	Fri, 29 Mar 2024 20:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M3pxZg9y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B4E13A271
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 20:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743796; cv=none; b=gAlS3PK6Uk9HVYeHZTJSDOQBPGXik7wJBqD38EOiC/qoQrICUMCZeRb+Ih4euVnKRRnz2u2X+n/PJ0yuT9M/pku7FvQzB2xDZn14wINxYqSkAecYb0dNVj2yJVD55QOGLdIbzFcb5SX9lAr1zAjWgIkSE6zAUwA7NszNZsnQEts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743796; c=relaxed/simple;
	bh=VkyUGxPzPrKZfFXaNY77PCh9MVkCj7rwoCyNYewVKIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3aYLQ8w3URei9GmwSn/h+eEb4hgPQB7UB3xB32Ad4Ga9cr9VgHO53yzW7MRRafw4yDGgDtt1mzRHED+zyf89390wzmEQNBSnVuGPr87aUBn5rJymPrOb1FFCgaRfctGW9w22UwJqjeuyjYoMdIhWIpUCx16kCaS26cn2WwnZAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M3pxZg9y; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dee917abd5so137835ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 13:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743795; x=1712348595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RYuuDc1UrjHcFRqSoVGgtV+0yOfl9L+kGntncI1D1g0=;
        b=M3pxZg9ywyWlcZXHdi6j9BybRvMJooPLEFoSBy4EW2SFwd5+oRX4bVA8VB6VTFWqXx
         P2tj4U1+S20MltlJ70v5DZ8ME37pYk/Jfe+K4ci4FIlp5DYGxhb9B5hjn5gPvurbg5pQ
         yQ6bQY3nFT4xOrOIQkgEobmvtX31pzqCgM9cno72UCtsFYKEfnffw31fPXAMFVnTdMjj
         HVhlFsTyzI/MZeU+YYgpW1fL8Ap+MsG8gDVVosoHs3ZZAlg9bm+50pt5vLYuuH0Uvraz
         WOTp0kIvVsq4ih8DgYf+OyiccPV6JZ3cxyNSld0lAD2zPrLU9hl+b5FQILukBsod1fxL
         uykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743795; x=1712348595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYuuDc1UrjHcFRqSoVGgtV+0yOfl9L+kGntncI1D1g0=;
        b=s5NeGCnLP11yKmbSNUwHoUqfzAhBYChI6mKOMdL6QHXAoqUgRfozFb/OVaXUgSuBuO
         +nGUf6+NSxx2mrkl3u2Rvax99xiaJpQwg6cTHnvj3EgKkDJd2Co+Ccip06RTtj9AAEKW
         J8zTYJhoJmg+4KNnrjihgh+tSM1qD9Ibg7jJYDW48Z5gLjM4GVQmg5Obqmt0O0lEyGMC
         iAIrhMH4KCGGla4/IyFNPbx/VICY7uqjakyewl2FYF+53Lr/Uo4csfn28ss1jxzihMJj
         dZEGdIXAeknxwXT0ktRMzJTGbpocz+3s3zDOyLLqWFREZ8qToICnRB/UnsDmBJQE5yY9
         U1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7WiMcmJA2YeGPss+d3icu+J9tQVQh3Bd29Qtr1cHM9/qh3uRPwtS72ZuPY0LCCjp3gnwqEtdcZ8sKstwj2kTH6fVCndwT15Q8sg==
X-Gm-Message-State: AOJu0YzVDUE0+EHsO1pR0Gh/mrGm2oX6QI2qs1CcAzBRryS3rLxGydAw
	mPT17bSrz9s8GQgc7ktYn4vxpJ3MRdcK3XP8pcVw9Lb50LOT1HHDH1mFvryucg==
X-Google-Smtp-Source: AGHT+IHvn0nqKtbTLUczx8b9ivGiOUqI3uBM94lI6ODQwFeaMdSnffR810G0Ri5UnlVGIBY3mSBZgw==
X-Received: by 2002:a17:902:f54f:b0:1e0:e2c2:47f3 with SMTP id h15-20020a170902f54f00b001e0e2c247f3mr217682plf.9.1711743794601;
        Fri, 29 Mar 2024 13:23:14 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902d50300b001dcb654d1a5sm3839491plg.21.2024.03.29.13.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:23:13 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:23:10 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 18/18] platform/chrome/wilco_ec: core: provide ID table
 for avoiding fallback match
Message-ID: <ZgcjLj9weWwqvtf3@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-19-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NN08j5j8NnmF0xd5"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-19-tzungbi@kernel.org>


--NN08j5j8NnmF0xd5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:30PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/wilco_ec/core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/wilco_ec/core.c b/drivers/platform/c=
hrome/wilco_ec/core.c
> index 9b59a1bed286..3e6b6cd81a9b 100644
> --- a/drivers/platform/chrome/wilco_ec/core.c
> +++ b/drivers/platform/chrome/wilco_ec/core.c
> @@ -10,6 +10,7 @@
>  #include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/ioport.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/wilco-ec.h>
>  #include <linux/platform_device.h>
> @@ -150,6 +151,12 @@ static const struct acpi_device_id wilco_ec_acpi_dev=
ice_ids[] =3D {
>  };
>  MODULE_DEVICE_TABLE(acpi, wilco_ec_acpi_device_ids);
> =20
> +static const struct platform_device_id wilco_ec_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, wilco_ec_id);
> +
>  static struct platform_driver wilco_ec_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
> @@ -157,6 +164,7 @@ static struct platform_driver wilco_ec_driver =3D {
>  	},
>  	.probe =3D wilco_ec_probe,
>  	.remove_new =3D wilco_ec_remove,
> +	.id_table =3D wilco_ec_id,
>  };
> =20
>  module_platform_driver(wilco_ec_driver);
> @@ -165,4 +173,3 @@ MODULE_AUTHOR("Nick Crews <ncrews@chromium.org>");
>  MODULE_AUTHOR("Duncan Laurie <dlaurie@chromium.org>");
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("ChromeOS Wilco Embedded Controller driver");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--NN08j5j8NnmF0xd5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcjLQAKCRBzbaomhzOw
wn4sAQD1CpsNqowknTOlUVIhoHGxpEueNDKHe4Vzw+5F/F27PAEAxS+PxEJRIFrz
NYo97I9Ikic/3Zo89drm0AL8dD7gtAo=
=cQau
-----END PGP SIGNATURE-----

--NN08j5j8NnmF0xd5--

