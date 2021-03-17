Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92AFA33F96D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 20:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbhCQThd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 15:37:33 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:63819 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbhCQThc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 15:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1616009852; x=1647545852;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=489A1VRkztitIWAcLQ9i/t5Pl6Ug/jdMC2m9puuh5lk=;
  b=T8cE6l3ilSHOuJrQlkjr0eg8dxO3fE8aDQ3NbDRraG2E0mtqEnchBNaR
   SQyfzcupqzSLD5NvvWnKBTjBd48vxLCSWWXvOQI9WrLDqLOvPEtAhtUqp
   /vV71VZlNblhPVFwwcG8RvkRQtTVTS4UDZttBluL9MU573TtSvUCYNG99
   U=;
X-IronPort-AV: E=Sophos;i="5.81,257,1610409600"; 
   d="scan'208";a="93960458"
Subject: Re: [PATCH v2 3/3] pinctrl: pinctrl-single: fix pcs_pin_dbg_show() when
 bits_per_mux != 0
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 17 Mar 2021 19:35:24 +0000
Received: from EX13MTAUEB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS id 7B1BEA058D;
        Wed, 17 Mar 2021 19:35:23 +0000 (UTC)
Received: from EX13D08UEB002.ant.amazon.com (10.43.60.107) by
 EX13MTAUEB001.ant.amazon.com (10.43.60.129) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 17 Mar 2021 19:35:23 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08UEB002.ant.amazon.com (10.43.60.107) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 17 Mar 2021 19:35:22 +0000
Received: from [10.85.97.144] (10.85.97.144) by mail-relay.amazon.com
 (10.43.60.234) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 17 Mar 2021 19:35:19 +0000
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "David Woodhouse" <dwmw@amazon.co.uk>, <benh@amazon.com>,
        <ronenk@amazon.com>, <talel@amazon.com>, <jonnyc@amazon.com>,
        <hanochu@amazon.com>, <tgershi@amazon.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210316202434.27555-1-hhhawa@amazon.com>
 <20210316202434.27555-4-hhhawa@amazon.com>
 <CAHp75VdVnFn+DuO54PsUVGk4ZWWCJpYKsSQVsaUkiDzZki2QRQ@mail.gmail.com>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
Message-ID: <c2dc25d8-b71c-e6c2-4c36-3d82bd0f762f@amazon.com>
Date:   Wed, 17 Mar 2021 21:35:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdVnFn+DuO54PsUVGk4ZWWCJpYKsSQVsaUkiDzZki2QRQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/17/2021 2:27 PM, Andy Shevchenko wrote:
> 
> On Tue, Mar 16, 2021 at 11:24 PM Hanna Hawa <hhhawa@amazon.com> wrote:
>>
>> An SError was detected when trying to print the supported pins in a
> 
> What SError is?

System error:
[   24.257831] SError Interrupt on CPU0, code 0xbf000002 -- SError
...
[   24.257855] Kernel panic - not syncing: Asynchronous SError Interrupt

> 
>> pinctrl device which supports multiple pins per register. This change
>> fixes the pcs_pin_dbg_show() in pinctrl-single driver when
>> bits_per_mux != 0. In addition move offset calculation and pin offset in
> 
> '!= 0' -> 'is not zero'

Will be fixed.

> 
>> register to common function.
> 
> Fixes tag?

Sure, will be added.

> 
>> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
>> ---
>>   drivers/pinctrl/pinctrl-single.c | 66 ++++++++++++++++++++++----------
>>   1 file changed, 45 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
>> index f3394517cb2e..434f90c8b1b3 100644
>> --- a/drivers/pinctrl/pinctrl-single.c
>> +++ b/drivers/pinctrl/pinctrl-single.c
>> @@ -270,20 +270,53 @@ static void __maybe_unused pcs_writel(unsigned val, void __iomem *reg)
>>          writel(val, reg);
>>   }
>>
>> +static unsigned int pcs_pin_reg_offset_get(struct pcs_device *pcs,
>> +                                          unsigned int pin)
>> +{
>> +       unsigned int offset, mux_bytes;
> 
> Offset can be replaced by direct return statements.

Ack.

> 
>> +       mux_bytes = pcs->width / BITS_PER_BYTE;
>> +
>> +       if (pcs->bits_per_mux) {
>> +               unsigned int pin_offset_bytes;
>> +
>> +               pin_offset_bytes = (pcs->bits_per_pin * pin) / BITS_PER_BYTE;
>> +               offset = (pin_offset_bytes / mux_bytes) * mux_bytes;
>> +       } else {
>> +               offset = pin * mux_bytes;
>> +       }
>> +
>> +       return offset;
>> +}
>> +
>> +static unsigned int pcs_pin_shift_reg_get(struct pcs_device *pcs,
>> +                                         unsigned int pin)
>> +{
>> +       return ((pin % (pcs->width / pcs->bits_per_pin)) * pcs->bits_per_pin);
> 
> Too many parentheses.

Will remove the extra parentheses.

> 
>> +}
>> +
>>   static void pcs_pin_dbg_show(struct pinctrl_dev *pctldev,
>>                                          struct seq_file *s,
>>                                          unsigned pin)
>>   {
>>          struct pcs_device *pcs;
>> -       unsigned val, mux_bytes;
>> +       unsigned int val;
>>          unsigned long offset;
>>          size_t pa;
>>
>>          pcs = pinctrl_dev_get_drvdata(pctldev);
>>
>> -       mux_bytes = pcs->width / BITS_PER_BYTE;
>> -       offset = pin * mux_bytes;
>> -       val = pcs->read(pcs->base + offset);
>> +       offset = pcs_pin_reg_offset_get(pcs, pin);
>> +
>> +       if (pcs->bits_per_mux) {
>> +               unsigned int pin_shift_in_reg = pcs_pin_shift_reg_get(pcs, pin);
> 
>> +               val = pcs->read(pcs->base + offset)
>> +                       & (pcs->fmask << pin_shift_in_reg);
> 
> One line?
> At least move & to the upper line.
> 
>> +       } else {
>> +               val = pcs->read(pcs->base + offset);
> 
> It's the same as in above branch, why not
> 
> val = read();
> if ()
>   val &= fmask << _reg_get(...);
> 
> ?

Agree, looks better

Thanks Andy, will send new patchset soon.

Thanks,
Hanna
