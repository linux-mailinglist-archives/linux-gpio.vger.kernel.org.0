Return-Path: <linux-gpio+bounces-16812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EF1A49A1D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 14:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1DF53B296D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 13:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB31826A1D9;
	Fri, 28 Feb 2025 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs/8PV+g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3E82F41;
	Fri, 28 Feb 2025 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740747709; cv=none; b=XD2mzqn9+xke9ouYB8VPuYX0Tq4Mlq6Ng9Yx1aC+y6ZsuTQl/0nsjgGedP271zkPgNb+FT5sLY3oBNHLRAUEdbykWi3lwCeHk1BNaIhyz8LP8tzpTsHA1Gzyi0DvuOmc2jmGJrIBsrlKYnelpUCZ45ubMNNfcyj/lkL97KlQ4D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740747709; c=relaxed/simple;
	bh=lqnR+JheswhvgrFJM6KyRTYNfvwJMuW0EW4T0IeIFF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sxsy+C+GBWfdL/jF99bzeWyUNScl6pWgkfXIzN/Zn7qMgxRQ1ALGTug0IJzCoxKhqryV77bguICCkEJgX8bIBRUUfCC3BkJXQonYPZgUOH3opCKLRVai6HmNDwhl44/BVALeDi7kjNKZfLeE6Kmxe+WwpQomNMLrvu0dyxp/95M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs/8PV+g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3EFC4CEE9;
	Fri, 28 Feb 2025 13:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740747709;
	bh=lqnR+JheswhvgrFJM6KyRTYNfvwJMuW0EW4T0IeIFF0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gs/8PV+gdhuqgRbRq3PWjR3X7flzk5Sve8/pUNLfAw1jQyg46GaipmTQE1u7rL9KI
	 cC8DRRVmSMQ/maxG43w/CCFfvrgMfBO286h9OoQMJCu029WsOjx7jXnOtit9wUTJ2m
	 LL0LhSAx8yHebaGiZAusP9sUL9bjehVR4Qmz3PP8ZswaIDDwESVk2yBWOkdfFgTvqa
	 Jt2pVvAVS95SHofj/HczhBM9c3gAcDW1mTu/BRhbUgAEW9tQ0y8hEdMREN7Dq0ywAd
	 xXmzv+kqWC2B3uL7MB20vnyrHyrh/i9M+R3Y00WgK0HqlmMUnQScr2qKg0coCu66aH
	 J84bAXsnYzvSw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e0373c7f55so3089500a12.0;
        Fri, 28 Feb 2025 05:01:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKt4VjA6jSdf8HixjSv8FZ2Jok8LIJLcD5QMkoe5IL9QGLsj5n8y5VQbI1SVC5vkFT2XuV/2Cpw98Gapvh@vger.kernel.org, AJvYcCWOFFE7n6eR+6Dr+f8vMgFq3c+12QRdP/hdVWbhilNv/BDpyN4Ssu7aSS8qxaUr8OM7rCQ3kbKcHZAsBg==@vger.kernel.org, AJvYcCX7qIV4O9qUBpMXDctToiTaLSlxQimwmd1h8x4s/hmjPclwK2eP0a+nsE6m+SGhr6zwM4EB8PC1mzL6/zKXAK8d@vger.kernel.org, AJvYcCXeCrl/b5jec72yhIYBLeR8yaR5Fn8EdeRPECv0UeRqDayYanX+s5XPMnLBv/DHUCZx7GH4OVik5fZm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxy9j3iz84o6m1ADyTRWTNojSQWMxwqRYA0eX0G2vsKR/l1sGl
	eolASQHN7jg7NAUalcr4lWqjrqR0yTfmLIyI3o9X80Tu28UDMYWwfBxiHGvO6yerNNKV1NOQXBD
	oU6AUsWcnUIedTwKGOFheVcm+2Q==
