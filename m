Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 830843823DE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 07:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhEQF6v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 01:58:51 -0400
Received: from muru.com ([72.249.23.125]:56466 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229948AbhEQF6u (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 May 2021 01:58:50 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C7C8980CE;
        Mon, 17 May 2021 05:57:37 +0000 (UTC)
Date:   Mon, 17 May 2021 08:57:30 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: single: set pinmux from pins debug file
Message-ID: <YKIFygbbMxqXON8W@atomide.com>
References: <20210516135531.2203-1-dariobin@libero.it>
 <20210516135531.2203-3-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516135531.2203-3-dariobin@libero.it>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

* Dario Binacchi <dariobin@libero.it> [210516 13:55]:
> @@ -331,6 +348,9 @@ static const struct pinctrl_ops pcs_pinctrl_ops = {
>  	.get_group_name = pinctrl_generic_get_group_name,
>  	.get_group_pins = pinctrl_generic_get_group_pins,
>  	.pin_dbg_show = pcs_pin_dbg_show,
> +#if IS_ENABLED(CONFIG_DEVMEM) && IS_ENABLED(CONFIG_SOC_AM33XX)
> +	.pin_dbg_set = pcs_pin_dbg_set,
> +#endif
>  	.dt_node_to_map = pcs_dt_node_to_map,
>  	.dt_free_map = pcs_dt_free_map,
>  };

I don't think there should be any CONFIG_SOC_AM33XX dependency here?

Regards,

Tony
