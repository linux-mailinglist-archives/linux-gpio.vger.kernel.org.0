Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 590D5463A6F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 16:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243254AbhK3PqV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Nov 2021 10:46:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242762AbhK3PqG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Nov 2021 10:46:06 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51126C061763
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 07:42:31 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bu18so54965379lfb.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 07:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3BR7hOfrZU5BLrILn7SjH/zgKfBPjj6UDPHMgMpgom8=;
        b=DUc0FOzRm7dRuC+cBWtQBMgfNccTuyOlgJIqfMMbxXXplx1F7UCPr9b3UsEK+HAlQ/
         JkLZRCjIqOWfztTcXX7hzZ3G25gsx2Kvptl7oKXvrfywJzlURRqLg7a3Rw1wPnjB52lu
         x69YeunIj95F13hsHjMlJoB6LE5H/46MrWRcukUMwn9Zq3HhrDG32SKQ55KK9GJ1cIaf
         X88TKNsTSwCPqohes+XxWyCgFGfC5SWzd4BPDIVxMMWhSnVWD4JYCI6M+eTOx+q2NeDJ
         BtEpxIOksIK79Ls6ThbOWsQ7LGGv13XjcxlI6JNzyo/fKPm6Cdz9g/mmjPX6owYkyBPq
         +ivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3BR7hOfrZU5BLrILn7SjH/zgKfBPjj6UDPHMgMpgom8=;
        b=w87bLikREtXEsfq7t5asBw6XUT49YCA4TmOz46qvJa95unqTQSWO35a7u1V741u5GM
         4GE7juEv/LOCHNZrT5G/TxCIQU6csKs8Rx6qDPWdQgFsoQd9a+6JhVY2NLNjQstsDxv3
         DpZjZ1UzwPtRfWiL/HK23xENC04DKLlJE8eEo+gfNRz7WeFNImfsTlQgtlZor5Z2NwPs
         DYviqEP7RBJ777SqEDmIMCypDA5GFEfxC0qS7XzDSdCisupqbnZff/OUBabo2Y476vrs
         y+pNMZ6wWi1Bm2CXI5le2ohc1qpwUOHfhPv92SCM1pT0zwHZdLzmsW/YmIFs2MtpHt+u
         fbcA==
X-Gm-Message-State: AOAM531+pzB9eG9za1spQQ8b4uddR2psLDujPelBA/lz3Livl1FrLVy6
        lpXoPbBxzBT+v4XOtlKH4z5HypngxY2+wzcawM6C+g==
X-Google-Smtp-Source: ABdhPJxC4zWXmedOcmpEm0bfpRKItjopzS1RjY1QxCV3VEacaM6KDFcN4qGG64b0icX1eQf5MVEa6XMx1dC4FSgRIL0=
X-Received: by 2002:a05:6512:10c4:: with SMTP id k4mr55168022lfg.373.1638286949602;
 Tue, 30 Nov 2021 07:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-12-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-12-Mr.Bossman075@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 30 Nov 2021 16:41:53 +0100
Message-ID: <CAPDyKFqNghVZYdtR8dACGvqAyy9xC8LWnbg6Sq+EGRmv2g5P+A@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        Kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 25 Nov 2021 at 22:15, Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> Add support for i.MXRT1050's sdhc.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Rename imxrt to imxrt1050
> * Remove BROKEN_AUTO_CMD23 and MAN_TUNING flags
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 764ee1b761d9..55981b0f0b10 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -305,6 +305,9 @@ static struct esdhc_soc_data usdhc_imx7ulp_data = {
>                         | ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
>                         | ESDHC_FLAG_STATE_LOST_IN_LPMODE,
>  };
> +static struct esdhc_soc_data usdhc_imxrt1050_data = {
> +       .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_HS200 | ESDHC_FLAG_ERR004536,
> +};
>
>  static struct esdhc_soc_data usdhc_imx8qxp_data = {
>         .flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
> @@ -355,6 +358,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>         { .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
>         { .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
>         { .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
> +       { .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
>         { .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
>         { /* sentinel */ }
>  };
> --
> 2.34.0
>
