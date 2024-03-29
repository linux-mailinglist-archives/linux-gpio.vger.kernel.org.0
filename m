Return-Path: <linux-gpio+bounces-4902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA178924FD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 21:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7610F285D92
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 20:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A5D13B7AE;
	Fri, 29 Mar 2024 20:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OxsXhlKs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A6313AA3C
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 20:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743190; cv=none; b=uCFj9Fuj4fzXCdxVlrCQ2orAI/nRgqBnrwlrFjbBXj3Vcg5dD0c9cP6U/zCuXRw+uQ5Kj4DBxkjPxHwNGsdwYVRVdORR45ecSAOfoZeY/XX70Rafukj8Is4U5/O4RymXz0+heGvhUQbJKRBKkN7Gn6R7J8Vg4YBrN0ms8g9QaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743190; c=relaxed/simple;
	bh=64ji9IC1Hu+2024AZaYzeAC+cQygfOXR5dS+40xn8f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXVyKfdfowzMNHGNyn26TB7CMuAs/5nmtu9rxkC73yGI7wWhFYKnzNUUdoDCWT0gw5P7fngouFYoXMcweGPhnFmsafgLUSz49Gn2eqMldcNuCXPv5Roly7FXwKQEqdvOkaDNI2612irHudHDiCOZOKkrkp/NXT5N7P9qmzQ1sgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OxsXhlKs; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e21ddc1911so205455ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 13:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743189; x=1712347989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8pQk4LJkHg11AbwvSp4Lvo9KElPGlkOzxln5zVz7SwM=;
        b=OxsXhlKs04mJAYSyq+5Kdf4TQ1nGdvtuMGhlz2OAsiiFxobh9OFQBjiNz9XKauKLN+
         itz1vNXmht51mePwK570qc6HchRugs2SbiF7nnkG0QKClSnU4HLKdIZilyqadPFb7hLo
         fa+e9IrZui9ambUghtGYA5jNpBGmIpOkR1SabharD214BgPzdxV6b7Bt2ZzCLlCmy+oi
         Lse9b2Yq5uV/LAZfRIhLDYonh0nbOuCji3Np9hunWQqYaZ4HBZT7mHIVGAjkF2ngVmzM
         8BC0Fq8lkkMAkqFGXTiY/cT/aqlVmIUSLzNqJeuKYgNu75zJNBtv1tbTh47p/yvNOEGB
         hHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743189; x=1712347989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pQk4LJkHg11AbwvSp4Lvo9KElPGlkOzxln5zVz7SwM=;
        b=Ai74znU4b8sske2u4VKysGEzsogat5hkUmnaElP3zJUYHlii4eH1KRHergUM7yf1Ya
         l9+1bdEGlXqvaRyzWBc6SmR//1EcxRSwOR7LM1ZCXTwaVom2TGY4pS+AbIE4FAh51SGP
         D9XKrcHHHMq5cdnaICyYhZfPbo2gkShfOtMla2qBpmGm+uKwTy8qcOPzoSQKEFAkNTr9
         zA4U1IkdgV5tkJr67S9MC90upJs3k57XDdlR307eVZPTHo6p990vnzQDDVdNCw+Ia/Df
         lgSmAOSQrMdw+N0wNm4XbcSHwg6n3sCk5eU0HhiHvg4gdHXKPuDUP65EyHgk3/PO+WGp
         undw==
X-Forwarded-Encrypted: i=1; AJvYcCXTPXsLLq7q8yUTIE717fcT7z5Un3bfSADKblDeQ7iYGaBlJT8t5vpqs1kJ2G7wGEhtwuzD7k81b3RbHDjxFnymvpYNmE691lD6Aw==
X-Gm-Message-State: AOJu0YxLJcsfEw7qT4oumikXHy74yncjEe5BxSgyYwodzCVOXadjTgGJ
	19/Vlt0A3jBoY45ChoBEF9d0glcDz3WcpSlFWz20wIcO/DTSQ7yv9afbg+6BlA==
X-Google-Smtp-Source: AGHT+IF3YrRjdbxhw8menJ4HsqoSivAt11cHn+tH44S0xY/wxhoLIxV2iowxVCC8jfBv+JS+UAc1Kg==
X-Received: by 2002:a17:902:ec83:b0:1de:fe62:547d with SMTP id x3-20020a170902ec8300b001defe62547dmr218975plg.17.1711743188363;
        Fri, 29 Mar 2024 13:13:08 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id q24-20020a638c58000000b005dcbb855530sm3311904pgn.76.2024.03.29.13.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:13:07 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:13:03 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 07/18] platform/chrome: cros_usbpd_notify: provide ID
 table for avoiding fallback match
Message-ID: <Zgcgz1Kb6nhTEkEH@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-8-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hVbASdRlgdWHtyR/"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-8-tzungbi@kernel.org>


--hVbASdRlgdWHtyR/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:19PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/platform/chrome/cros_usbpd_notify.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platfo=
rm/chrome/cros_usbpd_notify.c
> index aacad022f21d..c83f81d86483 100644
> --- a/drivers/platform/chrome/cros_usbpd_notify.c
> +++ b/drivers/platform/chrome/cros_usbpd_notify.c
> @@ -6,6 +6,7 @@
>   */
> =20
>  #include <linux/acpi.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
> @@ -218,12 +219,19 @@ static void cros_usbpd_notify_remove_plat(struct pl=
atform_device *pdev)
>  					   &pdnotify->nb);
>  }
> =20
> +static const struct platform_device_id cros_usbpd_notify_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_usbpd_notify_id);
> +
>  static struct platform_driver cros_usbpd_notify_plat_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
>  	.probe =3D cros_usbpd_notify_probe_plat,
>  	.remove_new =3D cros_usbpd_notify_remove_plat,
> +	.id_table =3D cros_usbpd_notify_id,
>  };
> =20
>  static int __init cros_usbpd_notify_init(void)
> @@ -258,4 +266,3 @@ module_exit(cros_usbpd_notify_exit);
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("ChromeOS power delivery notifier device");
>  MODULE_AUTHOR("Jon Flatley <jflat@chromium.org>");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--hVbASdRlgdWHtyR/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcgzwAKCRBzbaomhzOw
wmXUAP0e90MoNgVG9am5cylWB+UmMTebF6MYL12zTLUJ1Oy5mwD/bff9LMAGtGCa
3w6bminBlZ7Rydb+ZypKGjWDEsQDwQI=
=Gnst
-----END PGP SIGNATURE-----

--hVbASdRlgdWHtyR/--

