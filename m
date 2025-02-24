Return-Path: <linux-gpio+bounces-16525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A9EA42F85
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 22:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D31F81787FC
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 21:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545B41E7C0A;
	Mon, 24 Feb 2025 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RTijXo78"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF221A2397
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 21:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740433933; cv=none; b=WiZtLH5EXqYgkLjj/75pMBWIcD8Xfd7j/4M8K6jL2RmdoXVuWqGX5MfyPOWKRxiJwZaoSrv3a6WleVdh5yGYVMq9eb966F6dKp+/0VIVhmC96AVEFo6sRAp6whnDYRtLctYV8OEccmxxltftWjA/9/15At7hZRAW9HuTsEGU7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740433933; c=relaxed/simple;
	bh=7vTZ4bcifDx0uBbn/YdD+tR5nT8QjS33t2BFPkAir4g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BghHmY9RmFpSdF6FGfe0gzVnAYVXbWC0e+OVklg9nZ4n5AYXFef9jrEioF6RBjzipAgI4Xoj80OOZv3NbEJhamqWk9fVyUPbihj8GZBHhkhJoHAgU9ZaZatqqFmH/8rX5yPGuHsQHNfJfK8UL0ln9kGyLhzXGreOtLjqM/1TIV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RTijXo78; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4397e5d5d99so30471065e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 13:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740433928; x=1741038728; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7vTZ4bcifDx0uBbn/YdD+tR5nT8QjS33t2BFPkAir4g=;
        b=RTijXo78K7Nkv6aS8jriXBFtU45mxiRA841f06CFVKYew5ga2WuR8XL/6K05nsw/l3
         cwmsN4Q42fRCWBz3Oaut7qoUBOqG26O4crrzPnUsmDRwCq6DjZkAHHEPFtajNhYps3i9
         J9DkOwGW7zJnp53siwqPF8N5IQt+4HKvR/9iPUP2roG0b7kTJKbwMXO3WlPhXFOZAMSZ
         nss9LCsXb7EZrLZ+Xny7d7HoV/31YXZdlLTrClPiMz4J7ex7sisPprFSwld0qE1SZUwA
         j2m67KCrtTtHsAGg4ARX62FlqO72YI50tHJhPgzf+R9sHLMll3ufUy7MHmj39cUKvqet
         2a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740433928; x=1741038728;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7vTZ4bcifDx0uBbn/YdD+tR5nT8QjS33t2BFPkAir4g=;
        b=GdxN0j8y70WarebfhIjWTtfJqmREigXUNEO7M/9J6yoC0exWtHVnLRuUMB6fm/CQY7
         AR5U5Xcx12oXePKgI31HIcn+Va7fK47LluVFs8n10K2nxYqFSbhPSfPr49XzlywxBAdU
         xeQwiicgt6k3uYr6ZmGWMPrcvqjPBSzdTG96l92z5XUOVTCkI6cealV7pPhqivPGB4Qg
         XO2U83T7i1zRYO/LzcGWi2HurcVQR2FXS+1YNWCWTxLLaNbbtK42cTg9vp4AJKJ9lrQz
         npHgrxhRoZbemvMfeliqIxbRmXnZ3ir9/LYZhPrVMx9MLP51nk43DrhLZ7woWzd4eGPh
         WVLg==
X-Forwarded-Encrypted: i=1; AJvYcCXTsfD/3YvGvzGuRKsj+tdZ0TQX8H2ppvIMohe/TZHyWEHl0WFpR+KMSBkCot5T5Zu0ijdF+8asB5To@vger.kernel.org
X-Gm-Message-State: AOJu0YwWd8pmbqiVffpA+VTF5okt/GXdLosxSISRMg/AAhvUyUM8ZFCo
	OiWUn0J9nq+Rgabz26TOVb/ekoKCxgDrfA3esO7ZrzSCXwFLx4DvIwiH2vpRqio=
X-Gm-Gg: ASbGnctjPeQTkj0w1ymH93ILAJ/PkgkRWkiGs/T2R4d0a9F5R6/+hzW8TL48w3WlcRr
	ZXuPb4RKvuurWI+B4HyUx0hdjfzuV0Trf2IU6M7J3w92ENT16fxp8rdjkgSdmQpecAhEuDRKJ7s
	OSBEH4nNnNny0CK4SBSCH1KFXNeHuUP/OELeQGntUTRdMoTBLJNEdV8VKmeDk4bbqSNMDlI9Xvi
	J/DxjH1k1wU3ZB6Dj50q5FfELGrGa3BURBJLRTNy6UugjfThAuzEgvZRMixdHRaozY34Z+yvlXq
	CX5sKaDs8vcEY/FwhZAm1NHp+SaeOw==
