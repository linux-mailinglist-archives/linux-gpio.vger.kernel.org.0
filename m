Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46ACF30579C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233780AbhA0J7u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 04:59:50 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:46626 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235375AbhA0J5r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 04:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611741467; x=1643277467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WshbbaJKOkSgbhjPNtWUg/gvrUfOxssVO0lwbOnRs0U=;
  b=JoUyhLRceTDCmyDXNeRntVFErrqVnjtvxPf/F2aVq7AkBsgj4rRjvxw6
   kvSEkA+220mHdS98fuuFHcFaehtqgGrSoX9bw5XotsRTl8+T5AgeaCFAs
   hq+depeXi+50uUdj+VimoiiN2/mq6siohz3phhrXk4OuZ8qx4XOZyxXIM
   1CVrOjMX+lyJ6g3+ByRCsCOzO1ddb2DJTyUyLzbySHO11X6MhODjqDSTq
   oDDUm6eKA59b2+602zbDUBV3ySmMwCWa5StS9RvwdJdRpmL/fevaUhLy2
   GzdlWtGVVsg1e/DU1poNwV4/MaZIPqJp1E6QFUXE1HCisabbGTCljxSyL
   w==;
IronPort-SDR: BU6h3AF87XHcTVnRstLp9EVxHEfxKtYM8Gr5mbz25aMwVDbsllGEGaC5UvkuRSO9Dlrb+zrB9D
 nYpCR2eBtVfoqn2S/J84RR02k7himJR6VeNQQqnYrIyHtDKNIy3NwYot414R1ElwlKzXoi19sT
 pgE9cb839WQNHd44nJvxfR1tg32bJeMLVSGemzVF+xVDJEECiqKbSTgI9fKsknhKWnH7s13loG
 WlriTLPzQmMRnMOg+FBqCzcQ4O1CHEJKXfPDB6+ru1dJqVGjkT7QcBctST4UDHo95pPZWAruxw
 wEM=
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="106952986"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2021 02:56:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 27 Jan 2021 02:56:30 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Wed, 27 Jan 2021 02:56:30 -0700
Date:   Wed, 27 Jan 2021 10:56:29 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
CC:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] pinctrl: at91-pio4: add support for slew-rate
Message-ID: <20210127095629.ahfp6llqjzhhafyd@sekiro>
References: <1611569954-23279-1-git-send-email-claudiu.beznea@microchip.com>
 <1611569954-23279-3-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1611569954-23279-3-git-send-email-claudiu.beznea@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2021 at 12:19:13PM +0200, Claudiu Beznea wrote:
