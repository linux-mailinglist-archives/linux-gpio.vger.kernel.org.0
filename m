Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7423314BFA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 10:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhBIJoO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 04:44:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhBIJnC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 04:43:02 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFC6C06178A;
        Tue,  9 Feb 2021 01:42:22 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id t25so12121386pga.2;
        Tue, 09 Feb 2021 01:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nyBvxkCfPk/R/IbU1O61DW4CxUbKmLFozPu7m+ODXT8=;
        b=i9Knmxo0KW3yPP2bz7VS817JDZIiOPiEW5Jz0MmMygjLZbW51yC4exvn+7DAtxGQLX
         DdkD/sKXzgVusapZWf1xBZ8y6e47B1PBWcDnxvHlR33SXGai9/77Nm3szH0u3kW0/T71
         Z9DMB5l+hPwx/hLQlpEe8G5BJ04sqJUelV43/t8AjFm+LoLuSBTFagClBHJMbQwVp3KB
         qEXSYA1xm48Xh2DuulHQ9q+Ebm+jtqLsA9cArlPcqeQQh38LAyxlE4/7ym7LyPuyAQSd
         HSRliAJEfCkUPinC/MR3YtHEGn/2JhX6ssiemmitt50yWL9rxVl0YGY+e+LR9eU4jw9A
         i6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nyBvxkCfPk/R/IbU1O61DW4CxUbKmLFozPu7m+ODXT8=;
        b=GKW5ANoIGQ+DfjG+jEEWbfGRF4iSl+R9j4RiwsyLvVvZ5ATNJzMqDK7T7tE19mOTRC
         58SZh3Vla5N1Em0frzrvXVa03SToLsxzP2hXgGDNKMYShyWIi/erQJwl5RiDpVHulHtl
         Cmgb9ojshsvaR3oEaAMoupTuY+qoYOo4pprPmT9COJfF02MAZW5o+4i0scFEFG2LIfb6
         dxAHfdvWrCbmWWc8gmeVYj2VHjQePnlRoBSO0L9f90ZRgysmN20KS5GMR6w1SaZmgAJk
         BmZWULyYFr3y2yOaFmXTPNR4R8oBFTyf5WfYwl94jql/Dg2IUGQj0vBDNOBbFv3idX4R
         Gm0A==
X-Gm-Message-State: AOAM530sF8XDVaogPNBwDedYv8P8O5mDIeJCB8ItWUVNvHcT2X9vUwRl
        ncQZ9H5cWqWP7qB/w5/KwkC20clvf2CJEMClIAI=
X-Google-Smtp-Source: ABdhPJwKVNcihTYiPTupGW5HmJn81evxQjJAy2uiCqCtple8tTRp4xhOz7kxOaQA7eFovDvdDs/wCV9m0/gZxzVNBvk=
X-Received: by 2002:a62:384c:0:b029:1e3:8bca:5701 with SMTP id
 f73-20020a62384c0000b02901e38bca5701mr1345365pfa.7.1612863741838; Tue, 09 Feb
 2021 01:42:21 -0800 (PST)
MIME-Version: 1.0
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <2b8001bb-0bcd-3fea-e15c-2722e7243209@huawei.com> <CAHp75VcpeYpsW6B85F0u=B+GToNh=1fYdRSMeQqE0vOtOdSi8A@mail.gmail.com>
 <1a5dfcf2-11a2-f549-782d-447d58e21305@huawei.com>
In-Reply-To: <1a5dfcf2-11a2-f549-782d-447d58e21305@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 Feb 2021 11:42:05 +0200
Message-ID: <CAHp75Vd5UV3E79sdq8uQ4pgjFORdJknpm-g7No3tomnKhinMnw@mail.gmail.com>
Subject: Re: [Linuxarm] [PATCH for next v1 0/2] gpio: few clean up patches to
 replace spin_lock_irqsave with spin_lock
To:     luojiaxing <luojiaxing@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linuxarm@openeuler.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 9, 2021 at 11:24 AM luojiaxing <luojiaxing@huawei.com> wrote:
> On 2021/2/8 21:28, Andy Shevchenko wrote:
> > On Mon, Feb 8, 2021 at 11:11 AM luojiaxing <luojiaxing@huawei.com> wrote:
> >> Sorry, my operation error causes a patch missing from this patch set. I
> >> re-send the patch set. Please check the new one.
> > What is the new one?! You have to give proper versioning and change
> > log for your series.
>
> sure, I will send a new one later, but let me answer your question first.
>
> >> On 2021/2/8 16:56, Luo Jiaxing wrote:
> >>> There is no need to use API with _irqsave in hard IRQ handler, So replace
> >>> those with spin_lock.
> > How do you know that another CPU in the system can't serve the

The keyword here is: *another*.

> > following interrupt from the hardware at the same time?
>
> Yes, I have some question before.
>
> There are some similar discussion here,  please take a look, Song baohua
> explained it more professionally.
>
> https://lore.kernel.org/lkml/e949a474a9284ac6951813bfc8b34945@hisilicon.com/
>
> Here are some excerpts from the discussion:
>
> I think the code disabling irq in hardIRQ is simply wrong.

Why?

> Since this commit
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e58aa3d2d0cc
> genirq: Run irq handlers with interrupts disabled
>
> interrupt handlers are definitely running in a irq-disabled context
> unless irq handlers enable them explicitly in the handler to permit
> other interrupts.

This doesn't explain any changes in the behaviour on SMP.
IRQ line can be disabled on a few stages:
 a) on the source (IP that generates an event)
 b) on IRQ router / controller
 c) on CPU side

The commit above is discussing (rightfully!) the problem when all
interrupts are being served by a *single* core. Nobody prevents them
from being served by *different* cores simultaneously. Also, see [1].

[1]: https://www.kernel.org/doc/htmldocs/kernel-locking/cheatsheet.html

-- 
With Best Regards,
Andy Shevchenko
