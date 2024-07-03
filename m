Return-Path: <linux-gpio+bounces-8005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB42F926089
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 14:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 624031F235BB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 12:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E288176FD3;
	Wed,  3 Jul 2024 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RPVe0fdv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C271176ADB
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720010347; cv=none; b=NCzkdKgfDISIqa1PWeDJlff4qj8rKxPuCaREmedRAXWcicTLoH7IFKeZ9q3lr+cCARoObdCjfc4iSpyOHoBQd9h54Ar/G+SFXJoK35aLxIR/3XCqvopXGE67qb2NK7lFPyAFZYf/R9QBHUFniRTtZFdwWAvY4zbUxSaf4X6j35I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720010347; c=relaxed/simple;
	bh=KIKwYU58rsJ1T9IBinHX1xe/hBk/3PpX2oCC4eEavbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2+HYlBmmpXqjhlwDTe6QHzFDuWEKtLry+mG3KSuYB81o7mT/KfG2Ry9FjD6Gyhq5aYNZtitjw4ii2M2oCVVz97YZLoBM9nbLaYPrnPtjnL1Yn491ihOtE4S0zuOKSqaM/IR0nTQ1Xb00fjWm1nK+jWKERBuDzON/MXaIlS6+fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RPVe0fdv; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e036d1ce4f7so515421276.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 05:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720010345; x=1720615145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxc0I0zpiwPou1XOXc6rXOn/i1v3KiOE8O+RryADI0Y=;
        b=RPVe0fdv56UR9MGfbDw+5xeFw9RKWIjW5v0xWdZ+e3Xldkhi28M+eyK+GMTellp2P0
         TLuNz9oKXbgZJvO1TBUwA+jnqxVPO2tMK5p/5Rdps9BdoD9HGVskD2teFP2prHdAjOnE
         qT0nhqHc4lLu81ySDj9DP1Vt8CiK2XTDMTpln1T18cLc8E1/hCHEM4JAoBA40pVspN1m
         Uwev7d7TtRLR+PFDc4YpTT4UjvlbvoLSZOScYzqKdc0O85aECJWbpL/W8ECdBDeYzufz
         0ZGTYDcjJIQHsGj9TZTvUS5vuoYIp7OF8NZievb7IVRQThWg1dG9nKN7dcC8nILVXnuc
         MoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720010345; x=1720615145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxc0I0zpiwPou1XOXc6rXOn/i1v3KiOE8O+RryADI0Y=;
        b=ZNBmqJ10Z5+Ap10XqOvec0VJtfqIikIgwwGl0VrJ8uAACPcpfIvu5wkZSRx+zvQ7JH
         dULzi8BzmY+rXbRRNKatxeMTPGOfsYzryitYtWw12cnekqu9T9dcznJ+URchTe4XNCvC
         wMEBB8xJ1vRSjV3lbjQ2stZrQawFl1OpUTfu4GrFMbRvOrn7S2f95XgN+QTsECHVnkFd
         gK3850AiwdqI2OBKuPzS/LyLWTCh7oBI2NuCUyqG8IFbU/zpZcqQYjn9d0vro5rU+qTe
         Oq31IoNwymmDyy/ez8hNhnPz5JQKxxxTHslTdT+bQrLvQa1XWAb5Zgs2A1p881hjD2aT
         /WoA==
X-Gm-Message-State: AOJu0YyrrKXlaIualBr5i57rGOyk5/eGJm3oAJo7N7PtGdtNkkj69gXE
	BegeurdQmJg+EnnRCSNbh2R9uXElNlfuoboFosS8MXNfIyg2b8qVrV6se3vFALARXF5bbce8Vyl
	wYiq24hypEF8puM9US7uT4Y13UsQjICTO8Km7ug==
X-Google-Smtp-Source: AGHT+IErCXkheRkAn8ztkA/4kbD3Vv8IgTYgskL5ABtY5Vnv1K9cr9jJhnKN+uszLloHhOBi6LlCRBFwVa1CpPDfSNk=
X-Received: by 2002:a5b:2c7:0:b0:e02:b68e:177a with SMTP id
 3f1490d57ef6-e03ad95ec1emr913514276.27.1720010345301; Wed, 03 Jul 2024
 05:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jul 2024 14:38:52 +0200
Message-ID: <CACRpkdZf033WftaRXpE2=dzs8cyuMfKVqGqoM6y3+EoqWG8Y-A@mail.gmail.com>
Subject: Re: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
To: Shiji Yang <yangshiji66@outlook.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org, 
	Mark Mentovai <mark@mentovai.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	=?UTF-8?B?TMOzcsOhbmQgSG9ydsOhdGg=?= <lorand.horvath82@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 3:22=E2=80=AFAM Shiji Yang <yangshiji66@outlook.com=
> wrote:

> bgpio_bits must be aligned with the data bus width. For example, on a
> 32 bit big endian system and we only have 16 GPIOs. If we only assume
> bgpio_bits=3D16 we can never control the GPIO because the base address
> is the lowest address.
>
> low address                          high address
> -------------------------------------------------
> |   byte3   |   byte2   |   byte1   |   byte0   |
> -------------------------------------------------
> |    NaN    |    NaN    |  gpio8-15 |  gpio0-7  |
> -------------------------------------------------
>
> Fixes: 55b2395e4e92 ("gpio: mmio: handle "ngpios" properly in bgpio_init(=
)")
> Fixes: https://github.com/openwrt/openwrt/issues/15739
> Reported-by: Mark Mentovai <mark@mentovai.com>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> Suggested-By: Mark Mentovai <mark@mentovai.com>
> Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Tested-by: L=C3=B3r=C3=A1nd Horv=C3=A1th <lorand.horvath82@gmail.com>

I'm convinced this is the right thing to do. (By Jonas Gorski.)
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Bart, can you apply it for fixes?
(Or for -next if you wanna be really careful.)

Yours,
Linus Walleij

