Return-Path: <linux-gpio+bounces-27342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C6BBF4E3A
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A0621892F36
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 07:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E4222173F;
	Tue, 21 Oct 2025 07:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kepdiKbI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4480F26B2AD
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 07:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030968; cv=none; b=Z9FRUCbMiO5ORNtBlBSs8jKn9PMRWsjqrwSRKUHm67hRXQqjNJlM28XpaiQkqnH4M2jPGQrBv06p3xgujQ9dIAlrnnCbi/06Kg7YbXd3gLgTDp1HHO/MNbOpNmjpepnKi7kIgWam2WjZ0pM8kCgwxNu2ZyXCgD0p9fy73gy5wO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030968; c=relaxed/simple;
	bh=rQWEzVQ2sP3X3UgfzW4ijWcMIC5eMV3255ZFLSUlASw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nWUt13+SOXsx8mspBtIFXbbmy+wSmsHpRk8YFhV+J4UbXDHsu6P2izoK+8jPCYJxtovg/R3e4b8Q1k2vD3qLLCUCRD4gYRDol0niKc8l6H5WCJzvJE5+pEcUlabXVCoiKsKKe93Et99kIBgEOQqP5TWdHlHIFyEU9L+FRiFKpu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kepdiKbI; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59093864727so6150095e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 00:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761030963; x=1761635763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQWEzVQ2sP3X3UgfzW4ijWcMIC5eMV3255ZFLSUlASw=;
        b=kepdiKbI8ekSPamszj/hk5m50ouOSGP/DCVQg/X3cA+s1hgBv13VzJHI7U3lGsbdPH
         JgYcAOEubkUzjVUj6eiTNqHBeY5oEOaF/+myZlfTs3are917vPVR/CLnu8FWVMRsp2N9
         sKRUw4H0CgJd2J2r6gP8CPG6vHkUqfOv1xiI+Nb6QZTweh76tJ6PpkG580lDAaS6iS3/
         r4V/aLDfP6VprcNxZ3+/vj9rmKY1o/76j9Kx2fnpOFn2JoKKBHzHuGye8MbsdlFsbd1W
         qR3BJ2Vlxou7vB7qEPWrTRoMZp7DmIDe8ojEe2YiIA+hxPI9UjMGlEkl/r5ME+F8YYVH
         OpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761030963; x=1761635763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQWEzVQ2sP3X3UgfzW4ijWcMIC5eMV3255ZFLSUlASw=;
        b=LFB6CZG9nlfgq0oUHb5rFz5WqY1p3F92KYeFHCdHf2ngvDLalFKtQUhYQERWHLGF+D
         Q1Lrzbn/Mzrv05SmKXNjpyIaKecUkSk5JNHqr76sDu9hhN0sSow+Et/rSHO3SdO3Djys
         t1dI0yqRJwpARTuTcVvvPWwFD7i7tXtWYpzRjFd7bP1IbkWR05l4kpvczXt4MAACoY0V
         dSYHD6P6t0uHIOkvb713L2tYF3keBvtjKmqlUuxjClqjUu2tBTTU51ZvyXfjm2KUh9IN
         X5Bk2ffg8Q3NOOdBkXmfSDfMrV+tTOYGM9Phi4PoUliLad9oGqL9NLn2xCxLEv5JS85a
         Fgbg==
X-Forwarded-Encrypted: i=1; AJvYcCVAje4U4CNP/o5np/GXtI3cyvoOUuLgIItK0D0FvxyNrGqL3OOxMPvLzsYO/A5jk/rfKs+Q89na5e5s@vger.kernel.org
X-Gm-Message-State: AOJu0YwcZPmsL4DM5tTQV6DoHrABNKlav5vCp/CFfIXCMValZQMJlhkC
	wrdbX6gUpfPvd48bUqkGaCqCmGtqS7bj0iId5snrOxWA7smU1zJHj3+wvQFbFsWoXn3udjvl/MG
	JJ7k/3eafbfia0BoRNFzmyPNsT9MHWpPtU7VeXykNAQ==
X-Gm-Gg: ASbGncvHp+KSYpGIlgtDppAKT4j+W0huFQNnhTdge9F5iul2xP23xShq/4VLnq6JJeb
	PdWaHy8VwhZ9awtsnydoCFSSKdecRxPFMdfCRJLY5ORqnwYi0wPwKMcUKvHGoeTluv1y8/XaG8i
	YkDWWDdCrOA/Z4rR79J37sAbYXp1LuDOcMfxl5PihVmhcsGEbhZpN5m0J5xBlZ/Z0WUbvrLIcdA
	lfkrzoiPm0vyxZuFYZAGyhkwgxKdcLeRBagJ0EVBnJy5JeHmb0MhEDg2sZ4
X-Google-Smtp-Source: AGHT+IGzyDckrbb1KeiI9VS9GysBs3j9cjfg3lRF18ScYzfeA7CZmuQgIKBi5NB2RI/U9eWthIdLrHA/CXD4tCAv970=
X-Received: by 2002:a05:651c:19aa:b0:377:78cd:e8f0 with SMTP id
 38308e7fff4ca-37797abc759mr50103031fa.45.1761030963322; Tue, 21 Oct 2025
 00:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020-fix-gpio-idio-16-regmap-v2-0-ebeb50e93c33@kernel.org>
In-Reply-To: <20251020-fix-gpio-idio-16-regmap-v2-0-ebeb50e93c33@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Oct 2025 09:15:50 +0200
X-Gm-Features: AS18NWA5wVKiKD-IlLzPjovWaTZwReIiIH_ziKmQoyWOfM6XDCDv0q_UbsE4rDA
Message-ID: <CACRpkdZyyjLjnfqT7Vq8VvzP7bbT+b1s0y142ODEhiK-thButw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: idio-16: Fix regmap initialization errors
To: William Breathitt Gray <wbg@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 10:52=E2=80=AFAM William Breathitt Gray <wbg@kernel=
.org> wrote:

> The migration of IDIO-16 GPIO drivers to the regmap API resulted in some
> regressions to the gpio-104-idio-16, gpio-pci-idio-16, and gpio-idio-16
> modules. Specifically, the 104-idio-16 and pci-idio-16 GPIO drivers
> utilize regmap caching and thus must set max_register for their
> regmap_config, while gpio-idio-16 requires fixed_direction_output to
> represent the fixed direction of the IDIO-16 GPIO lines. Fixes for these
> regressions are provided by this series.
>
> Link: https://lore.kernel.org/r/cover.1680618405.git.william.gray@linaro.=
org
> Closes: https://lore.kernel.org/r/9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nu=
tanix.com
> Signed-off-by: William Breathitt Gray <wbg@kernel.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

