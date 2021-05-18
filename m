Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C984387194
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 08:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239251AbhERGGq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 02:06:46 -0400
Received: from muru.com ([72.249.23.125]:56924 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230376AbhERGGo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 May 2021 02:06:44 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5E32D80BA;
        Tue, 18 May 2021 06:05:30 +0000 (UTC)
Date:   Tue, 18 May 2021 09:05:23 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: single: set pinmux from pins debug file
Message-ID: <YKNZIzyO5Q/XGLRs@atomide.com>
References: <20210517200002.6316-1-dariobin@libero.it>
 <20210517200002.6316-3-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517200002.6316-3-dariobin@libero.it>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I noticed few more things I started to wonder about after
looking at this again.

* Dario Binacchi <dariobin@libero.it> [210517 20:00]:
> +static int pcs_pin_dbg_set(struct pinctrl_dev *pctldev, unsigned int pin,
> +			   char *buf)
> +{
> +	struct pcs_device *pcs;
> +	unsigned int val, mux_bytes;
> +
> +	buf = skip_spaces(buf);
> +	if (kstrtouint(buf, 0, &val))
> +		return -EINVAL;
> +
> +	pcs = pinctrl_dev_get_drvdata(pctldev);
> +
> +	mux_bytes = pcs->width / BITS_PER_BYTE;
> +	pcs->write(val, pcs->base + pin * mux_bytes);
> +	return 0;
> +}

Since you're adding a new interface, how about pass unsigned
int val instead of char *buf?

>  static void pcs_dt_free_map(struct pinctrl_dev *pctldev,
>  				struct pinctrl_map *map, unsigned num_maps)
>  {
> @@ -331,6 +348,9 @@ static const struct pinctrl_ops pcs_pinctrl_ops = {
>  	.get_group_name = pinctrl_generic_get_group_name,
>  	.get_group_pins = pinctrl_generic_get_group_pins,
>  	.pin_dbg_show = pcs_pin_dbg_show,
> +#if IS_ENABLED(CONFIG_DEVMEM)
> +	.pin_dbg_set = pcs_pin_dbg_set,
> +#endif
>  	.dt_node_to_map = pcs_dt_node_to_map,
>  	.dt_free_map = pcs_dt_free_map,
>  };

It might be better to always have the .pin_dbg_set around to
avoid the IS_ENABLED(CONFIG_DEVMEM).

Does the new interface need something under Documentation too?

Regards,

Tony
