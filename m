Return-Path: <linux-gpio+bounces-22081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C31AE6F05
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 20:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E30477B1D3C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 18:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B342E7F32;
	Tue, 24 Jun 2025 18:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWE7unGS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85402E762F
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 18:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791497; cv=none; b=kxR7VLWngw4LMK9FL/3eEpxRw2IozxQgADTqnnb70VzVAyhTNDVixtmn8PWp3cKnYngVkQ/lvtLwIVI717WXaAyM1ZUMA9UOfuBd5eUmmtOLiiwxV6Qsza+BCu50KF3G+8rGAxGjcrEmdNJpER7/HWSmZA4+Mq/UyD9Xurue0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791497; c=relaxed/simple;
	bh=npWwWKZPd5rdEqfk5ixF6kz+HcjFPiAMk+Q3wRxBc94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X411aRzpkSBRNGhV76+YL+xm0VQdsk1ACqQKkrNclb5x0ILMgYZxAJGyr6wu1wEwMotqbaTKAb9D7f41zyPh+T747peGkrlAUT2zaqhEwXXWWF1DHZo1wp/FGIDibBrFRoK/qUoVQf3qtO6A4KS6euvmmLEFJMx4cif74asEnyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWE7unGS; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so1744901fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 11:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750791492; x=1751396292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7ui9krklnTDspgMC7AGFpPjhbbUuQIxEzApTtxeYDw=;
        b=TWE7unGSOuUxfA+RiQdEGtRaCAkTg6IrkT6bSQZThodttjPogdODQZyNfBW7I0xwJu
         nfX0au6WniRbRkA6iSosgwB2XHlBrOB8l1Ir84cbw6EE3+4nKpyPpjKEBG02qm7+HCo+
         4G6OYmTl6sdT0zTlxTzay5ScHkIele/6R3nM3bspbLGecKP8S1shvdHOE3nG2fb5FlR8
         4uB6+uMXvRdf39Cg8vJYEGKJ15dUAzj5hpGFkdKIHqmcwMN/TK1PsAsps7MqQJySIPSa
         FslFK2BVGdK36mkdfYhLdoalgGuUOd1ZQu0ByZOY/HlAEki88ioL6yFpb8L4yP6knnQe
         thlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791492; x=1751396292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7ui9krklnTDspgMC7AGFpPjhbbUuQIxEzApTtxeYDw=;
        b=PvdiMuTiMQyGOzNFeMtVXeCXYm8SXQdC2ayojQ6d3TgGL6uxEnfhlxa/G0ODy9VrNa
         +lbjYX0xRj6+MQ5ECY8WdlZxSHIEmMHdTCBg8b8px6LsXThFNoSYhZB2jHN0cfJYhODo
         PXVOY3JwjzJI01oE4kYz2CVn9Q4dNdRftDce+fi5209qOd2hriSVQA4ZoKYwNRI9qsrG
         JD01L4Mvtk2Oh3gWJIfdVdUdA6D/i7Om2czFIm1Ig4Idc7RhBCGM+yK4QE01/uqfPIme
         DmsMt6dcqtCtYstrNLlAoJB4VCMtCPqrEM5sau7EWNqW7alaXcQ5MMd8uajB6rJ3cBwK
         NqQg==
X-Forwarded-Encrypted: i=1; AJvYcCXg6yn3g0P+8RBrVPPlWUZtm6v8w23OMywdKzvXOe0jrQozRHdWIML30P5AAn7lRgH+BYT5SSYCK3vv@vger.kernel.org
X-Gm-Message-State: AOJu0YwFr8Y2GRklAYaiSrrqYQ4xbet6XrTNwWiRSXlxeB4/nMJ5m+/D
	ezwL+fU++fFsrD8bNzi1kJEncWIDo+uvadR1rieR8uFAiqoAeTpWEaNY5+lYuyP/irywKPwO8Qq
	2ZV7xtDhja4ZLmvPGIKyHKipG5jWjhNoHeU2HijhHnA==
X-Gm-Gg: ASbGnctyD9N68yFYCa6eU2ozoRZj9Mdn95IhZvps/ruXvC4IvT3GUT6/IeVgcGINbG7
	rmBe1Mtib197YnzWo0MRWV+J4JjNONBGs3uJ4t2lmTapaKheuc4UDkEzAQovKqbM31vaZ9RW42A
	PoDMcXqzid6CQ11EnlijlkKYhmaekBa2wSUa6RAmCn0ck=
X-Google-Smtp-Source: AGHT+IFHkwtjvOJNCrFEWstn9L634lZ8TSAnodhGn+aKzDIVOJMa02nwLbdMCDdRl+xviZehHHIuiwGlHeUOdx9D6us=
X-Received: by 2002:a05:651c:214b:b0:32c:a690:724b with SMTP id
 38308e7fff4ca-32cb968d882mr10090081fa.19.1750791491756; Tue, 24 Jun 2025
 11:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618095858.2145209-1-demonsingur@gmail.com> <20250618095858.2145209-5-demonsingur@gmail.com>
In-Reply-To: <20250618095858.2145209-5-demonsingur@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 20:58:00 +0200
X-Gm-Features: AX0GCFv3Y0xzvM4_ytzUY9wWsLoaPRcLNq10rxfdsma9gTvF5iQYKz-0B24NXH0
Message-ID: <CACRpkdYwBAaEi--y64oVwVcAMH9z0LO5ZG_fvNK-CuxdERiYBQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/19] dt-bindings: media: i2c: max96717: add support
 for pinctrl/pinconf
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS" <linux-media@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cosmin,

thanks for your patch! Overall this looks good!

On Wed, Jun 18, 2025 at 11:59=E2=80=AFAM Cosmin Tanislav <demonsingur@gmail=
.com> wrote:

> MAX96717 is capable of configuring various pin properties.
>
> Add pinctrl/pinconf properties to support this usecase.
>
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
(...)
> +      slew-rate:
> +        description: |
> +          Slew rate.
> +          0 - Fastest
> +          1 - Fast
> +          2 - Slow
> +          3 - Slowest
> +        maximum: 3

Would be great to have some SI units on this? Like how many milliseconds
etc.

> +      maxim,jitter-compensation:
> +        type: boolean
> +        description: Enables jitter compensation.

What does that mean?

> +      maxim,gmsl-tx:
> +        type: boolean
> +        description: Enable transmitting pin value to GMSL link.
> +
> +      maxim,gmsl-rx:
> +        type: boolean
> +        description: Enable receiving pin value from GMSL link.
> +
> +      maxim,gmsl-tx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while transmitting value to GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0
> +        maximum: 31
> +
> +      maxim,gmsl-rx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while receiving value from GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0
> +        maximum: 31

Maybe add some words about what an GMSL link is somewhere?

> +      maxim,rclkout-clock:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Clock value.
> +          0 - XTAL / 1 =3D 25MHz
> +          1 - XTAL / 2 =3D 12.5MHz
> +          2 - XTAL / 4 =3D 6.25MHz
> +          3 - Reference PLL output
> +        minimum: 0
> +        maximum: 3

I'm no expert but isn't this something the clock framework has some standar=
d
binding for? assigned-clock-rates?

Yours,
Linus Walleij

