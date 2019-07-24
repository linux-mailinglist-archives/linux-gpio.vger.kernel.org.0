Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7B7773CA9
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2019 22:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392615AbfGXUKw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jul 2019 16:10:52 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46577 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404958AbfGXT6n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jul 2019 15:58:43 -0400
Received: by mail-pf1-f193.google.com with SMTP id c73so21454291pfb.13
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jul 2019 12:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Qnv9PuKOhBpLBicabskGoHxnBcYnBDIXT5ovEDwMWhI=;
        b=OUGD6tpjGrBp3kC+1g92gtEFw7g7i/g6Zqe3QZEpFaSbR8A7stzdh+VOWK3I6BrvlC
         D8UoTk1aOUaYu392mLuI8Q88FCNrovbfxClurjNng+uRqycXvaleU9ditrMKhIOodgMa
         kxtvaqjLbYDzOcwkYR3mMyxjRal8XElPMo9+V8McO0s9xh2yN33fbNUTYcyCHZbofQ4Y
         alGPZOKi6roqHrIPXQwp3QnCKxWuCVdZObU4yO7A9SyoWbCQgFkgnkBg3MuXDanOE2sx
         Gd6a0Zwl2mgTwJ993vEvMpHzFg2A/0Ys0Z1ju1Ld7Dpu4N7P3pgq6axYHXEi8Gcl+xpE
         byBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Qnv9PuKOhBpLBicabskGoHxnBcYnBDIXT5ovEDwMWhI=;
        b=Ky8fv9uNr1fZJ6Nt1qXUU3d9QePjuCxj3gY/lTIXeoWZxKzLeLYJCAnEJJZwzXvg3E
         2x0p34Jb7w9FloswZfHPT7CqSoWkNOqxvG/OrL6GbZsOo7oAO72Ya+y3TlhyNX3xcQVb
         54DBd8sYe4sxQSQhf+4vUzRab5CgQAWisaB+FDqeiY5W2kEADSyrBoVnsph6o60kW5Ii
         5xNbGUndYejKEgn8ZaBASe78ExJW5RudK8UARH6RZjlFjO+eFvkXE4+s4CHrsghdIqIU
         cQliLgcgDrrJAAaTguubsxFVdf9oCwW4bnogulpcJCSjnikmq5Yxw5skFO6KQx3LbgxF
         olLA==
X-Gm-Message-State: APjAAAVgssRVvLRb6/UGCtEQnZs/LpxYayHFMJp6JksOG3vKRZ6L8rLz
        99hTUZZhJSGI7nYcTd7Tql3iyg==
X-Google-Smtp-Source: APXvYqxmlJMfbQ98EOEu/GFktBVtAD/nSHrETKIOz8bQFdlueTkz/GcqmQIePPlq0jGN+sLHkCC2rg==
X-Received: by 2002:a63:1e0b:: with SMTP id e11mr77004849pge.402.1563998322341;
        Wed, 24 Jul 2019 12:58:42 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e11sm58567619pfm.35.2019.07.24.12.58.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 12:58:41 -0700 (PDT)
Date:   Wed, 24 Jul 2019 13:00:07 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>
Cc:     linux-gpio@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] pinctrl: qcom: Pass irqchip when adding gpiochip
Message-ID: <20190724200007.GO7234@tuxbook-pro>
References: <20190724083828.7496-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724083828.7496-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 24 Jul 01:38 PDT 2019, Linus Walleij wrote:

> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip.

Could you please elaborate on why we have this need?

> 
> For chained irqchips this is a pretty straight-forward
> conversion.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 7f35c196bb3e..73062e329f6f 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1002,6 +1002,7 @@ static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
>  static int msm_gpio_init(struct msm_pinctrl *pctrl)
>  {
>  	struct gpio_chip *chip;
> +	struct gpio_irq_chip *girq;
>  	int ret;
>  	unsigned ngpio = pctrl->soc->ngpios;
>  
> @@ -1027,6 +1028,18 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>  	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
>  	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
>  
> +	girq = &chip->irq;
> +	girq->chip = &pctrl->irq_chip;
> +	girq->parent_handler = msm_gpio_irq_handler;
> +	girq->num_parents = 1;
> +	girq->parents = devm_kcalloc(pctrl->dev, 1, sizeof(*girq->parents),
> +				     GFP_KERNEL);
> +	if (!girq->parents)
> +		return -ENOMEM;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_bad_irq;

It's been a while since i poked at this, but I think it's fine to change
this from handle_edge_irq to handle_bad_irq.


So this change does looks like a nice cleanup to me, but adding Lina wrt
her PDC integration patch series.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +	girq->parents[0] = pctrl->irq;
> +
>  	ret = gpiochip_add_data(&pctrl->chip, pctrl);
>  	if (ret) {
>  		dev_err(pctrl->dev, "Failed register gpiochip\n");
> @@ -1053,20 +1066,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>  		}
>  	}
>  
> -	ret = gpiochip_irqchip_add(chip,
> -				   &pctrl->irq_chip,
> -				   0,
> -				   handle_edge_irq,
> -				   IRQ_TYPE_NONE);
> -	if (ret) {
> -		dev_err(pctrl->dev, "Failed to add irqchip to gpiochip\n");
> -		gpiochip_remove(&pctrl->chip);
> -		return -ENOSYS;
> -	}
> -
> -	gpiochip_set_chained_irqchip(chip, &pctrl->irq_chip, pctrl->irq,
> -				     msm_gpio_irq_handler);
> -
>  	return 0;
>  }
>  
> -- 
> 2.21.0
> 
