Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F10625611B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 21:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgH1TT7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 15:19:59 -0400
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:59298 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725894AbgH1TT7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Aug 2020 15:19:59 -0400
Received: from [188.210.212.0] (helo=[192.168.0.104])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1kBjum-0007Bu-KM; Fri, 28 Aug 2020 20:19:56 +0100
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: Fixup mcp23x17 regmap_config
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200814100357.209340-1-thomas.preston@codethink.co.uk>
 <20200814100357.209340-2-thomas.preston@codethink.co.uk>
 <CAHp75Vefo6djXk0x9OLiqJ=jZV8dkTEoPBRwBfcr41txfSGyRw@mail.gmail.com>
From:   Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <f8368c71-33cf-46d7-d361-6c76cfb3b66e@codethink.co.uk>
Date:   Fri, 28 Aug 2020 20:19:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vefo6djXk0x9OLiqJ=jZV8dkTEoPBRwBfcr41txfSGyRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hey Andy, Linus,
Thanks for looking at this.

On 28/08/2020 11:09, Andy Shevchenko wrote:
> On Fri, Aug 14, 2020 at 1:35 PM Thomas Preston
> <thomas.preston@codethink.co.uk> wrote:
>>
>> - Fix a typo where mcp23x17 configs are referred to as mcp23x16.
> 
> I'm not sure it's correct. MPC23016 is an existing I²C IO expander.
> 

The MCP23016 device is not mentioned anywhere else in this driver. The 
only place this string is used is in `struct regmap_config 
mcp23x17_regmap` (another device). It seems to me that this is a typo 
but I might be wrong.

~/w/linux$ git grep -h compatible drivers/pinctrl/pinctrl-mcp23s08*
                 .compatible = "microchip,mcp23008",
                 .compatible = "microchip,mcp23017",
                 .compatible = "microchip,mcp23018",
                 .compatible = "mcp,mcp23008",
                 .compatible = "mcp,mcp23017",
                 .compatible = "microchip,mcp23s08",
                 .compatible = "microchip,mcp23s17",
                 .compatible = "microchip,mcp23s18",
                 .compatible = "mcp,mcp23s08",
                 .compatible = "mcp,mcp23s17",

Also I don't have an MC23016, so I can't test configuration for it.

>> - Fix precious range to include INTCAP{A,B}, which clear on read.
>> - Fix precious range to include GPIOB, which clears on read.
>> - Fix volatile range to include GPIOB, to fix debugfs registers
>>    reporting different values than `gpioget gpiochip2 {0..15}`.
> 
> I'm wondering if you read all the datasheets before doing these changes.
> MPC2308
> MPC23016
> MPC23017
> ...
> 

I did not! I was only changing configuration for MCP23017 devices.
What have I missed?

For reference, I think you are referring to [0], [1], [2]. I'm familiar 
with the last one.

>> -static const struct regmap_range mcp23x16_volatile_range = {
>> +static const struct regmap_range mcp23x17_volatile_range = {
>>          .range_min = MCP_INTF << 1,
>> -       .range_max = MCP_GPIO << 1,
>> +       .range_max = (MCP_GPIO << 1) + 1,
> 
> This looks weird. Usually we do a mask or a bit based mask, like (1 << x) - 1.
> 

I don't think these are masks, they're addresses.

I believe the author has doubled the register indexing using a 1 bit 
shift, because the MCP23017 device is configured with sequential 
addresses (IOCON.BANK = 0). On page 12 of the datasheet [2] this looks like:

0x00 IODIRA, MCP_IODIR << 1
0x01 IODIRB
0x02 IPOLA,  MCP_IPOL << 1
0x03 IPOLB
...
0x12 GPIOA,  MCP_GPIO << 1
0x13 GPIOB

This means you can read 16 bits from MCP_GPIO << 1 and get the register 
values for both banks, or even use this for .range_min.

However, this trick doesn't work for .range_max:

	.range_max = MCP_GPIO << 1; /* 0x12 */

But I think it needs to be 0x13 to include GPIOB. Now that I'm looking 
into it, how does `mcp23x17_regmap.val_bits = 16` affect this? Perhaps 
`MCP_GPIO << 1` is fine after all.

I will whip up a v2 and test this. I'll split the changes across patches 
and fix the typo last patch - in case you don't agree with me.

Many thanks,
Thomas

[0] MCP23008 https://ww1.microchip.com/downloads/en/DeviceDoc/21919e.pdf
[1] MCP23016 http://ww1.microchip.com/downloads/en/devicedoc/20090c.pdf
[2] MCP23017 https://ww1.microchip.com/downloads/en/DeviceDoc/20001952C.pdf
