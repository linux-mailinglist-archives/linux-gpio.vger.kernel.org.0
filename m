Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B64580882
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 01:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiGYXx6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 19:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiGYXx5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 19:53:57 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC4D27CF0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 16:53:55 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 670EB838BB;
        Tue, 26 Jul 2022 01:53:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1658793232;
        bh=USg2SBlbQoh16pBWxF3vDkzgcWzi//L1aTeRgEspIOg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jnUmTPkiFvGWNSwUQysuemtr3rkfn+/+W0Iuj5Glv6iJJ6cA3weVXMfe2oApK47Eo
         tN0QkrkxKW/yK28BlHpVKbf1t5Zog+apRaD1nsWHqLl1T8vxMJt7YEtXTS49mIKPpD
         jUkgHzGhfAg4yCJb/H7DNlzKfN3j7R4TMZXtGMZhm4McwZxiX8inBSE+Ao1/1m15LP
         8DmxZEveUjS6IcpsUuY4OnAAx6aMfTvPCmqFbCh0IepNnOFlFMUTLnPeoAN1BYzC4v
         e17Nx/TxnUK6d6kAxOjVm/cfgfv3eUWQMluWAC9gxSEn9YombSed8zHtsqjZeGwYjN
         qPb5/lhGOsysA==
Message-ID: <5a3addbd-505e-799c-78d2-3cd1fa8e2640@denx.de>
Date:   Tue, 26 Jul 2022 01:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio
 spinlock
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
References: <20220724224943.294057-1-marex@denx.de>
 <CAHp75Ve0EQfee+eiDDG_pgzt8V3yoWeVfRZswG3EdFZZRyxa2A@mail.gmail.com>
 <CACRpkdZvjBBhNy_fQ2_dirSc1ddXCAO7dPg9OQW2eGDFWpn5rA@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdZvjBBhNy_fQ2_dirSc1ddXCAO7dPg9OQW2eGDFWpn5rA@mail.gmail.com>
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

On 7/26/22 00:30, Linus Walleij wrote:
> On Mon, Jul 25, 2022 at 10:38 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Mon, Jul 25, 2022 at 12:51 AM Marek Vasut <marex@denx.de> wrote:
>>>
>>> The driver currently performs register read-modify-write without locking
>>> in its irqchip part, this could lead to a race condition when configuring
>>> interrupt mode setting. Add the missing bgpio spinlock lock/unlock around
>>> the register read-modify-write.
>>
>> ...
>>
>>> +       spin_lock_irqsave(&port->gc.bgpio_lock, flags);
>>
>> To my surprise, is bgpio_lock not a raw spin lock?! How is it possible
>> to work on RT?
> 
> It's a spinlock that is used both for the GPIO and irqchips, so if the
> GPIO doesn't have an irqchip it works fine, as only IRQs are
> problematic.
> 
> If the registers used by the irqchip are separate from the registers
> used by the GPIO access, I think it is wise to use a separate
> raw spinlock to just protect the IRQ registers.
> 
> They really only need to share a spinlock if they use the same
> registers and the gpiochip and irqchip risk stepping on each
> others toes. That doesn't seem to be the case here?
> 
> Marek: could you see if the irqchip part of the driver could
> use its own raw spinlock?

It cannot, because of the GDIR register which is shared between the 
gpiochip and irqchip.
