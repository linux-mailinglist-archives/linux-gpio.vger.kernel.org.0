Return-Path: <linux-gpio+bounces-1314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ADB80F12D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 16:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 817BC280E4F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 15:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF6E76DBB;
	Tue, 12 Dec 2023 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b="LcNVEnAl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52A6F3
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 07:36:00 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4254223c150so42082171cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 07:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1702395360; x=1703000160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXcJtFX60tA1qLiGEO8wBGyAsaG5MN46AN6euEyJwkw=;
        b=LcNVEnAlEDINzOah32GP4meHrkPT/ryuX3yYGOhjnSn7HYbIKtbJxzMyQXiLxHXFJk
         JZtpyDSYoc7SWq08Ieq0f/+ac8BZSKhij7D5H8IE5dJh5C7aYKNGxfsVUf2NPT43N59E
         +XYij1lTnAaqJY86H+X30rTtqNBF0fhFEgXOIEbgvUX4Pc91CgKhZpTTUFbM0o9JyS63
         ds87Ojtx93L1KJlfFdmNVJrGmSjcDDLBOmQJx3idUq6ubKM7xiC5jMOAazJAjlPrf5EQ
         Hk93bcZ1jk2VF/TjTL9unpyL+HElKVURbJMXyniEOLAxfRci+9jNDNxz0aHQaDP23FPf
         Y96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702395360; x=1703000160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXcJtFX60tA1qLiGEO8wBGyAsaG5MN46AN6euEyJwkw=;
        b=T3/E7oOCQW9H0zqbgQBbhEtEwd0hNnlhknTfvtzdifeel9LMI3a4o7GdkcHbkAk/w1
         6cQVDcdEjOOJgmttGK2Uem3xVdlsAO8xptA+bz3lIq56rPzOqy38hWsB8qEdi4kUS4sO
         MVYYmm63/s8jDQjJv5oA7PT4ol6R8a1u0Ub2OF8feuAtBNP/3lsUdC65zD3iqRJ4qSrx
         ASEaKjb7wCHXJNRhtxFvlfsbseJT/JMdloMKqUMbp+th5T/z7hwxMy8l9ZJLbF/9y6be
         rrKsWbMw2ldAluaMOnu/3214BN/zf7qF6eiot5hGCa9qGm2LF6Dja2JnPwzS8rr1j4Nu
         2Xzg==
X-Gm-Message-State: AOJu0YyLs/zTDfo7QbTosWV/1cvr/f83+bjcSWE7f45DkO3lI6d2cCgM
	B1jAquIXbmec+xdnNezOP5bwBA==
X-Google-Smtp-Source: AGHT+IF+nhZFWFH1wPSdf7q8AFiMdrHCNgr9nWw0nKTFrSUNiS6YQ/1wS9TNqOAKUPbNLmAIHWUCaw==
X-Received: by 2002:ac8:5948:0:b0:421:c6ef:4b0b with SMTP id 8-20020ac85948000000b00421c6ef4b0bmr8033608qtz.17.1702395359848;
        Tue, 12 Dec 2023 07:35:59 -0800 (PST)
Received: from dell-precision-5540 ([50.212.55.89])
        by smtp.gmail.com with ESMTPSA id kq12-20020ac8618c000000b00423b5cf305bsm4130866qtb.65.2023.12.12.07.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 07:35:59 -0800 (PST)
Date: Tue, 12 Dec 2023 10:35:08 -0500
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: stm32: fix GPIO level interrupts
Message-ID: <ZXh9rIyy6mu9zFry@dell-precision-5540>
References: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
 <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
 <87ttosqvbq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ttosqvbq.ffs@tglx>

Thank you for taking the time to look through the STM32 manual and
review the driver. Unfortunately, I don't have enough experience with
the Linux IRQ subsystem to give you a correspondingly in depth response,
but I will attempt to address the parts that relate to the bug in
question.

