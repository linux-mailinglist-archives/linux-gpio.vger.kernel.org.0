Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE4DD10D2FF
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 10:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbfK2JMV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 04:12:21 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:47315 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726143AbfK2JMV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Nov 2019 04:12:21 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iacJu-00053w-Nt; Fri, 29 Nov 2019 10:12:10 +0100
To:     Yash Shah <yash.shah@sifive.com>
Subject: RE: [PATCH v3 5/6] gpio: sifive: Add GPIO driver for SiFive SoCs
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 29 Nov 2019 09:12:10 +0000
From:   Marc Zyngier <maz@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        <aou@eecs.berkeley.edu>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <bmeng.cn@gmail.com>,
        <atish.patra@wdc.com>, Sagar Kadam <sagar.kadam@sifive.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
In-Reply-To: <CH2PR13MB33682C26386CB4EE8A7EA1C98C460@CH2PR13MB3368.namprd13.prod.outlook.com>
References: <1574661437-28486-1-git-send-email-yash.shah@sifive.com>
 <1574661437-28486-6-git-send-email-yash.shah@sifive.com>
 <CACRpkdY7fGvTPcwwC0XU+XN2w_QUCj0MmOYhp183P3Lj7Qw8WA@mail.gmail.com>
 <CH2PR13MB33682C26386CB4EE8A7EA1C98C460@CH2PR13MB3368.namprd13.prod.outlook.com>
Message-ID: <208a63e8819b84f9dc03f270f2606294@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: yash.shah@sifive.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, tglx@linutronix.de, jason@lakedaemon.net, bmeng.cn@gmail.com, atish.patra@wdc.com, sagar.kadam@sifive.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019-11-29 06:27, Yash Shah wrote:
>> -----Original Message-----
>> From: Linus Walleij <linus.walleij@linaro.org>
>> Sent: 28 November 2019 17:50
>> To: Yash Shah <yash.shah@sifive.com>
>> Cc: bgolaszewski@baylibre.com; robh+dt@kernel.org;
>> mark.rutland@arm.com; palmer@dabbelt.com; Paul Walmsley ( Sifive)
>> <paul.walmsley@sifive.com>; aou@eecs.berkeley.edu; 
>> tglx@linutronix.de;
>> jason@lakedaemon.net; maz@kernel.org; bmeng.cn@gmail.com;
>> atish.patra@wdc.com; Sagar Kadam <sagar.kadam@sifive.com>; linux-
>> gpio@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Sachin 
>> Ghadi
>> <sachin.ghadi@sifive.com>
>> Subject: Re: [PATCH v3 5/6] gpio: sifive: Add GPIO driver for SiFive 
>> SoCs
>>
>> On Mon, Nov 25, 2019 at 6:58 AM Yash Shah <yash.shah@sifive.com> 
>> wrote:
>>
>> > Adds the GPIO driver for SiFive RISC-V SoCs.
>> >
>> > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
>> > [Atish: Various fixes and code cleanup]
>> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> I suppose Marc will merge all patches into the irqchip tree as they 
>> are logically
>> dependent? If you want the GPIO bindings and this driver directly 
>> merged
>> (no deps) then I can do that as well.
>
> Yes, the GPIO driver have logical dependency on irqchip patches. It
> is best if Marc merges all the patches into the irqchip tree.
>
> @Marc Zyngier, Are you going to merge all the patches into the 
> irqchip tree?

I'm happy to pick this up, but that's definitely 5.6 material as
I stopped collecting new 5.5 features a couple of weeks ago.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
