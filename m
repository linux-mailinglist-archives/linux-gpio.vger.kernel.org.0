Return-Path: <linux-gpio+bounces-24334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB6BB2420E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 08:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02CB8560B46
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 06:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F350E2D12E3;
	Wed, 13 Aug 2025 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hLBb8HA9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDC82737E6
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 06:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755068194; cv=none; b=rfOyaVJxzEbPAWFoSbKZ1a2uX/rCrywmaneeP/cEsza2kdy40eP0Q3CC71TMyPTssq5PE9u+AnYzaQNj+lYuSi8nMvq1KI89Q68Hy8ibFU3vUELWqTWiKFKx1xM681jtbmJiVmgVU1/y0lWnkF+bnStYaQVCswo8pvmyN89wZlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755068194; c=relaxed/simple;
	bh=M4wIhxgOb6vpgKdc0zFPqT60WA2pAA8L18d2EEiaT2o=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=LXwqoclC8jzac4v0Dh9WTcSbtAWtk668ApkqRbzJ87hDBE3OBD5Gj26quw096p6arIr1qRcTb6F97jUJLT5WVoEnyzmAPPb+K0HYD3yNA+5WfcNK4FQD8w/MzDpJck+xp7kcgGHJXSArkyJQHGH2ho5S8vj2Sod0x6kl6TOzbxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hLBb8HA9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-af98b77d2f0so1162834566b.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 23:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755068189; x=1755672989; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zczcb7AU1i+hc0ejkWDrxlcyhZco/qyi0e115Ch5Q5Q=;
        b=hLBb8HA9bsv3Eng6w4qlV6AmFwKwdRxex+MK+Y3Qirgy/WZ8V7VI2CU/jmPbS86bSq
         LWJQwESDOvSJkPdZ4uIELzjbOLSQ09Wm6c4Onutk57LevaNcPK3Xn6f5ZsvtduMfGyHN
         ddt31slIZk15UXBMox9lsK/mS9ZUN7lj2jFTcTnNhVqeM9NC0eHgidV8FMkSGLzZREuz
         wFIcO1OfThTMp+xHlTE89eYw8cDggPC0Ru54M2tLTy1ChRDA2tFp7Fhds/9cogYr/5qj
         mNx3fmmIeCqpK0laU0P9E81AozVEjIb2xLC0Aaelhfsq5qvahK40u528NdPPSKN6TRkZ
         tsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755068189; x=1755672989;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zczcb7AU1i+hc0ejkWDrxlcyhZco/qyi0e115Ch5Q5Q=;
        b=n4vuOvULno4zNcUlXRHLJ3e1GuQJclOYf8Q1AwTkA7j7fHxRGJhkdKX4TEQItN94yb
         6dh6EmzqLFRBz54HUoOu9s0jOYG3BwHyWCwUnXn7hNQT+BbltLf3IIQAcq3iAp3llI1Y
         YKGYiWFq1jkU9Dibirpftf7luGS9hsfvYYl/+ow1hL6OJXSYt71acvn7ws+ku24a3fLe
         wsmgFTHq3XH2HyIm1kgiCQ4H7Lk0Yo9cp9sKpOsV3r7hupZb3pwfQG3vgnNoZKjh84Fj
         30AVKMta8ApEESAs1VxYB6IBEctoyCM4gzB2/+U5g7qMBV4Ty5V5O2Bhae/vEp33t2Y3
         6TSQ==
X-Gm-Message-State: AOJu0Yx/OIl+3zPK5mWGVOhzqBnodLJpxxe9tuP4P3SBg2FlnxQTwRXL
	m6p4klz/TwcyNLOQzn239cNQGofe21VkjRatPuo0cedstWkHwI4Lypbuo9yKSPhAPhU=
X-Gm-Gg: ASbGncuVdPZuvBuiUPYixIS1SuEHYg5O5kUzI3WBgaO1HuE7QhxrwuNi9/7I8cvY00+
	seZiGXTFrUeoEXIjyALEaduGjwpNIxeJLfz4yOk8DOUBZrmHfpcyzWOURymDGXN+BO9U8wflYSk
	ku5Okx27An09e38IcAdPPF2TrGMFSmKg0Md9B6bQvk6yE1X7obRytVthpt9wGwFBKHPHWEJ5J0+
	VxTAAJdufQE3Y/FUeDpFOddrHrcD2ptjBBViklJrRwa37e/9ooJeKx4P9OJUODqy5rqaEaY5IIi
	FpdhEVvNZHRksRZSzBWufigTfWJ650CdsdiSjb+tspkpah4F15PB6LwfSxBLBfuTMz4eIlDMMlY
	=
X-Google-Smtp-Source: AGHT+IEkXFoXpHa4mGZHrT4qqUx8UQk8XuuVVS0YkKcVK5Cpy/iXaaP0YhsNfYMooC0wuabihnzEbA==
X-Received: by 2002:a17:907:da5:b0:af9:a1e4:a35b with SMTP id a640c23a62f3a-afca4d451e0mr205181266b.7.1755068189351;
        Tue, 12 Aug 2025 23:56:29 -0700 (PDT)
Received: from localhost ([2001:9e8:d5b4:9700::f39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a9113e40sm21320696a12.57.2025.08.12.23.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 23:56:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 08:56:28 +0200
Message-Id: <DC13QYZSZI3M.11FB0H4NH0O9X@riscstar.com>
From: "Erik Schilling" <erik@riscstar.com>
Subject: Re: [PATCH libgpiod 04/10] bindings: rust: update errno dependency
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Linus Walleij" <linus.walleij@linaro.org>
X-Mailer: aerc 0.20.1
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
 <20250812-rust-1-0-0-release-v1-4-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-4-372d698f23e8@linaro.org>

On Tue Aug 12, 2025 at 2:10 PM CEST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Bump the errno dependency for gpiosim-sys and libgpiod crates to the
> most recent version. No code changes required.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/rust/gpiosim-sys/Cargo.toml | 2 +-
>  bindings/rust/libgpiod/Cargo.toml    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim=
-sys/Cargo.toml
> index 7099abe41226236b9cba70a36643b921021952ee..52ed43410ef5154a57a15e362=
344347a2b2cee57 100644
> --- a/bindings/rust/gpiosim-sys/Cargo.toml
> +++ b/bindings/rust/gpiosim-sys/Cargo.toml
> @@ -15,7 +15,7 @@ license =3D "Apache-2.0 OR BSD-3-Clause"
>  edition =3D "2021"
> =20
>  [dependencies]
> -errno =3D "0.2.8"
> +errno =3D "0.3.13"
>  libgpiod =3D { path =3D "../libgpiod" }
> =20
>  [build-dependencies]

Hm. Given that we expose types of `errno` as part of our `Error` struct,
one could reason that 0.3.13 is setting a bit arbitrary version floor
and 0.3 (^0.3.0) would allow uses a little bit more flexibility...

But that really only becomes a problem if someone pins this dependency
to a specific version, which seems unlikely. So I guess this is fine.

- Erik

