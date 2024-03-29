Return-Path: <linux-gpio+bounces-4903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB773892504
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 21:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72EADB23471
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 20:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE2C13B5AF;
	Fri, 29 Mar 2024 20:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4T0aDZ9F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7717213B59A
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 20:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743220; cv=none; b=QuZK0X9635AoW6t/7yo6MLjvJGBzUaiQx39cqFi/ubpojS0PlTGCMfM3gVj4JINVbenFzolsaCNhcoCA7Rcdv8YOsREKft0F/WK+S1p+ZWJ33dN1i2/6ve/P0vFtLTlqkl9sXHqqS7KZfbOZRBQhqDlc1psxdVvbIefEEHjOgFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743220; c=relaxed/simple;
	bh=1CIhbiDhLdPetfy8JNPZBtZ4Bo5ffBYFYyqo2HebwIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PE2RqEHVDd6cWppAhWtL1h5Cysq+WdhbO8mcyLGQaCnlBRKEESzykgkRB0JpPunVVUkApx2ONq7qRdmtShoQJVxg8R8Yi/lCxA7nflu5vPCS7xqbTdq4xnnEA58S7lYP+4hfxCCs9jd/01Y8sCbiywReE4ACgBOkEhpGUJvofHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4T0aDZ9F; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dee917abd5so136735ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 13:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743219; x=1712348019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qWs7zN/LFor0Uf4kjH3ZAhI6dar6SefwVzRPkQY1ryU=;
        b=4T0aDZ9Fm2QPaJAKCaVNYyyYAO+oyDf/nrd5B58/e1mrG6ymJjdu0p9xHdF87cThAs
         3RAAPY69k5SbPV3UYWlRqYm6jgc4nQGeRNq1w54wRd+vru99Kl5ub/sYhrCMWu2Q7GLH
         vPCJribBXYTwjVwKndWY4yzy72KeZ/0Hr5mRaTMS9f6pUH7le25CzRXFJCVA3nVqHaCz
         73V0sgP+D8tpLpkXdKiZmwytfcDJ4rH98SzvsfwUsxLP61A7Kodp5qVw0+uGHmtb8pUW
         vPZ7yUFmEYPwV1wiyrHTV2il0EMngRIcGB005kuDcoYv/YnlWj8zuONRE1DD8InHhi0M
         GVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743219; x=1712348019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWs7zN/LFor0Uf4kjH3ZAhI6dar6SefwVzRPkQY1ryU=;
        b=oWq0EZtxdKVOEmewsCG/1Ragd4FU0nBB/4ptDqO3bgq9aPRsVwbtlKm94qfd0RrveR
         OAewxr+qaZax7CQdqkxCalS1bM0D9JXHN0t9lXfytYxIVFcdRwfwvg+YibNJWyO4+Daw
         HY3FxbUJTPPJG0+HB3mM4KmhX/3GmRctE1FHQZn6ARs7XhnhIhuXZTVuR5QFe9Fk6wbJ
         MGGw8KqIJDHOIAYaMBETIB7Ngm0rkfQyFotW4L/+ZxZ1QuLjdChxxJwCSWJEUvSq8JMZ
         5KisM07UoDgGS80GRT6Y8WsT39l8nQVevxXQXxoE1zrEPw6tVAUI/uK9ZIO+DlIY88wf
         cQoA==
X-Forwarded-Encrypted: i=1; AJvYcCVXcIq5X6Q8SEhJpMKs4icSOGYp+8a0iBYVCASnSyyV1oTxCGiB2AMBd8eDJLtO+ju4maAATtP0II++TSQK/XLDsMSmkUrtTOqSqw==
X-Gm-Message-State: AOJu0YykO8qZ2MPdk2/e/Vh7PezhxM7NLWawp6zUTIT+EqnqefMkBGbu
	3nluDkGhjRMJo0BUdDKYc8So4BlRJJgyo8hR2jTfDWnNTa23mRUpCFqk6IXK9Q==
X-Google-Smtp-Source: AGHT+IHsexnfMRJbpIHl9fmuE3u0hPgMNGbbB4LfvtV65/D832Ij+scd+b8wqjyQ7qu7XIMJR5vcbA==
X-Received: by 2002:a17:903:124c:b0:1e0:984b:6215 with SMTP id u12-20020a170903124c00b001e0984b6215mr270043plh.16.1711743218318;
        Fri, 29 Mar 2024 13:13:38 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id c21-20020aa78c15000000b006ea8c030c1esm3371937pfd.211.2024.03.29.13.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:13:37 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:13:33 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 08/18] platform/chrome: cros_ec_chardev: provide ID table
 for avoiding fallback match
Message-ID: <Zgcg7bAnp-tM_-oz@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-9-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wFqlCGmJIgYSWWvX"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-9-tzungbi@kernel.org>


--wFqlCGmJIgYSWWvX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:20PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_chardev.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform=
/chrome/cros_ec_chardev.c
> index 81950bb2c6da..7f034ead7ae4 100644
> --- a/drivers/platform/chrome/cros_ec_chardev.c
> +++ b/drivers/platform/chrome/cros_ec_chardev.c
> @@ -14,6 +14,7 @@
>  #include <linux/device.h>
>  #include <linux/fs.h>
>  #include <linux/miscdevice.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/notifier.h>
>  #include <linux/platform_data/cros_ec_chardev.h>
> @@ -403,17 +404,23 @@ static void cros_ec_chardev_remove(struct platform_=
device *pdev)
>  	misc_deregister(&data->misc);
>  }
> =20
> +static const struct platform_device_id cros_ec_chardev_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_chardev_id);
> +
>  static struct platform_driver cros_ec_chardev_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
>  	.probe =3D cros_ec_chardev_probe,
>  	.remove_new =3D cros_ec_chardev_remove,
> +	.id_table =3D cros_ec_chardev_id,
>  };
> =20
>  module_platform_driver(cros_ec_chardev_driver);
> =20
> -MODULE_ALIAS("platform:" DRV_NAME);
>  MODULE_AUTHOR("Enric Balletbo i Serra <enric.balletbo@collabora.com>");
>  MODULE_DESCRIPTION("ChromeOS EC Miscellaneous Character Driver");
>  MODULE_LICENSE("GPL");
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--wFqlCGmJIgYSWWvX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcg7QAKCRBzbaomhzOw
wvrTAP9XyHBI49KZpUJOqS3U6D/DlyctZOrtzWcMGwpPYLOnSwEAn6YA3cLIsuZd
54v611hE+7u8dPasuYmhfLU8nNUfqwc=
=mzdp
-----END PGP SIGNATURE-----

--wFqlCGmJIgYSWWvX--

