Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F6C26DE3D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 16:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgIQO26 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 10:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727474AbgIQO2V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 10:28:21 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172BAC061352
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 06:41:41 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 34so1368671pgo.13
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/UgoXunF59Etu299iPWRKX6p+qugDieHE9zTPoUZ7U8=;
        b=ar5TrYoQFCKcFV/nNqdobCB5vBHkPsSa5p4FS85RW5ty6R9mxKaF8Ima1IcUEOn2Ir
         /dhazKxbf8JMe8gRocsR+4RLWcnFsxQ8BOwcqSELqVReRycWzaafN7qK2OE4km3iZ3pw
         mSdepv8XRkiivOW7RQeCVdafyPtlwbEgiyf8YQqUzu6PcKQe+J/TwECoSTMVzpF58W6o
         A+Pf0TUHxQshICq7zLbG7SWknDNyJR5uNLj639wyzKJx8PAJYZHPmc+ApUOZvPrEZS9A
         wsZmftEcPwg5+m0V2ufvyc0tSvjKalzTsBJ/UR00RmmAbVehBT2gpymUhb+wGkp8ucKk
         +GqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/UgoXunF59Etu299iPWRKX6p+qugDieHE9zTPoUZ7U8=;
        b=Zbr4Vb+eHDOhDTGqDq2VwPBwbTg9ZZomvScNYLpuCwC6SDgO1aEG+3qSiOBHiTHJJG
         qXuWFHtbsPZD/tCu1nrDdxyj2hEYYcbSWcRx+QHbXv/JJrroo1nHOiGDQJfQ4y125T9h
         fhI7Hz4KnIzHeo4Lmw+C5M5c/SpfBw17U+hKhA3fV2VwwS9m0xuZG1jWtddW0of5qqWd
         1eCcA1A88uYarMBDcXNMnPGewgo9jmrio/6V1BbXJ2Y5wI2WYOMp5Xs2DpZiKWMecYvM
         Qm50PK/CSP75gjX9C+QJA6Rs5O4DknqL0WGjnsu2cfUUsNKiJDvh0NvO6l4srg+zbX/8
         sIpA==
X-Gm-Message-State: AOAM533/1iWDBNXV7ofLaL+MoloBk7+4IUTz28BuNdNCyJHYifgL3o9v
        6sTIrO5P/S5R7i6S9bK2k6uhdJ1xWaM7B1Wo0KI=
X-Google-Smtp-Source: ABdhPJyMQRxI5Kp6IkaOrtlS0LF9uKoz27fdM/CmBDz3G5PwjxlXox/ro+Xr3NWr47aZvb25VbkGYbzQnPaYDw6EWwU=
X-Received: by 2002:a63:c543:: with SMTP id g3mr23012931pgd.203.1600350097444;
 Thu, 17 Sep 2020 06:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
 <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
 <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
 <20200915004541.GC4138@sol> <20200915033428.GA14286@sol> <CAM4ZDbAeLcZt3TaWQ7AH-VapR6fx9WrcHFT+v_MnXiL17Hu-9Q@mail.gmail.com>
 <20200915135732.GA100294@sol> <CAMRc=MdbZh2CE3BXg0gg6CJxMGonvUN=yFc4kjXjUnkduwJgpA@mail.gmail.com>
 <20200916095734.GA32888@sol> <CAM4ZDbCvTsQ9QyW9bF2n-noF1+kArZpCb216W9tf7X=tqSHhwg@mail.gmail.com>
In-Reply-To: <CAM4ZDbCvTsQ9QyW9bF2n-noF1+kArZpCb216W9tf7X=tqSHhwg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Sep 2020 16:41:19 +0300
Message-ID: <CAHp75Vf0vwgxC9=3n+GjW+26cMjUHO-9JnrMYg_i8Tn8MMZK7Q@mail.gmail.com>
Subject: Re: [libgpiod] gpiomon loses events
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 1:37 PM Maxim Devaev <mdevaev@gmail.com> wrote:

> > I already applied the patch to the master branch and backported it to
> > v1.5.x[1]. Please give it a try. I will make a bugfix release soon
> > too.
>
> Everything seems to be working fine now. In any case, I plan to use
> event_read_multiple (), just for reasons of paranoia (and for older
> versions) :)
>
> > If you are losing events then this is what you will get.
> > No attempt is made in the kernel or libgpiod to keep rising and falling
> > events paired (until debounce support in GPIO CDEV uAPI v2 arrives).
>
> Okay, thanks. I will take this into account.
>
> > What is your use case?  Are you seeing these problems in practice or
> > only because you are generating events faster than you service them
> > for testing?
>
> I make an IP-KVM and use GPIO to read the status of the HDD led on the
> managed server's motherboard. This led operates in PWM mode, and if
> the frequency is high enough and then the activity is stopped, then
> there is a chance that the actual state of the led will be 0, while
> the last state received from the library will be 1.

As a workaround can you simply read the state separately (yes, I
understand that is not ideal but may help a bit to mitigate the
current situation)?
I.o.w. if you haven't got a new event during certain period of time,
read the pin state to actualise it.


-- 
With Best Regards,
Andy Shevchenko
