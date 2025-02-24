Return-Path: <linux-gpio+bounces-16491-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0518A41FF4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 14:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED5693A28D8
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 13:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4E723BCE5;
	Mon, 24 Feb 2025 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X/ImWc/Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DD0802
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402590; cv=none; b=u048yK26gDzFQHp488BSyEC62cC2FWRjV4YRiO110FFICHBJVO/ojJQrr0hF85nHeuM7hyJKhzAXTkyOcGGyA9rVzp/rEAyLHtUWjx6ZfqaNKlUXiO5kgyVyYMEZssnJfaeqJ7NXZ5JtRTNNh/NYh/JWfZFgUeDIiBlLFkvb4Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402590; c=relaxed/simple;
	bh=3GoOSlh4aghrEUhFA8T2QcZ172IFZvBUU3F8aELhD30=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S8oz37cm1NH3cjnjdXwk+KsUGhUM7BOA484aoOiT73ckOysE6x6Xyy2J5uxNWVd61BNKGXDtIZ+iguQeU8xNHnhcmgzMmLimYGm4vAY590wPzNQx4gPP3hAIcyJY3M82mLajxEPVCzbqS+Ld2ULKEDfV7ntffDWBpNym3vX4LSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X/ImWc/Z; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5df07041c24so6453196a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 05:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740402586; x=1741007386; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6JKe2d60+WlSAD6t2/IsKdHC5kmJu+MWZz25xMIMoOk=;
        b=X/ImWc/ZycJpFHnbG77sHqyNxcGhsoaZINYPHgWhQMUtyZDcpf2orE5MBgOWANT7Fb
         3YYtAx9KDXD7M4E++gxGXvUS7Ae80Rg0HVOqKc/aJSu94aUb320OgtnO9/34j2f8rybD
         Hz1HX00bOh8QepajgY8HYXJASJi5lNfZHgtdq/oGPFv256V/8S5eo3W9epQ4T++TvLxU
         GFFBMnPNn1XWbyGnVopytea9Z6WJuUIb+keJ+ijqN3Hq+ieNmCtWX2UJ9EreE+l/pxCX
         fQin8STWRJrEj8pg64BQIe8+UEZis0mDI8zQ54MaayQEXxhg1RfizXy9tsx4VLghI2oD
         Ehgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740402586; x=1741007386;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JKe2d60+WlSAD6t2/IsKdHC5kmJu+MWZz25xMIMoOk=;
        b=Ix1FJq7HhVrhcd7pSH6xfms8jSzKN/P099IQo7Ju2gq/zTl0mVH1H/2Tm22FFcv92P
         wmvqGU5VWNjJ3/YHAD0PLnGiVYDXixNJjrdOf8x+085Mry+rmrftBPyOifFxkp00OBO3
         /Wb50HU/5mcjdppfVhb+Fvbs4bIG6PBvdGqYRPwGgu25Z7BYxZIfUMZhUQ3O9/GMxzeA
         KPgp+YxJPtYv7I6YahE7NeXY6/nrrpE3Al7xZ4DFiqMTx6jw4ISXB1OjoRZt+4zIRD4L
         7VU9IwKbEwTtuizccapqXKXA5fcbn5WTw7/QbTDIGm0lyy540tD9qNqCbBPulA5nxF+r
         DJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOzwfjOUpr4c3OZ/v986P58Ma+hRBBvPnO3l54XlXcUUmQPi+2bLqAqsyI7NCG4va0ywMaZ9RE35YP@vger.kernel.org
X-Gm-Message-State: AOJu0YzG8D1oEfcYGAIJFUMlfdgN+7ebCxznThCVsbbhUR8A6Mi3Ul3h
	6ivSUks0qsWU1CSrqI7rA2ZHXSzQ4pIn4LrH3SNv1v0MT2qoRNaryZCj8XnfBkGzrze7XhnxHZ8
	+4xc=
