Return-Path: <linux-gpio+bounces-17661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 491BEA63C01
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 03:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5035F188CF81
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 02:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AD914F9D9;
	Mon, 17 Mar 2025 02:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hthwMNUl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF23374C14;
	Mon, 17 Mar 2025 02:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742179745; cv=none; b=BhFbJNzj7VreXL2ljiBo2ZUF7zIXxctpQDv3Y+I6dp4+1SCdmlpZYqHseDIvtObxXVReoqj3XjCtonAwC01Q2+eEuIHZOjAJKqhSh9GTu+oT2NpkUKdMirk1e8nukrEHYaBZF0csprXdYzy217TIgZ/bdhkrRMwvjdVpZIMP1PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742179745; c=relaxed/simple;
	bh=g0Q03lSkmQ8AQVe/rzXdaa8RKedNM5MrOTc7u7vfasU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VB3ZNvBr/cxfjKqvOwpSh6CeFLa2UfiWYMpkGLeUCWtKIUwgQx/8aTwF/IThxdiTw2FJ4mUf5U8mWYtNjBuH6yAUrduUI8/wmTR/OZhQR3nDYPB1e/Jd9hW1Lc0aZqK39K4+2ZquAVO7IjwUYmXCmQgTaNTJdnvsDriWVvppUN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hthwMNUl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB3FC4CEDD;
	Mon, 17 Mar 2025 02:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742179744;
	bh=g0Q03lSkmQ8AQVe/rzXdaa8RKedNM5MrOTc7u7vfasU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hthwMNUl1EbGSNnatSV++VoY+lzHVN3CMOoMgBSVG7LXiujtS7YVq8acV3U/MqvNs
	 kmTOgkvVwpKhYLA51AG1Dgr9FEO7Pe/t5/+6klZ+2qgY8Ni4iNvBDmBBN9XZmlzaj7
	 r1yoNI5TjD3zRr48YIAeo+3nB6DrPYbkz76snErKC6UN6KMMrrkZlcolpk+MMQPaos
	 cuCp/wCkrLrmCAM0OG2ZLZ+DPlokO4gBwnuYnynjryJu1KvIDhNkeXCtIGCN8J2qoC
	 8eMxrrC4VsHZYF2TsEZI8N4eG6sz+7BPNpzxU+IcJK1znq8drTf1YlEp4XH5RECtdI
	 +ou8Dnx1/cO9w==
Date: Sun, 16 Mar 2025 21:49:01 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Douglas Anderson <dianders@chromium.org>, 
	Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH] pinctrl: qcom: Clear latched interrupt status when
 changing IRQ type
Message-ID: <eu4zyuikust6o6ybmk4f6mxbygxa3rxijylfmskxe3q7kv7d3v@bf56p3esuvqc>
References: <20250312-pinctrl-msm-type-latch-v1-1-ce87c561d3d7@linaro.org>
 <CAE-0n50siGEgY+NQvqBdjqg-7FaqzOUR7L9u24UiUhux1uMZcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50siGEgY+NQvqBdjqg-7FaqzOUR7L9u24UiUhux1uMZcw@mail.gmail.com>

