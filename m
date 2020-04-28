Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320041BB84B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 10:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgD1IAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 04:00:07 -0400
Received: from mleia.com ([178.79.152.223]:32822 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbgD1IAH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 04:00:07 -0400
X-Greylist: delayed 383 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Apr 2020 04:00:06 EDT
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 2E4C53DCE90;
        Tue, 28 Apr 2020 07:53:43 +0000 (UTC)
Subject: Re: gpio-reserved-ranges and RZ/G1C (was: Re: [PATCH] gpio: rcar:
 select General Output Register to set output states)
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
References: <CAMuHMdW4KJ8GgEZZVBuuY2ciG1UqaufQUk04b95f9j4pA_2i2g@mail.gmail.com>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <fa5d2ffc-53da-fa19-9c96-827f52c66cf6@mleia.com>
Date:   Tue, 28 Apr 2020 10:53:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW4KJ8GgEZZVBuuY2ciG1UqaufQUk04b95f9j4pA_2i2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20200428_075343_212628_59D4C15D 
X-CRM114-Status: GOOD (  42.19  )
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On 4/27/20 10:41 PM, Geert Uytterhoeven wrote:
> Hi Vladimir,
> 
> Sorry for taking so long to get back to you, after our chat at Embedded
> Recipes.
> 
> On Tue, Dec 18, 2018 at 1:58 PM Vladimir Zapolskiy
> <vladimir_zapolskiy@mentor.com> wrote:
>> I'm still influenced by a use-case of competing access to a GPIO controller
>> from two OSes, there might be an overlapping with Linux PM routines in
>> the driver.
>>
>> As a side note I'm not convinced that gpiochip_line_is_valid() and
>> gpiochip->valid_mask usage in the driver is justified, unless it is agreed
>> that 'gpio-reserved-ranges' property is really supposed to describe "holes"
>> in GPIO controllers. The property found in r8a77470.dtsi (RZ/G1C) looks like
>> a kludge instead of making a proper assignment of 'gpio-ranges' property:
>>
>> -                       gpio-ranges = <&pfc 0 96 30>;
>> -                       gpio-reserved-ranges = <17 10>;
>> +                       gpio-ranges = <&pfc 0 96 17>, <&pfc 27 123 3>;
>>
>> The change above is untested and I have no access to RZ/G1C manual, it is
>> shared just to demonstrate an alternative idea of describing holes.
> 
> Actually this is what Biju's v1 did[1].

Nice to know, I'm still inclined to think that this version is correct.

> But making that works means adding support for multiple "gpio-ranges" to
> the gpio-rcar driver.

The thing is that the complete support of single or multiple "gpio-ranges"
property is done in gpiolib, so I would expect that a proper fix is about
to remove the code and reuse gpiolib rather than to add.

> Of course that can be done, but it will complicate things, as all "offset"
> parameters in GPIO controller callbacks would need to take into account
> the holes when converting from contiguous offsets to discontiguous
> register bits.

Well, it may happen that the gpio-rcar driver is one of the few, which do
the machinery by itself.

Do you see an option to replace in-house gpio_rcar_request()/gpio_rcar_free()
by gpiochip_generic_* functions?

> 
> Note that the second tuple is <&pfc 27 123 3> not <&pfc 27 113 3>, i.e.
> the hole is not only present in the GPIO bank, but also in the pin
> controller's pin numbering (the PFC GPSR3 register has the same hole).
> 
> Documentation/devicetree/bindings/gpio/gpio.txt says:
> | Some system-on-chips (SoCs) use the concept of GPIO banks. A GPIO bank is an
> | instance of a hardware IP core on a silicon die, usually exposed to the
> | programmer as a coherent range of I/O addresses. Usually each such bank is
> | exposed in the device tree as an individual gpio-controller node, reflecting
> | the fact that the hardware was synthesized by reusing the same IP block a
> | few times over.
> 
> ... which applies to the R-Car GPIO block.
>

What do you call "the R-Car GPIO block" here?

I agree to the statement if "GPIO block" is replaced by "GPIO controller".

Here, and from my experience, the documentation correctly represents
the reality by claiming that

> Usually each such bank is exposed in the device tree as an individual
> gpio-controller node

and another "usually" in the paragraph

> usually exposed to the programmer as a coherent range of I/O addresses.

is less usual :)

Roughly speaking about MMIO GPIO controllers there should be a correspondence
between a GPIO bank and GPIO contoller's MMIO range.

> | Optionally, a GPIO controller may have a "ngpios" property. This property
> | indicates the number of in-use slots of available slots for GPIOs. The
> | typical example is something like this: the hardware register is 32 bits
> | wide, but only 18 of the bits have a physical counterpart. The driver is
> | generally written so that all 32 bits can be used, but the IP block is reused
> | in a lot of designs, some using all 32 bits, some using 18 and some using
> | 12. In this case, setting "ngpios = <18>;" informs the driver that only the
> | first 18 GPIOs, at local offset 0 .. 17, are in use.
>
> So far the R-Car GPIO DT bindings never had a need for the "ngpios"
> property.  The same information can easily be extracted from the last
> cell of the (single) mandatory "gpio-ranges" value.
>

That's fine, please note that device tree bindings of GPIO controllers which
drivers rely on gpiochip_generic_request() do not introduce "ngpios" property
also by obvious reasons, the machinery is hidden inside gpiolib.

> | If these GPIOs do not happen to be the first N GPIOs at offset 0...N-1, an
> | additional set of tuples is needed to specify which GPIOs are unusable, with
> | the gpio-reserved-ranges binding. This property indicates the start and size
> | of the GPIOs that can't be used.
> 
> This also matches the case on RZ/G1C.
> So IMHO using "gpio-reserved-ranges" is appropriate for RZ/G1C.

I disagree, there is no any indicator that "gpio-reserved-ranges" here is
justified.

> I do think the commit description of commit b9c725ed73b7cecc
> ("dt-bindings: gpio: Add a gpio-reserved-ranges property"):
> 
> | Some qcom platforms make some GPIOs or pins unavailable for use
> | by non-secure operating systems, and thus reading or writing the
> | registers for those pins will cause access control issues.
> | Introduce a DT property to describe the set of GPIOs that are
> | available for use so that higher level OSes are able to know what
> | pins to avoid reading/writing.
> 
> is confusing, as it only talks about pins that can be used by a secure
> OS only, but the actual changes to gpio.txt are in-line with GPIO lines
> that are simply not wired to physical pins, which is what the original
> paragraph was talking about, too.
> What do other people think?

For what it's worth in my opinion "gpio-reserved-ranges" has a quite clear
and nonambiquous meaning, but special care, and of course a clarification
from maintainers, is needed to prevent a possible misusage of the property.

I'm an admirer of Occam's razor, and if "holes" in banks can be described
by a standard and wide spread "gpio-ranges" mechanism, then I see no
good enough reason to mix in a more exotic "gpio-reserved-ranges" property.

--
Best wishes,
Vladimir
