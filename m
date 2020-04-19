Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 378681AFCE7
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2020 19:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgDSRzM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Apr 2020 13:55:12 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43612 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgDSRzM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Apr 2020 13:55:12 -0400
Received: by mail-ot1-f65.google.com with SMTP id g14so6032947otg.10;
        Sun, 19 Apr 2020 10:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VDmkWCWwG3g8+hFt8ioGTKPIegMkTeVdebevBg3rZlg=;
        b=bruDHE6COW6ZMe2m1H/w3ZlEEapPJoXCscEA29L8rFz3gsTOaSdEaGMp9zIHzDi9Gy
         jrK3yM+8Lvay676p7sQV3QwWTbN+/36irR0TX4kMHgFV0KlkvUJ24oGZ4mlaqwoWpjCw
         SKNjkyLxSZaF2gyPhsVaWaXp4CFUxVpFNT1OLcnbjXArFM/u1g5tyh78563X62opDh0j
         KkmMJFkvNsXvaJgwZM2lF3lTmzTO6vphskyVdd6ic/TgQa0Rqu24ZuPQXFfdcm9o83qo
         +90gNSCN7DrJuk17evJ6hm1oGZLXG0Kp6jmctYbTP4E1rJFJXMqsJtEk+oz4DzJln2sn
         tqHg==
X-Gm-Message-State: AGi0PubCMVoYCeerztyuR8XA0p9stE4N6x1C/bm6NsKAZhygjDyyWq4U
        9tRfj9BMlizgl/RNeVgbfeJ3URBuwN0j4jXrRTk=
X-Google-Smtp-Source: APiQypLun+CBwjKUVhxWQXJcxguZiuK6rc3+flEUnR/EKcSAY97xhSafAUIDuwbhXe7DQoenZLlSb0NGyAF3AoPlsmY=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr3149825ots.250.1587318911290;
 Sun, 19 Apr 2020 10:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200419164956.3484-1-zhengdejin5@gmail.com>
In-Reply-To: <20200419164956.3484-1-zhengdejin5@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 19 Apr 2020 19:54:59 +0200
Message-ID: <CAMuHMdXyWuTDqBASA8ofhHqt-4r56u_brJENkW4eiZsEEY-G-A@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: fix several typos
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Jun Nie <jun.nie@linaro.org>, stephan@gerhold.net,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 19, 2020 at 6:50 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
> use codespell to fix lots of typos over frontends.
>
> CC: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Thanks for your patch!

>  drivers/pinctrl/sh-pfc/pfc-sh7269.c              | 2 +-

For sh-pfc:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/sh-pfc/pfc-sh7269.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-sh7269.c
> @@ -1963,7 +1963,7 @@ static const struct pinmux_func pinmux_func_gpios[] = {
>  static const struct pinmux_cfg_reg pinmux_config_regs[] = {
>         /* "name" addr register_size Field_Width */
>
> -       /* where Field_Width is 1 for single mode registers or 4 for upto 16
> +       /* where Field_Width is 1 for single mode registers or 4 for up to 16
>            mode registers and modes are described in assending order [0..16] */

Which brings my attention to another typo: that range should be [0..15].

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
