Return-Path: <linux-gpio+bounces-16636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75656A4658C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 16:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B54403B434F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 15:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CE214D2B7;
	Wed, 26 Feb 2025 15:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Kv9/3dWd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ixIkh3m0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947B118BC3B;
	Wed, 26 Feb 2025 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584711; cv=none; b=k/c6h5QlTLHR+yDkCnLSxU5nlG1bIphVtar0J4gQazPBlJSmYcGJqayGJDOFQmD7PmT3T9e2Hp8dKAgQfgZoc3K/Vwlg4oeN3UTetK2n1dzI6a35CMInIyFFxhyLxwSGiA4qv0eGs3b2lJP3k1rn8TdYzQV+bVlNv8FJjtTkBZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584711; c=relaxed/simple;
	bh=JAsKYRCmpSi3tnXTqqLf4H3CovqP6Od5db5bBj4KatA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QrwM1NnII137aXS8FG9yZvbyj9ysdU9JwMt0O3inLhfxxfPO3sNnN4aRTCZw13CWDM53j5TWuleUmlVt/KPBuN+S13kdfjjg6ScwXORi6+Vx0FgicRT8RP+zVHxInFUfCtutkDkwNawKYhN4Ube5UlkzAoPUnzfpWM/K68WA/rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Kv9/3dWd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ixIkh3m0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740584707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9YAfmlQr9Pd5bXVqXHzhDo0hk63Ti5/f8ktIw5AJhI=;
	b=Kv9/3dWd+GXsGs7cU1xLIlW2zlePQy31R7G6Jy6QJFpJYBbsDogO0A4tPcqH2iqy6FlsJ+
	YJk/B9nxmFA+MHnOA5EB5BazjUZeXo6ZO2GhQ0a2odsrE0E5pf/JF4UlNInVv+1AS14qV5
	8SDQwtT8m3Jp50XfzUOOsnhjBuO9ZK7WHUIDQO/queig6lykW1ZfuXsqIi1NE7RNtPwL/c
	1ubsW8nlIrnKz0QuzMEA1aFYFs2v2rCg2zxSeLSQ1ne86Cq4FQpOeD1L+HwRiy8DIZuPoc
	uo9TcSrDqf/s5V4bB+NkfCaTvTvtKgOHTjpU0X8aujMZabOz2GZ7wsVL2CLN5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740584707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9YAfmlQr9Pd5bXVqXHzhDo0hk63Ti5/f8ktIw5AJhI=;
	b=ixIkh3m0apqeFPy9Qpy7CjIrvlJ4/WlAEuk0T/7wkqfv/ktP1pgsZB5HNeC5O7xJsKatxe
	FnzDFatK/PE7L1DA==
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alex
 Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang
 <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, Inochi Amaoto
 <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, Meng Zhang
 <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v7 0/4] riscv: spacemit: add gpio support for K1 SoC
In-Reply-To: <20250226135635-GYA45740@gentoo>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
 <20250226010108-GYA44567@gentoo>
 <CACRpkdY7nzzu3-+FwpSYqmX+O559LoXHiqcvP2OxkhX+9f-3wg@mail.gmail.com>
 <20250226115957-GYA45508@gentoo> <20250226135635-GYA45740@gentoo>
Date: Wed, 26 Feb 2025 16:45:07 +0100
Message-ID: <87tt8gemm4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Feb 26 2025 at 13:56, Yixun Lan wrote:
> sounds we need to implement .select() or .match() in irq_domain_ops,
> then find the irq_domain.. here is a prototype version 
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 995e5e0ec2db..c4d18267e86e 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -553,7 +553,7 @@ struct irq_domain *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
>  	 */
>  	mutex_lock(&irq_domain_mutex);
>  	list_for_each_entry(h, &irq_domain_list, link) {
> -		if (h->ops->select && bus_token != DOMAIN_BUS_ANY)
> +		if (h->ops->select /* && bus_token != DOMAIN_BUS_ANY */)

This breaks existing usage and reintroduces the regression, which was
fixed with the commit which added the bus token check....

Thanks,

        tglx

