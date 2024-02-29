Return-Path: <linux-gpio+bounces-3932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B81F386C556
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6903A28FB52
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBC85DF0D;
	Thu, 29 Feb 2024 09:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPpMxIOF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E8E5DF09
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199228; cv=none; b=FuBR/GwmZfPfY2aDjnZkT+rLEYNKS3J4FzAsdcF/XW4FWKbUsZUkbrDRBsSqqqZGJ8vdI7Q5B+P3iNA4HFrM3a8V1gNcIclCzdr/IMh/SzfcEfIc/TeWnQKTo1yev02YiQKTnhYbfeycsPGwMkt6TmR0HJR+29ZO3+Pq6A2CHYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199228; c=relaxed/simple;
	bh=BTKFqTkQ/Hdxy7pKbUgkWsXlYhvwEw9bt65k1KFPuDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgEMb1dOMktkGBZGaDQnfjlInmREm44XYOsKrZdUIJYPCVh3NLBI4JZOLnrkz1ozCo3VbH9S9OdJJspm0D2nresG9xewnrVv+vs4kDmcAMeck4Lb0LKyEIcoHfs66TGcODQP8CDQXqGwyD7Eif/q7K2cAekswrwHXOBEp1M8d/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qPpMxIOF; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-607e60d01b2so4408347b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199226; x=1709804026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTKFqTkQ/Hdxy7pKbUgkWsXlYhvwEw9bt65k1KFPuDs=;
        b=qPpMxIOFBOREPhw9l3O7ylF7/oN7NkAvmbPK7SJgn3VjC0kayodnvodSMV/m3iMTst
         eiO1fndMDSZtAk9Ls7c3TpYK/ub97gV5edzDCG/RKTCmm9iKRKwzYDc6hxlsVagrC0QT
         TPQhsCH0YbAyU6/w3THRgtE5IhnpZTJLx49aB8q1nLUuRKsAggBK/gnTXs9st6Op4Y5A
         1b3AfAiuuEIYAc8Iw9/dcXSsTjuCUijINJJ0zanFGYRkQDGBxRg6gzknIHiaJKRwlxuP
         L5QiD2DlzdGlUySs/8iwwBgDtcZR6lJO/c73sBVr89nRYIw+b2wqp7qS1NLcjf3JZr4g
         5N9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199226; x=1709804026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTKFqTkQ/Hdxy7pKbUgkWsXlYhvwEw9bt65k1KFPuDs=;
        b=g6lLn88f0ayShT86kVEclgWXLDDgKHG0ILT036/5v/7FAjE44Gn6flym3vmWRWRWjR
         /wkDreRACZ492PkmluXY8LgkzullpxqAKeJKMvZwaCDw2gdZsvzUwxaLklaYT7I87C3Z
         9hJngemkTYd5uMEKfkgeLxXVTHtpWS0FmeIw9So6WHbiaCGSiD4gt9Y00tFFox3RRU3p
         ZHaDrM7moz+hFFFT+sQCPwE7+wYQMjIKEEbhIBAOtAYe7qOguWv5tGQmCnBpwCCeEMXS
         /81xW3f0WVoqjyg2Xr9+N6EeA28jMmBPOm/CB8KKVRkwyn6vsccPEuCAR7LKo3z9i7Q7
         nvJg==
X-Forwarded-Encrypted: i=1; AJvYcCXQI/9ynb6d6mfC7mlbargSPhfDJXPE1uz9WLvFlp2pKu2JHzfVjc14pz+MChBM5j/JoFYmXSjNioD8Rjq1xysc7z2kvQg1FG260Q==
X-Gm-Message-State: AOJu0YydRdQJ0doDSQOmXttJmqqB7iH43iVR4v3DsSQFHUy/wG1lpghK
	nWsmSepqQaVO5Mnw70ts7HChTQTTlmBblqR8PJrFuMK01QGS03M/0yLL9YVFqi29iwC86ZFJImW
	dyr0XCuqZedr4dkBgzscNDNuSQUYx22uGlSXcIA==
X-Google-Smtp-Source: AGHT+IHV++gfJwyt5qvCWtgkDy4qf622OP2MAl4tAK2L2iTcZeC8PuyC0CiumnxO3QX4i3ji7VGSLW7yqUh576MqE2U=
X-Received: by 2002:a25:8548:0:b0:dc2:349d:10cf with SMTP id
 f8-20020a258548000000b00dc2349d10cfmr1676538ybn.53.1709199226350; Thu, 29 Feb
 2024 01:33:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-20-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-20-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:33:35 +0100
Message-ID: <CACRpkdaKi4qXG03fuPqCgdHmZ1RydMBxMFB3nutG6JLPGs+JkA@mail.gmail.com>
Subject: Re: [PATCH v2 20/30] gpio: nomadik: make clock optional
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Not all platforms using this platform driver expose a clock for this
> GPIO controller. Turn devm_clk_get() into devm_clk_get_optional() to
> avoid failing when no clocks are provided.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