> SAMA7G5 supports slew rate configuration. Adapt the driver for this.
> For switching frequencies lower than 50MHz the slew rate needs to
> be enabled. Since most of the pins on SAMA7G5 fall into this category
> enabled the slew rate by default.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  drivers/pinctrl/pinctrl-at91-pio4.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
> index d267367d94b9..c59ab0bfb945 100644
> --- a/drivers/pinctrl/pinctrl-at91-pio4.c
> +++ b/drivers/pinctrl/pinctrl-at91-pio4.c
> @@ -36,6 +36,7 @@
>  #define		ATMEL_PIO_DIR_MASK		BIT(8)
>  #define		ATMEL_PIO_PUEN_MASK		BIT(9)
>  #define		ATMEL_PIO_PDEN_MASK		BIT(10)
> +#define		ATMEL_PIO_SR_MASK		BIT(11)
>  #define		ATMEL_PIO_IFEN_MASK		BIT(12)
>  #define		ATMEL_PIO_IFSCEN_MASK		BIT(13)
>  #define		ATMEL_PIO_OPD_MASK		BIT(14)
> @@ -76,10 +77,12 @@
>   * @nbanks: number of PIO banks
>   * @last_bank_count: number of lines in the last bank (can be less than
>   *	the rest of the banks).
> + * @sr: slew rate support
>   */
>  struct atmel_pioctrl_data {
>  	unsigned nbanks;
>  	unsigned last_bank_count;
> +	unsigned int sr;

Hi Claudiu,

Nitpicking: I tend to prefer a verbose name as slew_rate or even
slew_rate_support.

Otherwise,
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Regards

Ludovic

>  };
>  
>  struct atmel_group {
> @@ -117,6 +120,7 @@ struct atmel_pin {
>   * @pm_suspend_backup: backup/restore register values on suspend/resume
>   * @dev: device entry for the Atmel PIO controller.
>   * @node: node of the Atmel PIO controller.
> + * @sr: slew rate support
>   */
>  struct atmel_pioctrl {
>  	void __iomem		*reg_base;
> @@ -138,6 +142,7 @@ struct atmel_pioctrl {
>  	} *pm_suspend_backup;
>  	struct device		*dev;
>  	struct device_node	*node;
> +	unsigned int		sr;
>  };
>  
>  static const char * const atmel_functions[] = {
> @@ -760,6 +765,13 @@ static int atmel_conf_pin_config_group_get(struct pinctrl_dev *pctldev,
>  			return -EINVAL;
>  		arg = 1;
>  		break;
> +	case PIN_CONFIG_SLEW_RATE:
> +		if (!atmel_pioctrl->sr)
> +			return -EOPNOTSUPP;
> +		if (!(res & ATMEL_PIO_SR_MASK))
> +			return -EINVAL;
> +		arg = 1;
> +		break;
>  	case ATMEL_PIN_CONFIG_DRIVE_STRENGTH:
>  		if (!(res & ATMEL_PIO_DRVSTR_MASK))
>  			return -EINVAL;
> @@ -793,6 +805,10 @@ static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
>  		dev_dbg(pctldev->dev, "%s: pin=%u, config=0x%lx\n",
>  			__func__, pin_id, configs[i]);
>  
> +		/* Keep slew rate enabled by default. */
> +		if (atmel_pioctrl->sr)
> +			conf |= ATMEL_PIO_SR_MASK;
> +
>  		switch (param) {
>  		case PIN_CONFIG_BIAS_DISABLE:
>  			conf &= (~ATMEL_PIO_PUEN_MASK);
> @@ -850,6 +866,13 @@ static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
>  					ATMEL_PIO_SODR);
>  			}
>  			break;
> +		case PIN_CONFIG_SLEW_RATE:
> +			if (!atmel_pioctrl->sr)
> +				break;
> +			/* And remove it if explicitly requested. */
> +			if (arg == 0)
> +				conf &= ~ATMEL_PIO_SR_MASK;
> +			break;
>  		case ATMEL_PIN_CONFIG_DRIVE_STRENGTH:
>  			switch (arg) {
>  			case ATMEL_PIO_DRVSTR_LO:
> @@ -901,6 +924,8 @@ static void atmel_conf_pin_config_dbg_show(struct pinctrl_dev *pctldev,
>  		seq_printf(s, "%s ", "open-drain");
>  	if (conf & ATMEL_PIO_SCHMITT_MASK)
>  		seq_printf(s, "%s ", "schmitt");
> +	if (atmel_pioctrl->sr && (conf & ATMEL_PIO_SR_MASK))
> +		seq_printf(s, "%s ", "slew-rate");
>  	if (conf & ATMEL_PIO_DRVSTR_MASK) {
>  		switch ((conf & ATMEL_PIO_DRVSTR_MASK) >> ATMEL_PIO_DRVSTR_OFFSET) {
>  		case ATMEL_PIO_DRVSTR_ME:
> @@ -994,6 +1019,7 @@ static const struct atmel_pioctrl_data atmel_sama5d2_pioctrl_data = {
>  static const struct atmel_pioctrl_data microchip_sama7g5_pioctrl_data = {
>  	.nbanks			= 5,
>  	.last_bank_count	= 8, /* sama7g5 has only PE0 to PE7 */
> +	.sr			= 1,
>  };
>  
>  static const struct of_device_id atmel_pctrl_of_match[] = {
> @@ -1039,6 +1065,7 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
>  		atmel_pioctrl->npins -= ATMEL_PIO_NPINS_PER_BANK;
>  		atmel_pioctrl->npins += atmel_pioctrl_data->last_bank_count;
>  	}
> +	atmel_pioctrl->sr = atmel_pioctrl_data->sr;
>  
>  	atmel_pioctrl->reg_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(atmel_pioctrl->reg_base))
> -- 
> 2.7.4
> 
