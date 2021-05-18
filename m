Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E446238719C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 08:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344580AbhERGJi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 02:09:38 -0400
Received: from muru.com ([72.249.23.125]:56942 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343548AbhERGJi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 May 2021 02:09:38 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E2B6C80BA;
        Tue, 18 May 2021 06:08:23 +0000 (UTC)
Date:   Tue, 18 May 2021 09:08:16 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] pinctrl: single: config: enable the pin's input
Message-ID: <YKNZ0A7umnk4LwKU@atomide.com>
References: <20210514163818.12178-1-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514163818.12178-1-dariobin@libero.it>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Dario Binacchi <dariobin@libero.it> [210514 16:38]:
> It enables / disables the input buffer. As explained in the description
> of 'enum pin_config_param' this does not affect the pin's ability to
> drive output.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
> 
>  drivers/pinctrl/pinctrl-single.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index 2c9c9835f375..4e7cdb9ee855 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -534,6 +534,7 @@ static int pcs_pinconf_get(struct pinctrl_dev *pctldev,
>  		case PIN_CONFIG_DRIVE_STRENGTH:
>  		case PIN_CONFIG_SLEW_RATE:
>  		case PIN_CONFIG_MODE_LOW_POWER:
> +		case PIN_CONFIG_INPUT_ENABLE:
>  		default:
>  			*config = data;
>  			break;
> @@ -572,6 +573,7 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
>  			case PIN_CONFIG_DRIVE_STRENGTH:
>  			case PIN_CONFIG_SLEW_RATE:
>  			case PIN_CONFIG_MODE_LOW_POWER:
> +			case PIN_CONFIG_INPUT_ENABLE:
>  				shift = ffs(func->conf[i].mask) - 1;
>  				data &= ~func->conf[i].mask;
>  				data |= (arg << shift) & func->conf[i].mask;
> @@ -918,6 +920,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
>  	static const struct pcs_conf_type prop2[] = {
>  		{ "pinctrl-single,drive-strength", PIN_CONFIG_DRIVE_STRENGTH, },
>  		{ "pinctrl-single,slew-rate", PIN_CONFIG_SLEW_RATE, },
> +		{ "pinctrl-single,input-enable", PIN_CONFIG_INPUT_ENABLE, },
>  		{ "pinctrl-single,input-schmitt", PIN_CONFIG_INPUT_SCHMITT, },
>  		{ "pinctrl-single,low-power-mode", PIN_CONFIG_MODE_LOW_POWER, },
>  	};

Looks OK to me if this works for Linus W. You need another patch to
update the binding though:

Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml

Or if there is such a patch floating around, I was not in Cc :)

Regards,

Tony
