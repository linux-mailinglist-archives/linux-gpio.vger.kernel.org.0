Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E6A5EFC0D
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 19:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbiI2Rfi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 13:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235585AbiI2Rfh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 13:35:37 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6283CEDD2E
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 10:35:35 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B646584C88;
        Thu, 29 Sep 2022 19:35:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664472933;
        bh=bp7FAK88MNV1t4CLks41xvRZ66wg+T5DyXjYty60WjA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OsP8bnfIrPlLqprF+CPBegeGeUXgEpqX59w+BSssKfljojFlDoQ/tb9fBLzisJXs7
         b4t/g+buuO3besW/y9FGG6pK76A/ii8z/IiXXZ1Mpt1lCx4YHVcUuFwO8mOJgv/NoY
         qIstYAVRhOEDBgD5swrTjofTM75JqSwRkEiWeAzNPK4gSZgCA6mlmlYJRzfooKBjHe
         pU95jdq3mErXB3wzzYlXLdCm698VUfT7JjT+PNgwp/Sl3eExpr2m6rHADsVRkcNCPF
         jflcEHB+K2WdEm2eKuTHFu9GJ5nsvioMDl6RLdgo9P/gBskMM6IvOfRiwWu9tuig2h
         XikyxqLEdWJdA==
Message-ID: <5f3e55b6-81c4-de66-0897-cfaed2ecd7c5@denx.de>
Date:   Thu, 29 Sep 2022 19:35:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 0/2] gpio: mxc: Locking and direction input fix
Content-Language: en-US
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Marc Zyngier <maz@kernel.org>
References: <20220725103445.88674-1-marex@denx.de>
 <87bktdxkc6.wl-maz@kernel.org> <8487c9a1-a14f-eb5d-7069-7e9527d146a6@denx.de>
 <dfcf4297bdef79584095b87482de910b@kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <dfcf4297bdef79584095b87482de910b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 8/23/22 16:20, Marc Zyngier wrote:
> On 2022-08-23 11:41, Marek Vasut wrote:
>> On 7/25/22 17:50, Marc Zyngier wrote:
>>> On Mon, 25 Jul 2022 11:34:43 +0100,
>>> Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> The irqchip callbacks in gpio-mxc perform register read-modify-write 
>>>> operations
>>>> without locking, which may lead to a race condition. Add the missing 
>>>> locking.
>>>>
>>>> In case the GPIO is used as IRQ, make sure it is configured as input.
>>>>
>>>> Marek Vasut (2):
>>>>    gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
>>>>    gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode
>>>>
>>>>   drivers/gpio/gpio-mxc.c | 17 ++++++++++++++++-
>>>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>>>
>>>> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>> Cc: Loic Poulain <loic.poulain@linaro.org>
>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>>> Cc: Peng Fan <peng.fan@nxp.com>
>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>
>>> Reviewed-by: Marc Zyngier <maz@kernel.org>
>>
>> Can these two now be applied or is there something more to do ?
> 
> That'd be question for Linus and Bartosz, I guess. From my
> own PoV, this is good to go.

So uh ... could either of you schedule those for I guess 6.2 please ?
