Return-Path: <linux-gpio+bounces-16181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD43A397BA
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 10:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA7B1189344A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 09:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3042423024C;
	Tue, 18 Feb 2025 09:55:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89178200111;
	Tue, 18 Feb 2025 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739872548; cv=none; b=HeVONXgTDu7lm+TjIf347xyj/UhIVqDAu5qK/BgY7q+LIS//j0GeuKoIxoQwQ/viz5xxb107oiq06a3tbztg8gAj77dehh8a0n2j8A737TgWQnAgiQTC1iuR8YgymVvipTS9fjDTjKahnnwOKtOr7DwjE9jBe4MVTonhixwychE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739872548; c=relaxed/simple;
	bh=WuqhpzqD0eQ2AsQvz5im5Ud+8fEJv2LS6d10sJfVpis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXvfftGMkZY4Nc6nVBQFkiI+DBxGywtt334oMucoHtOI9tHQkZ4evhnmlxZb9bYcgLdV0xgrvtFqvWlBuueQmgvrWjGJkZl0pcQ0ABwQzg/Nu8o2Y+iof1eZ1VPgvdZEh4F4iLz/BAYyoYcD+XXnJCSahognh83XcoSItQ0nsAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0DE22343022;
	Tue, 18 Feb 2025 09:55:44 +0000 (UTC)
Date: Tue, 18 Feb 2025 09:55:40 +0000
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
Message-ID: <20250218095540-GYA29065@gentoo>
References: <20250123113042-GYA38135@gentoo>
 <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org>
 <20250128031712-GYB47737@gentoo>
 <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
 <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
 <20250206133156-GYA5687@gentoo>
 <CACRpkdZYYZ5tUR4gJXuCrix0k56rPPB2TUGP3KpwqMgjs_Vd5w@mail.gmail.com>
 <20250214115410-GYA21743@gentoo>
 <CACRpkdaQZ5wJ0S=FfTzBkZOfCE7zvTPQ-wn53rHcZztbHLC8xQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaQZ5wJ0S=FfTzBkZOfCE7zvTPQ-wn53rHcZztbHLC8xQ@mail.gmail.com>

Hi Linus:

On 10:44 Tue 18 Feb     , Linus Walleij wrote:
> On Fri, Feb 14, 2025 at 12:54 PM Yixun Lan <dlan@gentoo.org> wrote:
> 
> > thanks for this very detail prototype! it works mostly, with one problem:
> >
> > how to map gpio correctly to the pin from pinctrl subsystem?
> >
> > for example, I specify gpio-ranges in dts, then
> >                 gpio0: gpio@d4019000 {
> >                         compatible = "spacemit,k1-gpio";
> >                         reg = <0x0 0xd4019000 0x0 0x100>;
> >                         ...
> >                         gpio-ranges = <&pinctrl 0 0 96>;
> >                 };
> >
> >                 foo-gpios = <&gpio0 2 28 GPIO_ACTIVE_LOW>;
> >
> > It should get GPIO_92 ( 92 = 2 * 32 + 28), but turns out GPIO_28
> >
> > Probably there is something I missed...
> 
> No it's just me missing the complexity!
> 
> > to make the gpio part work, we need additional custom gpio-ranges parser,
> > which should similar to of_gpiochip_add_pin_range() in gpiolib-of.c
> > (at least gpio core need to adjust to call custom this function)
> 
> Let me send a patch set to bring threecell into the core instead,
> and see if it works for you!
> 
> I will post it real soon.
> 
can you check the v5 of the patch here [1]? which I just sent out yesterday
it does 1) implement xlate() 2) instroduce custom add_pin_page()
the gpio part works as I tested, the gpio irq probably need more testing

> Yours,
> Linus Walleij

[1] https://lore.kernel.org/spacemit/20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org/

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

