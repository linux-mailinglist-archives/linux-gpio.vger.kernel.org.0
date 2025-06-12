Return-Path: <linux-gpio+bounces-21428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4BEAD6E77
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 693773B04E9
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 10:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E03023C397;
	Thu, 12 Jun 2025 10:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6nN+AaH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF4923A57F
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725962; cv=none; b=h+02sw2LUxX5jL2cDE0D7UX42pGhm927ocCU7qsc2v/r2tlhRe51GAVlQUzr00Vh4hTdrjfkEWTEgHCzI15CBl+HLycLyIuqtfUfrW13Im3ndX7KeVClG1yX5EcPdGdiYm0DeEJc1B5zI6E4l7MfdBLv7MoiZXnRYBGDVzkAKTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725962; c=relaxed/simple;
	bh=WWPYYggyKVUIqcpZRwtY3ch16mcUxM6fvmZKKpyOsWg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hI0CVhwBhY91MmA2/P/pFT1kYPerrPdf7zTn70qxdrI9nVng7NHtUD/RNCt5mG8Dy/wnKMC5RR6XvjAc0Tn1X1wJYpISXOwQrryKecuB47ryEsPfBdRbRADGhXH9+NXaHr/s5WyR19dpFH9MRK8hN/itpDYJM6RXHdBF6XVweNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r6nN+AaH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so4569845e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 03:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749725957; x=1750330757; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OxVFpXC9gE/NnptI7yasZSeAwdsDwjZxI1xtlSOfvvA=;
        b=r6nN+AaH1FFt9eiD/oBB6xuxgOlHpttnmzJhBx3WCbi/KaDm+x7tLBZyac03mSdqFT
         n75/2p6JKdJjfULVxmhhVzlSK1CoWfbvx5ZN94xlE/oCvExe7Mpg/3DrCfHFBg38SpHw
         AZbxEyi81sDmbs6yXTlIWc7Hcf82sdtAv/myAQnpqMUwIZOHCL9FCLTX/CZYOXeeTojw
         ckQjb0s/Su47ljH+lKQ7oMYRtYI17ATM1q1zIqJjW2rNLvK6w0QCOxZ6WTYaUmTyURZo
         6P96e6qJ076z6uZXdapfKqBNGdoQxxjyN9Uwfwu3kSwDbprln1I3fE14n8rVDFcPp6iL
         4A6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749725957; x=1750330757;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxVFpXC9gE/NnptI7yasZSeAwdsDwjZxI1xtlSOfvvA=;
        b=RURJ0mu/MIYENiBojpEy+zzzfQQWRHTh4hM21lJtqoOy8suyfxGI1RBZqR1OjLjfnO
         OHEDhYQqOEtFoM79NNNbNXoDdGespfgBOR7ftgvoeueytvDmapsK4IhVwgxO8NpOBGqk
         wRuNxyZqLpQX6hrcj7QMutNkkGOH+tRRud5L+Q+33/kfX61+v0sl4H/S5Ml0ZUjB8vqj
         wREO96idZ9uGL8cTYDUcjtB9TCeMLWbGZEPSgNwv2CLhTHiPAidziLsGL6Ojmvqj/rgI
         jWsaWU4iHCEx1O6jRRvNF8pzYtNssoahkiVl/XICIrOlasAyPGhyzrS4DdwqU5KsoEQ7
         w9jw==
X-Forwarded-Encrypted: i=1; AJvYcCUf7a/Kln9wOoHM90E+LuRZqleFssZO16OoMKuCSGhlFAIfAsIl7jvi9Es57QwcdAIHrp4GcDLlEOFc@vger.kernel.org
X-Gm-Message-State: AOJu0YwCDl3UeqW7rwXGctFfsBF2+D960+51G1uJ4dqmBHuyQA5ZPLwH
	Ka43v4hQ3U9Nu1B3zEmferU9jJ3LmMFWUj3mXUs8rWFHid9qcnmVUURs3TJ9049aKN0=
