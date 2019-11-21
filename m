Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65281104F19
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 10:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfKUJU3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 04:20:29 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:37660 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726014AbfKUJU2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Nov 2019 04:20:28 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iXidO-0004TK-QZ; Thu, 21 Nov 2019 10:20:18 +0100
To:     Yash Shah <yash.shah@sifive.com>
Subject: RE: [PATCH v2 1/5] genirq: introduce =?UTF-8?Q?irq=5Fdomain=5Ftra?=  =?UTF-8?Q?nslate=5Fonecell?=
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 Nov 2019 09:20:18 +0000
From:   Marc Zyngier <maz@kernel.org>
Cc:     <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        <aou@eecs.berkeley.edu>, <jason@lakedaemon.net>,
        <atish.patra@wdc.com>, Sachin Ghadi <sachin.ghadi@sifive.com>,
        <linus.walleij@linaro.org>, <linux-kernel@vger.kernel.org>,
        <bgolaszewski@baylibre.com>, <robh+dt@kernel.org>,
        <palmer@dabbelt.com>, Sagar Kadam <sagar.kadam@sifive.com>,
        <linux-gpio@vger.kernel.org>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        <tglx@linutronix.de>, <bmeng.cn@gmail.com>,
        <linux-riscv@lists.infradead.org>
In-Reply-To: <CH2PR13MB336857C8AAC4CD3EB48942BF8C4E0@CH2PR13MB3368.namprd13.prod.outlook.com>
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
 <1574233128-28114-2-git-send-email-yash.shah@sifive.com>
 <5ec51559d8b4cd3b8e80943788b52926@www.loen.fr>
 <CH2PR13MB33682B1E7B40DC5C2FD1094C8C4E0@CH2PR13MB3368.namprd13.prod.outlook.com>
 <CH2PR13MB336857C8AAC4CD3EB48942BF8C4E0@CH2PR13MB3368.namprd13.prod.outlook.com>
Message-ID: <35606a5012643fcc71592ab4e2c3fdd5@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: yash.shah@sifive.com, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, jason@lakedaemon.net, atish.patra@wdc.com, sachin.ghadi@sifive.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com, robh+dt@kernel.org, palmer@dabbelt.com, sagar.kadam@sifive.com, linux-gpio@vger.kernel.org, paul.walmsley@sifive.com, tglx@linutronix.de, bmeng.cn@gmail.com, linux-riscv@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019-11-21 08:55, Yash Shah wrote:

[...]

>> > > + * bindings where the cell values map directly to the hwirq 
>> number.
>> > > + */
>> > > +int irq_domain_translate_onecell(struct irq_domain *d,
>> > > +				 struct irq_fwspec *fwspec,
>> > > +				 unsigned long *out_hwirq,
>> > > +				 unsigned int *out_type)
>> > > +{
>> > > +	if (WARN_ON(fwspec->param_count < 1))
>> > > +		return -EINVAL;
>> > > +	*out_hwirq = fwspec->param[0];
>> > > +	*out_type = IRQ_TYPE_NONE;
>> > > +	return 0;
>> > > +}
>> > > +EXPORT_SYMBOL_GPL(irq_domain_translate_onecell);
>> > > +
>> > > +/**
>> > >   * irq_domain_translate_twocell() - Generic translate for 
>> direct
>> > > two cell
>> > >   * bindings
>> > >   *
>> >
>> > Can you please also update (potentially in a separate patch) the
>> > potential users of this? I mentioned the nvic driver last time...
>> >
>>
>> Ok, I will separate out this patch from the patchset and send it 
>> individually
>> along with potential users of it.
>> Thanks for your comments
>
> I am sorry, I think I misunderstood you.
> You want me to send a new separate patch in which the potential users
> will be updated to this new function.
> Hope I got it right?

Just add, as part of this series, a patch that updates the one or two
drivers that could make use of this. It doesn't need to be in a 
separate
patch set (which would cause dependency issues).

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
