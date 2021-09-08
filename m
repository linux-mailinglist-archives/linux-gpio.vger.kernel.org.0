Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD3C403553
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Sep 2021 09:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350084AbhIHH3R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Sep 2021 03:29:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:25937 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350051AbhIHH3R (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Sep 2021 03:29:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631086089; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=bhkyZfrhhg4vHCTOSXNchpd3Qd+b1T880BOzslLod7U=; b=LOQqIh3qL1gSytREgHIj3fF4bWu8UHWZ/RvGlz2xbsjf7L2T752Wrc37T7xGH2BdK7wHSWqM
 vjt0oLcvXzqWfNYClWjojnbeXdYT0j2L7Ks/EakQnW1qU4qH1cWsbuCN6dGz6HPawkerpH1u
 fCSBfqZtGgHZK4BsEkjHw5PKbTE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6138660897222b4b5baf04ef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Sep 2021 07:28:08
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5C0DCC4360C; Wed,  8 Sep 2021 07:28:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ABC1DC4338F;
        Wed,  8 Sep 2021 07:28:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 08 Sep 2021 12:58:07 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 1/2] pinctrl: qcom: spmi-gpio: correct parent irqspec
 translation
Message-ID: <6ccb0c57d25aebb141e9aa8bab103c93@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021-09-03 23:39, Stephen Boyd wrote:
> Quoting satya priya (2021-09-02 02:15:05)
>> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c 
>> b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> index 98bf0e2..dbae168 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> @@ -1,6 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0-only
>>  /*
>> - * Copyright (c) 2012-2014, The Linux Foundation. All rights 
>> reserved.
>> + * Copyright (c) 2012-2014, 2016-2021 The Linux Foundation. All 
>> rights reserved.
>>   */
>> 
>>  #include <linux/gpio/driver.h>
>> @@ -14,6 +14,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/regmap.h>
>>  #include <linux/slab.h>
>> +#include <linux/spmi.h>
>>  #include <linux/types.h>
>> 
>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>> @@ -171,6 +172,8 @@ struct pmic_gpio_state {
>>         struct pinctrl_dev *ctrl;
>>         struct gpio_chip chip;
>>         struct irq_chip irq;
>> +       u8 usid;
>> +       u8 pid_base;
>>  };
>> 
>>  static const struct pinconf_generic_params pmic_gpio_bindings[] = {
>> @@ -949,12 +952,36 @@ static int 
>> pmic_gpio_child_to_parent_hwirq(struct gpio_chip *chip,
>>                                            unsigned int *parent_hwirq,
>>                                            unsigned int *parent_type)
>>  {
>> -       *parent_hwirq = child_hwirq + 0xc0;
>> +       struct pmic_gpio_state *state = gpiochip_get_data(chip);
>> +
>> +       *parent_hwirq = child_hwirq + state->pid_base;
>>         *parent_type = child_type;
>> 
>>         return 0;
>>  }
>> 
>> +static void *pmic_gpio_populate_parent_fwspec(struct gpio_chip *chip,
>> +                                            unsigned int 
>> parent_hwirq,
>> +                                            unsigned int parent_type)
>> +{
>> +       struct pmic_gpio_state *state = gpiochip_get_data(chip);
>> +       struct irq_fwspec *fwspec;
>> +
>> +       fwspec = kzalloc(sizeof(*fwspec), GFP_KERNEL);
> 
> The implementation of gpiochip_populate_parent_fwspec_fourcell() uses
> kmalloc() here. Should we also do that? Presumably the fwspec will be
> set with the important parts so this will save a memset call.
> 

Using kmalloc also should be fine but I'd like to keep the kzalloc, the 
memset() operation takes some very small amount of time (once at boot 
per consumer irqspec).  kzalloc() is more deterministic and results in 
code that doesn't care if elements are added to the definition of struct 
irq_fwspec. It also ensures that all param[] elements are initialized to 
0.

>> +       if (!fwspec)
>> +               return NULL;
>> +
>> +       fwspec->fwnode = chip->irq.parent_domain->fwnode;
>> +
>> +       fwspec->param_count = 4;
>> +       fwspec->param[0] = state->usid;
>> +       fwspec->param[1] = parent_hwirq;
>> +       fwspec->param[2] = 0;
> 
> If the kzalloc stays, this can be dropped.
> 

I'll drop this and add a comment like this /* param[2] must be left as 0 
*/, so that future reviewers don't think that there is a typo in the 
indices going 0, 1, 3

>> +       fwspec->param[3] = parent_type;
>> +
>> +       return fwspec;
>> +}
>> +
>>  static int pmic_gpio_probe(struct platform_device *pdev)
>>  {
>>         struct irq_domain *parent_domain;
