Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1D4F8EF9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 12:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfKLLwM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 06:52:12 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:56730 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726497AbfKLLwL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Nov 2019 06:52:11 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iUUiO-0006dl-1k; Tue, 12 Nov 2019 12:52:08 +0100
To:     Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH RFC v2 06/14] dt-bindings/interrupt-controller: pdc: add  SPI config register
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 12 Nov 2019 13:01:28 +0109
From:   Marc Zyngier <maz@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, <evgreen@chromium.org>,
        <linus.walleij@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <bjorn.andersson@linaro.org>,
        <mkshah@codeaurora.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>
In-Reply-To: <20191111183738.GJ16900@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
 <1568411962-1022-7-git-send-email-ilina@codeaurora.org>
 <5d92829e.1c69fb81.d860a.9096@mx.google.com>
 <5da6b849.1c69fb81.a9b04.1b9f@mx.google.com>
 <20191105205832.GE16900@codeaurora.org>
 <5dc219a0.1c69fb81.f5014.42d2@mx.google.com>
 <20191111183738.GJ16900@codeaurora.org>
Message-ID: <1fa974e73d2b4871d84501cffc4ef8d3@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: ilina@codeaurora.org, swboyd@chromium.org, evgreen@chromium.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, mkshah@codeaurora.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019-11-11 19:46, Lina Iyer wrote:
> On Tue, Nov 05 2019 at 17:53 -0700, Stephen Boyd wrote:
>>Quoting Lina Iyer (2019-11-05 12:58:32)
>>> On Tue, Oct 15 2019 at 00:27 -0600, Stephen Boyd wrote:
>>> >
>>> >I had another idea the other day. Maybe a better approach would be 
>>> to
>>> >make the mailbox or SCM code an interrupt controller with the
>>> >appropriate functions to poke the bits necessary to make the 
>>> interrupts
>>> >work. Then we can make it a chip in the hierarchy between the GIC 
>>> and
>>> >PDC and make the interrupts call through from PDC to GIC. The 
>>> locking
>>> >could be handled in each respective driver if necessary, and 
>>> otherwise
>>> >we don't have to use a regmap or remap the same registers (except 
>>> we may
>>> >need to describe if the parent is the mailbox node or the scm 
>>> fimware
>>> >node).
>>> >
>>> Wouldn't that be a stretch to image the SCM register write  or a 
>>> random
>>> register write as an interrupt controller? But I agree that it 
>>> solves
>>> the issue of determining whether we want to use SCM or regmap.
>>
>>As far as I can tell it's similar to PDC which is basically a gate on
>>the line from a dedicated chip pad or a GPIO pad that lets the 
>> interrupt
>>flow through to the GIC or not. Isn't this yet another hardware block 
>> on
>>those paths that control the edge type or something?
>>
>>>
>>> But, we would still need to add syscon to the mailbox and then 
>>> regmap
>>> the registers for the interrupt contoller.
>>
>>I'm saying that we can make the mailbox driver an interrupt 
>> controller
>>driver too. Or if that doesn't work, we can map the region twice in 
>> each
>>driver with ioremap and cross fingers that they don't touch the same
>>register at the same time. It sounds like that is the case. We won't 
>> be
>>able to fancily reserve the register region and map it in one 
>> function
>>call, but maybe that can be fixed by limiting the size or offset that 
>> is
>>reserved for each driver manually based on the same register property
>>that's described in DT. Basically, one node in DT
>>
>> mailbox@f00 {
>>   reg = <0xf00 0x1000>;
>> };
>>
>>And then each driver will ioremap() the whole register region that's
>>parsed from DT but each driver will mark sub-regions as reserved for 
>> the
>>respective driver. That way we don't have to worry about using a 
>> regmap
>>here and we'll still know what drivers are using what regions of IO 
>> in
>>/proc/iomem.
>
> Marc: What do you think of Stephen's idea? Summarizing my 
> understanding
> below -
>
> We need to set an addition register for GPIOs that are routed to PDC 
> and
> the register may need to be written using a SCM call (SDM845) or 
> written
> from Linux (SDM855). The idea proposed here is -
> Create multiple irqchips, one for each type of register access and 
> then
> put them in hierarchy based on the target.
>
> SDM845:
> TLMM  --> PDC  --> PDC-SCM-IF  --> GIC
>
> SDM855:
> TLMM  --> PDC  --> PDC-LNX-IF  --> GIC
>
> The hierarchy would be explicit from the DT. So we would not have to
> worry about figuring out using a property in DT or resource name. 
> (May
> be we can use a compatible instead?). The use of reserved_resource(),
> suggested by Stephen, would help avoid other drivers writing to this
> register which is part of a generic dump area for one-off registers.

That seems sensible: the two SoCs use different implementations of
their GPIO configurations (at least apparently, I'm pretty sure it
is the same HW underneath), and it makes sense to abstract that
as separate entities.

As for the DT binding, use whatever makes sense for you (compatible
seems a reasonable choice).

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
