Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFAE420092B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2020 14:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732775AbgFSM6x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jun 2020 08:58:53 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33416 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732765AbgFSM6v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2020 08:58:51 -0400
Received: by mail-oi1-f193.google.com with SMTP id i74so8367827oib.0;
        Fri, 19 Jun 2020 05:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GLGWXGdvLEqy2ag59xbzqTnELkRbK3aCBxLiaPQPTbY=;
        b=XVUKKnLRbvTL1z5+Vgdt64lcfcYv6hx3bZxBxoYfWs4MMpD6AVGYQgfro6PUxFRnt8
         QJjS9UI9pz/aVaHsUV/t3HvEQv5XrVvVU8mbh7Lpfdj/eWa2OobU0xXkENMIx0C1TKjB
         XGcQm7sanx9dUdVqmp75r7bX/MZPIDBLnCXuggXGyq3qvFxuPIuXW7HID04eafjuv/K5
         OCOt8EmF9E4ZHKUu090uynlg8ea/1/it30vAS0ax/sCBK0QiIL9MeqzlvMlQtSJ0bEcC
         uhb0FfMvdfFUHgI45xOxUDI7QgDuImIFZOMumvx5iREOcqBZqAFNOXWNMep1pfyUJ3wd
         YutA==
X-Gm-Message-State: AOAM532dMRYAys0FnH/BRZa/0L4XTZl5b2tQ73UUJJJDcoN/bKeF4V+X
        mLIU0RfRQ/Nl7Z0oLVfUa1pGN7crIBoPr3sG68s=
X-Google-Smtp-Source: ABdhPJzIBrBQh6qipWEvurguOD7EHarsROaYJOE8TXHghjCkr/O6DoWIUs6xxOqZoSWzQT7sI37TXrnxeXOe5/U7Qsw=
X-Received: by 2002:aca:1a19:: with SMTP id a25mr2941174oia.54.1592571530217;
 Fri, 19 Jun 2020 05:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com> <d3907b56-e346-f246-694e-6088d060bd27@cogentembedded.com>
In-Reply-To: <d3907b56-e346-f246-694e-6088d060bd27@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Jun 2020 14:58:39 +0200
Message-ID: <CAMuHMdV=f7iUA+SV72C++xjWQjxh=fwt+JWCU=R6TQQht-qOKQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: add RPC pins, groups, and functions
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sergei,

On Thu, Jun 18, 2020 at 9:46 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Subject: pinctrl: sh-pfc: r8a77970: Add RPC pins, groups, and functions
>
> Add the RPC pins/groups/functions to the R8A77970 PFC driver.
> They can be used if an Octal-SPI flash or HyperFlash is connected.
>
> Based on the patch by Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> --- renesas-drivers.orig/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> +++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> @@ -1416,6 +1416,64 @@ static const unsigned int qspi1_data4_mu
>         QSPI1_IO2_MARK, QSPI1_IO3_MARK
>  };
>
> +/* - RPC -------------------------------------------------------------------- */
> +static const unsigned int rpc_clk1_pins[] = {
> +       /* Octal-SPI flash: C/SCLK */
> +       RCAR_GP_PIN(5, 0),
> +};
> +static const unsigned int rpc_clk1_mux[] = {
> +       QSPI0_SPCLK_MARK,
> +};
> +static const unsigned int rpc_clk2_pins[] = {
> +       /* HyperFlash: CK, CK# */
> +       RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 6),
> +};
> +static const unsigned int rpc_clk2_mux[] = {
> +       QSPI0_SPCLK_MARK, QSPI1_SPCLK_MARK,
> +};
> +static const unsigned int rpc_ctrl_pins[] = {
> +       /* Octal-SPI flash: S#/CS, DQS */
> +       /* HyperFlash: CS#, RDS */
> +       RCAR_GP_PIN(5, 5), RCAR_GP_PIN(5, 11),
> +};
> +static const unsigned int rpc_ctrl_mux[] = {
> +       QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,

Shouldn't the above read

    QSPI0_SSL_MARK, QSPI1_SSL_MARK,

?

I seem to have overlooked the same issue in commit aa2165cf2ece9176
("pinctrl: sh-pfc: r8a77980: Add RPC pins, groups, and functions") in
sh-pfc-for-v5.9, which I can fix myself.

With the above sorted out:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
and will queue in sh-pfc-for-v5.9 after fixing.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
