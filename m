Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE8C11E6DB9
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 23:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436678AbgE1Vdv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 17:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436603AbgE1Vdt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 17:33:49 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBFDC08C5C7
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 14:33:49 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 82so42474lfh.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2020 14:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ldVlqqZ3FDUO39GbWvCw2m+scSFkVJIhpIYkWdVQ4CU=;
        b=cVMoA007x0WC8P0Eavx6zVMKjLDuUr4glWhnKahRTky7N7NQY5u4NOXaXnObdxzHuT
         oVdEJBQaFNTsXW3avIkZOOcA4a7MOEgPpG1FTYTJlr3H/A+5MsdKZuYHLALKA1hTsTsz
         nmdMr1H6K7UXf6Khy7HIzTdpfXrHaDFe20jiAvk9VqkwIjY/N7IUTipZv3UPs8h6qbch
         Ur20WUC4/3hoEy/O/EmxRehOJOPOYfjdGCp+svegVCMF+BHbcZgQ2peyPhSc/VLi1njQ
         DIYeC2j9gPhC5m8ns0cRjv0Sc1WhJ4nQ2GJ1Y5fgGOKFL54iW5TzCvQmUv4nwiYgMgrH
         OdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ldVlqqZ3FDUO39GbWvCw2m+scSFkVJIhpIYkWdVQ4CU=;
        b=PNGbFxCMhf2mDP/DIZ+O3Z/l1xMC29aJYWxHxHnwHJklr0L261LdopvrUeYH/1fLLs
         DtnrJpt6KCnzO7so0DIDJZWbCwh00CBu61RcKLFkd72kJJQ8tYEuyYaA3Jl3RTHv5uEF
         0Wr/X8UFSZ/ek8oVWCsoaOmbiVV4C3dsFe2EFhpW9UPAh+DiUmBKUfj5C/esmpBNb1zv
         fMccOdrLVxeMgm7InABOnjRJjM/N8dDCVJGeJhTmbPXco0DxdQ9rpZyzHCmQmr7qUl5K
         QCvfwXpucoQ8ePaw+FrLKpLo1QwzWcEX3dhgEfdlbLyk2Ro2FZgz7j/GtDV10QZjiyM/
         E/Hw==
X-Gm-Message-State: AOAM532AD3PRIxyLgeTNb81chKve1hQ1Bwq8W+Y0xPl3RLQC1u/Y1QHQ
        sQHwugjZygZCnTnPBsY2UB4mUuooyGqIpW28cjg4Jg==
X-Google-Smtp-Source: ABdhPJxytp5+z8yLyBf5URWT6WAXg7xT4q74X2N/N/glj43Z+YJ+j8wb6XzV80aoF25inuWQUDvoZnwgps7IqCez6bU=
X-Received: by 2002:ac2:4823:: with SMTP id 3mr2638792lft.194.1590701627388;
 Thu, 28 May 2020 14:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org> <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 May 2020 23:33:36 +0200
Message-ID: <CACRpkdaMS2G6qLtGp05pZgUCGxdS2xA2a5_ahgrwqgzLmybWcg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 23, 2020 at 7:11 PM Maulik Shah <mkshah@codeaurora.org> wrote:

> With 'commit 461c1a7d4733 ("gpiolib: override irq_enable/disable")' gpiolib
> overrides irqchip's irq_enable and irq_disable callbacks. If irq_disable
> callback is implemented then genirq takes unlazy path to disable irq.
>
> Underlying irqchip may not want to implement irq_disable callback to lazy
> disable irq when client drivers invokes disable_irq(). By overriding
> irq_disable callback, gpiolib ends up always unlazy disabling IRQ.
>
> Allow gpiolib to lazy disable IRQs by overriding irq_disable callback only
> if irqchip implemented irq_disable. In cases where irq_disable is not
> implemented irq_mask is overridden. Similarly override irq_enable callback
> only if irqchip implemented irq_enable otherwise irq_unmask is overridden.
>
> Fixes: 461c1a7d47 (gpiolib: override irq_enable/disable)
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

I applied this patch 1/4 to the GPIO tree since it is nice on its own
and it is soon merge window.

Yours,
Linus Walleij
