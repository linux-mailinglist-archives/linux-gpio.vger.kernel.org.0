Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7168D57FCC8
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jul 2022 11:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbiGYJ5i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 05:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233428AbiGYJ5h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 05:57:37 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466BBE004
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 02:57:36 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F15EE840EE;
        Mon, 25 Jul 2022 11:57:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1658743053;
        bh=msu85Elp6Ms65jly8VZ+2WWSiCODoFr6CaAPd05uoAQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=mN7bAq355ew4n6/w9pUBl1naF4KjDU/m7oiYV3q9w5YdMix/iWa3bn0HEwSP7NB7C
         GsgDxlbK50RBfPmo3bpFUFc1alXZNM4Cz62TdjVMVJEbS6QUkA5EbpQpu2PmdEM+GT
         E9iXobVOJhpDG1mHyGy9xnC/30wrt7NWUWRg+fzKJ7tDsmbl96jbqYAcc4Uv9XkgIT
         79gVBVf66gU3JAolv1G/khYFK2ieJyCn/lbU4GjF+8eIqf5mZgOP0+D2VH0vd/+ljE
         +LRC74sX6ym7D6PJ2VTzNbpX0ZyBKJ4eDTnrdLZQFWDE+8F6MjgE1qiCkqk8B/K+EO
         M+AyB3dO3/ccw==
Message-ID: <233aebcf-71a0-9738-2100-741ed602f075@denx.de>
Date:   Mon, 25 Jul 2022 11:57:32 +0200
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
 <87fsiqxuvd.wl-maz@kernel.org> <fe022bcf-9ae2-8050-77fa-06eb12e35147@denx.de>
 <871qu9d6ns.wl-maz@kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <871qu9d6ns.wl-maz@kernel.org>
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

On 7/25/22 08:53, Marc Zyngier wrote:
> On Sun, 24 Jul 2022 19:15:26 +0100,
> Marek Vasut <marex@denx.de> wrote:
>>
>> On 7/24/22 19:50, Marc Zyngier wrote:
>>
>> [...]
>>
>>>> +++ b/drivers/gpio/gpio-mxc.c
>>>> @@ -147,6 +147,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>>>>    {
>>>>    	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
>>>>    	struct mxc_gpio_port *port = gc->private;
>>>> +	unsigned long flags;
>>>>    	u32 bit, val;
>>>>    	u32 gpio_idx = d->hwirq;
>>>>    	int edge;
>>>> @@ -185,6 +186,8 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>>>>    		return -EINVAL;
>>>>    	}
>>>>    +	spin_lock_irqsave(&port->gc.bgpio_lock, flags);
>>>
>>> In my tree, bgpio is a raw spinlock, and has been since 3c938cc5cebcb.
>>>
>>> Now, looking a bit closer at this code, I have to withdraw my earlier
>>> comment about the lack of mutual exclusion in the existing code. All
>>> writes are of the form:
>>>
>>> 	writel(single_bit_mask, some_addr + MXS_{SET,CLR});
>>>
>>> which indicates that the write side can be accessed with a hot-bit
>>> pattern, avoiding a RWM pattern and thus the need for a lock.
>>
>> Only for the ISR/IMR, not for the GDIR register, that's why the locks
>> are added only around the RMW which don't have these "hot bits".
> 
> Only your patch adds any GDIR access.
> 
>>> Your second patch, however requires the lock. I'm not sure it is safe
>>> to do after the interrupt type has been configured though. You may
>>> want to refer to the TRM for this.
>>
>> There is in fact another unprotected RMW in gpio_set_irq_type() , look
>> for GPIO_EDGE_SEL, so the locks should be valid as they are now, right
>> ?
> 
> I seem to be confused with gpio-mxs.c, and gpio-mxc indeed needs the
> lock.
> 
> However, you have totally ignored my earlier comments in your v4:
> 
> - This doesn't compile, as bgpio_lock has been changed to a *raw*
>    spinlock. You obviously haven't even bothered testing your patch.

Yes indeed, I tested every single one on 5.18.y . I noticed the raw 
spinlock change is only in next.

> - I asked for a cover letter for any series with multiple patch.
>    That's not exactly a new requirement.
> 
> So we got 4 versions in just over 24 hours, none of which actually
> work. Do you see the overarching problem?

Lemme rebase this on next and send v5.
