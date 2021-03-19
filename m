Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80A1B3416E7
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 08:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234246AbhCSHxf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 03:53:35 -0400
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:32010 "EHLO
        smtp-fw-2101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234249AbhCSHxK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 03:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1616140390; x=1647676390;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=nnz4ZVwvkmvROymiBn8exsRn4Oe7nIPr4PArq24HC78=;
  b=QCDXb+vw/M/NDO/KtnrIslGC/+sVgMXyEJRu8Zs3t2Lmoc94m3kxygBb
   iXpOAZWDnzdjoyZT1swsioAVqyf9r6tuQWDwNGLpOJ4D3kUeOm3I2u9i6
   bL7KXEm6Q+v0kNBIl41oxZs2YT+Qf+pUIHclDDXjS/oHv9uNZeEliIHKd
   I=;
X-IronPort-AV: E=Sophos;i="5.81,261,1610409600"; 
   d="scan'208";a="95927641"
Subject: Re: [PATCH v3 3/3] pinctrl: pinctrl-single: fix pcs_pin_dbg_show() when
 bits_per_mux is not zero
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP; 19 Mar 2021 07:53:02 +0000
Received: from EX13MTAUEE002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS id 64FECA187C;
        Fri, 19 Mar 2021 07:53:01 +0000 (UTC)
Received: from EX13D08UEE003.ant.amazon.com (10.43.62.118) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 19 Mar 2021 07:53:00 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE003.ant.amazon.com (10.43.62.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 19 Mar 2021 07:53:00 +0000
Received: from [192.168.19.39] (10.1.212.29) by mail-relay.amazon.com
 (10.43.62.224) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Mar 2021 07:52:56 +0000
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
References: <20210317214149.20833-1-hhhawa@amazon.com>
 <20210317214149.20833-4-hhhawa@amazon.com>
 <CAHp75VdYeVOHu5T37EBEjL5xfgjevzb-ErZb2QMy7defXDS5fg@mail.gmail.com>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
Message-ID: <cd589749-7f37-9f7f-9d36-42032c724506@amazon.com>
Date:   Fri, 19 Mar 2021 09:52:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdYeVOHu5T37EBEjL5xfgjevzb-ErZb2QMy7defXDS5fg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/18/2021 2:15 PM, Andy Shevchenko wrote:
> 
> 
> On Wed, Mar 17, 2021 at 11:42 PM Hanna Hawa<hhhawa@amazon.com>  wrote:
>> An SError was detected when trying to print the supported pins in a
> What is SError? Yes, I have read a discussion, but here is the hint:
> if a person sees this as a first text due to, for example, bisecting
> an issue, what she/he can get from this cryptic name?

What you suggest?
s/An SError/A kernel-panic/?
Or remove the sentence and keep the below:
"
This change fixes the pcs_pin_dbg_show() in pinctrl-single driver when 
bits_per_mux is not zero. In addition move offset calculation and pin 
offset in register to common function.
"

> 
>> pinctrl device which supports multiple pins per register. This change
>> fixes the pcs_pin_dbg_show() in pinctrl-single driver when bits_per_mux
>> is not zero. In addition move offset calculation and pin offset in
>> register to common function.
> Reviewed-by: Andy Shevchenko<andy.shevchenko@gmail.com>

Thanks

> 
>> Fixes: 4e7e8017a80e ("pinctrl: pinctrl-single: enhance to configure multiple pins of different modules")
>> Signed-off-by: Hanna Hawa<hhhawa@amazon.com>
>> ---
>>   drivers/pinctrl/pinctrl-single.c | 57 +++++++++++++++++++++-----------
>>   1 file changed, 37 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
>> index f3394517cb2e..4595acf6545e 100644
>> --- a/drivers/pinctrl/pinctrl-single.c
>> +++ b/drivers/pinctrl/pinctrl-single.c
>> @@ -270,20 +270,46 @@ static void __maybe_unused pcs_writel(unsigned val, void __iomem *reg)
>>          writel(val, reg);
>>   }
>>
>> +static unsigned int pcs_pin_reg_offset_get(struct pcs_device *pcs,
>> +                                          unsigned int pin)
>> +{
>> +       unsigned int mux_bytes;
>> +
>> +       mux_bytes = pcs->width / BITS_PER_BYTE;
> Can be folded to one line.

Ack

> 
>> +       if (pcs->bits_per_mux) {
>> +               unsigned int pin_offset_bytes;
>> +
>> +               pin_offset_bytes = (pcs->bits_per_pin * pin) / BITS_PER_BYTE;
>> +               return (pin_offset_bytes / mux_bytes) * mux_bytes;
> Side note for the further improvements (in a separate change, because
> I see that you just copied an original code, and after all this is
> just a fix patch): this can be replaced by round down APIs (one which
> works for arbitrary divisors).

Agree, didn't want to change the formula as it's fix patch. (here and 
below), this can be taken for further improvements.

> 
>> +       }
>> +
>> +       return pin * mux_bytes;
>> +}
>> +
>> +static unsigned int pcs_pin_shift_reg_get(struct pcs_device *pcs,
>> +                                         unsigned int pin)
>> +{
>> +       return (pin % (pcs->width / pcs->bits_per_pin)) * pcs->bits_per_pin;
> Also a side note: I'm wondering if this can be optimized to have less divisions.
> 
>> +}
>> +
>>   static void pcs_pin_dbg_show(struct pinctrl_dev *pctldev,
>>                                          struct seq_file *s,
>>                                          unsigned pin)
>>   {

Thanks,
Hanna
