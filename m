Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD4978D1C
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 15:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfG2Npp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 09:45:45 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:21475 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfG2Npp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 09:45:45 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x6TDjbSu003622;
        Mon, 29 Jul 2019 22:45:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x6TDjbSu003622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564407938;
        bh=VgyZn3U//MF81+efTBgICKWVreWt1CvUqxcn1hoetTk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WMpj5QHm204O3U+89kXdV12RJuUmyFrXLLwtFg1BqtzyiWvx6U0DfhxRTMC7UVH8f
         togauNYEunYBm4lYQXOzHAlGN+zdiAuIrtt8SfYcD7Q9Mu+Sa6EbsyuB8ErgxouXm4
         t+w8NlvbXjS0revQmaH4UUFAgwegwfRSIzkZwKfmLRF+pZrLYvAAzmQTDFsZvzatLe
         6/j9aeko2Teh1a48/B8FqeYvCWTsjDT000bqtxa3mIYVm3NP+eo769YO0em3TsijO/
         iBvzVfYw4NZ5TElrX9PNHXIhWSai3D75T0b3iww/qDTiQd9+D0MrcruEpyefllGHkG
         /pyfc0HcvqXIA==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id 2so40735612vso.8;
        Mon, 29 Jul 2019 06:45:38 -0700 (PDT)
X-Gm-Message-State: APjAAAVBBw1kJtUkW1UG0Z4tB+R5Mkps8I7jq20Spp51yVtqNlETBZTR
        byx5ycG8d+4OiYrATOi+3HtCRe5q7xke+bXsT3s=
X-Google-Smtp-Source: APXvYqyWqVnFLVPX2fs2nTxoZNXWls7FMCZA5Ra7eHohioGPq4IsN5YgV/jZAXcrkKhi2YSN4Ac0V99EijZxcoVeB30=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr67298701vsl.155.1564407937090;
 Mon, 29 Jul 2019 06:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <1562668156-12927-1-git-send-email-hayashi.kunihiko@socionext.com> <1562668156-12927-2-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1562668156-12927-2-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 29 Jul 2019 22:45:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNARTjBH=bWz3AjTrw2ySVziAH-f4uaYcu51E-ZXk-5zskQ@mail.gmail.com>
Message-ID: <CAK7LNARTjBH=bWz3AjTrw2ySVziAH-f4uaYcu51E-ZXk-5zskQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: uniphier: Separate modem group from UART
 ctsrts group
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 9, 2019 at 7:29 PM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> It depends on the board implementation whether to have each pins of
> CTS/RTS, and others for modem. So it is necessary to divide current
> uart_ctsrts group into uart_ctsrts and uart_modem groups.
>
> Since the number of implemented pins for modem differs depending
> on SoC, each uart_modem group also has a different number of pins.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---

> diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
> index 414ff3a..d1ed5b7 100644
> --- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
> +++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
> @@ -780,8 +780,10 @@ static const unsigned system_bus_cs5_pins[] = {55};
>  static const int system_bus_cs5_muxvals[] = {6};
>  static const unsigned uart0_pins[] = {135, 136};
>  static const int uart0_muxvals[] = {3, 3};
> -static const unsigned uart0_ctsrts_pins[] = {137, 138, 139, 140, 141, 124};
> -static const int uart0_ctsrts_muxvals[] = {3, 3, 3, 3, 3, 3};
> +static const unsigned uart0_ctsrts_pins[] = {137, 139};
> +static const int uart0_ctsrts_muxvals[] = {3, 3};
> +static const unsigned uart0_modem_pins[] = {138, 140, 141, 124};

Please sort this array
while you are here.

Otherwise, looks good to me.






--
Best Regards
Masahiro Yamada
