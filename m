Return-Path: <linux-gpio+bounces-15463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC63A2AA09
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 14:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB1AA3A45A4
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9FE1EA7F4;
	Thu,  6 Feb 2025 13:32:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62F51EA7E2;
	Thu,  6 Feb 2025 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848725; cv=none; b=pMe4BOt8YheXK4o29wZ8uZqJB5RQOEG6jh3dkh0lyBmbnXOM1qbDE3YLyGwhaCoeC/nKZXKUe1hHRbB1Xi95M+w4HSHna0fFEUeFKt0QGAPMJ6CzQugxBPoKFs1rKlydJJ9DZLXL4v6JhjLvJVQZWPeNGP0z6Snu/EpTW6mgvQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848725; c=relaxed/simple;
	bh=45yT85WTqRhzxnDZFfHXU5w/YSy+M3a+25Xbs44fDYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9WpLUepoqWFQEu9/VdNGLdi6uFOy6VA/ssqRPs3Nap/d3WjPKsKIfsJydH91ksvTlvEr6rzLpMiHit2IrEKONaIKsrHtVPRhotBq4pqsPl3cGNsDCoi/9dx2VauOW0vdCEsyskmG8VnBguapleenNdZLrI8et/0rl1wgZTKHN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E15F4342FF5;
	Thu, 06 Feb 2025 13:32:01 +0000 (UTC)
Date: Thu, 6 Feb 2025 13:31:56 +0000
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
Message-ID: <20250206133156-GYA5687@gentoo>
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

Hi Linus and DT maintainers:

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
> > approach with three cells (where the second is instance 0,1,2 and the
> > last one the offset 0..31) then it will work all just the same I guess?
> >
both bgpio_init() and devm_gpiochip_add_data() operate on per "struct gpio_chip" bias,
which mean they need to request three independent gpio chips..

> > foo-gpios <&gpio 2 7 GPIO_ACTIVE_LOW>;
if we model the dts as above, then "&gpio" will register itself as one sole "struct gpio_chip",
 which mean one gpio chip combine three banks.. I've looked at the sunxi driver which
Samuel pointed, imply same example as this.

if taking "one gpio chip support multi banks" direction, then it will be reverted back as patch V1,
then, even the three gpio-cells model is unnecessary needed, as we can map gpio number
 to the <bank, offset> array in the underlying gpio driver

the v4 patch is very similar to drivers/gpio/gpio-dwapb.c

If had to choose the direction between v1 and v4, I personally would favor the latter,
 as from hw perspective, each gpio bank is quite indepedent - has its own io/irq registers,
 merely has interleaved io memory space, one shared IRQ line.. also the patch v4 leverage
 lots underlying generic gpio APIs, result in much simplified/clean code base..

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
> I'm sorry about the hopeless back-and-forth with the bindings, also
> for contributing to the messy debate. I do want developers to feel
> encouraged to contribute and not get stuck in too long debates.
> 
> Yours,
> Linus Walleij

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

