Return-Path: <linux-gpio+bounces-9197-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 736FE95FF81
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 05:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E4CC1F233BA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 03:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7A917BBE;
	Tue, 27 Aug 2024 03:03:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB72FB2;
	Tue, 27 Aug 2024 03:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724727806; cv=none; b=a1w/Q2hjoLrPK6FqXcFzyRKsaMvkifAxa1hVlJttI+7h2/9EFTc+APBDo88zp/xur7LXjJ88Ym87Ei2YC7QLy4fWTznqfx6rBqD9teymKSFKqQ9HukS/e2LjVup8JvKWCe+feGjzYl8ez9njpz6ZZmvuZ2VwX9MYcORkN1XQ8us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724727806; c=relaxed/simple;
	bh=LjUkIKeZNLtb+QcrbeBOUVElwFxmsTMXFg8NkJysKBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mh3Utds/MwoYRlrQSlQP7e7Q5DyKiU7zi2NqgQ5k9HY8B6andgfyL0lcxadM/T4K3i3BsqHdq4i9l1fdR9Lp8/hT5MYOHhTKIa+1gQ5ZbXZFWybGe0zJT6fLuz+2yhgRTMNgF2fTkm4vAyzJ4zzTXY8NHfaH6ks9wAegisWhYd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Tue, 27 Aug 2024 03:03:20 +0000
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
Subject: Re: [PATCH v2 3/4] riscv: dts: spacemit: add pinctrl support for K1
 SoC
Message-ID: <20240827030320.GYA208832.dlan.gentoo>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-3-ddd38a345d12@gentoo.org>
 <IA1PR20MB495318D9825567E58D4FF5D4BB8B2@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495318D9825567E58D4FF5D4BB8B2@IA1PR20MB4953.namprd20.prod.outlook.com>

Hi Inochi:

On 15:55 Mon 26 Aug     , Inochi Amaoto wrote:
> On Sun, Aug 25, 2024 at 01:10:04PM GMT, Yixun Lan wrote:
> > Add pinctrl device tree data to SpacemiT's K1 SoC.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > Note, only minimal device tree data added in this series,
> > which just try to demonstrate this pinctrl driver, but
> > more dt data can be added later, in separate patches.
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 19 +++++++++++++++++++
> >  arch/riscv/boot/dts/spacemit/k1.dtsi         |  5 +++++
> >  2 files changed, 24 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > new file mode 100644
> > index 0000000000000..38ccaad1209f5
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pinctrl/spacemit,k1-pinctrl.h>
> > +
> 
> 
> > +&pinctrl {
> > +	uart0_2_cfg: uart0-2-cfg {
> > +		uart0-2-pins {
> > +			pinmux = <K1_PADCONF(GPIO_68, 2)>,
> > +				 <K1_PADCONF(GPIO_69, 2)>;
> > +
> > +			bias-pull-up;
> > +			drive-strength-microamp = <32>;
> > +		};
> > +	};
> > +};
> 
> No common file is needed at least for now. You can put it
> in the board dts. Also, squash this into the next patch as
> it is more related to the uart.
> 
given that there are many K1 SoC boards on the market, having
a separated pinctrl dts file makes more sense, this will maximize
data sharing.

the problem here that I haven't populated too many pinctrl
cfgs in this file, so it looks quite slim.. but the plan was to
put all pinctrl meta data here even if not used by particular board.

so, I would like to keep current struture unless I'm wrong here.

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

