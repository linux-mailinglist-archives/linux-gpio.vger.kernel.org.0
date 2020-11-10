Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0E72AD839
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730532AbgKJOC3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730345AbgKJOC3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:02:29 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD8AEC0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:02:28 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id v18so14816568ljc.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pJq65w6MHfv54HDA+7kJE/AlEyk8Ahf0nXwLPuOGbs4=;
        b=ssaXnhgL/V9+3zrmH550cjg6hzPJHv38SIpXQrq4Hg/9lHt0GBBA+A2T6TGro+UuqC
         JXonfm6G0/6iGHb0BR2iY3uDOXfS0u5XgTrbFrdwF1YPeGcQsFq/4ycOTGMq+Kfqhb5Q
         X/xqmnYsqeGP0gMqKHtZe+may2+RhBW8O9sUKNE/S1iAyD5XCXM/sA1B935fDVFYN8Ch
         gHcnb5NyejuBqTefKUjaw7SB5ltDENtlTC1G0affLryJSB1OM6dbiE9tPzSXJjbgA2i4
         a5BnS/7AA6GtGqFJLBrQkr+qq8eCfU9DwOMFpkc813IxXBNVR2xqimLu3MsxmDjnT4mJ
         IbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pJq65w6MHfv54HDA+7kJE/AlEyk8Ahf0nXwLPuOGbs4=;
        b=dUT5fzlU0YN1dkrB3HwPt7grxpqZQ+pZnsIUBF0DKnkQW4nUt9AR+XWq8vjJmtgdBI
         p+Eco9Gsz9ttOEz+8qBLJnqI1THHijVQZDmoZN0YSYpKHgm7CEzHqXbE1Hdhm5eKEGhQ
         sdwn2OOJbSuE9J/2FbxHM+oadoMqa0qAqm5AnkwuKmMIQg+hTG9or38YTXPQkZaDdPHP
         2hTgPWnceQQ2J2Rq+ROO2jvvXKrsPriOTsAvCbQmzxetw5yRaNwJKO4iR4rTi9f0mo8i
         4v/yxtRpS9bo9i7dN1sqo8vxkfIma1195TxMLuqVt4wVhiCHQFgFdT2dTr8e/xADYTId
         /fZg==
X-Gm-Message-State: AOAM531+OYyl3iHsNpVvPCFs+n3hvH4sRWAn7xYw2tJmWkUSLD51mRIz
        HEAa7mEG7cF2R7xxpbTcMgkZRfvWQfD6rUrgCD7Xvi+Oc7pVPg==
X-Google-Smtp-Source: ABdhPJx9+S0o/CpR55UGyjAKVRbYDirS4+h60H7HCvYUDyYNZOghWALu3cF+NPKEm4wlk+W/JJylRBPhhTBuHs4ZkNs=
X-Received: by 2002:a05:651c:1205:: with SMTP id i5mr8974026lja.283.1605016946760;
 Tue, 10 Nov 2020 06:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20201019141008.871177-1-daniel@0x0f.com> <20201019141008.871177-4-daniel@0x0f.com>
 <CACRpkdZNr6sDqJhg3KcX0bCbcd8fh2gXFYbS1r2H2Sq+vGqjUw@mail.gmail.com>
 <3fd04aeb5047d8059ddecc1eda19c2e4@kernel.org> <CAFr9PX=vxCCQgCWe9FPb6Z=0=a48HwGOfM_uOG3SqGN9VSYQUA@mail.gmail.com>
 <71f3632bee262a18e1b7edb74980ae9a@kernel.org>
In-Reply-To: <71f3632bee262a18e1b7edb74980ae9a@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 15:02:15 +0100
Message-ID: <CACRpkdYr+yhyROQzaYfFrGwG74DuZiA=fMVOesgOKrDajhTodQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] gpio: msc313: MStar MSC313 GPIO driver
To:     Marc Zyngier <maz@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 4:43 PM Marc Zyngier <maz@kernel.org> wrote:
> On 2020-11-05 15:23, Daniel Palmer wrote:
> > On Thu, 5 Nov 2020 at 21:08, Marc Zyngier <maz@kernel.org> wrote:

> > >  I see that msc313_gpio_irqchip doesn't have a
> >> .irq_set_affinity callback. Is this system UP only?
> >
> > What is in mainline right now is UP only but there are chips with a
> > second cortex A7 that I have working in my tree.
> > So I will add that in for v3 if I can work out what I should actually
> > do there. :)
>
> Probably nothing more than setting the callback to
> irq_chip_set_affinity_parent,

Hm, is this something all GPIO irqchips used on SMP systems
should be doing? Or just hierarchical ones?

Yours,
Linus Walleij
