Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4F4183227
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 14:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbgCLNzd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 09:55:33 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:42494 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbgCLNzd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 09:55:33 -0400
Received: by mail-vk1-f194.google.com with SMTP id e20so1576934vke.9
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 06:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f3uuC3dwn0tC5WDh43z+Qz3cNZTanvUjHY5K/ioZRrE=;
        b=KVkVoA2k473yz0FJ1dnZvdkbqNXVgnmOKYeMLASFd+4bSsxq5NXs1+7o8r3p9WtTjE
         dkXtgcZAcltgvd/hSXf0jyAfcWOy4O+uFY79LpGpQSK2nqebK3t+BwbvklghCJutN99P
         6yO7hRXTMpLRdUJkZn+ZahduFDqpulDoa0xLbWnv67CuJk4DY5WfjjnA5zeDuRcrIUIe
         iLUC1jmVqd0X3FMCG9O9mIAzG/HvJsm4zjcDumzRlBmQvfodAky3Pn/LEKNXs8yZRg9l
         jC0lZMI+kCP/Vc3flcV3ewrQXXxRtcrWQy9zY7bV/OZTmsXn0q+se6I2okHonk1GL4Vi
         DWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f3uuC3dwn0tC5WDh43z+Qz3cNZTanvUjHY5K/ioZRrE=;
        b=M9sHRosazuDRlC4F0X4qPr4ZM5bInw+/sRDlKrHrkbNUBTk43qNGWR1YT44SGVspe1
         2rVrsAs1L5Ec9SJ8aocBXak12xpSrex1e7oNXf8C3ZLZI21rUUBBALurPC+YJ0NrIWKL
         n403RRQoD0uAVUvx8GPI3phw0PNqTGQXTVVfoobCTpH8cl+OJTc3a2Nm0MceEGXVv20/
         q3ly05gkzstYH4/l7Sudf0FNXwxOtx9Sul7IbV2+R9rsdIh87CkbYbS0NXrMB6XxvGGd
         vk/5wHRMw+aZ9aNts1NzZKX4QLwVSEyFgcoOvjK1yFmP6qKGcFvvYr2VgXbtagXRekvA
         N32Q==
X-Gm-Message-State: ANhLgQ3KQxnIDpMWbtbVqgq21YjcP8ZfTgL/GiaWT+xh6mX5zULEMi/r
        S/pLdhdLn/dexH2Xds/sYU/ilmGYBu/1aPGyz1InBw==
X-Google-Smtp-Source: ADFU+vtnsiNcMca52ukoHC3qr+zfMoqmRF6BTsGwzWrnwAJ6XL1pJpX6SsAHKanNqeMSKOOjxyqGYzIy0bSZmwnEFSI=
X-Received: by 2002:a05:6122:1065:: with SMTP id k5mr5346841vko.14.1584021332168;
 Thu, 12 Mar 2020 06:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200306132448.13917-1-Sergey.Semin@baikalelectronics.ru> <20200306132519.2AC268030797@mail.baikalelectronics.ru>
In-Reply-To: <20200306132519.2AC268030797@mail.baikalelectronics.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 14:55:20 +0100
Message-ID: <CACRpkdaU1f_RM8GDPxj_2qaiBsJ5JLnKp=ryZxAYMp2YhTDKWA@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpio: dwapb: Add debounce reference clock support
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sergey,

thanks for your patch!

On Fri, Mar 6, 2020 at 2:25 PM <Sergey.Semin@baikalelectronics.ru> wrote:

> +       err = devm_clk_bulk_get_optional(&pdev->dev, DWAPB_NR_CLOCKS,
> +                                        gpio->clks);
> +       if (err) {
> +               dev_info(&pdev->dev, "Cannot get APB/Debounce clocks\n");

dev_err() again.

> +       err = clk_bulk_prepare_enable(DWAPB_NR_CLOCKS, gpio->clks);
>         if (err) {
> -               dev_info(&pdev->dev, "Cannot enable APB clock\n");
> +               dev_info(&pdev->dev, "Cannot enable APB/Debounce clocks\n");

dev_err() again.

Yours,
Linus Walleij
