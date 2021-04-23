Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DD5369B6F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 22:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbhDWUmR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 16:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232636AbhDWUmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Apr 2021 16:42:16 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4FFC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 23 Apr 2021 13:41:38 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id p126so3469270yba.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Apr 2021 13:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=auJU3BRtz8kLnSrkdZgLf2c5wwbEssldt+ZbJ4Y83DY=;
        b=V4e94mJarnBEEIzbTmeknPQb4WEQU9nbwxE46iVepOvs7S5EBupaX0AJOIo4y8DXCa
         S5pCjGa6dmpzFPoP5FFGiBM38e8RAiMsmx3gOwDetea2Vk0yEDkkHoN0KUPFrqG8OYfp
         fmOUPAuQxpin12R7ajv5hzfSeCE4STpYf+/Edsnxn19P0zYHn6eQwGsGUtcW/MlIYCcQ
         j2SvC2tgwe/KEA2996W5fxcE/FAcVCiB7rLxT4yED3pOZBb410NE1clT60yLSLfasaf1
         4deSGCXZ+cFLmjNhY86mTRESl3jG9CcYOjDp72yt9XIuq4GRxLyeKZacLNgsZ34No8LG
         Pkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=auJU3BRtz8kLnSrkdZgLf2c5wwbEssldt+ZbJ4Y83DY=;
        b=riiAIJleAn9RExu3gMd86e/fkqhHeyqyojy3/LWWLHkdzmaTT1srn9UQZqxT6JV1VA
         LuY4D1AvX16vmYRu8xMIayxR1aUzzH/IzH8Bv/f1RAuEVRGmKZDkThBby/Un30TfA5lY
         2cJGdt9mTGquaM99d7b3+B2TRmJq5+QAXCPii4qatRgBpFaoQHeFqNA3mLziNvkPA9ZR
         izjM1IpF5n8Rf8EpyHxrelkQ0u62A1OlTu3DQf/HdyNrJVoyqklxnbjDp1EeUipQpx0V
         nCqvOBoMPdB47l3FQ1ZmZ0mz89WqFwpaSxTRg2m+yRgXXkO5BPhPNuKks7BjLmIyFuwb
         zafg==
X-Gm-Message-State: AOAM533pB8QcjD0RHB3DmlRQBSpqlML1WC4Jmm6EcyspIKCfE2m/j9fp
        C6eqWedA/V/yH62KhtStoj2PgJJ0Wt1O6Prg8wRq5A==
X-Google-Smtp-Source: ABdhPJyBfGhsBB9FRsWEcCk5aBWchkNLQ3kIla3VhXZl/IDTn5cdSQFvFWFK5sRrGTzUs/EI8DxxZ65rJmeIVOoyZ7Q=
X-Received: by 2002:a25:1905:: with SMTP id 5mr8390620ybz.302.1619210497639;
 Fri, 23 Apr 2021 13:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 23 Apr 2021 22:41:26 +0200
Message-ID: <CAMpxmJU+K6C_xbQPT=9QKtLLTnajJQbgJH0A2QqbGjCV+b9Z_g@mail.gmail.com>
Subject: Re: [RFT, PATCH v1 0/5] gpio: xilinx: convert to use bitmap API
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 8, 2021 at 4:55 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The change in the series has been inspired by [1], which, I think,
> can be improved. Here I present the view how it can be done.
>
> The series marked as RFT since I have no hardware and I perform
> compile test only.
>
> The patches 1 and 2 can be (independently) applied for v5.13, but I'm not in
> hurry with the series, due to above (lack of real testing). So I'm flexible in
> a way how it can be proceed.
>
> [1]: cover.1617380819.git.syednwaris@gmail.com
>
> Andy Shevchenko (5):
>   bitmap: Make bitmap_remap() and bitmap_bitremap() available to users
>   gpio: xilinx: Correct kernel doc for xgpio_probe()
>   gpio: xilinx: Introduce xgpio_read_chan() / xgpio_write_chan()
>   gpio: xilinx: Switch to use bitmap APIs
>   gpio: xilinx: No need to disable IRQs in the handler
>
>  drivers/gpio/gpio-xilinx.c | 377 ++++++++++++++++++-------------------
>  lib/bitmap.c               |   5 +-
>  2 files changed, 190 insertions(+), 192 deletions(-)
>
> --
> 2.30.2
>

I usually trust Andy with his work but is there any chance we can get
a Tested-by before the merge window?

Bart
