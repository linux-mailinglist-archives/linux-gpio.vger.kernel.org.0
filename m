Return-Path: <linux-gpio+bounces-24884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B73B33A36
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7C171897C36
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C0D2C08D1;
	Mon, 25 Aug 2025 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRjriIhU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0B31F4198;
	Mon, 25 Aug 2025 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113102; cv=none; b=f3BsxnzzsvGAB20KLaGXdwXZ7fhj5RWqEfM3ZwHwdmkA1FRdknL8drM0wud36Y7P56gr74HhGjgjnEAHg4kFw6o7bqvWm2z+0LDlYmVybZEJSpXc3+l+aHe1YJSKF56b7rUw0lZUAwKxlW3VIHEwDQ0XKH4m7oTOcqQdU5lI5SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113102; c=relaxed/simple;
	bh=x+c6BrjmQrqMl/8bNmYcOMK/G4hGL0dIcPdibI66gWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjZ9xNZHkg/6RXxqRylbgDBui1oh6c9oD2mvFHMomTfahqT6Ea+4glh0Kb6xqjf786yS+jrWCjQharhakYQM0VvWOe6l5JXUOFyNSHWjGxHgKKxEMVBmygLhCu/UZuyVO+iDFW0GKIHyyZmDntY/pCZAaU4zqTu10xtl9z6Pz+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRjriIhU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b60fd5a1dso5245435e9.2;
        Mon, 25 Aug 2025 02:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756113099; x=1756717899; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DCuOFYwxz4o6YK+ZyP6M6oLOXp3nZBia4u3KkuMHyYo=;
        b=lRjriIhUejfow7vd2lm3XJSxp/ww0ck9jtYJgT+zLtPuD83aqSgpV4EDZhOOVmqRa2
         02SWLV3i0pgPwoM3An3clqrSP7hxcNroSon7NBq3/Zq2rrHztiHjUKB4R36aK/kKaZbn
         Rg0smFe6OFmgJhSqT/T0ZWMQFpe/ECaaMi6QOMI7iRVKlwfy1jXsIY2MzPcWSq1OTcC5
         dYX6zQ1C0NzuOlOZPBjmsMuHxyHAsi0iNh1934KYw7aLzdqfl7cU1BUMRJspmnLcDPeM
         rrvTmDrqRUHn6NmMzK4mMI2vz44lTVurbeIFGXlWfgooaIfLfYJe/CdueUk5rIWocVZy
         VVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113099; x=1756717899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCuOFYwxz4o6YK+ZyP6M6oLOXp3nZBia4u3KkuMHyYo=;
        b=OTS9qhc1bNJW9LQ1EnbmIl7MpJGWzj2qICeEQr4pUvMKNBQ+X6sDNG7lmwbCJXOOtN
         Rd9E5TUGhPHTdDlg4uFngpPQ39RSqbkic5dYaR4cC1GQlMz7YJny1DoQUwdtUCQDSQ3T
         +x0NecfSLxUpvVoaC53ymg5DnMMLwZeYrlsD/f2daWgoKJLpNhdeZli77UKkDfSxmFcN
         KwcM73RvUYum/HxIi1jMInoNJBF5rNkTwuHhgigI3vogjzFi8LND2lRA63SiZaA/EhlK
         x95KgS8aY1QvGsS5vCY2cfIdUgePlt/mTPbs3RzWOThcytLtRYDa4nDOt32LCyh3mnp0
         T/vg==
X-Forwarded-Encrypted: i=1; AJvYcCU8De3++7HLU2KWIQCVJ8DfNBbN7DZEzozU0dcbf0xKiPqSi++1ahQITNrzipz2964BKKk8NB1xw6EH5to=@vger.kernel.org, AJvYcCUfjG8Dc4KcQmvUdGRqMeh6L6jAIfETmhbAu0DKOuDDEMRqqDvHiQR+mY1sM0NKonsMKkeI+A/BcOwKGBEr@vger.kernel.org, AJvYcCUje5EcEDYdHR6QPAdVi4HPvWWvTxJAi6yTT5JfLKryl9zhsrgmi/jJFBlIvObte6tc7QuAVNaNnxSy@vger.kernel.org, AJvYcCVIKF5tDN55OrGVasKlVp/y1dh+FuxHd9PVpYDa7Zf7JYiRBr0aY5DH55iU7dLuYZm1uMAscfRDZwW/lA==@vger.kernel.org, AJvYcCWbTacmIbv29wBsOfpHHXrDetLlqHuHHyhGg7dTpdwbyP4Glubr405YqmQ912aKWvcHNTyokijexSP1@vger.kernel.org
X-Gm-Message-State: AOJu0YwpWvnZ5e3xjHEUbUuyKnuuQ8pzsGiRDE/1eNV9MXd9SI2F1z4n
	aCnOeZ9vgMbL1v/tA29j7qmokVXGw/oIL81ts+LjTnHbOceUZyiJNxUc
X-Gm-Gg: ASbGncttGlrB9mwqNo0+/+kPgNZFtqPc3C+yXh8PaOVwbpza4ochB+JzWfwwqJ0Vuen
	coGHsWgHwdUf3NbMTsiMMU0Wgsuy379ptPO1mMdAnNi9xKAWSxWH8mz/jbFRS82EOMNEfruSdPY
	dV+lkZJna2ZTtU3+bN/cGnhJNeU9bJLgT8wbIQ3T5OSyWxky5MriKP/1MHTPu3sH2xI1Z6uBJXP
	9RPl6E4LJvVSuJx5a2AzknhKf7+KAfM5RC4hN+Hlf9Pa0REspoK5bsIJXrBGBLW3XnzY1Q8DSjP
	pXXKGLmYRkg44id3cs3PiWhEKEFWrM7knOxC17ywHZRnYxfbu+w+wWtVfO7x29LBSgiOXMU7zTb
	GBNh+GCphMqKNJv+v+prERFMq
