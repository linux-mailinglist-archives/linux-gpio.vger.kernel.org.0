Return-Path: <linux-gpio+bounces-21362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C91AD523F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 12:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6AC71882114
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB95B2690CB;
	Wed, 11 Jun 2025 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OUeBoSri"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3819267715
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638484; cv=none; b=OVGg6Q0KqWqTIoVL294pHNBQlBBH7Ujkt4HQ+1JViGaQORYvkP2QViBRvdL64Tpm1O8TPl9kiWiBAVOrw3Q4PlKXZXppD+CdylnkiVWeYslInd2UzHMBjKK0EmRlYbQHxySu6zpp9GwwohQGgpyoTb6d1inqmVXeLEdnXZjit+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638484; c=relaxed/simple;
	bh=XBJE0UUkb4WlIJxUnvESJgmCoTguyN2zJQW+GnbUZZs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lbU8tm4PcCyqe5hRhm4aAf7xzz1wLjLvlqznBGXjb/8Bf6CH67PS8HgjeI1nGuGEk4lWd4GEPqT9NSDOJDMm5mcNIEeTqNW/5NVcG6NNh+TPno3nU52+x4l16LOxW6zGim34MzTDz+FxSvI1Z2CS21pDf4b+3L7OPIQItCLWnmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OUeBoSri; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a5096158dcso5476863f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749638481; x=1750243281; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XBJE0UUkb4WlIJxUnvESJgmCoTguyN2zJQW+GnbUZZs=;
        b=OUeBoSriZhcbBzhkpeA4ENMiKTuv7QaJmrmzkWjsWQB2zZ0Dw8YNRbW9t7ghLaAmG/
         tabO+FcTr6+srA2eS2j2mCDKd8IiNFDtLmjVB3dxUyzDaPOrVF+EBYx9cRFUnUYHT715
         Mb6z6vFN407gPMUvEbc2xQP+9D1+y/oklkvAs04RHgQTlhMo23yABdT49r1El0h+F4KP
         cfhZ2ner2/AbopEls3LzDZZz1SKQ8UsKd8BhMlbanUSlzTimnaqg0fiRtkwXWvGtDr9I
         GFdLzOmNBuDJEP98q7Z8rVS/cNgjg3r6vK94T/X/i5tzltNKEz39TQjW48r01alDyoc3
         OmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638481; x=1750243281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBJE0UUkb4WlIJxUnvESJgmCoTguyN2zJQW+GnbUZZs=;
        b=uqHuFlQ1lpaKvWhSLc8FriCXdaYEAO6JhuVV55Gwt9ZMLrz1mUStuN9QlKmCR0dFdF
         oxb20RX3P8uEsIiSJc3gTvJ4N/df3UyQkVwtLf6+pAC+2abEGC3TnLBx1MatWjvnFYQ2
         x4ovLmyOAxYIWMpV7WoK465g8yVKr3ypaaA98RbbVPyrHGNGxG7MpJ1ibWVg3x0wOZOw
         ilN2Pegtd1gRFk5BDI760Ll0oaxWcJaCBLFMI5FMKksEUQTL/YVKKimmE56iaLMnXg9x
         I1ufFSY3SMJpBGeue0Ue0g2hut5/C7nKbswcSbJx72c4j7UiaFmZ4elzEhreDevMWTaO
         /FpA==
X-Forwarded-Encrypted: i=1; AJvYcCVAG18dcE45XC4YokGFT7S47tbkzVjrMSdHD+0G+yGALZhc70TZppKtQ0RyFbjdp5FasEkxLwIya84l@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz3VgFHXBYctvrDN5nc2qWHGnU1uti9SBE3iEAs3/+slnpujVX
	D070sO1ylnRhrAw10G6N2An5ZO8qUggeJbn0d8C+5ZUxV9D4KCdNEkF/L013o2Qx2W0=
