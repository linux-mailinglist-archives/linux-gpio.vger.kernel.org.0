Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAAC6389EC7
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 09:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhETHVJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 03:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhETHVI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 03:21:08 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D9EDC061574
        for <linux-gpio@vger.kernel.org>; Thu, 20 May 2021 00:19:47 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g7so6006448edm.4
        for <linux-gpio@vger.kernel.org>; Thu, 20 May 2021 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ld4LUTFYo2kr+7BQTznax6DPSkCRpJVFEAOgdzNq+NY=;
        b=ITpsytPY+a9U1RNeX3CuHUNe86iU9WyxteT46JXigXCpaoFafAsxUUDAiFFGy84Z9N
         mHLoiVQpmdqZ8ot8v0oreyvKOxJWX2h16LXdrigt3OAi4Nchx3nDtRuD0oVucayH/uN2
         MMJIrJBLCPDifYFrnwb/eJf9n/FbdKn4L8vSxKZ/FkWjsWMzAOp5YwVC6N7N3Gwz2A3Y
         tTztPrMeB00qb/zDULsQov4zwAZOLqakq00qAGfcJ5zQSMsyfLoVkeJ2A9tXiy6OQAtt
         jc9vMbsLfFs1/AIb5aeElexY8w3O6hZ7R7raxEQ7CG3sckiDVaVIbepXCCdkcsgOK+Wb
         5cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ld4LUTFYo2kr+7BQTznax6DPSkCRpJVFEAOgdzNq+NY=;
        b=Bu9bvY0hWKicGIz0EYnz327p+kqOOp0WtCQiEQWLuxVV+axNPoyyI6NvVrI8WU7cjp
         TIssrV8Z+O31syfMFia/mbI7vkpzcHzBzElzdRDu4WhELlcUoCTrvy1HffWeRgO6ca8R
         2YUn1C5wXSICGMlmhj80IhLSkXv1OrldLro/ItsIlWdEsd73pZy4Rp2mwAB8EzZsEZdu
         89hNv8apTDpeFl8Dzosbt99VqDje0RBtgL3q6VFaQqfXaG/zEKm4KamYp7qU2lYsgO7W
         EsG+BiO4+wwssaEDLCyIJZZuBx0c76/hrX0OkAGWHrddeGkh6tEUs01h/DRTCskdVWnf
         ryRA==
X-Gm-Message-State: AOAM530fNNYxON2cigfyOyG6QsOQsw82IkkBf8KgBLSxRK70J6pGYfBd
        voKkNWCBfncSvPizfn2dLNwTQ3OQM139woxbHmAkIYj0GZM=
X-Google-Smtp-Source: ABdhPJx7gcEcjTLc5GKUgx/BYavFjF0as1/6nB4TlaQcmuW1+hFEPTxGtlDJ/NgV6u0mFK2TnYhdimiH4ODI3OuK+rc=
X-Received: by 2002:aa7:da0e:: with SMTP id r14mr3406472eds.119.1621495186025;
 Thu, 20 May 2021 00:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <b2cb3a3c-8e20-f733-9898-f8ba21b52f7d@zago.net>
In-Reply-To: <b2cb3a3c-8e20-f733-9898-f8ba21b52f7d@zago.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 May 2021 09:19:35 +0200
Message-ID: <CAMRc=Me84NvAohhzJO0WafvXRyDy9xy47KKB_m8uwZHRe9F+8A@mail.gmail.com>
Subject: Re: [libgpiod] segfaults in gpiodetect and gpioinfo
To:     Frank Zago <frank@zago.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 4:59 AM Frank Zago <frank@zago.net> wrote:
>
> Hello,
>
> If a user doesn't have permission, both gpiodetect and gpioinfo
> will segfault when run.
>
> $ ./gpiodetect
> gpiochip0 Permission denied
> zsh: segmentation fault (core dumped)  ./gpiodetect
>
> The problem is there:
>                         if (!chip) {
>                                 if (errno == EACCES)
>                                         printf("%s Permission denied\n",
>                                                entries[i]->d_name);
>                                 else
>                                         die_perror("unable to open %s",
>                                                    entries[i]->d_name);
>                         }
>
> chip is NULL, but is later dereferenced.
>
> I'm not submitting a fix as there are 2 possibilities that I can see,
> and I don't know which one would be best:
>
>   - add a continue after the die_perror line
>   - replace the printf above with die_perror()
>
> Regards,
>   Frank.

Hi Frank!

Thanks for the report. This only happens in the master branch which
currently undergoes a huge API overhaul. In the API v2 patch I sent
this problem is fixed.

Bartosz
