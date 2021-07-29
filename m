Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214E53DA689
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 16:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236279AbhG2Oeg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 10:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237204AbhG2Oef (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 10:34:35 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95AFFC061765
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jul 2021 07:34:31 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id yk17so3383927ejb.11
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jul 2021 07:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ry4/jQNwvPHr7B2v77EeFXLJsRN9peXk17IOpr0JDR8=;
        b=YQiBN0d6zq2c8gwOkjklDZwL1NWEA5MA9x93/5qOzg/AJq2pYmb808ueV6c6ORqwvm
         VdIyH20xY0V1AhpD3DBKcfnS3U2bo08ZVAld2aXEVC4UPKgslOO7pKmR5ysyxuiM+yO0
         6ikwHeFW70ASv5q+Si2IsYRcWo+YJY/F2H4A0pMsqN3wMb+JiSddfvgl6ltIT74SnfZ2
         uBcZVE51Jj0gUocxG/S+k0zx+aeUibIMIKUlpsYq2qFK/Jddx+gvdscIDhT4zveSQl4F
         MXdeOwX/tYPNhz1llTa91Ymc+uIPyVWEdZzPT88DWIJ5L3LeeeeCyaZHQbJ6rRmMEbGY
         njig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ry4/jQNwvPHr7B2v77EeFXLJsRN9peXk17IOpr0JDR8=;
        b=LQ4ZKX5gGWTKYFwXPJ7qab1UQ/UhFYXC+05q5S3v+Z+UUtM6hJC+WRLdczWRsrws0D
         yBXNXT0U+qrX9S/HZAH9QihE7PzvLi38y/UhT0Zy9EvmaQ7QS+M00C3rVX+VaRL3PINC
         +6vp6lq/m80SzeCBptWqJAFb1CAZq3DrHix3sRwk0opsTuD8ilZMQzEO/jQC+iSBDebv
         lFpuux1YO8q2Fr7CgqcFGS8E/KHfUR4MFxheUYsZR0hJCeaf5cDcK/SByKi0MXYPQdvD
         HGSZ37TG+jz716f80WoG1lZ91JnkGnlYMb1T7/UmBnEr5c+lVtUoq51M7k7FgJ/AD/Wt
         Appw==
X-Gm-Message-State: AOAM531r5COazu19ErMEDEKDCwv6TXV8sXfNborEidgAnpI0k9DW/W2N
        a2MEIAklIO0UEZhoGOPrQvqH7zU5R5kVUWr8nR+3bA==
X-Google-Smtp-Source: ABdhPJwGWvrgdLdEmBt05Ezyp+ZEsBw/JcYH7MEQToBAiMzS7CPIHXG6ljshKRszboR+1O3BG+GIr+7dopS4TpeTMV0=
X-Received: by 2002:a17:906:e241:: with SMTP id gq1mr5198528ejb.87.1627569270180;
 Thu, 29 Jul 2021 07:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210728131327.GA14442@cephalopod>
In-Reply-To: <20210728131327.GA14442@cephalopod>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 29 Jul 2021 16:34:19 +0200
Message-ID: <CAMRc=Mcmvb24R9RUJk-0QgP+17rMw2Xd9jMff47uUUcOdeA-Lw@mail.gmail.com>
Subject: Re: [PATCH libgpiod-v2] gpiomon: Fix format specifier for uint64_t
To:     Ben Hutchings <ben.hutchings@mind.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 28, 2021 at 3:13 PM Ben Hutchings <ben.hutchings@mind.be> wrote:
>
> uint64_t might be defined as either unsigned long or unsigned long
> long, depending on the architecture.  Values of this type should be
> formatted with the specifier PRIu64 rather than "ld".
>
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  tools/gpiomon.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index 2b5966c..df86a46 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -4,6 +4,7 @@
>  #include <errno.h>
>  #include <getopt.h>
>  #include <gpiod.h>
> +#include <inttypes.h>
>  #include <limits.h>
>  #include <poll.h>
>  #include <signal.h>
> @@ -95,10 +96,10 @@ static void event_print_custom(unsigned int offset, uint64_t timeout,
>                                 fputc('0', stdout);
>                         break;
>                 case 's':
> -                       printf("%ld", timeout / 1000000000);
> +                       printf("%"PRIu64, timeout / 1000000000);
>                         break;
>                 case 'n':
> -                       printf("%ld", timeout % 1000000000);
> +                       printf("%"PRIu64, timeout % 1000000000);
>                         break;
>                 case '%':
>                         fputc('%', stdout);
> @@ -129,7 +130,7 @@ static void event_print_human_readable(unsigned int offset,
>         else
>                 evname = "FALLING EDGE";
>
> -       printf("event: %s offset: %u timestamp: [%8ld.%09ld]\n",
> +       printf("event: %s offset: %u timestamp: [%8"PRIu64".%09"PRIu64"]\n",
>                evname, offset, timeout / 1000000000, timeout % 1000000000);
>  }
>
> --
> 2.20.1

Hi Ben!

This and the other patches are great, thanks!

I assume they are rebases on top of the next/libpiod-2.0 branch? I
want the git repo for libgpiod to remain bisectable and intend to
switch to the new API in one big patch including the core API, C++ and
Python bindings as well as test suites. I will keep your patches in my
queue and apply them once the patch is in master - unless you don't
care that much about authorship of the patches in which case I can
squash them into the big patch and credit you in the commit message.
Let me know what works best for you.

Bart
