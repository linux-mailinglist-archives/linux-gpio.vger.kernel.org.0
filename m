Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FA03EA087
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 10:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235155AbhHLI0F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 04:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233921AbhHLI0F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 04:26:05 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549AEC061765;
        Thu, 12 Aug 2021 01:25:40 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id p4so10170420yba.3;
        Thu, 12 Aug 2021 01:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x/U+rWN+j9s5n6sG47stTzPJLVQ6JGcCvmKcR9Yt9yo=;
        b=UgnsKX7TLNzzF/9+WS3sfIEn6o2OljDdMjYuQ5msxZD+6I2cjv7AmD/zELORSzSftC
         asByK0KSSRLNdqLCN4k+A7M1UPcU6jd94ASgCl93MwmN9l6tbo5hgWSWQZ0k+41tDJbY
         qFH0TeDsqW03NKi9NKIg1m6xuYeqZ94xSyR2mo7altRYDRT5uZ+KhSnqQoUpQtLf++ib
         FxXM7Ps/nxG7vUXLVtTtvQi7+Jz/vUYh/Lashy0oRURTy7Q4y8DDUihUonqY/T46T2jW
         JnLZg/Vxu3CE6tOziASVdCURMMyNJG05KEVyW9yVLZ4Jp3PGbk71DiMVfqRvYprjXjqF
         iIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x/U+rWN+j9s5n6sG47stTzPJLVQ6JGcCvmKcR9Yt9yo=;
        b=ZCUliyC8S1t/tnfHdX++jTLn5+zR5Zc/qs+dGqaPE4qXue7QLATsihklM+fbi99TK6
         E3uFx3zckvibShNuWyWnbyreGgU0Q1D81b4o6FO8xig0vOSVbyutglmKx4BNgXegOj8R
         UTrHINvbB6ZdpsMUkTDpgewlYBp/dAEeoG0ebXOWLGaRShGbKVYFHEfyjZHq0CthsJoC
         fGRsxiFrtj8GmpOdXBFGAYVyMjdP2F5W/u8I7fSVwkvwP6SvwzIORiF7FAgbd4YW7yEC
         yv4S+7OBe8fgLllDYUEc+DfgaHiVr2VVBZVC7icDrr5QtFq8WigE4xMEraZ9LSGVtHye
         nAew==
X-Gm-Message-State: AOAM532WdWEgf84Y7Z5AHQEus2wm5oZsFpviHFgIjcJyVuUkzzKaq1do
        lsVF77xURb1RrOaI9731UgfuCuc/XbXG0ZJQvYc=
X-Google-Smtp-Source: ABdhPJzShcvdNPe4dEbFW/Cw7BUKpb3CUwW1dyJcLF6u+HxW9DDMR6aMvCZoKTdlZvWdgdqMF5xGYiCytbTEUrkW4pc=
X-Received: by 2002:a5b:d45:: with SMTP id f5mr2930306ybr.179.1628756739522;
 Thu, 12 Aug 2021 01:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210727112328.18809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210727112328.18809-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWy4JNZ2=Z+FdMdHukN6rGQMma7cc+Pm06AtsOk8j_eGA@mail.gmail.com>
In-Reply-To: <CAMuHMdWy4JNZ2=Z+FdMdHukN6rGQMma7cc+Pm06AtsOk8j_eGA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 12 Aug 2021 09:25:13 +0100
Message-ID: <CA+V-a8unn87anEBKfMLg4D2fK20B7=2ctMQ1x9W5+Jq9RdtikQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] pinctrl: renesas: Add RZ/G2L pin and gpio
 controller driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the review.

On Tue, Aug 10, 2021 at 10:13 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Jul 27, 2021 at 1:23 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add support for pin and gpio controller driver for RZ/G2L SoC.
> >
> > Based on a patch in the BSP by Hien Huynh <hien.huynh.px@renesas.com>.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>
> > +static void rzg2l_pinctrl_clk_disable(void *data)
> > +{
> > +       struct clk *clk = data;
>
> No need for the intermediate variable.
>
Agreed.

> > +
> > +       clk_disable_unprepare(clk);
> > +}
> > +
> > +static int rzg2l_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +       struct rzg2l_pinctrl *pctrl;
> > +       int ret;
> > +
> > +       pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
> > +       if (!pctrl)
> > +               return -ENOMEM;
> > +
> > +       pctrl->dev = &pdev->dev;
> > +
> > +       pctrl->data = of_device_get_match_data(&pdev->dev);
> > +       if (!pctrl->data)
> > +               return -EINVAL;
> > +
> > +       pctrl->base = devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(pctrl->base))
> > +               return PTR_ERR(pctrl->base);
> > +
> > +       pctrl->clk = devm_clk_get(pctrl->dev, NULL);
> > +       if (IS_ERR(pctrl->clk)) {
> > +               ret = PTR_ERR(pctrl->clk);
> > +               dev_err(pctrl->dev, "failed to get GPIO clk : %i\n", ret);
> > +               return ret;
> > +       };
> > +
> > +       spin_lock_init(&pctrl->lock);
> > +
> > +       platform_set_drvdata(pdev, pctrl);
> > +
> > +       ret = clk_prepare_enable(pctrl->clk);
> > +       if (ret) {
> > +               dev_err(pctrl->dev, "failed to enable GPIO clk: %i\n", ret);
> > +               return ret;
> > +       };
> > +
> > +       ret = devm_add_action_or_reset(&pdev->dev, rzg2l_pinctrl_clk_disable, pctrl->clk);
>
> This line is a bit long.
>
> > +       if (ret) {
> > +               dev_err(pctrl->dev, "failed to register pinctrl clk disable devm action, %i\n",
>
> Elsewhere, this is called the "GPIO clk".
> This line is a bit long.
>
agreed.

> > +                       ret);
> > +               return ret;
> > +       }
> > +
> > +       ret = rzg2l_pinctrl_register(pctrl);
> > +       if (ret)
> > +               return ret;
> > +
> > +       dev_info(pctrl->dev, "%s support registered\n", DRV_NAME);
> > +       return 0;
> > +}
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl-for-v5.15, with the above fixed, so no need
> to resend.
>
Thank you.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