X-Gm-Gg: ASbGncvbszlgEtr0SRFSsxloXE5oP27m23yVtu5uG9iX+M4Zxr5Z6S+JTmgBKLoABLR
	YfInAuWysi8/RO4yGtdCCJTW38yLg71nOecoPnm4qJ4kH2ZlwEL3AMFozbrKKT7PO0fLB38ud4v
	xRglBvjW+fhcQA4cqKko1E4UZbCRhGYpe5iqbndUfS0e9hCk/eZe4Bf0O3hRdP4Rx9XFRtTvk7j
	hkgfuJl09vOUL02kzB5RPh/Iyta/dLg0+CPEPRNkwbdGob/BIwgIEUzlUB8r7LoolbN3U+nellr
	0AhO2sGMeG1WPsZAyqkSJTVWE039pT+/VcHPdoPaDkBhPadoh/FSsZMg3x2nEvlEAA==
X-Google-Smtp-Source: AGHT+IHqd8/I6PcH/SsGO4ZHasePxLhvFKcF2xtJG5ImKC1vi9knPoEYRyrNOkQXYTNCKl3KYXGlKw==
X-Received: by 2002:a05:6000:4028:b0:3a5:1f2:68f3 with SMTP id ffacd0b85a97d-3a5586e9764mr5499812f8f.46.1749725956635;
        Thu, 12 Jun 2025 03:59:16 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976a20sm1681124f8f.19.2025.06.12.03.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 03:59:16 -0700 (PDT)
Message-ID: <b090594cb2e61160a830b4cd73d7d8a529872130.camel@linaro.org>
Subject: Re: [PATCH v2 02/17] regulator: dt-bindings: add s2mpg10-pmic
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Peter Griffin	
 <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Thu, 12 Jun 2025 11:59:14 +0100
In-Reply-To: <f5fcaac5-fa8e-41da-b1d2-e84197992e3c@sirena.org.uk>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
	 <20250606-s2mpg1x-regulators-v2-2-b03feffd2621@linaro.org>
	 <20250611-statuesque-dolphin-of-felicity-6fbf54@kuoka>
	 <f5fcaac5-fa8e-41da-b1d2-e84197992e3c@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mark,

On Wed, 2025-06-11 at 14:53 +0100, Mark Brown wrote:
> On Wed, Jun 11, 2025 at 10:55:44AM +0200, Krzysztof Kozlowski wrote:
> > On Fri, Jun 06, 2025 at 04:02:58PM GMT, Andr=C3=A9 Draszik wrote:
>=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For S2MPG10 l=
do20m, the following values are valid
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
 0 # S2MPG10_PCTRLSEL_LDO20M_ON - always on
>=20
> > No, use standard regulator properties - regulator-always-on
>=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
 1 # S2MPG10_PCTRLSEL_LDO20M_EN_SFR - VLDO20M_EN & LDO20M_SFR
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
 2 # S2MPG10_PCTRLSEL_LDO20M_EN - VLDO20M_EN pin
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
 3 # S2MPG10_PCTRLSEL_LDO20M_SFR - LDO20M_SFR in LDO_CTRL1 register
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
 4 # S2MPG10_PCTRLSEL_LDO20M_OFF - disable
>=20
> > I don't think we allowed such property in the past. I don't get what is
> > here the actual signal - you described registers in multiple places, no=
t
> > signals. Few of these duplicate standard properties, so this looks like
> > exact copy of downstream which was doing exactly that way and that was
> > exactly never upstreamed.
>=20
> It looks like we can infer the configuration needed here from the
> existing properties,

For this ldo20, yes, and I'll update binding+driver to do so.

>  if a GPIO is provided then use value 2 otherwise
> use value 3.

Close :-) There is another register to say if this pctrlsel should be
respected in the first place. Therefore if a GPIO is provided, then use
value 2 for pctrlsel, otherwise the value doesn't matter, as pctrlsel
will be ignored anyway. But doesn't really matter in the context of this
discussion here, just for future reference :-)

Thanks for your review!

Thanks!
Andre'

