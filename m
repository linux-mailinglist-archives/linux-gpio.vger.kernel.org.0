Return-Path: <linux-gpio+bounces-26980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 16963BCD044
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 15:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 795094FEC42
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 13:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966AF286430;
	Fri, 10 Oct 2025 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l44pI/Wn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EE61C5F27
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760101447; cv=none; b=rBukXj7TRDd+nyieAhclGNnlBWa0E5q52mrhFrmQvwDvO0L3bMBVUyF4DJ6aF9K1DouPyTY4Get+kQAJ3xVYhBCoJF6TgFGzn+wLJdLLyo7uG1f75sbVOYm5gxmlsBLzBzmnjl2Tky+QY06PAh5GbuuaekUUuMo6GAkftvpDAPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760101447; c=relaxed/simple;
	bh=2fBUTn5JHSmdXy1l08iLHS3auLWgcZKX0u7ZoOON8iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Na78GYxS9e2FL0Yd1S1Rt94spuZXBUvIiv9ct9qDOn/W/0rTVOKBcOo4tltIbN33f9I+98olpHRvemH23cnWd1645jUwouhsjKz8I03oPT05chTtXUePfJjzWDDydutHzafqGYkMGdBOT8NVGgzAeENLBEjsXtt633xVohcO1FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l44pI/Wn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso15838645e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760101444; x=1760706244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GUep6nRJRENnGzYGA7OV1aJqhmKF9x6S8pmHSkpOTbI=;
        b=l44pI/WnLyK6xvfT5YGbswVVnOFpoG8N07EtSssEpSuMEsomts9BqX3cd6I/NfmVQs
         LcFTuNrOiCjDHNT2+oZCI/VgdZHUFrXoBR+Zl8FgkijHCef5UfUHeMFQllBK4xkqT9s+
         m6i40hdKc9K5whxsAmgu0vRIvc7qnejs4GD5xkBuxArNEzaHf1XMlWDpeT+3MOCylYuO
         iAx3CMLKHNF+GhS0mKmHnnzgAY8xQqWKF/GX3kwAVNDlS+nelIbwFYKergT9Cn+WtXpg
         6GcxlaO0/rzvZLBnsF3pGAEbsYbhAmgD9//VlqM9PI6IEzTKMmOcMLlPm4sjXhQ+Dvk1
         389Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760101444; x=1760706244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUep6nRJRENnGzYGA7OV1aJqhmKF9x6S8pmHSkpOTbI=;
        b=dqf22ppxSWGykuyytHGlz+QKc22mo7eAEod3VP0qaqH746c8t2lAhwAgYJloJwuLLm
         zEtmkej0wNQ/ejYil64IpMlyn+735+IP9P0IyjP8VxEidKAN0V3tNXn0suOrQFDFbYqu
         ncFUqkqKPb8jvb2Gfb6NRcJOF5kFFKkhZtG9q/lg2EGnypHYhBvmMEij2qSDoY1cvPB0
         Yj4DMs01E90+iwAONtrIAE0M1FjjyPn3V/DT0+QTV8GO/SrD9JWmGrWhpTwSH7J10HNs
         HV2d9hu22GOwayczuvcTJqhUckZjcSJHz/cVUTJ/ezKqokw6OHocUugrlSgs5NZA6RLL
         Jl7g==
X-Forwarded-Encrypted: i=1; AJvYcCXtJCe1Vh9HYwrQasmjhc56WZQl1Xy/433qZ9fFxwEha4cVNN2cnwU0V+TuDoOX0FV033/+E7zRrpCe@vger.kernel.org
X-Gm-Message-State: AOJu0YxdtZ8c0mri+GGOhiOQTKmS7IToB4ZfFq05JTfLSRS7ax1klaw1
	tvWkQ+1jMqq/Rk/fAcN27ufNip5m7sIHq1QcQTFZSZABk62CBFyv81lo
X-Gm-Gg: ASbGncvw972xd95f2RCHOaep0/WpIeelWPWIbbLGKHH/rUrl+RfXM/V9Y/huUa5WC64
	dHcAZ9vcVttVSYtUPBIgF8Mg1DGxBaa+lu942rxQTnYCcfMxIeaat6v6X99dRr0rS/RmhnzWBGn
	+bhjC6AXAKHEB5BHQLOWd+NjO8mwNf4h/dwbV6FamVt3Y63RsVuS0iyUInLmfwKotsDyDrIBeYO
	8lSVvu0ToKXt/LzDPePSNqRgTPMau2YTy/Lu9YCmYKNuKU4OyLUph0htoTkhqo1VIst3BKSqotz
	ewJg/Dpijc2x+MLnEjgm1/24y13l6Q3R0aL7l2Q38BeisSVvQZFG1gJrMr/YApw4Zz3faydkH/c
	gltYlV96F1QixdLYrHmIL+EB/5hmtBeXmCeaWk6xKIO/2aCOwK8dzAtqxpSBV4WXFL7s38uGxxU
	i6UW6zRRgc8a343j0jPTf+As5cTtd6OkCYltAlMu0=
