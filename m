Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A6B401D1B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Sep 2021 16:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243494AbhIFOhp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Sep 2021 10:37:45 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:34538 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243450AbhIFOho (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Sep 2021 10:37:44 -0400
Received: by mail-vs1-f46.google.com with SMTP id x137so5762914vsx.1;
        Mon, 06 Sep 2021 07:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kp+Fh+r6SGtJysGOhCUnbQGyCMfO1JGibcY9EAeRd8=;
        b=Ro+XZY1GI8lE4LX/fsXYUyJIhJ3SvuO8dKRvo3XGXnYdHjDYvNQ9sXNf/sFC6NlDSX
         SKM/J/9NEnpb78h008YdxFEgQ/blYAX091PVNh/qJbC0nQeHydAP8F5b8f0eVkF5htMs
         z9g5tgN5ZUnRsmf4eL6wZRCYVfZg2ResGF9xdQasb4sg0ro4qoG0ZnYeuu6oyAxwLLSU
         91FTRU8yGXIdsPfrYw0tZSkvA9xjUEWngSgSYp/0rf891gzqn/FOWyFcI95aH0ObxpVo
         iXCrMr9HCo3vRVEbkpoBlv32pC80Mh5JYN0REcCFwx/kzUWpTPMzxnrBKWFzNYklcILg
         sTDQ==
X-Gm-Message-State: AOAM532KCAUZJjJpyNgEXeDnoaDPHXjs/5zp37LmfosaLmOVfGadu3mH
        Xc/e/eErMSaenrZz06ed9wCsQOvwbNgOkUCXFe9vMgVuWQQ=
X-Google-Smtp-Source: ABdhPJw8GCAk93M0FkDvnMIqbmZOLJ+UWYVRLpgn9VqY9Gim2kFvN4AlRU64hDC4/Cc1cKfAwQTRtiESwjGlXPsI2cU=
X-Received: by 2002:a67:3289:: with SMTP id y131mr6326587vsy.37.1630938999299;
 Mon, 06 Sep 2021 07:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210906134040.96642-1-wangborong@cdjrlc.com>
In-Reply-To: <20210906134040.96642-1-wangborong@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 16:36:27 +0200
Message-ID: <CAMuHMdXq-ACdy8C7Efamnwz_h=h8_C4-3y14O8-S61EnB7pWmQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: no need to initialise global statics
To:     Jason Wang <wangborong@cdjrlc.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jason,

On Mon, Sep 6, 2021 at 3:41 PM Jason Wang <wangborong@cdjrlc.com> wrote:
> Global static variables dont need to be initialised to 0. Because
> the compiler will initialise them.
>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/core.c
> +++ b/drivers/pinctrl/renesas/core.c
> @@ -741,12 +741,12 @@ static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
>  #define SH_PFC_MAX_REGS                300
>  #define SH_PFC_MAX_ENUMS       3000
>
> -static unsigned int sh_pfc_errors __initdata = 0;
> -static unsigned int sh_pfc_warnings __initdata = 0;
> -static u32 *sh_pfc_regs __initdata = NULL;
> -static u32 sh_pfc_num_regs __initdata = 0;
> -static u16 *sh_pfc_enums __initdata = NULL;
> -static u32 sh_pfc_num_enums __initdata = 0;
> +static unsigned int sh_pfc_errors __initdata;
> +static unsigned int sh_pfc_warnings __initdata;
> +static u32 *sh_pfc_regs __initdata;
> +static u32 sh_pfc_num_regs __initdata;
> +static u16 *sh_pfc_enums __initdata;
> +static u32 sh_pfc_num_enums __initdata;

These are special, as they use __initdata.
While dropping the initializers seems to work fine with e.g. gcc 9,
I'm quite sure that would fail with older compiler versions, where
the variable would be put in bss instead of initdata.

See the example in include/linux/init.h, which explicitly
initializes a variable with zero:

    static int init_variable __initdata = 0;

Arnd: do you know in which version of gcc this was fixed?
It seems at least 6.5.0 and later are fine (I don't have all required
shared libs to run e.g. 5.5.0).

>  #define sh_pfc_err(fmt, ...)                                   \
>         do {                                                    \

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
