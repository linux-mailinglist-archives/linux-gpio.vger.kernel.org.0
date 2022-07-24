Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEB7D57F648
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jul 2022 20:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiGXSPb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Jul 2022 14:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGXSPa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Jul 2022 14:15:30 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D162DD6
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jul 2022 11:15:29 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id CA6A38402D;
        Sun, 24 Jul 2022 20:15:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1658686527;
        bh=an/lQP0gak5RPtMe4FtIaAMAGIb/Yl9FNteSIl03RA0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QrB5QOnFnnLaF30HwJroZuiLLQEAX9vh09QfVUsHIXCslkeHctPDV5p7rNPg+mNcp
         hhsSvP6azJ6sjuc28Mhfk8E0eDlymk7vxj4XGjNXYRTRRUflFG9yShBDebfFkOSUcN
         11v32+X7WsdhtldKP7vhFEXY4rfK8hHmh+Z/4o4/Hi6pZBB0MVK58o/0rjEF6YEO0e
         Mg+RbzOy9hC/p+j8Yt9xKZp75DBR8Qh/HqO6R/eHLQSsqetgkmqCYnwUJpFPvwhHJi
         CzBFVv8J7f/WVwg7xNXZ8pwEMWJx+Em66WZ5VV83ErYsmPzFOHBjevR0Mf+47EALWn
         UZFiSbr3EwEIQ==
Message-ID: <fe022bcf-9ae2-8050-77fa-06eb12e35147@denx.de>
Date:   Sun, 24 Jul 2022 20:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio
 spinlock
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
References: <20220724171057.18549-1-marex@denx.de>
 <87fsiqxuvd.wl-maz@kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <87fsiqxuvd.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 7/24/22 19:50, Marc Zyngier wrote:

[...]

>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -147,6 +147,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>>   {
>>   	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
>>   	struct mxc_gpio_port *port = gc->private;
>> +	unsigned long flags;
>>   	u32 bit, val;
>>   	u32 gpio_idx = d->hwirq;
>>   	int edge;
>> @@ -185,6 +186,8 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>>   		return -EINVAL;
>>   	}
>>   
>> +	spin_lock_irqsave(&port->gc.bgpio_lock, flags);
> 
> In my tree, bgpio is a raw spinlock, and has been since 3c938cc5cebcb.
> 
> Now, looking a bit closer at this code, I have to withdraw my earlier
> comment about the lack of mutual exclusion in the existing code. All
> writes are of the form:
> 
> 	writel(single_bit_mask, some_addr + MXS_{SET,CLR});
> 
> which indicates that the write side can be accessed with a hot-bit
> pattern, avoiding a RWM pattern and thus the need for a lock.

Only for the ISR/IMR, not for the GDIR register, that's why the locks 
are added only around the RMW which don't have these "hot bits".

> Your second patch, however requires the lock. I'm not sure it is safe
> to do after the interrupt type has been configured though. You may
> want to refer to the TRM for this.

There is in fact another unprotected RMW in gpio_set_irq_type() , look 
for GPIO_EDGE_SEL, so the locks should be valid as they are now, right ?
