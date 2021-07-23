Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8692A3D3827
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 11:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhGWJRE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 05:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbhGWJRE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 05:17:04 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE09C061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 02:57:36 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id d18so1151774lfb.6
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1bbyf9wEbZ38VDjiofzmlZm9MieG09qKdTHuQhixjL4=;
        b=Vd49lfeYHO7m8XFZBEcLvBP7vdwYvtGHQ0mTtY12Lafze1aKNSrYjq+4UxV9IEgKTg
         6dvGLMIsFwKXRJN8nUJgbqPzBC2rGlUxx/ta66Tes7KL1y23WsmQpST7Thz+FcRMtOgl
         wpkcWb614X7JXBglHNWwQwuSZMYIxBP4rJT9cU283px3ORyh9oLT+eHGeIvEO9IblTiM
         Nt4EGcEtV+J0e8jAr6WYnyGHMtFZ9aShHurpKEDB3/YmRtxQssxRDiityIR37tYDQsoP
         vnYrEfUvEkfWpKOsBXyVgEYm6qKv+vXmYbjIBYU2ZBpTB9IEfEheF6Ic9QCifSKH/dZL
         kKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1bbyf9wEbZ38VDjiofzmlZm9MieG09qKdTHuQhixjL4=;
        b=U/pwVc5oegn00QnxWge1kQRsxGZW8VhzZuWxui/FzVoWJxSH+3VcZW/pSf4zDUBXhy
         L075rL3b9h04/sAKjbCDbDJUomAVXWqmbLc0w3C2RVgZf+2A7R3SprZKKyur3STbg4IQ
         4ebAvPjCCpOLX73izOqzqNI/A2OmZ3297vD1cpn1IzJ5L+F3t82Z0ygb/tsb8K+Ya/s6
         Od/jJKcUb4sYEaqDrMmbNbaC0Rh7xN5Fs/Jdrwk82nGuZsZtgmz9nc0x1/NYxeWLtDK1
         93PE1w71O0iOm9gUzQzn15WjCNNSK1sq0pKCS/LW4eeIRwIpZCJ0TRsbieEb8gW9kip6
         SYcg==
X-Gm-Message-State: AOAM532+4XRmrGQ9hNuCRoPeIwPhwRcVAQGGgjeIQbVDK+3HDPODVWM1
        mN8d0zeDVtqvGtMRMgt8zJdFdmOIGso53WJnyAtz0w==
X-Google-Smtp-Source: ABdhPJzzn9llVraGZFX3Sur65HKKdYLq6gDhly6QMZqF+AQYyUowNRhBbb8Fwus2a0a0L9IdKACbNp5HfcMMz4FIdes=
X-Received: by 2002:a05:6512:3f1f:: with SMTP id y31mr2585008lfa.29.1627034255015;
 Fri, 23 Jul 2021 02:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com> <20210712100317.23298-6-steven_lee@aspeedtech.com>
In-Reply-To: <20210712100317.23298-6-steven_lee@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 11:57:24 +0200
Message-ID: <CACRpkdbSEXd4bfhEi2UfHvjrUzzibqNBCfdcYfcWcknSgndyYQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/9] gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 12, 2021 at 12:04 PM Steven Lee <steven_lee@aspeedtech.com> wrote:

> The maximum number of gpio pins of SoC is hardcoded as 80 and the gpio pin
> count mask for GPIO Configuration register is hardcode as GENMASK(9,6).
> However, AST2600 has 2 sgpio master interfaces, one of them supports up
> to 128 gpio pins and pin count mask of GPIO Configuration Register is 5
> bits.
>
> The patch adds ast2600 compatibles, removes MAX_NR_HW_SGPIO and
> corresponding design to make the gpio input/output pin base are determined
> by ngpios.
> The patch also removed hardcoded pin mask and adds ast2400, ast2500,
> ast2600 platform data that include gpio pin count mask for GPIO
> Configuration Register.
>
> The original pin order is as follows:
> (suppose MAX_NR_HW_SGPIO is 80 and ngpios is 10 as well)
> Input:
> 0 1 2 3 ... 9
> Output:
> 80 81 82 ... 89
>
> The new pin order is as follows:
> Input:
> 0 2 4 6 ... 18
> Output:
> 1 3 5 7 ... 19
>
> SGPIO pin id and input/output pin mapping is as follows:
> SGPIO0(0,1), SGPIO1(2,3), ..., SGPIO79(158,159)
>
> For example:
> Access SGPIO5(10,11)
> Get SGPIO pin 5 (suppose sgpio chip id is 2)
> gpioget 2 10
>
> Set SGPIO pin 5 (suppose sgpio chip id is 2)
> gpioset 2 11=1
> gpioset 2 11=0
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Nice use of match data. This is exactly how it shall be done.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
