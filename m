Return-Path: <linux-gpio+bounces-15436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9C3A2A5FA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 11:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCAB9188A0FF
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0735227580;
	Thu,  6 Feb 2025 10:39:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D01022688C;
	Thu,  6 Feb 2025 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838360; cv=none; b=Is/xtaDcLEC9nXAOP/DDGfHEPVpqttxpCwuuvtZLTKysmX/ozROhPoOSVPvV+gDkVgHERTi2WSpJXTD51uP+aD0SxcOvoBGvIRyDthiW+3EB1rhYFA6HDIb7E5u/3iSp3BlVJVgUQUTk5D9LyWtr03j1lr1Nblu0Z/1PteKP5JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838360; c=relaxed/simple;
	bh=IrkYBAfnihE5+RnlAP1QM/DQ+ewAzLq0FIwKqRdGAQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ht69bvjxWBnQ9Eu0EKIAh2ukWdVYjg8todLLRMT0qqlUCGcJyxBeNcp2yZO6/JCwpEq1BYAOstyg9qyYiEUan0Ss4XnvYo2Voj7S0V8Ep34k724lDcPYxIM0Tnp4DzDNRkACm2yZ7tYCiAcDrK3KtP+ibrJe5tAsSNsO5EQL7cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C3C89342FB5;
	Thu, 06 Feb 2025 10:39:17 +0000 (UTC)
Date: Thu, 6 Feb 2025 10:39:13 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Olof Johansson <olof@lixom.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
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
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20250206103913-GYB5367@gentoo>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
 <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo>
 <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org>
 <20250128031712-GYB47737@gentoo>
 <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
 <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>

hi Linus

Thanks for the ping..

On 10:18 Thu 06 Feb     , Linus Walleij wrote:
> Hi Yixun,
> 
> On Tue, Jan 28, 2025 at 5:03 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Jan 28, 2025 at 4:17 AM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > > [Rob]
> > > > If Linux can't handle 1 node for N gpio_chip's, then that's a Linux
> > > > problem. Maybe it can, IDK.
> > >
> > > I haven't seen somthing like this to register 1 node for multi gpio_chips..
> > > To gpio/pinctrl maintainer (Linus Walleij), do you have suggestion on this?
> >
> > For Linux we can call bgpio_init() three times and
> > devm_gpiochip_add_data() three times on the result and if we use the
yes, even I've already done this in v4

> > approach with three cells (where the second is instance 0,1,2 and the
> > last one the offset 0..31) then it will work all just the same I guess?
> >
agree, I just need to connect dots.. parse dts & adjust the driver code

> > foo-gpios <&gpio 2 7 GPIO_ACTIVE_LOW>;
> >
> > for offset 7 on block 2 for example.
> >
> > We need a custom xlate function I suppose.
> >
> > It just has not been done that way before, everybody just did
> > 2-cell GPIOs.
> 
> does this approach work for you? I think it's the most diplomatic.
> 
I like the approach which make sense

> I'm sorry about the hopeless back-and-forth with the bindings, also
> for contributing to the messy debate. I do want developers to feel
> encouraged to contribute and not get stuck in too long debates.
> 
no problem, thanks for the encouragement..

I planed to go for the implementation, and raise any actual problem I
may find, but it turns out taking more time than I expected (some reason
to due long chinese new year holiday..)

> Yours,
> Linus Walleij

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

