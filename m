Return-Path: <linux-gpio+bounces-17635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B181A627CF
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 08:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33F6017DF31
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 07:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80DF1C8601;
	Sat, 15 Mar 2025 07:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BKQgro62"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D4FEC0
	for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742022437; cv=none; b=kkh42C/K6BgAvHLUeb/cJaRpEjWIe8dG5N1vzzecABVrhluX+7GeEg0U7fbjJSk3BRtguRtjAJuYIW+GdVlZ2zfpWzeeRj/GqVQ5WJCJ4rG2E6XP+doQIf1Kut3qvI4qo+a7v/oo++ZFa3miJFCfTO8rbSTJ2Zcdl+pwvDbVIcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742022437; c=relaxed/simple;
	bh=l44nqQH8YBJzGUStut/yFw78rWnhW3ZRfip+/2J7eVE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZ9Lhu/ByXHHkaLHnFp5jXpVRgELdcHavLzNcl8MJiFZpXzAHbSpLkDuR3Y2DrgzIVaot6pqfel5I/m0auH5iafISHPvatXySAz4X4LtWqQAd3xcst7sVJhh085RCNc8wJzBaGNenqa60x+YkCJIhnsut5Cm9gkog3Wc8x52D8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BKQgro62; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476a720e806so25562721cf.0
        for <linux-gpio@vger.kernel.org>; Sat, 15 Mar 2025 00:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742022435; x=1742627235; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjVzOUnttHUcBAW3CLxbvzOw9L6lvEcZu1MM1KPevq8=;
        b=BKQgro62y1rXOf6gM9cqTGvPnQtoy8y1CmVSDu+BYwapQTsLAdj6oKyg7ZyfQsgp4u
         pwGcMtnaw4t3Tq25D7Ylypt4ZnOzFni9w/lszVC0jWXnGigN0YR5QgHr/JS8EEm3z1Cc
         2ki0r1/FSMxMeJzQLGBy6RbeCs2TOZl9huqD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742022435; x=1742627235;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjVzOUnttHUcBAW3CLxbvzOw9L6lvEcZu1MM1KPevq8=;
        b=Cm2NHYVvcI79mDamMX5kO63hKic0RMCtmLr1mhjIzFUfELRcc7Be0MrqGhgqLFARkD
         Bk4ngeyccfLFqizL58K/VTcGcNeQZfRweDtCCw1nhyrgNXuFsoon3w8nL2oqyMMFZYk7
         ixGJD85uk28PDDW2hdK4xvjnnhsjbJh4ASQpXspKPJds6Y8rUpKsUABJ86xLEalVYJZd
         OLpo2A5rCJghrUdZ5/1xCFQaHMHzuN602tEIEzZz4mmJ1d0iaXsAnskk7vf4pYR8qrFC
         5LK1x9r4589OCKzUcGw4Jjp+JJ3hHEzHsXUO5XwMTh9sXfTI8hy/Ou8/yBcbboin34Du
         Ccqw==
X-Forwarded-Encrypted: i=1; AJvYcCXPlaSalFmdZ8Omit/z0LQ3qaxKES0kKuefp02lkyE37Hxl8C/ujszEt0b28Ary6FrmHsBzv+LGIovA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2IAEplIxdX+DXhhi3E/zm6KUYBOVvSR49j8B8MAt74FfK1XFF
	RETTD1Z2dS88xM0Zdqvl1SAqMj73NeKIQO8b5MiVeiggdTKvR1CEE6ZJB9Zz41FJbFg5evktu+C
	RLKK3lwQwwaGfDkgi1JL1HvfkZfFtlCvZOLjM
X-Gm-Gg: ASbGncvOW1OhXDeJhPwe+o/W8n3Kux/ZPieu7C9WLu/RDvPTi2GaOV3BaPepnzYgwZs
	a20TD/NGiE2LHIdkBgYdkxEhTDXLSypSxwQCGsJhNM7W79Ls4JJbXcLSPmz7fmyFNqeW6JKwsrP
	6+uOu1+hUnFnxNm0dudXMzwTeEKCZ+0pCSdqiy48n46F4SN7mVhZIAsg==
