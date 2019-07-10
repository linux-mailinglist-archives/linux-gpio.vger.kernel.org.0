Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC3B6438F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2019 10:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfGJI2v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jul 2019 04:28:51 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:39239 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfGJI2v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jul 2019 04:28:51 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hl7y2-0003Dl-9A from Harish_Kandiga@mentor.com ; Wed, 10 Jul 2019 01:28:46 -0700
Received: from [10.0.3.15] (137.202.0.90) by svr-ies-mbx-01.mgc.mentorg.com
 (139.181.222.1) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Wed, 10 Jul
 2019 09:28:41 +0100
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
To:     Rob Herring <robh+dt@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <CAL_Jsq+-xWLkvku-nLmJnFvbuS=dSD=9dG=GS4uBUqL50tdcDg@mail.gmail.com>
 <06c95f15-d577-e43d-e046-ee222f86c406@mentor.com>
 <CAL_JsqLQvjtnfUsZ2RP4eozvdwMLzNxtgmT+XFaxW4xzoFjL=w@mail.gmail.com>
From:   Harish Jenny K N <harish_kandiga@mentor.com>
Message-ID: <f1616784-4dbf-d0fa-b33e-c85fd569383a@mentor.com>
Date:   Wed, 10 Jul 2019 13:58:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLQvjtnfUsZ2RP4eozvdwMLzNxtgmT+XFaxW4xzoFjL=w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 09/07/19 9:38 PM, Rob Herring wrote:
> On Mon, Jul 8, 2019 at 11:25 PM Harish Jenny K N
> <harish_kandiga@mentor.com> wrote:
>> Hi Rob,
>>
>>
>> On 09/07/19 4:06 AM, Rob Herring wrote:
>>> On Fri, Jun 28, 2019 at 3:31 AM Harish Jenny K N
>>> <harish_kandiga@mentor.com> wrote:
>>>> Document the device tree binding for the inverter gpio
>>>> controller to configure the polarity of the gpio pins
>>>> used by the consumers.
>>>>
>>>> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
>>>> ---
>>>>  .../devicetree/bindings/gpio/gpio-inverter.txt     | 29 ++++++++++++++++++++++
>>>>  1 file changed, 29 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-inverter.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-inverter.txt b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
>>>> new file mode 100644
>>>> index 0000000..8bb6b2e
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/gpio/gpio-inverter.txt
>>>> @@ -0,0 +1,29 @@
>>>> +GPIO-INVERTER
>>>> +======
>>>> +This binding defines the gpio-inverter. The gpio-inverter is a driver that
>>>> +allows to properly describe the gpio polarities on the hardware.
>>> I don't understand. Please explain this in terms of the hardware, not a driver.
>>
>> gpio inverters can be used on different hardware to alter the polarity of gpio chips.
>> The polarity of pins can change from hardware to hardware with the use of inverters.
> Yes, I know what an inverter is.
>
>> This device tree binding models gpio inverters in the device tree to properly describe the hardware.
> We already define the active state of GPIOs in the consumers. If
> there's an inverter in the middle, the consumer active state is simply
> inverted. I don't agree that that is a hack as Linus said without some
> reasoning why an inverter needs to be modeled in DT. Anything about
> what 'userspace' needs is not a reason. That's a Linux thing that has
> little to do with hardware description.


Yes we are talking about the hardware level inversions here. The usecase is for those without the gpio consumer driver. The usecase started with the concept of allowing an abstraction of the underlying hardware for the userland controlling program such that this program does not care whether the GPIO lines are inverted or not physically. In other words, a single userland controlling program can work unmodified across a variety of hardware platforms with the device tree mapping the logical to physical relationship of the GPIO hardware.
I totally understand anything about what 'userspace' needs is not a reason, but this is not restricted to userspace alone as kernel drivers may need this just as much. Also we are just modelling/describing the hardware state in the device tree.

Just to mention that Linus Walleij had proposed this inverter model to describe the hardware and the gpio inverter driver is developed based on comments/review from him.

Also my sincere request to Linus Walleij to please let his opinion know on this.

Thanks,

Best Regards,
Harish Jenny K N



