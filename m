Return-Path: <linux-gpio+bounces-25553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DCAB42EF0
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 03:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02C251B26ACC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 01:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25F71C5F13;
	Thu,  4 Sep 2025 01:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="A2buGANs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279E61607A4;
	Thu,  4 Sep 2025 01:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756950074; cv=none; b=c8pKnxnJ3zTacQngd24+OMmruYhj4CNFC+sS3aQ1DVJ4eKGEqHbX3x6av59F0Yi/m4CTswEVdHeyigs8QvukckLtCe8pEqcLPV+c5vddJsHIp77dvWXKlEWtWgbCUzb+SmN7bfpzfPDt8/R+rwOimlsSf8YxcdvjicTPBsHkPsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756950074; c=relaxed/simple;
	bh=10BN+d0CyWOnY/xrZrnnEhoHL/odQO+tf4JXwUf0XxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bt4UgnaPowqZkCZmqPSQEZdAg9/jl1OYUC5BdJKJ5sod2O51tI11K92R6wouj+P4iHw821oZIUtWqJLjuF1+YDNATFgKgmXgHXgVI6us7zLeP+lvZrI47lUYLUw8KZD56Z0pEQQMK1OSe51g33Zhm+DY/FHS+uxnFz1g15CMwgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=A2buGANs; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BB59E20B30;
	Thu,  4 Sep 2025 03:41:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJLgEhmVl2CH; Thu,  4 Sep 2025 03:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756950070; bh=10BN+d0CyWOnY/xrZrnnEhoHL/odQO+tf4JXwUf0XxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A2buGANsG4HEzYHvIOD8PVZCAR0FJOTyEFIGvGFVDmxLRwW4IW/WNuHnbiQh+JP6c
	 FtraAor/QIhoSrtzmrv62cvvMoLJBxoEeQLVBjqlvBTcxvCgV5XxjwArPcAr5UfJDW
	 QIYjrM+phTZw7wtljoRc1eNRojFzI91HUgCUz3AnOeGsIKhjngPeLMtKijARSGnkbA
	 bknqVPKeMIf+qvwbUs9QegUZSIFLsYgh86QboQTbkmAcBjr1VluuLGhQmg/maNsJBP
	 6hfGrWOaJxuY2CNuZV5YCn2dP5ZXlYbHZ564SxOkRZurmj8H+zjV3o0d5RogAMtB3c
	 AsrVqtFCGIJSA==
Date: Thu, 4 Sep 2025 01:40:56 +0000
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: loongson: Document GPIO
 controller of 2K0300 SoC
Message-ID: <aLjuKPIhTcdAQ7Z1@pie>
References: <20250901133804.38433-1-ziyao@disroot.org>
 <20250901133804.38433-2-ziyao@disroot.org>
 <CAAhV-H5odi479mTr0zmDnX1WF2AmJRXTL34_ts2VCM-g6N7bjA@mail.gmail.com>
 <aLW0rgvKno3zpXDi@pie>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLW0rgvKno3zpXDi@pie>

Hi Huacai,

On Mon, Sep 01, 2025 at 02:58:54PM +0000, Yao Zi wrote:
> On Mon, Sep 01, 2025 at 10:22:04PM +0800, Huacai Chen wrote:
> > Hi, Yao,
> > 
> > On Mon, Sep 1, 2025 at 9:38 PM Yao Zi <ziyao@disroot.org> wrote:
> > >
> > > Loongson 2K0300 ships a GPIO controller whose input/output control logic
> > > is similar to previous generation of SoCs. Additionally, it acts as an
> > > interrupt-controller supporting both level and edge interrupts and has a
> > > distinct reset signal.
> > >
> > > Describe its compatible in devicetree. We enlarge the maximum value of
> > > ngpios to 128, since the controller technically supports at most 128
> > > pins, although only 106 are routed out of the package. Properties for
> > > interrupt-controllers and resets are introduced and limited as 2K0300
> > > only.
> > Replace the full name with "Loongson-2K0300" and short name with
> > "LS2K0300", others look good to me.
> > Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> 
> I don't understand what is improved with this. For the fullname, I don't
> see any difference between "Loongson 2K0300" and "Loongson-2K0300". And
> for the short one, omitting the "LS" prefix doesn't introduce any
> ambiguity, either.
> 
> I did a quick search through git log, and found many commits for Loongson
> 2K SoCs do include a hyphen for the fullname and "LS" prefix for
> abbreviation in messages, while some merge commits don't do so.
> 
> Even the official production page for Loongson 2K0300 refers to it
> without a hyphen[1]. Thus I cannot find out of the point of rewording...
> 
> > Loongson 2K0300 is a multi-function SoC build upon the LA264 processor
> > core, ...
> 
> I'll appreciate and adapt it if you could explain why the change is
> necessary. Thanks for your patience.

Though I still don't understand purpose of the change, I've sent v3[2]
with naming style adjusted and all comments you left in PATCH 2
resolved. Thanks for your review.

> Best regards,
> Yao Zi
> 
> [1]: https://loongson.cn/EN/product/show?id=35

Regards,
Yao Zi

[2]: https://lore.kernel.org/linux-gpio/20250904013438.2405-1-ziyao@disroot.org/

