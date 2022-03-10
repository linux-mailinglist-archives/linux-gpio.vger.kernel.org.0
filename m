Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A384D462D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Mar 2022 12:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236438AbiCJLqg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Mar 2022 06:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234727AbiCJLqg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Mar 2022 06:46:36 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BE813FACF
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 03:45:35 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id r13so11464340ejd.5
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 03:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m07EgktoRQs6UQmv9zKT1/mya3AqZllVKUfN19jmQgg=;
        b=kdI+prJ6PXdVNIht+xMeK9cJ4WWNcJtL7nIDKCiJKtl2SSYNk671+wCueM5j3ohM1C
         90hA+K5hl2NhlI3/ojxkFFUATO59aXEfFgPpHLlCFC33AtHSnh1WBaXtqxrTaTmM/5Jr
         J3rHSb827XsOFb5KAIeGyc3xBL9ud9lO7hRvWVNtUbT4VvDPwpQRN0aOYU8wK1+mrWOn
         ss9ktOkXBqMZmyGePsPhT3I8lnOS6SfcEjzshse28YcbQP1QblTSEi0MWDnJBadx6Oes
         oEMJaPuzFVTfeOK5jRfvEXIMy2tydR8vexzubllSzX6gl02JLU3PAmPS3T0UYsWFL8/J
         pD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m07EgktoRQs6UQmv9zKT1/mya3AqZllVKUfN19jmQgg=;
        b=gMoZxgcswyfEds3UnNOmZkhxyrUOVhwx/pRIxobM0WKZRFHmJz0C1/sw1EyJhAJC6t
         Ap+7iviZWHsrw2ZPGQYTpD7sE9gjgENdarzBu+YSXf1ASUW4hRQRnPrZ5Te4E9XkxaVH
         FAQZS75XYLmLTw1+CRVCLCs0Tko9JhLHpc40rhyclyfEOwi9/NvK6DGzuX7rSHGyF1LF
         FqecLZiYciW+rGtTjQCwc5LYowYE3vXLPpsPc2Os+Ibq8WvqbdPgSsLatJyt6UPJHjkm
         3O0X/uKrjJ3db/VBx56YE9xrzBJtbUvtYRnIyrKMzWpzNldmp5c+iyJ76aL2GhomnpGf
         LNbg==
X-Gm-Message-State: AOAM531xX03Baw+L7ZLAeW3PVahK0hLV1Qm2Qz7MyfJBKxXAglw/vH/f
        reQbM+rGA6gKV1L4jryNJDs3HyReKG/+wESt3dA=
X-Google-Smtp-Source: ABdhPJwGJscjSOK/9D2RzsFjYvf1Lfz1beMZMg/DT4cmzSthWajIGqNDbKodxyDCQxXiAyfGMCnKA645g0s2/sNhEao=
X-Received: by 2002:a17:907:9703:b0:6da:6412:508a with SMTP id
 jg3-20020a170907970300b006da6412508amr3956317ejc.77.1646912733650; Thu, 10
 Mar 2022 03:45:33 -0800 (PST)
MIME-Version: 1.0
References: <20220308061935.2441447-1-jay.xu@rock-chips.com> <20220308061935.2441447-3-jay.xu@rock-chips.com>
In-Reply-To: <20220308061935.2441447-3-jay.xu@rock-chips.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 10 Mar 2022 13:44:57 +0200
Message-ID: <CAHp75VenbfJLOmavP8p8gqfka-n1xvni23g_vT7vg=wrJK5Erg@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: rockchip: get irq support for both dt and acpi
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tao Huang <huangtao@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 9, 2022 at 1:06 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:
>
> Get the irq of gpio controller with fwnode apis, support for both dt
> node and acpi.

DT
ACPI

...

> -

Stray change.

> +#include <linux/acpi.h>

Probably you wanted property.h.

>  #include <linux/bitops.h>
>  #include <linux/clk.h>
>  #include <linux/device.h>
> @@ -639,10 +639,6 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  {
>         int id = 0;
>
> -       bank->irq = irq_of_parse_and_map(bank->of_node, 0);
> -       if (!bank->irq)
> -               return -EINVAL;
> -
>         bank->clk = of_clk_get(bank->of_node, 0);
>         if (IS_ERR(bank->clk))
>                 return PTR_ERR(bank->clk);
> @@ -668,6 +664,24 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>         return 0;
>  }

...

> +       if (np)
> +               irq = irq_of_parse_and_map(np, 0);
> +       else if (has_acpi_companion(dev))
> +               irq = platform_get_irq_optional(to_platform_device(dev), 0);

Why can't this work for the DT case?

-- 
With Best Regards,
Andy Shevchenko
