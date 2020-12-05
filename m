Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945092CFF72
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 23:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgLEWQH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 17:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbgLEWQH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 17:16:07 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8348C0613CF;
        Sat,  5 Dec 2020 14:15:26 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id y16so10815050ljk.1;
        Sat, 05 Dec 2020 14:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GJrEk9rHpkREDLeGbaCYdV4Xk4XmeMxuSrsIYZ82820=;
        b=e203JtZTnZ5VvV/KXQ+qQdGCWaSlS7BympRIemNYZhTGdTqRNi9jKWETCfRM0bAaXN
         4zd8dlHI/61+vkxWJtEAebykpL1NeCAhaEkdrLxxUA+X1XovEb7AWwyYilQEL2KGmiXV
         VwZ6NAXnRgb+o7BaY2YteRVydFnEOZSg4+BvzhZEKe/y5kBJedyMTaWrHG0apFJy2SCm
         0EudYo7cpgqksIcm6NlNLshrh8P+10NfwxvYpifUt1VTMaZvA5Umv19OxP6WtTf5C/Tp
         +/+fH0btRx1HueeAlB9VTQCgXiMg+x2iAyACrofHC/8u99ELp/wNJ+TFJVOxT5fZvd7o
         hJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GJrEk9rHpkREDLeGbaCYdV4Xk4XmeMxuSrsIYZ82820=;
        b=S7xJYYY2NWl07WCOb4w57gTnX1jmRrmSFgaYItw8JvhBedpo3rNn7TOfEWXjWbJTMn
         ykTx0qMlzRt9F4uQQeXd7hj+VIPVVRNcTqe1sgigktaa57UV8mh31OOmGaHGHpRApV++
         pnDfFq1wIU1QUVUdFg1xnUL8S/kfcZ7rrYGoYVjGTlnxOhmbPQdi6DK5PjDBnWWs+oI5
         dw01XMiA7sm/3HuvncThCVt9bsBMSVVOY24CRELqu8+Hm9LH195TgAvDlhR9++DOh6eo
         30DXOkVJ3WNn0X1vwhXDIVU/XRulm1jM6AH13+hNNhJWrmndMP+SbfZQdEwJGVtBGDj3
         Cg/Q==
X-Gm-Message-State: AOAM5306zmWeUAMry3fReAd5R9mJmSBVhDYBy6smLaTr1pkO85KiRucu
        jBKGaXd5od/L/NdLNZtKBwc=
X-Google-Smtp-Source: ABdhPJzOCB2s4lhcMe1LKwCjVqTfBEDjOOBLR4V5vKDiLBvHGuw2gm5VWVfPtAYA+3YCloS4AHGv/g==
X-Received: by 2002:a05:651c:211e:: with SMTP id a30mr6297339ljq.18.1607206525140;
        Sat, 05 Dec 2020 14:15:25 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id f186sm834394lfd.289.2020.12.05.14.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Dec 2020 14:15:24 -0800 (PST)
Date:   Sun, 6 Dec 2020 01:15:22 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     luojiaxing <luojiaxing@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxarm@huawei.com
Subject: Re: [PATCH v1] gpio: dwapb: mask/unmask IRQ when disable/enable it
Message-ID: <20201205221522.ifjravnir5bzmjff@mobilestation>
References: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
 <20201130112250.GK4077@smile.fi.intel.com>
 <63f7dcc4-a924-515a-2fea-31ec80f3353e@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63f7dcc4-a924-515a-2fea-31ec80f3353e@huawei.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 01, 2020 at 04:59:21PM +0800, luojiaxing wrote:
> 
> On 2020/11/30 19:22, Andy Shevchenko wrote:
> > On Mon, Nov 30, 2020 at 05:36:19PM +0800, Luo Jiaxing wrote:
> > > The mask and unmask registers are not configured in dwapb_irq_enable() and
> > > dwapb_irq_disable(). In the following situations, the IRQ will be masked by
> > > default after the IRQ is enabled:
> > > 
> > > mask IRQ -> disable IRQ -> enable IRQ
> > > 
> > > In this case, the IRQ status of GPIO controller is inconsistent with it's
> > > irq_data too. For example, in __irq_enable(), IRQD_IRQ_DISABLED and
> > > IRQD_IRQ_MASKED are both clear, but GPIO controller do not perform unmask.
> > Sounds a bit like a papering over the issue which is slightly different.
> > Can you elaborate more, why ->irq_mask() / ->irq_unmask() are not being called?
> 
> 
> Sure, The basic software invoking process is as follows:
> 
> Release IRQ:
> free_irq() -> __free_irq() -> irq_shutdown() ->__irq_disable()
> 
> Disable IRQ:
> disable_irq() -> __disable_irq_nosync() -> __disable_irq -> irq_disable ->
> __irq_disable()
> 
> As shown before, both will call __irq_disable(). The code of it is as
> follows:
> 
> if (irqd_irq_disabled(&desc->irq_data)) {
>     if (mask)
>         mask_irq(desc);
> 
> } else {
>         irq_state_set_disabled(desc);
>             if (desc->irq_data.chip->irq_disable) {
> desc->irq_data.chip->irq_disable(&desc->irq_data);
>                 irq_state_set_masked(desc);
>             } else if (mask) {
>                 mask_irq(desc);
>     }
> }
> 
> Because gpio-dwapb.c provides the hook function of irq_disable,
> __irq_disable() will directly calls chip->irq_disable() instead of
> mask_irq().
> 
> For irq_enable(), it's similar and the code is as follows:
> 
> if (!irqd_irq_disabled(&desc->irq_data)) {
>     unmask_irq(desc);
> } else {
>     irq_state_clr_disabled(desc);
>     if (desc->irq_data.chip->irq_enable) {
> desc->irq_data.chip->irq_enable(&desc->irq_data);
>         irq_state_clr_masked(desc);
>     } else {
>         unmask_irq(desc);
>     }
> }
> 
> Similarly, because gpio-dwapb.c provides the hook function of irq_enable,
> irq_enable() will directly calls chip->irq_enable() but does not call
> unmask_irq().
> 
> 
> Therefore, the current handle is as follows:
> 
> API of IRQ:        |   mask_irq()             | disable_irq()           
> |    enable_irq()
> 
> gpio-dwapb.c:  |   chip->irq_mask()   | chip->irq_diable()   |   
> chip->irq_enable()
> 
> I do not know why irq_enable() only calls chip->irq_enable(). However, the
> code shows that irq_enable() clears the disable and masked flags in the
> irq_data state.
> 
> Therefore, for gpio-dwapb.c, I thinks ->irq_enable also needs to clear the
> disable and masked flags in the hardware register.
> 

Hmm, that sounds like a problem, but the explanation is a bit unclear
to me. AFAICS you are saying that the only callbacks which are
called during the IRQ request/release are the irq_enable(), right? If
so then the only reason why we haven't got a problem reported due to
that so far is that the IRQs actually unmasked by default.

In anyway I'd suggest to join someone from the kernel IRQs-related
subsystem to this discussion to ask their opinion whether the IRQs
setup procedure is supposed to work like you say and the irq_enable
shall actually also unmask IRQs.

Thomas, Jason, Mark, could you give us your comment about the issue?

-Sergey

> 
> 
> 
