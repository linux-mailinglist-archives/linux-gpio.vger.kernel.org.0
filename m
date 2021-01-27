Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0F73057A1
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbhA0KAf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 05:00:35 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:46697 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234890AbhA0J6c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 04:58:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611741512; x=1643277512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LqoaiBt2oEgRB1eUsLEn3PuWQU6NTrIIwJA/1kAe2TU=;
  b=xbBUVJmz0eIsfFw0Ce+zdcuubK/LxpSm4SzlHbm+CCghFtv0Cv0zenlg
   7uY476ve2tnYNT3ooN6F7nBKWXh+HD1YMQXWKc9ZpGqkepQfktXp6dJhj
   rz0f/kRlYxEbwyCLe429Lr/wHu4XwavvrW7MxlVptbuc9HdHnBNNIEvHm
   jwuQgOtvhaCOUtg1BkgZuHcANZrGrxSbtnC2E66c1PdqJr3kfleLJQbqH
   zg779000zKbLfYINHl0PCgWcO98efQkURAf46TF02ZPPC8jxwTsycmYlL
   vWSBguxQWgXWlh4FPE1jKaVByTSO0eyKOr0hU96Vm8EyAOSE7Ys3nnrLt
   A==;
IronPort-SDR: +TJgHSOR6JCKgYTjsuwc0WzsRs1A0W0l5/FQNapNDbSQQFCa/FsZE7RHzWG245rqi5W0Acg9WZ
 k8LEPCa/eGMAxLBii3UsiGfnzVdusWBCITkGYwJr9SQTB90ii9CZAVZO47T9C9RJGjQXPDMaBX
 9lnk9n0sfq7EcRsSrA1+NxIqv0enzrMAyYJg/0NX4HD7SdOpurAUUHtZtJzdpu+1drxrS8y2kP
 Q/bhbkY6fBggvc/d1ngbdemVqXXgoqN1qwU//Kp8j2N5lxym4B3uUk+wae11mEeJE6Q40H+6z1
 x10=
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="106953025"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2021 02:57:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 27 Jan 2021 02:57:16 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Wed, 27 Jan 2021 02:57:15 -0700
Date:   Wed, 27 Jan 2021 10:57:14 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
CC:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] pinctrl: at91-pio4: fix "Prefer 'unsigned int' to
 bare use of 'unsigned'"
Message-ID: <20210127095714.ufcmewk76fuzfj4d@sekiro>
References: <1611569954-23279-1-git-send-email-claudiu.beznea@microchip.com>
 <1611569954-23279-4-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1611569954-23279-4-git-send-email-claudiu.beznea@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2021 at 12:19:14PM +0200, Claudiu Beznea wrote:
> Fix "Prefer 'unsigned int' to bare use of 'unsigned'" checkpatch.pl
> warning.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com> 

Thanks

