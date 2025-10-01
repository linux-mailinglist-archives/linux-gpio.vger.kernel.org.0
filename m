Return-Path: <linux-gpio+bounces-26695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E632CBAF390
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 08:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FC633C6618
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 06:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7B027FB2F;
	Wed,  1 Oct 2025 06:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CZaVY9S4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEFD1547CC
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 06:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299765; cv=none; b=V6pbkEO4tbdypZSzAC5+wnsWbrW5aCh8o9DRF4E8vSrkaYv7dJzZklJuUtfUmH/vVtGEThdBKp5ffR+z4KAYtMUwtyXQVC2JZ9mYJn1/TBFd3UdEhexqH6UGqH5uRaFfjHZBKDfKc5AAP8ko9VkLTP5a6sEcnMi31caPWiIcsJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299765; c=relaxed/simple;
	bh=Jkzbo1gBTocRzXpJgz6IdpcssNc9wqVP/s/XEKzd86U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WhHLtYM++OyoYEhvAouZc8x8rWNlsRrle2JD4ClCmhZMdB2b7eAzGQhh1q0nL8WWD1RLhg5WUAPfva5jwg/tafoFzR1Uw685ifg0CRyqr97wznDr0lB3IfVw9PmqC++3AxxnHJyTtpo7hx0qd31g99GVk+GjJJOyrqVwJMRaeUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CZaVY9S4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso9163749e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Sep 2025 23:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759299762; x=1759904562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jkzbo1gBTocRzXpJgz6IdpcssNc9wqVP/s/XEKzd86U=;
        b=CZaVY9S4oSydABjyp+Ci5j9z9JeXtil1JpfPMndBo0Vv1puuRJIcgFW86eowoh0y/B
         /ymCIbbKbhXFAZbC/CyHArIhqDMEEXwKxoByiDYRxn32Tfb/T2/sBN5DGWbjM1UYrkoF
         3hpg3iCuGsms3zVGm8FwTaMKTw/UZSm3pU2pyKJeeM0O7F/g36iwDdFMuwigqAAnqb61
         3oqY7IZfRYyWU3GH/zTnl3v5v/bw/zKHGVVlLwAakIMkvCkifxsvKwrLnWBRR7NOoRjQ
         qldOZXcG1p1qDoYPh1/XTrYnp2189iFyF8zeegRC+F18IhnNRkk4BD751IT702CV6CaK
         C4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759299762; x=1759904562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jkzbo1gBTocRzXpJgz6IdpcssNc9wqVP/s/XEKzd86U=;
        b=Cv+3WE+sq6s5t4sDY/2XzujUxuvFmjS5veoAsRUf365BtqxRJj8QRB66dzrndSsKrX
         +fyXm8bwg+t6wBgX2COUoyKg+tkSJiE5Yy2UNzXlXpYm5XSIGHUOtbkoVrFI7K0pukK4
         vHBsyxtlLBiB24Tav6848ubcXb5RjMPDy9m9uRr43j5Oh9/8p+gLRjdk+xTPxrruiSu3
         6IwP5DUZq451zKDXXQ6E1bnIS2l7xBKYn0mVM9Jb0Dey87y5+vqQ/G+fH4JUK6u/F53B
         ZOvUQjdfFPbfyv8k+IcBE7Df2s7tgLkEuNBcYGnlA4zGREhfdhdNngzcruOpO+tFJLV1
         pGNg==
X-Gm-Message-State: AOJu0Yz3rup3i8fSre1RsckcYT0dsZjLmRrbd0pNgpE/HyPSsBNH2Oz9
	wAFPTCmMs7cEu3hGFpvat1ABR/0wk8yQ3NJGv8atbiD8GRPTqCi79hbajO8Oc4AJBLQjYqFAGiQ
	/ETXXEWRA9Tr3tl+VfpPXmyClvXV2RW8yMGXqM523kA==
X-Gm-Gg: ASbGnctnerAWB4m4ewLH+fPqVuN+D7TKrACXDkFcbrYmw2u/jfRuUsy4HheIc+gYPum
	OmAlxvFScN9SAe63RSxKetWq7EeMulA14KeSALMTDf7tSgMGEBTXs6YSCKUkth9Ftbc5WxEM8br
	8qI0wKpQZv5UKZoEafWtWzoh3RSMHW9YTbHKPVgZLEBnnEv1z2hE+BkEgzYjybzPTtebxnP6gdM
	dVMmCJdJoZI3vtDX41Sj8LQupkKNA0=
X-Google-Smtp-Source: AGHT+IFDxYob5oKkyC+td6gReKhRgBQ0qAzJ2bKwhcp2a+hxMNqK3eKLU5W8xv4pJwFlU3vH+EYVG2LSKSjXnLZrsrk=
X-Received: by 2002:a05:6512:31cd:b0:579:f0fc:429f with SMTP id
 2adb3069b0e04-58af9f7562bmr691627e87.49.1759299761748; Tue, 30 Sep 2025
 23:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917-gpio-generic-flags-v1-0-69f51fee8c89@linaro.org> <20250917-gpio-generic-flags-v1-2-69f51fee8c89@linaro.org>
In-Reply-To: <20250917-gpio-generic-flags-v1-2-69f51fee8c89@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 08:22:28 +0200
X-Gm-Features: AS18NWArlnL3SWUPzr0b7NRywCYEVXigtEYCqqstGC-_Umyd9moG7bazfHNJA2A
Message-ID: <CACRpkdYHcTcMXB7Z=4mNjXuj5N8fRQXA1CGSgoTjVRuAw8+Ovw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: generic: move GPIO_GENERIC_ flags to the
 correct header
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 10:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> These flags are specific to gpio-mmio and belong in linux/gpio/generic.h
> so move them there.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

