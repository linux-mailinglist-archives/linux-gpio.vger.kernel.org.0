Return-Path: <linux-gpio+bounces-16652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E39A468B4
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 18:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 836D4188911C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 17:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F244422D4E2;
	Wed, 26 Feb 2025 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QlH9EHuA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A34C22F3B0
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 17:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592610; cv=none; b=BBz1URyF5k8tM+euBGlJ4UZxJdhz7gGFmVYyCaHs7SbM5sFEBIAQGuASGluw5qPsGlmBKate2jfn5bb78n4HusIR7/ojq5HElui1FvC36Cs/dy4YCrSwvDgAY34Hke0XcWpCijnvYgpOw2GIafROffUlq/0VR1nksI6tnkCW6tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592610; c=relaxed/simple;
	bh=U8EjsXn8hthZd5WnCdsOmkpAAV6+VKIGUBqWIRaY+iI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gkrr2XuXNhITf0Z98qTAR/IROp4MiWEPCBQi/kExTcm9hpM8FrSXl1InDauJEsht8Iqn81fZtk6dzwA5fIwvh1OY2aVZWI1Zwvvqnh+SA2mkE4DD6ZAdRFgaVL6mdsJZWisk4pNb1/mMQvtOoXPuyYuWjuKq8MdrLY3h1ZvHpsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QlH9EHuA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390d6426f1bso630741f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 09:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740592606; x=1741197406; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IQ1ie5P4f3zQ3Bmnzk4jBndSv2upreQmxRiSWOb230I=;
        b=QlH9EHuAuRerdMHTmbjR5b8xrxGgRglOzbY/6+i41QNkpwbb/RRITEgnpl3vOymKVu
         DhCn3Bsd5mdsHGuWbkibasoIah8vs5Q561WoDUVd2WCFH+ofCtLyYCU6JAZy/cKdmvsY
         tG2oXY0OEqety8VFf76JwAAUA6azcRqN6+F4J4u2R3EHFV538GOUo0CM0iDJTEA2eMvz
         d2BtMd4eaZ9ii6qm96E5WpGJsWBQd6FlEpcyZsKkkpFxNgHqYfBNAkDS7TR3jt0aISUI
         ev6qJMCKIzaeO0jNDx3ZLuWnkdEnuQBkim6nZYBxssGlNlRwswBHz5EsQvhVNoYaMZ9K
         3iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592606; x=1741197406;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQ1ie5P4f3zQ3Bmnzk4jBndSv2upreQmxRiSWOb230I=;
        b=s8Q3Ug3sLxuUqm9H7G2F+vPVylYyKwAOaaVdu4G5uIeVbLVWHseiaDhWV8578ky32J
         2Hr08/7I8TmYK2exoVwmTehX2u1anu8ecRRXyC/fgMrRQbA4g0x2n2dmtpu8m5pQzbT+
         3ZtvxadZ28nJExkPmmRusp1Cim2o1rEZczwa7LCVmczubH8M/Btjwu02hQujR3ZVtoPk
         rpaRxtEGIgJ82Ouw+a3+ek1tZjH3JyeSJEu82KsXyCVDVcos9rhwzWYoEUixZV06XJOU
         805Ri8Yij4iRibNXALahUCrmNguUS5ks584uWFeWA6Hsw/PXFIHcF9sy+BLB8W9BCNWS
         AP8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxaJOOuwFSBw+LcF4twY1+S5XLd3ahhRNE6ocMyU3TjUbsTkTfGgF+A2NZvwQPEAI7pILe1F8ReA/t@vger.kernel.org
X-Gm-Message-State: AOJu0YxLWLybMS6AwKmHM4zqgXQuuBtKe3dY8wGTWfweXsX00YQXn6Fu
	NHrhgsBI8dqKUXLdYMdQU/AtqCa/ARFSxaDeNTMi870Gxi4E88uVCTwbpsqOHBQ=
X-Gm-Gg: ASbGncv2dJwpDDuZyI0GlMK8byDhNELVn9VLUMr63pKxI/L8LXsExV3Ho22aUQo8bTX
	TWcpMtyCDLacEwFZAQhZamBiI+9aiGe5RIJ4HTXmy0trF0MXHB9CbLvwZ/POPBFL0H2kQ6kPTkX
	7RmvVg2B3vv/7Aqe9LOVBLfw0DGJy76fscdxzVQDy30ZppIZK+woeuOyj7mpx6Y960KCCtXRAuJ
	3yA++cQqyrS90zEnBEUvDn4Z1T/K6En3Wb8Qdvqf4dGZml2qYPsCdTdXtUvC3nS/rBZWAbTepuc
	Xd+4VPGQFgrTJMVBwiwz1S180YYYtw==