X-Google-Smtp-Source: AGHT+IE/ARTh5Bc+/UOnITq0Iw6DNobv8+7UuMp4WV8aSSdfi9Oc51R8SOVJL7vW64ESh0Zm/tV/Gg==
X-Received: by 2002:a05:600c:6011:b0:45c:b642:87a6 with SMTP id 5b1f17b1804b1-46fa28bbca1mr81018285e9.0.1760101443287;
        Fri, 10 Oct 2025 06:04:03 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb48a6069sm46763055e9.20.2025.10.10.06.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:04:01 -0700 (PDT)
Date: Fri, 10 Oct 2025 15:03:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Prathamesh Shete <pshete@nvidia.com>, Nathan Hartman <nhartman@nvidia.com>
Subject: Re: [PATCH v4 2/2] gpio: tegra186: Add support for Tegra410
Message-ID: <jcfsvqesvpvip3gj5gu625khah3as64lohpevjco5v5mlpekss@tq7u2g4iewsi>
References: <20251010101331.712553-1-kkartik@nvidia.com>
 <20251010101331.712553-2-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y3y5hlym57ezrkmm"
Content-Disposition: inline
In-Reply-To: <20251010101331.712553-2-kkartik@nvidia.com>


--y3y5hlym57ezrkmm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/2] gpio: tegra186: Add support for Tegra410
MIME-Version: 1.0

On Fri, Oct 10, 2025 at 03:43:31PM +0530, Kartik Rajput wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
>=20
> Extend the existing Tegra186 GPIO controller driver with support for
> the GPIO controller found on Tegra410. Tegra410 supports two GPIO
> controllers referred to as 'COMPUTE' and 'SYSTEM'.
>=20
> Co-developed-by: Nathan Hartman <nhartman@nvidia.com>
> Signed-off-by: Nathan Hartman <nhartman@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v3 -> v4:
> 	* Remove TEGRA410_COMPUTE_GPIO and TEGRA410_SYSTEM_GPIO macros
> 	  as they are not used.
> v2 -> v3:
>         * Add a generic TEGRA_GPIO_PORT macro and use it to define
>           TEGRA410_COMPUTE_GPIO_PORT and TEGRA410_SYSTEM_GPIO_PORT.
> v1 -> v2:
>         * Move Tegra410 GPIO Ports definition to gpio-tegra186.c
>         * Rename Tegra410 Main GPIO as System GPIO.
>         * Add Compute GPIOs.
>         * Update ACPI IDs.
>         * Set instance ID as 0 for SYSTEM and COMPUTE GPIOs.
>         * Added Nathan as co-author for adding compute GPIO support
>           and renaming MAIN GPIOs as SYSTEM GPIOs.
> ---
>  drivers/gpio/gpio-tegra186.c | 76 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 75 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--y3y5hlym57ezrkmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjpBD8ACgkQ3SOs138+
s6F57w//URrSrOC1Q7LkrOnqIzjycY+wbsk0E8W+eaDuBt6RlP8R2EyPUquLTKRf
NtBFtLaGjCwTcUpmOzD0gzlwY/Jjre3OeSZtLdkuwzcmeR8b/BCjz0h/1CXKroF7
bB8RFJ+Y+i7czGr6J965DjYGw0Ou/rHBQuoi1Ah8AHLGGk1FqgARILV2O/EE+t97
5gzuqqSkNAeacMb2tZzvObGVK6VXUNtaUBSkZU7N+tbOcuzxq85JYN12vHr0VX/b
KoHOLsXFI6J0yECazzk333cxJq6GVJn3luT5L/QDQgqYglMuDX7sPs2PvS0cXyVp
51zp6npK1fNVbB5D0SxT7VOryPmU39H48vnFWkLF7v1Ty/YS+f7jpBUJX+mYVc09
hVXChW8UdvQ8EKeEALrzhJ0iVRGeamYoaAyaOigbgcN9NI6mX08QeD6VmmY7vncF
wk6cxt0d9WRXOlOdTbhpWpEXocy/y8ulEV5nxI6xQhqatRIh+BEmNIc3G+cCjJIy
XTa7p+u6JA54DBU5JHJVILDReNb395cY4+yoVDbCxBqTuypzuV4ovLII6ZYNr5GY
3jzlsU27Q3cljqkbcHEbpg2GmkK/cu9u9AA8N6vb8ggzLdwUOS0JAPKVKEw2DaRk
oL4mi+DfX587Tgv5NUdrPNF8vrQM4cpwyAsbIKbuwbwz0xIShec=
=ZcE3
-----END PGP SIGNATURE-----

--y3y5hlym57ezrkmm--

