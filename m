Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1900D37BC1A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 May 2021 13:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhELL5G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 07:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhELL5F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 May 2021 07:57:05 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6146AC06174A
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 04:55:56 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id r8so30369682ybb.9
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aNPb1/57+5ny+pvaCXDmUs3FXsI3utW5iRWUWfHbabI=;
        b=FJOxExQtPoHD1RHrcjDEaob9dDt5Wqym1gYzphjMrHEqE7740cdgfWxvY6SuIznd5U
         wR5gtt6cBZLJEz+HFUJjc2Yz/Oqk21pcVTj+LAw7p3BhiX4sCYMvMCOadI9TkbHOGlxM
         YbT+zSSe/ADP4ZnULjhsLHvDLLLpnCKI9RUbtKoP9Jy9jvvhR56GKL+fjc7+4nEFNuaS
         gzEQ176lPHqGBITWds8rFjX1VPANHo4Xkn6fSsM5k4DaOFnpZvNieqdCo67W19wdX2D2
         a9HhQTiAq+Q0z/dZB91FbR3b93UwqaJEi7/FMJ7yIBkejWfK6K+lImMJ5IE9VaRrskcG
         DcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aNPb1/57+5ny+pvaCXDmUs3FXsI3utW5iRWUWfHbabI=;
        b=P/T3HR6cw3e6/iftriYR+g8zWyUss7D7hFXWK1XXABwelTgcn3WxDAVWdhO/i+sEQ8
         CyX0fyk8R+wOX61bfcTm8IrHxgFOgeLQDzeFXFwNznqFz2N/T6X0ohBwVbzyJ3eD4YY2
         q9/5ZMmeQ7UMZvB8l4gZluqU+p7bpMJk8qs7N+wdhuU5rKZGM6Ew8wU7qwnVGyd8JIjt
         4qU+VixU+nl+/ax2haTfcFCIM8cJHWqXirIkdzC+ukLUk30Ba9YJMoGxoYrbiGO+gLzE
         QPDvIdLt4SIf38ClRcdR9+H5D1/GbpRQTJabOP+LeX4iJb4SdkSANbcc0IT9EsSzkjoj
         DBdA==
X-Gm-Message-State: AOAM530BCsbEO5xafQ/huH4bvUQZsEdR7mI14FEskOIHCP9Kw8nnyYvd
        o8fSJW8eJMdWTun/D2gXn+eRP50x09nzPvYXMHK3KQ==
X-Google-Smtp-Source: ABdhPJwZcRGvQGKt99glxvdWCFBLUljr0pyP1dW5k8kK5RnI0ZS+M4PeURiB/d1gE4Dtw3oxk/386eXqpaAuWByMSqY=
X-Received: by 2002:a25:238c:: with SMTP id j134mr18215223ybj.302.1620820555592;
 Wed, 12 May 2021 04:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210510194633.11943-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210510194633.11943-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 12 May 2021 13:55:44 +0200
Message-ID: <CAMpxmJU0vreXf-5bEwk07oDdvOLP4rU507_Q-W3=CDQ43s+W5g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] gpio: xilinx: convert to use bitmap API
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 10, 2021 at 9:46 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The change in the series has been inspired by [1], which, I think,
> can be improved. Here I present the view how it may be done.
>
> [1]: cover.1617380819.git.syednwaris@gmail.com
>
> In v2:
> - folding followup fix into patch 4
> - added Tested-by (Srinivas)
> - added Ack (Yuri)
> - added Rb (Michal)
> - rebased on top of v5.13-rc1
>
> Andy Shevchenko (5):
>   bitmap: Make bitmap_remap() and bitmap_bitremap() available to users
>   gpio: xilinx: Correct kernel doc for xgpio_probe()
>   gpio: xilinx: Introduce xgpio_read_chan() / xgpio_write_chan()
>   gpio: xilinx: Switch to use bitmap APIs
>   gpio: xilinx: No need to disable IRQs in the handler
>
>  drivers/gpio/gpio-xilinx.c | 385 +++++++++++++++++++------------------
>  lib/bitmap.c               |   5 +-
>  2 files changed, 198 insertions(+), 192 deletions(-)
>
> --
> 2.30.2
>

Series applied, thanks a lot!

Bartosz
