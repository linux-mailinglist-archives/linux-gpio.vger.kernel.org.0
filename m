Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB1058162C
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 17:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbiGZPNa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 11:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbiGZPN3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 11:13:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1320A2F3A7
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 08:13:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A65756069D
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 15:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73754C433C1;
        Tue, 26 Jul 2022 15:13:25 +0000 (UTC)
Message-ID: <524f89f6-2136-c45c-cf39-a045bb92e396@xs4all.nl>
Date:   Tue, 26 Jul 2022 17:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/2] gpio: mxc: Always set GPIOs used as interrupt
 source to INPUT mode
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
References: <20220724224943.294057-1-marex@denx.de>
 <20220724224943.294057-2-marex@denx.de>
 <CACRpkdbUbnOeH7p7ycmvY1YP=K_s7Oj0gt=g-m2s1P2CAqLGMQ@mail.gmail.com>
 <15dbcfc4-79a0-eaad-c513-4b4e16ccfb8f@denx.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <15dbcfc4-79a0-eaad-c513-4b4e16ccfb8f@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 7/26/22 16:42, Marek Vasut wrote:
> On 7/26/22 10:15, Linus Walleij wrote:
>> On Mon, Jul 25, 2022 at 12:50 AM Marek Vasut <marex@denx.de> wrote:
>>
>>> Always configure GPIO pins which are used as interrupt source as INPUTs.
>>> In case the default pin configuration is OUTPUT, or the prior stage does
>>> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
>>> INPUT and no interrupts are received.
>>>
>>> Always configure interrupt source GPIO pin as input to fix the above case.
>>>
>>> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Cc: Loic Poulain <loic.poulain@linaro.org>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>> Cc: Peng Fan <peng.fan@nxp.com>
>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>> ---
>>> V2: Actually update and clear bits in GDIR register
>>> V3: Rebase on top of new patch 1/2, expand CC list, add Fixes tag
>>> V4: No change
>>
>> I understand what you are trying to achieve, and it makes sense.
>>
>> There's is just this one generic GPIO-based driver that makes me
>> a little bit nervous here.
>>
>> Consider:
>> drivers/media/cec/platform/cec-gpio/cec-gpio.c
>> Look what the driver is doing with the gpiod_* operations on it's
>> cec->cec_gpio.
>>
>> A certain GPIO pin is switched back and forth between input and
>> output and in input mode, it is used to generate interrupts as well.
>>
>> Will this still work fine with the MXC driver after this change?
>> At least it will be set to input mode twice, but I suppose that is
>> fine, it's not your fault that the frameworks are orthogonal.
> 
> Ugh. I don't see why it shouldn't work, esp. if the CEC driver controls the direction and the default is input, but I wonder what other corner cases there are.

FYI: you can easily test cec-gpio by adding something along these lines to the dts:

	cec-gpio {
		compatible = "cec-gpio";
		cec-gpios = <&gpio 6 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
	};

(this is from a Raspberry Pi). As long as the cec-gpios pin can be configured as a
pull up, then you're OK. It doesn't have to be connected to anything.

If the cec-gpio driver is enabled as well, then you should see a /dev/cec0 device.

If you can run 'cec-ctl --playback -p 1.0.0.0', then it works.

Another driver that switches direction is drivers/gpu/drm/i2c/tda998x_drv.c
where the irq line has to be configured as an output during calibration.
See tda998x_cec_calibration().

Regards,

	Hans
