Return-Path: <linux-gpio+bounces-29912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB61CDEDFF
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 19:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 069B03000B45
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 18:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F2D28313D;
	Fri, 26 Dec 2025 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sj8Ykdu3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE748137C52
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 18:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766772477; cv=none; b=pZWFeRJRuz4FoMpZh5vG9yqT5VxiS8OCV0+dKT8Y/F7vBh+uM+0sssXMRllGWVUSHpJWPKY02GZTr0bih+xo0Aef8/KRRWAMSmTvni+EJC//qi25TkJgnKhuDn3vpMiTHggl0wFo71YUUtGSMPk4K27P16OMHUqv7DGtD6Tl6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766772477; c=relaxed/simple;
	bh=Mo8DKiQXbP10FfBrG4jSD9A1fN4U7FZm/QO+xQpqVV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dq+30OHs6wvHvBqancn5R/qC2ABKgxiLKYFuYUusJWuthcySorZL0/7YSv8pzxdoA9InngERNXuNGHg9n+rzI9bZZLoa3azBFu/iRjoafPjSAZRyxxSEQ11f9x3A+X+rCxHCB4g0YUsb2bDs4HkQAGasueNc36WaMoSf+4ZEHeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sj8Ykdu3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4137C19423
	for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 18:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766772476;
	bh=Mo8DKiQXbP10FfBrG4jSD9A1fN4U7FZm/QO+xQpqVV4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sj8Ykdu3Z8gYuEOZSpZfrwpRaD0qg+avjRrmXpPCEaE5KuBdPEaiWo5cVLdXMFOIB
	 9vAyLQ25/BSc1JusmL2JztNMoApXaSCRXIkJGLO9m2Z8nGbpQd7wEU+dNMwfEWGEth
	 gYqYlSz0XBVzLtMrC9abdPt82RS9+ES7oqRjUcHpr9HQZy3K5Gk6EjNa0kHq9ohlEn
	 XIPXPGrA3sYNzMLs6Xn+GVfEGB3c3K+7gGWMgVFEXtC/M7HTc+A9mshE2H+EqS4yYi
	 n6xaFJNuFFpfw7QjOUsWwjGUYQXpvL6xMI/+WEKOisEhMqyBScG5UMSDE17rNMhvRs
	 QWthtXmQ/YAeA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fba1a1b1eso82801227b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Dec 2025 10:07:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXz8/taPrJmd3374m4PML/CCInpjk1/TZ458szdhnR4kyR1g29cOVvKTElcvX/W/LxfvTYv7QhMyrEm@vger.kernel.org
X-Gm-Message-State: AOJu0YwTqOyU70IU9K9o/jJsi72jZY1Qp0J2Bc9VBenLAderPjAzLR6F
	IhBmCZhZUR+Hi8Aj1sqQ50nUwawZVXMxlIpeMNhK5dvdspzDIjU1uRXjvqLq3C8fnrGcmIl+1/6
	Zt4GRhInHdX/NhopdWDZe+unmXDvHCrY=
X-Google-Smtp-Source: AGHT+IHXFYYWTsvxkiAzCuYl1w+1gAwdOMQor8XIU2GYqR9g+iZUH2rKjwqFU6Vi/SZe0tIuniB4xtJv4Fw3RoZpxPI=
X-Received: by 2002:a05:690e:11c6:b0:641:f5bc:692a with SMTP id
 956f58d0204a3-646632c32fbmr22677636d50.35.1766772475962; Fri, 26 Dec 2025
 10:07:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com> <20251216112053.1927852-7-ye.zhang@rock-chips.com>
In-Reply-To: <20251216112053.1927852-7-ye.zhang@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 19:07:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
X-Gm-Features: AQt7F2oo9iVMDuNkiBl10i_Zvh5ka_JIKyMORrwHeD221KqqGenYfp36zyHsPm0
Message-ID: <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ye,

thanks for your patch!

On Tue, Dec 16, 2025 at 3:50=E2=80=AFPM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:


> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml=
 b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml

> +  rockchip,rmio-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node (GRF or PMU) containing the RMIO re=
gisters.
> +      This property is required if the RMIO registers are located in a d=
ifferent
> +      syscon than the parent pinctrl node.
> +
> +  rockchip,offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The offset of the RMIO configuration registers within the GRF.

Can't this just be a cell in the phandle?

> +  rockchip,pins-num:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The number of physical pins supported by this RMIO instance.
> +      Used for boundary checking and driver initialization.

Isn't this implicit from the compatible? Why is this different
between two device trees using the same compatible pin
controller? I don't get it, I think this should be a constant in the
code based on the compatible instead.

> +patternProperties:
> +  "^[a-z0-9-]+$":
> +    type: object
> +    description:
> +      Function node grouping multiple groups.
> +
> +    patternProperties:
> +      "^[a-z0-9-]+$":
> +        type: object
> +        description:
> +          Group node containing the pinmux configuration.
> +
> +        properties:
> +          rockchip,rmio:
> +            $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +            description:
> +              A list of pin-function pairs. The format is <pin_id functi=
on_id>.
> +            minItems: 1
> +            items:
> +              items:
> +                - description: RMIO Pin ID (0 to pins-num - 1)
> +                  minimum: 0
> +                  maximum: 31
> +                - description: Function ID
> +                  minimum: 0
> +                  maximum: 98

Please avoid these custom properties and just use the standard
"pinmux" property. I don't want any more opaque custom bindings
for functions and groups.

Reference Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
and use pinmux from there.

You can use some shifting and defines to shoehorn your config
into a single u32 and parse that in your driver; i.e. instead of
rockchip,rmio =3D <1, 2>;
use
pinmux =3D <1 << 8 | 2 << 0>;
these shifter numerals can come from defines.
In the driver shift & mask out the components you want.

e.g.;

> +            rmio-uart {
> +                rmio_pin27_uart1_tx: rmio-pin27-uart1-tx {
> +                    rockchip,rmio =3D <27 RMIO_UART1_TX>;

pinmux =3D <27 << 8 | RMIO_UART1_TX>;

> +++ b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h

These number dumps are not appreciated inside the bindings
despite quite a few found their way in there.

Use something like
arch/*/dts/rockchip/rk3506-rmio-pins.dtsi
and include that into your device trees instead.

Yours,
Linus Walleij

