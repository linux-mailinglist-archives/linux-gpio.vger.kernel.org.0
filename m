Return-Path: <linux-gpio+bounces-7782-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFA991BCE1
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 12:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC6B9B2189E
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 10:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31D9155C96;
	Fri, 28 Jun 2024 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KeHDYMX6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766E9481D7
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719571909; cv=none; b=X5uPxfLbsWwTB7hOpBM8t5/n7rPzZWdrxJR6KasI66HxbxmqvjaSSx1S7UVBYmBdeoV9n9vgAPTXAyPUTiCbvZL15BrCRGz78sCFMp7u3uvGPGD5d4kKKIxo6fg6GH3Tc15OuYNN8PcIZy8rZiWjjh/c0btHtlbdjv+AZsca3cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719571909; c=relaxed/simple;
	bh=yC3zrmJsDFn4NNsURX00uMCRtNgsdOVTIJqhvdm5cQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVirlcdzCrSnWAKcwRXgt3SxeEkqWCYr2vC/EZ9VyDfElzO+RQkH5sZSzDCod3DZkg/q3ubYiXmFRA92k+nekOIEzV9gG/Lvm4n/xU+lDCWii/x52g2GNedBI/ZvO+9eFPWVYITIz/I/R400rv5xNIPsGquRmF5SN49sDP6DhZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KeHDYMX6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42565697036so9718385e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719571905; x=1720176705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=24rzTIfM+vOUQFqHFBXjGKtWGaOLrsXGcAgDzPUbzu4=;
        b=KeHDYMX6sQHen7GTIcU1mBqop+EEf9dirb6BXudSsp0MJhwdeSSBkzShPfDBCqcPLp
         rMUC0tp+ExwNPUYJ03ULsuoF0h1JLbWLHgTLmCMimR+rjCSa4LdgnYZ/+FAxS2EuO5Ai
         oTZ/a3aFE4ge5NGdiVRBNQVydkpAo8jEG64BfqK3Am4MNOzLdewBryW6oDyg4hAT5WOi
         +Mk1kGmJgjPllI80jERykJ+VmQdAyiHZ9dACo0unenWC9RzIP/kGNxAV9Thn0ifIkYot
         UdYOMTowTQTMGVF5GoCxLRzU5MoRSvizg0/YQFc/QAtZxWW71n+/ZaBYADPm5eGp2Ayg
         +GyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719571905; x=1720176705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24rzTIfM+vOUQFqHFBXjGKtWGaOLrsXGcAgDzPUbzu4=;
        b=hcA83nLgyW3UeFA3tBCOYR2xrgP8ptQAHZ/4kgJGOMPsvaCbF5kNXxoGZXBhCbdRXG
         gDqDT9bhB4Fa7IYHlOW9N6B0Z4RPUlgwcNywrPfoc4rgUXVlYgqlZoplcrd7figiuua3
         ihMH5kJLPM+uPxwHW6yopOmQIhSANvVbqmtmq/T1agKsyW3CWbxNbwE2ASo/egftozKE
         ta0mORGXCllzmp9z02gM+wcHTirrBYW+nh+Qj7/vPfeIJLCbZGBG534XjNLaRVP83c1f
         zsbOfPin2a9V1k3VS5NAjzaYnQeu0Ha9GpgJDuYtT8SzZyJ/os2t01a5ehISI6bkyRIM
         G95A==
X-Forwarded-Encrypted: i=1; AJvYcCVdlZoI8TWK5fMiWeeFC/DjbiyYxAz/r7pi2LnoRl1r3U+AaCMy30FP3TzxufD1o/sDQsfbKb3eMrB35zmZCu7d3SEIv+mP1VdJyw==
X-Gm-Message-State: AOJu0YzdBhn9pvkBVhmRxCMdMaHNdbLZVguKKWRJMrCmxbu/RgqNqBtb
	fA8SGjTT61lKtE5JgsD3VV19QzqcrAkDxkxU4WA9RqtIxIsSyIB2X1oUcv/v+wvURyszL4sahd2
	r
X-Google-Smtp-Source: AGHT+IEk/iGdd84gJ4j2qvNNhASVwVZ9UV0L9RuSnlH6TwRAjAnRiiHru5Ptw881AQ0IzfYy6F1GzQ==
X-Received: by 2002:a05:600c:1616:b0:421:b65d:2235 with SMTP id 5b1f17b1804b1-4256d4246f3mr13155895e9.0.1719571904866;
        Fri, 28 Jun 2024 03:51:44 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4249b4233b3sm84824425e9.0.2024.06.28.03.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 03:51:44 -0700 (PDT)
Date: Fri, 28 Jun 2024 12:51:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linus.walleij@linaro.org, dan.carpenter@linaro.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, 
	kernel@pengutronix.de, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 1/3] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Message-ID: <dldl7dkdcsuajjjpg2pczfnupqrsghmpz27i45xi5beeou5ntg@y2ysounw3pqq>
References: <20240627131721.678727-1-peng.fan@oss.nxp.com>
 <20240627131721.678727-2-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fbfmjvvswzyejj4y"
Content-Disposition: inline
In-Reply-To: <20240627131721.678727-2-peng.fan@oss.nxp.com>


--fbfmjvvswzyejj4y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Peng,

On Thu, Jun 27, 2024 at 09:17:19PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Use scope based of_node_put() cleanup to simplify code.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 43 +++++++++----------------
>  1 file changed, 15 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti=
/pinctrl-ti-iodelay.c
> index ef9758638501..f5e5a23d2226 100644
> --- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> +++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> @@ -822,53 +822,48 @@ MODULE_DEVICE_TABLE(of, ti_iodelay_of_match);
>  static int ti_iodelay_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct device_node *np =3D of_node_get(dev->of_node);
> +	struct device_node *np __free(device_node) =3D of_node_get(dev->of_node=
);

of_node_put? -------------------------------------------^

Best regards
Uwe

--fbfmjvvswzyejj4y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ+lbwACgkQj4D7WH0S
/k507QgAp3CUpkL3MAeTxcSbGb2q3fYllnUF2w6t16mJ9xh6+hDLS9FBcJ6O4AyY
kfpU0V1qpde9069gwMOiEFDkWetC+p0oivQ5VP5/+qesfrOrP/Xlr+TRL1zTtv84
OoV+pxdYC5nFaHgtymb4Sj9ixL4HpxAdlZ1gwF99BtJK/qW9JymS3K/DOVzsvmwe
7uIdatoBkLDNIf+QsByESnmWnWsdv0qeUq00WBUCX62TlAcZuzjLhROUz1Odgy75
no4hamGZVW4Q/fXIFEyWWgAu5YLTGDZx5c5bI4nKYuwscGDwRbQ7xiGfjIcYgEOZ
AfMzaxHv9AbFEoueeQ6q0rfMts8XsA==
=uBDP
-----END PGP SIGNATURE-----

--fbfmjvvswzyejj4y--

