Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3DCFE6A4
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 21:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfKOUz7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 15:55:59 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:54212 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfKOUz7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 15:55:59 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 70E8E6106C; Fri, 15 Nov 2019 20:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573851358;
        bh=q8ehKbSaRswTHrhcKVkRojqb3pK7OFcjQn47HZCpCL8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l0Jutpb7adP3MrODoqiJgh58sK67mIPKSj95fWPzv8clOOeL4OPkyHJv/P3A/sy30
         mwqD/lIRYpbdV4PjODCatxARboKlZR24iWteH8BLV2rU2UgW+O9LUKPCzGyrmUL4EL
         wyssg18CGIuWgdMLJAcaxaUebpNKBc/QYcIkbJfI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B33EE60F83;
        Fri, 15 Nov 2019 20:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573851357;
        bh=q8ehKbSaRswTHrhcKVkRojqb3pK7OFcjQn47HZCpCL8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nCwqxwKRYrk8iRrUnSBStVuAQC8r/Cuv4QJvaWuqTifi3XTTuzWVI5+M6FUIT9qGD
         GS2RfLyuYtCq/19gKihvH8upJBx1GS9wzVLLLNOFR1+d2qyeA8LnFB7VMfRe+1yQJm
         DRuCZEuRP59hctdH+wbnbPMFAljkNCC44uJTw46g=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B33EE60F83
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Fri, 15 Nov 2019 13:55:55 -0700
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        maz@kernel.org, evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org
Subject: Re: [PATCH 08/12] drivers: pinctrl: msm: setup GPIO chip in hierarchy
Message-ID: <20191115205555.GF18786@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
 <1573756521-27373-9-git-send-email-ilina@codeaurora.org>
 <5dcefd86.1c69fb81.c72c8.07a1@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5dcefd86.1c69fb81.c72c8.07a1@mx.google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

>Quoting Lina Iyer (2019-11-14 10:35:17)
>> Some GPIOs are marked as wakeup capable and are routed to another
>> interrupt controller that is an always-domain and can detect interrupts
>> even most of the SoC is powered off. The wakeup interrupt controller
>
>even when?
>
>> wakes up the GIC and replays the interrupt at the GIC.
>>
>> Setup the TLMM irqchip in hierarchy with the wakeup interrupt controller
>> and ensure the wakeup GPIOs are handled correctly.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>
>Is it Co-developed-by for Maulik?
>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>
>Some minor comments. Shouldn't be hard to fix and resend quickly I hope.
>
Thanks for the review Stephen. I will fix these and resend.

