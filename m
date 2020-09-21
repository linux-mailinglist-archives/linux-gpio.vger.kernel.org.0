Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F04271ADD
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 08:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgIUG1M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 02:27:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:51166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgIUG1M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Sep 2020 02:27:12 -0400
Received: from sekiro (amontpellier-556-1-154-164.w109-210.abo.wanadoo.fr [109.210.130.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5FF420739;
        Mon, 21 Sep 2020 06:27:10 +0000 (UTC)
Date:   Mon, 21 Sep 2020 08:27:07 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: at91-pio4: add support for sama7g5 SoC
Message-ID: <20200921062707.s3s7nsws4ddddgy5@sekiro>
References: <20200917131257.273882-1-eugen.hristev@microchip.com>
 <20200917131257.273882-2-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917131257.273882-2-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 04:12:57PM +0300, Eugen Hristev wrote:
> Add support for sama7g5 pinctrl block, which has 5 PIO banks.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks.

Ludovic

> ---
>  drivers/pinctrl/pinctrl-at91-pio4.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
> index 1c852293cb96..9f62152d0a62 100644
> --- a/drivers/pinctrl/pinctrl-at91-pio4.c
> +++ b/drivers/pinctrl/pinctrl-at91-pio4.c
> @@ -999,10 +999,17 @@ static const struct atmel_pioctrl_data atmel_sama5d2_pioctrl_data = {
>  	.nbanks		= 4,
>  };
>  
> +static const struct atmel_pioctrl_data microchip_sama7g5_pioctrl_data = {
> +	.nbanks		= 5,
> +};
> +
>  static const struct of_device_id atmel_pctrl_of_match[] = {
>  	{
>  		.compatible = "atmel,sama5d2-pinctrl",
>  		.data = &atmel_sama5d2_pioctrl_data,
> +	}, {
> +		.compatible = "microchip,sama7g5-pinctrl",
> +		.data = &microchip_sama7g5_pioctrl_data,
>  	}, {
>  		/* sentinel */
>  	}
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
