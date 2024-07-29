Return-Path: <linux-gpio+bounces-8429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FF693F2FC
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 12:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB412B2274D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 10:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1DD1442E8;
	Mon, 29 Jul 2024 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AaVgNFMk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yoU0dLV8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8578F28399;
	Mon, 29 Jul 2024 10:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722249688; cv=none; b=AkGOby9pH4FaRKyjbSdf8obmoqBPU2Cgfgc9f8EobhHdR0v8kPpqYHgR0WxdcQXIvIVXZzk3wjP8jeM2ftlZrw+UNBdt99FQjpzGdU68xwXX12rFqam5G9jTsomzbMqfN7yBAnAMEZdOOnrfDwNBMMwZ/w+osc06hrBpjUNHAGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722249688; c=relaxed/simple;
	bh=klov7AXJrBxt4kaO1ORqh6ORD4spqavsP0E/bA24oao=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BuOrno1vTCcqyq46C3xKNkDO/vZN2SD6srhxEO8idXoKe6JLtDiK0KfwCcTX1VHx/YJNLk6/GC4vqblymmBFPeL1EsrO8Iy4pgj+2Y03nF5M6wTrWNjJ9ah5TiIGHDFMGCCV8B2lXryFSgNJXV8lK4azqaUcFRIyApug+c7DsY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AaVgNFMk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yoU0dLV8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722249686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUtMMscAr42lfvfhAq0RSAVA54FsqUgqvVfRKCjfdf4=;
	b=AaVgNFMkjq2oSMoVgoXhHi8LyJtviLBVSbxF2c2Onnr0cVbEL2dWnEIR8wazERXBh78577
	nlD5mJOiO1x63PUXZM29zP3SGWCXwRDmxql5v1QZ1eYu0PdiqE0jfP0SChD/DZJ6Q43mFz
	QP0/bQd97GSh9cM+Kln5SUjeBogFdcefq6cF/IfVsQbiAeHa8KHfONlqRrLrhwocxmxwdc
	Uc+v8LqB3ykRTd/5XPcIyhX88IBXcNtLHyxSO7gVC4YiIkD2lNw8cA3fbR7ohCt5csbYyQ
	5Ou4xHjkm38M8rBleSg8FasjB6rff/3oqorf4V2Httv+6BKZxQE6RfoD/iNrnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722249686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUtMMscAr42lfvfhAq0RSAVA54FsqUgqvVfRKCjfdf4=;
	b=yoU0dLV8/0NscyaF1HrCpNKZHshPsYNYXrjGhuYCXTBhgY+EB4PNTIsqh8CYm5h5eH1ckX
	5msg3Z8GpP54PyBQ==
To: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org
Cc: conor@kernel.org, conor.dooley@microchip.com, Marc Zyngier
 <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC v7 3/6] irqchip: add mpfs gpio interrupt mux
In-Reply-To: <20240723-flatworm-cornflake-8023212f6584@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-flatworm-cornflake-8023212f6584@wendy>
Date: Mon, 29 Jul 2024 12:41:25 +0200
Message-ID: <87le1k8oq2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 23 2024 at 12:27, Conor Dooley wrote:
> +
> +struct mpfs_irq_mux_bank_config {
> +	u32 mask;
> +	u8 shift;
> +};

Please see:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html

vs. coding style.

> +/*
> + * Returns an unsigned long, where a set bit indicates the corresponding
> + * interrupt is in non-direct/muxed mode for that bank/GPIO controller.
> + */
> +static inline unsigned long mpfs_irq_mux_get_muxed_irqs(struct mpfs_irq_mux *priv,
> +							unsigned int bank)
> +{
> +	unsigned long mux_config = priv->mux_config, muxed_irqs = -1;
> +	struct mpfs_irq_mux_bank_config bank_config = mpfs_irq_mux_bank_configs[bank];
> +
> +	/*
> +	 * If a bit is set in the mux, GPIO the corresponding interrupt from
> +	 * controller 2 is direct and that controllers 0 or 1 is muxed.

This is not a coherent sentence.

> +	 * Invert the bits in the configuration register, so that set bits
> +	 * equate to non-direct mode, for GPIO controller 2.
> +	 */
> +	if (bank == 2u)
> +		mux_config = ~mux_config;
> +

> +static int mpfs_irq_mux_nondirect_alloc(struct irq_domain *d, unsigned int virq,
> +					struct irq_fwspec *fwspec, struct mpfs_irq_mux *priv)
> +{
> +	unsigned int bank = fwspec->param[0] / MPFS_MAX_IRQS_PER_GPIO;
> +
> +	if (bank > 2)
> +		return -EINVAL;
> +
> +	priv->nondirect_irqchips[bank].domain = d;
> +
> +	irq_domain_set_hwirq_and_chip(d, virq, fwspec->param[0],
> +				      &mpfs_irq_mux_nondirect_irq_chip, priv);
> +	irq_set_chained_handler_and_data(virq, handle_untracked_irq,

Why does this use handle_untracked_irq()? This sets up a chained handler
but handle_untracked_irq() is a regular interrupt handler.

> +					 &priv->nondirect_irqchips[bank]);

Thanks,

        tglx

