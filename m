Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C357F6505E6
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Dec 2022 01:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiLSA37 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Dec 2022 19:29:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLSA37 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Dec 2022 19:29:59 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48498DC7
        for <linux-gpio@vger.kernel.org>; Sun, 18 Dec 2022 16:29:56 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 82C69836CF;
        Mon, 19 Dec 2022 01:29:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1671409794;
        bh=NgmAgNayxTPcqg00OcThnZKFc/lLha9UWwaxL+K8Zhg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jA9wRWVszZluq7dhd/fCkgAPTVA5Ax0yfFdAH1x9JlC2kRXSHbu7q6GI4AvWccGE9
         Y0BGULTyf7IErrP2lmEEIlTUXFoo1DL3WYwJ3hISyeUvzFq58C7yvyoK4FwpVVTVFq
         wXvlBy9sjW/MCyMfvUxTtJ4/NEX3UvGeY9WWIKgKGBJLpeuYL+NWHwsDBh/V04p3mj
         qwVG25g+3uvCgZe0+RoBlGHObp6BUpe4tebdGJOItBTj6IAnq7OhlWi+FjnHXe8d3T
         H0nD1bgofkCHf9VWdrCijW+RGiuENT8EUeduubWnOmLTJ6ClmIXgmnl2YKISYzb9Lq
         k9LyDN4a5J4sg==
Message-ID: <2c697aa3-a882-d0cc-11aa-1f31c8ca7c2f@denx.de>
Date:   Mon, 19 Dec 2022 01:29:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 2/2] gpio: mxc: Always set GPIOs used as interrupt
 source to INPUT mode
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
References: <20221013215946.216184-1-marex@denx.de>
 <20221013215946.216184-2-marex@denx.de>
 <CACRpkdZwZCDA-pvneLYyMvxqeZkSoM3CFRHEkpOLoiWpPvXOxQ@mail.gmail.com>
 <24df1fa1-c24e-a07b-f7bc-dbf9f059549d@denx.de>
 <CACRpkdZ63r0Vo0TpQ8w4t9gzJ2uXu1ywaTWXJ3mmuT1zW+KH4g@mail.gmail.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdZ63r0Vo0TpQ8w4t9gzJ2uXu1ywaTWXJ3mmuT1zW+KH4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/19/22 00:21, Linus Walleij wrote:
> On Fri, Dec 16, 2022 at 10:51 PM Marek Vasut <marex@denx.de> wrote:
>> On 10/17/22 12:24, Linus Walleij wrote:
>>> On Fri, Oct 14, 2022 at 12:00 AM Marek Vasut <marex@denx.de> wrote:
>>>
>>>> Always configure GPIO pins which are used as interrupt source as INPUTs.
>>>> In case the default pin configuration is OUTPUT, or the prior stage does
>>>> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
>>>> INPUT and no interrupts are received.
>>>>
>>>> Always configure the interrupt source GPIO pin as input to fix the above case.
>>>>
>>>> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Can you please just pick these two patches up ?
> 
> Bartosz is queueing GPIO patches, I'm sure he will get to
> queue them soon enough.

Thanks
