Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D868E3EBF
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 00:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730012AbfJXWEL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 18:04:11 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42323 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfJXWEL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 18:04:11 -0400
Received: by mail-wr1-f67.google.com with SMTP id r1so105917wrs.9;
        Thu, 24 Oct 2019 15:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3OjzJyTp1V/Jdn56cTV6f4pzMTjRxLMQGdaanUGRYYc=;
        b=YkE0ZeNm67Xi7VPv44sFGtpJvaYabOG2+xhEcL7iDtwxjXynvQ376Ff9jsesIGuKiw
         ffMluVOmHDNunJCkqZ2zNDfm8BOV4YR4ZUgC+h+mIewalUZPDpFkwBD8D4+kPujcwY76
         xaWX+4hoajXOGXb2Nt6GoxMeyHlaTuPDsfBcnNGQzdt5sVbCYDh2Ni5fKMDInvg35xz1
         uVgR2i2YZJT4gM9HnblH1QhIXA7kI9pkHJZ5MIt1zLHwwg6Ji+eCDuKTisJEJYGA2Unh
         +K9GYDwcXFV9k1bPm9gVO+sx1OAwyMAHdvDJxwc/UTrShAf5dF2sjDIX+6BuWt5XuaQy
         wrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3OjzJyTp1V/Jdn56cTV6f4pzMTjRxLMQGdaanUGRYYc=;
        b=jWYxwJup57UsMLL3++Xll5KUU4nSMhgwtmbhNgcgPTT8LAv8L1+Xq/O1mMO9a7t4kl
         polOY7cxAEV+xkMcdXMTr49G9OgyfXYliyPs5/sCQ8FfeoX4sCrn7gUp9wVnl1ycT43y
         ePR4HdgHwEtVDVXoO9kqzmGfnRII4MaoitgtI/L9/4YgCxJ3gE1qS9DAEc6ZDciBK3OF
         d6UMZMQsKzzNaZ3wnQNV6DnFRAwzywWPTHsFK7GUoIKYXSy7UoqrqGfwcRdrhBh0SL0S
         rnQlSyj/HMRTnkiIVForF/ZSADcD2eLtVVlYl8kWtJXFOlKVTQ4NMq1bRZVB+ZqY55B3
         tluw==
X-Gm-Message-State: APjAAAVtaw7lduwbEOWgG/P57mgCkurZqROpKV72ulK653qNl7WQvz1d
        yqzWKOJ/Fs+MK2tMSwGW4sk=
X-Google-Smtp-Source: APXvYqwGgPt2ma1H8AGKi6vFdMvTakNqgwxLMtlDKgtxYJFtzT++EvU+GlK1uZNW4uvL2aKVFvL+HQ==
X-Received: by 2002:adf:c448:: with SMTP id a8mr5869759wrg.233.1571954644167;
        Thu, 24 Oct 2019 15:04:04 -0700 (PDT)
Received: from [192.168.1.19] (chm166.neoplus.adsl.tpnet.pl. [83.31.10.166])
        by smtp.gmail.com with ESMTPSA id x205sm113031wmb.5.2019.10.24.15.04.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 15:04:03 -0700 (PDT)
Subject: Re: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <af1fb3e010d5f34502d354369b88fa28639f587d.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <c1e41315-42ad-fb9b-c9db-8b07d4293166@ti.com>
 <fbd4960b219099b7a48ef24019ba829f866edb3b.camel@fi.rohmeurope.com>
 <4570db9c-7bc8-f131-269a-248b87e25e38@gmail.com>
 <201df0f7319b94eb581a040a2b1b07dbfed12e94.camel@fi.rohmeurope.com>
 <c5761d78-3334-adaa-b871-cb6da356483b@gmail.com>
 <8974a3974377d0623ed968563b035e701191440e.camel@fi.rohmeurope.com>
 <e9d1c529-90ef-34bf-d893-02a109ba19ba@gmail.com>
 <c35a2bca83c711bd7b19c8a99798374388705bfc.camel@fi.rohmeurope.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <06b3909a-b3ff-2c0e-d1df-a475a69951ed@gmail.com>
