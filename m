Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA2EA5176
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2019 10:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbfIBIVG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Sep 2019 04:21:06 -0400
Received: from foss.arm.com ([217.140.110.172]:50152 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729408AbfIBIVF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Sep 2019 04:21:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A799028;
        Mon,  2 Sep 2019 01:21:04 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3032B3F71A;
        Mon,  2 Sep 2019 01:21:03 -0700 (PDT)
Subject: Re: [PATCH RFC 03/14] drivers: irqchip: add PDC irqdomain for wakeup
 capable GPIOs
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     swboyd@chromium.org, evgreen@chromium.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        mkshah@codeaurora.org, linux-gpio@vger.kernel.org,
        rnayak@codeaurora.org
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-4-ilina@codeaurora.org>
 <d2a45d45-3071-ab8d-060b-92a2812a8d42@kernel.org>
 <20190830155853.GA5224@codeaurora.org>
From:   Marc Zyngier <maz@kernel.org>
Organization: Approximate
Message-ID: <11d14b08-27ae-d25a-6056-55c1cfbd89b1@kernel.org>
Date:   Mon, 2 Sep 2019 09:21:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830155853.GA5224@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/08/2019 16:58, Lina Iyer wrote:
> On Fri, Aug 30 2019 at 08:50 -0600, Marc Zyngier wrote:
>> [Please use my kernel.org address in the future. The days of this
>> arm.com address are numbered...]
>>
> Sure, will update and repost.
> 
>> On 29/08/2019 19:11, Lina Iyer wrote:
>>> Introduce a new domain for wakeup capable GPIOs. The domain can be
>>> requested using the bus token DOMAIN_BUS_WAKEUP. In the following
>>> patches, we will specify PDC as the wakeup-parent for the TLMM GPIO
>>> irqchip. Requesting a wakeup GPIO will setup the GPIO and the
>>> corresponding PDC interrupt as its parent.
>>>
>>> Co-developed-by: Stephen Boyd <swboyd@chromium.org>
>>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>>> ---
>>>  drivers/irqchip/qcom-pdc.c   | 104 ++++++++++++++++++++++++++++++++---
>>>  include/linux/soc/qcom/irq.h |  34 ++++++++++++
>>>  2 files changed, 129 insertions(+), 9 deletions(-)
>>>  create mode 100644 include/linux/soc/qcom/irq.h
>>>

[...]

>>> diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
>>> new file mode 100644
>>> index 000000000000..73239917dc38
>>> --- /dev/null
>>> +++ b/include/linux/soc/qcom/irq.h
>>> @@ -0,0 +1,34 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef __QCOM_IRQ_H
>>> +#define __QCOM_IRQ_H
>>> +
>>> +#include <linux/irqdomain.h>
>>> +
>>> +#define GPIO_NO_WAKE_IRQ	~0U
>>> +
>>> +/**
>>> + * QCOM specific IRQ domain flags that distinguishes the handling of wakeup
>>> + * capable interrupts by different interrupt controllers.
>>> + *
>>> + * IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP: Line must be masked at TLMM and the
>>> + *                                  interrupt configuration is done at PDC
>>> + * IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP: Interrupt configuration is handled at TLMM
>>> + */
>>> +#define IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP		(1 << 17)
>>> +#define IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP		(1 << 18)
>>
>> Any reason why you're starting at bit 17? The available range in from
>> bit 16... But overall, it would be better if you expressed it as:
>>
>> #define IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP	(IRQ_DOMAIN_FLAG_NONCORE << 0)
>> #define IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP (IRQ_DOMAIN_FLAG_NONCORE << 1)
>>
> Okay.
> 
>>> +
>>> +/**
>>> + * irq_domain_qcom_handle_wakeup: Return if the domain handles interrupt
>>> + *                                configuration
>>> + * @parent: irq domain
>>> + *
>>> + * This QCOM specific irq domain call returns if the interrupt controller
>>> + * requires the interrupt be masked at the child interrupt controller.
>>> + */
>>> +static inline bool irq_domain_qcom_handle_wakeup(struct irq_domain *parent)
>>> +{
>>> +	return (parent->flags & IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP);
>>> +}
>>> +
>>> +#endif
>>>
>>
>> But most of this file isn't used by this patch, so maybe it should be
>> moved somewhere else...
>>
> Apart from creating the domain, this is not used here, but a separate
> patch seemed excessive. Let me know if you have any suggestions.

My personal preference would be to move it into the patch that actually
makes use of this.

	M.
-- 
Jazz is not dead, it just smells funny...
