Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CE8279FCD
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 11:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgI0JAV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 05:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgI0JAU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 05:00:20 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF39C0613CE;
        Sun, 27 Sep 2020 02:00:20 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x22so6676571pfo.12;
        Sun, 27 Sep 2020 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CsSe/NAg5hh5twY2laF9QNcOoA0xUfMrAX8MspdptgI=;
        b=hkJ/SodCjib/LnmfcsGJgIp1rS5IstgJRpuMC4FofLP21ppfFMtHAQwo5mLBnAacmK
         hceaeaDS0aHMfFgsO9saMdH4W5WVPo0Cjw1BlzZrPRkuTLCBXJVYup75/aCH6wsRkAYe
         Gi1NG3gfhFnKPcjpuvgq5JKil/P42YbZ3rarQTXeM/Y4GzjDU1SOLiex3Bh1UsayBuCV
         O54m2DrnOKnt+AyzbCnsML3qgXD8qp+T9fznUVEGoqjVW1h4RZ+f3l/1OWPPXI/g5pt6
         9BVzqtm04SWJbPvSToG4KyLgQnxwFKmruR+3O+mnCYfnE4S7gVjKA5qglji064uVJLIR
         mZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CsSe/NAg5hh5twY2laF9QNcOoA0xUfMrAX8MspdptgI=;
        b=AFkteUSJVxsql0L9uWcEYKeEWUh3qMfOPFATooTTujNpexuORcEobxfMEN1+gYQDai
         tscHkApB+8T8iFielmqGEuQC54swHyJv0gMEbViY45sqVL7QErNMgq753K4Y9aVUJ0cP
         9zyGz/SBTD5wDAq5q2I6hqwvvGgsuYSCGA9OrvSbfBn3oHf9bnKAYjCdumsOkkZW/X1L
         FDSBL9Sxo6zHkjtEqpJ1t2g2YicrtCzgS/vKrHQ2t3nM23gjoSJJMYe9ChXr5uZncGvF
         qUaI3dHm/WW3n0WHVrnPqkXgSuhb062jSZeyAV/h9g7761/1G4qJ1v2hqsXvCCWyywnW
         9oWg==
X-Gm-Message-State: AOAM532zRcUilH5m75X8ia0fK+b6Us+gAnPK592U/mgcqcyRYXKJw3SA
        6Iy4mzwydU8W3pz8n7DskAKuzsHJx0W+G60KHCA=
X-Google-Smtp-Source: ABdhPJykEzbeQjhtVBmXhqakdNKvpN3HRxwMqFwx0lMaBMdFO9lkcXYfbdHJb9jInpHFQdS+vL8dYWb6bfuI4lNhCW0=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr5078161pgj.74.1601197220274;
 Sun, 27 Sep 2020 02:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-8-warthog618@gmail.com>
 <CAHp75VdQUbDnjQEr5X5q6WdU6rD=uBNznNn5=Vy=pvdwVj_hEA@mail.gmail.com>
 <20200924080921.GE17562@sol> <CAHp75VehvUTt19sBxgPTZszUmxDGZwqGAV7bgW5jVM8Mf63UJA@mail.gmail.com>
 <20200926091631.GA89482@sol>
In-Reply-To: <20200926091631.GA89482@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 27 Sep 2020 12:00:04 +0300
Message-ID: <CAHp75VdFG1DBSjD9DwBXvsmDCN5eN_unKiZkVBob3dSTyZzSiw@mail.gmail.com>
Subject: Re: [PATCH v9 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 26, 2020 at 12:16 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Fri, Sep 25, 2020 at 01:06:02PM +0300, Andy Shevchenko wrote:

...

> Hmmm, there is more to it than I thought - gpiod_request_commit(),
> which this code eventually calls, interprets a null label (not an
> empty string) as indicating that the user has not set the label, in
> which case it will set the desc label to "?". So userspace cannot
> force the desc label to be empty.
>
> We need to keep that label as null in that case to maintain that
> behaviour.
>
> I will add a comment there though.
>
> Hmmm, having said that, does this form work for you:
>
>         if (ulr.consumer[0] != '\0') {
>                 /* label is only initialized if consumer is set */
>                 lr->label = kstrndup(ulr.consumer, sizeof(ulr.consumer) - 1, GFP_KERNEL);
>         ...
>
> It actually compiles slightly larger, I guess due to the extra parameter
> in the kstrndup() call, but may be slightly more readable??

I really don't want to delay this series, choose what you think is
better and we may amend it later.

-- 
With Best Regards,
Andy Shevchenko