>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 763da0b..c245686 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -44,6 +46,7 @@
>>   * @enabled_irqs:   Bitmap of currently enabled irqs.
>>   * @dual_edge_irqs: Bitmap of irqs that need sw emulated dual edge
>>   *                  detection.
>> + * @skip_wake_irqs: Skip IRQs that are handled by wakeup interrupt contrroller
>
>s/contrroller/controller/
>
>>   * @soc;            Reference to soc_data of platform specific data.
>>   * @regs:           Base addresses for the TLMM tiles.
>>   */
>> @@ -778,10 +794,37 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
>>
>>  static void msm_gpio_irq_enable(struct irq_data *d)
>>  {
>> +       /*
>> +        * Clear the interrupt that may be pending before we enable
>> +        * the line.
>> +        * This is especially a problem with the GPIOs routed to the
>> +        * PDC. These GPIOs are direct-connect interrupts to the GIC.
>> +        * Disabling the interrupt line at the PDC does not prevent
>> +        * the interrupt from being latched at the GIC. The state at
>> +        * GIC needs to be cleared before enabling.
>> +        */
>> +       if (d->parent_data) {
>> +               irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
>> +               irq_chip_enable_parent(d);
>> +       }
>>
>>         msm_gpio_irq_clear_unmask(d, true);
>>  }
>>
>> +static void msm_gpio_irq_disable(struct irq_data *d)
>> +{
>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> +       struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>> +
>> +       if (d->parent_data)
>> +               irq_chip_disable_parent(d);
>> +
>> +       if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
>> +               return;
>> +
>> +       msm_gpio_irq_mask(d);
>
>Why not
>
>	if (!test_bit(...)
>		msm_gpio_irq_mask(d);
>
>> +}
>> +
>>  static void msm_gpio_irq_unmask(struct irq_data *d)
>>  {
>>         msm_gpio_irq_clear_unmask(d, false);
>> @@ -912,6 +964,15 @@ static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
>>         struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>>         unsigned long flags;
>>
>> +       if (d->parent_data)
>> +               irq_chip_set_wake_parent(d, on);
>> +
>> +       /*
>> +        * While they may not wake up when the TLMM is powered off,
>> +        * some GPIOs would like to wakeup the system from suspend
>> +        * when TLMM is powered on. To allow that, enable the GPIO
>> +        * summary line to be wakeup capable at GIC.
>> +        */
>
>Can this comment go above the irq_set_irq_wake() line below instead of
>this spinlock?
>
Sure.

>>         raw_spin_lock_irqsave(&pctrl->lock, flags);
>>
>>         irq_set_irq_wake(pctrl->irq, on);
>> @@ -990,6 +1051,30 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
>>         chained_irq_exit(chip, desc);
>>  }
>>
>> +static int msm_gpio_wakeirq(struct gpio_chip *gc,
>> +                           unsigned int child,
>> +                           unsigned int child_type,
>> +                           unsigned int *parent,
>> +                           unsigned int *parent_type)
>> +{
>> +       struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>> +       const struct msm_gpio_wakeirq_map *map;
>> +       int i;
>> +
>> +       *parent = GPIO_NO_WAKE_IRQ;
>> +       *parent_type = IRQ_TYPE_EDGE_RISING;
>> +
>> +       for (i = 0; i < pctrl->soc->nwakeirq_map; i++) {
>> +               map = &pctrl->soc->wakeirq_map[i];
>> +               if (map->gpio == child) {
>> +                       *parent = map->wakeirq;
>> +                       break;
>> +               }
>> +       }
>> +
>> +       return 0;
>
>Shouldn't we return -EINVAL if we can't translate the gpio irq to the
>parent domain? I would expect to see return -EINVAL here and the above
>if condition to return 0 instead of break.
>
Good catch. Sure.
>> +}
>> +
>>  static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
>>  {
>>         if (pctrl->soc->reserved_gpios)
>> @@ -1004,6 +1089,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>>         struct gpio_irq_chip *girq;
>>         int ret;
>>         unsigned ngpio = pctrl->soc->ngpios;
>> +       struct device_node *np;
>>
>>         if (WARN_ON(ngpio > MAX_NR_GPIO))
>>                 return -EINVAL;
>> @@ -1020,17 +1106,44 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>>
>>         pctrl->irq_chip.name = "msmgpio";
>>         pctrl->irq_chip.irq_enable = msm_gpio_irq_enable;
>> +       pctrl->irq_chip.irq_disable = msm_gpio_irq_disable;
>>         pctrl->irq_chip.irq_mask = msm_gpio_irq_mask;
>>         pctrl->irq_chip.irq_unmask = msm_gpio_irq_unmask;
>>         pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
>> +       pctrl->irq_chip.irq_eoi = irq_chip_eoi_parent;
>>         pctrl->irq_chip.irq_set_type = msm_gpio_irq_set_type;
>>         pctrl->irq_chip.irq_set_wake = msm_gpio_irq_set_wake;
>>         pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
>>         pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
>>
>> +       np = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
>> +       if (np) {
>> +               int i;
>> +               bool skip;
>> +               unsigned int gpio;
>
>Can these be placed at the top of this function instead of buried
>halfway down here?
>
>> +
>> +               chip->irq.parent_domain = irq_find_matching_host(np,
>> +                                                DOMAIN_BUS_WAKEUP);
>> +               of_node_put(np);
>> +               if (!chip->irq.parent_domain)
>> +                       return -EPROBE_DEFER;
>> +               chip->irq.child_to_parent_hwirq = msm_gpio_wakeirq;
>> +
>> +               /*
>> +                * Let's skip handling the GPIOs, if the parent irqchip
>> +                * handling the direct connect IRQ of the GPIO.
>
>is handling?
>
>> +                */
>> +               skip = irq_domain_qcom_handle_wakeup(chip->irq.parent_domain);
>> +               for (i = 0; skip && i < pctrl->soc->nwakeirq_map; i++) {
>> +                       gpio = pctrl->soc->wakeirq_map[i].gpio;
>> +                       set_bit(gpio, pctrl->skip_wake_irqs);
>> +               }
>> +       }
>> +
>>         girq = &chip->irq;
>>         girq->chip = &pctrl->irq_chip;
>>         girq->parent_handler = msm_gpio_irq_handler;
>> +       girq->fwnode = pctrl->dev->fwnode;
>>         girq->num_parents = 1;
>>         girq->parents = devm_kcalloc(pctrl->dev, 1, sizeof(*girq->parents),
>>                                      GFP_KERNEL);
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
>> index 48569cda8..1547020 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
>> @@ -5,6 +5,8 @@
>>  #ifndef __PINCTRL_MSM_H__
>>  #define __PINCTRL_MSM_H__
>>
>> +#include <linux/gpio/driver.h>
>
>What is this include for?
>
Must be from an older version. Will remove.

>> +
>>  struct pinctrl_pin_desc;
>>
>>  /**
>> @@ -101,6 +113,8 @@ struct msm_pingroup {
>>   * @ngroups:       The numbmer of entries in @groups.
>>   * @ngpio:         The number of pingroups the driver should expose as GPIOs.
>>   * @pull_no_keeper: The SoC does not support keeper bias.
>> + * @wakeirq_map:    The map of wakeup capable GPIOs and the pin at PDC/MPM
>> + * @nwakeirq_map:   The number of entries in @hierarchy_map
>
>Is it 'number of entries in @wakeirq_map"?
>
Yes. Thanks.
>>   */
>>  struct msm_pinctrl_soc_data {
>>         const struct pinctrl_pin_desc *pins;
>> @@ -114,6 +128,8 @@ struct msm_pinctrl_soc_data {
>>         const char *const *tiles;
>>         unsigned int ntiles;
>>         const int *reserved_gpios;
>> +       const struct msm_gpio_wakeirq_map *wakeirq_map;
>> +       unsigned int nwakeirq_map;
>>  };
>>
>>  extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
>> diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
>> index 637c0bf..e01391c 100644
>> --- a/include/linux/soc/qcom/irq.h
>> +++ b/include/linux/soc/qcom/irq.h
>> @@ -18,4 +18,17 @@
>>  #define IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP                (IRQ_DOMAIN_FLAG_NONCORE << 0)
>>  #define IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP                (IRQ_DOMAIN_FLAG_NONCORE << 1)
>>
>> +/**
>> + * irq_domain_qcom_handle_wakeup: Return if the domain handles interrupt
>> + *                                configuration
>> + * @d: irq domain
>> + *
>> + * This QCOM specific irq domain call returns if the interrupt controller
>> + * requires the interrupt be masked at the child interrupt controller.
>> + */
>> +static inline bool irq_domain_qcom_handle_wakeup(struct irq_domain *d)
>
>could be const irq_domain here.
>
Ok.
>> +{
>> +       return (d->flags & IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP);
>> +}
>> +

Thanks,
Lina
