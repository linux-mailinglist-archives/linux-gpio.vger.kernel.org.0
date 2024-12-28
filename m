Return-Path: <linux-gpio+bounces-14329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE68A9FD904
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Dec 2024 06:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E5D13A2625
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Dec 2024 05:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABB141C64;
	Sat, 28 Dec 2024 05:18:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BC979F2;
	Sat, 28 Dec 2024 05:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735363117; cv=none; b=Ia5/T8Qpy2OAJlwkoQhbYhZA+fKguj+nIG5/i8rSK334gmuU/NeLG4ltK0IRVHx3ec4Lq5MUqVXuh1J+7AWIuvzm4NI07YY/xWYeo27GPln/z/2H+bW2WOPI4E36hdtQ12teTBRZR+beNfUvEQUlf/mhuzhGXj1oCbHDen+Z3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735363117; c=relaxed/simple;
	bh=GVQmCyjgh9UxG5fCAHRuj2hOC72/PLm/7PRyUFcJdzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6sCIusEBD4gy2XmwqEe0S3WfgW+2ZNmPxMSY1D/Wpxv4hHbqyEnj3Yi4HlbARxgxb+frpul00g32ihH15OCbwCUZmXhvA2Ef1+b1jI2FnPxNL514aPy16lA4fCeu7e/Qg2MZEkAercd28kRTG7VwDKyLHE1G31EVa4lhYvI7lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Sat, 28 Dec 2024 13:18:24 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20241228051824-GYA1079860@gentoo>
References: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org>
 <20241225-03-k1-gpio-v3-1-27bb7b441d62@gentoo.org>
 <CACRpkdZPD2C2iPwOX_kW1Ug8jVkdHhhc7iFycHtzj5LQ0XWNgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZPD2C2iPwOX_kW1Ug8jVkdHhhc7iFycHtzj5LQ0XWNgQ@mail.gmail.com>

Hi Linus:

thanks for your review

On 17:34 Fri 27 Dec     , Linus Walleij wrote:
> On Wed, Dec 25, 2024 at 1:33 AM Yixun Lan <dlan@gentoo.org> wrote:
> 
> > The GPIO controller of K1 support basic functions as input/output,
> > all pins can be used as interrupt which route to one IRQ line,
> > trigger type can be select between rising edge, failing edge, or both.
> > There are four GPIO banks, each consisting of 32 pins.
> (...)
> > +description:
> > +  The controller's registers are organized as sets of eight 32-bit
> > +  registers with each set controlling a bank of up to 32 pins.  A single
> > +  interrupt is shared for all of the banks handled by the controller.
> 
> I looked at the driver and came to the conclusion that it's better to use
> 4 different instances of the chip, one for each set of 32bit registers,
> so these 4 GPIO controllers are instantiated separately.
> 
sounds good to me, I will work according to this in next version

> The operating system can handle the shared interrupt, there is no
> need to use a single device instance just because the interrupt is
> shared.
> 
> DT bindings are operating system neutral, but for example in Linux
> (if we pretend this is just one possible example) then a driver
> handling a shared IRQ can be requested with the flag IRQF_SHARED
> and the driver can just return IRQ_HANDLED if it handled an IRQ
> or IRQ_NONE if it didn't handle the irq (so other instances can
> handle it).
> 
agree, make sense

> Yours,
> Linus Walleij

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