Date:   Fri, 25 Oct 2019 00:04:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c35a2bca83c711bd7b19c8a99798374388705bfc.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Matti,

On 10/24/19 10:15 AM, Vaittinen, Matti wrote:
> Hello Jacek,
> 
> On Wed, 2019-10-23 at 23:59 +0200, Jacek Anaszewski wrote:
>> On 10/23/19 10:37 AM, Vaittinen, Matti wrote:
>>> On Tue, 2019-10-22 at 19:40 +0200, Jacek Anaszewski wrote:
>>>> On 10/22/19 2:40 PM, Vaittinen, Matti wrote:
>>>>> On Mon, 2019-10-21 at 21:09 +0200, Jacek Anaszewski wrote:
>>>>>> On 10/21/19 10:00 AM, Vaittinen, Matti wrote:
>>>>>>> Hello Dan,
>>>>>>>
>>>>>>> Thanks for taking the time to check my driver :) I truly
>>>>>>> appreciate
>>>>>>> all
>>>>>>> the help!
>>>>>>>
>>>>>>> A "fundamental question" regarding these review comments is
>>>>>>> whether
>>>>>>> I
>>>>>>> should add DT entries for these LEDs or not. I thought I
>>>>>>> shouldn't
>>>>>>> but
>>>>>>> I would like to get a comment from Rob regarding it.
>>>>>>
>>>>>> If the LED controller is a part of MFD device probed from DT
>>>>>> then
>>>>>> there is no doubt it should have corresponding DT sub-node.
>>>>>
>>>>> Sorry but I still see no much benefit from adding this
>>>>> information
>>>>> in
>>>>> DT. Why should it have corresponding DT-node if the LED
>>>>> properties
>>>>> are
>>>>> fixed and if we only wish to allow user-space control and have
>>>>> no
>>>>> dependencies to other devices in DT? 
>>>>>
>>>>> In this specific case the information we can provide from DT is
>>>>> supposed to be fixed. No board based variation. Furthermore,
>>>>> there
>>>>> is
>>>>> not much generic driver/led core functionality which would be
>>>>> able
>>>>> to
>>>>> parse and utilize relevant information from DT. I think we can
>>>>> only
>>>>> give the name (function) and colour. And they are supposed to
>>>>> be
>>>>> fixed
>>>>> and thus could be just hard-coded in driver. Hard-coding these
>>>>> would be
>>>>> simpler and less error prone for users (no DT bindings to
>>>>> write)
>>>>> and
>>>>> simpler to create and probably also to maintain (no separate
>>>>> binding
>>>>> documents needed for LEDs).
>>>>
>>>> AFAICS it is possible to connect LED of arbitrary color to the
>>>> iouts
>>>> of this device. If this is the case then it is justified to have
>>>> DT
>>>> node only to allow for LED name customization.
>>>
>>> In theory, yes. In practice (if I understand it correctly) the
>>> color in
>>> this case is only visible in sysfs path name. I am not at all sure
>>> that
>>> reflecting the (unlikely) color change in path name is worth the
>>> hassle. Besides - if this happens, then the driver and DT can be
>>> changed.
>>
>> Driver should not be changed. We have DT for conveying board specific
>> parameters.
> 
> Driver needs to be changed if we add new feature to it. It is waste to
> develop features that are never needed. DT support here may be such. So
> I'd suggest we add DT support later if it is needed.

If you add a driver to mainline kernel you have to think of its all
possible applications to make any prospective users' life easier.

And besides, I was referring to changes of hardcoded color. You
mentioned that color change is unlikely. This indicates that you don't
take into account other applications for this device than your current
board. Such approach is applied for platform drivers where LEDs are
controlled e.g. via MMIO. In this case LED names can be initialized
in a static way. You should look at drivers in arch directory.
I see that some of them include also headers of mfd devices so
it may be your area of interest.

If your device is really bound to this single platform then
this is different discussion.

