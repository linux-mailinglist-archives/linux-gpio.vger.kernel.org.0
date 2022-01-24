Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED9E497A29
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 09:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236180AbiAXIWF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 03:22:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236165AbiAXIWF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jan 2022 03:22:05 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF24DC06173B
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 00:22:04 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id m4so19182190ejb.9
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 00:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8FAFB33t+2Qkjx9X9nv00JP5JosdgwKF5FoC1J64pQA=;
        b=1iQguK17dNmGjo07g3VoPTorMbJ1BquDbB0ueWBKR9ayVr17p44Zz9ppmDCiQ9hjBu
         96UU7fD6MOm5d78THBXufjnVyeGn5h9oNAHYa/v8UlSZK1f+gRTS+CfdUkIYaKqM2YUP
         Iyolq3fyk0wFTpd9devm7YB+8T7XBJze773uGThiPYY2ob1XWEkifiBeUYSk1Fro0Yp5
         ZO3Nu8TvJPGoUe9d51sDybVLV1LLaZhtjXgzGxJO45G6MMXADwEHbjTzAsUlcbCyXf2i
         kjsGXj4cqOcnqyOj7bozuLyVyqyIVF5Z0v/OPOX0Nx3nuyem1iwJ2UR8JeQKTqRGTvqb
         oQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8FAFB33t+2Qkjx9X9nv00JP5JosdgwKF5FoC1J64pQA=;
        b=mg8jSKDaZks6YYlHyNDHLmO7tQFkOsztLwC092tLVIWNj4oxFIzx1PrZSbWzgIBuwE
         rNLc3RSH1oMqT57tkE6WQc+GgHo9ltYPUU7m6It/lqPvGLIRKaQt5f5ZO+QmnELZPtGJ
         5vTZYr5GVsfZIkmqgcc/V7pbHWYmyI8Icom/G5rKtoTz0YzfSATvKamITC+jOj2iC0mG
         C2Q4DI/q4kGGC5L+i46RZLR2ASp96D4jlxKhyd2zluKUGKbqLufSfTQlv/vpezDYUsJ4
         U1T1wcorI/eVf4zMHvzTQCPCY6FusatCHl6+mlSx8f4P1/9Ps+a0zRjW/1Dbzyw17PIX
         tiEA==
X-Gm-Message-State: AOAM532HLulx/X+ZgDb0DDuilz01DEL6qA4/lrFAxPwZyKQ0GuYUxPD6
        RvCA+TF41Uygk6trnseZZMsdFjq8O4Crcd5hqEfXQw==
X-Google-Smtp-Source: ABdhPJwH5p6BLfavo5gGZUAy5CnEAgK66nA/Fqz4XwUHUaB0YjSnGdGqeRWPP/fN9YO9bjScYdUWk/5bxeswGFIP21s=
X-Received: by 2002:a17:907:3f93:: with SMTP id hr19mr11903724ejc.697.1643012523450;
 Mon, 24 Jan 2022 00:22:03 -0800 (PST)
MIME-Version: 1.0
References: <20220123073536.12193-1-rdunlap@infradead.org>
In-Reply-To: <20220123073536.12193-1-rdunlap@infradead.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 24 Jan 2022 09:21:52 +0100
Message-ID: <CAMRc=MeEeryzxWHBKE6ntjGYjo7FXWi9efovMPHY0bkJ9-Bb1g@mail.gmail.com>
Subject: Re: [PATCH ?next?] gpio: sim: add doc file to index file
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 23, 2022 at 8:35 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Include the gpio-sim.rst file in the GPIO index (toc/table of contents).
>
> Quietens this doc build warning:
>
> Documentation/admin-guide/gpio/gpio-sim.rst: WARNING: document isn't included in any toctree
>
> Fixes: b48f6b466e44 ("gpio: sim: new testing module")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  Documentation/admin-guide/gpio/index.rst |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20220121.orig/Documentation/admin-guide/gpio/index.rst
> +++ linux-next-20220121/Documentation/admin-guide/gpio/index.rst
> @@ -10,6 +10,7 @@ gpio
>      gpio-aggregator
>      sysfs
>      gpio-mockup
> +    gpio-sim
>
>  .. only::  subproject and html
>

Applied, thanks!

Bart
