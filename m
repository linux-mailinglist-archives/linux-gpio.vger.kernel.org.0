Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4C836F7B9
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 11:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbhD3JXO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 05:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbhD3JXN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 05:23:13 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2661DC06174A;
        Fri, 30 Apr 2021 02:22:26 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id i14so4532544pgk.5;
        Fri, 30 Apr 2021 02:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5gt/BluQcot11JNvCPuKqntKstZ7km5EaRLfjbo8peg=;
        b=dfeMnLdpzgGbz6MUI6dGvATs1qKMpyMPW/g+jsB1D1HxrZmncTkJZkv42Uz4YjRIUN
         VZwS1Kb+ltAXsNHoq9fIF4XEct/LUbEQYmlZ8Hw1O5hASD10/h/+MJiadhpnXU9bP3rV
         7PDYSgmY+dQP7f1b7+jsPSnQhN9vnGCJxOmWD98BB8NRkekXby9uCCcTUgPDpXBpwiGL
         ELLSLzRVVUTnxVHypJB8IZ2EtOBSUVkdJ+VssO7r8RF5UYFEACcY5SVh5ddcdzZB3gZk
         hUS767XO6H0lU2iv/ETR5GAT1eXWWYkighZ8RLv0F9UD2i1lB/SE9AoXW8jGAjWTQqqJ
         boCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5gt/BluQcot11JNvCPuKqntKstZ7km5EaRLfjbo8peg=;
        b=ONQoI8IAvmOb0CiqeVozAFUpIP+T2FtH+Vlo7H8q+TY7/BnQO5h68Fq6K6gaRP79PX
         odf23K96E//I7fpiK8c4sQdUzolx6E0xpW83DK3OyCkWo8Za3u/ZmCz+ZLPh86F4d/tf
         G+ywPCSV6QbB6i7vG8ienyCG8adDQV/zqX0B7FrEWfmCHrklZnLn9Ycocz0xAAnyvTOF
         dEPGEOLOrRZryHIsiz+P7cU2FswiRQHKLR9inIMnOoPiyhO1A1/lVKa7pS3Un6ZvzS22
         JwapMmZOKfa30+YfH49HAMSJIjzPM17H2QOQOTnTwAmViddxi2A+hsjbwAme0OjEZRgK
         gcrg==
X-Gm-Message-State: AOAM531cACWVO/m1qaLtOvjbO0vD3l3SQ4iUo9dW1nsr21IFBUH3McHp
        LHO8VfIiHVLghdpMc4tHE+WkCBAN46tn5RrbqRo=
X-Google-Smtp-Source: ABdhPJwTqSI7VNmApLe9OTXaPLpcuhCQTv5ooHSjf9Z8VfG7fEnWIKjRfW3wAEXEC4oSrlsNIcx9xXaLhstbtuciijc=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr3786866pgg.74.1619774545655;
 Fri, 30 Apr 2021 02:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210429163341.1.I7631534622233689dd81410525e0dd617b9b2012@changeid>
In-Reply-To: <20210429163341.1.I7631534622233689dd81410525e0dd617b9b2012@changeid>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Apr 2021 12:22:09 +0300
Message-ID: <CAHp75Vfvknn6O2cc4XYUuo4U_C1nguMHjJPxmRQapf8h0QjGFw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Implement irq_set_wake
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kramasub@chromium.org, Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 30, 2021 at 1:34 AM Raul E Rangel <rrangel@chromium.org> wrote:
>
> This allows the OS to control which devices produce wake events.
>
> $ grep enabled /sys/kernel/irq/*/wakeup
> /sys/kernel/irq/24/wakeup:enabled

Is it a bug fix of [1]?

If so, add a BugLink: tag here.

> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

[1]:

...

irq_hw_number_t hw = irqd_to_hwirq(d);

> +       pin_reg = readl(gpio_dev->base + (d->hwirq)*4);

> +       writel(pin_reg, gpio_dev->base + (d->hwirq)*4);

Too many parentheses and missed spaces


-- 
With Best Regards,
Andy Shevchenko