X-Gm-Gg: ASbGncuFfKfwE4onaE08RSiispwhKKenr+thZhDYWIcv6TdbBIoZodDzXtfhyHB295q
	OBZ27rd56LKsBbJuwZRrw/+W0Rz+qf9/vVpWL3rQN9NdXAaNs3dI2z0ZvbdLBb9Dncia+ie71LH
	DFu618hQoSgyX9uUZ+fJJikGP7At3yCDe7HJtrgxGgp+2ehBTxbFl3DOBuSysJUTHBHkBAjL4aU
	pwnkN/WwEpHRpKe1EaYvzFbVDbgCieaKReyI5kLo1UxjlNijFwHXXnBVEbZ4P9/RbrJzTX6ESpF
	pTm+nkSB3n/sP1ETFWY7CuHbItYeqCtDQflUeTvs0pVJcj1c7EF9NBuLnZctayI1gQ==
X-Google-Smtp-Source: AGHT+IEp2Z3v7vO+k7iz1/ljixUxn26m4gMIUOFRAzHd/4cJj5qsGsoZZZdPm2wkgnSeYm5bHOeEew==
X-Received: by 2002:a05:6000:288c:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3a558a4277cmr2115115f8f.54.1749638480806;
        Wed, 11 Jun 2025 03:41:20 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532518bc06sm17147605e9.24.2025.06.11.03.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 03:41:20 -0700 (PDT)
Message-ID: <05508556283ffeb8a128ad58be06736b11a91842.camel@linaro.org>
Subject: Re: [PATCH v2 02/17] regulator: dt-bindings: add s2mpg10-pmic
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Lee Jones <lee@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Peter
 Griffin <peter.griffin@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 11 Jun 2025 11:41:19 +0100
In-Reply-To: <20250611-statuesque-dolphin-of-felicity-6fbf54@kuoka>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
	 <20250606-s2mpg1x-regulators-v2-2-b03feffd2621@linaro.org>
	 <20250611-statuesque-dolphin-of-felicity-6fbf54@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

Thanks for your review!

On Wed, 2025-06-11 at 10:55 +0200, Krzysztof Kozlowski wrote:
> On Fri, Jun 06, 2025 at 04:02:58PM GMT, Andr=C3=A9 Draszik wrote:
> > The S2MPG10 PMIC is a Power Management IC for mobile applications with
> > buck converters, various LDOs, power meters, RTC, clock outputs, and
> > additional GPIO interfaces.
> >=20
> > It has 10 buck and 31 LDO rails. Several of these can either be
> > controlled via software or via external signals, e.g. input pins
> > connected to a main processor's GPIO pins.
> >=20
> > Add documentation related to the regulator (buck & ldo) parts like
> > devicetree definitions, regulator naming patterns, and additional
> > properties.
> >=20
> > S2MPG10 is typically used as the main-PMIC together with an S2MPG11
> > PMIC in a main/sub configuration, hence the datasheet and the binding
> > both suffix the rails with an 'm'.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > v2:
> > - drop | (literal style mark) from samsung,ext-control-gpios
> > =C2=A0 description
> > ---
> > =C2=A0.../regulator/samsung,s2mpg10-regulator.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 147 +++++++++++++++++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0.../regulator/samsung,s2mpg10-regulator.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 48 +++++++
> > =C2=A03 files changed, 196 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpg1=
0-regulator.yaml
> > b/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator=
.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..82f2b06205e9bdb15cf90b1=
e896fe52c335c52c4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regul=
ator.yaml
> > @@ -0,0 +1,147 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/samsung,s2mpg10-regulator=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung S2MPG10 Power Management IC regulators
> > +
> > +maintainers:
> > +=C2=A0 - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > +
> > +description: |
> > +=C2=A0 This is part of the device tree bindings for the S2MG10 Power M=
anagement IC
> > +=C2=A0 (PMIC).
> > +
> > +=C2=A0 The S2MPG10 PMIC provides 10 buck and 31 LDO regulators.
> > +
> > +=C2=A0 See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.=
yaml for
> > +=C2=A0 additional information and example.
> > +
> > +definitions:
> > +=C2=A0 s2mpg10-ext-control:
> > +=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,ext-control:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 These rails can=
 be controlled via one of several possible external
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (hardware) sign=
als. If so, this property configures the signal the PMIC
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should monitor.=
 For S2MPG10 rails where external control is possible other
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 than ldo20m, th=
e following values generally corresponding to the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 respective on-c=
hip pin are valid:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0=
 # S2MPG10_PCTRLSEL_ON - always on
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 1=
 # S2MPG10_PCTRLSEL_PWREN - PWREN pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 2=
 # S2MPG10_PCTRLSEL_PWREN_TRG - PWREN_TRG bit in MIMICKING_CTRL
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 3=
 # S2MPG10_PCTRLSEL_PWREN_MIF - PWREN_MIF pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 4=
 # S2MPG10_PCTRLSEL_PWREN_MIF_TRG - PWREN_MIF_TRG bit in MIMICKING_CTRL
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 5=
 # S2MPG10_PCTRLSEL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 6=
 # S2MPG10_PCTRLSEL_AP_ACTIVE_N_TRG - ~AP_ACTIVE_N_TRG bit in MIMICKING_CTR=