>>> It is easier to add DT entries than remove them. If you see
>>> the color change support as really crucial - then I could even
>>> consider
>>> defaulting the colours to amber and green if no colour property is
>>> present in DT.
>>
>> You don't need to default to anything. The color section will be left
>> empty if the property is not provided.
> 
> Thanks for this info :) It makes sense.
> 
> And no need to explain me this if you are busy - but I don't really see
> why we have led colour in sysfs path? I admit I am not too deep in the
> world of LEDs (so I am sure there is just something I haven't been 
> thinking about) but it intuitively feels terribly wrong. If I was
> writing application to control - let's say a charger LED - I would
> definitely prefer to always have the charger led control in same sysfs
> path - no matter what the color is. If my application was interested in
> knowing the colour, then I hoped to be able to read / change it via
> file "colour" which resides in the charger sysfs path. (And yes, if I
> had bunch of RGB leds, I would _definitely_ want to change the
> 'abstract' color - not brightnes of red, green and blue LEDs). But all
> this is off-topic and not related to this discussion - I was just
> curious as my limited brains don't see the reasoning behind this :)

LED subsystem was founded in 2006 with this naming convention.
Here is an excerpt from the docs touching this issue:

"
There have been calls for LED properties such as color to be exported as
individual led class attributes. As a solution which doesn't incur as much
overhead, I suggest these become part of the device name. The naming scheme
above leaves scope for further attributes should they be needed. If sections
of the name don't apply, just leave that section blank.
"

I was opting for moving color to the sysfs file during LED naming
rework but there was no consensus, so we have to live with that.

>>> I see no point in _requiring_ the DT entry to be there.
>>
>> I'm referring to this later in this message.
>>
>>> If we like being prepared for the theoretical possibilities - what
>>> if
>>> x86 is used to control this PMIC? I guess we wouldn't have DT there
>>> then (And no - I don't see such use-case).
>>
>> We have fwnode abstraction for that. You can also check:
>> Documentation/firmware-guide/acpi/dsd/leds.rst.
>>
>>>>> But assuming this is Ok to DT-folks and if you insist - I will
>>>>> add
>>>>> LED
>>>>> information to DT for the next patches. Hopefully this extra
>>>>> complexity
>>>>> helps in some oddball use-case which I can't foresee =)
>>>>>
>>>>> Then what comes to the DT format.
>>>>>
>>>>> Do you think LED subsystem should try to follow the convention
>>>>> with
>>>>> other sub-systems and not introduce multiple compatibles for
>>>>> single
>>>>> device? MFD can handle instantiating the sub-devices just fine
>>>>> even
>>>>> when sub-devices have no own compatible property or of_match.
>>>>> Maybe
>>>>> we
>>>>> should also avoid unnecessary sub-nodes when they are not
>>>>> really
>>>>> required.
>>>>
>>>> This is beyond my scope of responsibility. It is MFD subsystem
>>>> thing
>>>> to
>>>> choose the way of LED class driver instantiation. When it comes
>>>> to
>>>> LED subsystem - it expects single compatible pertaining to a
>>>> physical
>>>> device.
>>>
>>> Sorry but I don't quite follow. What the LED subsystem does with
>>> the
>>> compatible property? How does it expect this?
>>
>> In case of DT based MFD cell probing you must initialize
>> of_compatible
>> property of struct mfd_cell element which will then be matched
>> with struct platform_driver -> driver -> of_match_table in the LED
>> class driver. Basing on that a relevant platform_device is passed
>> to the probe function. Its child struct device's of_node property
>> comes
>> already initialized to the pointer to the corresponding child node
>> in MFD node.
> 
> I know. I did this at first with the BD71837 - and I was told to not do
> that. The difference when we don't use of_compatible is that the
> of_node pointer in sub-device (LEDs) is not populated. But when we have
> pure MFD sub-device (like LEDs on BD71828), the sub-device knows it is
> instantiated by MFD (parent) and it can get the relevant DT data from
> parent's of_node - which kind of makes sense as there really is only
> one physical device (the MFD). But I see you like to get opinion from
> Lee and/or Rob - let's hope they help us to align our views. (It is
> also definitely a good idea to correct my understanding if I have
> misunderstood this!)
> 
>>>> Nonetheless, so far we used to have separate compatibles for
>>>> drivers
>>>> of
>>>> MFD devices' LED cells. If we are going to change that I'd like
>>>> to
>>>> see
>>>> explicit DT maintainer's statement confirming that.
>>>
>>> I don't expect that existing DTs would be changed. 
>>
>> I didn't suggest that.
>>
>>> But as I said, the
>>> consensus amongst most of the subsystenm maintainers and DT
>>> maintainers
>>> seems to be that sub-devices should not have own compatibles. I
>>> hope
>>> Rob acks this here - but knowing he is a busy guy I add some old
>>> discussions from which I have gathered my understanding:
>>>
>>> BD71837 - first patch where regulators had compatible - Mark
>>> (regulator
>>> maintainer instructed me to drop it):
>>> https://lore.kernel.org/linux-clk/20180524140118.GS4828@sirena.org.uk/
>>>
>>> And here Stephen (the clk subsystem maintainer) told me to drop
>>> whole
>>> clocks sub-node (including the compatible):
>>> https://lore.kernel.org/linux-clk/152777867392.144038.18188452389972834689@swboyd.mtv.corp.google.com/
>>
>> Still, there are MFD drivers using of_compatible for matching cell
>> drivers. I don't follow current trends on MFD subsystem side.
>> You've got to wait for review feedback from Lee Jones anyway
>> to find out how to proceed with MFD bindings.
> 
> Sure. And as the subject states, this whole series is still RFC. I am
> not expecting the regulator run-level control to be accepted as such -
> I am hoping to get a push to right direction - although the basic
> regulator control might go in without big changes. So my case does not
> require super fast decision - but I think that if the general direction
> should be more towards dropping own compatibles from MFD sub-devices,
> then it might be good idea to get this sorted sooner than later :)

