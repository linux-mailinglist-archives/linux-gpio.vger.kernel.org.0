Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C41D6F8EFB
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 12:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfKLLwr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 06:52:47 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:54241 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfKLLwr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2019 06:52:47 -0500
IronPort-SDR: ABSiVYxHaraSYYOyqDxHLWNwJH2rSbKw1lK8/oBGspbGVL7JiDORiQXcXdpKo6mpDopfvoNxrF
 7kOLsrIUbNp3C+H15H7g6q+H6YGJz6B1Q0gaoZx9zriWUGWjupIqAdG0MonjwY8vr7ebnDtxCW
 S7j7nMUCHyVC1KJrNI3K64q3jCkh2mreEZux4MdRC4lRQy7g4FmStGgOAPRJ4XxRV5AI+5jvO2
 yzPhoUi5qGyMl3wsyXEha98fzIJWPpar+40stG+BMLN8xKOnblpTzNn28VI+opcJIntOmS0S2U
 uiE=
X-IronPort-AV: E=Sophos;i="5.68,296,1569312000"; 
   d="scan'208";a="43124387"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 12 Nov 2019 03:52:45 -0800
IronPort-SDR: 2jBl8R2uXVezf101zPumrSER0INNLg/dYSQP/7Xf7cBpFfywVxILkaST/C3/ydb8lFCZRbEZAz
 bn9Z8OuJEmPVZ9u/ZHOkpZHUC/79xmgbzY+9c/kWtaHCiX0L1QaGS18+IRNX91TqpIE1Fskbqp
 oO237xCu+Gxx2yGmMonMF46D7opo48r1fU1Xc6Jv3Ol/VXF0GS2V4mRbSNFgqCEQFZNJa1Ep1G
 23LxlAeUyTTkY3pBzRYpnB2SHICY2y2mmXCyd5wgGpNy4dj9ozSnZScbweZ4YWYn0MRpfKdg6d
 i9w=
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Warren <swarren@nvidia.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Phil Reid <preid@electromag.com.au>,
        Enrico Weigelt <info@metux.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <20190925165133.GA4164@vmlxhi-102.adit-jv.com>
 <CAMuHMdVt3yDiJzkbUGMdkKKd4+CJ0btWuO-J=YZL+pAo99_WXg@mail.gmail.com>
 <20191005130740.GA22620@x230>
 <CAMuHMdViwrqg48t2Pc2JtZKLGzLPy0cVfzcnqctGo9oaDpC9Wg@mail.gmail.com>
 <89ddaab4-fb5f-8df2-c691-87cc0b1503d0@mentor.com>
Message-ID: <57b13084-5b49-6e9d-4f94-e85987d96f6b@mentor.com>
Date:   Tue, 12 Nov 2019 17:22:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <89ddaab4-fb5f-8df2-c691-87cc0b1503d0@mentor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-05.mgc.mentorg.com (139.181.222.5) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,


