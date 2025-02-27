Return-Path: <linux-gpio+bounces-16713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BDCA47EAB
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 14:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA37A171DD8
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 13:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202D322F397;
	Thu, 27 Feb 2025 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w6ULe8Xo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D205C22F166
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 13:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662040; cv=none; b=LwcteJRgcnL54OGj675oEGqZKPPPYDWhJgme1KCPD6IIf5QTzGBPqmCtVCzRUOmpLBHY7w7zd/6m7/FmNFCgKeAdis6Mcn5XprzHpK+mq1mVg28t+s4qhT0XS4C/0WzJbv6qfton+hON+c10iFperhYBUczxN37zbh3/t/pfDWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662040; c=relaxed/simple;
	bh=RvYJJ5olkrH8g63o2yNdqaycpGOF7BuYhXeUvp7CudE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IsycFude76X0StaCmyRxGPRwaAtcWAPhaUHHojuoKRWnKRKaO7PMOhobZzWtXkZqw+13WirvwsTq+5vDmpzQ8CUKhRUYB/fIeiZdkheZBIMUPVjsachqJJqNzbAG3hw22Gr/IZZsEH25CG1Jz7olfOupdnZqFrFR82VjhSKXVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w6ULe8Xo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43690d4605dso6082155e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 05:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740662036; x=1741266836; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RvYJJ5olkrH8g63o2yNdqaycpGOF7BuYhXeUvp7CudE=;
        b=w6ULe8XoIKz5NaxL+udSppHvVuC25aHUNbRUAONrrDwtNtMdhqhYg00HhkqOFSr6sw
         l6DIIzGmmRKVzTC+3uZK+x43K80gfPfJBPpJzddK6vJIjt1deSeKiYMoKToFkmb8+Dt7
         wV6kuIrYvWTKPs3ofiOFWq+KiXn12Go+0BJWtJKZxjvjwKEFWu/RB5HknYEZCdJKIEp5
         ItkEKYP2fy+ys4nweHLm4J8bg9n205EUY7mEwat69NESmQoXvqUNQhglfIcP88WKygLE
         DFJQSFFakdYokr9m/XLAvp1D6ip3zKttUdu3D5oOT+Ezha3JFJ8AMlNx5x68vUG/9el+
         VMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740662036; x=1741266836;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RvYJJ5olkrH8g63o2yNdqaycpGOF7BuYhXeUvp7CudE=;
        b=BdjS56hp0oTLUF8HQPCpNmcN6R4AST6JjQ3vgKBJooO7toDdErXuf15YEPO9Te5x3e
         h2YhDf9Ky5EvKYrSY4jU5wA3vmJ7aIR/975pBoFZPaMae2aIjacIsHnKcpEEnX/VwwAv
         VBCRSXa4aRceioei9lXmW0RBQspkvx9lpeM5uStj9FNJ5nM/o3WJjVHMiEMJ+nXIAUVC
         l21qSQZ4JtGA+XfRdG3Meft/ddUBL+HBs0yLbPqk9sH0KXOaVxncXXQwSFS2K85L9DRS
         U8BXRYXxpHnugwHieij7o0MGudqYNfDQnkwk0xcNQGlzL4Eo1DiT+SwfV7uR1UYHv1mn
         Hs7w==
X-Forwarded-Encrypted: i=1; AJvYcCUtbKSsUUNHBWF1E6k5W3u0HmBGvivlAJ+/W+EH4sS+c5f2zv3RRYPrVJ6jxcU6SQT2dH/7KDjInatx@vger.kernel.org
X-Gm-Message-State: AOJu0YwpXqxwrlqpz4AAwH7tvh87lLWBCTrthu3CJicO0AW03TI7nQZr
	i96pF5KeLX2OVGhJ2SWHlNjI1PculPyIVuRjwNRjHlFoyXTWUQERkxj6o/Tg7EI=
