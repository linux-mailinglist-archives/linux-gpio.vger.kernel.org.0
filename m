Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C579430AEA
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 18:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344287AbhJQQz0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 12:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344273AbhJQQzX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Oct 2021 12:55:23 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA861C061765
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 09:53:13 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so2251482ote.8
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 09:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X1MZ7kcEvnUq/B6JRQcaaR2oxZalMKdzTnKxCHM5OuI=;
        b=bpqvp4sVoriW/FpU6l4QVsCpknAG/KsLodBbfLfFdRurMBk+/poUnrbeV3CZDgYtR0
         q3BKuZK9c7cmZHr65SFhun6XCJ3Yh/Uf0S0CZcjFr2bISb/bfqOsNBIx5R2E3U8uU9x9
         HxU9miQ2iwJ9p1K9yUk+H/wyqmDmSs9hG8mWtCatCNQujaOaL8WacxcAzron/0/QBD6C
         317hY8b4m/Q7duT0rzeTqJOwBt6jiYnaPbPxBMSDEJTjIcF/nPCphlubl0iQQkdZT/xZ
         QcWTzS2Nx8Xl1viEAo/pCG/NX3I1sqpZ7NObqa2kB8WlDlyrSPa1dZNTACqcevKsL5xe
         KHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X1MZ7kcEvnUq/B6JRQcaaR2oxZalMKdzTnKxCHM5OuI=;
        b=LHzt0XeSQi3/WAn/uR8doDwfCJ8Jx+b2HubB/YZ4orEg6YEh4ETISccbg7qe8q9H3o
         eRyi0Jog5VdyQm9FN+o3jKmKNFnKfta3l6vePYcOChLxH0vmteXKa4VdiIWYGSq3BtuW
         thLnQub2bzJFnVYQVS5z+Rlc7xwfuSO/UNNKbSKsGwwGug7RaNOgqglNsxpbQP6dtbXh
         fLsizMzh+xg6TWs4dk9ON7sBb77tMR+xKrtakb04u8qYMzA2Qn7HAOCJ2f4Gi0a//iuu
         mkrQ7/n2UR3edNsH7QwPpgO6ZAiGyfY723UWJBhd+f1L0xqEmaM2NdWhi4l+8uV8vYMr
         7Q+A==
X-Gm-Message-State: AOAM533/3MUJQzvaxOvT7Zthw5wUaQN3fD78dxL0rUx16p5Cj7FH9/er
        6GdpxkhSvYKpfIQC2gSsSVj0ndwZ1pETzw==
X-Google-Smtp-Source: ABdhPJxiNxLgpXJNjwwXXuSIBCQFfFSMVwbS2GbI0uN86LextR5KnWzRbZ4dqrHawYrJToat+8R6Fw==
X-Received: by 2002:a9d:6c91:: with SMTP id c17mr17717474otr.114.1634489593169;
        Sun, 17 Oct 2021 09:53:13 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id t9sm2558928ott.70.2021.10.17.09.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:53:12 -0700 (PDT)
Date:   Sun, 17 Oct 2021 11:53:11 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 14/25] pinctrl: qcom: ssbi-mpp: add support for
 hierarchical IRQ chip
Message-ID: <YWxU90tNYS4QIAQU@builder.lan>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
 <20211008012524.481877-15-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008012524.481877-15-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 07 Oct 20:25 CDT 2021, Dmitry Baryshkov wrote:

