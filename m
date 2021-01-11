Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F379B2F1863
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 15:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728348AbhAKOhe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 09:37:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:41622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727984AbhAKOhe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 Jan 2021 09:37:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EE802255F;
        Mon, 11 Jan 2021 14:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610375813;
        bh=81urg8WvYrutCyXl0bTokA9JAILTKEBab8PEhSmZGwI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WGGCA0J9s1wnSlpP9cI7t8SFc9LfkKbaUOQ8DdSj1jKmKhlFhcfMOhPYdK5eC9SZ5
         3sazpJ5oDc/loqV8RzoieZ/EvukzfDnNHiyYlx2xeYckxD+kIOsYGe/B4R2QzlyEwb
         riggzqVQkl/TNfFKSdCdPIBfQ4V5YZj8uV0sATp0CL7CJqaDZzTXqlIt6gz6C1NxwX
         dX0reE8p/5BtM2pJ/NVXkFnCYWVEQkmvN8tkAOWzkTqpSg4OyeDQWIS++zMn7JIStO
         iNflpR1KG3iNdJXWC7Pw1Cb7AWjImPXTk7NAa1sdWKdSNYgJp0g6hST3tbnO2neYkJ
         QwyCGzyltZnyw==
Received: by mail-oi1-f169.google.com with SMTP id p5so20286762oif.7;
        Mon, 11 Jan 2021 06:36:53 -0800 (PST)
X-Gm-Message-State: AOAM531tQyu7TlLHcCERfwRgE0yJa9SnGPxWCSrjZ5nteO7/3FJFIQAc
        QdgZEazjlmTqWzhlTPTwOBhEoQf1YNXUjbiJZ/c=
X-Google-Smtp-Source: ABdhPJx65VYXrHcfN7+annxCIoyQy5/0dn6Z2AUd7HcLfmH7JizKjYwCAaAIGmvXbLyUBBdkHBGZgmEKsgXqb126jso=
X-Received: by 2002:aca:fd91:: with SMTP id b139mr9880628oii.67.1610375812696;
 Mon, 11 Jan 2021 06:36:52 -0800 (PST)
MIME-Version: 1.0
References: <20210111140633.422726-1-geert+renesas@glider.be>
In-Reply-To: <20210111140633.422726-1-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 11 Jan 2021 15:36:36 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3=bMob8C3jPJ7jcvq0iJkoe7SOou03bKTu4jNeE9SimA@mail.gmail.com>
Message-ID: <CAK8P3a3=bMob8C3jPJ7jcvq0iJkoe7SOou03bKTu4jNeE9SimA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: checker: Restrict checks to Renesas platforms
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 3:06 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> When DEBUG is defined (e.g. if CONFIG_DEBUG_PINCTRL=y), the Renesas pin
> control driver runs sanity checks against the pin control tables.  This
> may cause lots of output on the console, and can be annoying in ARM
> multi-platform kernels.  Fix this by only running the checks when
> running on SuperH, or on a DT platform supported by the Renesas pin
> controller driver.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for addressing it,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> ---
> To be queued in renesas-pinctrl-for-v5.12.
>
>  drivers/pinctrl/renesas/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
> index b9f80833f532e7b7..56cb8e1d8384b39c 100644
> --- a/drivers/pinctrl/renesas/core.c
> +++ b/drivers/pinctrl/renesas/core.c
> @@ -1146,6 +1146,11 @@ static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
>  {
>         unsigned int i;
>
> +#ifndef CONFIG_SUPERH
> +       if (!of_find_matching_node(NULL, pdrv->driver.of_match_table))
> +               return;
> +#endif

I usually prefer writing this as

       if (!IS_ENABLED(CONFIG_SUPERH) &&
           !of_find_matching_node(NULL, pdrv->driver.of_match_table))

but I don't care enough to ask you to resend ;-)

       Arnd
