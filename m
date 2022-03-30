Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80EAC4EC562
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Mar 2022 15:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345012AbiC3NVU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Mar 2022 09:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245017AbiC3NVT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Mar 2022 09:21:19 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BA833364
        for <linux-gpio@vger.kernel.org>; Wed, 30 Mar 2022 06:19:33 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22UDJFoT098477;
        Wed, 30 Mar 2022 08:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1648646355;
        bh=dBjSCLLBR6TVP/fsPUQUa6UDRqHoFITZCVv8ahvYqR8=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=CwOKwOpiiABMuIPF86Yk+6LHXMzB0J5tEou0V8+dHjdj9ONfffaFQhNL6v9i5DVwI
         HfhvUcX7f0ifEhgTgw5+95fseSA8APsUqKHbFJM0Yl/4tgZFdfrRFOWvWcmRe4LYHM
         aAPzDTKw7sAhQoYCtPDGqvKuCsDSWyjlBLQRanr4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22UDJENJ030839
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Mar 2022 08:19:15 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 30
 Mar 2022 08:19:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 30 Mar 2022 08:19:14 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22UDJCZT085274;
        Wed, 30 Mar 2022 08:19:13 -0500
Message-ID: <61b715ca-075f-0f93-1c0f-a256ceb2b057@ti.com>
Date:   Wed, 30 Mar 2022 16:19:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Sv: GPIO level IRQ fires twice each time.
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Markus Mirevik <markus.mirevik@dpsolutions.se>,
        Kent Gibson <warthog618@gmail.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <HE1PR04MB3100579720F6EBBD634C99EEE65B9@HE1PR04MB3100.eurprd04.prod.outlook.com>
 <20220122235959.GA10737@sol>
 <HE1PR04MB310027275C077FFA647E93CAE65E9@HE1PR04MB3100.eurprd04.prod.outlook.com>
 <ea65d00c-b2d8-3be5-51d9-05c4dc1616c4@metafoo.de>
 <1c646fb4-16d5-bf93-cb7d-12683a428893@metafoo.de>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
In-Reply-To: <1c646fb4-16d5-bf93-cb7d-12683a428893@metafoo.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Markus,

On 24/01/2022 09:58, Lars-Peter Clausen wrote:
> On 1/24/22 08:56, Lars-Peter Clausen wrote:
>> On 1/24/22 08:12, Markus Mirevik wrote:
>>>> On Fri, Jan 21, 2022 at 09:03:43AM +0000, Markus Mirevik wrote:
>>>>> I have a problem with a custom bord based on SoC am335x and a driver
>>>> utilizing a GPIO line for interrupts.
>>>>> I have two mcp2518fd chip connected on one SPI line and everything
>>>> works, but it's hogs a lot of CPU.
>>>>> In the current setup only one chip is connected and it only receives packets.
>>>>>
>>>>> The mcp2518fd is connected with 2 interrupt lines one "main" and one for
>>>> rx frames.
>>>>> The problem is that for every frame received the interrupt handler is run
>>>> twice, which is kind of expensive since it's a SPI call to the chip to check
>>>> interrupt registers.
>>>>> To me it looks like the interrupt is fired again as soon as it's unmasked.
>>>> Either because it's queued? or maybe not cleared internally?
>>>>> I have scoped the interrupt signal and its real good without any glitches.
>>>>>
>>>>> I'm currently running a yocto build:
>>>>> Linux botekcc 5.10.79-yocto-tiny #1 SMP Tue Nov 16 03:57:43 UTC 2021
>>>>> armv7l armv7l armv7l GNU/Linux
>>>>>
>>>>> But the mcp251xfd driver is from net-next/master
>>>>>
>>>>> mcp251xfd_irq is the irqhandler for the mcp2518fd and is added like this:
>>>>> err = request_threaded_irq(spi->irq, NULL, mcp251xfd_irq,
>>>>>                                     IRQF_SHARED | IRQF_ONESHOT,
>>>>> dev_name(&spi->dev), priv);
>>>>>
>>>> You haven't set a IRQF_TRIGGER flag, so you are getting the "as-already-
>>>> configured" behaviour, which on your setup is both edges?
>>>> Try adding IRQF_TRIGGER_RISING, IRQF_TRIGGER_FALLING,
>>>> IRQF_TRIGGER_HIGH or IRQF_TRIGGER_LOW, as appropriate to your use
>>>> case, to your flags.
>>>>
>>>> Cheers,
>>>> Kent.
>>> I have tried with the IRQF_TRIGGGER_LOW flag as well. With same result. i.e the interrupt is fired again as soon as the handler is ready. Even if the interrupt line is deactivated.
>>> However if I change the trigger to edge falling the interrupt will only fire once. But his will inevitably lead to a missed edge eventually.
>>
>> Depending on how the mcp2518 GPIO controller works internally its driver might have to use the handle_fasteoi_irq() flow to avoid this. It is not uncommon to have hardware which needs a level IRQ acked after the interrupt handler has run, rather than before like the handle_level_irq() does. E.g. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpio/gpio-zynq.c?id=6dd859508336f0fd078fd62f3b9fe42a32aa38e2
>>
>> - Lars
>>
> Sorry, I meant `Depending on how the am335x interrupt controller works...`
> 


Could  you try to test below diff (may not be applied cleanly):

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 2a4a11634dd1..41ec54c3609f 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -896,6 +896,8 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
         raw_spin_lock_irqsave(&bank->lock, flags);
         omap_set_gpio_irqenable(bank, offset, 1);
  
+       if (trigger)
+               omap_set_gpio_triggering(bank, offset, trigger);
         /*
          * For level-triggered GPIOs, clearing must be done after the source
          * is cleared, thus after the handler has run. OMAP4 needs this done
@@ -905,9 +907,6 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
             trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
                 omap_clear_gpio_irqstatus(bank, offset);
  
-       if (trigger)
-               omap_set_gpio_triggering(bank, offset, trigger);
-
         raw_spin_unlock_irqrestore(&bank->lock, flags);
  }

Assumption - clearing IRQ status may require IRQ type configured.

-- 
Best regards,
Grygorii, Ukraine