On Fri, Dec 08, 2023 at 09:43:21PM +0100, Thomas Gleixner wrote:
> Ben!
> 
> On Mon, Dec 04 2023 at 15:33, Ben Wolsieffer wrote:
> > The STM32 doesn't support GPIO level interrupts in hardware, so the
> > driver tries to emulate them using edge interrupts, by retriggering the
> > interrupt if necessary based on the pin state after the handler
> > finishes.
> >
> > Currently, this functionality does not work because the irqchip uses
> > handle_edge_irq(), which doesn't run the irq_eoi() or irq_unmask()
> > callbacks after handling the interrupt. This patch fixes this by using
> > handle_level_irq() for level interrupts, which causes irq_unmask() to be
> > called to retrigger the interrupt.
> 
> This does not make any sense at all. irq_unmask() does not retrigger
> anything. It sets the corresponding bit in the mask register, not more
> not less.

I don't think this is correct. I was referring to
stm32_gpio_irq_unmask(), which calls stm32_gpio_irq_trigger(), which in
turn (for level interrupts) checks the GPIO pin state and retriggers the
interrupt if necessary.

> 
> Switching to handle_level_irq() makes the following difference
> vs. handle_edge_irq() when an interrupt is handled (ignoring the inner
> loop):
> 
>       + irq_mask();
>         irq_ack();
>         ....
>         handle();
>         ....
>       + irq_unmask();

Yes, the additional call to irq_unmask() is the key difference here, as
that callback performs the retriggering for level interrupts.

> 
> So in both cases irq_ack() clears the interrupt in the Pending register,
> right?
> 
> Now comes the interesting difference.
> 
> When the interrupt is raised again after irq_ack() while the handler is
> running, i.e. a full toggle from active to inactive and back to active
> where the back to active transition causes the edge detector to trigger,
> then:

I don't see how this is relevant. The bug occurs with level interrupts
in the case where there are no new transitions while the handler is
running. For example, with a high level interrupt, if the pin is still
high after the handler finishes, the interrupt should be immediately
triggered again.

