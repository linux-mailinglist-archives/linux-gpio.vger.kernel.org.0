Return-Path: <linux-gpio+bounces-2935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 073B9849566
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91BB01F21FD3
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 08:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1C6111A4;
	Mon,  5 Feb 2024 08:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e55rxr8b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7443011C89
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 08:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707121806; cv=none; b=DbzWmTvH5IiwkbiFbAR2r42qW2Ah+Mj+AYPo53XWwvPz+wxwLHA5+lqHgFGHy93PAliIrcwuysR3CqCGO3bdrItJ9rsHEysNDTyZ2y5Xfl4+QdIhCgp/HpWDFajT3RgJWb1/IafenI95XmnripIi5krtTLmJTfQZ/zOq92vhcqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707121806; c=relaxed/simple;
	bh=5E/cFiwqOCZ9yUiByP4NeDdn4JVgIuGTviECou6d5Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsxcSiThv7jp9vU5Z86svxWChItLg7o7ASNLUr2qEfAM1GedTHqkmM9VEFAF8G4YlzY/Zj3mhkJ1Xc5dcy9iEW3diCo7k7gKX/qsm0wiJCTDWAG5jeek5sTdTFqVbH6Tkb+mQ0gpY05R4hvqEVu+x8fXgMoTM83gU1b2WuyZGmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=e55rxr8b; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7ce55932330so1562204241.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 00:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707121803; x=1707726603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hP1MQXgFQfsBDnq3C99i1upab9U4vtCS4F3n/q5yC7o=;
        b=e55rxr8bpkYmNX5VlELcX4DuOouI5jaxHhIRfEd4g+H9Mn5Lc2KQGw659M+/Nh3peW
         TlyggK+y2C9BYfHgkHKiXdJVvR6xt8RoU/DFfMZmow+uuWHBI7mM4mBPjPen2qmOhwPB
         aPIYnCylCQBJV9WtQZr1QxqlrWnarUA0VRQJTErKmmeTcsOBR5HJUEdSL9qtAopeVhC9
         33Ul2FKj6DcQCT0fDr1b03+J4Tqnq9EOPXsr6D0S0XTg298o+7th4QOhJzCxnYWEUkw8
         +MT2S1aYUgkKXYEECWO0RG/eLMoCJojxZvvWo1PTHeU9g4fyJFNWwXb9gMwLKK6EZJ9N
         XggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707121803; x=1707726603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hP1MQXgFQfsBDnq3C99i1upab9U4vtCS4F3n/q5yC7o=;
        b=IFwlYOFu0YFF4lhBbprqizh2qhOnaq2tAUXJro5zKNtPX4bseXqAa/+HwQDaHAY2mp
         0UW8RrWHqC627A18uEdhlFZ2AgnqR7qblRdIvCjgkg8iVYkyj1mqDmuRPFFeAv88CLs1
         qL481le/APA9Nmxu/1XWXwa3HkOz9KECaLFnROSFP8xPCPzOquTMF+eZTXHj6ViuJYAp
         +Y3kjZunog9pgwGNK4LZCpbOFDrRS8NzmycYSb9a7e7oyTUDL77EJ1Nb6rJdSMhsa3fq
         8hniFzB4J4ibBaBX66jbVz46fhYuZ9G9+p6TnWyuc4jvSRGz1OLJAJvCDlPy8YH/GwY9
         gklw==
X-Gm-Message-State: AOJu0YxPF74XLLz51/ax2DMupNJiYVkxk9p4mbAStzTiT1yQnhvP6nNK
	JsM9bWTBoqPMJanElS7nQixH1fpoh/Pgg6DtYZDHeILl+uN+j2e5J40inw/iPb10a1dv7I5PfOn
	/56XjsDcF/VEiw5FtIoIl2bwC+Ww2Gtt2+HWRCQ==
X-Google-Smtp-Source: AGHT+IESqMdtN25YAJIeP1o5PEI4DSSRQhHcQveOW5MKwjv+mmFybW5orSDKVPvh4NjAySqx2ayaD7WpVbDnOaaJlKc=
X-Received: by 2002:a05:6102:3208:b0:46d:2719:7a8d with SMTP id
 r8-20020a056102320800b0046d27197a8dmr941872vsf.6.1707121802904; Mon, 05 Feb
 2024 00:30:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202222352.1652745-1-robh@kernel.org>
In-Reply-To: <20240202222352.1652745-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 Feb 2024 09:29:51 +0100
Message-ID: <CAMRc=Mf0ohQ4Cav2wSDOHydhrSDm8fiL+cjv4hR0m7=8UBDkUw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: mvebu: Fix "unevaluatedProperties" to
 be false
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, 
	linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 11:24=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> Schemas need "unevaluatedProperties" or "additionalProperties" to be
> false in order to disallow undefined properties. Only common or
> otherwise incomplete schemas should allow undefined properties.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-mvebu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mvebu.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-mvebu.yaml
> index f1bd1e6b2e1f..33d4e4716516 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-mvebu.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mvebu.yaml
> @@ -115,7 +115,7 @@ allOf:
>        required:
>          - reg
>
> -unevaluatedProperties: true
> +unevaluatedProperties: false
>
>  examples:
>    - |
> --
> 2.43.0
>

Applied, thanks!

Bart

