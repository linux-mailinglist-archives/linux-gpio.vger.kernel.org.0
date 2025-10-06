Return-Path: <linux-gpio+bounces-26810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6141BBD7E3
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 11:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 635121891E9C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 09:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C07205E3B;
	Mon,  6 Oct 2025 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pUyd3KOf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37189126C05
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759744076; cv=none; b=q+flOGL5dqbGPzGw0vXhqmQI/Y8cbWpVoXWEcRGbLYW4C5BItbM2zA8RzzLb/BH8cwG7RZ8mjGBbJhrkxU0VVbfHXLWsnW9neihHk4IGgyiy/oukajzKBW3r3qS8tRUK2izud4kEWD6pTpg3ksUUJfibhb13JJRkGA/x2CVQllY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759744076; c=relaxed/simple;
	bh=NVc36TGbNflxbPQDRRl0haz/TUVlsWdECo1JWukAVH8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ErBmgGU7kwZzoFzznfDb5dxFJ2CsW1hz+LsbBUdhDfKebd1bdPx9Y1sqMKFMNqsb+XSJJBlVGqrS2TgoniKySQFDbj1vwTMLurFy5cTaxDELIjYFw3tM4s+km5sPPTg17ftpQ7mViPMEPpfmv6hdOMIa90wQInzFlT4RFgVQTHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pUyd3KOf; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62fca216e4aso11344237a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759744072; x=1760348872; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NVc36TGbNflxbPQDRRl0haz/TUVlsWdECo1JWukAVH8=;
        b=pUyd3KOf/ViqPgLWXTuDX6y5+iT3/e1CzssaJt/0S5qJ7h0NuM+qMuOqhlmV2TceoV
         PSYCTE/FTbbGNMmAnB3UAudtb27GqkvXy81HmaZ91PkbpedDA8WDLrWvjCnyWtasnVCi
         JxbbTRUWzMDNvNQoHqvpHQ7xKCZpq3Q9NmYO76PGjQt+0e2Q5UlnJrGAYSZQqg0zeILK
         QoHGOSOMhoivtPtL4WlxEckSC8On0qEScBVFsWqmQ7G+V1NRycsXUcXucJol6bpa8VM+
         oCLcj72Xo6FXcORA0cxXDJAFSQSO9m0Vb/grqt9ir3Yz7fBj3LBzaAGeHpVzwIUtGbLM
         8qRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759744072; x=1760348872;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NVc36TGbNflxbPQDRRl0haz/TUVlsWdECo1JWukAVH8=;
        b=CyrJFpI1zXsZRQA8nHfnp7erltnDJRyhpBgZejpRqLxb+HLuUxtILYSAIdcqe+TVIA
         Dhapp9NbgcXkRCH91qK0FovJi11eZLEnP0x1qDv4fv+E3NIrGDa5Tl1ikqEsRljWABN/
         asKxjLdHzfqdWBNHM2nxI2QCYDofSsuJ8yz5agyEDbK5NdiczggYl3F9CguIyMlKFiR8
         XEdrWd321/E/HxN3M2/6neESxTlRoxv9ihrOgaWWiHtjpwYZZJUxiJWWgUCxBJ/iMEnd
         oNndaRqgzOe3mmJes07o1MUJeBHmudozp0SrAeRgHZmmbwiZTNQ797de/qQy31Y/lqeR
         Gn+g==
X-Forwarded-Encrypted: i=1; AJvYcCV0A8mOowcdpTg5ox7Fxa91UGuvVpqD+0pQLG6gPcmIM5YdikyentEqBvRhSSWHV75v95yo7ZL1Gr46@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyk/cbhVF9X38xpckYLi3WZv39BpJPpSrmZRxSydbIYEhC4kQ2
	LweYkVvWtVbLWoMa+BtCJIdPHp89unmeKTl5s9S6bXj0XqUJnWbINhgDJqHVgsVgw28=
X-Gm-Gg: ASbGncsPqXEM+mTCw8i8oWQIkzoMKh10OYrRk2BH6Y2fXBYe4+kblmE3sc0fDB75k8v
	iQI9kWvpasX2KTRu6EJrOJZ4kpilFHebtMrbLDZkaSuB0jlCTecO5eqCK3gXlvbtQ4AFfC6Pg7B
	9XfbDEyzMlY1BFTofXGWo8Zh8CCqB85R/rzCvC6YEXDzMsz+hlK9Y0CRB1Z7l5GCDjYEPbKG5S8
	dC//3m7OEDuZHGzkcfBIQ8Jeu0IZGmQ1VgLRCRkHywTaRG4/Dk+8624yBhkv/OAtLCCBawI6JIE
	XSBoa3mPYsaLaq9RycYbiQusc3uKNxFsqK9nbZXyp+7xVXvc42on8Y5aPFnkQdrJGtUNVESnCcb
	VFBtX3BYENp7Wi9VTOqKoE9EnWk01DooSHP3Oy+X2z8yvL4uGr/erPg==
X-Google-Smtp-Source: AGHT+IFtzyuEM86nDZ1afipZ9gjtIoBXDJIw39RxT9KiIYyBACUqX8txUSjLeqwb6sRvJD4CXeYSfA==
X-Received: by 2002:a05:6402:13d6:b0:636:6e11:2fd1 with SMTP id 4fb4d7f45d1cf-638fcb65499mr14959712a12.4.1759744072376;
        Mon, 06 Oct 2025 02:47:52 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6378811f14bsm9884430a12.45.2025.10.06.02.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 02:47:51 -0700 (PDT)
Message-ID: <a4834c957f518d9f172b5a2dd0b8cd34980c7653.camel@linaro.org>
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
Date: Mon, 06 Oct 2025 10:47:50 +0100
In-Reply-To: <20250611-statuesque-dolphin-of-felicity-6fbf54@kuoka>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
	 <20250606-s2mpg1x-regulators-v2-2-b03feffd2621@linaro.org>
	 <20250611-statuesque-dolphin-of-felicity-6fbf54@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

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
>=20
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
> I don't think we allowed such property in the past.

I've done some more investigation now - the reason we need to configure
control of rails via signals (i.e. input pin on S2MPG1x) is that the PMU
and power domains in particular control at least some of them.

As an example, power domain g3d disable toggles an output pin on GS101,
which is connected to the G3D_EN pin on S2MPG1x on Pixel. The regulator
driver needs to configure all the G3D-related-PMIC rails to react to this
signal. There a) is a large amount of flexibility as to which rail should
react to which signal, and b) the bootloader doesn't configure (all of)
them.

Therefore, we need to be able to specify which rail should be controlled
by which signal, both in DT and in the driver.

The alternative would be do add explicit (driver-based) regulator control
for each power domain, rather than having the PMU handle this. Such an
approach appears suboptimal, because after all that's what the PMU is for.

Additionally, there are sequencing requirements on enabling/disabling rails
and when using the signals, the PMIC will ensure they're followed, whereas
a driver would have to duplicate that information and could get it a) wrong=
,
b) would use more CPU cycles due to additional code, and c) leave the rail
on for longer than necessarily due to timer resolution.

Also, it might not work in all cases, e.g. if the PMU disables the rail for
the CPU, the Linux driver can not afterwards disable the PMIC rail anymore,
leaving it unnecessarily enabled. Equally, the Linux driver can not disable
the rail before turning off the power domain, as once the rail is off, the
CPU/Linux can not execute any further code.


Hope the above justifies the introduction of this property :-)


Cheers,
Andre'

