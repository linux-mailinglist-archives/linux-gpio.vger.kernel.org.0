Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A7D285E9C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 14:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgJGMB1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 08:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgJGMB0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 08:01:26 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE55C061755;
        Wed,  7 Oct 2020 05:01:25 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id c6so880037plr.9;
        Wed, 07 Oct 2020 05:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+t1sdjqqVH8mhrteN8BweQi5mB9/MukA9hzctvecndg=;
        b=WjCmUJx9iIFvDrP2xG5mbUQb8ppYfiAVyXeKOJH1Srcum7/xarzZo9A5yeIALDTDuM
         jD3VpE6k4F6GdUo+aBgR7CO8o/8fa6WQ/rXfXZ+2tmMM4EaWcT15Ddva4Ah52X4syOd0
         tLkIaR2u4Jbe2kOKhFqEOTbc+7G6/dsgoXQbe8T/JKt2UWm2q7Bxl7WEkcJCgZPy+t5j
         kFbO/SjARe4tNkOCmEAH+OTpLhHwfNHNazegJ1mNPEz8aTAT9NGW4qdrax/PctdUomUY
         gciXKh1Z898ulqorl3lLFFkeoC0ywtEgZjQRhxsdOJz+hwpa/M8TjQsTReX73ZHvY+cZ
         Ez+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+t1sdjqqVH8mhrteN8BweQi5mB9/MukA9hzctvecndg=;
        b=XTnFziSENrndAJ2ie6SJNh4Aa2khwmjvhUD0j2WRmEG1o257v93dTq4zZTtwNF6O5/
         9zP7ZgDNkLUe75IydsXcDQdGMwNGaoatlCzoDcVQlfgPXQIMd5akjGTv1PdLEvymbfCi
         oaDst+c7sXWPs4OPmcM13r1JfL1AcjpqlyrWof/0Kb1Q5qA5loomCXchBm9YFL0zgqTX
         U757dIJltAZhwsiDQi1bBVEgOPR0g6DeNmU3wm/BAMCpIRAs8JM98/Vr1G+yln1mMxh9
         jufxU5jVFeuYmYdkTTtSW4A/WU9b9b6RWbA/D1eh4rbb9Y3FK7jANQfSLVjxfjByytW4
         iVFw==
X-Gm-Message-State: AOAM532dD41Swb9fwnbdZ1MhJ5/HsyXzJwRcDIqGJcE1Q84w9Zh+mj0f
        GnF1EeaPV8/PNQSMUw4/T049UqMnE+bU90Oe7e8=
X-Google-Smtp-Source: ABdhPJzxjQS1glhI2hywfeQSPaqeq72jz7LPuZo3ELNBZGF80SXHjwGy+rAVmwldl0uo3QP/aJJmQAklIjmSc6TUeNc=
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr2671029pjb.228.1602072084994;
 Wed, 07 Oct 2020 05:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201005140217.1390851-1-maz@kernel.org> <CACRpkdbctO9cWZZhVQHWkA1DN7YRTsLRo4Ub9g2x7q6BBSD=Ug@mail.gmail.com>
In-Reply-To: <CACRpkdbctO9cWZZhVQHWkA1DN7YRTsLRo4Ub9g2x7q6BBSD=Ug@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 7 Oct 2020 15:02:14 +0300
Message-ID: <CAHp75Vdb3y_r_+Mq8K=Jog21wiFH54F18ED8eBwT4rM_zxcCUA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Survive spurious interrupts
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 7, 2020 at 12:49 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Oct 5, 2020 at 4:02 PM Marc Zyngier <maz@kernel.org> wrote:
>
> > The pca953x driver never checks the result of irq_find_mapping(),
> > which returns 0 when no mapping is found. When a spurious interrupt
> > is delivered (which can happen under obscure circumstances), the
> > kernel explodes as it still tries to handle the error code as
> > a real interrupt.
> >
> > Handle this particular case and warn on spurious interrupts.
> >
> > Signed-off-by: Marc Zyngier <maz@kernel.org>

Wait, doesn't actually [1]  fix the reported issue?
Marc, can you confirm this?

[1]: e43c26e12dd4 ("gpio: pca953x: Fix uninitialized pending variable")


-- 
With Best Regards,
Andy Shevchenko
