Return-Path: <linux-gpio+bounces-1320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1398580F6BF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 20:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C15F0281F91
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 19:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD86481E57;
	Tue, 12 Dec 2023 19:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pfPa+PgC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qqf0D/th"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEEABD;
	Tue, 12 Dec 2023 11:32:52 -0800 (PST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702409571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yAuQflHlpP7PQHRCxurGh8vd3qGPf7EP4mCw7mI4KPo=;
	b=pfPa+PgC45CXpOi9IvcThsAxhVtXutuSJaSBreWJQmzOBlJH16M51b2bMcjpbVbRDay/hP
	GiKvtTpwrl9dA0pTYXhgG5O0yXMsOCNC3oyY8Q9J04ILzUOyWQUeVB5wJzpOhgPa+gW2Je
	dhEk9ttMmhkS7CVo4GUV21hz8aABq9rp5slulmo5N6clvfy/h3D+dNkEuLKlLDjxLNbjoL
	DfpNWRgYZo1RZ0j8o+7bnBkZu3eODUUU77FBBs9Tg0RNZ6huPfPnDUOMMzJVoR4wD/0GoO
	KKjeIZbpOGMklxvmH8qYkPU0lblYu4YX+gv2TmvK8vmVyOkasYNVUzISPi2+bQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702409571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yAuQflHlpP7PQHRCxurGh8vd3qGPf7EP4mCw7mI4KPo=;
	b=qqf0D/thwWl4/VatQWveBxWB+9Ei1hdZ4zfCGMXPgZFxuCV59ZD06fPGWd1NUTVm2wTNfe
	4FKztjP2ODZOuPBg==
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: stm32: fix GPIO level interrupts
In-Reply-To: <ZXh9rIyy6mu9zFry@dell-precision-5540>
References: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
 <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
 <87ttosqvbq.ffs@tglx> <ZXh9rIyy6mu9zFry@dell-precision-5540>
Date: Tue, 12 Dec 2023 20:32:50 +0100
Message-ID: <87il53p671.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ben!

On Tue, Dec 12 2023 at 10:35, Ben Wolsieffer wrote:
> On Fri, Dec 08, 2023 at 09:43:21PM +0100, Thomas Gleixner wrote:
>> On Mon, Dec 04 2023 at 15:33, Ben Wolsieffer wrote:
>> > The STM32 doesn't support GPIO level interrupts in hardware, so the
>> > driver tries to emulate them using edge interrupts, by retriggering the
>> > interrupt if necessary based on the pin state after the handler
>> > finishes.
>> >
>> > Currently, this functionality does not work because the irqchip uses
>> > handle_edge_irq(), which doesn't run the irq_eoi() or irq_unmask()
>> > callbacks after handling the interrupt. This patch fixes this by using
>> > handle_level_irq() for level interrupts, which causes irq_unmask() to be
>> > called to retrigger the interrupt.
>> 
>> This does not make any sense at all. irq_unmask() does not retrigger
>> anything. It sets the corresponding bit in the mask register, not more
>> not less.
>
> I don't think this is correct. I was referring to
> stm32_gpio_irq_unmask(), which calls stm32_gpio_irq_trigger(), which in
> turn (for level interrupts) checks the GPIO pin state and retriggers the
> interrupt if necessary.

Ah. That makes a lot more sense. Sorry that I missed that driver
detail. The changelog could mention explicitely where the retrigger
comes from. 

>> Switching to handle_level_irq() makes the following difference
>> vs. handle_edge_irq() when an interrupt is handled (ignoring the inner
>> loop):
>> 
>>       + irq_mask();
>>         irq_ack();
>>         ....
>>         handle();
>>         ....
>>       + irq_unmask();
>
> Yes, the additional call to irq_unmask() is the key difference here, as
> that callback performs the retriggering for level interrupts.

Sorry to be pedantic here. irq_unmask() is a function in the interrupt
core code which eventually ends up invoking the irqchip::irq_unmask().

>> When the interrupt is raised again after irq_ack() while the handler is
>> running, i.e. a full toggle from active to inactive and back to active
>> where the back to active transition causes the edge detector to trigger,
>> then:
>
> I don't see how this is relevant. The bug occurs with level interrupts
> in the case where there are no new transitions while the handler is
> running. For example, with a high level interrupt, if the pin is still
> high after the handler finishes, the interrupt should be immediately
> triggered again.

Ah. That's the problem you are trying to solve. Now we are getting
closer to a proper description :)

>> But in fact the regular exti driver could do the same and just handle
>> the two NVIC interrupts which need demultiplexing separately and let
>> everything else go through the hierarchy without bells and whistles.
>
> This sounds reasonable to me. It did seem strange to me that the exti
> and exti_h drivers used such different approaches, although I wasn't
> aware of the reasons behind them. I think this refactoring is out of
> scope of this bug fix though.

Sure. It just occured to me while looking at this stuff..

Care to resend with a proper explanation in the changelog?

Thanks,

        tglx

