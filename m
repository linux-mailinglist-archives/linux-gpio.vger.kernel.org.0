Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A453058067B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jul 2022 23:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237250AbiGYV0h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 17:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237221AbiGYV0g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 17:26:36 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDDE23BF3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 14:26:35 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 1B2D0845A3;
        Mon, 25 Jul 2022 23:26:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1658784392;
        bh=iCjtn/G7AX4XIwNgnXfmyaBooUCl2EhnZNody1Qhnxg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OHsTJsRa+jKe6iPJPCtYd3bST2tmXp+eOnAfjvHdxY/Jq9/TCvKrYwXolXWPcSsXl
         uQUAAFjBNwV6jafcZzkO//E4g4caBo2Ii950SuMIhrc8tnxh3Ix+U0oilk7X1DhAqy
         7QEysX59cO4KHQSc+jUJXMAKGtBN0fqGDOjKQ04mktAho0shDSuVEfsxqDHD0V3zRu
         FJp917Cb7331s6NMNM1rFaQewZrjGdmzRTfv73EiU8b0dTS6xk1PH+jH2I6ftt+YtC
         yTy7p+vUdRGeAT73Ew7lUtW3bHui9GNN0k4lfREORQ5lRTyq48jNFnLzmYBtqR8GqN
         vpfGrrMjEDLYA==
Message-ID: <222da8df-4e1f-7407-aa35-e94ac399d488@denx.de>
Date:   Mon, 25 Jul 2022 23:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/2] gpio: mxc: Always set GPIOs used as interrupt
 source to INPUT mode
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
References: <20220724171057.18549-1-marex@denx.de>
 <20220724171057.18549-2-marex@denx.de>
 <CAHp75VfW6s56uYdEBYD_gcX6_PoBMJXmDQWYT7rERqW75=XoOA@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAHp75VfW6s56uYdEBYD_gcX6_PoBMJXmDQWYT7rERqW75=XoOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 7/25/22 22:36, Andy Shevchenko wrote:
> On Sun, Jul 24, 2022 at 7:21 PM Marek Vasut <marex@denx.de> wrote:
>>
>> Always configure GPIO pins which are used as interrupt source as INPUTs.
>> In case the default pin configuration is OUTPUT, or the prior stage does
>> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
>> INPUT and no interrupts are received.
>>
>> Always configure interrupt source GPIO pin as input to fix the above case.
> 
> the interrupt
> 
> ...
> 
> I'm wondering if it's configured as output (by who?) shouldn't you
> issue a warning?

Probably not, I can think of valid use-case where the pin can be 
configured as output by the prior stage e.g. to operate an LED, but then 
reconfigured as input by Linux to e.g. sample a button. There is 
hardware which shares button and LED on the same GPIO line to my knowledge.
