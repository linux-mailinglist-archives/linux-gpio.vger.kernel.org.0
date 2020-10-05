Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3B0284236
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 23:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgJEVje (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 17:39:34 -0400
Received: from mo-csw1116.securemx.jp ([210.130.202.158]:49318 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbgJEVje (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 17:39:34 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 095LdNsH001905; Tue, 6 Oct 2020 06:39:24 +0900
X-Iguazu-Qid: 2wHHD8Mc11nAaW7xS4
X-Iguazu-QSIG: v=2; s=0; t=1601933963; q=2wHHD8Mc11nAaW7xS4; m=7f25MoKqdZ3HZEJCZTZtQKDhX5Pv9dJwOq2cngcRJ2k=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1112) id 095LdM2Y008188;
        Tue, 6 Oct 2020 06:39:23 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 095LdMX3026631;
        Tue, 6 Oct 2020 06:39:22 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 095LdMfn031406;
        Tue, 6 Oct 2020 06:39:22 +0900
Date:   Tue, 6 Oct 2020 06:39:21 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: visconti: PINCTRL_TMPV7700 should depend on
 ARCH_VISCONTI
X-TSB-HOP: ON
Message-ID: <20201005213921.xjjhmyr7c25mul64@toshiba.co.jp>
References: <20201005125049.26926-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005125049.26926-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Mon, Oct 05, 2020 at 02:50:49PM +0200, Geert Uytterhoeven wrote:
> The Toshiba Visconti TMPV7700 series pin controller is only present on
> Visconti SoCs.  Hence add a dependency on ARCH_VISCONTI, to prevent
> asking the user about this driver when configuring a kernel without
> Visconti platform support.
> 
> Fixes: a68a7844264e4fb9 ("pinctrl: visconti: Add Toshiba Visconti SoCs pinctrl support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for your fixing.

Acked-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

Best regards,
  Nobuhiro

> ---
>  drivers/pinctrl/visconti/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/visconti/Kconfig b/drivers/pinctrl/visconti/Kconfig
> index 198ec33189cc4706..42653fc60413d203 100644
> --- a/drivers/pinctrl/visconti/Kconfig
> +++ b/drivers/pinctrl/visconti/Kconfig
> @@ -9,6 +9,6 @@ config PINCTRL_VISCONTI
>  config PINCTRL_TMPV7700
>  	bool "Toshiba Visconti TMPV7700 series pinctrl driver"
>  	depends on OF
> -	depends on ARM64 || COMPILE_TEST
> +	depends on ARCH_VISCONTI || COMPILE_TEST
>  	select PINCTRL_VISCONTI
> -	default ARM64 && ARCH_VISCONTI
> +	default ARCH_VISCONTI
> -- 
> 2.17.1
> 
> 
