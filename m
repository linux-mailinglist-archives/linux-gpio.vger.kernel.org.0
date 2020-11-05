Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAFD2A7E50
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 13:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730266AbgKEMIZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 07:08:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:49136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726777AbgKEMIY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Nov 2020 07:08:24 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8842A2224D;
        Thu,  5 Nov 2020 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604578103;
        bh=NWgcQz2VGvI80mRysDpVbcfbzsTP8szYfQc2OI4+R78=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=X6vS8Jk5QfVFQupeuX3ulp/x9zwmQmYYP5Z+YMmPVZwzCxMD0Przl+5ZSL+YLzV+y
         W+gUqvJ2goSuIeV+YqHOdDS7I1qJjI5qTgISh/SBEW6XG90TZYuOHM2JQPqPt651+P
         QL/3xcQd8fVV8BjqQ7W8/Ex2dfEXWr7Xs4AQE3AI=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kae3x-007pAP-Bn; Thu, 05 Nov 2020 12:08:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 05 Nov 2020 12:08:21 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] gpio: msc313: MStar MSC313 GPIO driver
In-Reply-To: <CACRpkdZNr6sDqJhg3KcX0bCbcd8fh2gXFYbS1r2H2Sq+vGqjUw@mail.gmail.com>
References: <20201019141008.871177-1-daniel@0x0f.com>
 <20201019141008.871177-4-daniel@0x0f.com>
 <CACRpkdZNr6sDqJhg3KcX0bCbcd8fh2gXFYbS1r2H2Sq+vGqjUw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <3fd04aeb5047d8059ddecc1eda19c2e4@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: linus.walleij@linaro.org, daniel@0x0f.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-11-05 09:40, Linus Walleij wrote:
> On Mon, Oct 19, 2020 at 4:10 PM Daniel Palmer <daniel@0x0f.com> wrote:

[...]

>> +/* The parent interrupt controller needs the GIC interrupt type set 
>> to GIC_SPI
>> + * so we need to provide the fwspec. Essentially 
>> gpiochip_populate_parent_fwspec_twocell
>> + * that puts GIC_SPI into the first cell.
>> + */

nit: comment style.

>> +static void *msc313_gpio_populate_parent_fwspec(struct gpio_chip *gc,
>> +                                            unsigned int 
>> parent_hwirq,
>> +                                            unsigned int parent_type)
>> +{
>> +       struct irq_fwspec *fwspec;
>> +
>> +       fwspec = kmalloc(sizeof(*fwspec), GFP_KERNEL);
>> +       if (!fwspec)
>> +               return NULL;
>> +
>> +       fwspec->fwnode = gc->irq.parent_domain->fwnode;
>> +       fwspec->param_count = 3;
>> +       fwspec->param[0] = GIC_SPI;
>> +       fwspec->param[1] = parent_hwirq;
>> +       fwspec->param[2] = parent_type;
>> +
>> +       return fwspec;
>> +}
> 
> Clever. Looping in Marc Z so he can say if this looks allright to him.

Yup, this looks correct. However, looking at the bit of the patch that
isn't quoted here, I see that msc313_gpio_irqchip doesn't have a
.irq_set_affinity callback. Is this system UP only?

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
