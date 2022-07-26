Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85C1581595
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 16:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239437AbiGZOma (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 10:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239439AbiGZOm3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 10:42:29 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234202BB18
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 07:42:27 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 564AD841E8;
        Tue, 26 Jul 2022 16:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1658846544;
        bh=O9tkKf0mtsdbh5o+qAjexd7jmHFkRwCQs2TVOaq5J5E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gn7ZnTsw2iHX0n4oDaqJmUnNnQ4WH5FA8DoRe+vMI/9DosmzfYwNnH/Lsgrb/Nrob
         ZQpLS5YJuKy6J3fhkcJ+IHqYQPc5RM63dFG4UzR6Erl+AZbdGmLN6JbxI8saEP0TFf
         Cfh1Q5np70bDal2atH9o87zVylUV1P73Ca+EAlG6NMfS+oYUGWjmKGPvIPTbe8eaQB
         Lgv10fBdCL1VY1cbhXj6uL3sauutnz83l9OJfKC4iEVbzeCqQJ1RXc3hnFOP4Sggk3
         ygeVPorOJ6Oc9P14OJGlCWp55xyWwAX8EXdsNOTVMxI5rjPqKTp8aYO3mtVXO/PHiD
         yixwnxXwg6XYA==
Message-ID: <15dbcfc4-79a0-eaad-c513-4b4e16ccfb8f@denx.de>
Date:   Tue, 26 Jul 2022 16:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/2] gpio: mxc: Always set GPIOs used as interrupt
 source to INPUT mode
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
References: <20220724224943.294057-1-marex@denx.de>
 <20220724224943.294057-2-marex@denx.de>
 <CACRpkdbUbnOeH7p7ycmvY1YP=K_s7Oj0gt=g-m2s1P2CAqLGMQ@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdbUbnOeH7p7ycmvY1YP=K_s7Oj0gt=g-m2s1P2CAqLGMQ@mail.gmail.com>
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

On 7/26/22 10:15, Linus Walleij wrote:
> On Mon, Jul 25, 2022 at 12:50 AM Marek Vasut <marex@denx.de> wrote:
> 
>> Always configure GPIO pins which are used as interrupt source as INPUTs.
>> In case the default pin configuration is OUTPUT, or the prior stage does
>> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
>> INPUT and no interrupts are received.
>>
>> Always configure interrupt source GPIO pin as input to fix the above case.
>>
>> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Loic Poulain <loic.poulain@linaro.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: NXP Linux Team <linux-imx@nxp.com>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> ---
>> V2: Actually update and clear bits in GDIR register
>> V3: Rebase on top of new patch 1/2, expand CC list, add Fixes tag
>> V4: No change
> 
> I understand what you are trying to achieve, and it makes sense.
> 
> There's is just this one generic GPIO-based driver that makes me
> a little bit nervous here.
> 
> Consider:
> drivers/media/cec/platform/cec-gpio/cec-gpio.c
> Look what the driver is doing with the gpiod_* operations on it's
> cec->cec_gpio.
> 
> A certain GPIO pin is switched back and forth between input and
> output and in input mode, it is used to generate interrupts as well.
> 
> Will this still work fine with the MXC driver after this change?
> At least it will be set to input mode twice, but I suppose that is
> fine, it's not your fault that the frameworks are orthogonal.

Ugh. I don't see why it shouldn't work, esp. if the CEC driver controls 
the direction and the default is input, but I wonder what other corner 
cases there are.
