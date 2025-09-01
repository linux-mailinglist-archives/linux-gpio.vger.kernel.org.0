Return-Path: <linux-gpio+bounces-25262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3929CB3D750
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 05:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBDE77A2831
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 03:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCD2219303;
	Mon,  1 Sep 2025 03:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dxpygT4g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78F872618
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 03:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756697646; cv=none; b=p+RS8Gi31yANQWQyNVhdT/95v5Dd2qpvKQJIofluHRcdn6WyeWyn9X7OicCz6qDllkbNi68qJjk3kKZuckgZirYXOsIt4QyJ48Vv2qcJHHerAoaYq6Ns1UoT7vlt9ZS0IDZ5Q8WQYUbHNu+kzsl2w2xnsghe6YFjp+CRY8DWMWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756697646; c=relaxed/simple;
	bh=qtZoxAkXv495MzlPMfGyn54WlNk7BPz08rPmn2O5hoI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=gMx6vcvSxOge4hcIBLL8bJcaQtCQXaqjkISVwA8X/Q1fhR6JteW7ejqnj0M5IsRALT8w4vVXuRJR1cm7GAqv9A8wqQrN9WGmfLU/a6CzYOOYDOnvD4Looc8tGgWX2ZD/UHNHdL6hbjfsyYcCjhwEpXpHFbMEX8mzoYtIh6ur0dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dxpygT4g; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250901033400epoutp012ddaad9adce052a856735a437c8883db~hCzJ1MLIh2573225732epoutp01S
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 03:34:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250901033400epoutp012ddaad9adce052a856735a437c8883db~hCzJ1MLIh2573225732epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756697641;
	bh=uU0UrKirjvX5fa8m8MUKd9RwSD+yLy9b8io3irBzxG8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=dxpygT4gWAUUKJDRI4VWQHqVa+8eUzjre26YsG4Ptm4PqPBDH51a58f513uU8Atr1
	 BgOyW0SMz+bc6D0x2mhIaeDy8euSza/RGRx2aquPIM1Uet1PCcLr+WfJWcfaUepqPZ
	 UWO/H7BKnKwtS0Vb2SLUGcWp6AnhnWnrVMk3zgvs=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250901033359epcas5p1c283a30d1db11caef94473d360e336f5~hCzI40H2Z2963529635epcas5p1V;
	Mon,  1 Sep 2025 03:33:59 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cFZGt6tycz6B9mB; Mon,  1 Sep
	2025 03:33:58 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250901033358epcas5p155659ad43787629cdd3221f359b8a72a~hCzHQdwnE2963529635epcas5p1R;
	Mon,  1 Sep 2025 03:33:58 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250901033353epsmtip17c5fa910804d2969d332336802e28da9~hCzCu9gwp0939709397epsmtip1E;
	Mon,  1 Sep 2025 03:33:53 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <jesper.nilsson@axis.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<alim.akhtar@samsung.com>, <linus.walleij@linaro.org>,
	<tomasz.figa@gmail.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<arnd@arndb.de>, <ksk4725@coasia.com>, <kenkim@coasia.com>,
	<pjsin865@coasia.com>, <gwk1013@coasia.com>, <hgkim05@coasia.com>,
	<mingyoungbo@coasia.com>, <smn1196@coasia.com>, <shradha.t@samsung.com>,
	<inbaraj.e@samsung.com>, <swathi.ks@samsung.com>,
	<hrishikesh.d@samsung.com>, <dj76.yang@samsung.com>,
	<hypmean.kim@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<soc@lists.linux.dev>
In-Reply-To: <20250829-attentive-watchful-guan-b79ccc@kuoka>
Subject: RE: [PATCH v3 08/10] arm64: dts: exynos: axis: Add initial ARTPEC-8
 SoC support
Date: Mon, 1 Sep 2025 09:03:52 +0530
Message-ID: <000001dc1af1$4026d700$c0748500$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHHo9j0Rv1rvZf0N1R8AXn4x9PYUAJmRP9VAu8V1FcBMgRwRbRyXiFg
Content-Language: en-in
X-CMS-MailID: 20250901033358epcas5p155659ad43787629cdd3221f359b8a72a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120735epcas5p3c86b9db5f17c0938f1d53ef6014ab342
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120735epcas5p3c86b9db5f17c0938f1d53ef6014ab342@epcas5p3.samsung.com>
	<20250825114436.46882-9-ravi.patel@samsung.com>
	<20250829-attentive-watchful-guan-b79ccc@kuoka>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 29 August 2025 13:26
...
> Subject: Re: [PATCH v3 08/10] arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC support
> 
> On Mon, Aug 25, 2025 at 05:14:34PM +0530, Ravi Patel wrote:
> >  config ARCH_AXIADO
> >  	bool "Axiado SoC Family"
> >  	select GPIOLIB
> > diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> > index bdb9e9813e50..bcca63136557 100644
> > --- a/arch/arm64/boot/dts/exynos/Makefile
> > +++ b/arch/arm64/boot/dts/exynos/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +subdir-y += axis
> >  subdir-y += google
> >
> >  dtb-$(CONFIG_ARCH_EXYNOS) += \
> > diff --git a/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h b/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
> > new file mode 100644
> > index 000000000000..70bd1dcac85e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
> > @@ -0,0 +1,36 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> 
> Does not match rest of licenses.
> 
> > +/*
> > + * Axis ARTPEC-8 SoC device tree pinctrl constants
> > + *
> > + * Copyright (c) 2025 Samsung Electronics Co., Ltd.
> > + *             https://www.samsung.com
> > + * Copyright (c) 2025  Axis Communications AB.
> > + *             https://www.axis.com
> > + */
> > +
> > +#ifndef __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__
> > +#define __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__
> > +
> > +#define ARTPEC_PIN_PULL_NONE		0
...
> > +#define ARTPEC_PIN_DRV_SR6		0xd
> > +
> > +#endif /* __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__ */
> > diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
> > new file mode 100644
> > index 000000000000..8d239a70f1b4
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
> > @@ -0,0 +1,120 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> 
> This is Dual license, so why pincltr header is not?

Thanks for the review.
I will update the Dual license in pinctrl header in the next version.

Thanks,
Ravi

> 
> Best regards,
> Krzysztof



