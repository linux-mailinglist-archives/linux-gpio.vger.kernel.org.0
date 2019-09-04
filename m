Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 419DDA7A7C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 06:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbfIDE6i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 00:58:38 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:7675 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfIDE6i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 00:58:38 -0400
IronPort-SDR: sPBjFUfOqu+dRP/5kqV8tOVVrK3Bz1WrRd8g8c9B+TG3cweLBoh5V8ylEI3oX6CgEKq/0Sd/Bt
 4Th1Cws8oJja7+ZCOhJa/q8w+kLErMs9PCtVMhmFJ8cbWdi4T83AE9r1eJGU5A2gA76H0jdpe9
 s0vGVyW3KyErsK0ZKcX37VDPH/J0wMDiCrIIcplwoJ4JSehUFF5lEvvAyTZurbO3IPzPezvCq+
 NZ9sB6XWFHpggK3UxNOfWsjOK25Fapg2uPRsvYGcWFK4qmHozZhJGDI/ktKAQb7fY//lBkRaQl
 SsY=
X-IronPort-AV: E=Sophos;i="5.64,465,1559548800"; 
   d="scan'208";a="42821647"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 03 Sep 2019 20:58:37 -0800
IronPort-SDR: XQxMLLzUb4+/xUyStAgEgBJ00j/xSAq30EQTZu4zgFG/D7/PFQjIweupVvyaGpOb4HhtWoz3aA
 xHV3A4gNf2FXJJln5yyd6cuGn6fWzRoATpFt7SDqIhGTR91U6oLVK3pkTKiCXJjXzHeV1FiZ/6
 9bhPGWVpcnlMCtX/oujUu97nlBOUpMgpBt9GP5hodgOpY6BQbCjYqBCyl5KMjr4HhH1sSucVDL
 +Pn6gWzQXjIiuOVjCrMuDfCe30m9MX42VudLIZvp5i4pzAf4CzOagp6r1xM5cKbbLogP/nIMMe
 Iwk=
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, <robh@kernel.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <CAL_Jsq+-xWLkvku-nLmJnFvbuS=dSD=9dG=GS4uBUqL50tdcDg@mail.gmail.com>
 <06c95f15-d577-e43d-e046-ee222f86c406@mentor.com>
 <CAL_JsqLQvjtnfUsZ2RP4eozvdwMLzNxtgmT+XFaxW4xzoFjL=w@mail.gmail.com>
 <f1616784-4dbf-d0fa-b33e-c85fd569383a@mentor.com>
 <CACRpkdZ+vXG-mGjn0Tt5gyGowAuxiCSQNdjEPGTP9qj23CwkSw@mail.gmail.com>
 <CAL_JsqLp___2O-naU+2PPQy0QmJX6+aN3hByz-OB9+qFvWgN9Q@mail.gmail.com>
 <CACRpkdbmyc9LsJ2xiX=zAQR9FZ9dmwu-nPrNbt1Tgud9+rBGpw@mail.gmail.com>
 <978af20e-12aa-a8e9-5da9-9af6d6b8f553@mentor.com>
 <f47588d5-226a-6a7a-6c74-c0caaafaf572@mentor.com>
 <6673873d-3ed2-ba98-8448-8047eccc994f@mentor.com>
Message-ID: <fbc51f91-75ac-ef57-137b-0d8231cccc34@mentor.com>
Date:   Wed, 4 Sep 2019 10:28:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6673873d-3ed2-ba98-8448-8047eccc994f@mentor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob, Hi Linus,


