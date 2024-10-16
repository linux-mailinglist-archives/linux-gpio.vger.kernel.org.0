Return-Path: <linux-gpio+bounces-11419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D509A0566
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 11:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67413281129
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D06205150;
	Wed, 16 Oct 2024 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CeN1sePk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAF318C340
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070730; cv=none; b=BzaxsDv/m11yGUPD4t4Tq/RlCb5Xd04SuqBVHwRL/X05zQiFc8OCkYVSyVzLyWv3Iz6plke8sZb0u67gu3P49EjvIpJNzZpCD5CwYdKbHgo8wSDPhMU0co3ePReLYHUVNx5n7hA2NyBMj7b95L1ivXxyXuC7xuGDGGeD4uDl4PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070730; c=relaxed/simple;
	bh=CsGgD+qH71/AKiBo/WfF0YMK/W1xSO5fBqqJd4DYfSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REmZ7tRU5bEXMkv9VFm/MOrFaC1Ja+zPEe6jW1sI8XZrcpwwVOEqJI5l6U5T80lAp/a4CTxxBhugygXIHrGxMtcPSRa5v5wQnrSu1R0WHW/kCgTK4plWI3wIrjUKO1XoIRxNRxNffFeFcz7BRl+xkrk5xKf4ds9th/DlpxPE/q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CeN1sePk; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a99ebb390a5so131634366b.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729070727; x=1729675527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nAcAhz+WKByaKGZfhQyRvSHovNnJyQjvHY17d0j7nbE=;
        b=CeN1sePko6BupsLWMU5Bew+MiCam5HBqApyfr1bbevRByKdxO8Mj1gVG33FSykzRTz
         qpBJfd/UCTPOAtC2falu+3MZjQD7oBdXwIe+Ej59z8xlfYN1MMle4PLuAxphffw6lxPE
         EGvLt2k/dR+0s742UvxCYJ6cEGYAa48E1ZfBuMSiV8eeGYuhv4gu1QJDcPvWw6i7YtTi
         z2C3VI3E4o3Tgxno24j7f1hDK7Ak5E+WQRMNqdE+VhrXUFChveK+Lax+EpRxanXeIiXM
         1eJWuq6x+YKgvp3GaFAPPiTOt7OvkZ8nunTS4fn5VC9FwnC42Q4IytW3I9aHw/RMAwoO
         fE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070727; x=1729675527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAcAhz+WKByaKGZfhQyRvSHovNnJyQjvHY17d0j7nbE=;
        b=pXgRZLPCIp2GYw0gTARQCDi2CRJPRKPJwinACuXvV5ro5V2YQEib50a0JbwhZBsQxs
         M4gxaHeXn2MHUXEAc0MIsPTHsJ5UtOcB0X7l18KL4/UGZTvSsDzyFUwk5lbFTH9mxpe0
         OfofELyos9bKgRSc+YbNC6FplHWJ3//HS2vTyRvSNae544UGgtq9T1//bqqBk2cySNOb
         WjOz2D2oXiqO1NzxrJv3eEUQhVs5qa1cgky9OfXuZNjFzrvxyn+K/+qWB+F8gECpPWXw
         N6ff/cIOo3qUt2bR6WYOCYasuhSKMAANeVrEeQSfn0r1GgT0RxZi+SF34spnb45+Y2cv
         13fA==
X-Forwarded-Encrypted: i=1; AJvYcCVWbltLOAKFj8aLGwOPUfO/EGlxVuyf34extEPGTIBTVLh3mCRXqcJrxi9sdzMZWNiejOvCHME6m+WG@vger.kernel.org
X-Gm-Message-State: AOJu0YyquaUSFpfaZ5NaPZeF5fXSbSSoISef+w6o0neGpN91sQAKUzG+
	QmXuU8s3M+2l/vLZoIbmO4s5T6+jG40oTN9bfdKodh3HH9s6G+bCCE8Ew8CDUYE=
X-Google-Smtp-Source: AGHT+IGuH9rxVdG1k866GOE7xv2ukPlrZjmmiS/KSiq5f3JFKCZWOSxSvImth/A6E1KhcU5tZlcuVQ==
X-Received: by 2002:a17:907:2da9:b0:a99:4566:cd42 with SMTP id a640c23a62f3a-a9a332bd9bcmr393696566b.0.1729070727076;
        Wed, 16 Oct 2024 02:25:27 -0700 (PDT)
Received: from localhost (p200300f65f19e3002f38cf427133ca7b.dip0.t-ipconnect.de. [2003:f6:5f19:e300:2f38:cf42:7133:ca7b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29817520sm161210466b.114.2024.10.16.02.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:25:26 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:25:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, quic_tengfan@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the tlmm driver for QCS8300
 platforms
Message-ID: <c7ahyrbo3bw6vgfwqaubricap52muhxyhsnb5cfhzvo3n67dsr@gp6vehlfwblo>
References: <20241009-qcs8300_tlmm-v2-0-9e40dee5e4f1@quicinc.com>
 <20241009-qcs8300_tlmm-v2-2-9e40dee5e4f1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j5kcwsuh3x6dnxeb"
Content-Disposition: inline
In-Reply-To: <20241009-qcs8300_tlmm-v2-2-9e40dee5e4f1@quicinc.com>


--j5kcwsuh3x6dnxeb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the tlmm driver for QCS8300
 platforms
MIME-Version: 1.0

Hello,

On Wed, Oct 09, 2024 at 03:13:34PM +0800, Jingyi Wang wrote:
> +static struct platform_driver qcs8300_pinctrl_driver = {
> +	.driver = {
> +		.name = "qcs8300-tlmm",
> +		.of_match_table = qcs8300_pinctrl_of_match,
> +	},
> +	.probe = qcs8300_pinctrl_probe,
> +	.remove_new = msm_pinctrl_remove,
> +};

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers. Please just drop "_new".

Best regards
Uwe

--j5kcwsuh3x6dnxeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcPhoMACgkQj4D7WH0S
/k5wKAf+IPTyWzUJGyfnwvsaubOBtnB01M9oVSzRUcNzhJPT73Kfs+cV+EuTUZAO
BCLxBt2kYj7apexaqmUlQ1tXV4LKJg/b3HMSRRSse/p8/3coNijUhzWrkyecF5mz
4OiEhQ1+n08h+u3ewHZ1WqQFICNXmOvoeYZ1DoZYV+G0N3sPsFHfngj9luRiI/4A
fhwzWJA+0P3AWQQYWGMouOFZh5WXQXsEHwwfEUfBg7s/pyL7wiJtXKTVTx7Ziv1X
cd2LuwjZvlstCkQrnS6QRn9G9XuE0YSfE+H4vra5SRr6k7YaKqlY2OIKev7OFbhV
7KiwUUEE0UdVHFDIeXrvZ7lCJN/9/w==
=BODQ
-----END PGP SIGNATURE-----

--j5kcwsuh3x6dnxeb--

