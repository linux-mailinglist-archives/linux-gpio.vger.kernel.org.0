Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C34A21E2EA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 00:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgGMWTJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 18:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgGMWSK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 18:18:10 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A155C061755
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 15:18:10 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id a17so7501235vsq.6
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 15:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QHfgfv2mP6dp6kaJTVFYuFviBEEN6wpOON6T0JxtLVk=;
        b=cSeqsacEiX0VNBd7mC9bj3A8JzJZlyD3j4cmXLuYevvPoeKEk8W+U5HnPEomxpm5bo
         LRaqdmOo5RVCRntAP5RSqQ9O5u+EP+mswHCf4O+Kth2ygENQ1VWCkbAMFQ+01IILIQun
         O0GExOUmlRIqEf/OfFr3Ctc6cYjV3RMpNtbgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QHfgfv2mP6dp6kaJTVFYuFviBEEN6wpOON6T0JxtLVk=;
        b=eTjiTgq58Pz6wqci7i2wgJ1Mbkrs5ngkF6ud2v1GgHNEQh5bTt2nlg/m+wu/GqJB8Y
         pjQTv5yfxquoKBwCxnUPLNCkU0nZdAbBeVbW7CPxZHbDDD/fokhpYvvi5IpTsbjz20E1
         8KZHnA/gvB6mBnwA2lPGbNaK4H974m6mFads97T5x8xRk7pznY+1RERyffjH0GRTi60F
         jt78OYNAmr92FFTBORptGHF9uVALwlCHxUvsyQAFH/gp6rK4U2kNZu3pmB4myb7XxPyV
         rxNyMrEv4IgcniHQY1vtdFAUhPVhYG7ID8zJfnTWQq0yJvNQ64hqzfEdlU57TjyCPwrY
         jXpw==
X-Gm-Message-State: AOAM531cKqj5NMf8PFIICc64YOvtC0J/rdrGQAxcGmy4Tc3O5P6cfbSe
        DfjW/EkQkgvIKPBXQ/VM6RSKsAQ14zo=
X-Google-Smtp-Source: ABdhPJyddhR+zMT5DnLHqWrI+OGzzjzk8/38vejyFDu2soHiKLZSXtSbh6QkcWam3OC2MHDua2uaUg==
X-Received: by 2002:a67:f74f:: with SMTP id w15mr1215202vso.53.1594678689303;
        Mon, 13 Jul 2020 15:18:09 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id i184sm1841294vsc.18.2020.07.13.15.18.07
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 15:18:08 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id k7so7505889vso.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 15:18:07 -0700 (PDT)
X-Received: by 2002:a67:e046:: with SMTP id n6mr1294693vsl.6.1594678686784;
 Mon, 13 Jul 2020 15:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org> <1592818308-23001-2-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1592818308-23001-2-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Jul 2020 15:17:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcbEH2O+7xqCyDfrPR0+g+MpWWsgORNPepC=VrhOanFQ@mail.gmail.com>
Message-ID: <CAD=FV=WcbEH2O+7xqCyDfrPR0+g+MpWWsgORNPepC=VrhOanFQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] pinctrl: qcom: Remove irq_disable callback from
 msmgpio irqchip
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Jun 22, 2020 at 2:32 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> The gpio can be marked for wakeup and drivers can invoke disable_irq()
> during suspend, in such cases unlazy approach will also disable at HW
> and such gpios will not wakeup device from suspend to RAM.
>
> Remove irq_disable callback to allow gpio interrupts to lazy disabled.
> The gpio interrupts will get disabled during irq_mask callback.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 13 -------------
>  1 file changed, 13 deletions(-)

While the code of this patch looks fairly correct to me (there's no
need to implement the irq_disable callback and we can just rely on the
masking), I'm slightly anxious about the description.  It almost feels
like you're somehow relying on the laziness to "fix" your issue here.
...but the laziness is supposed to just be an optimization.
Specifically if an interrupt happens to fire at any point in time
after a driver has called disable_irq() then it acts just like a
non-lazy disable.

Said another way, I think this is a valid thing for a driver to do and
it should get woken up if the irq fires in suspend:

disable_irq();
msleep(1000);
enable_irq_wake()

Specifically if an IRQ comes in during that sleep then it will be just
like you had a non-lazy IRQ.


So while I'm for this patch, I'd suggest a simpler description
(assuming my understanding is correct):

There is no reason to implement irq_disable() and irq_mask().  Let's just
use irq_mask() and let the rest of the core handle it.


Also: it feels really weird to me that you're getting rid of the
irq_disable() but keeping irq_enable().  That seems like asking for
trouble, though I'd have to do more research to see if I could figure
out exactly what might go wrong.  Could you remove your irq_enable()
too?


-Doug
