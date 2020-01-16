Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D807113D388
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 06:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgAPFRT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 00:17:19 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:18103 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbgAPFRT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jan 2020 00:17:19 -0500
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Jan 2020 00:17:18 EST
IronPort-SDR: OX6zJ95sovONRfQnTjo48l7mK51NATeL9LWJ4HdR/EqgorebtLgAc9bQIChkKdQgDB3Glq2PiD
 xOMdkaJje84Hm5Lr0kJh2qxG+uXnamP4t57G7T+A/qGv6chu2ts9ldYPs5T1WYAhUQEjl4/n2p
 2F+nz8kU/RdCQXBoqePy1fQ0QYjma5O7Aq146nY4DbjDodD89jKlAK+aRh+VJzIqpNobEiJyjp
 GQrv5Q2aJKtNmNv5czH3+Nn0cYMezDWeteh7iEkaif5ZMk9R8tm52rV7TT8JyzG1QA0kjqnUcy
 P+Q=
X-IronPort-AV: E=Sophos;i="5.70,325,1574150400"; 
   d="scan'208";a="44969072"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 15 Jan 2020 21:10:10 -0800
IronPort-SDR: CHHfjXsW/HCOjvakfqh9V09To9kzoQTZOG4Rcz17cazoVVdFgLqd3Hm7/2PrOdBpfxeRRbAU/a
 tyu49+9J2KA96RnqRs33qh5KKl3ZGAIhlW6qFvMSyJLtyTqKy/+emp9dROwp3CW8EpNe6ALtH0
 SARCIu3JMQjkMDnmMial2ExZ+SGnCclmQ57YnlJnQFubmsCxQCTv0aZdDgWmw0eXaiFs0NtnTV
 TpcfPnhsiFcu1Y3MKfOPf8c8sojt2X1/cucTpepI+k7iCGMoerw/G6jfPzaVLRe/MXAD4Ff9fQ
 Ac8=
Subject: Re: [PATCH v3 4/7] dt-bindings: gpio: Add gpio-repeater bindings
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-5-geert+renesas@glider.be>
 <20191205210653.GA29969@bogus>
 <CAMuHMdXKPC7-XaezodwL1Dhvke6PUVSZEbvN-sm3Uh6T61qbhQ@mail.gmail.com>
 <CAL_JsqJLJPSYroX0mbBUpgWPV0oEvKEUNC-VZt4XFDF8tLuNFA@mail.gmail.com>
 <CAMuHMdXOJSZUDmn8aeTynN0TKCS5hJR+uMSinOmgbmA8YmsQjw@mail.gmail.com>
 <bb5fb539-0d0d-6356-35c2-8ba47cb9fcbf@mentor.com>
Message-ID: <4dccaf48-c652-a5f4-49f3-ccc279d5548e@mentor.com>
Date:   Thu, 16 Jan 2020 10:39:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bb5fb539-0d0d-6356-35c2-8ba47cb9fcbf@mentor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,


