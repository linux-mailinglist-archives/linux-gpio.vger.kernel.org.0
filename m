Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4ED59E5DF
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Aug 2022 17:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242944AbiHWPUO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Aug 2022 11:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242953AbiHWPTz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Aug 2022 11:19:55 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A44158679
        for <linux-gpio@vger.kernel.org>; Tue, 23 Aug 2022 03:42:32 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 79C8B8406A;
        Tue, 23 Aug 2022 12:41:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1661251297;
        bh=CRolEpxlXwJiZcvR0DLswlj93GmTikFsWM+SKQ3Psnk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=dgtEXj85l89SNg7PxgIlv53uAW3QUZBNgzi+McgFotZB8+EmCsXTfuUnD7dhgEZm5
         l2ltlUK/8PaP6jLLNGWn0ADe5Rr8nsiw3dVvM0+TXefEpNLAhanZLtRqIUFwgfn7XX
         4rOjpf2/ErFhXzaxKTcsiy6DADP8Yma2qPvtZsFyALSt5CUgyCikIEql2cqStLt8rV
         o0Pc/E3ghp0vxO5bn1VuNL2Osn8iSRVBUoRWo7rz9BHJIrT4z9EXcOPHfIomIIn8ZR
         1QTcMkKBZaQ2przO4hKOzSWmWK6ODwe0zqHrmhGpVoAdNVrTx2ZLATzMcpDYfMxw/M
         mqqJ6JKMOSZkA==
Message-ID: <8487c9a1-a14f-eb5d-7069-7e9527d146a6@denx.de>
Date:   Tue, 23 Aug 2022 12:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v5 0/2] gpio: mxc: Locking and direction input fix
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
References: <20220725103445.88674-1-marex@denx.de>
 <87bktdxkc6.wl-maz@kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <87bktdxkc6.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 7/25/22 17:50, Marc Zyngier wrote:
> On Mon, 25 Jul 2022 11:34:43 +0100,
> Marek Vasut <marex@denx.de> wrote:
>>
>> The irqchip callbacks in gpio-mxc perform register read-modify-write operations
>> without locking, which may lead to a race condition. Add the missing locking.
>>
>> In case the GPIO is used as IRQ, make sure it is configured as input.
>>
>> Marek Vasut (2):
>>    gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
>>    gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode
>>
>>   drivers/gpio/gpio-mxc.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Loic Poulain <loic.poulain@linaro.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: NXP Linux Team <linux-imx@nxp.com>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Shawn Guo <shawnguo@kernel.org>
> 
> Reviewed-by: Marc Zyngier <maz@kernel.org>

Can these two now be applied or is there something more to do ?