L
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 7=
 # S2MPG10_PCTRLSEL_CPUCL1_EN - CPUCL1_EN pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 8=
 # S2MPG10_PCTRLSEL_CPUCL1_EN2 - CPUCL1_EN & PWREN pins
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 9=
 # S2MPG10_PCTRLSEL_CPUCL2_EN - CPUCL2_EN pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 1=
0 # S2MPG10_PCTRLSEL_CPUCL2_EN2 - CPUCL2_E2 & PWREN pins
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 1=
1 # S2MPG10_PCTRLSEL_TPU_EN - TPU_EN pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 1=
2 # S2MPG10_PCTRLSEL_TPU_EN2 - TPU_EN & ~AP_ACTIVE_N pins
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 1=
3 # S2MPG10_PCTRLSEL_TCXO_ON - TCXO_ON pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 1=
4 # S2MPG10_PCTRLSEL_TCXO_ON2 - TCXO_ON & ~AP_ACTIVE_N pins
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For S2MPG10 ldo=
20m, the following values are valid
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0=
 # S2MPG10_PCTRLSEL_LDO20M_ON - always on
>=20
> No, use standard regulator properties - regulator-always-on

Same reason as in patch 3. I'll update this one.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 1=
 # S2MPG10_PCTRLSEL_LDO20M_EN_SFR - VLDO20M_EN & LDO20M_SFR
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 2=
 # S2MPG10_PCTRLSEL_LDO20M_EN - VLDO20M_EN pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 3=
 # S2MPG10_PCTRLSEL_LDO20M_SFR - LDO20M_SFR in LDO_CTRL1 register
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 4=
 # S2MPG10_PCTRLSEL_LDO20M_OFF - disable
>=20
> I don't think we allowed such property in the past. I don't get what is
> here the actual signal - you described registers in multiple places, not
> signals. Few of these duplicate standard properties, so this looks like
> exact copy of downstream which was doing exactly that way and that was
> exactly never upstreamed.

For lack of a better word, I used the generic term 'signal' in the
descriptions to refer to either a pin (VLDO20M_EN in this case), or
a PMIC-internal register bit (LDO20M_SFR in this case), or a
combination, they're all signals to the internal PMIC logic. That's
what the property description above is trying to convey.

The 'samsung,ext-control' property itself is required to configure the
PMIC so that it knows which of the signals (e.g. which input pin)
should affect a certain rail. In effect, this allows controlling more
than one rail atomically, while being flexible in the board design wrt.
which rail is affected by which pin.

This is not a copy of downstream, and the ones that in effect duplicate
standard properties like 'always on' I simply added for completeness,
to fully describe the hardware. I'll leave them out in the next revision
to avoid possible abuse.

>=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/=
definitions/uint32
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minimum: 0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maximum: 14
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,ext-control-gpios:
>=20
> enable-gpios

OK.

>=20
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For rails where=
 external control is done via a GPIO, this optional
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 property descri=
bes the GPIO line used.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
>=20
> And this can be dropped.

OK.

Cheers,
Andre'

