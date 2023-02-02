Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32CBD687796
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 09:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbjBBIfG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 03:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbjBBIfF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 03:35:05 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6703E87165
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 00:34:16 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id d66so1035747vsd.9
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2023 00:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JvtsncsIkvDTPY0jE9MmEEDZESoCNPgo52emg1byeqY=;
        b=ZXPQcL55tEJFFBDxaSofDg5SA3eMC10OVo/tZa8i6XtTXajdTe2SXtEOTWSabTC79q
         54VMKo4aW+TKdJd890QsUUE61Ks9L7FS0FjxEOOlYkp0cDlaj6Cw7F7GK8olrtEFWckL
         dhZVlfD40jQt30b6Gs7LRBjxMqDdxkzj0PWqcpdVQN+fo/srM1IFbnM24El+bcVwZrBY
         tFVr1tEsbAWy5SxlYycoEZBxu/CJgLoTm+VzP72II2YJ3TsriV5qxJjLmmjVI03/LUrb
         5BdXI671CWyHQUeZhLy7VVXwP3YZKjPyuXQQqxQPvnl8vwMJYSkUxSowV3P2XyMA6Htq
         RvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvtsncsIkvDTPY0jE9MmEEDZESoCNPgo52emg1byeqY=;
        b=t15eRwnrH/mNyWAimTrNa1TKfzePODm3yxVT10dvoHydgTNW8ms4qzHtd0rGY665qM
         ayTpLPzhAVce7jwmjute5R18VAi2Ge4PRIvkCFQ/Kb2X6/XgDMBek1zezHefTEbHodua
         JwC1XXMuGtsD5oMFpYZWN/KN0+2CqZyKiZz4IJLdfijZtN8groxRszqArl0pPypB5QRo
         9NgAyx3rYGgpvZSnmmH0q0lhJ515n9qH6wkm+wRhsDEIkUgsx6gmiqXp6A0KbdwcpkDd
         zZdjd2o0GuC3O4AGyutB1zdQ2Mg3viBvfx2/dER01KLRpqosiVdzRhxaW/1WsziCBY3W
         yCcA==
X-Gm-Message-State: AO0yUKWidFcVNCePr4vqZ6EgCT2YPlePebD8ZFHQeM6VSQVyq/gOaRII
        4TyS4Gg7ujCAYKg/Chxb4YzCnqJ2M5/gokcYa0tqGQ==
X-Google-Smtp-Source: AK7set9jAXkCm3Ol0NBP3fEdyURHk9ju/tk/alXv1YIEXTN1Rkv0L8SWWv8mzIerQz084ji4l3MGe97fcY5WnPFD9+w=
X-Received: by 2002:a67:c11b:0:b0:3f2:58c2:5358 with SMTP id
 d27-20020a67c11b000000b003f258c25358mr1052172vsj.62.1675326851633; Thu, 02
 Feb 2023 00:34:11 -0800 (PST)
MIME-Version: 1.0
References: <20230125212631.749094-1-trix@redhat.com>
In-Reply-To: <20230125212631.749094-1-trix@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 2 Feb 2023 09:34:00 +0100
Message-ID: <CAMRc=MeXm8TCJVL+3n=aEi87wowu4AaiqmO5VY3T0vhb7m+ZDQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: remove unneeded loop in tegra186_gpio_init_route_mapping()
To:     Tom Rix <trix@redhat.com>
Cc:     linus.walleij@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 25, 2023 at 10:26 PM Tom Rix <trix@redhat.com> wrote:
>
> Reviewing the j loop over num_irqs_per_bank, in the code previous
> to the fixes: commit, every j was used. now only when j == 0.
> If only j == 0 is used, there is no need for the loop.
>
> Fixes: 210386804745 ("gpio: tegra186: Support multiple interrupts per bank")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 40 ++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 9941f35af823..14c872b6ad05 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -677,7 +677,7 @@ static const struct of_device_id tegra186_pmc_of_match[] = {
>  static void tegra186_gpio_init_route_mapping(struct tegra_gpio *gpio)
>  {
>         struct device *dev = gpio->gpio.parent;
> -       unsigned int i, j;
> +       unsigned int i;
>         u32 value;
>
>         for (i = 0; i < gpio->soc->num_ports; i++) {
> @@ -699,27 +699,23 @@ static void tegra186_gpio_init_route_mapping(struct tegra_gpio *gpio)
>                          * On Tegra194 and later, each pin can be routed to one or more
>                          * interrupts.
>                          */
> -                       for (j = 0; j < gpio->num_irqs_per_bank; j++) {
> -                               dev_dbg(dev, "programming default interrupt routing for port %s\n",
> -                                       port->name);
> -
> -                               offset = TEGRA186_GPIO_INT_ROUTE_MAPPING(p, j);
> -
> -                               /*
> -                                * By default we only want to route GPIO pins to IRQ 0. This works
> -                                * only under the assumption that we're running as the host kernel
> -                                * and hence all GPIO pins are owned by Linux.
> -                                *
> -                                * For cases where Linux is the guest OS, the hypervisor will have
> -                                * to configure the interrupt routing and pass only the valid
> -                                * interrupts via device tree.
> -                                */
> -                               if (j == 0) {
> -                                       value = readl(base + offset);
> -                                       value = BIT(port->pins) - 1;
> -                                       writel(value, base + offset);
> -                               }
> -                       }
> +                       dev_dbg(dev, "programming default interrupt routing for port %s\n",
> +                               port->name);
> +
> +                       offset = TEGRA186_GPIO_INT_ROUTE_MAPPING(p, 0);
> +
> +                       /*
> +                        * By default we only want to route GPIO pins to IRQ 0. This works
> +                        * only under the assumption that we're running as the host kernel
> +                        * and hence all GPIO pins are owned by Linux.
> +                        *
> +                        * For cases where Linux is the guest OS, the hypervisor will have
> +                        * to configure the interrupt routing and pass only the valid
> +                        * interrupts via device tree.
> +                        */
> +                       value = readl(base + offset);
> +                       value = BIT(port->pins) - 1;
> +                       writel(value, base + offset);
>                 }
>         }
>  }
> --
> 2.26.3
>

Applied, thanks!

Bart
