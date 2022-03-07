Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C339E4CF6C7
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Mar 2022 10:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237850AbiCGJmc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Mar 2022 04:42:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238982AbiCGJjG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2022 04:39:06 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 414656FA20
        for <linux-gpio@vger.kernel.org>; Mon,  7 Mar 2022 01:34:03 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id o1so17909786edc.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Mar 2022 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T4pAYxTpYPVm5BTKv0KTFLGCqSqO8rP0B5DSOXBwIIg=;
        b=XOVQYs5hOi5/QArBQXFroja0peQ2uhcvbl0ymGXyBrZz7jqc1l1e7nq9dqLl4KBskz
         HTpJYa4D4L4D1Ny38BmIdtiTGV5Rmzb47jmY6rHFEhK+3ZnqwtoEu9ZW8C7TiFq5YxRh
         cMwQjrWZ0xMPEW1P9VbUQA3AE8fCATUhNhLkkSYTWpNN6Xq4gKLRlXMEzsyWqI4/1PdA
         dV1tHE4mxBLY1iEoEbvoxZp8PUUJaUyUg6lhWpQ54LCW28Nh8a2rc8NNYuGLPvbOb7lY
         qbZXa7rxKXLMvcpvlUlP1uVrSHXZPJTF96M8bpcSmKbW1XJa4362k2PaotiKn+weMN7F
         xWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T4pAYxTpYPVm5BTKv0KTFLGCqSqO8rP0B5DSOXBwIIg=;
        b=wgTtZzuuaEmsVSwjtz+VXq//MCae5biAz8rE4zKdl8Xmd6zIi96EvtjSyCjHVW3E6F
         ryexEu73a0VYsXH1Mce70terJKnbk1XROfJpM9tz2ANQaC1ZmHOXnPHHYgusFD61o2qh
         903Y3hiX5vn62LkWQBO6GTM/f7vCd76Drs7zmiD4zDRO3FCxAKXy4u8XIy7cyK/upyhr
         SLN66NQ9cMtu6qUWI3uHkyWjyG2TtzFkjVsjenHQYHBbgckC67+Z6pJtSu5T/g5mKTbg
         pH8OWSX8pZieSM1rRaXOHvFDycC+16qzfJWs6LEuz1bFodrmOJtc75IhYSfGFFh/zj8i
         ukkw==
X-Gm-Message-State: AOAM531JhuMXu30SGMDQGWd9PZJtn8nFmxq2qzAHgYNqaYT27+/BinWf
        k2yxjMXJk9y73TdNILRlX/qjgM/4cvP0DjJv3KSDbQ==
X-Google-Smtp-Source: ABdhPJzs6obQQ+IS68pyTHcyaWrxMiTQtAkSpPqurNqsXqJhCMR3bBC/qScebmZHHGDDCuou6y5dsamkrWzHkgOr8oU=
X-Received: by 2002:a05:6402:d0d:b0:416:1d69:f23b with SMTP id
 eb13-20020a0564020d0d00b004161d69f23bmr10131225edb.141.1646645637315; Mon, 07
 Mar 2022 01:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20220228153405.49981-1-akhilrajeev@nvidia.com>
In-Reply-To: <20220228153405.49981-1-akhilrajeev@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 7 Mar 2022 10:33:46 +0100
Message-ID: <CAMRc=McbkMjg2Qku8XdC_GK3KPt_GFwi15PK4Yt-rRMKNs0rYw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: Add IRQ per bank for Tegra241
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 28, 2022 at 4:34 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Add the number of interrupts per bank for Tegra241 (Grace) to
> fix the probe failure.
>
> Fixes: d1056b771ddb ("gpio: tegra186: Add support for Tegra241")
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
> v1->v2: Add 'Fixes' tag in the commit message
>
>  drivers/gpio/gpio-tegra186.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 8d298beffd86..031fe105b58e 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1075,6 +1075,7 @@ static const struct tegra_gpio_soc tegra241_main_soc = {
>         .ports = tegra241_main_ports,
>         .name = "tegra241-gpio",
>         .instance = 0,
> +       .num_irqs_per_bank = 8,
>  };
>
>  #define TEGRA241_AON_GPIO_PORT(_name, _bank, _port, _pins)     \
> @@ -1095,6 +1096,7 @@ static const struct tegra_gpio_soc tegra241_aon_soc = {
>         .ports = tegra241_aon_ports,
>         .name = "tegra241-gpio-aon",
>         .instance = 1,
> +       .num_irqs_per_bank = 8,
>  };
>
>  static const struct of_device_id tegra186_gpio_of_match[] = {
> --
> 2.17.1
>

Queued for fixes, thanks!

Bart
