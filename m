Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47FE430AF0
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 18:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344293AbhJQQzy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 12:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344284AbhJQQzx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Oct 2021 12:55:53 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF58C061765
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 09:53:43 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id k11-20020a4aa5cb000000b002b73749f3cdso548395oom.4
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 09:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5HD5tW2cxFRlWnUtEtVMpZ1nQZ9LJtKSBtuKdVd6I+s=;
        b=Dng88W0fkHGGLByUnSYYcEnpUxXob+mplrze0xrmEOqwZemadwWSznUrvHIVJS7VeC
         iT39GPVtAULYnk1eFwO7AGHxHs1CZXXIjvHhN9DVLEGI4Fi4z9sJSeUaW8LuwAriQiZV
         EVpwYd4Utc/aViZgQblxuSyAOjPdZp/SyPAjhtopnGc7WLOIacNGfmLCSymwJsqMWMWB
         6saCjgxsEwh97KP7G0+Af+IdppHJGYLDW03WeN0NtTFvNNFs2Z9mj3nOH8xVXq8aAZxX
         TWDMdaKYD8lMuSfI+kk195xscQcoRsv+z7wMAwztUWXE8lW1jAavIfop3Ohc6VOvRsMu
         Rbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5HD5tW2cxFRlWnUtEtVMpZ1nQZ9LJtKSBtuKdVd6I+s=;
        b=kzZwUGXrbRt53br96gCRhGA1sp9zLEuYu9JnWWcM9UZmhW6n15Q0F7BLavG2ich+sT
         ewNWE11nFVQq76z9ufYEmz7sXd3kjQ2buTkYa1co6dCubQnc6Bb+zDTCMC8XJ0u2zUKp
         Qqs7GLMOR8fXUt+7yoE60Z9Rfk+CDalmaM0wFDrtchI+LnZFq4PwmAvo8f0IlJT03g78
         HglrEf8QkoOX0e4fIqTTr9BlElQwoPwG5aMbiJPulbS97ffP+LGwjsvXnjQbetZyoVsI
         Mf2xcTq1UMiYFWu0FJl9Yr5diNDcMsFMAn76Wkj9prp+m9hnzMl0OMQushkKAURSyaXB
         9wAg==
X-Gm-Message-State: AOAM533TXt/er0XuugJ9qR+ELta40v2xdRPqtFm1Kz3z7fNbaCDsMDdG
        leqVyJrnAd11Zlr6NGubBdofyg==
X-Google-Smtp-Source: ABdhPJy3M2AwVokjLIvItwcz1xMozRoLATOoU2RD6Gg3Kl9E7nPrKY3pfJrfhfMXAS61z5j6xbErZA==
X-Received: by 2002:a05:6820:54e:: with SMTP id n14mr17232125ooj.89.1634489622374;
        Sun, 17 Oct 2021 09:53:42 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id j8sm107724otu.59.2021.10.17.09.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:53:41 -0700 (PDT)
Date:   Sun, 17 Oct 2021 11:53:40 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 16/25] pinctrl: qcom: spmi-mpp: add support for
 hierarchical IRQ chip
Message-ID: <YWxVFDPBaKCqLx5f@builder.lan>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
 <20211008012524.481877-17-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008012524.481877-17-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 07 Oct 20:25 CDT 2021, Dmitry Baryshkov wrote:

