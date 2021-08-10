Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299BE3E5678
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 11:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236537AbhHJJNw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 05:13:52 -0400
Received: from mail-vs1-f41.google.com ([209.85.217.41]:36566 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbhHJJNt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 05:13:49 -0400
Received: by mail-vs1-f41.google.com with SMTP id y65so1469045vsy.3;
        Tue, 10 Aug 2021 02:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D4zFUoQGWXvJJzszKGbYHtmhD6iQDxYUpdvSAl+bWOM=;
        b=n/aBVUK99Rmm2MaI+JLChXRJm1A059O4buVZjxXJgxCY3kBlujqs7HeegoWLIiHvGa
         E0LGs69wzyT8DIzIhaB1LNz3iEtk7lw9xx+LTdAgyEwYFq3hsHGwVVcaY+bPYqCX0mTh
         499n2NF/ogRk9RdcVM4nCtI/TB/z/+Wv75yXp9aZ2Ni+wyjLxDXf/ZX6WZkgYTRBSpBA
         c1fNZbD0Y6yyUkhom1Mwmgut/W/O1MseAEeDhzIgWevskuzK8c+L3mO13A2sBMOo5WSe
         nv37EjGuDZSx4DWxyrHCYTV+cOU5hGF9AOIM/af11D/q+N2HXW04py7v8ewAFouhFV8i
         H/FQ==
X-Gm-Message-State: AOAM532zqhJnsUpDgFwIXI4dVsPoNYlluwXAWQfzrfWgWNOv0eJGdXBS
        pyj593JnrZ+APGUgNe7qF9pvEpBkKpG4PdQG+SQ=
X-Google-Smtp-Source: ABdhPJzi/lB8toRXF6TLgirnwNVqdViDEm3Wk1WLbMzBb5EExiEX3qWBYRajb5yqiHccxcg+Sc4I+H0YhXdr/mU8G4o=
X-Received: by 2002:a67:e2c7:: with SMTP id i7mr20048451vsm.3.1628586807159;
 Tue, 10 Aug 2021 02:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210727112328.18809-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210727112328.18809-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210727112328.18809-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Aug 2021 11:13:15 +0200
Message-ID: <CAMuHMdWy4JNZ2=Z+FdMdHukN6rGQMma7cc+Pm06AtsOk8j_eGA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] pinctrl: renesas: Add RZ/G2L pin and gpio
 controller driver
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Tue, Jul 27, 2021 at 1:23 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for pin and gpio controller driver for RZ/G2L SoC.
>
> Based on a patch in the BSP by Hien Huynh <hien.huynh.px@renesas.com>.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> +static void rzg2l_pinctrl_clk_disable(void *data)
> +{
> +       struct clk *clk = data;

No need for the intermediate variable.

> +
> +       clk_disable_unprepare(clk);
> +}
> +
> +static int rzg2l_pinctrl_probe(struct platform_device *pdev)
> +{
> +       struct rzg2l_pinctrl *pctrl;
> +       int ret;
> +
> +       pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
> +       if (!pctrl)
> +               return -ENOMEM;
> +
> +       pctrl->dev = &pdev->dev;
> +
> +       pctrl->data = of_device_get_match_data(&pdev->dev);
> +       if (!pctrl->data)
> +               return -EINVAL;
> +
> +       pctrl->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(pctrl->base))
> +               return PTR_ERR(pctrl->base);
> +
> +       pctrl->clk = devm_clk_get(pctrl->dev, NULL);
> +       if (IS_ERR(pctrl->clk)) {
> +               ret = PTR_ERR(pctrl->clk);
> +               dev_err(pctrl->dev, "failed to get GPIO clk : %i\n", ret);
> +               return ret;
> +       };
> +
> +       spin_lock_init(&pctrl->lock);
> +
> +       platform_set_drvdata(pdev, pctrl);
> +
> +       ret = clk_prepare_enable(pctrl->clk);
> +       if (ret) {
> +               dev_err(pctrl->dev, "failed to enable GPIO clk: %i\n", ret);
> +               return ret;
> +       };
> +
> +       ret = devm_add_action_or_reset(&pdev->dev, rzg2l_pinctrl_clk_disable, pctrl->clk);

This line is a bit long.

> +       if (ret) {
> +               dev_err(pctrl->dev, "failed to register pinctrl clk disable devm action, %i\n",

Elsewhere, this is called the "GPIO clk".
This line is a bit long.

> +                       ret);
> +               return ret;
> +       }
> +
> +       ret = rzg2l_pinctrl_register(pctrl);
> +       if (ret)
> +               return ret;
> +
> +       dev_info(pctrl->dev, "%s support registered\n", DRV_NAME);
> +       return 0;
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.15, with the above fixed, so no need
to resend.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
