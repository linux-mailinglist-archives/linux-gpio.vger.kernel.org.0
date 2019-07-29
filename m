Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7905878D25
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 15:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbfG2Nqz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 09:46:55 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59229 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbfG2Nqz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 09:46:55 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x6TDklL3027983;
        Mon, 29 Jul 2019 22:46:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x6TDklL3027983
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564408008;
        bh=OXAwzcS+yj3HJ7cjotHiQBWSZMqRmd+eaHeK7a8Qodc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WHIlUFj0Fr6+u9VhwFQ3KKety5ZhLznB8tvxe3Hzcj4JJfy2b1HEi37DLdwA3klVC
         38X2hi96W35jsZK4G33P4ZLpOAokwz7SCeUNUlCBtpEErIPQYv0px9sNPlx10GQ4jV
         uBVDUVmbHLkzR1rLuFun9V8YCBDXc3fix8Q1w8PD1qWlSOPPApcx/RXAWut3N8C5Uy
         CfPzI9f4nAKANV2TMCHUYJF1Q327GZcZkRVBC0p9vy1MsfT8OaWkY2BuWELOLWnf3D
         154mhLKpRxAgdc57Ig8izs4OaqvKIBuufZBzo/zV3q3d5PZ1TCq6VRNntlsAAr49OH
         mlkDfCpl1D7cw==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id v18so23946724uad.12;
        Mon, 29 Jul 2019 06:46:48 -0700 (PDT)
X-Gm-Message-State: APjAAAWaJWtDBBUu73Sn9q4n1U+gMlerYqydL2NottZZGaICI9T5YdVG
        7/76Mhr+yc2SJUb3/jIlyvv9aHWhijI61sM3ylk=
X-Google-Smtp-Source: APXvYqxBnsoC1Jnb//kCLbSm9sQ83FtOlg02dE5xpIz+U7QjTrOwrYvuAX/wOf6r3jwto/ZIARCGREU1Md5zkDRhxOM=
X-Received: by 2002:a9f:2265:: with SMTP id 92mr53903777uad.121.1564408007070;
 Mon, 29 Jul 2019 06:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <1562668156-12927-1-git-send-email-hayashi.kunihiko@socionext.com> <1562668156-12927-6-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1562668156-12927-6-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 29 Jul 2019 22:46:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNARok8dbc3pVgj8VunZCVtLiPf6oE_zL7tNLCe3pfG2nSQ@mail.gmail.com>
Message-ID: <CAK7LNARok8dbc3pVgj8VunZCVtLiPf6oE_zL7tNLCe3pfG2nSQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: uniphier: Fix Pro5 SD pin-mux setting
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
> SD uses the following pins starting from 247:
>     SDCD, SDWP, SDVOLC, SDCLK, SDCMD, SDDAT{0,1,2,3}
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>


Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>




> ---
>  drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
> index 577f12e..22ce0a5 100644
> --- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
> +++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
> @@ -807,7 +807,7 @@ static const unsigned nand_pins[] = {19, 20, 21, 22, 23, 24, 25, 28, 29, 30,
>  static const int nand_muxvals[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
>  static const unsigned nand_cs1_pins[] = {26, 27};
>  static const int nand_cs1_muxvals[] = {0, 0};
> -static const unsigned sd_pins[] = {250, 251, 252, 253, 254, 255, 256, 257, 258};
> +static const unsigned sd_pins[] = {247, 248, 249, 250, 251, 252, 253, 254, 255};
>  static const int sd_muxvals[] = {0, 0, 0, 0, 0, 0, 0, 0, 0};
>  static const unsigned spi0_pins[] = {120, 121, 122, 123};
>  static const int spi0_muxvals[] = {0, 0, 0, 0};
> --
> 2.7.4
>


--
Best Regards
Masahiro Yamada
