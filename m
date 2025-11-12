Return-Path: <linux-gpio+bounces-28377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 359DEC514BC
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 10:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A19ED34AE5B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 09:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278232FDC5B;
	Wed, 12 Nov 2025 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcC7wRZy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2247F2FD7A0
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762938802; cv=none; b=dujPwppx8GH5cP1bihl09V6f4FOwidr+0zINSK36r7dFxouk/cwoKSBc8zE+Aq30WztMKU2fAzAR2EjnkHuhB/yvb/xcRlRpM+dGx658qdhdmHkU+pggzuB4c+n1VlcT8VtjzxWnA8sjPL1ydTbPbYoXNoD1T+hV4FJ6yfRLUxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762938802; c=relaxed/simple;
	bh=rLIk17U86Vy0ymvxyTbp3y64zSv81R0NFcueOugWbMU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a9WYsL/XV/paaNnBCZvJlxUs/mXxGk7u9hZ298WTqNM4MdJf+iWJUVUEyk1KSqa0mjnnweN4n0NgVnZJwRdZv1noU1YbAHB/fKz644N+onLP6d/itxUbZKshopPzNxEIqv2JkE003rOxVMxMxXZCr934L6UlsvaBiZNey91bOkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcC7wRZy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b32900c8bso298594f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 01:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762938799; x=1763543599; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLIk17U86Vy0ymvxyTbp3y64zSv81R0NFcueOugWbMU=;
        b=CcC7wRZy5724ypaqEDcUZTovlHh6c/n2zoPEWM0q/WNW8k6rCR2jYF0Jbu/tfEAgIt
         vLXVJvBcbor0IJxU3nd8gMkphuOQZV84+6oYPUdqixdHziMXlE+MQNkmcY0HKrmE4xZ3
         lrlyOIHC006TqyoqR10kupOs9eIavvg15dA9rkFwoxY2fwWqKDOikOEmpH94GlFnBtxO
         syDeKzOeFJJOPBDCJaFb6YIkLK/SzN77STNPYS1xIsmFXtABwdYbIL6PTUaZQeBzeu+t
         7ZsbCLRmythsLaX8TwuRcxFJGcmrEEkgOFdUdTm0MIzz5qQJLRsotz4cWEemdgNoLjWK
         m1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762938799; x=1763543599;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLIk17U86Vy0ymvxyTbp3y64zSv81R0NFcueOugWbMU=;
        b=XiRxmMsF1BxtuuLwjVL6I4XwsLg3a97rCW/94J3lSZ8SSgWyHCrHEKSsVgNZa7dl6b
         0DEBM2o0DtyxptEsuT1KalRrmXolGy++GSCU2mnFun19uCUsfx4ukLL3Y1Ds+tx8Pz9N
         rtdmYsjeNPMEIkUyrUAmau7f+Ojax+0FSh3VEj1WrMojTn2EjyxU7yhmXsBiDavjnUrL
         iPHPbLC7nFlqJSOekFgMlakaEvd4Z/qK3HhWQNfahTCKY7XqZvq2jT+7CvYy1BDIHykI
         I2Q1GUcceYnYeRMOcGgMqCYxT1gKZvsNN2JNhSUHDg5ZK+/2Ctgt7q1T2weKftC7P+TC
         qCtA==
X-Forwarded-Encrypted: i=1; AJvYcCV/CGF7bdEOG6ArrvpGw/azRVBCd1FZlNPwhn7vSj9XPETwJQt2GTjoEtLcFR4KmezN48MEzeMLiyjo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0JU1ARlmxlsaTMDXmyhqO63w6EiUViSkI7Ljf5/8SC6T4mnRs
	/F1TZcEutpk8srnJNEHgy89b6/J46s8r+KapXeovHmNVFrDO3MGGWTSf
X-Gm-Gg: ASbGncuWPdYbD4K741LWU7jula+vS9/1HFZ8hwMdGxtx0wgk+aCsAQj4IooyrpZOz7D
	2ODQSS2LOYdI+ILvB2uCWZNjgHiIYTEk58CnE307CCWF57+lxFh4GPBnHLgOJtXM60gqnzZF3me
	OKdWQwi6+4E8ZosksWnZ3VS+zBHpZMCF3tVa//GACcMar9HU2KS5wBWpHnuFpCvZWmvzK6Sdp8r
	QK7dWMyDb3n/buC9ckqsvAoAbHZugeqs1XUxqZ5m8A3UmyWse+aeuB32CrnEpdTbgQlLXI6pJsH
	ZPeIhehfuefIyclbb0HzCSexDtRpYegc9JxYorPYlCu+30qDjCcEqj3pU3LHVvlQrX5fithW74R
	imfoKSYLJr4TJJv/zCnEmoGaP72Th3USiMQFHA19DgzI1WPAI14ymOwJYjVl6seN8fbmiv7Sg9a
	Nv5RupIt2t