X-Google-Smtp-Source: AGHT+IFazD/VhnOW7WkEdkQSLdsRPgxP9gTso6PzXQXfv060q0Fz/c9DNts5WDCHx2SEB6flNxzx/kWuR5dL2XtIhIs=
X-Received: by 2002:a05:6214:5192:b0:6d8:af66:6344 with SMTP id
 6a1803df08f44-6eaea9f485emr88982206d6.2.1742022434934; Sat, 15 Mar 2025
 00:07:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Mar 2025 00:07:14 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Mar 2025 00:07:14 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250312-pinctrl-msm-type-latch-v1-1-ce87c561d3d7@linaro.org>
References: <20250312-pinctrl-msm-type-latch-v1-1-ce87c561d3d7@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Sat, 15 Mar 2025 00:07:14 -0700
X-Gm-Features: AQ5f1JpCKT0sF_JUksZ7UaMO469RCUq8lI0lzOKZ3AiDfi8fFBP8n4rTUCTg8A8
Message-ID: <CAE-0n50siGEgY+NQvqBdjqg-7FaqzOUR7L9u24UiUhux1uMZcw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Clear latched interrupt status when
 changing IRQ type
To: Linus Walleij <linus.walleij@linaro.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Stephan Gerhold (2025-03-12 06:19:27)
> When submitting the TLMM test driver, Bjorn reported that some of the test
> cases are failing for GPIOs that not are backed by PDC (i.e. "non-wakeup"
> GPIOs that are handled directly in pinctrl-msm). Basically, lingering
> latched interrupt state is still being delivered at IRQ request time, e.g.:
>
>   ok 1 tlmm_test_silent_rising
>   tlmm_test_silent_falling: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-test.c:178

I wish it was called pinctrl-msm-test.c but oh well!

>   Expected atomic_read(&priv->intr_count) == 0, but
>       atomic_read(&priv->intr_count) == 1 (0x1)
>   not ok 2 tlmm_test_silent_falling
>   tlmm_test_silent_low: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-test.c:178
>   Expected atomic_read(&priv->intr_count) == 0, but
>       atomic_read(&priv->intr_count) == 1 (0x1)
>   not ok 3 tlmm_test_silent_low
>   ok 4 tlmm_test_silent_high
>
> Whether to report interrupts that came in while the IRQ was unclaimed
> doesn't seem to be well-defined in the Linux IRQ API. However, looking
> closer at these specific cases, we're actually reporting events that do not
> match the interrupt type requested by the driver:
>
>  1. After "ok 1 tlmm_test_silent_rising", the GPIO is in low state and
>     configured for IRQF_TRIGGER_RISING.
>
>  2. (a) In preparation for "tlmm_test_silent_falling", the GPIO is switched
>         to high state. The rising interrupt gets latched.

Is the interrupt unmasked here while the test is driving the GPIO line
high and the interrupt trigger is IRQF_TRIGGER_RISING? If so, this is
correct behavior.

Why wouldn't the trigger be set to IRQF_TRIGGER_FALLING, then the GPIO
driven high, and then the GPIO driven low for the test to confirm
falling edges work?

Have you seen the big comment in msm_gpio_irq_mask() and how it says we
want to latch edge interrupts even when the interrupt is masked?

>     (b) The GPIO is re-configured for IRQF_TRIGGER_FALLING, but the latched
>         interrupt isn't cleared.
>     (c) The IRQ handler is called for the latched interrupt, but there
>         wasn't any falling edge.
>
>  3. (a) For "tlmm_test_silent_low", the GPIO remains in high state.
>     (b) The GPIO is re-configured for IRQF_TRIGGER_LOW. This seems to
>         result in a phantom interrupt that gets latched.
>     (c) The IRQ handler is called for the latched interrupt, but the GPIO
>         isn't in low state.

Is the test causing phantom behavior by writing to the interrupt
hardware?

>
>  4. (a) For "tlmm_test_silent_high", the GPIO is switched to low state.
>     (b) This doesn't result in a latched interrupt, because RAW_STATUS_EN
>         was cleared when masking the level-triggered interrupt.
>
> Fix this by clearing the interrupt state whenever making any changes to the
> interrupt configuration. This includes previously disabled interrupts, but
> also any changes to interrupt polarity or detection type.

How do we avoid the case where an interrupt happens to come in while the
polarity is being changed? Won't we ignore such an interrupt now? If
these are edge interrupts that's quite bad because we may never see the
interrupt again.

I think we erred on the side of caution here and let extra edge
interrupts through because a rising or falling edge usually means the
interrupt handler just wants to run when there's some event and it will
do the work to find out if it was spurious or not. It's been years
though so I may have forgotten how this hardware works. It just makes me
very nervous that we're going to miss edges now that we always clear the
interrupt.