X-Google-Smtp-Source: AGHT+IEhx0xp5HZzCjChvt+iGvjSrB3+Rzugq2SXKx8CoWISlw5f6kVeMj6cta5LseKPpxtKIfPj/Q==
X-Received: by 2002:a05:600c:4511:b0:456:1156:e5f5 with SMTP id 5b1f17b1804b1-45b517d27f6mr112084995e9.31.1756113098783;
        Mon, 25 Aug 2025 02:11:38 -0700 (PDT)
Received: from nsa ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b57498d9csm99824125e9.22.2025.08.25.02.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:11:38 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:11:59 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/6] dt-binbings: mfd: Add bindings for the LTC4283 Swap
 Controller
Message-ID: <tpqebtepsnp5slukdiwn3rrcrrxj7cl22vrblrldo4x73e42py@yslhryqvsacb>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
 <20250814-ltc4283-support-v1-1-88b2cef773f2@analog.com>
 <20250814215724.GA3975144-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250814215724.GA3975144-robh@kernel.org>

On Thu, Aug 14, 2025 at 04:57:24PM -0500, Rob Herring wrote:
> On Thu, Aug 14, 2025 at 11:52:23AM +0100, Nuno Sá wrote:
> > The LTC4283 is a negative voltage hot swap controller that drives an
> > external N-channel MOSFET to allow a board to be safely inserted and
> > removed from a live backplane.
> 
> What's a binbing?
> 
> When you fix that, don't say 'bindings' twice in the subject. Subject 
> space is precious.

oh, sure...

> 
> > 
> > Main usage is as an Hardware Monitoring device. However, it has up to 8
> > pins that can be configured and used as GPIOs and hence, the device can
> > also be a GPIO controller.
> > 
> > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > ---
> >  .../devicetree/bindings/mfd/adi,ltc4283.yaml       | 85 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  7 ++
> >  2 files changed, 92 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml b/Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c5e8aec887d9cfad9052a7c28783396efd6804a9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
> > @@ -0,0 +1,85 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/adi,ltc4283.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LTC4283 I2C Negative Voltage Hot Swap Controller
> > +
> > +maintainers:
> > +  - Nuno Sá <nuno.sa@analog.com>
> > +
> > +description: |
> > +  The LTC4283 negative voltage hot swap controller drives an external N-channel
> > +  MOSFET to allow a board to be safely inserted and removed from a live
> > +  backplane.
> > +
> > +  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4283.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - adi,ltc4283
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  gpio:
> > +    $ref: /schemas/gpio/adi,ltc4283.yaml
> > +  hwmon:
> > +    $ref: /schemas/hwmon/adi,ltc4283.yaml
> 
> This patch has to come after these are added. However...
>

Yeah, I realized that when I got your bot build failure email.

> > +
> > +  adi,gpio-pins:
> > +    description:
> > +      The pins to use as GPIOs. The device has 4 ADIO and 4 PGIO
> > +      pins than can be used as GPIOs. The ADIO pins are numbered from 0 to 3
> > +      and the PGIO pins are numbered from 4 to 7.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 8
> > +    items:
> > +      minimum: 0
> > +      maximum: 7
> > +
> > +dependencies:
> > +  gpio:
> > +    - adi,gpio-pins
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - hwmon
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        swap-controller@15 {
> > +            compatible = "adi,ltc4283";
> > +            reg = <0x15>;
> > +
> > +            /* pgio1 to pgio4 as gpios */
> > +            adi,gpio-pins = <0 1 2 3>;
> > +
> > +            gpio {
> > +                compatible = "adi,ltc4283-gpio";
> > +                gpio-controller;
> > +                #gpio-cells = <2>;
> > +            };
> > +
> > +            hwmon {
> > +                compatible = "adi,ltc4283-hwmon";
> > +
> > +                adi,rsense-nano-ohms = <500>;
> 
> Seems like a current sense resistor might be a common thing.
>

At least ltc4282 has the same property so I can add a common property if
you want me too.

> > +                adi,current-limit-sense-microvolt = <25000>;
> > +                adi,current-limit-foldback-factor = <10>;
> > +                adi,cooling-delay-ms = <8190>;
> > +                adi,fet-bad-timer-delay-ms = <512>;
> 
> All these child node properties can be moved to the parent node.
>

Hmm, if I move to the auxiliary device, this will "fix" itself but just
out of curiosity, why should it be on the parent node? These properties
only make sense for the hwmon device.

- Nuno Sá

> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e90710a9b40d7b32c151472a9ac3b02efd95f346..413bb77d5eebe2b51aa9c3af86e7cfd5ab142044 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14500,6 +14500,13 @@ F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> >  F:	Documentation/hwmon/ltc4282.rst
> >  F:	drivers/hwmon/ltc4282.c
> >  
> > +lTC4283 HARDWARE MONITOR AND GPIO DRIVER
> > +M:	Nuno Sá <nuno.sa@analog.com>
> > +L:	linux-hwmon@vger.kernel.org
> > +L:	linux-gpio@vger.kernel.org
> > +S:	Supported
> > +F:	Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
> > +
> >  LTC4286 HARDWARE MONITOR DRIVER
> >  M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> >  L:	linux-hwmon@vger.kernel.org
> > 
> > -- 
> > 2.50.1
> > 

