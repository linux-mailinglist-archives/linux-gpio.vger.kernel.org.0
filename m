Return-Path: <linux-gpio+bounces-9592-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFBC968B47
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 17:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 087D11F2392F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 15:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6EF1A2632;
	Mon,  2 Sep 2024 15:47:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54F013D8AC;
	Mon,  2 Sep 2024 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292035; cv=none; b=hua3UAvIvj1FvdFY7hPYNYlRP5a2SAWt7FWH3JSYz9jLjd2yH2PdpX4yOLZtGmvADhneQ4tacweeEeCiwwoHzwN8pF/loi/GiLE59I8TfC4Hrz5UtSVg6KAvhUaOyhSDGc4QFERclUkAKcrd2ineu59OKc2T/zni+3Njw62nBgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292035; c=relaxed/simple;
	bh=ZBuD0L2VOnX/fg4NpUBZgbIYocdesxoP4ZpyXqoCcCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=te9DRVB6yBbUNfNV1vOz89r1TaMqHQTsOS2rSRALBciw99a1PXr5gDK5uQNxRv4YDoiuwmsMsUe/V6ODDdx3NKFHGf9bCJMuotWzc0tWjX3fV2av3NNG+NEal1+i3BmrYjbDWvhDMuQMogeS+o2ghmF7J7kAgamlSfVCk23flfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Mon, 2 Sep 2024 15:47:02 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>, Jesse Taube <jesse@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/4] pinctrl: spacemit: add support for SpacemiT K1 SoC
Message-ID: <20240902154702-GYA840562@gentoo>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-2-1fed6a22be98@gentoo.org>
 <CACRpkdZLdbKr41yXg6ETM6ANCD+Rbd_tnz0hQ0NyU9oRXR+PnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZLdbKr41yXg6ETM6ANCD+Rbd_tnz0hQ0NyU9oRXR+PnA@mail.gmail.com>

Hi Linus:

On 09:57 Mon 02 Sep     , Linus Walleij wrote:
> Hi Yixun,
> 
> thanks for your patch! Overall the driver looks very good, it's using the
> right helpers and abstractions etc.
> 
> There is this thing that needs some elaboration:
> 
> On Wed, Aug 28, 2024 at 1:31 PM Yixun Lan <dlan@gentoo.org> wrote:
> 
> > +/* pin offset */
> > +#define PINID(x)       ((x) + 1)
> > +
> > +#define GPIO_INVAL  0
> > +#define GPIO_00     PINID(0)
> > +#define GPIO_01     PINID(1)
> (...)
> 
> So GPIO 00 has pin ID 1 actually etc.
> 
yes, in current version

> But why?
> 
good question!

from hw perspective, the GPIO_00 pinctrl register start at offset 0x4,
see chap 3.3.1 of "Pin Information" section at [1]

and in this version of patch, we are extracting pinid from register offset,
using the algorithem pinid = (offset >> 2). this idea was something I
borrowed from vendor's driver, and now you remind me this might be wrong..

> If there is no datasheet or other conflicting documentation, just
> begin numbering the GPIOs at 1 instead of 0 to match the
> hardware:
> 
> #define GPIO_01 1
> #define GPIO_02 2
> 

as current patch version, there will be some non-linear mapping, such as
#define GPIO_98 93
#define GPIO_99 92
..
#define GPIO_110 116
...

I think we could fix this by introducing a pinid_to_register_offset() function,
which should drop the pinid = (offset >> 2) mapping, but instead, doing in the
reverse way, retrive register offset from pinid, so idealy we should get
a linear mapping of GPIO to pinid, like

#define GPIO_00 0
#define GPIO_01 1
..
#define GPIO_127 127

I will work this in next patch version.

> and all is fine.
> 
> It's just very uninituitive for developers. I guess that there
> is a reason, such as that the datasheet has stated that the pin
> with pin ID 1 is GPIO 00, then this needs to be explained with
> a comment in the code: "we are doing this because otherwise
> the developers will see an offset of -1 between the number the
> pin has in the datasheet and the number they put into the
> device tree, while the hardware starts the numbering at 1, the
> documentation starts the numbering at 0".
> 
see above, a potential solution to fix this

> It is common that engineers from analog electronics background
> start numbering things from 1 while any computer science
> engineer start the numbering at 0. So this is what you get when
> an analog engineer designs the electronics and a computer
> science engineer writes that datasheet and decides to "fix"
> the problem.
> 
true, things happens, sometimes there is gap in understanding between
analog engineers and software developers..

Link: https://developer.spacemit.com/documentation?token=An1vwTwKaigaXRkYfwmcznTXned [1]

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

