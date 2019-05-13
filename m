Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54DD31B22C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 11:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbfEMJAb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 05:00:31 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:38115
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727401AbfEMJAb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 May 2019 05:00:31 -0400
X-IronPort-AV: E=Sophos;i="5.60,465,1549926000"; 
   d="scan'208";a="305784263"
Received: from vaio-julia.rsr.lip6.fr ([132.227.76.33])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 May 2019 11:00:01 +0200
Date:   Mon, 13 May 2019 10:59:57 +0200 (CEST)
From:   Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To:     Amelie Delaunay <amelie.delaunay@st.com>
cc:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, kbuild-all@01.org,
        Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH] pinctrl: stmfx: Fix comparison of unsigned expression
 warnings
In-Reply-To: <1557732606-14662-1-git-send-email-amelie.delaunay@st.com>
Message-ID: <alpine.DEB.2.20.1905131059440.3616@hadrien>
References: <1557732606-14662-1-git-send-email-amelie.delaunay@st.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Mon, 13 May 2019, Amelie Delaunay wrote:

> This patch fixes the following warnings:
>
> drivers/pinctrl/pinctrl-stmfx.c:225:5-8: WARNING: Unsigned expression
> compared with zero: dir < 0
> drivers/pinctrl/pinctrl-stmfx.c:231:5-9: WARNING: Unsigned expression
> compared with zero: pupd < 0
> drivers/pinctrl/pinctrl-stmfx.c:228:5-9: WARNING: Unsigned expression
> compared with zero: type < 0
>
> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Acked-by: Julia Lawall <julia.lawall@lip6.fr>


> ---
>  drivers/pinctrl/pinctrl-stmfx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index bcd8126..3bd5d6f 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -213,7 +213,7 @@ static int stmfx_pinconf_get(struct pinctrl_dev *pctldev,
>  	struct stmfx_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
>  	u32 param = pinconf_to_config_param(*config);
>  	struct pinctrl_gpio_range *range;
> -	u32 dir, type, pupd;
> +	int dir, type, pupd;
>  	u32 arg = 0;
>  	int ret;
>
> --
> 2.7.4
>
>
