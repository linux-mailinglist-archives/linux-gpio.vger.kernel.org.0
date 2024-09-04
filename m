Return-Path: <linux-gpio+bounces-9762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1816696B53D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 10:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AD671C217B3
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 08:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D9E1CC897;
	Wed,  4 Sep 2024 08:39:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9613D81AB4;
	Wed,  4 Sep 2024 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725439169; cv=none; b=r9W3K7qwZJuS2tagDdpTumQSMrlq28fA1CML1xG0CMRMvIeLqRyjsj1x8FdI/ZZolVJE9ID1Uo7R9AY6JtsceRgjLgNPd3hXcOVMr3Ot6tcxhrLRId1Y4l5ilo35pkD4Kml/0UVOukRNZytfwqCfNNo6rPq4sFVsGkwc27EyIvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725439169; c=relaxed/simple;
	bh=jHtf8/HDMOU4CTQWvdR71mhZAyAdMJZ5rhR63YWQMEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQKbYNlteT3KJbFa6NtJ6z0MI1LPsqTjbTxv8gxntp2cbzjt7ErHiXw1VZTQCUp1XrPndsH5f9SXIyxqKW6FAa6MK2XwLiAdxBffnNI3tlyKCHo8GlVCpsg9ShnC5XxVfiuyFHdymt/AbMMqRapxrbY5ab4QxYYX+z9Jrg+Svig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Wed, 4 Sep 2024 08:39:21 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
Message-ID: <20240904083921-GYB107481@gentoo>
References: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
 <20240904-03-k1-gpio-v1-1-6072ebeecae0@gentoo.org>
 <ttvqw3hncprtshhdgsnvlfopobqcxtsraxevgxqgnlt6orftkr@ktahud64cczd>
 <20240904070520-GYA107481@gentoo>
 <f27dc213-e5a0-41d7-9522-ed29567f0097@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f27dc213-e5a0-41d7-9522-ed29567f0097@kernel.org>


On 09:42 Wed 04 Sep     , Krzysztof Kozlowski wrote:
> On 04/09/2024 09:05, Yixun Lan wrote:
> > Hi Krzysztof 
> 
> >>> +  "#interrupt-cells":
> >>> +    const: 2
> >>> +    description: |
> >>> +      The first cell is the GPIO number, the second should specify
> >>> +      flags.  The following subset of flags is supported:
> >>> +      - bits[3:0] trigger type flags (no level trigger type support)
> >>> +        1 = low-to-high edge triggered
> >>> +        2 = high-to-low edge triggered
> >>> +      Valid combinations are 1, 2, 3
> >>
> >> Hm? No, you must use standard interrupt flags, not custom ones.
> >>
> > It should be same as standard flags, my intention here was try to say
> > the controller support edge trigger only, but no level trigger flags (4, 8)
> > should I just replace number to macro, and put it like this:
> 
> Then just say that level interrupts are not supported. Do not refer to
Ok, got

> some bits (bits of what?).
> 
the flags IRQ_TYPE_LEVEL_HIGH=4, IRQ_TYPE_LEVEL_LOW=4


-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

