Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE995AE1C3
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 10:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbiIFIAp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 04:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbiIFIAo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 04:00:44 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED4726ADD
        for <linux-gpio@vger.kernel.org>; Tue,  6 Sep 2022 01:00:43 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 598EC4195A;
        Tue,  6 Sep 2022 08:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662451242; bh=k5TWm1XP5pcR2xRgfu1N6rqx92XM+FWn7U6xtLXwbik=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=jq7ENYaok8ZfdAiT7t4E0EbQfmSKQ49SQfDHxVr8lMF6iQuzHYZPzwC2PnEJkefQa
         Rccd2cyxAwNLETulV5JSv6hrzFjGBT22rK0h2n9CjCNSwwFqcKVsSdD0B5HLPdUEJI
         gxjZXMswgEid9b0SX+rI4lZ4DdB8b6Kw8jTl74jc+oGLfEobvfbzExPeRhyiLym4Ts
         cel2lnQCzVBBevwFaGc198/gHLllKyYa24AttnoTxo6pi5RsvewlE1BRpzefNGBLlc
         hcZ4uEXg4abCFzZBa6WjSNea1cy3spzvD9h/RaFvj/BqCMLZBJGK8sLAf5paZ4rGuX
         GAEVD5/aJbWrg==
Message-ID: <6f93d53d-4771-15a2-f76d-38eb4b60e66e@marcan.st>
Date:   Tue, 6 Sep 2022 17:00:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 6/6] gpio: macsmc: Add IRQ support
Content-Language: es-ES
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
 <CACRpkdaR9rBdPC_OBKx5e+=EtbR-Jn3GzrvGRYHMJmXwRxPhyg@mail.gmail.com>
 <9cf54921-c6a5-b328-6941-d1cbe086bcda@marcan.st>
 <Yxb7Fm5hm5JF9JiA@shell.armlinux.org.uk>
From:   Hector Martin <marcan@marcan.st>
In-Reply-To: <Yxb7Fm5hm5JF9JiA@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/09/2022 16.47, Russell King (Oracle) wrote:
> On Tue, Sep 06, 2022 at 04:00:31PM +0900, Hector Martin wrote:
>> On 02/09/2022 22.21, Linus Walleij wrote:
>>>> +       switch (type & IRQ_TYPE_SENSE_MASK) {
>>>> +       case IRQ_TYPE_LEVEL_HIGH:
>>>> +               mode = IRQ_MODE_HIGH;
>>>> +               break;
>>>> +       case IRQ_TYPE_LEVEL_LOW:
>>>> +               mode = IRQ_MODE_LOW;
>>>> +               break;
>>>> +       case IRQ_TYPE_EDGE_RISING:
>>>> +               mode = IRQ_MODE_RISING;
>>>> +               break;
>>>> +       case IRQ_TYPE_EDGE_FALLING:
>>>> +               mode = IRQ_MODE_FALLING;
>>>> +               break;
>>>> +       case IRQ_TYPE_EDGE_BOTH:
>>>> +               mode = IRQ_MODE_BOTH;
>>>> +               break;
>>>> +       default:
>>>> +               return -EINVAL;
>>>
>>> I don't know how level IRQs would work on this essentially
>>> message-passing process context interrupt. Maybe I am getting
>>> it all wrong, but for level the line should be held low/high until
>>> the IRQ is serviced, it would be possible to test if this actually
>>> works by *not* servicing an IRQ and see if the SMC then sends
>>> another message notifier for the same IRQ.
>>>
>>> I strongly suspect that actually only edges are supported, but
>>> there might be semantics I don't understand here.
>>
>> IIRC that is exactly what happens - the SMC will re-fire the IRQ after
>> the ACK if it is set to level mode and still at the active level.
>>
>> I do remember testing all the modes carefully when implementing this to
>> figure out what the precise semantics are, and I *think* I agonized over
>> the flow handlers quite a bit and decided this way would work properly
>> for all the modes, but it's been a while so I'd have to take a look
>> again to convince myself again :)
> 
> Thanks for the clarification - I think it would be useful to put some
> of that as comments before the CMD_IRQ_ACK write to head off any
> questions about this in the future. Something like this maybe?
> 
>         /*
>          * This is not an "ack" int he i8253 PIC sense - it is used for level
>          * interrupts as well. The SMC will re-fire the interrupt event after
>          * this ACK if the level interrupt is still active.
>          */
>         if (apple_smc_write_u32(smcgp->smc, key, CMD_IRQ_ACK | 1) < 0)
>                 dev_err(smcgp->dev, "GPIO IRQ ack failed for %p4ch\n", &key);
> 

Sounds good to me! (nit: typo on "int he")

- Hector
