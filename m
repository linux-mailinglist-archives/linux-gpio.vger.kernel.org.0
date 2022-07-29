Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04E6E584C34
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Jul 2022 08:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiG2G4Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Jul 2022 02:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiG2G4P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Jul 2022 02:56:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1EB13D44
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2022 23:56:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5D339B8264A
        for <linux-gpio@vger.kernel.org>; Fri, 29 Jul 2022 06:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3E1C433D6;
        Fri, 29 Jul 2022 06:56:08 +0000 (UTC)
Message-ID: <dd3f8d6b-90ee-a352-543b-a75e6ec6010d@xs4all.nl>
Date:   Fri, 29 Jul 2022 08:56:06 +0200
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
 <524f89f6-2136-c45c-cf39-a045bb92e396@xs4all.nl>
 <a4dae3ef-bbbe-123e-3a1f-126a24067e2b@denx.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <a4dae3ef-bbbe-123e-3a1f-126a24067e2b@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marek,

On 29/07/2022 05:01, Marek Vasut wrote:
> On 7/26/22 17:13, Hans Verkuil wrote:
> 
> [...]
> 
>> FYI: you can easily test cec-gpio by adding something along these lines to the dts:
>>
>>     cec-gpio {
>>         compatible = "cec-gpio";
>>         cec-gpios = <&gpio 6 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>>     };
>>
>> (this is from a Raspberry Pi). As long as the cec-gpios pin can be configured as a
>> pull up, then you're OK. It doesn't have to be connected to anything.
>>
>> If the cec-gpio driver is enabled as well, then you should see a /dev/cec0 device.
>>
>> If you can run 'cec-ctl --playback -p 1.0.0.0', then it works.
>>
>> Another driver that switches direction is drivers/gpu/drm/i2c/tda998x_drv.c
>> where the irq line has to be configured as an output during calibration.
>> See tda998x_cec_calibration().
> 
> Does this look OK ?
> 
> $ cec-ctl --playback -p 1.0.0.0
> Driver Info:
>         Driver Name                : cec-gpio
>         Adapter Name               : cec-gpio
>         Capabilities               : 0x000000af
>                 Physical Address
>                 Logical Addresses
>                 Transmit
>                 Passthrough
>                 Monitor All
>                 Monitor Pin
>         Driver version             : 5.19.0
>         Available Logical Addresses: 4
>         Connector Info             : None
>         Physical Address           : 1.0.0.0
>         Logical Address Mask       : 0x0010
>         CEC Version                : 2.0
>         Vendor ID                  : 0x000c03 (HDMI)
>         OSD Name                   : 'Playback'
>         Logical Addresses          : 1 (Allow RC Passthrough)
> 
>           Logical Address          : 4 (Playback Device 1)
>             Primary Device Type    : Playback
>             Logical Address Type   : Playback
>             All Device Types       : Playback
>             RC TV Profile          : None
>             Device Features        :
>                 None
> 
> $ cec-compliance
> Driver Info:
>         Driver Name                : cec-gpio
>         Adapter Name               : cec-gpio
>         Capabilities               : 0x000000af
>                 Physical Address
>                 Logical Addresses
>                 Transmit
>                 Passthrough
>                 Monitor All
>                 Monitor Pin
>         Driver version             : 5.19.0
>         Available Logical Addresses: 4
>         Connector Info             : None
>         Physical Address           : 1.0.0.0
>         Logical Address Mask       : 0x0010
>         CEC Version                : 2.0
>         Vendor ID                  : 0x000c03 (HDMI)
>         OSD Name                   : 'Playback'
>         Logical Addresses          : 1 (Allow RC Passthrough)
> 
>           Logical Address          : 4 (Playback Device 1)
>             Primary Device Type    : Playback
>             Logical Address Type   : Playback
>             All Device Types       : Playback
>             RC TV Profile          : None
>             Device Features        :
>                 None
> 
> Compliance test for cec-gpio device /dev/cec0:
> 
>     The test results mean the following:
>         OK                    Supported correctly by the device.
>         OK (Not Supported)    Not supported and not mandatory for the device.
>         OK (Presumed)         Presumably supported.  Manually check to confirm.
>         OK (Unexpected)       Supported correctly but is not expected to be supported for this device.
>         OK (Refused)          Supported by the device, but was refused.
>         OK (Expected Failure) Failed but this was expected (see -e option).
>         FAIL                  Failed and was expected to be supported by this device.
> 
> Find remote devices:
>         Polling: OK
> 
> FAIL: No remote devices found, exiting.

Yes, that looks fine.

Regards,

	Hans
