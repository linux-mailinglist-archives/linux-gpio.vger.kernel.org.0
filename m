Return-Path: <linux-gpio+bounces-21360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A0FAD51C8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 12:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFFA6189F7B5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36633263F5E;
	Wed, 11 Jun 2025 10:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HeQmBsr7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B7625E448
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637454; cv=none; b=OXleOJ9Hrd80k9vdNNHurm9A1bYSUopfL+AWgMZKkSU93IdPcyxXt3Kxi74kWM4AJxfdv6nTzeYN4sSXS6EZoD7UwsY3U/JXWawFBR5OfBkxDBqBS30rTbE2QFZa7IX2IfBfQ3208YPHq922UhsnuZ9LJDINn3loQtQZKVaNDkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637454; c=relaxed/simple;
	bh=HcgoTLAfHeJFUpaLy0Qtf0ddGHc6Ei2KwGMl7zeFXi8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J1fVH0yDzek/b/w3SS6lDzH/6Ysu7CDRzwQtSZVOp9BFlZ6R69P5YEYO/9RmpyHI0vbKaJM6qKYrbs+Ie2YAHHd153DW1IiOx6CA4zEgY8cOFRvwVHldzouTMvcLhfWSN87n9nbbb9nFH9mlgEuPFKIWoxQuoY1uq65LyB3hy1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HeQmBsr7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so6344725e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 03:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749637450; x=1750242250; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HcgoTLAfHeJFUpaLy0Qtf0ddGHc6Ei2KwGMl7zeFXi8=;
        b=HeQmBsr7c+SkScccNJ/dlNDTisyK3tsOIHmadYsJY3DoBERaNuRCp9GvmBhOip6vol
         vIMjyTNc/yTUSF/XmlqD4d3o7RnsvSySbIvpLHyfniikAj5Qmejqq9N5vKMV0zGXR1Gt
         0JrJtz50R6aOkgBjGj7qMFnhLuTJMIWcfGk05JjvUv5ripqyJ/AHRS+BxJZdWVtNw5bM
         /7BcHzoUmwlPFeUfWPPzXJlfUImHf/ztgTy1eJFsR7+EFWG7SHXN8mcZU7QE/EF6y9S0
         0NXFxHWatrUpqdfU3KGBYDMymhrs3K+fmMd5tj9l1TFIUnFo/sSHhmZ5Q7sWi7+X7IhT
         N5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749637450; x=1750242250;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HcgoTLAfHeJFUpaLy0Qtf0ddGHc6Ei2KwGMl7zeFXi8=;
        b=sagXNiNrB4IOvC+qymduaG6XKT122p5EhxXIvUxYU3NAkJPSP4pKnNe5+rDc8Uz0Ex
         sF835VbrZVk/8gabesO5SL+c2PGA/rDDwMbBKJaJpt0XMU4u8bbuCW/9wYDtFNdl0iXo
         xXmOP68LHX+e8DvNXqx8V8JjkJEMKjJgkVCgih/ZrtewulKcTOLu+qW2dxbW+qJAAD8e
         qMAEUuAROC4UvTnkEZyE+NIeBlK5eYbQpDRrK1J9v5F9ES/OKa931ywXE98JhXFrjJto
         bLDlw/B1W8t/uNFV74XoW+Oc+PdacwFjF85uFLxHNW7ihQmnYvGd5Go7K0e4PKJueUVm
         0sRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuOp1I9KezzrM4ZxzjqVN6eeZmfDA1QXsVBCAJRi23kMkueTHQq0gNd8DPzpNG+XZY6+gSiqQDX9m3@vger.kernel.org
X-Gm-Message-State: AOJu0YwrCgdlpKc1eYs6N+OpkncW2QfxEghZskGOnt24D9s2Hk0JP9ne
	KECfUCxE3XLoPBbm4jbA8z9mn5TeAx8GsndgP0Tvd09GKKuR79LzON0IwP2bbWZFeU61JbaMHks
	vCibN
X-Gm-Gg: ASbGncs2nUYMamwyHByaxUfDZ+vEiqj9a/TchLm3QB/VpWk9h8ktwNjonrB9zQd6xcj
	CocI4rOIY6Y/GPsED7xgzGJLc9WYy4Opn+EuLZnw1f4j6gST+TW348sfmyC2rJVhZ+vmOAXu2lO
	Oga9fDLjlxMnh/2+TKtr/e5H5XIaHTA0iqIvo6sDB8UQYZHeiJHgJYHdFFsvZ1COeK+J0HFYHUp
	a0ZPJNqrb/j3oeC4SyzS1mRVBFRCxT/214yZfzU+3cGg7nuUhca9c4wn+azXX7BPJYGTweqn1DU
	gbN0ww2iYwBmLu6ndiMVrv3c4WDld/68J+3PAOq7NyvVeOwAuml7m29PeyRXjHlqzA==
X-Google-Smtp-Source: AGHT+IG9m+kxWKjGRtPwO1sYhhzUEaX5KsBy8nQtuB2u3NbqDTwQEhMKuqK7uGhNPxTPQU1llC5yLw==
X-Received: by 2002:a05:600c:a016:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-453241fb5a6mr26538495e9.14.1749637449759;
        Wed, 11 Jun 2025 03:24:09 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229d9adsm14638751f8f.9.2025.06.11.03.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 03:24:09 -0700 (PDT)