X-Google-Smtp-Source: AGHT+IEBNkLMPMj9+puIgcT6KXydMqr4dpitTxkeEa4qusNjXwjam9ho838YGBqllbydfQzyijAD/g==
X-Received: by 2002:a5d:64e5:0:b0:38d:e3fd:1990 with SMTP id ffacd0b85a97d-38f6e4b223bmr20340023f8f.0.1740592605805;
        Wed, 26 Feb 2025 09:56:45 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5442c0sm28868475e9.32.2025.02.26.09.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:56:45 -0800 (PST)
Message-ID: <5cce915b5a22cff1d538059d79c152b83c99a265.camel@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add max77759 binding
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
Date: Wed, 26 Feb 2025 17:56:44 +0000
In-Reply-To: <865e878e79a4e5c3a7619bedd81cc8bdb00a4914.camel@linaro.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
		 <20250224-max77759-mfd-v1-1-2bff36f9d055@linaro.org>
		 <20250224153716.GA3137990-robh@kernel.org>
	 <865e878e79a4e5c3a7619bedd81cc8bdb00a4914.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-24 at 16:05 +0000, Andr=C3=A9 Draszik wrote:
> Hi Rob,
>=20
> Thanks for the review!
>=20
> On Mon, 2025-02-24 at 09:37 -0600, Rob Herring wrote:
> > On Mon, Feb 24, 2025 at 10:28:49AM +0000, Andr=C3=A9 Draszik wrote:
> > > Add device tree binding for the Maxim MAX77759 companion PMIC for USB
> > > Type-C applications.
> > >=20
> > > The MAX77759 includes Battery Charger, Fuel Gauge, temperature sensor=
s,
> > > USB Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
> > >=20
> > > This describes the core mfd device.
> > >=20
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > ---
> > > =C2=A0.../devicetree/bindings/mfd/maxim,max77759.yaml=C2=A0=C2=A0=C2=
=A0 | 104 +++++++++++++++++++++
> > > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 ++
> > > =C2=A02 files changed, 110 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yam=
l
> > > b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
> > > new file mode 100644
> > > index 000000000000..1efb841289fb
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
> > > +=C2=A0 - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > > +
> > > +description: |
> > > +=C2=A0 This is a part of device tree bindings for the MAX77759 compa=
nion Power
> > > +=C2=A0 Management IC for USB Type-C applications.
> > > +
> > > +=C2=A0 The MAX77759 includes Battery Charger, Fuel Gauge, temperatur=
e sensors, USB
> > > +=C2=A0 Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
> > > +
> > > +properties:
> > > +=C2=A0 compatible:
> > > +=C2=A0=C2=A0=C2=A0 const: maxim,max77759
> > > +
> > > +=C2=A0 interrupts:
> > > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > +
> > > +=C2=A0 interrupt-controller: true
> > > +
> > > +=C2=A0 "#interrupt-cells":
> > > +=C2=A0=C2=A0=C2=A0 const: 2
> > > +
> > > +=C2=A0 gpio-controller: true
> > > +
> > > +=C2=A0 "#gpio-cells":
> > > +=C2=A0=C2=A0=C2=A0 const: 2
> > > +
> > > +=C2=A0 gpio:
> > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/gpio/maxim,max77759-gpio.yaml
> > > +
> > > +=C2=A0 reg:
> > > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > +
> > > +=C2=A0 pmic-nvmem:
> >=20
> > Just 'nvmem'
>=20
> TBH, I'd prefer that as well, and I had just 'nvmem' initially,
> but that doesn't work:
>=20
> .../maxim,max77759.example.dtb: pmic@66: nvmem: {'compatible': ['maxim,ma=
x77759-nvmem'], 'nvmem-layout': {'compatible': ['fixed-
> layout'], '#address-cells': 1, '#size-cells': 1, 'reboot-mode@0': {'reg':=
 [[0, 4]]}, 'boot-reason@4': {'reg': [[4, 4]]},
> 'shutdown-user-flag@8': {'reg': [[8, 1]]}, 'rsoc@10': {'reg': [[10, 2]]}}=
} is not of type 'array'
> 	from schema $id: http://devicetree.org/schemas/nvmem/nvmem-consumer.yaml=
#
>=20
> I don't know if this can be made to work, i.e. can you have both
> in yaml? Can a type be declared as a oneOf or something like that?

I wasn't able to get this to work with a node name of just
'nvmem'.

If anybody has any suggestions, I'll gladly try them.

I've renamed the node from pmic-nvmem to nvmem-0 in v2, though.

https://lore.kernel.org/all/20250226-max77759-mfd-v2-3-a65ebe2bc0a9@linaro.=
org/

Cheers,
Andre