On 30/08/19 10:51 AM, Harish Jenny K N wrote:
> Hi Rob,
>
>
> On 27/08/19 1:17 PM, Harish Jenny K N wrote:
>> Hi Rob,
>>
>>
>> On 19/08/19 3:06 PM, Harish Jenny K N wrote:
>>> Hi Rob,
>>>
>>>
>>> On 10/08/19 2:21 PM, Linus Walleij wrote:
>>>> On Fri, Aug 9, 2019 at 4:08 PM Rob Herring <robh+dt@kernel.org> wrote:
>>>>> On Mon, Aug 5, 2019 at 5:15 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>>>>>> There is some level of ambition here which is inherently a bit fuzzy
>>>>>> around the edges. ("How long is the coast of Britain?" comes to mind.)
>>>>>>
>>>>>> Surely the intention of device tree is not to recreate the schematic
>>>>>> in all detail. What we want is a model of the hardware that will
>>>>>> suffice for the operating system usecases.
>>>>>>
>>>>>> But sometimes the DTS files will become confusing: why is this
>>>>>> component using GPIO_ACTIVE_LOW when another system
>>>>>> doesn't have that flag? If there is an explicit inverter, the
>>>>>> DTS gets more readable for a human.
>>>>>>
>>>>>> But arguable that is case for adding inverters as syntactic
>>>>>> sugar in the DTS compiler instead...
>>>>> If you really want something more explicit, then add a new GPIO
>>>>> 'inverted' flag. Then a device can always have the same HIGH/LOW flag.
>>>>> That also solves the abstract it for userspace problem.
>>>> I think there are some intricate ontologies at work here.
>>>>
>>>> Consider this example: a GPIO is controlling a chip select
>>>> regulator, say Acme Foo. The chip select
>>>> has a pin named CSN. We know from convention that the
>>>> "N" at the end of that pin name means "negative" i.e. active
>>>> low, and that is how the electronics engineers think about
>>>> that chip select line: it activates the IC when
>>>> the line goes low.
>>>>
>>>> The regulator subsystem and I think all subsystems in the
>>>> Linux kernel say the consumer pin should be named and
>>>> tagged after the datsheet of the regulator.
>>>>
>>>> So it has for example:
>>>>
>>>> foo {
>>>>     compatible = "acme,foo";
>>>>     cs-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
>>>> };
>>>>
>>>> (It would be inappropriate to name it "csn-gpios" since
>>>> we have an established flag for active low. But it is another
>>>> of these syntactic choices where people likely do mistakes.)
>>>>
>>>> I think it would be appropriate for the DT binding to say
>>>> that this flag must always be GPIO_ACTIVE_LOW since
>>>> the bindings are seen from the component point of view,
>>>> and thus this is always active low.
>>>>
>>>> It would even be reasonable for a yaml schema to enfore
>>>> this, if it could. It is defined as active low after all.
>>>>
>>>> Now if someone adds an inverter on that line between
>>>> gpio0 and Acme Foo it looks like this:
>>>>
>>>> foo {
>>>>     compatible = "acme,foo";
>>>>     cs-gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
>>>> };
>>>>
>>>> And now we get cognitive dissonance or whatever I should
>>>> call it: someone reading this DTS sheet and the data
>>>> sheet for the component Acme Foo to troubleshoot
>>>> this will be confused: this component has CS active
>>>> low and still it is specified as active high? Unless they
>>>> also look at the schematic or the board and find the
>>>> inverter things are pretty muddy and they will likely curse
>>>> and solve the situation with the usual trial-and-error,
>>>> inserting some random cursewords as a comment.
>>>>
>>>> With an intermediate inverter node, the cs-gpios
>>>> can go back to GPIO_ACTIVE_LOW and follow
>>>> the bindings:
>>>>
>>>> inv0: inverter {
>>>>     compatible = "gpio-inverter";
>>>>     gpio-controller;
>>>>     #gpio-cells = <1>;
>>>>     inverted-gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
>>>> };
>>>>
>>>> foo {
>>>>     compatible = "acme,foo";
>>>>     cs-gpios = <&inv0 0 GPIO_ACTIVE_LOW>;
>>>> };
>>>>
>>>> And now Acme Foo bindings can keep enforcing cs-gpios
>>>> to always be tagged GPIO_ACTIVE_LOW.
>>> Can you please review/let us know your opinion on this ? I think the idea here is to also isolate the changes to a separate consumer driver and avoid getting inversions inside gpiolib.
>>>
>>>
>>> Thanks.
>>>
>>>
>>> Regards,
>>>
>>> Harish Jenny K N
>>>
>> Can you please comment on this ?
>>
>>
>> Thanks,
>>
>> Harish Jenny K N
>>
> Friendly Reminder.
>
> can we please finalize this ?
>
> Linus has also mentioned in another patchset "[PATCH v2] Input: tsc2007 - use GPIO descriptor" that
>
> he is in favor of introducing explicit inverters in device tree.
>
>
> Please consider this and let us know your inputs.
>
>
>
> Thanks,
>
> Harish Jenny K N
>

Can we please finalize this ?


Sorry for the repeated emails.

Am I missing something here ? I am not getting replies.



Thanks,

Harish Jenny K N