On Sat, Mar 15, 2025 at 12:07:14AM -0700, Stephen Boyd wrote:
> Quoting Stephan Gerhold (2025-03-12 06:19:27)
> > When submitting the TLMM test driver, Bjorn reported that some of the test
> > cases are failing for GPIOs that not are backed by PDC (i.e. "non-wakeup"
> > GPIOs that are handled directly in pinctrl-msm). Basically, lingering
> > latched interrupt state is still being delivered at IRQ request time, e.g.:
> >
> >   ok 1 tlmm_test_silent_rising
> >   tlmm_test_silent_falling: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-test.c:178
> 
> I wish it was called pinctrl-msm-test.c but oh well!
> 
> >   Expected atomic_read(&priv->intr_count) == 0, but
> >       atomic_read(&priv->intr_count) == 1 (0x1)
> >   not ok 2 tlmm_test_silent_falling
> >   tlmm_test_silent_low: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-test.c:178
> >   Expected atomic_read(&priv->intr_count) == 0, but
> >       atomic_read(&priv->intr_count) == 1 (0x1)
> >   not ok 3 tlmm_test_silent_low
> >   ok 4 tlmm_test_silent_high
> >
> > Whether to report interrupts that came in while the IRQ was unclaimed
> > doesn't seem to be well-defined in the Linux IRQ API. However, looking
> > closer at these specific cases, we're actually reporting events that do not
> > match the interrupt type requested by the driver:
> >
> >  1. After "ok 1 tlmm_test_silent_rising", the GPIO is in low state and
> >     configured for IRQF_TRIGGER_RISING.
> >
> >  2. (a) In preparation for "tlmm_test_silent_falling", the GPIO is switched
> >         to high state. The rising interrupt gets latched.
> 
> Is the interrupt unmasked here while the test is driving the GPIO line
> high and the interrupt trigger is IRQF_TRIGGER_RISING? If so, this is
> correct behavior.
> 
> Why wouldn't the trigger be set to IRQF_TRIGGER_FALLING, then the GPIO
> driven high, and then the GPIO driven low for the test to confirm
> falling edges work?
> 

So you're saying that the interrupt consumer needs to take into
consideration any previous interrupt handler being setup for this GPIO?

Test #1 request the interrupt as rising then releases the interrupt,
then before initiating test #2 the GPIO line is driven high, the
interrupt is requested FALLING and the test is that we don't get any
interrupts.

> Have you seen the big comment in msm_gpio_irq_mask() and how it says we
> want to latch edge interrupts even when the interrupt is masked?
> 

So if the bootloader (or hardware default?) configures an interrupt for
e.g. RISING, and sometime during boot there's a rising edge, then a
client driver should expect to get a spurious interrupt?

> >     (b) The GPIO is re-configured for IRQF_TRIGGER_FALLING, but the latched
> >         interrupt isn't cleared.
> >     (c) The IRQ handler is called for the latched interrupt, but there
> >         wasn't any falling edge.
> >
> >  3. (a) For "tlmm_test_silent_low", the GPIO remains in high state.
> >     (b) The GPIO is re-configured for IRQF_TRIGGER_LOW. This seems to
> >         result in a phantom interrupt that gets latched.
> >     (c) The IRQ handler is called for the latched interrupt, but the GPIO
> >         isn't in low state.
> 
> Is the test causing phantom behavior by writing to the interrupt
> hardware?
> 
> >
> >  4. (a) For "tlmm_test_silent_high", the GPIO is switched to low state.
> >     (b) This doesn't result in a latched interrupt, because RAW_STATUS_EN
> >         was cleared when masking the level-triggered interrupt.
> >
> > Fix this by clearing the interrupt state whenever making any changes to the
> > interrupt configuration. This includes previously disabled interrupts, but
> > also any changes to interrupt polarity or detection type.
> 
> How do we avoid the case where an interrupt happens to come in while the
> polarity is being changed? Won't we ignore such an interrupt now? If
> these are edge interrupts that's quite bad because we may never see the
> interrupt again.
> 

Are you referring to the "both edge"-detection dance we're doing in the
driver?

> I think we erred on the side of caution here and let extra edge
> interrupts through because a rising or falling edge usually means the
> interrupt handler just wants to run when there's some event and it will
> do the work to find out if it was spurious or not. It's been years
> though so I may have forgotten how this hardware works. It just makes me
> very nervous that we're going to miss edges now that we always clear the
> interrupt.

I'm not saying that you're wrong, or that your concerns are unwarranted.
I wrote some simple tests to validate the behavior I expected to see. I
didn't expect to see different results between wakeup (PDC) GPIOs and
non-wakeup GPIOs, and now both passes the test case as written.

That said, I'm not finding documentation on what the exact expectations
are for these corner cases. If the expected behavior differs from what I
put in the test cases, I'd be happy to see them updated - and the driver
adjusted accordingly (for both types of GPIOs). Getting these things
clarified was part of the reason for introducing the test cases.

It certainly sounds like we need some test case for the dual-edge case
though.

Regards,
Bjorn

