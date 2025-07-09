Return-Path: <linux-gpio+bounces-22969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C8AFE2E0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 10:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DD893B2804
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4403127AC44;
	Wed,  9 Jul 2025 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvwkbmO5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B297A23C4F4;
	Wed,  9 Jul 2025 08:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752050369; cv=none; b=U6qRkzB5QHbfWxt0QjQrtdHtp7/iyFwAcGgai1l7uZ7YuyErLqmC1sOm3C/ODsDihxFTds5lMiF0FtolbubpuKyW+U7AHMzgOy2pVGph7qGopl2TLE4nfI623XoQrnF+xnLIhCW9n9wpxpX8dq6OQ3YOJcf92UoFM2NofLuhwWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752050369; c=relaxed/simple;
	bh=jw+CYIkKdcmJyPvqlIXki0pvPJ2u1aJPGMuza2GGcB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FueVcq0zVc619Gw/a1D7FJ8etLXS/vvohYSJgZsyWNThDwBIlzVWOUIyAPie5iBpcM97yGPN5rp0xTjt04XEladru6M7gC8UCuiN7llRz9evvy8592puADUeOtWyoY3u56yO6cwv8fbvhGOnyoCB3T8e0FXSEd1ogp82nbvo+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvwkbmO5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748feca4a61so2848588b3a.3;
        Wed, 09 Jul 2025 01:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752050367; x=1752655167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jw+CYIkKdcmJyPvqlIXki0pvPJ2u1aJPGMuza2GGcB8=;
        b=SvwkbmO5oFD0wRT1k01bXHajlMxhTMBVTvzznUE6VArjRIpN+BfAJMsIJE+RkSx4hj
         MAwW7aGBMWB4+6dOsk388olCHDNnd5hkmxLGAjtVp79VzBYlHQo6tbLDG+30V1HNCVYb
         o0vjrYbMKEX0KkcxUCOgdinGXGNq0hMMxZ8ubAD99IxwMZtg83JRVqvLjJ8RRQslgZ+J
         +rWh10VGiEr15OyHyYfUWAoFJf9jcuCbbj42HSPmwxQW/b2RF9CFifdqT2Yzc2WLKhGl
         pPHgshG6K7Jvt27+AtSt6HLXBPYr0GslcwN7HhBJB/KqzrADULN/AeeB+Z8eFq+JUNjp
         AuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752050367; x=1752655167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jw+CYIkKdcmJyPvqlIXki0pvPJ2u1aJPGMuza2GGcB8=;
        b=kUnWL8dfvEVyNeCWPKMWH27RN4H/+0K+RfxhLOujhA+kmqXJKN0s9saxQViITA6wMn
         3syShZUhdzmmi26zU+SVjg4WIuGAUkbfEIm6hsc1oEITvewOU9NZCpMpmyY1AZbYXh+V
         2s67yoowDztAtDuDepDSHaAHMk5fczNBzcGvIdjqS8Sbl+hP6w3HkfuEHspi0s6VGuyI
         GpzscXiW23InXh2tPFAmlWDyBo85ct4IV8yUa9K6gR92PcKJxXMgOzT/yw9iGJ0O5/4c
         GLAGQ/ZzGJAhN8EcLd8qDOBnJLa8/9dmav2spXV3CuTaWG9aPdqb9pHYZ8sbq4EphRje
         Hlrg==
X-Forwarded-Encrypted: i=1; AJvYcCUUp0uzpiDpbZYnK+Hsol/OrEPSQSyV2fRhxx0thHCtB37uGCmTS1wSrI8v+zqVWGCM3ysMGaKMBVmVKGFi@vger.kernel.org, AJvYcCX8n8k1vvAwbNZmn7/BglgiqJuGCZtk+Xy1RKyFIsSGk4T5T3421WrV6p2du/grgWxOvAFxr0WZEk33@vger.kernel.org
X-Gm-Message-State: AOJu0YyNG61YPqE2NAaBIGJDCH8VAkNTmqfF8z5JsBZULJVpLbQRw9GX
	tewJ+vY4G4ECeJ0MsHILZoxaVLe6Ixt9VVdMc+MLPHkYXPdSFbf3XjlHO+glWQ==
X-Gm-Gg: ASbGnctuh+OHb5TqjvyA6ncvN0I+Q0GEeNwM0Ib5ZLVYGmcnGnX8sj/ctVsEJHRnVC/
	gvzvbphQRbGNLkp+sWrhfVRqRcFls6VWpJfCLAHE7dPdc9GJefNIBt4fqV8MeDoLRJHZvCsomgr
	gQcUQFe9b5kk1Ug172DwyaxhnLG+s4ExeqaUOXM9s6cBFNftu18SoTF3gxYvpzTHs+YMiXCqc8p
	vYlZTjDZeePqzgQhxbSfRcF/MmWbh/rqWX1d7yI3GVlrfyTrPG5UBMBYtYNnQGbH7UYGasuZ7tO
	MKd72yKHKkUlPdkzE3T6UnKrdDAwYwhNq2kEVHrHr7rrzoVWDJLlblWKXw5gOA==
X-Google-Smtp-Source: AGHT+IGeQb7YA4Kh/wtLW9ERhlLfpjfUawjjj7HB5go1mIIevYtM9oDiPbKwk8TXFR/cEpyhIKnQxg==
X-Received: by 2002:a05:6a00:218e:b0:74c:f1d8:c402 with SMTP id d2e1a72fcca58-74ea643653amr3353084b3a.8.1752050366814;
        Wed, 09 Jul 2025 01:39:26 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce429b34dsm12644021b3a.120.2025.07.09.01.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 01:39:25 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B55D24101950; Wed, 09 Jul 2025 15:39:20 +0700 (WIB)
Date: Wed, 9 Jul 2025 15:39:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: remove bouncing address for Nandor Han
Message-ID: <aG4quC72hnOWVFVH@archie.me>
References: <20250709071825.16212-1-brgl@bgdev.pl>
 <aG4eT557hI8AT38G@archie.me>
 <CAMRc=MehnbMsYj9EW3P6T-20-tYBBJ1CeKUCf8qRxva3UFdpzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sOgHTdlUg2JX1biY"
Content-Disposition: inline
In-Reply-To: <CAMRc=MehnbMsYj9EW3P6T-20-tYBBJ1CeKUCf8qRxva3UFdpzw@mail.gmail.com>


--sOgHTdlUg2JX1biY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2025 at 10:12:56AM +0200, Bartosz Golaszewski wrote:
> On Wed, Jul 9, 2025 at 9:46=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
> > Shouldn't the driver status be orphaned?
> >
>=20
> It falls under the higher-level GPIO subsystem umbrella.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--sOgHTdlUg2JX1biY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaG4qtAAKCRD2uYlJVVFO
o1FPAQDf2nuE46Fyy8mOucs/P/poZOXcuLCDM4NQiRTVqu8FxwD/R32ajCMR+Ns1
FkOZLF2VPjPb7QMsPepJORKgu/WOdwk=
=lx+e
-----END PGP SIGNATURE-----

--sOgHTdlUg2JX1biY--

