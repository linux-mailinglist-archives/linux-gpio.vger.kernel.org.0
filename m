Return-Path: <linux-gpio+bounces-22698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113A0AF6F3B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0B5E3B0AD3
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 09:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B51F2D9EF1;
	Thu,  3 Jul 2025 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2xRyu5kp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BA52DCC1F
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 09:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536296; cv=none; b=IZKIIXXleP+415JMW80a52nHdDglGJfovlvOly5DPF3OwmsKK/UIjOt/yynmphkHVa1Aw7e502eT3d4lPxX9rioXTIYxgDIeQEEKzTkXFL9QKRpJD4xDo1jr1xVRWdPKL3lFAqHRM0S/FyfmPrgvSc1qcf9hFeQid01WGN8z8Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536296; c=relaxed/simple;
	bh=YpTyljxwyw07U4P0gHb4gnrakvNkh+/hIrM+ABJ+fj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qb7koBwEXRHHOrIa+aZNmYKz+Hg5bPncyPD5Qz30CVk4NbaimS+8uRu2j9KSKtLnK/DaYgOK7izl3cVjOqZGpH39LCVU4pd9SMPJ3JomOMckUrlUwSN9mrO9HG7IU4bUpyX20NZt/PQ3FzfmoOgYf8DPIvCucJCVyKFwt4uoFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2xRyu5kp; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55628eaec6cso1644441e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 02:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751536292; x=1752141092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm9C4xWfuuIKIxeM1FG7nAWF3Huvmfev7MnDCCzIEeo=;
        b=2xRyu5kpBk32c8BFiGQ2GK2WOFFJHt38z+jgrUYl5ctvpo/ZGXTPEpt3mUnkXwlSnc
         ONmpIfLJPriVZ9pppbTFbxn7Bc1ccQb9CZLX/d7Mjy2wWBuYacI19cLhdswRa8suDeHC
         Vwviu3AzO0wopJY+YB5NtxbVIwQ/cVE+thlICj84t5BUg5Z8kqEmrKM1+v1f010xkmxv
         NnIQb9F7JWSyn/L+jNjaRL7mmLCiyJVqYn+cdC62FTCgB8JEyC7R3FkHBv+2O+T9lGzb
         ZuFcLFr9a2gSr6sX7eyaDB7hKh5bPq4zJ/PQrGpiP/8OUcnWtSKVy00b5dbaJbphxqJQ
         Hgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751536292; x=1752141092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fm9C4xWfuuIKIxeM1FG7nAWF3Huvmfev7MnDCCzIEeo=;
        b=pa/RE5l+BJYJZs0aDIJ9mDHkKCVbRIcmXwnlwodouKOTtg2xb63N1BZ+vhKOGYFGKI
         drieNMgw1XDlFjHwcVRQctfEkL1ejT5IrpLUpcDKjRjdVeBB/gVIQZJiGJ8nrPk8H+22
         9hk5ydheglZCSH9czuFmdoMrzRGC6nXjoFEzJKhuUBjeBr4hj2d9Gncx7dtnS/Mj1Ge8
         qPjeWDocusAIgK96zooMysaYEMLEjk7xI5NWR7MXW4z3hnq6eZbbUhYCGRZn+U7eZ/zM
         RQUmXPjTnBQ9E/d/JairFcANdk8DnEpy90VIT940b+38VuCy5PiUtbqCdngdskv270k4
         qcAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV59LYK10lqpW/gQEKaYCNVXGiy/xxTOiom2jvxy4QrFs9/m47x4qcVJEFzGzQawTt7UrSSevf+VZxQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9mCrMF6o4aSbUjziKljCO4nJk7rnhoBhn5QOIta8AI+iIax3A
	5B7HpT1mXEyCbWNQsHjnFEPiT6KpzS95ey5f/xsMhr/cSCCpXd0ufWCtFrmo2yKgfwDN/hrCK7m
	aHGrj7VgYHlSdaHKBozgEO8r16X6//YYa/CTyPAG2f8BevMSr9b0EwrM=
X-Gm-Gg: ASbGnctioWl6+otDtjvhi8SvCKzsnVD0rwHTRfKU9DDgfntB8Z3q32YpEXQBRlPpV80
	6O5py/VmOcK2XryD2kwOdLZ+ELpqShGci/TFxCdR6Wzh37VcfnRLpmN6j8wVmfAhK2lfdlF3Tmr
	aDyAn+EczoupER5BoigctWGymchO2ekz/rJPoYWE4c3j4PGIvQYjTK3bIGDALHpgLAEuGlPnOdC
	Q==
X-Google-Smtp-Source: AGHT+IFNLwhbBpukbVu0dvBLmLJ9QPZOvXagKslA4IQMG8t7aHrgsvuCJVnQ/Jp0X0+rUTcLV0jdkLs/XNf8N29ZrsA=
X-Received: by 2002:a05:6512:3b29:b0:553:36b7:7b14 with SMTP id
 2adb3069b0e04-5562828523bmr2206635e87.37.1751536292037; Thu, 03 Jul 2025
 02:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702164926.2990958-1-s-ramamoorthy@ti.com> <20250702164926.2990958-2-s-ramamoorthy@ti.com>
In-Reply-To: <20250702164926.2990958-2-s-ramamoorthy@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Jul 2025 11:51:20 +0200
X-Gm-Features: Ac12FXyCwoICVUr3Z51apCKRhZU7x6W4kGidAOB345u_C9-RSlabdFl5B5KxSls
Message-ID: <CAMRc=Mdg8_Tq1PWAaOSzzPGUMu6-_3SvOy6F+n_Qv90arVyeLg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: tps65219: Update _IDX & _OFFSET macro prefix
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linus.walleij@linaro.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com, 
	jcormier@criticallink.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 6:51=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@ti.=
com> wrote:
>
> TPS65215 and TPS65219 are overlapping PMIC devices. While their regulator
> features differe, the GPIO features are the same. In the TPS65219 MFD
> driver, the 2 PMICs share the same "tps65219-gpio" compatible string to
> limit support for TPS65215 in this GPIO driver to comments.
>
> The TPS6521X_GPIO0_IDX and TPS6521X_GPIO0_OFFSET macro name prefixes are
> updated to indicate these macros apply to both PMICs.
>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-tps65219.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
> index 526640c39a11..3c762103babc 100644
> --- a/drivers/gpio/gpio-tps65219.c
> +++ b/drivers/gpio/gpio-tps65219.c
> @@ -1,8 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * GPIO driver for TI TPS65219 PMICs
> + * GPIO driver for TI TPS65215/TPS65219 PMICs
>   *
> - * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com=
/
> + * Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com=
/

Should be 2022,2025.

Bart