Message-ID: <cee62201bbebecd6082dd097b87670fcb2cdb9c7.camel@linaro.org>
Subject: Re: [PATCH v2 03/17] regulator: dt-bindings: add s2mpg11-pmic
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
Date: Wed, 11 Jun 2025 11:24:08 +0100
In-Reply-To: <20250611-spectral-bullfrog-of-perfection-cb8e01@kuoka>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
	 <20250606-s2mpg1x-regulators-v2-3-b03feffd2621@linaro.org>
	 <20250611-spectral-bullfrog-of-perfection-cb8e01@kuoka>
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

On Wed, 2025-06-11 at 10:57 +0200, Krzysztof Kozlowski wrote:
> On Fri, Jun 06, 2025 at 04:02:59PM GMT, Andr=C3=A9 Draszik wrote:
> > The S2MPG11 PMIC is a Power Management IC for mobile applications with
> > buck converters, various LDOs, power meters, and additional GPIO
> > interfaces. It typically complements an S2MPG10 PMIC in a main/sub
> > configuration as the sub-PMIC.
> >=20
> > S2MPG11 has 12 buck, 1 buck-boost, and 15 LDO rails. Several of these
> > can either be controlled via software or via external signals, e.g.
> > input pins connected to a main processor's GPIO pins.
> >=20
> > Add documentation related to the regulator (buck & ldo) parts like
> > devicetree definitions, regulator naming patterns, and additional
> > properties.
> >=20
> > Since S2MPG11 is typically used as the sub-PMIC together with an
> > S2MPG10 as the main-PMIC, the datasheet and the binding both suffix the
> > rails with an 's'.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > Note: checkpatch suggests to update MAINTAINERS, but the new file is
> > covered already due to using a wildcard.
> >=20
> > v2:
> > - fix commit message typos: s2mp1 -> s2mpg1
> > - mention GPIOs in commit message
> > ---
> > =C2=A0.../regulator/samsung,s2mpg11-regulator.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 150 +++++++++++++++++++++
> > =C2=A0.../regulator/samsung,s2mpg10-regulator.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +++
> > =C2=A02 files changed, 168 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpg1=
1-regulator.yaml
> > b/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator=
.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..f2d596642501c197e2911ee=
3b9caac189cf541a4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regul=
ator.yaml
> > @@ -0,0 +1,150 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/samsung,s2mpg11-regulator=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung S2MPG11 Power Management IC regulators
> > +
> > +maintainers:
> > +=C2=A0 - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > +
> > +description: |
> > +=C2=A0 This is part of the device tree bindings for the S2MG11 Power M=
anagement IC
> > +=C2=A0 (PMIC).
> > +
> > +=C2=A0 The S2MPG11 PMIC provides 12 buck, 1 buck-boost, and 15 LDO reg=
ulators.
> > +
> > +=C2=A0 See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.=
yaml for
> > +=C2=A0 additional information and example.
> > +
> > +definitions:
> > +=C2=A0 s2mpg11-ext-control:
> > +=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,ext-control:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 These rails can=
 be controlled via one of several possible external
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (hardware) sign=
als. If so, this property configures the signal the PMIC
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should monitor.=
 The following values generally corresponding to the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 respective on-c=
hip pin are valid:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0=
 # S2MPG11_PCTRLSEL_ON - always on
>=20
> Use regulator-always-on

Yes, the end-result would be the same. I still added this one for
completeness, because they all describe the hardware. I can leave
this one out and thereby force use of the regulator-always-on
property instead.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 1=
 # S2MPG11_PCTRLSEL_PWREN - PWREN pin
>=20
> That's duplicating regulator in standby properties.

OK, I'll double-check this.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 2=
 # S2MPG11_PCTRLSEL_PWREN_TRG - PWREN_TRG bit in MIMICKING_CTRL
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 3=
 # S2MPG11_PCTRLSEL_PWREN_MIF - PWREN_MIF pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 4=
 # S2MPG11_PCTRLSEL_PWREN_MIF_TRG - PWREN_MIF_TRG bit in MIMICKING_CTRL
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 5=
 # S2MPG11_PCTRLSEL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 6=
 # S2MPG11_PCTRLSEL_AP_ACTIVE_N_TRG - ~AP_ACTIVE_N_TRG bit in MIMICKING_CTR=
L
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 7=
 # S2MPG11_PCTRLSEL_G3D_EN - G3D_EN pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 8=
 # S2MPG11_PCTRLSEL_G3D_EN2 - G3D_EN & ~AP_ACTIVE_N pins
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 9=
 # S2MPG11_PCTRLSEL_AOC_VDD - AOC_VDD pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 1=
0 # S2MPG11_PCTRLSEL_AOC_RET - AOC_RET pin
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 1=
1 # S2MPG11_PCTRLSEL_UFS_EN - UFS_EN pin
>=20
> Now I have doubts these are real signals. Are you saying that S2MPG11
> has a pin named UFS_EN (such pin on ballmap)?

Yes. I used the generic term 'external signal' in the descriptions above
rather than the more specific pin, because some of these are bits in
some registers, and most are indeed input pins, or a combination. Not all
of the pins are connected to actual GPIOs on the AP, though.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 1=
2 # S2MPG11_PCTRLSEL_LDO13S_EN - VLDO13S_EN pin
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/=
definitions/uint32
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minimum: 0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maximum: 12
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 samsung,ext-control-gpios:
>=20
> Same comments as previous patch.

I used this one to align with s2mps14, but will switch to enable-gpios.

Cheers,
Andre'