X-Google-Smtp-Source: AGHT+IHmJNkurL7RO4E3X7dffqrJqghhJyUiAOpbxbEyAGEjCiGP4Aji7mTnE2UrlwDFQi5MR+cgww==
X-Received: by 2002:a05:600c:468c:b0:439:a1c7:7b29 with SMTP id 5b1f17b1804b1-43ab0f426c6mr7915255e9.17.1740433928545;
        Mon, 24 Feb 2025 13:52:08 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd88371asm216037f8f.57.2025.02.24.13.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 13:52:07 -0800 (PST)
Message-ID: <854925a6204f36fff6d653bb4a30c55a6adb3aef.camel@linaro.org>
Subject: Re: [PATCH 2/6] dt-bindings: gpio: add max77759 binding
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
Date: Mon, 24 Feb 2025 21:52:06 +0000
In-Reply-To: <20250224153858.GC3137990-robh@kernel.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
	 <20250224-max77759-mfd-v1-2-2bff36f9d055@linaro.org>
	 <20250224153858.GC3137990-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rob,

On Mon, 2025-02-24 at 09:38 -0600, Rob Herring wrote:
> On Mon, Feb 24, 2025 at 10:28:50AM +0000, Andr=C3=A9 Draszik wrote:
> > Add the DT binding document for the GPIO module of the Maxim MAX77759.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0.../bindings/gpio/maxim,max77759-gpio.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 47 ++++++++++++++++++++++
> > =C2=A01 file changed, 47 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio=
.yaml
> > b/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
> > new file mode 100644
> > index 000000000000..9bafb16ad688
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/maxim,max77759-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Maxim Integrated MAX77759 GPIO
> > +
> > +maintainers:
> > +=C2=A0 - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > +
> > +description: |
> > +=C2=A0 This module is part of the MAX77759 PMIC. For additional inform=
ation, see
> > +=C2=A0 Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
> > +
> > +=C2=A0 The MAX77759 is a PMIC integrating, amongst others, a GPIO cont=
roller
> > +=C2=A0 including interrupt support for 2 GPIO lines.
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: maxim,max77759-gpio
> > +
> > +=C2=A0 "#interrupt-cells":
> > +=C2=A0=C2=A0=C2=A0 const: 2
> > +
> > +=C2=A0 interrupt-controller: true
> > +
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 2
>=20
> You need to define what each interrupt is.

I think maybe the interrupts property is not needed after all:

The PMIC has one external interrupt line (described by the top-level
device), and the two interrupts here are just a representation of
the PMIC's internal status register (i.e. top level interrupt is
raised when status register for one of the gpio lines changes,
amongst other things).

The intention is for a gpio driver to just treat and model them as
cascaded interrupts, but they don't need to be configured in any
way via device tree, as everything happens internally inside the
PMIC, there is no board-dependent routing or trigger type possible.
(Of course, there can be drivers subscribing to one (or both) of the two
cascaded interrupts here, but that shouldn't matter I believe).

Does that make sense? I added the property because
Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
says it's a requirement to have an interrupts property, but I
believe it doesn't actually apply in this case as there's nothing
than can be configured.

Am I missing something?

Cheers,
Andre'

>=20
> > +
> > +=C2=A0 "#gpio-cells":
> > +=C2=A0=C2=A0=C2=A0 const: 2
> > +
> > +=C2=A0 gpio-controller: true
> > +
> > +=C2=A0 gpio-line-names:
> > +=C2=A0=C2=A0=C2=A0 minItems: 1
> > +=C2=A0=C2=A0=C2=A0 maxItems: 2
> > +
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - "#gpio-cells"
> > +=C2=A0 - gpio-controller
> > +=C2=A0 - "#interrupt-cells"
> > +=C2=A0 - interrupt-controller
> > +
> > +additionalProperties: false
> >=20
> > --=20
> > 2.48.1.658.g4767266eb4-goog
> >=20


