Return-Path: <linux-gpio+bounces-26087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9225BB556E6
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 21:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48A31AA6510
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 19:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EEC32BF38;
	Fri, 12 Sep 2025 19:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZZ+EeJ/X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7142C21E7;
	Fri, 12 Sep 2025 19:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757705247; cv=none; b=bPtrMiS96q8RuuIrCOnR+ROKqdtPHHHsf5H5j+ono40DsKES/MJ6rdtkcFQT4svDX/8StojOpQrlWE7fe/nxCRhc+9C2PoaFCw3lsm+4MFIny3Qdcs17qYQHND9F9QEM489NzSxkwQ/W9JVDakRYF9feTbnbx8B9UXgrf4KSuSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757705247; c=relaxed/simple;
	bh=EHXp00PvSV5BL2JzcicYuQ7QaA7Hb0E5dVZbhEWZgVU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4O3U5sGZdymDrGKi/M6R/t5jzcDdcAEGA74Bl/qbcFfFKeH9lpPldERV53bJv87+cNzY0woJFCARfqffOgTgCqgG8n8z5at+aqUvdEH2UoqiHoj2FOlRsp2UM4ezKvGJ9bf5qgw+eoo9HXcujcNEyZW1FI8XodyT2Rrb7of6HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZZ+EeJ/X; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CJOvCc668524;
	Fri, 12 Sep 2025 14:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757705097;
	bh=Q4NS2lGNDYPRFSd1ovtwkZb7OAAyExi6xlEfHJJUBmQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZZ+EeJ/XiIL22njUd2gX5udls+1mAirxXEHksdBu0njlTzgvOx7WWptSXLbMNKltE
	 M/O8RcnXHxUHFnpQZRP2Jp3wEK6u4t9k78rHVtuRrKQJsGpUduLu13T3ZpxEQGtEcC
	 HwW/XN6U4cqMbAhoA7IxW84ZRc2IgDv4qXLAh1IU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CJOu6i2993241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 14:24:57 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 14:24:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 14:24:56 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CJOuXa187040;
	Fri, 12 Sep 2025 14:24:56 -0500
Date: Fri, 12 Sep 2025 14:24:56 -0500
From: Bryan Brattlof <bb@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus
 Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6 3/4] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250912192456.msnw64b62yr5ricw@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250912-am62lx-v6-0-29d5a6c60512@ti.com>
 <20250912-am62lx-v6-3-29d5a6c60512@ti.com>
 <0153912f-04a5-4118-a286-4e9c0293aae6@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <0153912f-04a5-4118-a286-4e9c0293aae6@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On September 12, 2025 thus sayeth Andrew Davis:
> On 9/12/25 10:40 AM, Bryan Brattlof wrote:
> > From: Vignesh Raghavendra <vigneshr@ti.com>
> > 
> > Add the initial infrastructure needed for the AM62L. ALl of which can be
> > found in the Technical Reference Manual (TRM) located here:
> > 
> >      https://www.ti.com/lit/pdf/sprujb4
> > 
> > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> > Changes in v4:
> >   - Corrected Copyright year
> >   - Used 'ranges' property in the fss{} node
> > 
> > Changes in v3:
> >   - Added more nodes now that the SCMI interface is ready
> > 
> > Changes in v1:
> >   - switched to non-direct links to TRM updates are automatic
> >   - fixed white space indent issues with a few nodes
> >   - separated out device tree bindings
> > ---
> >   arch/arm64/boot/dts/ti/k3-am62l-main.dtsi    | 603 +++++++++++++++++++++++++++
> >   arch/arm64/boot/dts/ti/k3-am62l-thermal.dtsi |  25 ++
> >   arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi  | 141 +++++++
> >   arch/arm64/boot/dts/ti/k3-am62l.dtsi         | 120 ++++++
> >   arch/arm64/boot/dts/ti/k3-am62l3.dtsi        |  67 +++
> >   arch/arm64/boot/dts/ti/k3-pinctrl.h          |   2 +
> >   6 files changed, 958 insertions(+)
> > 

...

> > diff --git a/arch/arm64/boot/dts/ti/k3-am62l.dtsi 
> > b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d058394a8d19d16f100cd87cf293c67bc189b475
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
> > @@ -0,0 +1,120 @@
> > +// SPDX-License-Identifier: GPL-2.0-only or MIT
> > +/*
> > + * Device Tree Source for AM62L SoC Family
> > + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> > + *
> > + * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
> > + */
> > +

...

> > +		};
> > +	};
> > +
> > +	#include "k3-am62l-thermal.dtsi"
> 
> Not a fan of how this is included (yes I know it is done like this in
> a couple other places, those need fixed too), as we have better/standard
> ways to add nodes to nodes other than directly including a file with the
> node. The other issue is now the content of the file, including its #include
> lines are now inside this parent node.
> 
> This dtsi file should just start with "/ {" and add the extra node.
> 
> Also, isn't this broken out into a dtsi so we can handle versions of
> this device qualified for other thermal ranges without having to use
> a different parent device dtsi? If so then adding it directly to the
> base dtsi prevents that. Either all AM62L have this one thermal situation
> and then it doesn't need to be a dtsi, or this include should go into the
> board level as it is up to the given board what specific variant was chosen
> to be populated on that board type.
> 

Yeah I've noticed this as well. We have a few parts available in 
different packaging that have different maximum temp ratings. Ideally we 
should have some way to specify which package variant the board is using 
and include these thermal trip points for that package.

It does add more #includes into all of this but I guess if you've picked 
up on this as well I should probably look into seeing what we can do.

~Bryan

