Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E1935C5F3
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 14:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239916AbhDLMOM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 08:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237718AbhDLMOL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 08:14:11 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87B5C061574;
        Mon, 12 Apr 2021 05:13:53 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id n38so9090193pfv.2;
        Mon, 12 Apr 2021 05:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tUjJiri9YyaJc6srfMwGPp1nWAKWEpVo3zCwAOYEKG4=;
        b=c+yAMsRK0xCk48r24NmKEcLCqt2b+Gql9/RTM2H7Aolj3jNru5A3PrvR4sJoQPlTqe
         eWM76540qp+mCofxH8DXqkhJhSUGAWCo3cOYMRkSvA5ik+u4LaLHrPNe7nHwSRUhx9xX
         z6Utlj6ilaTQfa/1c4aJn36pfOggcQX5bsrwYKro5MrRGCSmTsYjyV/cXF3BRyt3wHWM
         P2pVlSuY3U5VoM33mVshdGu56L9aDabwcGO041T1ou/tFvmdzQfWizH9aaUJnMlVKLMx
         hF3gpM10Gcj5/h5UcpKXqXCTuGEPvin2DLFlfw2D8nNgLcpsHAl/6Bjn/G0z/ozJ5NND
         ZKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tUjJiri9YyaJc6srfMwGPp1nWAKWEpVo3zCwAOYEKG4=;
        b=NqjL3Rzx0WXguqa9IKL93OtjuBYZaj7ZyJOdxZFgW/HEW4dWXlrdUl1IkoZTfTaARc
         OELtUgyEkVjNiJ6qln9BsBZxQjhIpNkCYi8dI5m2oQ52S/kANnAFASQ/MdtBdJMnLqSN
         9RvegNNXRL12vAEG8NJ37xPMM9uY1NWLb5G7CTTSt6gPbEk7eBjdg60aqRDQSjN7wqr2
         yazLy7nI3XpExCBdgI6ta0Q/Qw4wBg/3XK7DQEpTo44E0i+ieBoEQf+5B4H/EFKCI8vZ
         9l1cfVdMR7Ov01Ivk54UV5uO8b1XGbHDxlUIiq8QluAEV5vyyavKf4eYL3E0VZqwkgWF
         c8+g==
X-Gm-Message-State: AOAM533uCe1PmOPunnmLdzhtMnrpolTifnxIY/6mq2MHTYowNfLQhYfB
        AAkfHxbBVYwz9gt8hG/PKsZkVZpUJjl6a3LPpiU=
X-Google-Smtp-Source: ABdhPJzgpbIwME8lAynQqiqHAqfqPf5U2S87pcob/1mHc7tiplwVn7Cw9nu9qC7ZUdx7trHcV+n8ax8bqS/fjrcu2pM=
X-Received: by 2002:a63:c48:: with SMTP id 8mr26212373pgm.74.1618229633387;
 Mon, 12 Apr 2021 05:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210411133030.1663936-1-pgwipeout@gmail.com>
In-Reply-To: <20210411133030.1663936-1-pgwipeout@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Apr 2021 15:13:37 +0300
Message-ID: <CAHp75Ve=1EbJ1qOjnTLKOwvv-UKLfxMHS-UUp=ET0zoJ9fV=ng@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] gpio-rockchip driver
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Tao Huang <huangtao@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rockchip@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 11, 2021 at 4:35 PM Peter Geis <pgwipeout@gmail.com> wrote:
>
> Separate gpio driver from pinctrl driver, and support v2 controller.
>
> Tested on rk3566-quartz64 prototype board.

Can you give a bit more context?
Usually separation means that hardware is represented by two different
IP blocks that are (almost) independent to each other. Was it the case
on the original platforms? Do you have different pin controller (or
it's absent completely) on some new / old platform?

>
> Patch History:
> V2 - Rebase to latest linux-next.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
>
> Jianqun Xu (7):
>   pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
>   pinctrl/pinctrl-rockchip.h: add pinctrl device to gpio bank struct
>   gpio: separate gpio driver from pinctrl-rockchip driver
>   gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
>   gpio/rockchip: support next version gpio controller
>   gpio/rockchip: always enable clock for gpio controller
>   gpio/rockchip: drop irq_gc_lock/irq_gc_unlock for irq set type
>
>  drivers/gpio/Kconfig               |   8 +
>  drivers/gpio/Makefile              |   1 +
>  drivers/gpio/gpio-rockchip.c       | 758 ++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.c | 911 +----------------------------
>  drivers/pinctrl/pinctrl-rockchip.h | 287 +++++++++
>  5 files changed, 1073 insertions(+), 892 deletions(-)
>  create mode 100644 drivers/gpio/gpio-rockchip.c
>  create mode 100644 drivers/pinctrl/pinctrl-rockchip.h
>
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