> ---
>  drivers/pinctrl/pinctrl-at91-pio4.c | 110 +++++++++++++++++++-----------------
>  1 file changed, 57 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
> index c59ab0bfb945..0206cbfcbebb 100644
> --- a/drivers/pinctrl/pinctrl-at91-pio4.c
> +++ b/drivers/pinctrl/pinctrl-at91-pio4.c
> @@ -80,8 +80,8 @@
>   * @sr: slew rate support
>   */
>  struct atmel_pioctrl_data {
> -	unsigned nbanks;
> -	unsigned last_bank_count;
> +	unsigned int nbanks;
> +	unsigned int last_bank_count;
>  	unsigned int sr;
>  };
>  
> @@ -91,11 +91,11 @@ struct atmel_group {
>  };
>  
>  struct atmel_pin {
> -	unsigned pin_id;
> -	unsigned mux;
> -	unsigned ioset;
> -	unsigned bank;
> -	unsigned line;
> +	unsigned int pin_id;
> +	unsigned int mux;
> +	unsigned int ioset;
> +	unsigned int bank;
> +	unsigned int line;
>  	const char *device;
>  };
>  
> @@ -125,16 +125,16 @@ struct atmel_pin {
>  struct atmel_pioctrl {
>  	void __iomem		*reg_base;
>  	struct clk		*clk;
> -	unsigned		nbanks;
> +	unsigned int		nbanks;
>  	struct pinctrl_dev	*pinctrl_dev;
>  	struct atmel_group	*groups;
>  	const char * const	*group_names;
>  	struct atmel_pin	**pins;
> -	unsigned		npins;
> +	unsigned int		npins;
>  	struct gpio_chip	*gpio_chip;
>  	struct irq_domain	*irq_domain;
>  	int			*irqs;
> -	unsigned		*pm_wakeup_sources;
> +	unsigned int		*pm_wakeup_sources;
>  	struct {
>  		u32		imr;
>  		u32		odsr;
> @@ -177,11 +177,11 @@ static void atmel_gpio_irq_ack(struct irq_data *d)
>  	 */
>  }
>  
> -static int atmel_gpio_irq_set_type(struct irq_data *d, unsigned type)
> +static int atmel_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = irq_data_get_irq_chip_data(d);
>  	struct atmel_pin *pin = atmel_pioctrl->pins[d->hwirq];
> -	unsigned reg;
> +	unsigned int reg;
>  
>  	atmel_gpio_write(atmel_pioctrl, pin->bank, ATMEL_PIO_MSKR,
>  			 BIT(pin->line));
> @@ -268,7 +268,7 @@ static struct irq_chip atmel_gpio_irq_chip = {
>  	.irq_set_wake	= atmel_gpio_irq_set_wake,
>  };
>  
> -static int atmel_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
> +static int atmel_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
>  
> @@ -316,11 +316,12 @@ static void atmel_gpio_irq_handler(struct irq_desc *desc)
>  	chained_irq_exit(chip, desc);
>  }
>  
> -static int atmel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
> +static int atmel_gpio_direction_input(struct gpio_chip *chip,
> +				      unsigned int offset)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
>  	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
> -	unsigned reg;
> +	unsigned int reg;
>  
>  	atmel_gpio_write(atmel_pioctrl, pin->bank, ATMEL_PIO_MSKR,
>  			 BIT(pin->line));
> @@ -331,11 +332,11 @@ static int atmel_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
>  	return 0;
>  }
>  
> -static int atmel_gpio_get(struct gpio_chip *chip, unsigned offset)
> +static int atmel_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
>  	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
> -	unsigned reg;
> +	unsigned int reg;
>  
>  	reg = atmel_gpio_read(atmel_pioctrl, pin->bank, ATMEL_PIO_PDSR);
>  
> @@ -369,12 +370,13 @@ static int atmel_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
>  	return 0;
>  }
>  
> -static int atmel_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
> +static int atmel_gpio_direction_output(struct gpio_chip *chip,
> +				       unsigned int offset,
>  				       int value)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
>  	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
> -	unsigned reg;
> +	unsigned int reg;
>  
>  	atmel_gpio_write(atmel_pioctrl, pin->bank,
>  			 value ? ATMEL_PIO_SODR : ATMEL_PIO_CODR,
> @@ -389,7 +391,7 @@ static int atmel_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
>  	return 0;
>  }
>  
> -static void atmel_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
> +static void atmel_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
>  	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
> @@ -445,11 +447,11 @@ static struct gpio_chip atmel_gpio_chip = {
>  
>  /* --- PINCTRL --- */
>  static unsigned int atmel_pin_config_read(struct pinctrl_dev *pctldev,
> -					  unsigned pin_id)
> +					  unsigned int pin_id)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
> -	unsigned bank = atmel_pioctrl->pins[pin_id]->bank;
> -	unsigned line = atmel_pioctrl->pins[pin_id]->line;
> +	unsigned int bank = atmel_pioctrl->pins[pin_id]->bank;
> +	unsigned int line = atmel_pioctrl->pins[pin_id]->line;
>  	void __iomem *addr = atmel_pioctrl->reg_base
>  			     + bank * ATMEL_PIO_BANK_OFFSET;
>  
> @@ -461,11 +463,11 @@ static unsigned int atmel_pin_config_read(struct pinctrl_dev *pctldev,
>  }
>  
>  static void atmel_pin_config_write(struct pinctrl_dev *pctldev,
> -				   unsigned pin_id, u32 conf)
> +				   unsigned int pin_id, u32 conf)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
> -	unsigned bank = atmel_pioctrl->pins[pin_id]->bank;
> -	unsigned line = atmel_pioctrl->pins[pin_id]->line;
> +	unsigned int bank = atmel_pioctrl->pins[pin_id]->bank;
> +	unsigned int line = atmel_pioctrl->pins[pin_id]->line;
>  	void __iomem *addr = atmel_pioctrl->reg_base
>  			     + bank * ATMEL_PIO_BANK_OFFSET;
>  
> @@ -483,7 +485,7 @@ static int atmel_pctl_get_groups_count(struct pinctrl_dev *pctldev)
>  }
>  
>  static const char *atmel_pctl_get_group_name(struct pinctrl_dev *pctldev,
> -					     unsigned selector)
> +					     unsigned int selector)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
>  
> @@ -491,19 +493,20 @@ static const char *atmel_pctl_get_group_name(struct pinctrl_dev *pctldev,
>  }
>  
>  static int atmel_pctl_get_group_pins(struct pinctrl_dev *pctldev,
> -				     unsigned selector, const unsigned **pins,
> -				     unsigned *num_pins)
> +				     unsigned int selector,
> +				     const unsigned int **pins,
> +				     unsigned int *num_pins)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
>  
> -	*pins = (unsigned *)&atmel_pioctrl->groups[selector].pin;
> +	*pins = (unsigned int *)&atmel_pioctrl->groups[selector].pin;
>  	*num_pins = 1;
>  
>  	return 0;
>  }
>  
>  static struct atmel_group *
> -atmel_pctl_find_group_by_pin(struct pinctrl_dev *pctldev, unsigned pin)
> +atmel_pctl_find_group_by_pin(struct pinctrl_dev *pctldev, unsigned int pin)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
>  	int i;
> @@ -524,7 +527,7 @@ static int atmel_pctl_xlate_pinfunc(struct pinctrl_dev *pctldev,
>  				    const char **func_name)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
> -	unsigned pin_id, func_id;
> +	unsigned int pin_id, func_id;
>  	struct atmel_group *grp;
>  
>  	pin_id = ATMEL_GET_PIN_NO(pinfunc);
> @@ -554,10 +557,10 @@ static int atmel_pctl_xlate_pinfunc(struct pinctrl_dev *pctldev,
>  static int atmel_pctl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  					struct device_node *np,
>  					struct pinctrl_map **map,
> -					unsigned *reserved_maps,
> -					unsigned *num_maps)
> +					unsigned int *reserved_maps,
> +					unsigned int *num_maps)
>  {
> -	unsigned num_pins, num_configs, reserve;
> +	unsigned int num_pins, num_configs, reserve;
>  	unsigned long *configs;
>  	struct property	*pins;
>  	u32 pinfunc;
> @@ -628,10 +631,10 @@ static int atmel_pctl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  static int atmel_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  				     struct device_node *np_config,
>  				     struct pinctrl_map **map,
> -				     unsigned *num_maps)
> +				     unsigned int *num_maps)
>  {
>  	struct device_node *np;
> -	unsigned reserved_maps;
> +	unsigned int reserved_maps;
>  	int ret;
>  
>  	*map = NULL;
> @@ -679,13 +682,13 @@ static int atmel_pmx_get_functions_count(struct pinctrl_dev *pctldev)
>  }
>  
>  static const char *atmel_pmx_get_function_name(struct pinctrl_dev *pctldev,
> -					       unsigned selector)
> +					       unsigned int selector)
>  {
>  	return atmel_functions[selector];
>  }
>  
>  static int atmel_pmx_get_function_groups(struct pinctrl_dev *pctldev,
> -					 unsigned selector,
> +					 unsigned int selector,
>  					 const char * const **groups,
>  					 unsigned * const num_groups)
>  {
> @@ -698,11 +701,11 @@ static int atmel_pmx_get_function_groups(struct pinctrl_dev *pctldev,
>  }
>  
>  static int atmel_pmx_set_mux(struct pinctrl_dev *pctldev,
> -			     unsigned function,
> -			     unsigned group)
> +			     unsigned int function,
> +			     unsigned int group)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
> -	unsigned pin;
> +	unsigned int pin;
>  	u32 conf;
>  
>  	dev_dbg(pctldev->dev, "enable function %s group %s\n",
> @@ -726,13 +729,13 @@ static const struct pinmux_ops atmel_pmxops = {
>  };
>  
>  static int atmel_conf_pin_config_group_get(struct pinctrl_dev *pctldev,
> -					   unsigned group,
> +					   unsigned int group,
>  					   unsigned long *config)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
> -	unsigned param = pinconf_to_config_param(*config), arg = 0;
> +	unsigned int param = pinconf_to_config_param(*config), arg = 0;
>  	struct atmel_group *grp = atmel_pioctrl->groups + group;
> -	unsigned pin_id = grp->pin;
> +	unsigned int pin_id = grp->pin;
>  	u32 res;
>  
>  	res = atmel_pin_config_read(pctldev, pin_id);
> @@ -786,21 +789,21 @@ static int atmel_conf_pin_config_group_get(struct pinctrl_dev *pctldev,
>  }
>  
>  static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
> -					   unsigned group,
> +					   unsigned int group,
>  					   unsigned long *configs,
> -					   unsigned num_configs)
> +					   unsigned int num_configs)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
>  	struct atmel_group *grp = atmel_pioctrl->groups + group;
> -	unsigned bank, pin, pin_id = grp->pin;
> +	unsigned int bank, pin, pin_id = grp->pin;
>  	u32 mask, conf = 0;
>  	int i;
>  
>  	conf = atmel_pin_config_read(pctldev, pin_id);
>  
>  	for (i = 0; i < num_configs; i++) {
> -		unsigned param = pinconf_to_config_param(configs[i]);
> -		unsigned arg = pinconf_to_config_argument(configs[i]);
> +		unsigned int param = pinconf_to_config_param(configs[i]);
> +		unsigned int arg = pinconf_to_config_argument(configs[i]);
>  
>  		dev_dbg(pctldev->dev, "%s: pin=%u, config=0x%lx\n",
>  			__func__, pin_id, configs[i]);
> @@ -900,7 +903,8 @@ static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
>  }
>  
>  static void atmel_conf_pin_config_dbg_show(struct pinctrl_dev *pctldev,
> -					   struct seq_file *s, unsigned pin_id)
> +					   struct seq_file *s,
> +					   unsigned int pin_id)
>  {
>  	struct atmel_pioctrl *atmel_pioctrl = pinctrl_dev_get_drvdata(pctldev);
>  	u32 conf;
> @@ -1108,8 +1112,8 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	for (i = 0 ; i < atmel_pioctrl->npins; i++) {
>  		struct atmel_group *group = atmel_pioctrl->groups + i;
> -		unsigned bank = ATMEL_PIO_BANK(i);
> -		unsigned line = ATMEL_PIO_LINE(i);
> +		unsigned int bank = ATMEL_PIO_BANK(i);
> +		unsigned int line = ATMEL_PIO_LINE(i);
>  
>  		atmel_pioctrl->pins[i] = devm_kzalloc(dev,
>  				sizeof(**atmel_pioctrl->pins), GFP_KERNEL);
> -- 
> 2.7.4
> 