All your doubts may stem from the fact that you look at drivers
from platform centric POV and you don't think of portability.

>>>> And one benefit of having separate nodes per MFD cells is that we
>>>> can
>>>> easily discern the support for which cells is to be turned on.
>>>
>>> We don't want to do DT modifications to drop some sub-device
>>> support
>>> out. The DT is HW description and sub-blocks are still there. We
>>> drop
>>> the support by KConfig. 
>>
>> How would you describe the purpose of 'status = "disabled"' DT
>> assignment then?
>>
>> Anyway, I entirely disagree here - it is perfectly proper approach
>> to define platform capabilities by modifying dts file alone.
>> This way you can easily create multiple versions of platform
>> configurations. It may be often impractical to enable all available
>> platform features, at least from business point of view. And
>> recompiling
>> dts is lightweight operation in comparison to kernel compilation.
> 
> I guess we have different backgrounds here =) For quite a long time I
> was working with devices that had really long life-span. They received
> multiple SW updates - but changing a DT was rare. For some of the
> products DT changes were impossible after the product was out of the
> factory. For some of the products DT changes were possible - but rare -
> and during the update the system often booted up in a state where it
> had either new SW but old DT. In SW fall-back scenarios system often
> had old SW and new DT. And at times there were systems running new SW
> but years old DT - especially for those systems where DT was not
> updated after the product left factory...
> 
> In that environment all the DT updates were a nightmare.
> 
>> Not saying that in some cases there are secret keys required for
>> encrypting kernel images, that may not always be at hand.
>>
>>> Only 'configuration' we could bring from DT is
>>> the amount of connected LEDs (as you said). But on the other hand -
>>> whether preparing for such unlikely design is reasonable (or
>>> needed) is
>>> questionable.
>>
>> LED naming related data is vital as well.
> 
> Sure. But I don't think the LED names need to be changed. On the
> contrary - I expect the user-space to hope the names stay constant.
> Maybe I just don't understand something here :)

So this is the gist of the problem - you are platform biased.
The same LED controller can be mounted on various platforms
and may have different functions, which needs to be reflected
in sysfs.

