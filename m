Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBD04675D0
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 11:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238065AbhLCLCG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 06:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237898AbhLCLCF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 06:02:05 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E05C06173E
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 02:58:41 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id w1so9870491edc.6
        for <linux-gpio@vger.kernel.org>; Fri, 03 Dec 2021 02:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Fde438fw/fGb3eCGVcOQ7aUDINcA8w+tHWjm8sKlbQ=;
        b=nEwvjQ7RceS3T1G+9DX1RlkGl+44W89mL5EOwytC+1eHj3zSDg0Pvke4xdW9BDFEOa
         9niUcdtcnTpnChz+L1+41iV1Sz8cOk9ioz1Q0fb/s3UtbiCWew6imFLdV843tisYcXys
         E9Wcx4rgfr5k/uyWoamfg3PLGKPWkZ8hxz3pqnZchYR8CySM5Sad2Ro2KuBnMe9Ot2Kv
         H1EhLNAxUovBTLKM2dyV/5EZ2oxAutjvHSkcVae7UlP4yzMJKjBSDG+hKvsqG/MNyPQv
         kf3JQrnjzqgi1bKc1HLeR/Ede4wQxtxLSTrQJKqDUzbZZjK+aQhbrQW4i0r6l3m157Kb
         pK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Fde438fw/fGb3eCGVcOQ7aUDINcA8w+tHWjm8sKlbQ=;
        b=zlyckRt1GPoRHUGeTdsFDdbyiUA0g1EB4dJFH6JjAeqqEzB8va5apxJP3boLi3AcrH
         abDLwaRlsWryL9o6ihgob44EAGCepO4gGydjAQiyxs6MIzvp8bgfSH2beiLo4fCZsaI6
         mzScX+hgG59PERgdiW8h2601aF5DDCJY6G7iRvL54zzfUm5kVbOi4ZeBFGJsgRePbsn9
         X/MyAziemRtkS78Qpf7xfiO9CZC9AyFOlIJvqimoeIl4ZaEHrrrf/NaSPjUcViapPf+H
         DVdTKMZzpa6KJ6+jz5mkhPjiq1vNOJYREc3wjpYCw7PkVRAP+0YO+Pocvo5oTgBW3fwd
         rdTA==
X-Gm-Message-State: AOAM5336U5euAl1euZ5MljBowCaSrljkX5+RN7ZFm13gE+UIWEv3NBvZ
        DcbYn+b8qlgxvKY6er/advPFEmuZlIDZYfUfhJg3ww==
X-Google-Smtp-Source: ABdhPJwTDqXBH2aZXFyPhy20joASP/kUxOXBbrk1UuhznUj/Gz2ZhGQu2ErT0WoyxX15vJT1cWWSf5+qBTkKrR+g6uE=
X-Received: by 2002:aa7:cb45:: with SMTP id w5mr25823308edt.405.1638529120215;
 Fri, 03 Dec 2021 02:58:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637917008.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1637917008.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Dec 2021 11:58:29 +0100
Message-ID: <CAMRc=MczSGs_FJ-ezLt9R6nhYo9RNoOrsvz22LJ6c9mDumggNg@mail.gmail.com>
Subject: Re: [PATCH 0/2] libgpiod: Minor fixups for 2.0 bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 26, 2021 at 10:07 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hi Bartosz,
>
> This patchset contain minor fixes for the libgpiod 2.0 helpers that I found
> during my rust bindings work with it.
>
> It is based on next/post-libgpiod-2.0 branch.
>
> --
> Viresh
>
> Viresh Kumar (2):
>   libgpiod: Fix ioctl number for gpiod_line_request_reconfigure_lines()
>   libgpiod: Remove dummy declaration gpiod_line_config_get_event_clock()
>
>  include/gpiod.h    | 12 ------------
>  lib/line-request.c |  2 +-
>  2 files changed, 1 insertion(+), 13 deletions(-)
>
> --
> 2.31.1.272.g89b43f80a514
>

Thanks a lot! Are you fine with me squashing this with the big patch
like I did with similar fixes from Ben before? The patch is
technically still under development (this kind of bugs will be
uncovered a lot once I start writing tests) and there's no reason to
merge it into master with bugs. I would keep your signed-off-by of
course.

Bart
