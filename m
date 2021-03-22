Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B41A344069
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 13:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhCVMFC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 08:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhCVMEg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 08:04:36 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F11C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 05:04:36 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u20so20650791lja.13
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 05:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ah2Hx1ZDQaE2UDixorpF2dF37mLYvhvj/1uoKMcW/fM=;
        b=Ks8fpqvPoSERhHavX+/cDAPkj5l/yTqvPwn244Y2F6EKS3VZnL7Sh14xSYJ2sWYCs5
         2Dn11dF6r6Mg3XQXu51fjH/wE/sGiLQmzkgyEQjy0tNh/k2BMHjar17IanWs5H0GN/4D
         6tLiIL6w2nJNsxkacIWrqpGiN86lOSdzglZJjghAVRgXdz7KWNdXi11Y6tCIa4f+xkR7
         zm919FUEkDz5wrA+idfFQtjb2+fgrUetlIZjoC6VpEDvdcyc9qd59ksb9HV8EPyYG9VD
         SeSCQjz2XJ1YL1h6Oi6j1jVlZMJbo1iyNMNhQCPIzZ8Lenj8Ix0QYKAD21f6Gwagu6fP
         qpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ah2Hx1ZDQaE2UDixorpF2dF37mLYvhvj/1uoKMcW/fM=;
        b=ArE07ui8TJrSiYzdJz1YiIEeWCZcSNJ/64LYp6BfN+SNu3aPlwt9z+IDdNb6keQEVu
         cG68pVphLGxgIMHiZ+eK/OW7e1qUNiucawWJcZUyLmLP+QkU5Wxv8Cm7TCuF/HWMc53k
         1uQFG6C0ncTavu7UfPKsP3JhFNqPieyLpQtPjaRRh2fEuIFmqn5B3vog1PxoeNFra1re
         8pIu2HyriBqhT1WaQfabEfCC1NGbf6t6MNNGjrWbrGgkOEYCz4obymC3b61m29cvdsyg
         6XxVaRPftm1QwhzohXUSFe6XXfGx7JXKhlKQkszGHaYQVMBbzaUob0HGOLdQng3AuANy
         nx4w==
X-Gm-Message-State: AOAM5308YgJxU4bhtmVcNVrGbyLXv7D4j7qu2oG5TAe9F+LcV3w9L3xa
        ZK2zFAgqRxUFjNnm4kJZJiq9fehd476gOxYXVF4aMA==
X-Google-Smtp-Source: ABdhPJx3nMVCG/8wxfbOURY06wqjEXkLB13yCLV1sQGXxKoBUjdTQvnZtl1QqhQ2cb1IFKh1ibA7YLdvJBP05BSyQXU=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr9743794ljw.74.1616414674747;
 Mon, 22 Mar 2021 05:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
 <20210317155919.41450-2-alexander.sverdlin@nokia.com> <CACRpkdbnc2UHM8w85DjsoMKoim-pSX7-7c2YOUnUDdthNc9Vpw@mail.gmail.com>
 <5a163661-ec37-c8d0-24ce-440336e32c33@nokia.com> <CACRpkdYoK03nYRYCHS-0Fj=i3pTuN1-EyrVW2jaG92AyVogYJw@mail.gmail.com>
 <ee619663-80e7-f6c0-9f73-d3ff7438773f@nokia.com>
In-Reply-To: <ee619663-80e7-f6c0-9f73-d3ff7438773f@nokia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Mar 2021 13:04:23 +0100
Message-ID: <CACRpkdYnxfb1wQDxpLOs7H9-3cTm+dtQRpNxmQBGLce_TYwOCg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: Support implementations without GPIOINTR line
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 10:46 AM Alexander Sverdlin
<alexander.sverdlin@nokia.com> wrote:

> But there are standard PL061 and these without common IRQ line within one SoC.
> Are you sure that's what we want, that same DTS will contain different compatible
> string for this? Sounds non-obvious and error-prone to me.

So this is indeed a standard feature of the PL061
that doesn not warrant a special compatible string.
So I was wrong about that.

I was wrong about more things:

> And this is really something we can auto-detect. We even discussed this already:
> https://lore.kernel.org/linux-gpio/CACRpkdZpYzpMDWqJobSYH=JHgB74HbCQihOtexs+sVyo6SRJdA@mail.gmail.com/
(...)
> - If the component has 8 IRQ lines, create a hierarchical IRQdomain
>   and chip using a gpiolib core helper.
>
> - If not 1 or 8 lines, bail out with an error.

Don't trust that guy, he's often confused and has no
idea what he's doing ;)

The thing is that hierarchical interrupts are supposed to
connect the lines by absolute offsets that are *not* coming
from the device tree. This is the pattern taken by other
in-tree hierarchical GPIO controllers. We have repeatedly
NACKed patches adding all the IRQs to hierarchical
GPIO interrupt controllers, in favor of using hardcoded
offsets in the driver.

Do you have some good idea of how we can achieve that?

Yours,
Linus Walleij
