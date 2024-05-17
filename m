Return-Path: <linux-gpio+bounces-6419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A35928C8120
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 08:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 448121F21DB1
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 06:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742C314F65;
	Fri, 17 May 2024 06:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f8KVFHeN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A4E14A8D;
	Fri, 17 May 2024 06:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715929126; cv=none; b=VLqn52wxqx/2rWfxCVjPvSWNA0ws7zGM2WsqVc62CcuYmYZUesucRBMVBVX61IKsLLW/+32ztB2ZVuceL3D8dSUCM8wGm21pwsCt4zniahz+C+ktxmbw8vY5HkCXRUE4gXIR26GChD+wd+b8XZ3qkXJRA+5uoNV87+sLhfIYf6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715929126; c=relaxed/simple;
	bh=vEIiADZtH0GuW0hNucCCzsAmTERzBSekKmZgJqaVvNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nph3ncLbh8XeRstBi9VATrS+5C6qrz7DDAS/gXA5YvEhxHo55o0w9Q9grVnw1sLFLt+1j09RErRrWIViR6xa67/Vn5OWwSilpSSO/kBaqWLewrePWkLhqstJrdRW46dhlyTomJkYHq2YVGzVY4RmVs6IT5KHio+QB6HXcAvyhWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f8KVFHeN; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5366060016;
	Fri, 17 May 2024 06:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715929116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+WtpG+JowVcU8bh3DYjQQ6K0ukhxfEGwefCmJzc8YA=;
	b=f8KVFHeNh2VvHZZ6hzRy0KYo2z1+B2wGwXn7zUG349l2A4tKLI0ZDhpexlh3IUzFtK/cnH
	G4vfuEDwNMPNJmSzzVKJTqJkec3UDkhb7Ri4LEuTyTyQUy6andM+Hdr7ASxso739ADCNPf
	Ko2E4NMePCqgMC1A7+eqx3f8QeIF3NA3fUwPrU+0d2wbbE4Xl5hJJ2PXaQO6+G79OZlB49
	Vj8Yl1i5JyjqZXeJ6PFT0cGNZNX4RmNQb3gU6C55uHf8H9w8r1JsdI8Hp2gyLKvg/YudPM
	6YxX7AHARvGW/6A5RRP+N28w/ZyAq10mTdiG1jEHqlveht7usBO2Q8V8FqmNjQ==
Date: Fri, 17 May 2024 08:58:32 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Jianqun Xu
 <jay.xu@rock-chips.com>, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] pinctrl: rockchip: add rk3308b SoC support
Message-ID: <20240517085832.365ac878@booty>
In-Reply-To: <81aa0e4e-a3c7-41d1-8cd2-4d060730b37a@gmail.com>
References: <20240515121634.23945-1-dmt.yashin@gmail.com>
	<20240515121634.23945-4-dmt.yashin@gmail.com>
	<20240515182954.03c4a475@booty>
	<81aa0e4e-a3c7-41d1-8cd2-4d060730b37a@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Dmitry,

On Thu, 16 May 2024 17:06:46 +0500
Dmitry Yashin <dmt.yashin@gmail.com> wrote:

> Hi Luca,
> 
> On 15.05.24 21:29, Luca Ceresoli wrote:
> > I'm skeptical about this being bound to a new DT compatible. As far as I
> > know the RK3308 and RK3308B are mostly equivalent, so it looks as the
> > pinctrl implementation could be detected at runtime. This would let
> > products to be built with either chip version and work on any without
> > any DT change.  
> 
> 
> Thanks for your feedback.
> 
> Indeed, these SoC's have a lot in common, but as I can see the rk3308b
> has more blocks, like extra PWM's (rk3308 datasheet 1.5 [0] shows only
> 1x PWM 4ch, when rk3308b and rk3308b-s have 3x PWM 4ch), 1-wire and
> CAN controller (mentioned in the TRM, but dropped from rk3308b
> datasheet for some reason).
> 
> So, in my view, it really makes sense to add rk3308b.dtsi, where extra
> PWM's, pinctrl compatible and its pin functions can be moved. And if
> its not worth it, then I will try to adapt the entire series to runtime
> config based on cpuid like you suggested.

Having a rk3308b.dtsi would probably make sense, yes, as there are
several differences as you described. However for the pinctrl it seems
probably not necessary.

I've seen actual products being manufactured with two different RK3308
variants in different lots of production, but with the same DT that has
rockchip,rk3308-pinctrl in it. Those would need a _selective_ DT
upgrade in order to benefit from your changes.

And even if a product had always used the B variant, it would need DT
upgrade when upgrading to a kernel with your changes. Otherwise with
patch 1/3 of this series the pictrl driver would lose many routes after
upgrading the kernel (but not the DT): can this lead to
previously-working devices to stop working? I think this is a
fundamental question to reply.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