X-Google-Smtp-Source: AGHT+IE3NVig6fcg7AWmf0LSZkEe9NZzSMZOtu4y73Ybn5vbLk/MQ08kJCOadYw8rDMrC7ULMWJhx6pGL/o+kHXgo3E=
X-Received: by 2002:a17:907:6e87:b0:ab7:d537:91cb with SMTP id
 a640c23a62f3a-abf261f98e3mr316126266b.7.1740747707559; Fri, 28 Feb 2025
 05:01:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
 <20250226-max77759-mfd-v2-3-a65ebe2bc0a9@linaro.org> <20250227130451.GA1783593-robh@kernel.org>
 <503e105b71fa4271f40a2d3ca18ba13ed7d45a65.camel@linaro.org>
In-Reply-To: <503e105b71fa4271f40a2d3ca18ba13ed7d45a65.camel@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 28 Feb 2025 07:01:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK-_rPZqt_vRv75dSWDLUAyZ-LB=qz5J=Kse=7bO4q8sA@mail.gmail.com>
X-Gm-Features: AQ5f1Jo7EndHwP8BRLSbmoeH26pdkVjNoOZvQIz2llEEQ2ewDNuDr81I38wLGHg
Message-ID: <CAL_JsqK-_rPZqt_vRv75dSWDLUAyZ-LB=qz5J=Kse=7bO4q8sA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: mfd: add max77759 binding
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 7:14=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> On Thu, 2025-02-27 at 07:04 -0600, Rob Herring wrote:
> > On Wed, Feb 26, 2025 at 05:51:22PM +0000, Andr=C3=A9 Draszik wrote:
> > > The Maxim MAX77759 is a companion PMIC for USB Type-C applications an=
d
> > > includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> > > Port Controller (TCPC), NVMEM, and a GPIO expander.
> > >
> > > This describes the top-level device.
> > >
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > >
> > > ---
> > > v2:
> > > * rename expected nvmem subdev nodename to 'nvmem-0'
> > >   I'd have preferred just 'nvmem', but that matches nvmem-consumer.ya=
ml
> > >   and fails validation.
> > >
> > > Note: MAINTAINERS doesn't need updating, the binding update for the
> > > first leaf device (gpio) adds a wildcard matching all max77759 bindin=
gs
> > > ---
> > >  .../devicetree/bindings/mfd/maxim,max77759.yaml    | 104 +++++++++++=
++++++++++
> > >  1 file changed, 104 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yam=
l b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..87e3737896a289998a18b=
67932dbccacfb8e3150
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
> > > @@ -0,0 +1,104 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mfd/maxim,max77759.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Maxim Integrated MAX77759 PMIC for USB Type-C applications
> > > +
> > > +maintainers:
> > > +  - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > +
> > > +description: |
> > > +  This is a part of device tree bindings for the MAX77759 companion =
Power
> > > +  Management IC for USB Type-C applications.
> > > +
> > > +  The MAX77759 includes Battery Charger, Fuel Gauge, temperature sen=
sors, USB
> > > +  Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: maxim,max77759
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  interrupt-controller: true
> > > +
> > > +  "#interrupt-cells":
> > > +    const: 2
> > > +
> > > +  gpio-controller: true
> > > +
> > > +  "#gpio-cells":
> > > +    const: 2
> >
> > Why do you have GPIO properties here and in the child node? Either woul=
d
> > be valid, but both probably not. Putting them here is actually
> > preferred.
>
> That's an oversight, I meant to put them into the child only, not here,
> since the child is the one providing the gpio functionality.
>
> What's the reason to have it preferred inside this parent node?

It really depends whether the GPIO block is a separate sub-block which
is going to get reused or has its own resources or not. It's the same
thing in system controllers which are often just a collection of
leftover control bits.

We just don't want child nodes created just for the ease of
instantiating drivers in Linux. While it's nice if drivers and nodes
are 1 to 1, but that's specific to an OS.

You already need other child nodes here, so I don't care too much in this c=
ase.

Rob