> ssbi-mpp did not have any irqchip support so consumers of this in
> device tree would need to call gpio[d]_to_irq() in order to get the
> proper IRQ on the underlying PMIC. IRQ chips in device tree should be
> usable from the start without the consumer having to make an additional
> call to get the proper IRQ on the parent. This patch adds hierarchical
> IRQ chip support to the ssbi-mpp code to correct this issue.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c | 111 ++++++++++++++++++++----
>  1 file changed, 93 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
> index a90cada1d657..842940594c4a 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
> @@ -87,7 +87,6 @@
>  /**
>   * struct pm8xxx_pin_data - dynamic configuration for a pin
>   * @reg:		address of the control register
> - * @irq:		IRQ from the PMIC interrupt controller
>   * @mode:		operating mode for the pin (digital, analog or current sink)
>   * @input:		pin is input
>   * @output:		pin is output
> @@ -103,7 +102,6 @@
>   */
>  struct pm8xxx_pin_data {
>  	unsigned reg;
> -	int irq;
>  
>  	u8 mode;
>  
> @@ -126,6 +124,7 @@ struct pm8xxx_mpp {
>  	struct regmap *regmap;
>  	struct pinctrl_dev *pctrl;
>  	struct gpio_chip chip;
> +	struct irq_chip irq;
>  
>  	struct pinctrl_desc desc;
>  	unsigned npins;
> @@ -148,6 +147,8 @@ static const struct pin_config_item pm8xxx_conf_items[] = {
>  #endif
>  
>  #define PM8XXX_MAX_MPPS	12
> +#define PM8XXX_MPP_PHYSICAL_OFFSET    1
> +
>  static const char * const pm8xxx_groups[PM8XXX_MAX_MPPS] = {
>  	"mpp1", "mpp2", "mpp3", "mpp4", "mpp5", "mpp6", "mpp7", "mpp8",
>  	"mpp9", "mpp10", "mpp11", "mpp12",
> @@ -492,12 +493,16 @@ static int pm8xxx_mpp_get(struct gpio_chip *chip, unsigned offset)
>  	struct pm8xxx_mpp *pctrl = gpiochip_get_data(chip);
>  	struct pm8xxx_pin_data *pin = pctrl->desc.pins[offset].drv_data;
>  	bool state;
> -	int ret;
> +	int ret, irq;
>  
>  	if (!pin->input)
>  		return !!pin->output_value;
>  
> -	ret = irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &state);
> +	irq = chip->to_irq(chip, offset);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = irq_get_irqchip_state(irq, IRQCHIP_STATE_LINE_LEVEL, &state);
>  	if (!ret)
>  		ret = !!state;
>  
> @@ -524,18 +529,10 @@ static int pm8xxx_mpp_of_xlate(struct gpio_chip *chip,
>  	if (flags)
>  		*flags = gpio_desc->args[1];
>  
> -	return gpio_desc->args[0] - 1;
> +	return gpio_desc->args[0] - PM8XXX_MPP_PHYSICAL_OFFSET;
>  }
>  
>  
> -static int pm8xxx_mpp_to_irq(struct gpio_chip *chip, unsigned offset)
> -{
> -	struct pm8xxx_mpp *pctrl = gpiochip_get_data(chip);
> -	struct pm8xxx_pin_data *pin = pctrl->desc.pins[offset].drv_data;
> -
> -	return pin->irq;
> -}
> -
>  #ifdef CONFIG_DEBUG_FS
>  #include <linux/seq_file.h>
>  
> @@ -558,7 +555,7 @@ static void pm8xxx_mpp_dbg_show_one(struct seq_file *s,
>  		"abus3",
>  	};
>  
> -	seq_printf(s, " mpp%-2d:", offset + 1);
> +	seq_printf(s, " mpp%-2d:", offset + PM8XXX_MPP_PHYSICAL_OFFSET);
>  
>  	switch (pin->mode) {
>  	case PM8XXX_MPP_DIGITAL:
> @@ -640,7 +637,6 @@ static const struct gpio_chip pm8xxx_mpp_template = {
>  	.get = pm8xxx_mpp_get,
>  	.set = pm8xxx_mpp_set,
>  	.of_xlate = pm8xxx_mpp_of_xlate,
> -	.to_irq = pm8xxx_mpp_to_irq,
>  	.dbg_show = pm8xxx_mpp_dbg_show,
>  	.owner = THIS_MODULE,
>  };
> @@ -732,6 +728,55 @@ static int pm8xxx_pin_populate(struct pm8xxx_mpp *pctrl,
>  	return 0;
>  }
>  
> +static int pm8xxx_mpp_domain_translate(struct irq_domain *domain,
> +				   struct irq_fwspec *fwspec,
> +				   unsigned long *hwirq,
> +				   unsigned int *type)
> +{
> +	struct pm8xxx_mpp *pctrl = container_of(domain->host_data,
> +						 struct pm8xxx_mpp, chip);
> +
> +	if (fwspec->param_count != 2 ||
> +	    fwspec->param[0] < PM8XXX_MPP_PHYSICAL_OFFSET ||
> +	    fwspec->param[0] > pctrl->chip.ngpio)
> +		return -EINVAL;
> +
> +	*hwirq = fwspec->param[0] - PM8XXX_MPP_PHYSICAL_OFFSET;
> +	*type = fwspec->param[1];
> +
> +	return 0;
> +}
> +
> +static unsigned int pm8xxx_mpp_child_offset_to_irq(struct gpio_chip *chip,
> +						   unsigned int offset)
> +{
> +	return offset + PM8XXX_MPP_PHYSICAL_OFFSET;
> +}
> +
> +static int pm8821_mpp_child_to_parent_hwirq(struct gpio_chip *chip,
> +					    unsigned int child_hwirq,
> +					    unsigned int child_type,
> +					    unsigned int *parent_hwirq,
> +					    unsigned int *parent_type)
> +{
> +	*parent_hwirq = child_hwirq + 24;
> +	*parent_type = child_type;
> +
> +	return 0;
> +}
> +
> +static int pm8xxx_mpp_child_to_parent_hwirq(struct gpio_chip *chip,
> +					    unsigned int child_hwirq,
> +					    unsigned int child_type,
> +					    unsigned int *parent_hwirq,
> +					    unsigned int *parent_type)
> +{
> +	*parent_hwirq = child_hwirq + 0x80;
> +	*parent_type = child_type;
> +
> +	return 0;
> +}
> +
>  static const struct of_device_id pm8xxx_mpp_of_match[] = {
>  	{ .compatible = "qcom,pm8018-mpp", .data = (void *) 6 },
>  	{ .compatible = "qcom,pm8038-mpp", .data = (void *) 6 },
> @@ -746,7 +791,10 @@ MODULE_DEVICE_TABLE(of, pm8xxx_mpp_of_match);
>  static int pm8xxx_mpp_probe(struct platform_device *pdev)
>  {
>  	struct pm8xxx_pin_data *pin_data;
> +	struct irq_domain *parent_domain;
> +	struct device_node *parent_node;
>  	struct pinctrl_pin_desc *pins;
> +	struct gpio_irq_chip *girq;
>  	struct pm8xxx_mpp *pctrl;
>  	int ret;
>  	int i;
> @@ -783,9 +831,6 @@ static int pm8xxx_mpp_probe(struct platform_device *pdev)
>  
>  	for (i = 0; i < pctrl->desc.npins; i++) {
>  		pin_data[i].reg = SSBI_REG_ADDR_MPP(i);
> -		pin_data[i].irq = platform_get_irq(pdev, i);
> -		if (pin_data[i].irq < 0)
> -			return pin_data[i].irq;
>  
>  		ret = pm8xxx_pin_populate(pctrl, &pin_data[i]);
>  		if (ret)
> @@ -816,6 +861,36 @@ static int pm8xxx_mpp_probe(struct platform_device *pdev)
>  	pctrl->chip.of_gpio_n_cells = 2;
>  	pctrl->chip.label = dev_name(pctrl->dev);
>  	pctrl->chip.ngpio = pctrl->npins;
> +
> +	parent_node = of_irq_find_parent(pctrl->dev->of_node);
> +	if (!parent_node)
> +		return -ENXIO;
> +
> +	parent_domain = irq_find_host(parent_node);
> +	of_node_put(parent_node);
> +	if (!parent_domain)
> +		return -ENXIO;
> +
> +	pctrl->irq.name = "ssbi-mpp";
> +	pctrl->irq.irq_mask_ack = irq_chip_mask_ack_parent;
> +	pctrl->irq.irq_unmask = irq_chip_unmask_parent;
> +	pctrl->irq.irq_set_type = irq_chip_set_type_parent;
> +	pctrl->irq.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
> +
> +	girq = &pctrl->chip.irq;
> +	girq->chip = &pctrl->irq;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_level_irq;
> +	girq->fwnode = of_node_to_fwnode(pctrl->dev->of_node);
> +	girq->parent_domain = parent_domain;
> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,pm8821-mpp"))
> +		girq->child_to_parent_hwirq = pm8821_mpp_child_to_parent_hwirq;
> +	else
> +		girq->child_to_parent_hwirq = pm8xxx_mpp_child_to_parent_hwirq;
> +	girq->populate_parent_alloc_arg = gpiochip_populate_parent_fwspec_twocell;
> +	girq->child_offset_to_irq = pm8xxx_mpp_child_offset_to_irq;
> +	girq->child_irq_domain_ops.translate = pm8xxx_mpp_domain_translate;
> +
>  	ret = gpiochip_add_data(&pctrl->chip, pctrl);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed register gpiochip\n");
> -- 
> 2.30.2
> 