>>>>> 	pmic: pmic@4b {
>>>>> 		compatible = "rohm,bd71828";
>>>>> 		reg = <0x4b>;
>>>>> 		interrupt-parent = <&gpio1>;
>>>>> 		interrupts = <29 GPIO_ACTIVE_LOW>;
>>>>> 		clocks = <&osc 0>;
>>>>> 		#clock-cells = <0>;
>>>>> 		clock-output-names = "bd71828-32k-out";
>>>>> 		gpio-controller;
>>>>> 		#gpio-cells = <2>;
>>>>> 		ngpios = <4>;
>>>>> 		gpio-reserved-ranges = <0 1 2 1>;
>>>>> 		gpio-line-names = "EPDEN";
>>>>> 		rohm,dvs-vsel-gpios = <&gpio1 12 0>,
>>>>> 				      <&gpio1 13 0>;
>>>>> 		regulators {
>>>>> 			...
>>>>> 		};
>>>>> 		
>>>>> 		chg-led {
>>>>> 			function = LED_FUNCTION_CHARGING;
>>>>> 			color = LED_COLOR_ID_AMBER;
>>>>> 		};
>>>>>
>>>>> 		pwr-led {
>>>>> 			function = LED_FUNCTION_POWER;
>>>>> 			color = LED_COLOR_ID_GREEN;
>>>>> 		};
>>>>
>>>> This way you would probably need to probe LED class driver twice,
>>>> instead of letting it behave in a standard way and parse child
>>>> LED
>>>> nodes.
>>>
>>> No. Please note that probing the MFD sub-drivers is _not_ bound to
>>> device-tree nodes. MFD sub-devices can be probed just fine even if
>>> they
>>> have no DT entries. When we add MFD cell for LED driver, the
>>> corresponding LED driver is probed. No DT magic needed for this.
>>>
>>> What the LED driver (as other sub-device drivers) is required to do
>>> is
>>> to obtain the pointer to parent device's DT node and find
>>> information
>>> which is relevant for it. Ideally, the subsystem framework can
>>> extract
>>> the properties which are common for whole subsystem (like color and
>>> function in case of LEDs) and driver only parses the DT if it has
>>> some
>>> custom properties. Again, ideally the driver has sane defaults - or
>>> some other 'platform data' mechanism if no DT information is found.
>>> There is architectures which do not support DT.
>>
>> LED common bindings define that each LED should be described
>> using child node. And we've enforced sticking to this standard
>> for last two years strictly.
> 
> I am not against that. If DT is used, then it is fine for me to have
> properties of one LED in own node. But I don't think the DT should be
> compulsory at all for cases where the LED information stays static.
> 
>> LED core mechanism for LED name composition also relies on this
>> DT design - it expects single 'color' and 'function' properties to
>> be present in the passed fwnode.
> 
> I am not against this either - although I don't fully understand this
> as I said above. I believe that set of well defined LED names is a good
> thing. And LED APIs should indeed force the name to follow specific
> format. But I don't think that the DT should be only mechanism for
> bringing the function and colour. I think we should allow LED name
> composition for example by specifying the colour and function in LED
> class registration API in cases where fwnode is not needed.
> 
>> LED class registration function registers single LED and it has been
>> always LED class driver's responsibility to call it for every LED
>> connected to the LED controller iouts.
> 
> This is fine for me too (especially when DT is not used). And my driver
> draft did this, right? But I see that lots of code duplication in
> drivers could be avoided if the LED framework provided function which
> could extract all LEDs from a (MFD) device-tree node and did register
> more than one of them. The typical "for_each_child_of_node" could be in
> LED core. But this is currently some what irrelevant - let's first see
> how the "compatible" discussion for sub-devices turns out ;)

It is not trivial to come up with generic mechanism for registering
sub-LEDs due to various possible iout topologies and arrangements.

