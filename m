Return-Path: <linux-gpio+bounces-3440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D0A85A667
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 15:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C772F1C21179
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 14:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B175376E5;
	Mon, 19 Feb 2024 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RffIvzM7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225D72E419
	for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354272; cv=none; b=qlFL/7aECv9P68xIcQyp49OQwhHqQjbj4VBxF+Wh3fqnO9MmXI+F6XHqPOiyPHkMp1LzgsrKIbTzxuwEfSpS7bic1TDsNj8BZX3W4EwsAn0gMVr8pDM4BTwECH2K4c0V43RPgVOYbSN4TCIGXTvVjPuETDqR+9IrpGr82ttqUsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354272; c=relaxed/simple;
	bh=VwezCsSQ9DJibqG86kh85HBeHbyDtKdujvrran4hZNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVjR7gPvtchnpxqVkRNh42bqevw2lvEz3SD2+DIn5AA8Fn3oIb/cyzSR8xP0Zb0LsPV/JMtGs2/hvm3eIdQsBResoJqj8kHY7SkheZWcuygMnR7WhoYVLbGFbd2s4iUpoqmaoq43GX3749rwuoFK0zw4plPFvkLIWz4bRTLvzxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RffIvzM7; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6082d35b690so10362247b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 06:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708354270; x=1708959070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uK6DW6wRUhapLpjMNPru+6tefOfW563KnlrWQg8HD0=;
        b=RffIvzM7PIwXi9fO8mlQ+5JFl2XbP5ps9CIz/aUfK8dlhJ61+Q9RwP+ed5eJuAZUgJ
         51fWgahW3RrD+oHxFe/ppW8sXxMxqfPnBij2H26VozgvYvdf5koHKpJ26GB6JAbuDZKv
         OkxkCaDQPLW3kLZoLKwccZlYm6bNyrM5o+nPpG4+VS4uvHm8O2CM4opBnEuOtsAju48c
         O5r6wwW7w+lBlV/+Zv9M5x7frAXvN66nu7X7n3IPIbS93dIP7cHaMddDd+PsbG7meqTG
         1VU6XpNNoXSsGkKYFUK0cvIxwz01jaUr22PuNbE0NevqmISz0leS/k8H7uTQUTwaVeeu
         24yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354270; x=1708959070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uK6DW6wRUhapLpjMNPru+6tefOfW563KnlrWQg8HD0=;
        b=s7z4Z5UqE1xNmfiuc63QafRPF1ySQJ70apxBPAjADoIJ/zHAGBX1610T+ICFjBKxDA
         enwFzR+lFhjvhoPILVTUVZZFcDLTf9PPdSFw3BL/eAaHDobmJY3FPqyj7YdRU4vaxVfX
         BQuFUr7LotK2lRBsh6CLbRl8rSX0MaGF2aBnQlSKGHE3oYDEvJcMVZXA7Ed98HppiQRl
         9atUikSOZ5xKRQbKDZQhnKAuVee2Zfy1zOlLsEVzQL0fmkLlyV23HxA0L9UH99dy0d4y
         kC5J0Omnm3UzM2fBzcG/Oxnnv0CqmOyYM3CeouSxVt5L2deDO4fqyJZxJBU28OiNg12j
         cZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCWpx01jP0Xa161g0bc/hirecIEAjguW23bM1OyCEUDlZkR1UY5uwLDykSt4BIbNSqiqBVC0BNRmVh35JVAt9iKMfR5037vfeNAogQ==
X-Gm-Message-State: AOJu0Yyh+8Gs5IIbH7Pn6dsmf8e8KrBYUoTjIhgy7N8ALdknOLgtzBtR
	13tYIJkjjNiUrwpijfB9ozrMIp/PRhk7ZgQofE5pA/6Pzui6VUHV2nFEJcJ6lwue3vrtcrroRTE
	MbdcZb5/mqxQDzRA1zoU6CgBotmP9HLZGBkikpQ==
X-Google-Smtp-Source: AGHT+IH9w/3fXcqUPbXBgmVF6w9lg4F5v6yvEb8r8rQEhAiFOFvfENIsHmXjey93as80w0DTDmBiAuNLdD8NfwPl304=
X-Received: by 2002:a81:ae05:0:b0:608:5b8:ac3 with SMTP id m5-20020a81ae05000000b0060805b80ac3mr7651706ywh.18.1708354270183;
 Mon, 19 Feb 2024 06:51:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-2-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-2-f88c0ccf372b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:50:59 +0100
Message-ID: <CACRpkdawXwae7GKf4zOfVUJPLgLOeEX-8w5fbnr8O6FXuZHuaw@mail.gmail.com>
Subject: Re: [PATCH 02/23] dt-bindings: gpio: nomadik: add optional ngpios property
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

On Wed, Feb 14, 2024 at 5:24=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> This GPIO controller can support a lesser number of GPIOs than 32.
> Express that in devicetree using an optional, generic property.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml =
b/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
> index a999908173d2..bbd23daed229 100644
> --- a/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
> @@ -50,6 +50,10 @@ properties:
>    gpio-ranges:
>      maxItems: 1
>
> +  ngpios:
> +    minimum: 0
> +    maximum: 32

I can't help but wonder what good is ngpios =3D <0>; but OK.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

