Return-Path: <linux-gpio+bounces-9191-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A4895FEF9
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 04:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 294EF1F2269A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 02:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EE6DDAB;
	Tue, 27 Aug 2024 02:23:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397172F37;
	Tue, 27 Aug 2024 02:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724725398; cv=none; b=VsaQEKz4ojW6ph6O4zzNEzZrm2TexpJXtAK6nw6Af9yxmK40ueHrlSJTcjXcHhphRv9ufffFX/uSgOt35vDKy5jEIf+IzP2UzAUSFJavN3sMVDtz6hdbDBePi2eB1EvAoZFU1SPqFuPhFsKCjU4FWamO79eUzb+ymhgmzbYrFw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724725398; c=relaxed/simple;
	bh=UiUmalgAhf6CiGcw/HXv99sMD3rXtYgbjqUDXiuQYG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgCVLBrhLiBD2SjPjuKrf0JWbp/oShZVJE+pBbQarkG3xLSAh6QDGGZyd2M9XoSJMPEjMo4TMC2FhWvjWnaZYnMZojIwyxaSCv+gxbEDrTFd/wYn92PF5g7tyeA01z2+jFZ4Yt1K/RKBdOmdnGn1zAlIurvxv63rjbQ2NVd0Hvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Tue, 27 Aug 2024 02:23:05 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>,
	Jesse Taube <jesse@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents for
 K1 SoC
Message-ID: <20240827022305.GYA155642.dlan.gentoo>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
 <66cbf3bb.050a0220.2632ed.b191SMTPIN_ADDED_BROKEN@mx.google.com>
 <20240826-turbofan-unwound-280af18d60cc@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826-turbofan-unwound-280af18d60cc@spud>

Hi Conor:

On 17:22 Mon 26 Aug     , Conor Dooley wrote:
> On Mon, Aug 26, 2024 at 03:09:39AM +0000, Yixun Lan wrote:
> > 
> > On 13:10 Sun 25 Aug     , Yixun Lan wrote:
> > > Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.
> > > 
> > > Two vendor specific properties are introduced here, As the pinctrl
> > > has dedicated slew rate enable control - bit[7], so we have
> > > spacemit,slew-rate-{enable,disable} for this. For the same reason,
> > > creating spacemit,strong-pull-up for the strong pull up control.
> > > 
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> I got this mail, and one of your other ones, 5 times. What's going wrong
> with your mail setup? 
> 
Oops, sorry for this, it's the second time you complain this..
TBO, I have no idea what's happened, asked Yangyu, he didn't have this problem

I'm using mutt+msmtp to reply, while using b4 to send the patch series,
for all the mails you received, do they all have same message-id?
I have a local filter for duplicated mails myself, could this help?

(I leave only one address of your mail in this reply, see if still have problem?)

> | 250   T Aug 25 Yixun Lan       (6.0K) ┌─>[PATCH v2 4/4] riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3
> | 251 N T Aug 26 Inochi Amaoto   ( 12K) │ ┌─>
> | 252   T Aug 25 Yixun Lan       (6.8K) ├─>[PATCH v2 3/4] riscv: dts: spacemit: add pinctrl support for K1 SoC
> | 253 N T Aug 26 Inochi Amaoto   ( 46K) │ ┌─>
> | 254   T Aug 25 Yixun Lan       ( 38K) ├─>[PATCH v2 2/4] pinctrl: spacemit: add support for SpacemiT K1 SoC
> | 255 N T Aug 26 Inochi Amaoto   ( 22K) │ ┌─>
> | 256   T Aug 26 Yixun Lan       ( 333) │ ├─>
> | 257   T Aug 26 Yixun Lan       ( 338) │ ├─>
> | 258   T Aug 26 Yixun Lan       ( 334) │ ├─>
> | 259   T Aug 26 Yixun Lan       ( 334) │ ├─>
> | 260   T Aug 26 Yixun Lan       ( 333) │ ├─>
> | 261   C Aug 25 Rob Herring (Ar (9.0K) │ ├─>
> | 262 N C Aug 26 Krzysztof Kozlo ( 14K) │ │ ┌─>
> | 263 N C Aug 26 Inochi Amaoto   ( 19K) │ │ ├─>
> | 264   C Aug 26 Yixun Lan       ( 285) │ │ ├─>
> | 265   C Aug 26 Yixun Lan       ( 281) │ │ ├─>
> | 266 N C Aug 26 Yixun Lan       ( 14K) │ │ ├─>
> | 267 N C Aug 26 Yixun Lan       ( 12K) │ │ ├─>
> | 268 N C Aug 26 Yixun Lan       ( 12K) │ │ ├─>
> | 269   T Aug 25 Krzysztof Kozlo ( 13K) │ ├─>
> | 270   T Aug 25 Yixun Lan       ( 14K) ├─>[PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents for K1 SoC
> | 271   T Aug 25 Yixun Lan       (8.5K) [PATCH v2 0/4] riscv: spacemit: add pinctrl support to K1 SoC
> 


-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