X-Gm-Gg: ASbGncuKW5qns80s8dDysthbuGd3883LoDggmEnmTaEYfbVql3fzU+84YrpQURMeD9/
	ruZELwJdpbUbTbvaxORBoNKtxayj463kk0rkwOHmLcTAEvp3QK3UyL9+hU3YeLXRng1Hm8YQc8x
	KYHpDkCmQ9vd/xMhbDPv27SSQKIl4vE45rJhuUB35ciM6NrMoXMoiz/lmsNKinC3zWSVSMtDo2i
	tuokZeyctsbq2raXz5px276i+5gZlcOUwtxz9/c0YbmpRh2Pm2ALBK3/urmbGjTFBk1I16A/P+s
	UDjzStNn9NV6AChFt/iJdSJ4fBeqnA==
X-Google-Smtp-Source: AGHT+IE6n/c7/bx5gCSXDTH8aoqU0z7nzFeeaoRQoyzForW+cjpxgZs3kJk+NvWIxEA4pl6DiSKyiA==
X-Received: by 2002:a05:6000:1864:b0:390:dbf5:407b with SMTP id ffacd0b85a97d-390dbf541d3mr5027668f8f.28.1740662036128;
        Thu, 27 Feb 2025 05:13:56 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4847e62sm2021619f8f.67.2025.02.27.05.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 05:13:55 -0800 (PST)
Message-ID: <503e105b71fa4271f40a2d3ca18ba13ed7d45a65.camel@linaro.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: mfd: add max77759 binding
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	linux-hardening@vger.kernel.org
Date: Thu, 27 Feb 2025 13:13:54 +0000
In-Reply-To: <20250227130451.GA1783593-robh@kernel.org>
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
	 <20250226-max77759-mfd-v2-3-a65ebe2bc0a9@linaro.org>
	 <20250227130451.GA1783593-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-02-27 at 07:04 -0600, Rob Herring wrote:
> On Wed, Feb 26, 2025 at 05:51:22PM +0000, Andr=C3=A9 Draszik wrote:
> > The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> > includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> > Port Controller (TCPC), NVMEM, and a GPIO expander.
> >=20
> > This describes the top-level device.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > v2:
> > * rename expected nvmem subdev nodename to 'nvmem-0'
> > =C2=A0 I'd have preferred just 'nvmem', but that matches nvmem-consumer=
.yaml
> > =C2=A0 and fails validation.
> >=20
> > Note: MAINTAINERS doesn't need updating, the binding update for the
> > first leaf device (gpio) adds a wildcard matching all max77759 bindings
> > ---
> > =C2=A0.../devicetree/bindings/mfd/maxim,max77759.yaml=C2=A0=C2=A0=C2=A0=
 | 104 +++++++++++++++++++++
> > =C2=A01 file changed, 104 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml =
b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..87e3737896a289998a18b67=
932dbccacfb8e3150
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
> > @@ -0,0 +1,104 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/maxim,max77759.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Maxim Integrated MAX77759 PMIC for USB Type-C applications
> > +
> > +maintainers:
> > +=C2=A0 - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > +
> > +description: |
> > +=C2=A0 This is a part of device tree bindings for the MAX77759 compani=
on Power
> > +=C2=A0 Management IC for USB Type-C applications.
> > +
> > +=C2=A0 The MAX77759 includes Battery Charger, Fuel Gauge, temperature =
sensors, USB
> > +=C2=A0 Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: maxim,max77759
> > +
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 interrupt-controller: true
> > +
> > +=C2=A0 "#interrupt-cells":
> > +=C2=A0=C2=A0=C2=A0 const: 2
> > +
> > +=C2=A0 gpio-controller: true
> > +
> > +=C2=A0 "#gpio-cells":
> > +=C2=A0=C2=A0=C2=A0 const: 2
>=20
> Why do you have GPIO properties here and in the child node? Either would=
=20
> be valid, but both probably not. Putting them here is actually=20
> preferred.

That's an oversight, I meant to put them into the child only, not here,
since the child is the one providing the gpio functionality.

What's the reason to have it preferred inside this parent node?

At least some bindings do specify it in the child node, e.g.:
delta,tn48m-gpio.yaml
kontron,sl28cpld-gpio.yaml
xylon,logicvc-gpio.yaml

Cheers,
Andre'


