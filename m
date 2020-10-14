Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B40D28DF98
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 13:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730467AbgJNLHh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 07:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgJNLHh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 07:07:37 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8394C061755
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 04:07:36 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h5so3290698wrv.7
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 04:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W41UNrBJnO3F6mUKp/j7Y9vD+yd0rDMDpHinBp003dk=;
        b=qeUk4tUuhRBm8mvfQwBgJ3AlkwSh2u7x7COpoXi7F5YQVw+WoCt02V2mO2rb8kmZ/R
         qtoW3kLHrz5ycjt9wD42cdN2vb1NFd3DaSYRo0Dl7E5yLWot8AIIowHvEn5fKgl827lL
         cazqJ83WZUE4afbBmjN3UIY8DCOFdxpXz6ftKtqbL2XyCWk1UIkkKxMQ2OkK39sQqJpf
         /XZytVGmvektl1GNaYfpoSwcU9NHDisAoTEiaUBhnTZ/2/BCDRxriI2f9Iipuguytqes
         UzfpdalOfDpoHRQ6cfr9tLquK0x95XUAPbTHDqdA3nyfqcjUjJbwveXOc3RcQTHyM6CX
         irug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W41UNrBJnO3F6mUKp/j7Y9vD+yd0rDMDpHinBp003dk=;
        b=d2v/HsTixAoqABy3lGZ0sP7NtS9k9FuVkvRZSyPxW6PJESQ9NGqEZtQlRogwJW3X50
         47i3pzjps0TK2ZiOgTheMKv2wyM885w85/qpaThKAN4c1Ys2w1VVI5DfdU//sofcz8J1
         yvNpOE4BHU69p2/egt2QW+xjZtVQhPCgs3VqL2hjICFa7N48wYNrUMv4d170BDgLeSdI
         9bECq/e3SLejbAoSXd7naaPXO0Qo3R1iMvFljk5QL1FQrFWLnAI7ye9n/fhZbf05O8x0
         ffYvEpwX+AT9X668DSZerwfzH/TkXeCizH4F8poGzpPgidJBXukbWfSZIRTZvv9NxtBK
         diuQ==
X-Gm-Message-State: AOAM5332uoxHcxAqihCJNpuJf+NQXdlx9jaNAGadiO4peF624dbuWKLA
        icv2nPMBpNf00O8d1XuyUr+DRKCXRK+IytmwSLo=
X-Google-Smtp-Source: ABdhPJyvsaSITdzoBM/fQz+IeGzfPZ3qqoFP698vkoMtL7TAuBScTeNqMZDlJjl7LKX1VB81P8PPe5SxGWgQ8Bnk6do=
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr4753485wrq.209.1602673655352;
 Wed, 14 Oct 2020 04:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
 <CACRpkda4DF-XAi5XpJNLU_vjD9Zrjs6PkGpz5BW1E44W67SWvg@mail.gmail.com>
In-Reply-To: <CACRpkda4DF-XAi5XpJNLU_vjD9Zrjs6PkGpz5BW1E44W67SWvg@mail.gmail.com>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Wed, 14 Oct 2020 14:07:24 +0300
Message-ID: <CAFhCfDaUcYhNNkoR_op=4p0PQ5iGjFz9P1cnvd=axryXNDR31w@mail.gmail.com>
Subject: Re: Suggestion - Configurable Source Clock Type for Line Event Timestamping
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> The background is in the commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpio/gpiolib.c?id=f8850206e160bfe35de9ca2e726ab6d6b8cb77dd
> Also study the solution in IIO that started the discussion about
> all this:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=bc2b7dab629a51e8beb5fda4222c62a23b729f26


Thanks for the additional background information.  Funnily enough, I
had my sights on this part of the IIO functionality next.

> As Arnd stated in the thread from 2018:
> "most of these clocks make no sense at all for a random user
> space interface, mainly because I wouldn't trust user space
> programmers to make an informed decision which of those
> seven to use."
>
> So I suspect you actually managed to make a good argument
> for using the realtime clock, we didn't see that coming. :)


Well that's reassuring.  Considering doing this work is how I spent my
mid-teens, it looks like that time was well spent. :)

> If you really need the timestamp to be as close as possible
> to the actual event then I see why you want the kernel to
> make the timestamp in the hard IRQ handler already, but
> I just want to confirm that you really really need this.


Confirmed.  I see Kent has submitted a patch series for the chardev
and the v2 uAPI.  So I'll follow the patch threads from now on.  Thank
you all for this addition.

Cheers,
Jack
