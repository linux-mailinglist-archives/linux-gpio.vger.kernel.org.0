Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A19810C32E
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 05:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfK1ESJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 23:18:09 -0500
Received: from anchovy3.45ru.net.au ([203.30.46.155]:57342 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfK1ESJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 23:18:09 -0500
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Wed, 27 Nov 2019 23:18:08 EST
Received: (qmail 3135 invoked by uid 5089); 28 Nov 2019 04:11:27 -0000
Received: by simscan 1.2.0 ppid: 3064, pid: 3068, t: 0.0648s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.22?) (preid@electromag.com.au@203.59.235.95)
  by anchovy2.45ru.net.au with ESMTPA; 28 Nov 2019 04:11:27 -0000
Subject: Re: Multiple SPI MCP23S17s sharing a CS line
To:     Linus Walleij <linus.walleij@linaro.org>,
        Phil Elwell <phil@raspberrypi.org>,
        Jason Kridner <jkridner@gmail.com>,
        =?UTF-8?Q?Jan_Kundr=c3=a1t?= <jan.kundrat@cesnet.cz>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <d8f95334-789e-995b-9abf-7bb15abb1daa@raspberrypi.org>
 <CACRpkdbWZqNzEcLAjCma8=YdjDPbnZaxt3KYvZTdELLrGzm_FQ@mail.gmail.com>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <943fd3dd-9090-0c7b-3010-c92c139503b0@electromag.com.au>
Date:   Thu, 28 Nov 2019 12:11:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdbWZqNzEcLAjCma8=YdjDPbnZaxt3KYvZTdELLrGzm_FQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/11/2019 20:36, Linus Walleij wrote:
> Hi Phil,
> 
> I think the people I added to the To: line are better suited to answer
> this question, they have used the MCP23* chips in practice more
> than me and know how they work.
> 
> Some minor comments inline.
> 
> On Wed, Nov 27, 2019 at 12:20 PM Phil Elwell <phil@raspberrypi.org> wrote:
> 
>> We have a user asking for help to construct a Device Tree overlay to use
>> the GPIOs exported by multiple MCP23S17s sharing an SPI Chip Select
>> line. This is a special feature of the MCP devices whereby the SPI bus
>> is treated rather like an I2C bus with each device assigned a unique
>> address. His problem is in constructing gpiospecs to refer to all of the
>> GPIOs.
>>
>> The mcp23s08 driver claims to support this feature, and there is a DT
>> property ("microchip,spi-present-mask") to declare which addresses are
>> used buy the devices.
> 
> It's an interesting hack and I kind of see why they are doing it.
> 
>>   I've spent an hour or so looking at the driver
>> code and crawling through the kernel GPIO infrastructure, and I don't
>> think it's possible. Here's my logic:
>>
>> 1. Although all devices that are found are presented as a single SPI
>> device, they are each registered as independent gpio_chips.
> 
> So they are presented as a single SPI device, but they are
> different physical packages (right?) so it is actually correct to
> have several gpio_chips but incorrect that they are all
> represented in a single device tree node.
> 
> Interestingly there is not a single device tree in the entire
> kernel that uses the "*,spi-present-mask" attribute.
> 
> Could you provide an example?
> 
> I *THINK* the idea behind this attribute is just plain wrong
> and cannot be made to work.
> 
> Instead the device should be represented as one SPI node
> with subnodes for each separate physical device when this
> attribute would be used.
> 
> mcp {
>      compatible = "microchip,mcp23s08";
>      microchip,spi-present-mask = <0x03>;
>      mcp0: chip0 {
>          reg = <0>;
>        ....
>      }
>      mcp1: chip1 {
>          reg = <1>;
>        ....
>      }
> };
> 
> By introducing such child nodes it gets possible to reference
> these chips by phandle <&mcp1 ...>;
> 
> Notice use of reg attribute to address subchip.
> 
> IIUC this needs to be figured out and both the DT bindings
> and the driver need to be fixed to support this peculiar addressing
> scheme.
> 

Similar problem has come up before with gpio line props from Jan.
The above was similar to what was discussed previously a couple of times.
eg: https://patchwork.ozlabs.org/patch/1052925/

I'd say it's the way to solve the problem.

I don't have any shared cs spi devices so it hasn't been relevant to my systems.

-- 
Regards
Phil Reid


