Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A1120FEA3
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 23:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729559AbgF3VYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 17:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgF3VYF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 17:24:05 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B0BC061755;
        Tue, 30 Jun 2020 14:24:05 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o13so7582930pgf.0;
        Tue, 30 Jun 2020 14:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hIPfO7ux9DNr6HYEXTRvYHtolE2zfLDOhNyZZg0neiU=;
        b=l6IbFr4lB10a6avSIpBkHukmvsF7G+Pa3+nFsF43/+EvA/lHbqde5uyHkmEQmbhWQi
         gzEvYjUi198wq2shdVl+NYnidqLtlARhuL3JFWlTkPqCK+kXjoFuhUfI3wdXYpKjeR/y
         AvrGhJKF2TtuMX4MjuTTH54IOyj16SSWwwSDU8XiR7P8JpTzObyVBBzNMm5pVn9i7vy4
         myEXPf0E6MOBUGwCQH0NfvOIhbDCukLi+hHl3oWks9goEeF962Vwf38BdMzNt0Xz7Uh2
         1IUCAZs4Atrj4mnoffhwMiXP8s0HNRrpXO5lgcaD2p4ARfkHZ8JdtHqrEAuvd81cx99n
         RARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hIPfO7ux9DNr6HYEXTRvYHtolE2zfLDOhNyZZg0neiU=;
        b=ndBpO/1C5e71sPMla+AFf3vptmHXtkV7seGstxF1wxHxCtAn6dKArZTr2rv+hWprzv
         YEhC1BekBuck9TscORe1r58iFpvDKqvu1H7jYhoCZdORnPMOaxHK1BpEAzeyp0lYkZuM
         4Rg8hn6g2ZtW05CYNIbLyJcA0SHPmfWJfFEGAF/s8FojGytwPVSX3oAeyLPrSmtPZHyQ
         bgBFVM0gnugufMHglBAilmn9z2GT++tRt+L3repC6I4d+pUuDGycKVCIxx+0bn9gqUuc
         pFYmzlS5S90mVfoAPvBhyXIFLQkAp0GOp4JkZXDZ9XpuG20/Z9CCLwplYFsMIGalBo/Z
         IoSg==
X-Gm-Message-State: AOAM533yTr0MOYs5+abmgRnDm4jY/uRUhTY4TWDFucvcSGhSkOvNjMFD
        wMedhQbH9y5JeKE2pxzosUQ6Tr/9p5sAknIeXEB9kHch
X-Google-Smtp-Source: ABdhPJxS+NqNFjrvVBjxUI6LilnL2HGF9aURL8vCDDdZpShiQWILIkcjBH2JoHLsAvpyGq9STgQ1iO0jJxtZ4UvOZVI=
X-Received: by 2002:a63:a05f:: with SMTP id u31mr11014041pgn.4.1593552244686;
 Tue, 30 Jun 2020 14:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200625075805.363918-1-mans0n@gorani.run> <CAMpxmJXDHX-U-HWR8093orBU1ZxEeWp_r2Xar+k5FMoZ1pS78Q@mail.gmail.com>
 <CAHp75VdNh8nFNqZxSD0g7ADD8GvY+Dmbfg8xc6LW94hw_Brwew@mail.gmail.com> <c7fd2365-0f47-b2c8-4085-020928c79254@gorani.run>
In-Reply-To: <c7fd2365-0f47-b2c8-4085-020928c79254@gorani.run>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Jul 2020 00:23:48 +0300
Message-ID: <CAHp75VcA-kmJHyuZOMs-BDqhQ7FszZti=uHmSs-NCH2F6e_c4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: add GPO driver for PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 7:11 PM Sungbo Eo <mans0n@gorani.run> wrote:
>
> Thanks for all the reviews! I've updated the patch, please have a look.
>
> And I have something to ask.
>
> # echo 1 > gpio408/value
> # cat gpio408/value
> cat: read error: I/O error
> # cat gpio408/direction
> out
> # echo out > gpio408/direction
> # echo in > gpio408/direction
> [   91.006691] gpio-408 (sysfs): gpiod_direction_input: missing get()
> but have direction_input()
> ash: write error: I/O error
>
> I've never dealt with GPO expander before, so this seems a bit odd to me.
> Is it perfectly okay to leave get() and direction_input() unimplemented?

Actually it would be better to return the value you set for output in ->get().


-- 
With Best Regards,
Andy Shevchenko
