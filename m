Return-Path: <linux-gpio+bounces-9427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A627965934
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 09:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E89AF1F24BC6
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 07:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6092165EEB;
	Fri, 30 Aug 2024 07:56:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C326158A37;
	Fri, 30 Aug 2024 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725004598; cv=none; b=Z2t85WmDNvbgjMPHOGVQL2JtZk2Ep2eWh2hVdew42uvO09KKYEwKrskhtfn8gnx7T1GJ2Dg11rVJv2DtwB9HwPtKSuL3yeCGuBgz4lbFE4P8SiIr+Gr4YgG0t6x9TvfvAcCwd0CeN1J+t5P3cddmOXzFqPx/gWjC4EyWY95edTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725004598; c=relaxed/simple;
	bh=C4RlOGixL7PRQeXoKJLE0klZ0yDDxIRnLXobt4M+yQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTTO3RluTpr0OWkMHZJ7ca2nLB9w4CeSUVTe988gEajFxw6mnSQwbAUiZiozIBj4Od7fFs+1UfGWXPVCLK5hiw3iOdGWLPXn1iu/yqjOgX2444vZCP73skaQFeP+UsMz7TNeMekN9EClZ3IzIvkps2gZoNO1xGcXot7AGU4Ho7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Fri, 30 Aug 2024 07:56:26 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>, Jesse Taube <jesse@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/4] riscv: dts: spacemit: add pinctrl support for K1
 SoC
Message-ID: <20240830075626-GYA41291@gentoo>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-3-1fed6a22be98@gentoo.org>
 <IA1PR20MB495369231BB1E1677228D95DBB972@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495369231BB1E1677228D95DBB972@IA1PR20MB4953.namprd20.prod.outlook.com>

Hi

On 09:36 Fri 30 Aug     , Inochi Amaoto wrote:
> On Wed, Aug 28, 2024 at 11:30:25AM GMT, Yixun Lan wrote:
> > Add pinctrl device tree data to SpacemiT's K1 SoC.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > Note, only minimal device tree data added in this series,
> > which just try to demonstrate this pinctrl driver, but
> > more dt data can be added later, in separate patches.
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi |  19 ++++
> >  arch/riscv/boot/dts/spacemit/k1-pinctrl.h    | 161 +++++++++++++++++++++++++++
> >  arch/riscv/boot/dts/spacemit/k1.dtsi         |   5 +
> >  3 files changed, 185 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > new file mode 100644
> > index 0000000000000..1082f92753176
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include "k1-pinctrl.h"
> > +
> 
> > +&pinctrl {
> > +	uart0_2_cfg: uart0-2-cfg {
> > +		uart0-2-pins {
> > +			pinmux = <K1_PADCONF(GPIO_68, 2)>,
> > +				 <K1_PADCONF(GPIO_69, 2)>;
> > +
> > +			bias-pull-up = <0>;
> > +			drive-strength = <32>;
> > +		};
> > +	};
> > +};
> 
> "uart0_2"? Is not enough to use "uart0"?
> 
not sure if I understand your point correctly here, are you saying that
we should describe all configurations of the "uart0", as there are indeed
another two options - uart0_0, uart0_1 which using different pins, I can
add them in next version

for uart0_2 itself , I would consider it's a complete configuration

> Although I do not reject to add a new common file, it is better
> for you to squash this part into the next uart dts patch. I think
> this is more related.
> 
I can squash them into one patch but still with separated pinctrl common file,
does this sound good to you?

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