On 11/10/19 10:05 AM, Harish Jenny K N wrote:
> Hi Geert,
>
>
> On 07/10/19 1:48 PM, Geert Uytterhoeven wrote:
>> Hi Eugeniu,
>>
>> On Sat, Oct 5, 2019 at 3:08 PM Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
>>> On Fri, Sep 27, 2019 at 11:07:20AM +0200, Geert Uytterhoeven wrote:
>>>> My standard reply would be: describe the device connected to the GPIO(s)
>>>> in DT.  The GPIO line polarities are specified in the device's "gpios"
>>>> properties.
>>>> Next step would be to use the device from Linux.  For that to work, you
>>>> need a dedicated driver (for the complex case), or something generic
>>>> (for the simple case).
>>>> The latter is not unlike e.g. spidev.  Once you have a generic driver,
>>>> you can use "driver_override" in sysfs to bind the generic driver to
>>>> your device.  See e.g. commit 5039563e7c25eccd ("spi: Add
>>>> driver_override SPI device attribute").
>>> We have passed your suggestions along. Many thanks.
>>>
>>>> Currently we don't have a "generic" driver for GPIOs. We do have the
>>>> GPIO chardev interface, which exports a full gpio_chip.
>>>> It indeed looks like this "gpio-inverter" could be used as a generic
>>>> driver.  But it is limited to GPIOs that are inverted, which rules out
>>>> some use cases.
>>>>
>>>> So what about making it more generic, and dropping the "inverter" from
>>>> its name, and the "inverted" from the "inverted-gpios" property? After
>>>> all the inversion can be specified by the polarity of the GPIO cells in
>>>> the "gpios" property, and the GPIO core will take care of it[*]?
>>>> Which boils down to adding a simple DT interface to my gpio-aggregator
>>>> ("[PATCH/RFC v2 0/5] gpio: Add GPIO Aggregator Driver",
>>>>  https://lore.kernel.org/lkml/20190911143858.13024-1-geert+renesas@glider.be/).
>>>> And now I have realized[*], we probably no longer need the GPIO
>>>> Forwarder Helper, as there is no need to add inversion on top.
>>> After having a look at the gpio aggregator (and giving it a try on
>>> R-Car3 H3ULCB), here is how I interpret the above comment:
>>>
>>> If there is still a compelling reason for having gpio-inverter, then it
>>> probably makes sense to strip it from its "inverter" function (hence,
>>> transforming it into some kind of "repeater") on the basis that the
>>> inverting function is more of a collateral/secondary feature, rather
>>> than its primary one. Just like in the case of gpio aggregator, the
>>> primary function of gpio inverter is to accept a bunch of GPIO lines and
>>> to expose those via a dedicated gpiochip. I hope this is a proper
>>> summary of the first point in your comment. In any case, this is the
>>> understanding I get based on my experiments with both drivers.
>> Yes, the inverter is basically a "repeater" (or "aggregator", when it has
>> multiple GPIOs connected), hardcoded to invert.
>>
>>> What I also infer is that, assuming gpio-inverter will stay (potentially
>>> renamed and stripped of its non-essential inverting function), the gpio
>>> aggregator will need to keep its Forwarder Helper (supposed to act as a
>>> common foundation for both drivers).
>> What I meant is that if the inverter and aggregator would be combinoed
>> into a single driver, there would no longer be a need[*] for a separate
>> helper, and it could be incorporated into the single driver.
>>
>> [*] The individual helper functions may still be useful for some other
>>      driver, though.
>
> Agree.
>
>
>>> The second point which I extract from your comment is that the "gpio
>>> aggregator" could alternatively acquire the role of "gpio-inverter"
>>> (hence superseding it) by adding a "simple DT interface". I actually
>>> tend to like this proposal, since (as said above) both drivers are
>>> essentially doing the same thing, i.e. they cluster a number of gpio
>>> lines and expose this cluster as a new gpiochip (keeping the
>>> reserved/used gpio lines on hold). That looks like a huge overlap in
>>> the functionalities of the two drivers.
>> Yes, both drivers are very similar.  The difference lies in how they
>> acquire the list of GPIO descriptors.
> Yes. In fact my V2 version of the patch tried to implement the same role as repeater/forwarder albeit with a different naming/intention.
>
> Linus Walleij mentioned that using GPIO_ACTIVE_LOW just to get free inversion inside GPIOLIB was not OK really and this is a hardware description problem and totally different from the implementation problem inside the driver.
>
> Hence we changed the logic to inverter consumer driver doing inversion inside get and set functions.
>
>>> The only difference which I see is that "gpio-inverter" is getting its
>>> input from DT and generates the gpiochips at probe time, while
>>> "gpio aggregator" is getting its input from sysfs and generates the
>>> gpiochips at runtime, post-probe.
>> Exactly.
>>
>> For my virtualization use case, I need to create the list of GPIO
>> descriptors at run-time, hence the sysfs interface. This is
>> polarity-agnostic (i.e. the end user needs to care about polarity).
>>
>> For Harish use case, he needs to describe the list from DT, with
>> polarity inverted, which can be done by specifying the GPIO_ACTIVE_LOW
>> flag in the node's"gpios" property.
>>
>> For your use case, you want to describe the list in DT, with line-names,
>> and polarity specified.
>>
>>> So, assuming no objections from Harish and other reviewers, I would be
>>> very happy to review and test the DT-based gpio inversion functionality
>>> as part of gpio aggregator. Thanks!
>
> I tested your aggregator driver with the below minor changes in gpio-aggregator (combined with some minor changes in GPIO forwarder) to get devicetree support.
>
>
> 195,196d194
> <     int index = 0;
> <     int count;
> 278,295d275
> <     count = gpiod_count(dev, NULL);
> <     if (count > 0) {
> <         while (index < count) {
> <             desc = devm_gpiod_get_index(dev, NULL, index, GPIOD_ASIS);
> <
> <             if (desc == ERR_PTR(-ENOENT))
> <                 return -EPROBE_DEFER;
> <
> <             if (IS_ERR(desc))
> <                 return PTR_ERR(desc);
> <
> <             error = add_gpio(dev, &descs, &n, desc);
> <             if (error)
> <                 return error;
> <             index++;
> <         }
> <     }
> <
> 316,319d295
> < static const struct of_device_id gpio_aggregator_match[] = {
> <     { .compatible =    "gpio-aggregator", }, { },
> < };
> <
> 326d301
> <         .of_match_table = of_match_ptr(gpio_aggregator_match),
>
>
> This does work and achieve our aim of inverter driver.
>
> Hence no objection from my side to merge the drivers. Please let me know if I need to send you a patch on top of your aggregator patch.
>
> Hoping to get some credits for my work of 5 months effort ! ;)
>
>
> Best Regards,
>
> Harish Jenny K N


Is any attempt being made for the newer version of the aggregator/inverter driver ?


Best Regards,

Harish Jenny K N

>