X-Google-Smtp-Source: AGHT+IFKNZnEadOnYmx5pz6AWtNuR6d+SMLV80NL9lm5XKQjDSAA8ekH3txNndti771Q+kHS4Lc2Og==
X-Received: by 2002:a05:6000:420e:b0:429:d350:8045 with SMTP id ffacd0b85a97d-42b4bdd1925mr1822920f8f.59.1762938799133;
        Wed, 12 Nov 2025 01:13:19 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b322d533dsm21978863f8f.0.2025.11.12.01.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 01:13:18 -0800 (PST)
Message-ID: <96a30c1236cbca467b4f152e54b46ea290cb134e.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: adg1712: add adg1712 support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, Linus Walleij	
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Wed, 12 Nov 2025 09:13:56 +0000
In-Reply-To: <20251108174055.3665-2-antoniu.miclaus@analog.com>
References: <20251108174055.3665-1-antoniu.miclaus@analog.com>
	 <20251108174055.3665-2-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-11-08 at 17:40 +0000, Antoniu Miclaus wrote:
> Add devicetree bindings for adg1712 SPST quad switch.
>=20
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
> Changes in v2:
> - Replace individual GPIO properties (switch1-gpios, switch2-gpios, etc.)
> =C2=A0 with a single GPIO array property (switch-gpios)
> - Update required properties list accordingly
> - Simplify device tree example to use array notation
> ---

Antoniu,

See the discussion in [1] and reply there. Linus gave a suggestion on how
this could be implemented. See if it fits the usecases this chip is being
used and if not we need to discuss alternatives or if we can allow=C2=A0
gpiochip .set()/.get()

[1]: https://lore.kernel.org/linux-gpio/20251031160710.13343-1-antoniu.micl=
aus@analog.com/T/#m3f4397526ee7cb2a737a30673934578b3b290c1c

- Nuno S=C3=A1

> =C2=A0.../devicetree/bindings/gpio/adi,adg1712.yaml | 65 ++++++++++++++++=
+++
> =C2=A01 file changed, 65 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/gpio/adi,adg17=
12.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/adi,adg1712.yaml
> b/Documentation/devicetree/bindings/gpio/adi,adg1712.yaml
> new file mode 100644
> index 000000000000..d6000a788d6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/adi,adg1712.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/adi,adg1712.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADG1712 quad SPST switch GPIO controller
> +
> +maintainers:
> +=C2=A0 - Antoniu Miclaus <antoniu.miclaus@analog.com>
> +
> +description: |
> +=C2=A0 Bindings for Analog Devices ADG1712 quad single-pole, single-thro=
w (SPST)
> +=C2=A0 switch controlled by GPIOs. The device features four independent =
switches,
> +=C2=A0 each controlled by a dedicated GPIO input pin.
> +
> +=C2=A0 Each GPIO line exposed by this controller corresponds to one of t=
he four
> +=C2=A0 switches (SW1-SW4) on the ADG1712. Setting a GPIO line high enabl=
es the
> +=C2=A0 corresponding switch, while setting it low disables the switch.
> +
> +properties:
> +=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0 const: adi,adg1712
> +
> +=C2=A0 switch-gpios:
> +=C2=A0=C2=A0=C2=A0 description: |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Array of GPIOs connected to the IN1-IN4 c=
ontrol pins.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Index 0 corresponds to IN1 (controls SW1)=
,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Index 1 corresponds to IN2 (controls SW2)=
,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Index 2 corresponds to IN3 (controls SW3)=
,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Index 3 corresponds to IN4 (controls SW4)=
.
> +=C2=A0=C2=A0=C2=A0 minItems: 4
> +=C2=A0=C2=A0=C2=A0 maxItems: 4
> +
> +=C2=A0 gpio-controller: true
> +
> +=C2=A0 "#gpio-cells":
> +=C2=A0=C2=A0=C2=A0 const: 2
> +=C2=A0=C2=A0=C2=A0 description: |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The first cell is the GPIO number (0-3 co=
rresponding to SW1-SW4).
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The second cell specifies GPIO flags.
> +
> +required:
> +=C2=A0 - compatible
> +=C2=A0 - switch-gpios
> +=C2=A0 - gpio-controller
> +=C2=A0 - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +=C2=A0 - |
> +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/gpio/gpio.h>
> +
> +=C2=A0=C2=A0=C2=A0 adg1712: gpio-expander {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "adi,adg1712";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio-controller;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #gpio-cells =3D <2>;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch-gpios =3D <&gpio 10 GP=
IO_ACTIVE_HIGH>,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&gpio 11 GPIO=
_ACTIVE_HIGH>,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&gpio 12 GPIO=
_ACTIVE_HIGH>,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&gpio 13 GPIO=
_ACTIVE_HIGH>;
> +=C2=A0=C2=A0=C2=A0 };
> +...

