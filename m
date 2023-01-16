Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3DC866BAE2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 10:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjAPJvb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 04:51:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjAPJv1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 04:51:27 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC46166C8
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:51:25 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A7C2284F3E;
        Mon, 16 Jan 2023 10:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673862684;
        bh=ZacBPIg+XxGvp/fvvnAm9qxMHKp+BvaJYKEH+GgGY4g=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=UotxN66WvsuLMmWbpF4spgbq8nKbriPrN42WvxVGuO/Q6bZ9XvmmBbzCNIrHHq6x4
         FHZTJf6E3bgNPO+rHDR2NlvEpOO3Pe44FUyMFZNs8BXkDhiVo5PS/py1TyuLN7PVA/
         wpa36pFGJiQB3M1YBcXTY3NcdIeTZAASHpWo64S9zjpCije6n0HJj8C6mbbz21RFKZ
         XTJON9cJnLapNilfQBVXEodQvtb39gXkmLU87aAKkZSwXq3/w/DsLb/gosGOxq1K9D
         vDhvdBDyicqdlK6O0lNdHSsSqHIrFuyn36RemzDLQQ62fD2ujOLhfEMS4EelxtIEjE
         aifo6yB70meKQ==
Message-ID: <a9ad2d35-a142-a218-518d-5e2130080093@denx.de>
Date:   Mon, 16 Jan 2023 10:51:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 2/2] gpio: mxc: Always set GPIOs used as interrupt
 source to INPUT mode
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
References: <20221013215946.216184-1-marex@denx.de>
 <20221013215946.216184-2-marex@denx.de>
 <CACRpkdZwZCDA-pvneLYyMvxqeZkSoM3CFRHEkpOLoiWpPvXOxQ@mail.gmail.com>
 <24df1fa1-c24e-a07b-f7bc-dbf9f059549d@denx.de>
 <CACRpkdZ63r0Vo0TpQ8w4t9gzJ2uXu1ywaTWXJ3mmuT1zW+KH4g@mail.gmail.com>
 <8ddfac59-79d3-c506-e2a9-3919e84feca9@denx.de>
 <CAMRc=MdDJi7q9ADYYHGzW0EKV6Q00Ctxv7QBviwNUgS=fMYdAQ@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMRc=MdDJi7q9ADYYHGzW0EKV6Q00Ctxv7QBviwNUgS=fMYdAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/16/23 09:31, Bartosz Golaszewski wrote:
> On Tue, Jan 10, 2023 at 9:16 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 12/19/22 00:21, Linus Walleij wrote:
>>> On Fri, Dec 16, 2022 at 10:51 PM Marek Vasut <marex@denx.de> wrote:
>>>> On 10/17/22 12:24, Linus Walleij wrote:
>>>>> On Fri, Oct 14, 2022 at 12:00 AM Marek Vasut <marex@denx.de> wrote:
>>>>>
>>>>>> Always configure GPIO pins which are used as interrupt source as INPUTs.
>>>>>> In case the default pin configuration is OUTPUT, or the prior stage does
>>>>>> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
>>>>>> INPUT and no interrupts are received.
>>>>>>
>>>>>> Always configure the interrupt source GPIO pin as input to fix the above case.
>>>>>>
>>>>>> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>
>>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>>
>>>> Can you please just pick these two patches up ?
>>>
>>> Bartosz is queueing GPIO patches, I'm sure he will get to
>>> queue them soon enough.
>>
>> Bartosz, any news ?
> 
> I don't know why this has escaped my attention for so long. I wanted
> to apply it but it no longer applies on top of my for-next branch.
> Could you rebase and resend? Sorry for the trouble Marek.

Done, V7 is out.
