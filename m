Return-Path: <linux-gpio+bounces-16513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A11A42750
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 17:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36BBD165D01
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 16:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1632627E6;
	Mon, 24 Feb 2025 16:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pDs1C4yW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F5261565
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 16:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740413188; cv=none; b=QEQLwCbzCEGW1O7PcRQqMQCjajW33oUtfmiZeKnDVGGEqjh1j9YPLTm/jseBzfGwWsitiWQ3mltIwep1rJzp+T2KwBDia/RHcDmQ/Y3wxYCoXLDUcHlXFYLQTP01H3q2v/dXMXUsIhQ55WSa24deW970iE5hUMXGTDVMv2xhDqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740413188; c=relaxed/simple;
	bh=1lPb0mbbK1/GgDpWpIsiTfo1oZzYm3txjSj9Ii8DEzI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=igckd3WDNcg2Pbu+/Ek/wUnwFy8B7Jkf8T5BUsqOM5r0+AB9GqMlIbLYxVvvz0s9rP665i+fxMIrybJEZzDO4QAcFa5iT0KaMvGStimZommkObxm0fzfqdPzIwqbSgPIWDj4tLduxxHfGEYzSxCsobUwDX3kF3Ug8cV4dAGPs0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pDs1C4yW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f286b5281so2266404f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 08:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740413185; x=1741017985; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1lPb0mbbK1/GgDpWpIsiTfo1oZzYm3txjSj9Ii8DEzI=;
        b=pDs1C4yW1ltaw6oZr1cI1Fn5kVn0Jyy5V5qc2gw1/rYyp3dACXYAqTjI4qtj08oZuo
         qg0dfIrJTF4YkuHGFd7X96WZoFB5SS8/BTBLYyxgzprzhjbL8NHq6EN9EPQ+g8dru+ir
         Am0WlThhmUZrsGSqDBxrC8i9ZXy5pFQvcKgDAsDe0gLSa5PjgAeXf4e/H6ilba5w0QS4
         HemAv4AkxewywSDx3uC1HfFMn9Wn9vUOTHz/DMz97VcXF9ALef7UgYrPe8WNaFU6Tl2U
         BxFXu/vADIYJ1b7K40fr2OQxWWAN3k5j2NiRne8QQmyZmwfDl/XGLzDhS96Zf4GrBPut
         Q/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413185; x=1741017985;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lPb0mbbK1/GgDpWpIsiTfo1oZzYm3txjSj9Ii8DEzI=;
        b=UAyexpnwgQIeJJw1IkHdVOgGX7ora/B6dnsajMJ67s9jVvyy6A3CJrguMH+H4EoEpt
         ShyOGUXZiEoYknCMQU7SGtm9veOCq5ZpQEJWMRITlWwBlE1Yy5aXt8+Xs8U67uiLkQ8h
         +Ds+YCSysh0NNMYu+SyikEyLKVJxbupvcEQ62O42VSsti9CSbwm2hnUHUdLWTMvvpaUd
         dWSPKx9rtmpIqXlQAXV7+dtnatQpm8VNPX74qzOGVUD+wuEGKlaXl75Edy0Mc8rx0Y3Y
         IEf/rE6SUkiZq9LcMvRdh81HbqoGnuJZnj85Re79+CtJIP50Ba2tfP/Fo66URoG2pbmV
         a6eg==
X-Forwarded-Encrypted: i=1; AJvYcCWY0ea6ZrkWijRztUVTptVLQoN7RjMdvygC+L/N1jfLMqkw2WA35R7qtLnS7jD+GyCraw/9FGHlpHyu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy41s7V6nJF2aAVXuISXIl6mSBXe8FKAiU7b0BFl6KAGdIzqvDV
	iDZL9StH+wtbvDB4IqscGPLjJ0Bd7mmETAGyVBIHkgRBL89RBmUDkS90l4vON+s=
X-Gm-Gg: ASbGnct6JBZCUiqLrW++D/z+v9ULwwZcbSGwSKD1eP2w7+k8f0odd3BQhjRaqHVIZX3
	/JjcsMBcz0T1w6l9jScp8keY5tcyP9QQsC60zRGPNUzGrtuZ+lS1AsVfewtWnwOog+p7h2FXo5D
	zgd9RuGKE0PbMpR/Ll5SndFLBZZ/PaGS/aSqqZ/ahnlDbev0pKVFSDnOynaeazYaWpJcetCECF9
	P3Wajwh6A8W86bjDLifRSIj5+fE5bxzaU5HMnVwI7sw1AiEfsv04eE/GhD3GaMZkcEcYflag6TX
	mB+Opd3NNaCdUsqQ7WxuahcF6EKz1w==
X-Google-Smtp-Source: AGHT+IHDjbFd0e/4R4E/diPCOLxfh+kIt1RSnJVnG9lafyp0jKqqhyRxDcGuBARHUlScjPzrgRWSCA==
X-Received: by 2002:a05:6000:1845:b0:38f:4f07:fabf with SMTP id ffacd0b85a97d-38f70865357mr11686766f8f.53.1740413185111;
        Mon, 24 Feb 2025 08:06:25 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm32844514f8f.94.2025.02.24.08.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:06:24 -0800 (PST)
Message-ID: <93f69c1442bf3c5c53a581ac27c6b7f7dd733c0d.camel@linaro.org>
Subject: Re: [PATCH 3/6] dt-bindings: nvmem: add max77759 binding
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
Date: Mon, 24 Feb 2025 16:06:23 +0000
In-Reply-To: <20250224153820.GB3137990-robh@kernel.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
	 <20250224-max77759-mfd-v1-3-2bff36f9d055@linaro.org>
	 <20250224153820.GB3137990-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-24 at 09:38 -0600, Rob Herring wrote:
> On Mon, Feb 24, 2025 at 10:28:51AM +0000, Andr=C3=A9 Draszik wrote:
> > Add the DT binding document for the NVMEM module of the Maxim MAX77759.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0.../bindings/nvmem/maxim,max77759-nvmem.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 50 ++++++++++++++++++++++
> > =C2=A01 file changed, 50 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvm=
em.yaml
> > b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
> > new file mode 100644
> > index 000000000000..d3b7430ef551
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/nvmem/maxim,max77759-nvmem.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Maxim Integrated MAX77759 Non Volatile Memory
> > +
> > +maintainers:
> > +=C2=A0 - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > +
> > +description: |
> > +=C2=A0 This module is part of the MAX77759 PMIC. For additional inform=
ation, see
> > +=C2=A0 Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
> > +
> > +=C2=A0 The MAX77759 is a PMIC integrating, amongst others, Non Volatil=
e Memory
> > +=C2=A0 (NVMEM) with 30 bytes of storage which can be used by software =
to store
> > +=C2=A0 information or communicate with a boot loader.
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: maxim,max77759-nvmem
> > +
> > +=C2=A0 wp-gpios: false
> > +
> > +required:
> > +=C2=A0 - compatible
> > +
> > +allOf:
> > +=C2=A0 - $ref: nvmem.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 nvmem {
>=20
> Drop the example here. The MFD binding has a complete one.

Will do

Thanks Rob!


