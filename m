Return-Path: <linux-gpio+bounces-16667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3A5A471FE
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 03:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81DF37A4CCF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 02:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A878916C850;
	Thu, 27 Feb 2025 02:12:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305F31F94A;
	Thu, 27 Feb 2025 02:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740622364; cv=none; b=aFJd8TaL+fXSTVN/NIb0mOrE1hVKuAHMzoF2TS2ahyUFOXwg0DUAnS6oz2ZDvfTX/loGARXbIoBodYyW+Rp1A8dRK8UJQJPWOniUZUTtwT2dv75Cq7MRcI+xzjjeyhPI13QvVvsj0K5nknthTq4aUGAPhLoGJYlwpSutlyyG1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740622364; c=relaxed/simple;
	bh=ifqPnkz/Cmbgn+vhwLS0hFqMZK55t0zaXonRqB2y7X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6jX8JUXclpogKlh+R5L+jsfaOIMqe6OLMhZR+Wdqh3JFyMLWFPxLQPHylvzcFvOOxvPO2mZDEIsoYGuMuNsVcPUIGCpB8Xfh1JKJZA5sc4F0WN9jAxG8VuJicN3z+sasf6nE+zwmpH9ZPKuAYAe9L4YrKzqpQfBlVruUCebi6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id ED35D34315C;
	Thu, 27 Feb 2025 02:12:41 +0000 (UTC)
Date: Thu, 27 Feb 2025 02:12:31 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v7 0/4] riscv: spacemit: add gpio support for K1 SoC
Message-ID: <20250227021231-GYA46699@gentoo>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
 <20250226010108-GYA44567@gentoo>
 <CACRpkdY7nzzu3-+FwpSYqmX+O559LoXHiqcvP2OxkhX+9f-3wg@mail.gmail.com>
 <20250226115957-GYA45508@gentoo>
 <20250226135635-GYA45740@gentoo>
 <87tt8gemm4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt8gemm4.ffs@tglx>

Hi Thomas Gleixner:

On 16:45 Wed 26 Feb     , Thomas Gleixner wrote:
> On Wed, Feb 26 2025 at 13:56, Yixun Lan wrote:
> > sounds we need to implement .select() or .match() in irq_domain_ops,
> > then find the irq_domain.. here is a prototype version 
> > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> > index 995e5e0ec2db..c4d18267e86e 100644
> > --- a/kernel/irq/irqdomain.c
> > +++ b/kernel/irq/irqdomain.c
> > @@ -553,7 +553,7 @@ struct irq_domain *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
> >  	 */
> >  	mutex_lock(&irq_domain_mutex);
> >  	list_for_each_entry(h, &irq_domain_list, link) {
> > -		if (h->ops->select && bus_token != DOMAIN_BUS_ANY)
> > +		if (h->ops->select /* && bus_token != DOMAIN_BUS_ANY */)
> 
> This breaks existing usage and reintroduces the regression, which was
> fixed with the commit which added the bus token check....
> 
right, I shouldn't change it.

would setting a bus token explicitly for spacemit gpio be a good idea?
in drivers/gpio/gpio-spacemit-k1.c, something like:

irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

