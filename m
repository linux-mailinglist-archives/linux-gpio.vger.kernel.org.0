Return-Path: <linux-gpio+bounces-8526-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2648B9452FC
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 20:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5C8F288B01
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 18:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6203C146D7D;
	Thu,  1 Aug 2024 18:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V/R18hQL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TB16bH+7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DEC14373A;
	Thu,  1 Aug 2024 18:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722538154; cv=none; b=q+gOq2YN9i+Q/QYjCP7h8QiWdASI1LOAM4TgrGY5vEip5xnI+REifeg6spthJ+K843Edqp6v3qtK4qItXXWaoCREGc4KX1+OozveeWeTC6Xz+QxBK1aQWVwkSXKfER7ksAZ2hv1PJCgM+MeJUr+uBPvTbO9VbAl9qPOuG51XUVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722538154; c=relaxed/simple;
	bh=Mqvq6a7v7faU/RsAxiBN033U6iPOpo33gjvwTQwwEBE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UyZ6I9a1kTlzXcC6eWpF0Dmw21m1BjpvV5Gq4AiMetoQn9WtrF3WoBnayKd7soof5o5ycTRhXeMDDFZ1Ddmke/bbn6dNXTea4XaPpcVSZIjozHeDEmwvDWe+CmNnoc9XIjq0cdXN5/C1RbvsZk93P/jCvQ8DKc4YGNLOH28BuzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V/R18hQL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TB16bH+7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722538149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zy4QAbBchws8wpEd632QvvKsWpoM4onCh56dsKjIHlQ=;
	b=V/R18hQLq+jyQoLBzyEA/jn4Fzajd35TRSiGYLRaN/IJiictIcX6L3AmjSn/d3co88iSHu
	bubzfHPnaZfsdZV+n9L6x0BH+0IDUzw4uWIiBLHtgmyyZRkKUc3z2lbAE7MFUFieOJQtr6
	/K2h2pJ1GL5UKwSIn6qNY7EqGmRnc7NfuLvUYsEbgz315JLujAFOuyuCsxlfhcCkjCj1rw
	9DAtO6VQGNm9NaCdKm+7p8mHC22oedrL3kc89L3/FE/HF+TkVc/1a8BEn4v4VvUc8p9cZd
	F33M1ajTN9rT2zJyvvJgW1OyXO6NdrO66oFuFxLBUtr01FKDFp6spDwVwNwiBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722538149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zy4QAbBchws8wpEd632QvvKsWpoM4onCh56dsKjIHlQ=;
	b=TB16bH+7FY9c5h6o6aIywattKgBHBOAnvaRdWLpcsYODy3h8ds9MT5TvjCSdJWS3Y5wMeK
	KUR0S+I/dHQsuzAw==
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Daire McNamara
 <daire.mcnamara@microchip.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [RFC v7 3/6] irqchip: add mpfs gpio interrupt mux
In-Reply-To: <20240801-palpitate-swinger-7bc8ae8deaaf@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-flatworm-cornflake-8023212f6584@wendy> <87le1k8oq2.ffs@tglx>
 <20240801-palpitate-swinger-7bc8ae8deaaf@spud>
Date: Thu, 01 Aug 2024 20:49:08 +0200
Message-ID: <87r0b82i57.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 01 2024 at 16:09, Conor Dooley wrote:
> On Mon, Jul 29, 2024 at 12:41:25PM +0200, Thomas Gleixner wrote:
>> > +	/*
>> > +	 * If a bit is set in the mux, GPIO the corresponding interrupt from
>> > +	 * controller 2 is direct and that controllers 0 or 1 is muxed.
>> 
>> This is not a coherent sentence.
>
> It should read "controller 0 or 1;s interrupt is muxed". Does that make
> more sense to you?

No: If a bit is set in the mux, GPIO the corresponding...

I'm already failing at 'GPIO'. My parser expects a verb there :)

>> > +	irq_set_chained_handler_and_data(virq, handle_untracked_irq,
>> 
>> Why does this use handle_untracked_irq()?
>
> I'll have to go and dig back in my notes as to why it is untracked. It
> was probably something like irqd_set() in handle_irq_event() blowing up
> on the irq_data being invalid (which I figure could relate back to my
> questions in the cover letter about issues with irqd_to_hwirq()) - but
> I'll double check what exactly prompted it when I get back from my
> holidays, but...
>
>> This sets up a chained handler
>> but handle_untracked_irq() is a regular interrupt handler.
>
> ...what I was likely using before was handle_simple_irq() which isn't
> chained either. You're expecting to see mpfs_irq_mux_nondirect_handler()
> here I suppose?

Yes or some other proper chained handler.

> Given you've only commented on one significant issue and two minor items,
> is it safe to conclude that the overall approach doesn't have you
> screaming and running for the hills?

I don't love it, but I don't have a better approach to deal with this.

Thanks,

        tglx

