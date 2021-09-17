Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1418940F6EB
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 13:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242541AbhIQLwd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Sep 2021 07:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242098AbhIQLwc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Sep 2021 07:52:32 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D16C061574;
        Fri, 17 Sep 2021 04:51:10 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id p29so31606349lfa.11;
        Fri, 17 Sep 2021 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e2DNnwzlvtG/HPrhpkKUSv+yJrAjP70ES9zuh8E5fTw=;
        b=FXm3rmMC3CIybxIvOxqusIn8oQ3om07WPtq7VLKNs0eccPwkl2KPXH9mtGKWs0rNZg
         9bGQT4pShYQHC6reWntgirW/Ew6ZTOw78cuP8AvwV5yWk5bcgv5GxQoUJ/7JkWZgZpg5
         oRWBP6WIw3yk/Q0samRU6NnVQ7BGgd4ELUSlS1BjiPjveFzt0+wUc7Ei+dnepg5+gs6A
         mgSwN7hYUDp0AsY+cMc3m+8ems2UPssoX8KS1Qg/6pMv4z2RIgvLJy1oNf3bMRo76f0v
         9C6gCrV0OLVe1AvAtNg0qnXOfvIBVEehGTZIeh+rCnJ9+tQzTK80n12PEZuM+HnKzs6R
         TO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e2DNnwzlvtG/HPrhpkKUSv+yJrAjP70ES9zuh8E5fTw=;
        b=ikDKUKuwHqzMdv2JjkMCwdZ3Udv7Yr2xppFNa6H2DBRfWk/+f4egkBOO1Kmvfib4cA
         +g+QFTR/rAVcXjyADsopkzyonAZ/JUFoTBlDUzIfs0thbbcMBivHqJOrT6OoJmJ7rTcK
         K+F769iLI7gh6SXHObecuPdIkY7M3PPuqyxNoA0aQoi5NN0MaYguYOdNQaZkSCsFmq1f
         7S6cwLJ5YX2hePcDz1dPnY80jRq/UPx/2s1yeRzeebcFf0RIjZyIjkRZZx4XCAp0SCHP
         y3COky/EYB0cgxo9Fq7IFmjgq0kpKnzZNp3J2wK6rskosIH0peaWpJ2HTkDiXLQf4blP
         UvdQ==
X-Gm-Message-State: AOAM531ZLbTTqvpH+rKu53rTgogDz7QBERNxc8rzkbrXFUT3OvZwnhi1
        xWEot7mLi2kIBlb4mLf81JcMLIKws8HY2/Am2P4=
X-Google-Smtp-Source: ABdhPJyUxXbVy8zR9c8DoyTCEhHYI5jfyQjw8fgc+MBtICE5o2dF83lXCyh+0xLbW4yjD+mFZoAC2K8OE6GU0DR2BU8=
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr7777620lfq.113.1631879466248;
 Fri, 17 Sep 2021 04:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210825082251.2484-1-caihuoqing@baidu.com>
In-Reply-To: <20210825082251.2484-1-caihuoqing@baidu.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 17 Sep 2021 08:50:55 -0300
Message-ID: <CAOMZO5DKGv1GQBpwr0ff0YC1yDmCH2A5Xpq7jzUA2h75bmN6eQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: freescale: Add helper dependency on COMPILE_TEST
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Cai,

On Wed, Aug 25, 2021 at 5:23 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> it's helpful for complie test in other platform(e.g.X86)
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/pinctrl/freescale/Kconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
> index 21fa21c6547b..defc1f38efc7 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -119,28 +119,28 @@ config PINCTRL_IMX7ULP
>
>  config PINCTRL_IMX8MM
>         tristate "IMX8MM pinctrl driver"
> -       depends on ARCH_MXC
> +       depends on ARCH_MXC || (COMPILE_TEST && OF)
>         select PINCTRL_IMX

I am not sure why you need the && OF, as we have a "select PINCTRL_IMX",
that already depends on OF.

Also, why was PINCTRL_IMX8DXL not updated?

Thanks
