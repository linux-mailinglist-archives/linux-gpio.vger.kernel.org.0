Return-Path: <linux-gpio+bounces-21801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4931AADF287
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 18:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 080F73A4C50
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 16:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6D02EF9D3;
	Wed, 18 Jun 2025 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b+Fy1SSO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286FC1C861F
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750263903; cv=none; b=uPJSDHtLCAwpXM2uRS3fkiQGVbScyp29KtCR0fgT5+dGSC4tLP6V82AnOupX2o5Ijk+EWoBhv0AddBhFjQTCPeVGpz/2YiMWtVEdzfFZE6ZDM/8M1ZST48Cw58MwO9pgk4f4IbWDsGA0RnHoFOJ2LILn6LKq7bOndFmvBlfsXrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750263903; c=relaxed/simple;
	bh=8SUTZJISnPl+cWNBsdFUwAF6yhxTIcuSAa64ljM8uh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kD5xUAmKW/36l/3zJRGAYBcTCN1tbI2ZFloDDP63r27KoOtDnszR8Il+NJjRmI6mGvii6YVZOAgLl+AGyx5L7qd+aLuAIHahBoYZ23FXim1qvQcs3YXpSbmSZsqPrOs3AS4DAKgtNIHmN1e8X2NeuZ2Gvfar6nL7eEYT7YOUNIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b+Fy1SSO; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54e7967cf67so7348605e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 09:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750263900; x=1750868700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLFD+2psb7xXjgfHWtkDfvPX+FPgGIjapr64yFarvW4=;
        b=b+Fy1SSODIdcsGDr6ecOEB04p2+Ivr+mEQFfcU/VJy1ohU+FwU+UPXf3Kf+N4kPxro
         Lo8Y8ZkOE9a7FYsnuTlN9CitAmlT3MuzWuAGZi61DFlccQ6Ki+Du46vdgdzTzE4WTTgs
         WifZW7OX8H2qys2ux8Um7G8fo37wQ45p+q1olU7eij0EfaGO3bDbxuTUiCvma1ptEQnI
         6P2skv1Q2EFFXdBq3WrH4Czfa+f6h7uT6AcPHB3LKe7CH/NAylWq1anSZkrb3QqCVN4n
         fkmQJzlOGgoyZA3AQ7RDt5FFVRyKAqnoylsLtcF+Drn3a+LjEmQNSDVsLA704tgs1+8O
         X/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750263900; x=1750868700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLFD+2psb7xXjgfHWtkDfvPX+FPgGIjapr64yFarvW4=;
        b=MGFaE/RLasf1Kr6mGPQc/voH5WjXLk696kdrTJwz+rAOsNOdzvIjjcPM3fFqQw9cIe
         5/a5TrdMi85YfZP2ibXGxHkB7yeAcQEauMDuvbBPYmhYz9Y8Vb6E8X4jRGczk2dNp8/Z
         SnY8FBlAWofS7byJs/lulRYGjO1OHjskgyE2edZm9GvafjOgrW0KcDjFzJFOvG5vxVXs
         zfA/YfgKXPREsiYyDSTPhT1Zfq7sE7LpSZTSJuUKkJzA3igALVs8B/5wXmDxp4ZYEjGW
         8qsZS5nXrgHr7RG2QKJF+wwcnztC/iE6/3Li3Rk4k5CfOSBGXRHH8mFKJ6JEuxNH6g4E
         GOvw==
X-Forwarded-Encrypted: i=1; AJvYcCVTVOM69M5nJpEA+0UCBn+H24OcxTNbL3Im+Vh6reEW6eQW/rQoCITPszKcw1Os4Q3hxB8BZiFcMPxg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk4RuxnTlzUJj+SvN/polYwkGL5b7sEm2fU6aIsNFHWKym74AO
	rDVOSvO5lGlpqxlQMzLW1tYGFpAYNG9N9Avesrt2OIWU7WUPLLDdpl00/gBKhnJDUQLuJM7boI2
	Dwi5lLqx+bfLvHImAljvPlqbAOxYmFwfUv9Y5C7XkCw==
X-Gm-Gg: ASbGncsCuAbzyvw3nRTzOwagf8L3HVMhWY5hPOyo5pnmtP45FwWUuOSONUxEPmDyfLu
	TvisYpXfYszAEjDUma3FMsNx3IYdyZhCis0JIoZnwubm7ZVd8W0pn3DANaQP68Hy5ei72BA/cI/
	w7Thun3ByAJJO06/EJS9DfE7zPeJ5lJruPZI25QywiYKPWWdDOb+ofasuCNOL1DiDE8jfPXbevF
	w==
X-Google-Smtp-Source: AGHT+IFasWzMx4vvKMGThkbIPZ5HFR/Wr5hiH9hJMS02hBIeQh8p7hArmnTCvxt1VaP57eg2rHdU67rWBwbdr9GK3qY=
X-Received: by 2002:a05:6512:1193:b0:553:2ed2:15b5 with SMTP id
 2adb3069b0e04-553b6f50256mr5473373e87.57.1750263900278; Wed, 18 Jun 2025
 09:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <95f63f24-2c8f-4f0b-89a9-ddf39a8f2e12@sirena.org.uk>
In-Reply-To: <95f63f24-2c8f-4f0b-89a9-ddf39a8f2e12@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 18:24:48 +0200
X-Gm-Features: AX0GCFtQiRTdcvRzM4v3bXKNF4ikUT4N9NzJhHCtHKKqoMjJz7WLf-25661k3ho
Message-ID: <CAMRc=Mc9_V8bkD_FyNkxkNoD3Fe7q-CC7ifq3TrD=r8+D_UgKA@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 6:21=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Jun 10, 2025 at 02:33:11PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
>
> I'm seeing boot failures on a UDOOq (an i.MX6 based board) in -next
> today which bisect to this patch (in -next as b908d35d0003cc7).  We get
> a NULL pointer dereference during boot while probing the poweroff driver
> for the system:
>
> [    0.443319] Unable to handle kernel NULL pointer dereference at virtua=
l address 00000000 when execute
> [    0.443330] [00000000] *pgd=3D00000000
> [    0.443347] Internal error: Oops: 80000005 [#2] SMP ARM
>
> ...
>
> [    2.522761]  bgpio_dir_out_val_first from gpiod_direction_output_raw_c=
ommit+0x194/0x390
> [    2.533330]  gpiod_direction_output_raw_commit from gpiod_find_and_req=
uest+0x134/0x434
> [    2.541276]  gpiod_find_and_request from gpiod_get_index+0x58/0x70
> [    2.547482]  gpiod_get_index from devm_gpiod_get_index+0x10/0x78
> [    2.553516]  devm_gpiod_get_index from gpio_poweroff_probe+0xe8/0x174
> [    2.559990]  gpio_poweroff_probe from platform_probe+0x5c/0xb4
>

Thanks, a patch[1] is already up for review. Please give it a try and
leave your Tested-by: if you can.

Bartosz

[1] https://lore.kernel.org/all/20250618-gpio-mmio-fix-setter-v1-2-2578ffb7=
7019@linaro.org/