On 07/01/20 2:52 PM, Harish Jenny K N wrote:
> On 06/01/20 1:42 PM, Geert Uytterhoeven wrote:
>> Hi Rob,
>>
>> On Fri, Dec 6, 2019 at 4:04 PM Rob Herring <robh@kernel.org> wrote:
>>> On Fri, Dec 6, 2019 at 3:17 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>> On Thu, Dec 5, 2019 at 10:06 PM Rob Herring <robh@kernel.org> wrote:
>>>>> On Wed, Nov 27, 2019 at 09:42:50AM +0100, Geert Uytterhoeven wrote:
>>>>>> Add Device Tree bindings for a GPIO repeater, with optional translation
>>>>>> of physical signal properties.  This is useful for describing explicitly
>>>>>> the presence of e.g. an inverter on a GPIO line, and was inspired by the
>>>>>> non-YAML gpio-inverter bindings by Harish Jenny K N
>>>>>> <harish_kandiga@mentor.com>[1].
>>>>>>
>>>>>> Note that this is different from a GPIO Nexus Node[2], which cannot do
>>>>>> physical signal property translation.
>>>>> It can't? Why not? The point of the passthru mask is to not do
>>>>> translation of flags, but without it you are always doing translation of
>>>>> cells.
>>>> Thanks for pushing me deeper into nexuses!
>>>> You're right, you can map from one type to another.
>>>> However, you cannot handle the "double inversion" of an ACTIVE_LOW
>>>> signal with a physical inverter added:
>>>>
>>>>         nexus: led-nexus {
>>>>                 #gpio-cells = <2>;
>>>>                 gpio-map = <0 0 &gpio2 19 GPIO_ACTIVE_LOW>,     // inverted
>>>>                            <1 0 &gpio2 20 GPIO_ACTIVE_HIGH>,    // noninverted
>>>>                            <2 0 &gpio2 21 GPIO_ACTIVE_LOW>;     // inverted
>>>>                 gpio-map-mask = <3 0>;
>>>>                 // default gpio-map-pass-thru = <0 0>;
>>>>         };
>>>>
>>>>         leds {
>>>>                 compatible = "gpio-leds";
>>>>                 led6-inverted {
>>>>                         gpios = <&nexus 0 GPIO_ACTIVE_HIGH>;
>>>>                 };
>>>>                 led7-noninverted {
>>>>                         gpios = <&nexus 1 GPIO_ACTIVE_HIGH>;
>>>>                 };
>>>>                 led8-double-inverted {  // FAILS: still inverted
>>>>                         gpios = <&nexus 2 GPIO_ACTIVE_LOW>;
>>>>                 };
>>>>         };
>>>>
>>>> It "works" if the last entry in gpio-map is changed to GPIO_ACTIVE_HIGH.
>>>> Still, the consumer would see the final translated polarity, and not the
>>>> actual one it needs to program the consumer for.
>>> I'm not really following. Why isn't a double inversion just the same
>>> as no inversion?
>> Because the nexus can only mask and/or substitute bits.
>> It cannot do a XOR operation on the GPIO flags.
>>
>>>>>> While an inverter can be described implicitly by exchanging the
>>>>>> GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags, this has its limitations.
>>>>>> Each GPIO line has only a single GPIO_ACTIVE_* flag, but applies to both
>>>>>> th provider and consumer sides:
>>>>>>   1. The GPIO provider (controller) looks at the flags to know the
>>>>>>      polarity, so it can translate between logical (active/not active)
>>>>>>      and physical (high/low) signal levels.
>>>>>>   2. While the signal polarity is usually fixed on the GPIO consumer
>>>>>>      side (e.g. an LED is tied to either the supply voltage or GND),
>>>>>>      it may be configurable on some devices, and both sides need to
>>>>>>      agree.  Hence the GPIO_ACTIVE_* flag as seen by the consumer must
>>>>>>      match the actual polarity.
>>>>>>      There exists a similar issue with interrupt flags, where both the
>>>>>>      interrupt controller and the device generating the interrupt need
>>>>>>      to agree, which breaks in the presence of a physical inverter not
>>>>>>      described in DT (see e.g. [3]).
>>>>> Adding an inverted flag as I've suggested would also solve this issue.
>>>> As per your suggestion in "Re: [PATCH V4 2/2] gpio: inverter: document
>>>> the inverter bindings"?
>>>> https://lore.kernel.org/linux-devicetree/CAL_JsqLp___2O-naU+2PPQy0QmJX6+aN3hByz-OB9+qFvWgN9Q@mail.gmail.com/
>>>>
>>>> Oh, now I understand. I was misguided by Harish' interpretation
>>>> https://lore.kernel.org/linux-devicetree/dde73334-a26d-b53f-6b97-4101c1cdc185@mentor.com/
>>>> which assumed an "inverted" property, e.g.
>>>>
>>>>     inverted = /bits/ 8 <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0>;
>>>>
>>>> But you actually meant a new GPIO_INVERTED flag, to be ORed into the 2nd
>>>> cell of a GPIO specifier? I.e. add to include/dt-bindings/gpio/gpio.h"
>>>>
>>>>     /* Bit 6 expresses the presence of a physical inverter */
>>>>     #define GPIO_INVERTED 64
>>> Exactly.
>> OK, makes sense.
>
> The reason I went for "inverted" property is because, we can specify this for gpios at provider side.
>
> The usecase needed to define the polarity which did not have kernel space consumer driver.
>
>
> I am not sure how do we achieve this using GPIO_INVERTED flag. We need some sort of node/gpio-hog to specify these
>
> type of properties? Otherwise gpio-pin will be held by kernel or the module using the hog property and the user space application will not be able to access pin.
>
>
> or please let me know if I am missing something.
>
>
>>>> We need to be very careful in defining to which side the GPIO_ACTIVE_*
>>>> applies to (consumer?), and which side the GPIO_INVERTED flag (provider?).
>>>> Still, this doesn't help if e.g. a FET is used instead of a push-pull
>>>> inverter, as the former needs translation of other flags (which the
>>>> nexus can do, the caveats above still applies, though).
>>> Yes. Historically the cells values are meaningful to the provider and
>>> opaque to the consumer. Standardized cell values changes that
>>> somewhat. I think we want the active flag to be from the provider's
>>> prospective because the provider always needs to know. The consumer
>>> often doesn't need to know. That also means things work without the
>>> GPIO_INVERTED flag if the consumer doesn't care which is what we have
>>> today already and we can't go back in time.
>>>
> Things will work without GPIO_INVERTED flag for consumers which can specify GPIO_ACTIVE_* flags.
>
>
>
>>>> Same for adding IRQ_TYPE_INVERTED.
>>> I suppose so, yes.
>>>
>>>> Related issue: how to handle physical inverters on SPI chip select lines,
>>>> if the SPI slave can be configured for both polarities?
>>> Good question. Perhaps in a different way because we have to handle
>>> both h/w controlled and gpio chip selects.
>>>
>>> However, how would one configure the polarity in the device in the
>>> first place? You have to assert the CS first to give a command to
>>> reprogram it.
>> That's indeed true for a simple SPI slave.
>> But if it is a smarter device (e.g. a generic micro controller), it may use the
>> system's DTB to configure itself.
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>


Can you please let me know your inputs on this ?


Now that Geert has sent v4 patch of GPIO Aggregator by "Dropping controversial GPIO repeater", I do not see the above mentioned inverter usecase can be handled anymore.


Is the observation/patch submitted in https://lore.kernel.org/linux-devicetree/dde73334-a26d-b53f-6b97-4101c1cdc185@mentor.com/ still not acceptable?



Thanks,

Harish

