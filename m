Return-Path: <linux-gpio+bounces-4901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822608924F4
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 21:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33F76285D91
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 20:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFF213B5A4;
	Fri, 29 Mar 2024 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="whlEyCXW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EC713B58C
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 20:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743111; cv=none; b=QY2PdvXAyhEJF+mS9aAIYztcTTaE6gTgsD1SaV5YdE8OFE+mD8W5OIsIsguZqJ6C20NQfKQ4kY0gb1FVmdxwNduDLg8r9ChA+mmUfnTU7a3oGEtyM91YRjvgA9iw1cdHrA3OtyKHn1Ik+dseSvCbl3HGl67+L99Y1wv9P0ibSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743111; c=relaxed/simple;
	bh=BIuag0g6C6Y3y8ZICTD7oRnrFkAWMfEOyFsH4BKw78I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbXOWa+Bt/thCqUbQu413C7xLfZMrXnOvO6QAu9gihlKmCk3pAabhXPlAYXX11tv3DHQg/3eC/goO9NYWrvMl6XqqWCj1zv3en1a52EEKoTVerIYv15uzy+BOQ45sq8RMeugHp8dFbzwcd5dgVPerxMXLFJD9Qh+aRLmDgf15TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=whlEyCXW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1deddb82b43so170395ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 13:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743110; x=1712347910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FFzyg0npWqeBaTEsJ+0b6NEDJj79+MH/Mz+iGKuuB4g=;
        b=whlEyCXWZPzyxxrHdFjImZgsNXQ6Jp2KcdR0B6VIu/PLhBop/Qbfbxh9ZTnTXJRhpy
         SFiAZG+8sbyxMt/3KhluHhSfA3YphsdRQv8PEJ5QfBHfsPwBLEaEWUHA/nF0kJ2u7K4m
         cY5j1RQhLGpXac8EBFZgCFfuHA7Ls7cx5JeDCwmNHqsnuTOyHz5hbRSLnGS50Jc9BPmc
         ZYL+Eto9KtTvO+YzaPur1rHiWe5dQmcEOtG0Ed2TYi2QDYaY/yuzmbHkShuN/lqlI/Ac
         4Fpm2zG3arHVyCVTvjkrjfDjCJrlomm++xWkIkWEaNH0rwHkwRydEg1e3FoN8MFfXuSD
         JT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743110; x=1712347910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFzyg0npWqeBaTEsJ+0b6NEDJj79+MH/Mz+iGKuuB4g=;
        b=pesswNeAjdv4H12cgThF7K7CTzsJUrEFnRKDO6GklW0ZUynjKJDeG7l7/aQTzkNoxU
         d9MIef1iBCminxbKbpan0ojBNn2Y9llOva1WCmzSEasGXDr59RfJMzI9b39hATRnvPZa
         wAJGJBvZVe5tR7CWX+wkDUM4dF7lRr67/ZIqLLDhbS4XnyVy0o7Fo9qr6TWaAXpzf9NC
         vs5zWiJmpt24n7yIAFKCBjekN01f3RsGOTbI8OFLb4A0qVg24byeVMByHNao1gasFSFy
         7ilkrVo3SowFduzCZNaLASw2u+tFXlDUWo8NCy6L/V5w1epZrTPxs2lLLXNO0aZZ/fqi
         Un1Q==
X-Forwarded-Encrypted: i=1; AJvYcCULDvJoKL/0S9qRIyMssUvsM218Og98J7AvjeW/pnJC1yYJmiDOV2gmB0mhJjJwRAY53jDXYAtenDxqbQBYcTmWQIDd9XhjkTjQBw==
X-Gm-Message-State: AOJu0YyrVA01ZL2BVmYOe1P/StvSQto9E+e1LIFoGY+swIAK+X3PfOlu
	6T84UEIqZHuz3aXus7oZjAPVrjYrVeBjNtCujfFICrgq2cr4hEjVSnkXjRSTog==
X-Google-Smtp-Source: AGHT+IEL58LbYxlBBeN18c2RvVRQC+ZIyhfJ0rX5w8lvsXWRLgTuRmFh+TgKTeiotO7VuCrRGTZyVw==
X-Received: by 2002:a17:902:f689:b0:1de:fbe1:beb1 with SMTP id l9-20020a170902f68900b001defbe1beb1mr225765plg.7.1711743109564;
        Fri, 29 Mar 2024 13:11:49 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id e25-20020aa78c59000000b006e6529c7d75sm3376947pfd.3.2024.03.29.13.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:11:48 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:11:44 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 06/18] platform/chrome: cros_usbpd_logger: provide ID
 table for avoiding fallback match
Message-ID: <ZgcggNwgH25rWqnw@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-7-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hOhqASqjoSJjHZPV"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-7-tzungbi@kernel.org>


--hOhqASqjoSJjHZPV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:18PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_usbpd_logger.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platfo=
rm/chrome/cros_usbpd_logger.c
> index f618757f8b32..930c2f47269f 100644
> --- a/drivers/platform/chrome/cros_usbpd_logger.c
> +++ b/drivers/platform/chrome/cros_usbpd_logger.c
> @@ -7,6 +7,7 @@
> =20
>  #include <linux/ktime.h>
>  #include <linux/math64.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -249,6 +250,12 @@ static int __maybe_unused cros_usbpd_logger_suspend(=
struct device *dev)
>  static SIMPLE_DEV_PM_OPS(cros_usbpd_logger_pm_ops, cros_usbpd_logger_sus=
pend,
>  			 cros_usbpd_logger_resume);
> =20
> +static const struct platform_device_id cros_usbpd_logger_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_usbpd_logger_id);
> +
>  static struct platform_driver cros_usbpd_logger_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
> @@ -256,10 +263,10 @@ static struct platform_driver cros_usbpd_logger_dri=
ver =3D {
>  	},
>  	.probe =3D cros_usbpd_logger_probe,
>  	.remove_new =3D cros_usbpd_logger_remove,
> +	.id_table =3D cros_usbpd_logger_id,
>  };
> =20
>  module_platform_driver(cros_usbpd_logger_driver);
> =20
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Logging driver for ChromeOS EC USBPD Charger.");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--hOhqASqjoSJjHZPV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcggAAKCRBzbaomhzOw
wp6CAQDZ4IPSXJWCQwtAiu25DxG5FmLKai6jWzCOofpAyGyOiQEAgs8jaeM8T1OV
pUoh3bLUDXyza8oOtFZY7Eis8bue9Ao=
=H648
-----END PGP SIGNATURE-----

--hOhqASqjoSJjHZPV--

