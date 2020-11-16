Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14DFA2B3CEE
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 07:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgKPGPz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 01:15:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:33036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgKPGPy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Nov 2020 01:15:54 -0500
Received: from sekiro (lfbn-mar-1-625-225.w90-118.abo.wanadoo.fr [90.118.2.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF6A0221F9;
        Mon, 16 Nov 2020 06:15:52 +0000 (UTC)
Date:   Mon, 16 Nov 2020 07:15:49 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linus.walleij@linaro.org, nicolas.ferre@microchip.com,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: at91-pio4: add support for fewer lines on last
 PIO bank
Message-ID: <20201116061549.ks6hfonyplwhknmq@sekiro>
References: <20201113132429.420940-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113132429.420940-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 13, 2020 at 03:24:29PM +0200, Eugen Hristev wrote:
> Some products, like sama7g5, do not have a full last bank of PIO lines.
> In this case for example, sama7g5 only has 8 lines for the PE bank.
> PA0-31, PB0-31, PC0-31, PD0-31, PE0-7, in total 136 lines.
> To cope with this situation, added a data attribute that is product dependent,
> to specify the number of lines of the last bank.
> In case this number is different from the macro ATMEL_PIO_NPINS_PER_BANK,
> adjust the total number of lines accordingly.
> This will avoid advertising 160 lines instead of the actual 136, as this
> product supports, and to avoid reading/writing to invalid register addresses.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks.

> ---
>  drivers/pinctrl/pinctrl-at91-pio4.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
> index 578b387100d9..d267367d94b9 100644
> --- a/drivers/pinctrl/pinctrl-at91-pio4.c
> +++ b/drivers/pinctrl/pinctrl-at91-pio4.c
> @@ -71,8 +71,15 @@
>  /* Custom pinconf parameters */
>  #define ATMEL_PIN_CONFIG_DRIVE_STRENGTH	(PIN_CONFIG_END + 1)
>  
> +/**
> + * struct atmel_pioctrl_data - Atmel PIO controller (pinmux + gpio) data struct
> + * @nbanks: number of PIO banks
> + * @last_bank_count: number of lines in the last bank (can be less than
> + *	the rest of the banks).
> + */
>  struct atmel_pioctrl_data {
>  	unsigned nbanks;
> +	unsigned last_bank_count;
>  };
>  
>  struct atmel_group {
> @@ -980,11 +987,13 @@ static const struct dev_pm_ops atmel_pctrl_pm_ops = {
>   * We can have up to 16 banks.
>   */
>  static const struct atmel_pioctrl_data atmel_sama5d2_pioctrl_data = {
> -	.nbanks		= 4,
> +	.nbanks			= 4,
> +	.last_bank_count	= ATMEL_PIO_NPINS_PER_BANK,
>  };
>  
>  static const struct atmel_pioctrl_data microchip_sama7g5_pioctrl_data = {
> -	.nbanks		= 5,
> +	.nbanks			= 5,
> +	.last_bank_count	= 8, /* sama7g5 has only PE0 to PE7 */
>  };
>  
>  static const struct of_device_id atmel_pctrl_of_match[] = {
> @@ -1025,6 +1034,11 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
>  	atmel_pioctrl_data = match->data;
>  	atmel_pioctrl->nbanks = atmel_pioctrl_data->nbanks;
>  	atmel_pioctrl->npins = atmel_pioctrl->nbanks * ATMEL_PIO_NPINS_PER_BANK;
> +	/* if last bank has limited number of pins, adjust accordingly */
> +	if (atmel_pioctrl_data->last_bank_count != ATMEL_PIO_NPINS_PER_BANK) {
> +		atmel_pioctrl->npins -= ATMEL_PIO_NPINS_PER_BANK;
> +		atmel_pioctrl->npins += atmel_pioctrl_data->last_bank_count;
> +	}
>  
>  	atmel_pioctrl->reg_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(atmel_pioctrl->reg_base))
> -- 
> 2.25.1
> 