> 
>   1) in case of handle_edge_irq() this should immediately set it in the
>      pending register again and raise another CPU interrupt, which
>      should be handled once the interrupt service routine returned.
> 
>   2) in case of handle_level_irq() this does not set it in the pending
>      register because it's masked. The unmask will set the pending
>      register bit _if_ and only _if_ the edge detector has latched the
>      detection. No idea whether that's the case. The manual is
>      exceptionally blury about this.
> 
> So in theory both #1 and #2 should work. But the explanation in the
> changelog is fairy tale material.
> 
> As I couldn't figure out why #1 would not work, I looked at the driver
> in more detail and also at the STM32 manual. That tells me that the
> irqchip driver is at least suboptimal. Why?
> 
> The EXTI controller is just an intermediate between the peripheral
> (including GPIO pins) and the NVIC:
> 
>          |--------------|
>          | Edge config  |   |-----------------|
>  Source -|              |---| Int. Mask logic |---> Dedicated NVIC interrupt
>          | Edge detect  | | |-----------------|
>          |--------------| |
>                           | |-----------------|   
>                           |-| Evt. Mask logic |---> CPU event input
>                           | |-----------------|   
>                           |
>                           | |-----------------|   
>                           |-| Wakeup logic    |--->....
>                             |-----------------|   
> 
> So there are two classes of sources conntect to EXTI:
> 
>    1) Direct events
> 
>       - Have a fixed edge
>       - Can be masked for Interrupt and Event generation
>       - No software trigger
>       - Not tracked in the Pending register
>       - Can evtl. wakeup the CPUs or from D3
> 
>    2) Configurable events
> 
>       - Have a configurable edge
>       - Can be masked for Interrupt and Event generation
>       - Software trigger
>       - Tracked in the Pending register
>       - Can evtl. wakeup the CPUs or from D3
> 
> The CPU event is a single input to the CPU which can be triggered by any
> source which has the Event mask enabled.
> 
> For both classes there are sources which have no connection to the NVIC,
> they can only be used to generate CPU events or trigger the wakeup
> logic.
> 
> For direct events there is a category where the peripherial interrupt is
> routed to both the EXTI and the NVIC directly. The EXTI does not provide
> a connection to the NVIC and the event cannot be masked in EXTI to
> prevent CPU interrupts. Only the CPU event masking works.
> 
> GPIO pins are configurable events which are connected to the NVIC via
> the EXTI.
> 
> But the EXTI driver implements a chained interrupt handler which listens
> on a ton of NVIC interrupts. I.e. for the STM32H7 on:
> 
>   <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <62>, <76>
> 
> NVIC   1: PVD_PVM           EXTI-SRC 16
> NVIC   2: RTC_TAMP_STAMP    EXTI-SRC 18
> NVIC   3: RTC_WAKEUP        EXTI-SRC 19
> NVIC   6: EXTI0             EXTI-SRC  0
> NVIC   7: EXTI1             EXTI-SRC  1
> NVIC   8: EXTI2             EXTI-SRC  2
> NVIC   9: EXTI3             EXTI-SRC  3
> NVIC  10: EXTI4             EXTI-SRC  4
> NVIC  23: EXTI5-9           EXTI-SRC  5-9
> NVIC  40: EXTI10-15         EXTI-SRC 10-15
> NVIC  41: RTC_ALARM         EXTI-SRC 17
> NVIC  62: ETH_WKUP          EXTI-SRC 86
> NVIC  76: OTG_HS_WKUP       EXTI-SRC 43
> 
> Each of these chained interrupts handles the full EXTI interrupt domain
> with all three banks. This does not make any sense at all especially not
> on a SMP machine.
> 
> Though it _should_ work, but it might cause interrupts handlers to be
> invoked when nothing is pending when the edge handler is active. Which
> in turn can confuse the underlying device driver depending on the
> quality...
> 
> CPU0					CPU1
> 
> NVIC int X                      	NVIC int Y
> 
>  // read_pending() is serialized by a lock, but both read the same state
>  pend = read_pending()			pend = read_pending()
>  
>  for_each_bit(bit, pend)	 	for_each_bit(bit, pend)	
>     handle_irq(domain, base + bit)         handle_irq(domain, base + bit)
>       lock(desc);                            lock(desc);
>       ack();
>       do {
>          clear(PENDING);
>          set(IN_PROGRESS);
>          unlock(desc);
>          handle();                           if (IN_PROGRESS) {
>          lock(desc);                           ack();
>                                                set(PENDING);
>          				       unlock(desc);
>          clear(IN_PROGRESS);                   return;
>                                              }
>       } while (PENDING); <- Will loop
> 
> See?

Currently, this driver is only used on single core machines, and the
more complex devices use exti_h, so this shouldn't be a problem in
practice.

> 
> In fact the only NVIC interrupts which actually need demultiplexing are
> NVIC #23 and NVIC #40 and those should only care about the EXTI
> interrupts which are actually multiplexed on them. This let's randomly
> run whatever is pending on any demux handler is far from correct.
> 
> All others are direct NVIC interrupts which just have the extra EXTI
> interrupt masking, event masking and the wakeup magic. The indirection
> via the chained handler is just pointless overhead and not necessarily
> correct.
> 
> The exti_h variant of that driver does the right thing and installs a
> hierarchical interrupt domain which acts as man in the middle between
> the source and the NVIC. Though granted they don't have the odd problem
> of multiplexing several GPIO interrupts to a single NVIC interrupt.
> 
> But in fact the regular exti driver could do the same and just handle
> the two NVIC interrupts which need demultiplexing separately and let
> everything else go through the hierarchy without bells and whistles.

This sounds reasonable to me. It did seem strange to me that the exti
and exti_h drivers used such different approaches, although I wasn't
aware of the reasons behind them. I think this refactoring is out of
scope of this bug fix though.

> 
> Thanks,
> 
>         tglx

Thanks, Ben

