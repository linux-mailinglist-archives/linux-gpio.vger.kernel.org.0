Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B546027E6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 11:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiJRJF2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 05:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbiJRJFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 05:05:08 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2DCAE64
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 02:04:57 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E99A484461;
        Tue, 18 Oct 2022 11:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1666083893;
        bh=2FINBuga9/RKt+gtWqz76Lk3Ab3bC+yY50Z1oDecqVs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ioueUY1mu7KzwHhotBkPTvT+qumUNezSB24crAfPdpPqSP1VyzByKcyrmdrkyjwJQ
         Ebd9e8BIFSgYrtKoWr0qr5FtkStGhNXSlYXLssFe3bq4m96wfh/6FI8tU56OJ8mupx
         OmQcRv+48yiUZodjpC/abMIxZ3hdNj5tPMqgsg4yigfd8uxGqhjJ8cAP11MNaO6Run
         xD2s/TmPPLfflKQVif/Ms8AkI651/az1fV0fkX+v5nBS6PbMwD/ZYdkkmUApa1/6MX
         wX5wFWyNuk2xmkrcZ9G5qx+8R7VyOltOh0bqpPm+fN/KhEo7Sl1jwoxU4bENcgWJ2Y
         tSjMl6FRrXmIw==
Message-ID: <7054f0cf-6e63-5b8f-4f17-ba7e3303d4cb@denx.de>
Date:   Tue, 18 Oct 2022 11:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio
 spinlock
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Anatolij Gustschin <agust@denx.de>
References: <20221013215946.216184-1-marex@denx.de>
 <CACRpkdZG4a2SsNiunxz0SHR6kuXLX34LZcYp0dGakDigwbGdHw@mail.gmail.com>
 <86fb901a-ca3a-cfdc-8984-1af9235d5323@denx.de>
 <CACRpkdaW55-KGKNTTStgbteHn9Kp9E86y1+fTsFBXuV3v3KEiQ@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdaW55-KGKNTTStgbteHn9Kp9E86y1+fTsFBXuV3v3KEiQ@mail.gmail.com>
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

On 10/18/22 10:46, Linus Walleij wrote:
> On Tue, Oct 18, 2022 at 10:33 AM Marek Vasut <marex@denx.de> wrote:
>> On 10/17/22 12:23, Linus Walleij wrote:
>>> On Fri, Oct 14, 2022 at 12:00 AM Marek Vasut <marex@denx.de> wrote:
>>>
>>>> The driver currently performs register read-modify-write without locking
>>>> in its irqchip part, this could lead to a race condition when configuring
>>>> interrupt mode setting. Add the missing bgpio spinlock lock/unlock around
>>>> the register read-modify-write.
>>>>
>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>> Reviewed-by: Marc Zyngier <maz@kernel.org>
>>>> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>
>>> Unrelated, but Marek can you have a look at this MXC patch since
>>> you're obviously working on the platform:
>>> https://lore.kernel.org/linux-gpio/20221007152853.838136-1-shenwei.wang@nxp.com/
>>
>> Errrr, that's i.MX8, which is completely different chip than the i.MX8M
>> (except for the naming, which ... oh well). I work on the simpler i.MX8M.
> 
> Yeah, I think a part of the problem is that the MXC GPIO is not connected
> to the back-end pin controller for i.MX so one rarely know which SoC
> it is used on.

The MXC GPIO is traditionally completely separate from IOMUXC pinmux 
controller, the MX8 (the non-M and non-X) is just a bit odd and I have 
little experience with that one.

>> But looking at the patch, don't we already have a DT property which lets
>> one set GPIO as wake up source, without massive enumeration tables in
>> each GPIO driver ? It seems to me that's what NXP is trying to
>> implement, per GPIO wake up.
> 
> I had to bite the bullet and write a longer reply, hoping the i.MX
> and MXC maintainers wake up:
> https://lore.kernel.org/linux-gpio/CACRpkdaKncznz5qej6owA2OGMeqbrif9e_QO3CWN6+sGhEApDw@mail.gmail.com/T/#mac3a8d5399c486657c5e168107ed591694d4b155

I saw that one, thanks for CCing me, I actually dropped the request from 
you here yesterday by accident (sorry).
