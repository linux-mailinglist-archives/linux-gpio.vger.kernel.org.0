Return-Path: <linux-gpio+bounces-11389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA8C99FAE5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 00:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33F0AB21220
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 22:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5081B0F3F;
	Tue, 15 Oct 2024 22:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yO7PJ2b2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124971B0F26
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 22:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729030001; cv=none; b=E5UTb6GMxKwWMAwNE1eC3kX+EgkJn6FY/GbWl3u49zP980rEj0Qqctzwdf100mk/qCZkujQF1W4Q0szsp+juonmQ9QN3flP1XO4nFKUdYm6t7vZ/6wliGBXbWKyMs/ro+WHCfAqE+PjWYUxpX1+eVa0tZGIBvapeChrCIFt39JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729030001; c=relaxed/simple;
	bh=BJE4f1D4lRKL1gR0V2Ux34adfzE9M6v+2sRwffzZB50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSujbOOxPkZEkXCHMcnWwRIIAMoWe0xiaL4rW2qaFyrlBCSB2/5i6L6fzY1SAyoLhrzLO3eJIYGQuoAC3q25yPtv6gDs0Vzhnw9IQcbPhgVvxoJ/xJESIffb44PSbZj7ailhRuwJgEGNvaShfXY9JKeUEnBhkK7/6Q5ka389Q1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yO7PJ2b2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb5f647538so3440551fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 15:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729029997; x=1729634797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df2UGXMrSlqnXgDl1o8PQ91Gen6dUgFMpKkG/5j+dDI=;
        b=yO7PJ2b2FsCDhboc2GtB43Vcy4TmBKq+0jR/crXVAydjm83fCqVMY0VAS4mB3EUxNA
         vzniKMM8UKlZcX+YIbQk8dJdIB6WC1QkkKuta3gCI8tpLg/rJkjvV6Zx/jzZI98vHWZO
         g6f6U39xTT+nK+wjoBAWM0solnTo3wqKVd0+JjFR4BDi/rVeyKfrWMkeuJTCtxvJ5erv
         8Ujkll0uiqLWdLYhOqNIVh+kIsJmzpvnnTDVA5y1HDwZJQbGhRQ6ObluLx0eVkZqsmAY
         BofOnWzmOd6D3y2C39WEyfngvm+ucngrDiPr8VDZ2N6cC9ofT/g4HxYHvgO7FhNQDncC
         kGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729029997; x=1729634797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df2UGXMrSlqnXgDl1o8PQ91Gen6dUgFMpKkG/5j+dDI=;
        b=m6+yai5Jyn5Yhi42uBsjN0gMm1fIQz+8CVEJ+gIOExqGdVsYifc84yH8ZzjoxMqk35
         jF1+d1/ITRuoAcPiXyP/uskWGmtkw4ZTy48bIx0dlUNmzNlykbatvTCFubfs4yr78DE9
         MKk8KdOv3cI11X8EsTOlz/kXh0++a7mKc7trMn5qilAHx51VlOtOgbXmU6cnb6rqx9px
         yLmr0ZBj5vynFJTwJuTNESFu2YdbE1Iu/SR5vOvFm1+G/ZBN8W6Mgbi5i2EvAV9IMWyZ
         ScpeGlHY7wLg2UlUx50Dypj8iJf2BdNbCX7G3OLOX1CuPtksdF/whoLhTVRjBizR9RFe
         o3/w==
X-Forwarded-Encrypted: i=1; AJvYcCXjL+uGYHHBkAQQ5mSGUs4K3Qv5nY4z9iamp3n2vYsAPK+vp8R5/MWe7Ws/fudsuou6Hth8lFCDbmx2@vger.kernel.org
X-Gm-Message-State: AOJu0YxpGXpMVhqBDMO8Z+T7JfCDLF8o6UFotzddOkN3zoyO5gEYHSlc
	ijcDcvkB9tUwndEk79awEIBDbRpxIV5HoX4GIN3pSOCHdvfof2hL6/UKUYWjBJ47PUOVoXy9QZs
	oqjtCT9f1Hjy3JBwIPSyd6SIDfSa2qkzKQAW1Ug==
X-Google-Smtp-Source: AGHT+IE02MJ5sLjtZ4n0KaJRs1Aik5DxDdANs4F0KVaTmjkcUN3BW1HGzLone+n39Az1ks2iqiI4fB2KQ8bjyI2qUHY=
X-Received: by 2002:a2e:4e12:0:b0:2f7:6371:6c5a with SMTP id
 38308e7fff4ca-2fb30f53e35mr45632151fa.16.1729029997149; Tue, 15 Oct 2024
 15:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 00:06:26 +0200
Message-ID: <CACRpkdaJ7Qiar-nV+-HJ=7_thLK-Trrw79eA5M+Wuc3FLDpyTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: samsung: Fix interrupt
 constraint for variants with fallbacks
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Jaewon Kim <jaewon02.kim@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 8:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Commit 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7
> fallbacks for newer wake-up controllers") added
> samsung,exynos7-wakeup-eint fallback to some compatibles, so the
> intention in the if:then: conditions was to handle the cases:
>
> 1. Single Exynos7 compatible or Exynos5433+Exynos7 or
>    Exynos7885+Exynos7: only one interrupt
>
> 2. Exynos850+Exynos7: no interrupts
>
> This was not implemented properly however and if:then: block matches
> only single Exynos5433 or Exynos7885 compatibles, which do not exist in
> DTS anymore, so basically is a no-op and no enforcement on number of
> interrupts is made by the binding.
>
> Fix the if:then: condition so interrupts in the Exynos5433 and
> Exynos7885 wake-up pin controller will be properly constrained.
>
> Fixes: 904140fa4553 ("dt-bindings: pinctrl: samsung: use Exynos7 fallback=
s for newer wake-up controllers")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