> spmi-mpp did not have any irqchip support so consumers of this in
> device tree would need to call gpio[d]_to_irq() in order to get the
> proper IRQ on the underlying PMIC. IRQ chips in device tree should be
> usable from the start without the consumer having to make an additional
> call to get the proper IRQ on the parent. This patch adds hierarchical
> IRQ chip support to the spmi-mpp code to correct this issue.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 86 ++++++++++++++++++++-----
>  1 file changed, 69 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> index a9f994863126..b80723928b7e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
> @@ -103,7 +103,6 @@
>  /**
>   * struct pmic_mpp_pad - keep current MPP settings
>   * @base: Address base in SPMI device.
> - * @irq: IRQ number which this MPP generate.
>   * @is_enabled: Set to false when MPP should be put in high Z state.
>   * @out_value: Cached pin output value.
>   * @output_enabled: Set to true if MPP output logic is enabled.
> @@ -121,7 +120,6 @@
>   */
>  struct pmic_mpp_pad {
>  	u16		base;
> -	int		irq;
>  	bool		is_enabled;
>  	bool		out_value;
>  	bool		output_enabled;
> @@ -143,6 +141,7 @@ struct pmic_mpp_state {
>  	struct regmap	*map;
>  	struct pinctrl_dev *ctrl;
>  	struct gpio_chip chip;
> +	struct irq_chip irq;
>  };
>  
>  static const struct pinconf_generic_params pmic_mpp_bindings[] = {
> @@ -622,16 +621,6 @@ static int pmic_mpp_of_xlate(struct gpio_chip *chip,
>  	return gpio_desc->args[0] - PMIC_MPP_PHYSICAL_OFFSET;
>  }
>  
> -static int pmic_mpp_to_irq(struct gpio_chip *chip, unsigned pin)
> -{
> -	struct pmic_mpp_state *state = gpiochip_get_data(chip);
> -	struct pmic_mpp_pad *pad;
> -
> -	pad = state->ctrl->desc->pins[pin].drv_data;
> -
> -	return pad->irq;
> -}
> -
>  static void pmic_mpp_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>  {
>  	struct pmic_mpp_state *state = gpiochip_get_data(chip);
> @@ -651,7 +640,6 @@ static const struct gpio_chip pmic_mpp_gpio_template = {
>  	.request		= gpiochip_generic_request,
>  	.free			= gpiochip_generic_free,
>  	.of_xlate		= pmic_mpp_of_xlate,
> -	.to_irq			= pmic_mpp_to_irq,
>  	.dbg_show		= pmic_mpp_dbg_show,
>  };
>  
> @@ -796,13 +784,53 @@ static int pmic_mpp_populate(struct pmic_mpp_state *state,
>  	return 0;
>  }
>  
> +static int pmic_mpp_domain_translate(struct irq_domain *domain,
> +				      struct irq_fwspec *fwspec,
> +				      unsigned long *hwirq,
> +				      unsigned int *type)
> +{
> +	struct pmic_mpp_state *state = container_of(domain->host_data,
> +						     struct pmic_mpp_state,
> +						     chip);
> +
> +	if (fwspec->param_count != 2 ||
> +	    fwspec->param[0] < 1 || fwspec->param[0] > state->chip.ngpio)
> +		return -EINVAL;
> +
> +	*hwirq = fwspec->param[0] - PMIC_MPP_PHYSICAL_OFFSET;
> +	*type = fwspec->param[1];
> +
> +	return 0;
> +}
> +
> +static unsigned int pmic_mpp_child_offset_to_irq(struct gpio_chip *chip,
> +						  unsigned int offset)
> +{
> +	return offset + PMIC_MPP_PHYSICAL_OFFSET;
> +}
> +
> +static int pmic_mpp_child_to_parent_hwirq(struct gpio_chip *chip,
> +					   unsigned int child_hwirq,
> +					   unsigned int child_type,
> +					   unsigned int *parent_hwirq,
> +					   unsigned int *parent_type)
> +{
> +	*parent_hwirq = child_hwirq + 0xc0;
> +	*parent_type = child_type;
> +
> +	return 0;
> +}
> +
>  static int pmic_mpp_probe(struct platform_device *pdev)
>  {
> +	struct irq_domain *parent_domain;
> +	struct device_node *parent_node;
>  	struct device *dev = &pdev->dev;
>  	struct pinctrl_pin_desc *pindesc;
>  	struct pinctrl_desc *pctrldesc;
>  	struct pmic_mpp_pad *pad, *pads;
>  	struct pmic_mpp_state *state;
> +	struct gpio_irq_chip *girq;
>  	int ret, npins, i;
>  	u32 reg;
>  
> @@ -857,10 +885,6 @@ static int pmic_mpp_probe(struct platform_device *pdev)
>  		pindesc->number = i;
>  		pindesc->name = pmic_mpp_groups[i];
>  
> -		pad->irq = platform_get_irq(pdev, i);
> -		if (pad->irq < 0)
> -			return pad->irq;
> -
>  		pad->base = reg + i * PMIC_MPP_ADDRESS_RANGE;
>  
>  		ret = pmic_mpp_populate(state, pad);
> @@ -880,6 +904,34 @@ static int pmic_mpp_probe(struct platform_device *pdev)
>  	if (IS_ERR(state->ctrl))
>  		return PTR_ERR(state->ctrl);
>  
> +	parent_node = of_irq_find_parent(state->dev->of_node);
> +	if (!parent_node)
> +		return -ENXIO;
> +
> +	parent_domain = irq_find_host(parent_node);
> +	of_node_put(parent_node);
> +	if (!parent_domain)
> +		return -ENXIO;
> +
> +	state->irq.name = "spmi-mpp",
> +	state->irq.irq_ack = irq_chip_ack_parent,
> +	state->irq.irq_mask = irq_chip_mask_parent,
> +	state->irq.irq_unmask = irq_chip_unmask_parent,
> +	state->irq.irq_set_type = irq_chip_set_type_parent,
> +	state->irq.irq_set_wake = irq_chip_set_wake_parent,
> +	state->irq.flags = IRQCHIP_MASK_ON_SUSPEND,
> +
> +	girq = &state->chip.irq;
> +	girq->chip = &state->irq;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_level_irq;
> +	girq->fwnode = of_node_to_fwnode(state->dev->of_node);
> +	girq->parent_domain = parent_domain;
> +	girq->child_to_parent_hwirq = pmic_mpp_child_to_parent_hwirq;
> +	girq->populate_parent_alloc_arg = gpiochip_populate_parent_fwspec_fourcell;
> +	girq->child_offset_to_irq = pmic_mpp_child_offset_to_irq;
> +	girq->child_irq_domain_ops.translate = pmic_mpp_domain_translate;
> +
>  	ret = gpiochip_add_data(&state->chip, state);
>  	if (ret) {
>  		dev_err(state->dev, "can't add gpio chip\n");
> -- 
> 2.30.2
> 
