Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B0A1E3841
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 07:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgE0Fbf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 01:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0Fbe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 01:31:34 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934D0C03E96E
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 22:31:32 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z18so27309408lji.12
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 22:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L4OE+Mzwhfdx0FQgVxh0WT9tQP++uOwkn495VNZ2ONM=;
        b=IAxSISwD9wL4huimHfBqzSMqnZJ5ZHP3M0ZR/gh9/KVhz5cj0bJVobmY7aBQixJutD
         A+oBYMzTgShxXvTAx0XErdaqsMesWUQM9bcRGNZmVt2GfFo0QIIL9m1q3tYDo9pJCk0s
         brzHOYWjQRMsYpt1x2qdy8VdcOjWS22OWuCeqJWJyMRUmpn7GSD05sfZDAMxGkF3yvxc
         CXYbWyRY2PdCrnkeyLKNZbL70qTITSADMjhyB2+LxwAJgnjyQ7FnyzjB9zA6/1aixyMY
         /K8pFSq3qPL/2bzWxYOPSBvYCjE4aOj8XbchporZb/3mBtpqZtGIIVhyDWUi28i11vLS
         KM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L4OE+Mzwhfdx0FQgVxh0WT9tQP++uOwkn495VNZ2ONM=;
        b=g18325kf18SN8TMGbt6yQu89PDI+X5DM1a/cDnDZAlaMSARruzXdWW0UlCaGexyzOE
         0srFtfufbONYHuH8xMeOp64jQVF2OA8zTJlBaFmx5te32aVXdYJxCyFFH+s+oyGCswq+
         hhzayybSQEvGH/PmaMAKPK2bb9RMvP6XuIg/Sp0CqC1i5OxUJST00bOSq/TNBLPyslhk
         h8LNNOilNVmD2edaP8tlSRE8s+J7XCeO4lfabK7pjFlU0rctX6EeSzwZ3xy3Ag7qEILV
         NXWku2rb1iIcBa63/DnmSybwoNPF37DfmwCcv4L4FfAXYCqUi4HObMUC+W8UI63gctLn
         eFMQ==
X-Gm-Message-State: AOAM531ICrvrRBjGQ/rgF748k55OHtD+CwiDbbvbYy7KX2TWrpFMJDpP
        hxXtfJofXK07fwThpFYqHxlt3cngEEXt1LEcsVftIQ==
X-Google-Smtp-Source: ABdhPJyzRPvU61IZTb+rTiMaJ9jcLwmCScYBDCPh7EOJ1aEO1PF/M5kjHB7xHsWbc4AP2jL6MjrToCfOYFh0FdBvh5I=
X-Received: by 2002:a2e:9716:: with SMTP id r22mr2237717lji.293.1590557490905;
 Tue, 26 May 2020 22:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200419001858.105281-1-hector.bujanda@digi.com>
 <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
 <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
 <20200525022252.GA22956@sol> <CACRpkdagkhbULGVGJqcS55m=X2EaH_iK0Khr8+6M7ATWrC3hOQ@mail.gmail.com>
 <20200525151736.GA32461@sol>
In-Reply-To: <20200525151736.GA32461@sol>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 May 2020 07:31:20 +0200
Message-ID: <CACRpkdZnLv=mv6JEHx0aF8YsUbpJH_ZrtCD+T23XfqvJLxw4Xg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Bujanda <hector.bujanda@digi.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 5:17 PM Kent Gibson <warthog618@gmail.com> wrote:

> > I suppose gpiolib would have to steal or intercept the interrupt
> > by using e.g. IRQF_SHARED and then just return IRQ_HANDLED
> > on the first IRQ so the underlying irq handler does not get called.
>
> And how would gpiolib ensure that it was first in the chain?

I don't know.

> Totally agree with the concept - just trying to work out how to
> implement it seemlessly given the existing API and usage, and given my
> limited knowledge of the kernel internals.

The irqchip maintainers certainly know the answer for the question
of shared interrupts at least.

> > Failure is an option! Sorry if I push too complex ideas.
>
> I'm not as concerned about complexity as I am about fragility.
>
> I don't see any problem adding debounce for gpiolib-cdev.
> Adding a more complete solution to gpiolib itself is certainly
> non-trivial, if it is possible at all.

I agree. It's just that I perceive it as more elegant if we can do that.

> The path I'll probably be taking is adding a debouncer to gpiolib-cdev,
> so at least we have a solution for userspace, then take a longer look at
> the more general solution.

That's fine! Thanks for looking into this.

Linus Walleij
