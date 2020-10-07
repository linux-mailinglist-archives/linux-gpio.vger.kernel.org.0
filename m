Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D467285FCB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 15:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbgJGNJX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 09:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbgJGNJX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 09:09:23 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF6BC061755;
        Wed,  7 Oct 2020 06:09:22 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id o8so981295pll.4;
        Wed, 07 Oct 2020 06:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KVqiXdKPy//yBLnrbUYNPIFbKzpfm4hlm2oJcG3MPKM=;
        b=IcVmgf6DyKax8SL+CnODpfOy+HGD60ry2A6dznQV4HFKxlEZlWI7gHntlE7KHv8oLc
         1+WemA7at7Q9Pq8ysSiPtfWdMU/6mKX2mM1L1FBedW+1dk+3Ivyma4ewpba1+e/BR037
         u6zNRbytqB+YK6LWyAVmdbStn0o8adCPJ8/9HxHgRKsRrpz0HOGYniLFAODou/dwd5GK
         szRyxVs5GKAuAR1j+Nu088VoyNZ+absaejCfre3l26i7d7kUB3BT8shJSRTS43Yp3IF0
         7j7HwHAl1eeL2Ln27N3L315ZoxtQNuJmNYw3gOouy5iootYcF5owyUSa5wC3uGgPd8Kj
         9UEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KVqiXdKPy//yBLnrbUYNPIFbKzpfm4hlm2oJcG3MPKM=;
        b=REFE9xLC58yMzI4MrmYgyZG7kmxZByOSKZd7ga9h3WrXg7hVyxBxVYXSdPEekm/8wW
         BiTI4E3uvHMz280jp7H5AIDG53gsdwd+80sQ67ncNyxDjAPFuEYc2xEXl/td9alnAO+t
         wGYtTyNzWj4zVU/Vfd7OVzk+qW6nQtcH2dmWG0+rTTEVT/j1sIORqbBz3OtaKA7qfUPv
         niOFlMGco5cyjNl66j3OdhyARicclCN8uwLStWlj7YgimzD8k4Ak/q/oOenmxOi9XWlA
         Fb7BHqhZp7mmMiGh3fBNzOXJftFQcyy2k0FVR1nAjtR+u5+W7PaJgu2+htVVwwqqO4ym
         79Rw==
X-Gm-Message-State: AOAM532rbi336ynti+RFLMfMzG+k0XlzU+rs8BImD42/MMlRRbP9g30d
        UQIxa5f5vk8eBzz+/w0SCieI7qV5yIxuahuksbqxA9ZO39N17Qwa
X-Google-Smtp-Source: ABdhPJwqdhtZWdJhdm1csMPCmdSHYsP8gSl9tj/OFOQ/7yh5JkqqX3pFf60Mv+M5QC5MrJSkUbsoWRdq2i6Nsy4Mwfo=
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr2708722pjs.181.1602076161810;
 Wed, 07 Oct 2020 06:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201005140217.1390851-1-maz@kernel.org> <CACRpkdbctO9cWZZhVQHWkA1DN7YRTsLRo4Ub9g2x7q6BBSD=Ug@mail.gmail.com>
 <CAHp75Vdb3y_r_+Mq8K=Jog21wiFH54F18ED8eBwT4rM_zxcCUA@mail.gmail.com> <0175d3ce84ea0aa938a3ce9b3731762e@kernel.org>
In-Reply-To: <0175d3ce84ea0aa938a3ce9b3731762e@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 7 Oct 2020 16:10:11 +0300
Message-ID: <CAHp75VdQixJStuVj_aMZ9PhkWXk4RoUa13wAMDj4KGwm2t9nFQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Survive spurious interrupts
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 7, 2020 at 3:09 PM Marc Zyngier <maz@kernel.org> wrote:
> On 2020-10-07 13:02, Andy Shevchenko wrote:
> > On Wed, Oct 7, 2020 at 12:49 PM Linus Walleij
> > <linus.walleij@linaro.org> wrote:
> >> On Mon, Oct 5, 2020 at 4:02 PM Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> > The pca953x driver never checks the result of irq_find_mapping(),
> >> > which returns 0 when no mapping is found. When a spurious interrupt
> >> > is delivered (which can happen under obscure circumstances), the
> >> > kernel explodes as it still tries to handle the error code as
> >> > a real interrupt.
> >> >
> >> > Handle this particular case and warn on spurious interrupts.
> >> >
> >> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> >
> > Wait, doesn't actually [1]  fix the reported issue?
>
> Not at all.
>
> > Marc, can you confirm this?
> >
> > [1]: e43c26e12dd4 ("gpio: pca953x: Fix uninitialized pending variable")
>
> Different bug, really. If an interrupt is *really* pending, and no
> mapping established yet, feeding the result of irq_find_mapping() to
> handle_nested_irq() will lead to a panic.

I don't understand. We have plenty of drivers doing exactly the way
without checking this returned code. What circumstances makes the
mapping be absent?

Shouldn't we rather change this:

        girq->handler = handle_simple_irq;
to this:
        girq->handler = handle_bad_irq;
?

> Recently seen on a Tegra system suffering from even more pathological
> bugs.


-- 
With Best Regards,
Andy Shevchenko
