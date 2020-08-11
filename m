Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E29224211E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Aug 2020 22:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgHKUJQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Aug 2020 16:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgHKUJQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Aug 2020 16:09:16 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AADCC061787
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 13:09:16 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id s29so1697950uae.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 13:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6qJqVdc/uC0k/47tmN/6OGWwLLeKwWyMRmMGNyMuMes=;
        b=H3ZdlnlZZbMSAPEofrl6nm6YexFFLFIlxi1eqa1GptjaFwv/xFa49I/fUr0oFBROIv
         9aU6FfSZBMqZYb8nS74vVLPJYMrj7tE81Xq79ZWbCcCyu4RRn0sOk9D/yKEs59P3iJcR
         14Kbt+2OH5xfn8oZtuAkZoCLV21W+/GQ320Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6qJqVdc/uC0k/47tmN/6OGWwLLeKwWyMRmMGNyMuMes=;
        b=uBuuQWJE6jDyzGMJGY9aJYnc8IBJi7SrOZTJo/vKbvgxpj1wvlV0A/VojHEjorUvip
         H7Sr47A1k3oWFdPXylyTu/r+GA16ARfVmA5F8DLo676tMMNRV3E2bpA85H4qyCyrTjkr
         pFcpakyONbFl3oeXEthVMb8u6Tnph4KZ+r/VapN1irexezGrLBI0e16Qvra1tNKEWlJU
         5EteJkwDc3SNwwWQPbLe+Vm8vyC8R/Js6WAPfkzEt1b8sixQJ4QLxxULdUDPA4Cl6fTP
         6EMU+2pbfVV75KEEliNfwm7kSeC2r3t2UITHZf4BToKfGjY8Eabrc8fjMplZC5Hz9UAx
         u+jg==
X-Gm-Message-State: AOAM533pqIZTZTt500ggzwFzbh296cjNEMY6Y0obGDL3QSSPc7Z0Drak
        3B5/enCM+4xLk9rmmgkrsVVmwY+k8z8=
X-Google-Smtp-Source: ABdhPJxIoaqSTwfA3Z81UhZ/pbwyreUC7FbRLNfjsirJStmKPxymli0XKkRVt3EvzJXw3hZ0WJgp1g==
X-Received: by 2002:ab0:6950:: with SMTP id c16mr24001358uas.71.1597176554040;
        Tue, 11 Aug 2020 13:09:14 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id e127sm7337vkg.5.2020.08.11.13.09.12
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 13:09:13 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id p8so6641053vsm.12
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2020 13:09:12 -0700 (PDT)
X-Received: by 2002:a05:6102:213a:: with SMTP id f26mr25614974vsg.6.1597176552506;
 Tue, 11 Aug 2020 13:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-4-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1597058460-16211-4-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 11 Aug 2020 13:09:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XH3183sJiP68v_Ka2+b=rYb8Y=7G=RcdbxdsK+nzyW=g@mail.gmail.com>
Message-ID: <CAD=FV=XH3183sJiP68v_Ka2+b=rYb8Y=7G=RcdbxdsK+nzyW=g@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] genirq: Introduce irq_suspend_one() and
 irq_resume_one() callbacks
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

On Mon, Aug 10, 2020 at 4:21 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> From: Douglas Anderson <dianders@chromium.org>
>
> The "struct irq_chip" has two callbacks in it: irq_suspend() and
> irq_resume().  These two callbacks are interesting because sometimes
> an irq chip needs to know about suspend/resume, but they are a bit
> awkward because:
> 1. They are called once for the whole irq_chip, not once per IRQ.
>    It's passed data for one of the IRQs enabled on that chip.  That
>    means it's up to the irq_chip driver to aggregate.
> 2. They are only called if you're using "generic-chip", which not
>    everyone is.
> 3. The implementation uses syscore ops, which apparently have problems
>    with s2idle.
>
> Probably the old irq_suspend() and irq_resume() callbacks should be
> deprecated.
>
> Let's introcuce a nicer API that works for all irq_chip devices.  This

You grabbed my patch (which is great, thanks!) but forgot to address
Stephen's early feedback from <https://crrev.com/c/2321123>.
Specifically:

s/introcuce/introduce


> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -468,10 +468,16 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
>   * @irq_bus_sync_unlock:function to sync and unlock slow bus (i2c) chips
>   * @irq_cpu_online:    configure an interrupt source for a secondary CPU
>   * @irq_cpu_offline:   un-configure an interrupt source for a secondary CPU
> + * @irq_suspend_one:   called on an every irq to suspend it; called even if
> + *                     this IRQ is configured for wakeup

s/called on an/called on

> + * @irq_resume_one:    called on an every irq to resume it; called even if
> + *                     this IRQ is configured for wakeup

s/called on an/called on


-Doug
