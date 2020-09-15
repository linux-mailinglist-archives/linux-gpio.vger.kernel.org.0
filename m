Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BCD26A2F9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 12:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgIOKQL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 06:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbgIOKQJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 06:16:09 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C9EC06174A;
        Tue, 15 Sep 2020 03:16:08 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k15so1633898pfc.12;
        Tue, 15 Sep 2020 03:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2VHtAarqbvrY0I2D+WdAfAQUkIppSCm/26kSoR6hinY=;
        b=GmfeakCJfMitYyFC0eBEP7mPtrrCr/83+/YKfrYZaqSqldRGBnp0isCeTtv4cmJqS/
         cxvcoHFU1VKRchwRjLwehc9FNL/EFjg9BdnvYKdt/AMaEEXGPwbH/pJWtlhiy2B1iWzd
         mBBeHjplV2aXmSdaOO80J94bWzibYhkZ/Ih0U/YExwJE5hyEdMMYNZAiSZo6Y4PYF579
         hw+UV1H9uKnUY9VkYzckzO9nXUsqnF4bM7JtSLMHKLeVFE3wV7KjAOIR3Uf0lcIhvPt3
         OTD02VMxyGcuZABUV9QtFttEyTNNd7BTzepOM+Frk6CQVUonkPFy5vSqcrs274cByQZb
         nMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2VHtAarqbvrY0I2D+WdAfAQUkIppSCm/26kSoR6hinY=;
        b=R+ceKjRcx/0KOTRdPcvBR7XpJQHeY7Ax3sGe87ZyNKWMCpCOBX8DdAm3dOlPBrXkrM
         FSeRqWXWQwm6rdWPiXDGe9jVCRz7jUN/r6WSO4zL3RgPLb4OPYByOBN19+ok9RvK65QD
         5wja+6gFU+4kpvJy9kPapt9B65nJ4GGu0aMt+Evc/25L1I9d6+kCnLCac0FWAnDfpghv
         P1ciFJEOzZO2us0Wd+CCeJSE+ZqUl/SdBdp/GH4qLwXJZzpp34MvGwd2e2LPMJWtd78Y
         hjrh/QqVnav5TGUHMWqd61MpeSxZPd8iUfHfaIWL0N0xpf3V1fC+pP9AQ5IOW7woTwhD
         +Lzw==
X-Gm-Message-State: AOAM532nBc/fy3mrxcN0GVqXoMH1E3uKENtBU7VJY15sILd+4RtOmgrg
        K7DwRtvnri0ziYSQsBwLoUD+jQSN3CVghBblIow=
X-Google-Smtp-Source: ABdhPJwtLcMcR4PVch0nnD+udv60wucsyYsL50o2tmkWm5N9vag31id2mxaouErBOhWpBOdkxTyQFRD1lN9ybdTsQDY=
X-Received: by 2002:aa7:9201:0:b029:13e:d13d:a10c with SMTP id
 1-20020aa792010000b029013ed13da10cmr16615463pfo.40.1600164967923; Tue, 15 Sep
 2020 03:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200909102640.1657622-1-warthog618@gmail.com> <20200909102640.1657622-7-warthog618@gmail.com>
In-Reply-To: <20200909102640.1657622-7-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Sep 2020 13:15:50 +0300
Message-ID: <CAHp75Vc=BtJh=cFuS_9A1nQz9QUsU-84pWByiAw2jPQvokqgwQ@mail.gmail.com>
Subject: Re: [PATCH v8 06/20] gpiolib: add build option for CDEV v1 ABI
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 1:33 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add a build option to allow the removal of the CDEV v1 ABI.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

One nit-pick below.

> Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> This patch is before the v2 implementation, and is non-functional until
> that patch, as some parts of that patch would be written slightly
> differently if removing v1 was not considered.
> Adding this patch after that would necessitate revisiting the v2 changes,
> so this ordering results in two simpler patches.
>
>  drivers/gpio/Kconfig | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index e4debd66d71f..ff9ca836026b 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -82,6 +82,18 @@ config GPIO_CDEV
>
>           If unsure, say Y.
>
> +config GPIO_CDEV_V1
> +       bool "Support GPIO ABI Version 1"
> +       default y
> +       depends on GPIO_CDEV
> +       help
> +         Say Y here to support version 1 of the GPIO CDEV ABI.
> +

> +         This ABI version is deprecated and will be removed in the future.
> +         Please use the latest ABI for new developments.

"will be removed" is not what is going to happen in at least the next
few years. I think something less strong would be better.

> +
> +         If unsure, say Y.
> +
>  config GPIO_GENERIC
>         depends on HAS_IOMEM # Only for IOMEM drivers
>         tristate
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