>>
>>> In case of BD71828 LEDs my first idea was to go with only the 'sane
>>> defaults' option as I saw no much configurability. The DT snippet
>>> above
>>> contains LED information as per your suggestion.
>>>
>>> What the LED sub driver for BD71828 would now do is calling 
>>> devm_led_classdev_register_ext with the DT information of BD71828
>>> device. Eg, it should use the MFD dt node (because this is the real
>>> device) and not just part of it. devm_led_classdev_register_ext
>>> should
>>> then extract the LED specific information. I have not checked the
>>> implementation of devm_led_classdev_register_ext in details - but
>>> it
>>> should ignore non led properties and just walk through the LED
>>> information and create the sysfs interfaces etc. for all LEDs it
>>> finds.
>>
>> This function does not work like that, as explained above.
>> Please first get acquainted with the way how existing LED class
>> drivers
>> approach LED registration. Because otherwise we're wasting each
>> others' time.
> 
> Right. I see. So each LED driver must first parse the DT information in
> order to find the LED node - or each LED node must be identified by
> what-ever mechanism is invoking the LED driver... I see this could be
> improved in the future by adding LED framework a mechanism to identify
> LED nodes. But that discussion is (probably) out of the scope of this
> driver. Thanks for pointing that out.
> 
>>> (In my example this is the chg-led and pwr-led sub-nodes).
>>> Furthermore,
>>> if no LED information is found from DT I would expect
>>> devm_led_classdev_register_ext to fail with well-defined return
>>> value
>>> so that the driver could do what it now does - Eg, use "sane
>>> defaults"
>>> to register the default class-devices for green and amber LEDs. The
>>> default led class dev naming should of course be same format as it
>>> would be if DT was populated with green and amber led information. 
>>
>> Please go through 5.4-rc1 patches related to LED naming improvements
>> You can also refer to Documentation/leds/leds-class.rst,
>> "LED Device Naming" section for starter.
> 
> I will. The naming should be coherent - and names in my current draft
> were just pulled off from my hat. Thanks.
> 
>>>>> 	};
>>>>>
>>>>> How do you see this? Or do you really wish to have this one
>>>>> extra
>>>>> node:
>>>>>
>>>>> 	pmic: pmic@4b {
>>>>> 		compatible = "rohm,bd71828";
>>>>> 		
>>>>> reg = <0x4b>;
>>>>> 		interrupt-parent = <&gpio1>;
>>>>> 		interru
>>>>> pts = <29 GPIO_ACTIVE_LOW>;
>>>>> 		clocks = <&osc 0>;
>>>>> 		
>>>>> #clock-cells = <0>;
>>>>> 		clock-output-names = "bd71828-32k-out";
>>>>> 		gpio-controller;
>>>>> 		#gpio-cells = <2>;
>>>>> 	
>>>>> 	ngpios = <4>;
>>>>> 		gpio-reserved-ranges = <0 1 2 1>;
>>>>> 	
>>>>> 	gpio-line-names = "EPDEN";
>>>>> 		rohm,dvs-vsel-gpios =
>>>>> <&gpio1 12 0>,
>>>>> 				      <&gpio1 13 0>;
>>>>> 		
>>>>> regulators {
>>>>> 			...
>>>>> 		};
>>>>> 		
>>>>> 		leds-dummy {
>>>>
>>>> Why leds-dummy ?
>>>
>>> Because there is no real led controller device in any "MFD bus". It
>>> is
>>> just one MFD device with controls for two LEDs. 
>>>
>>>> The convention is to have led-controller@unit-address as the
>>>> parent
>>>> LED
>>>> controller node.
>>>
>>> What is the unit address here? 0x4b is the I2C slave address and it
>>> is
>>> the MFD node address. There is no addressing for LED controller as
>>> there is no separate LED controller device. There is only one
>>> device,
>>> the PMIC which is MFD device as it has multiple functions meld in.
>>> One
>>> of these functions is LED control and requires LED driver.
>>
>> For MFD cell you can have just "led".
>>
>>>>> 			chg-led {
>>>> s/chg-led/led0/
>>>>
>>>>> 				function =
>>>>> LED_FUNCTION_CHARGING;
>>>>> 				color = LED_COLOR_ID_AMBER;
>>>>> 			};
>>>>>
>>>>> 			pwr-led {
>>>>
>>>> s/pwr-led/led1/
>>>>
>>>> This is ePAPR requirement that DT node name should describe the
>>>> general class of device.
>>>
>>> Thanks. I had some problems with these node names as I wanted to
>>> make
>>> them generic (led) but also to include some information what leds
>>> they
>>> are. A bit same idea as I see in node names like "chan1" and
>>> "chan345"
>>> that are used in ti-lmu bindings I checked for the example. But I
>>> am
>>> fine with renaming them in this example! I just don't think we
>>> should
>>> have this extra node as I mentioned.
>>
>> I wonder what Rob and Lee will say here. I personally would
>> like to stick to LED common bindings and have this extra node.
>> We define standards for a reason after all.
> 
> I don't understand what makes you think we shouldn't stick LED common
> bindings? We definitely want to have common bindings and increase
> amount of bindings handled by core instead of handling the bindings in
> all of the LED drivers. It was just strange to me that LED subsystem
> uses this "extra node" and "extra compatible" inside MFD whereas (I
> have understood that) other subsystems seem to be giving up on that.
> But maybe I am mistaken on that - wouldn't be first time - let's see :)
> 
>>>>> 				function = LED_FUNCTION_POWER;
>>>>> 				color = LED_COLOR_ID_GREEN;
>>>>> 			};
>>>>
>>>> Common LED bindings say this is the proper way to go. However you
>>>> would need compatible to probe LED class driver in DT based way.
>>>
>>> No. I don't. MFD will probe the LED class driver as long as the
>>> name of
>>> the driver matches to MFD cell name. 
>>
>> If you initialize only of_compatible in struct mfd_cell element then
>> it
>> will use only that for matching. I bet I was checking that five years
>> ago while working on leds-max77693 driver.
> 
> Yes. It sure uses of_compatible for matching and populating the dt
> node. This is different from probing though. Sub-device is probed just
> fine even when there is no compatible for in DT - if the name matches.
> What changes is that the of_node won't be populated and sub driver
> needs to figure it out. So both approaches *work* - which is considered
> as "right thing to do"(tm) needs to be figured out. I have no further
> insight as to why the compatible should or should not be used for MFD
> sub-devices - I was just told to avoid that in the past. But let's see
> if we get Rob's or Lee's attention :)
> 
>>> So we only need MFD driver to be
>>> probed based on the compatible. Rest of the sub-device drivers will
>>> be
>>> probed by MFD. What I am missing is MODULE_ALIAS in LED driver for
>>> loading the module when MFD is searching for it if it is not
>>> modprobed
>>> via scripts or built in-kernel. I have understood this is the
>>> standard
>>> way with MFD nowadays - I am positive Lee will kick me if I am
>>> wrong ;)
>>> (I think I have bullied him that much in the past :/ )
>>
>> Last sentence confirms my observation that you're strongly inclined
>> to contest status quo :-)
> 
> Let's just say that I have had my moments - both in good and in bad :)
> I am probably not the easiest guy to work with but not the worst
> either. Actually, problems tend to start when I try to be funny
> :rolleyes: I should learn when to stop.
> 
>>>> If you plan to do it otherwise then it makes no sense to have
>>>> DT nodes for LEDs.
>>>
>>> That was my point. This is why I did not have LEDs in DT in first
>>> place. But as I said above - as a result of this discussion I have
>>> started thinking that maybe I could check if I can easily add
>>> support
>>> for providing LED information also via DT and fall back to defaults
>>> if
>>> no LED information is found. (to allow color change or to omit one
>>> of
>>> the LEDs as you suggested)
> 
>>>>>>>>> +
>>>>>>>>> +	bd71828 = dev_get_drvdata(pdev->dev.parent);
>>>>>>>>> +	l = devm_kzalloc(&pdev->dev, sizeof(*l),
>>>>>>>>> GFP_KERNEL);
>>>>>>>>> +	if (!l)
>>>>>>>>> +		return -ENOMEM;
>>>>>>>>> +	l->bd71828 = bd71828;
>>>>>>>>> +	a = &l->amber;
>>>>>>>>> +	g = &l->green;
>>>>>>>>> +	a->id = ID_AMBER_LED;
>>>>>>>>> +	g->id = ID_GREEN_LED;
>>>>>>>>> +	a->force_mask = BD71828_MASK_LED_AMBER;
>>>>>>>>> +	g->force_mask = BD71828_MASK_LED_GREEN;
>>>>>>>>> +
>>>>>>>>> +	a->l.name = ANAME;
>>>>>>>>> +	g->l.name = GNAME;
>>>>>>>>> +	a->l.brightness_set_blocking =
>>>>>>>>> bd71828_led_brightness_set;
>>>>>>>>> +	g->l.brightness_set_blocking =
>>>>>>>>> bd71828_led_brightness_set;
>>>>>>>>> +
>>>>>>>>> +	ret = devm_led_classdev_register(&pdev->dev,
>>>>>>>>> &g->l);
>>>>>>>>> +	if (ret)
>>>>>>>>> +		return ret;
>>>>>>>>> +
>>>>>>>>> +	return devm_led_classdev_register(&pdev->dev,
>>>>>>>>> &a->l);
>>>>>>
>>>>>> This way you force users to always register two LED class
>>>>>> devices
>>>>>> whereas they might need only one. Please compare how other
>>>>>> LED
>>>>>> class
>>>>>> drivers handle DT parsing and LED class device registration.
>>>>>
>>>>> I am not sure if I understand correctly what you mean by using
>>>>> only
>>>>> one
>>>>> class device. As I (hopefully) somewhere said - users can't
>>>>> control
>>>>> only one of these LEDs. If they decide to enable one led by SW,
>>>>> then
>>>>> they inevitably control also the other. Thus it is better that
>>>>> user
>>>>> gets control to both of the LEDs if they take the control for
>>>>> one.
>>>>>
>>>>> Or do you mean I could achieve the control for both of these
>>>>> LEDs
>>>>> via
>>>>> only one class device?
>>>>
>>>> AFAIU the LEDs, when in SW mode, can be controlled independently,
>>>> right?
>>>
>>> Yes and no. Both of the LEDs can be forced on/off individually - as
>>> long as one of them is forced ON. If both LEDs are tried to be
>>> forced
>>> OFF - then both LEDs are controlled by HW. If both are controlled
>>> by HW
>>> and then one is forced ON - the other is also no longer controlled
>>> by
>>> HW and is forced OFF.
>>>
>>> Eg, bits 0x80 and 0x40 are conrols for these LEDs. 0x80 for one,
>>> 0x40
>>> for the other. Setting bit means LED is on, clearing means LED is
>>> off -
>>> with the HW control twist... If either of the bits is set - then
>>> both
>>> leds are controlled by these bits (SW control). If both bits are
>>> cleared, then LEDs are controlled by HW (likely to be off but not
>>> for
>>> sure).
>>
>> Thank you for the explanation. So they can be represented by separate
>> LED class devices. Driver logic will just need to update the state of
>> the sibling LED if it will be affected.
> 
> Right. Or at first it might be enough (and simplest) to assume that if
> LEDs are used via this driver, then colour for both LEDs is set
> explicitly by user-space. I wouldn't try guessing if sibling LED state
> changes to OFF when one LED is turned ON - or if LED states change to
> ON if both are turned OFF. This would require exporting interfaces from
> power-supply driver - and it would still be racy. The thing is that
> when both LEDs are on board they are both either under HW or SW
> control. So it makes no sense to control only one LED in such case.
> Thus I think it is Ok if this LED driver is registering both class
> devices at one probe. No need to instantiate own platform devices for
> both of the LEDs.

We always register all LEDs originating from the same device in one
probe.

>>>> Because if not then there is no point in having separate LED
>>>> class
>>>> devices.
>>>>
>>>> But if I get it right, then allowing for registering only one LED
>>>> class
>>>> device is entirely justifiable - think of a situation when the
>>>> iout
>>>> remains not connected on the board.
>>>
>>> Yes. This might be unlikely - but this is the reason why I consider
>>> adding the DT support. I just am not sure if covering this scenario
>>> now
>>> is worth the hassle. I tend to think we should only add the DT
>>> support
>>> if someone actually produces a board where this LED is not
>>> connected.
>>
>> Could you share what board you're working with?
> 
> Unfortunately I can't :( I am working for a component vendor and all
> customer related information is usually strictly confidental - even in
> cases where it can be guessed...
> 
> 
> 

-- 
Best regards,
Jacek Anaszewski
