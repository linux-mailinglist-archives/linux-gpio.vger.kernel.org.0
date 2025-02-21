Return-Path: <linux-gpio+bounces-16360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0D6A3F417
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 13:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CADB7A6D92
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 12:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA07620ADC7;
	Fri, 21 Feb 2025 12:21:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE4E209F58;
	Fri, 21 Feb 2025 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740140492; cv=none; b=XpbIOlFnV5sFOZooCRIsta/4EhHd7f+GTuhTCLClstHaKQrm5OlvhfNvcO96YLyOuCIPa1w2ZuUVo6YdebkIqCmi6t1uB5CxUeSlAbwbYNp77vuT0pYtgC7QOlaUc6DY2onI15K6FJFPOXW5574b7RJZ2iBoE1c1xi10VMJ7sN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740140492; c=relaxed/simple;
	bh=JCMgSxffp9jYC8mhi+AC0xWwLcS0IUPYJaEcEyNJmJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YS4K91JYcfnqazB5LAEQuYIxiiDlK1Ba9jvImIQmVe/FIDh5oZmInNAFJ7XXl7pkZ2SJCOwfxYMlBxwYZGxo+va5KPcCEdCayJaFbm4G8vM5rk4t5g4C0Thv/oh7VMDqlHqXPZepwtpk5WWWsJfvWYg82bnkfn+TePCLKu1ehO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 134FF3430CB;
	Fri, 21 Feb 2025 12:21:29 +0000 (UTC)
Date: Fri, 21 Feb 2025 12:21:25 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 3/5] gpio: spacemit: add support for K1 SoC
Message-ID: <20250221122125-GYA35549@gentoo>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org>
 <CAMRc=MdJszmZ8d1MGo=bfJ8TwqOYBPLe2Jfc9MfbErDUCMQktg@mail.gmail.com>
 <MA0PR01MB567180C0FE89E3BEBAF2B12EFEC42@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
 <CAMRc=MdX6KiGk1zBRK3bZpN3iM16-8mDq40sTez6YO2kJEq0zQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdX6KiGk1zBRK3bZpN3iM16-8mDq40sTez6YO2kJEq0zQ@mail.gmail.com>

Hi Bartosz Golaszewski:

On 09:37 Fri 21 Feb     , Bartosz Golaszewski wrote:
> On Fri, Feb 21, 2025 at 12:36 AM Chen Wang <unicorn_wang@outlook.com> wrote:
> >
> >
> > On 2025/2/20 21:34, Bartosz Golaszewski wrote:
> > > On Mon, Feb 17, 2025 at 1:58 PM Yixun Lan <dlan@gentoo.org> wrote:
> > [......]
> > >> +#define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
> > >> +
> > >> +struct spacemit_gpio;
> > >> +
> > >> +struct spacemit_gpio_bank {
> > >> +       struct gpio_chip                gc;
> > >> +       struct spacemit_gpio            *sg;
> > >> +       void __iomem                    *base;
> > >> +       u32                             index;
> > >> +       u32                             irq_mask;
> > >> +       u32                             irq_rising_edge;
> > >> +       u32                             irq_falling_edge;
> > >> +};
> > >> +
> > >> +struct spacemit_gpio {
> > >> +       struct  device                  *dev;
> > >> +       struct  spacemit_gpio_bank      sgb[NR_BANKS];
> > >> +};
> > > Please don't use tabs in struct definitions.
> >
> > Why not？I see
> > https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers
> >
> 
> This is for the tip tree, not treewide.
> 
> It's my personal maintainer preference. We do use both under
> drivers/gpio/ but I prefer no-tabs in new code.
> 

thanks for this explanation..

my intention was trying to keep struct members aligned
if tabs is a no-go, would using multi blank spaces to align be acceptable?

something like:

struct spacemit_gpio_bank {
	struct gpio_chip       gc;
	struct spacemit_gpio   *sg;
	void   __iomem         *base;
       ...
}

> Bart

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

