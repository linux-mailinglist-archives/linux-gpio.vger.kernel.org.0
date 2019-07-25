Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 285DE75258
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2019 17:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388457AbfGYPQO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jul 2019 11:16:14 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45046 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388549AbfGYPQO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jul 2019 11:16:14 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8D40D6037C; Thu, 25 Jul 2019 15:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564067772;
        bh=rPiJHWSbEHDEFreFkwlOXSFnd4Dauolt807TnXFu+sM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TNUEOi4B90UVgm52xi5uROiJFRptNTlkddxqcZoK3CjYJO6Nn2KqAduPPPEH1vvoz
         qeNa5Vr5G/EBtD6q87YH1tnlwHmoHYBQbdhI+y498x2YebCrKSUXST4wzNr9xXREaI
         VaNtdmqw3ZvoQoK7S+zHaCACzHXdnqK4j58ogeZc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB3EA60E59;
        Thu, 25 Jul 2019 15:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564067764;
        bh=rPiJHWSbEHDEFreFkwlOXSFnd4Dauolt807TnXFu+sM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n85D2rgJ1o7vtVOSsq7qKvg5aCCnX7nLqR17ksn6k7uZsc5XJKbGdwLb9iSayuWRc
         BsFtFeW6277t/M1xWRn8Is9hLTnDuOnn1bv9w4HMOZHVL/hUmgv74Al9yyiHeEmkCD
         7vQ9KNC6x1k52gPeDJp9PanQHakKQBKXuPu72fx0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB3EA60E59
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Thu, 25 Jul 2019 09:16:03 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] pinctrl: qcom: Pass irqchip when adding gpiochip
Message-ID: <20190725151603.GF18620@codeaurora.org>
References: <20190724083828.7496-1-linus.walleij@linaro.org>
 <20190724200007.GO7234@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190724200007.GO7234@tuxbook-pro>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 24 2019 at 14:00 -0600, Bjorn Andersson wrote:
>On Wed 24 Jul 01:38 PDT 2019, Linus Walleij wrote:
>
>> We need to convert all old gpio irqchips to pass the irqchip
>> setup along when adding the gpio_chip.
>
>Could you please elaborate on why we have this need?
>
>>
>> For chained irqchips this is a pretty straight-forward
>> conversion.
>>
>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Cc: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  drivers/pinctrl/qcom/pinctrl-msm.c | 27 +++++++++++++--------------
>>  1 file changed, 13 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 7f35c196bb3e..73062e329f6f 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -1002,6 +1002,7 @@ static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
>>  static int msm_gpio_init(struct msm_pinctrl *pctrl)
>>  {
>>  	struct gpio_chip *chip;
>> +	struct gpio_irq_chip *girq;
>>  	int ret;
>>  	unsigned ngpio = pctrl->soc->ngpios;
>>
>> @@ -1027,6 +1028,18 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>>  	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
>>  	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
>>
>> +	girq = &chip->irq;
>> +	girq->chip = &pctrl->irq_chip;
>> +	girq->parent_handler = msm_gpio_irq_handler;
>> +	girq->num_parents = 1;
>> +	girq->parents = devm_kcalloc(pctrl->dev, 1, sizeof(*girq->parents),
>> +				     GFP_KERNEL);
>> +	if (!girq->parents)
>> +		return -ENOMEM;
>> +	girq->default_type = IRQ_TYPE_NONE;
>> +	girq->handler = handle_bad_irq;
>
>It's been a while since i poked at this, but I think it's fine to change
>this from handle_edge_irq to handle_bad_irq.
>
>
>So this change does looks like a nice cleanup to me, but adding Lina wrt
>her PDC integration patch series.
>
Thanks Bjorn.
I had something similar in mind [1] as part of my series reworked on top
of Linus's GPIO hierarchy series. This patch is not far from it.

Thanks,
Lina

[1].
https://github.com/i-lina/linux/commit/f88c3fca1739eebdd8111d9baeaf048c9f957473

>Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
>Regards,
>Bjorn
>
>> +	girq->parents[0] = pctrl->irq;
>> +
>>  	ret = gpiochip_add_data(&pctrl->chip, pctrl);
>>  	if (ret) {
>>  		dev_err(pctrl->dev, "Failed register gpiochip\n");
>> @@ -1053,20 +1066,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>>  		}
>>  	}
>>
>> -	ret = gpiochip_irqchip_add(chip,
>> -				   &pctrl->irq_chip,
>> -				   0,
>> -				   handle_edge_irq,
>> -				   IRQ_TYPE_NONE);
>> -	if (ret) {
>> -		dev_err(pctrl->dev, "Failed to add irqchip to gpiochip\n");
>> -		gpiochip_remove(&pctrl->chip);
>> -		return -ENOSYS;
>> -	}
>> -
>> -	gpiochip_set_chained_irqchip(chip, &pctrl->irq_chip, pctrl->irq,
>> -				     msm_gpio_irq_handler);
>> -
>>  	return 0;
>>  }
>>
>> --
>> 2.21.0
>>
