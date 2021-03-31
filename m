Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47577350075
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 14:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235532AbhCaMfr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 08:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235573AbhCaMfe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 08:35:34 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2157C061574;
        Wed, 31 Mar 2021 05:35:33 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id t20so7826262plr.13;
        Wed, 31 Mar 2021 05:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vJET4FnQcbYiDwhOI2Ry9rOQiGq9wzy520QdSTnUuYE=;
        b=aHzQqhxEYdRUQohUbyzIXbhDgvyBRNiLNhDzG6ju1AMKJ87yl82VxCU8/dhkQUnbT/
         LDYtwJHu3LxcFnvc9lqClR/F49PEU5+jMShZPlf2DQ5QTKyDOvlnh9MUsUwV8YKm/dT8
         f9SQbdCl5Ut04zZ1iWujstmNISBbfBLxv6AsFFzEaLev6ulPPkSK05KDBgrPw2hKd4r+
         WfAJVKtyiFSdp9QnicjQ2TOYBBN7Zdf9hs7qWOYouua2tjZv1350E71T+uXqs8qSEIyg
         TIJf3aJYMXADPMojD2tvhLhv7NzPPGKL4q5L5osxuPYA0U5KTRMx3HHEi8EDhyKGCdo8
         Wh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vJET4FnQcbYiDwhOI2Ry9rOQiGq9wzy520QdSTnUuYE=;
        b=E8oZYBrQ9XJDd9LmG5cnHxpTJ/v4gpW3NWTgDljWyasJIs9KAVeGeZcc8MWjETtxc2
         HUgl8Aj3bQJj7ef1LbvAukecOPbeGcLzxy7GE3R3VDZ8ICEonIeD8FhP/uaS94WnDJRq
         B30u9cgYDPnr4TDGHw1rfQiQ9Aa3p21aoELX4wUj5x6eXtpVsIPo0NTItyy8IyxoHkey
         MKh9ic1LgfFFBIfeGNRYhoDq/AiYxCRBEmE5yLYZVVGnYBZyAbvIHiRBeH6rbWkUcKgV
         diwQH1fxG4hJug+URHx6gnThM+RdUQzHqUpFYIoQDxlUy16U5xHM1luNlk700McbJm38
         pRBg==
X-Gm-Message-State: AOAM53141ZIfTSx+k5Vuedbnm2m3zj5uYnHygegs8zRcacK8yEb439Tx
        PuVamj8r6Y7JMv9lNX/dVW9poKrEIQtfg2NF9GM=
X-Google-Smtp-Source: ABdhPJwithFTpSCHy81H29JxqQs4P0Q0+x+S4nHlV2ni11Ona6dnqR0Jq3nyB1WY1ne4xuQcO5LDdFf0TzbEMF46MNg=
X-Received: by 2002:a17:902:7883:b029:e7:32bd:6b97 with SMTP id
 q3-20020a1709027883b02900e732bd6b97mr3073111pll.0.1617194133318; Wed, 31 Mar
 2021 05:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com> <f38e80b6b439e4a9cc349a090923207865b3d3ed.1617189926.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <f38e80b6b439e4a9cc349a090923207865b3d3ed.1617189926.git.matthias.schiffer@ew.tq-group.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Mar 2021 15:35:17 +0300
Message-ID: <CAHp75VeCGHUBtfZ7b+m7eA01KukWkL0n01kmv-Q00m9+6FTWQg@mail.gmail.com>
Subject: Re: [PATCH 2/3] mfd: tqmx86: clear GPIO IRQ resource when no IRQ is set
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 31, 2021 at 2:39 PM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> The driver was registering IRQ 0 when no IRQ was set. This leads to
> warnings with newer kernels.
>
> Clear the resource flags, so no resource is registered at all in this
> case.

...

>                 /* Assumes the IRQ resource is first. */
>                 tqmx_gpio_resources[0].start = gpio_irq;
> +       } else {
> +               tqmx_gpio_resources[0].flags = 0;

Please set IORESOURCE_DISABLED flag in the initial structure instead.

>         }


-- 
With Best Regards,
Andy Shevchenko
