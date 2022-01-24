Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21BD4979E2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 08:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241955AbiAXH67 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 02:58:59 -0500
Received: from www381.your-server.de ([78.46.137.84]:42952 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235469AbiAXH67 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jan 2022 02:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
         s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=0T0jN2oGYVmc8e5eKIfvBFNvkkhdV65lfFlgJ4nzy+U=; b=BUDWPGEIaYzulc+VuiTJpZStzc
        rtvNOJzotmgSVkJyrKmFy5tSzRWTg0RrPsV5s18oqsTcKvKyuc3PQ1ZNHTx6ImtthAKSHze51fdIj
        ZsETX7JyNEflNYxcx70wF1Z5p/g94Rg2tn1/mPYdTFt9IoDNUNh8g/1Yo5yBrsaXwheMO8PA8DPyR
        GCF7lbnN/wK/6mzTWs7t46FFvkH22U1OvHCRivzCwWsN1n20emojfZS/fHcpvniq5k3FE8Ag4A2No
        VqEvMMdz1S+ld2Zt7JEtMbEgTqAcmoitbLdpMvfCjpykN6rrsrhFncmSVimyfc8SBzH3GHOmUk8Os
        jN3s4YmQ==;
Received: from [78.46.152.42] (helo=sslproxy04.your-server.de)
        by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <lars@metafoo.de>)
        id 1nBuFd-000E9f-VT; Mon, 24 Jan 2022 08:58:57 +0100
Received: from [2001:a61:2ac4:3301:9e5c:8eff:fe01:8578]
        by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1nBuFd-0000Ys-RR; Mon, 24 Jan 2022 08:58:57 +0100
Message-ID: <1c646fb4-16d5-bf93-cb7d-12683a428893@metafoo.de>
Date:   Mon, 24 Jan 2022 08:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Sv: GPIO level IRQ fires twice each time.
Content-Language: en-US
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Markus Mirevik <markus.mirevik@dpsolutions.se>,
        Kent Gibson <warthog618@gmail.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <HE1PR04MB3100579720F6EBBD634C99EEE65B9@HE1PR04MB3100.eurprd04.prod.outlook.com>
 <20220122235959.GA10737@sol>
 <HE1PR04MB310027275C077FFA647E93CAE65E9@HE1PR04MB3100.eurprd04.prod.outlook.com>
 <ea65d00c-b2d8-3be5-51d9-05c4dc1616c4@metafoo.de>
In-Reply-To: <ea65d00c-b2d8-3be5-51d9-05c4dc1616c4@metafoo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26431/Sun Jan 23 10:22:56 2022)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/24/22 08:56, Lars-Peter Clausen wrote:
> On 1/24/22 08:12, Markus Mirevik wrote:
>>> On Fri, Jan 21, 2022 at 09:03:43AM +0000, Markus Mirevik wrote:
>>>> I have a problem with a custom bord based on SoC am335x and a driver
>>> utilizing a GPIO line for interrupts.
>>>> I have two mcp2518fd chip connected on one SPI line and everything
>>> works, but it's hogs a lot of CPU.
>>>> In the current setup only one chip is connected and it only 
>>>> receives packets.
>>>>
>>>> The mcp2518fd is connected with 2 interrupt lines one "main" and 
>>>> one for
>>> rx frames.
>>>> The problem is that for every frame received the interrupt handler 
>>>> is run
>>> twice, which is kind of expensive since it's a SPI call to the chip 
>>> to check
>>> interrupt registers.
>>>> To me it looks like the interrupt is fired again as soon as it's 
>>>> unmasked.
>>> Either because it's queued? or maybe not cleared internally?
>>>> I have scoped the interrupt signal and its real good without any 
>>>> glitches.
>>>>
>>>> I'm currently running a yocto build:
>>>> Linux botekcc 5.10.79-yocto-tiny #1 SMP Tue Nov 16 03:57:43 UTC 2021
>>>> armv7l armv7l armv7l GNU/Linux
>>>>
>>>> But the mcp251xfd driver is from net-next/master
>>>>
>>>> mcp251xfd_irq is the irqhandler for the mcp2518fd and is added like 
>>>> this:
>>>> err = request_threaded_irq(spi->irq, NULL, mcp251xfd_irq,
>>>>                                     IRQF_SHARED | IRQF_ONESHOT,
>>>> dev_name(&spi->dev), priv);
>>>>
>>> You haven't set a IRQF_TRIGGER flag, so you are getting the 
>>> "as-already-
>>> configured" behaviour, which on your setup is both edges?
>>> Try adding IRQF_TRIGGER_RISING, IRQF_TRIGGER_FALLING,
>>> IRQF_TRIGGER_HIGH or IRQF_TRIGGER_LOW, as appropriate to your use
>>> case, to your flags.
>>>
>>> Cheers,
>>> Kent.
>> I have tried with the IRQF_TRIGGGER_LOW flag as well. With same 
>> result. i.e the interrupt is fired again as soon as the handler is 
>> ready. Even if the interrupt line is deactivated.
>> However if I change the trigger to edge falling the interrupt will 
>> only fire once. But his will inevitably lead to a missed edge 
>> eventually.
>
> Depending on how the mcp2518 GPIO controller works internally its 
> driver might have to use the handle_fasteoi_irq() flow to avoid this. 
> It is not uncommon to have hardware which needs a level IRQ acked 
> after the interrupt handler has run, rather than before like the 
> handle_level_irq() does. E.g. 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpio/gpio-zynq.c?id=6dd859508336f0fd078fd62f3b9fe42a32aa38e2
>
> - Lars
>
Sorry, I meant `Depending on how the am335x interrupt controller works...`