X-Gm-Gg: ASbGncu3jCvO/jLC92n08WMVXM3ortePO6o6FR94sGfbuQ5U8jb+caf/9fOAIdjq+y0
	fvRDXm/j8H/JpxqLK/poJ83cKp9zVgHPjOqwLqTGqpEsp+Y9NPVWEcpjebdcLWgeb7i3R638TXZ
	4lZC8DqV7s+Z8mXoQEf+pSC5LLRA5lrsYdjFoKmEvnJPZz/WGWk/IO5etxibmTg6JFjWI8FmCzf
	DeemZqwrTwnwR5ChL5uMXYovFVbaYBgc9m+ognkLqFPweRl82oPQHAarnOwou1hUFVpbDhDEYs0
	dO6FEEETI3VHDmVd8VzAZPMay2WvqA==
X-Google-Smtp-Source: AGHT+IHIvx/Mzi0ATkCEL7v8mqxYPxS778o/u734+8lN1qwnKFPkNnFzPQqlUpq/kfgg00sUP03rEg==
X-Received: by 2002:a05:600c:358c:b0:439:84ba:5760 with SMTP id 5b1f17b1804b1-439aeae1c8bmr110053185e9.5.1740402145511;
        Mon, 24 Feb 2025 05:02:25 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02e6cf4sm104593555e9.19.2025.02.24.05.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 05:02:25 -0800 (PST)
Message-ID: <923badeacb9e52b78d276382ae8c06a47c44fbae.camel@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add max77759 binding
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, linux-gpio@vger.kernel.org,
 linux-hardening@vger.kernel.org,  "Gustavo A. R. Silva"	
 <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, 	linux-kernel@vger.kernel.org
Date: Mon, 24 Feb 2025 13:02:23 +0000
In-Reply-To: <174040128694.2418814.685647591949303616.robh@kernel.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
	 <20250224-max77759-mfd-v1-1-2bff36f9d055@linaro.org>
	 <174040128694.2418814.685647591949303616.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-24 at 06:48 -0600, Rob Herring (Arm) wrote:
>=20
> On Mon, 24 Feb 2025 10:28:49 +0000, Andr=C3=A9 Draszik wrote:
> > Add device tree binding for the Maxim MAX77759 companion PMIC for USB
> > Type-C applications.
> >=20
> > The MAX77759 includes Battery Charger, Fuel Gauge, temperature sensors,
> > USB Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
> >=20
> > This describes the core mfd device.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0.../devicetree/bindings/mfd/maxim,max77759.yaml=C2=A0=C2=A0=C2=A0=
 | 104 +++++++++++++++++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 ++
> > =C2=A02 files changed, 110 insertions(+)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/m=
fd/maxim,max77759.example.dtb: pmic@66: gpio: False schema
> does not allow {'compatible': ['maxim,max77759-gpio'], 'gpio-controller':=
 True, '#gpio-cells': 2, 'interrupt-controller': True,
> '#interrupt-cells': 2}
> 	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77759.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/m=
fd/maxim,max77759.example.dtb: pmic@66: pmic-nvmem: False
> schema does not allow {'compatible': ['maxim,max77759-nvmem'], 'nvmem-lay=
out': {'compatible': ['fixed-layout'], '#address-cells': 1,
> '#size-cells': 1, 'reboot-mode@0': {'reg': [[0, 4]]}, 'boot-reason@4': {'=
reg': [[4, 4]]}, 'shutdown-user-flag@8': {'reg': [[8, 1]]},
> 'rsoc@10': {'reg': [[10, 2]]}}}
> 	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77759.yaml#
> Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: /exampl=
e-0/i2c/pmic@66/gpio: failed to match any schema with
> compatible: ['maxim,max77759-gpio']
> Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: /exampl=
e-0/i2c/pmic@66/pmic-nvmem: failed to match any schema with
> compatible: ['maxim,max77759-nvmem']

The top-level example in here references the two (MFD cell)
bindings added in the two follow-up patches for gpio and
nvmem. When all three binding patches exist in the tree,
the errors are gone.

Is this acceptable, or shall I add the top-level example only
after the bindings?



Thanks,
Andre'


