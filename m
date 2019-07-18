Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 206A16D5DD
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 22:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391076AbfGRUgj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 16:36:39 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:8461 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfGRUgj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 16:36:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d30d8550001>; Thu, 18 Jul 2019 13:36:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 18 Jul 2019 13:36:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 18 Jul 2019 13:36:36 -0700
Received: from [10.110.103.56] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jul
 2019 20:36:36 +0000
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Dmitry Osipenko <digetx@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
        Joseph Lo <josephl@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pgaikwad@nvidia.com>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <351a07d4-ba90-4793-129b-b1a733f95531@nvidia.com>
 <e3e9beaf-b195-305e-4010-66e824813472@gmail.com>
 <9271ae75-5663-e26e-df26-57cba94dab75@nvidia.com>
 <7ae3df9a-c0e9-cf71-8e90-4284db8df82f@nvidia.com>
 <b01e37aa-f14e-e628-ceef-b25a845c6359@gmail.com>
 <46b55527-da5d-c0b7-1c14-43b5c6d49dfa@nvidia.com>
 <2de9a608-cf38-f56c-b192-7ffed65092f8@nvidia.com>
 <bff3e9c0-727d-9aef-a0e2-583e53c39afd@gmail.com>
 <5eedd224-77b0-1fc9-4e5e-d884b41a64ed@nvidia.com>
 <89f23878-d4b2-2305-03e5-8a3e781c2b02@gmail.com>
 <20190718194222.GH12715@pdeschrijver-desktop.Nvidia.com>
 <056496ed-9abf-6907-c61c-a99ccf23b834@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <1c85cb35-ce7c-1dd1-f637-0c91b2b36db3@nvidia.com>
Date:   Thu, 18 Jul 2019 13:36:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <056496ed-9abf-6907-c61c-a99ccf23b834@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563482197; bh=xTPNq2STiYkOd4YTPo3WdGjZBYbjhLu65ivHUkqxgXY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=NQoTRVZrZMUXvnkqRkaxN9jCcjj0y067n9BR9/NLbYlry2ZOqP8BO4MBYXLfqUqQ2
         j5A6JCDaC5DkvYicj+NCue6lkHfQ+G2UhndsaLJ57pz1D+y+OqKa5bmwI/a/PBuSTj
         AiInOdJwXMCpYKVRoAsHLJfo1DEXhgvui2glpsfOLEA7AN536TcHbgWB6fMaIUax4n
         euWERkAOBx8CDkVDFhccnoSRQcTbKiNcFDUORyOV6fknnbTen6Fljy5+pyhpR+XJ+N
         GtynmZ0hrJxc96Isyl01jOdoUv70rf2KKwYu4eGL8MIv1641iWjx20KTSPCw6heGY0
         0jtmhRcJGh0IA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/18/19 1:26 PM, Dmitry Osipenko wrote:
> 18.07.2019 22:42, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On Thu, Jul 18, 2019 at 02:44:56AM +0300, Dmitry Osipenko wrote:
>>>> dependencies I am referring are dfll_ref, dfll_soc, and DVFS periphera=
l
>>>> clocks which need to be restored prior to DFLL reinit.
>>> Okay, but that shouldn't be a problem if clock dependencies are set up
>>> properly.
>>>
>>>>>> reverse list order during restore might not work as all other clocks=
 are
>>>>>> in proper order no with any ref clocks for plls getting restored pri=
or
>>>>>> to their clients
>>>>> Why? The ref clocks should be registered first and be the roots for P=
LLs
>>>>> and the rest. If it's not currently the case, then this need to be
>>>>> fixed. You need to ensure that each clock is modeled properly. If som=
e
>>>>> child clock really depends on multiple parents, then the parents need=
 to
>>>>> in the correct order or CCF need to be taught about such
>>>>> multi-dependencies.
>>>>>
>>>>> If some required feature is missed, then you have to implement it
>>>>> properly and for all, that's how things are done in upstream. Sometim=
es
>>>>> it's quite a lot of extra work that everyone are benefiting from in
>>>>> the end.
>>>>>
>>>>> [snip]
>>>> Yes, we should register ref/parents before their clients.
>>>>
>>>> cclk_g clk is registered last after all pll and peripheral clocks are
>>>> registers during clock init.
>>>>
>>>> dfllCPU_out clk is registered later during dfll-fcpu driver probe and
>>>> gets added to the clock list.
>>>>
>>>> Probably the issue seems to be not linking dfll_ref and dfll_soc
>>>> dependencies for dfllCPU_out thru clock list.
>>>>
>>>> clk-dfll driver during dfll_init_clks gets ref_clk and soc_clk referen=
ce
>>>> thru DT.
>> The dfll does not have any parents. It has some clocks which are needed
>> for the logic part of the dfll to function, but there's no parent clock
>> as such unlike for peripheral clocks or PLLs where the parent is at
>> least used as a reference. The I2C controller of the DFLL shares the
>> lines with a normal I2C controller using some arbitration logic. That
>> logic only works if the clock for the normal I2C controller is enabled.
>> So you need probably 3 clocks enabled to initialize the dfll in that
>> case. I don't think it makes sense to add complicated logic to the clock
>> core to deal with this rather strange case. To me it makes more sense to
>> use pmops and open code the sequence there.
> It looks to me that dfllCPU is a PLL and dfll_ref is its reference
> parent, while dfll_soc clocks the logic that dynamically reconfigures
> dfllCPU in background. I see that PLLP is defined as a parent for
> dfll_ref and dfll_soc in the code. Hence seems dfll_ref should be set as
> a parent for dfllCPU, no?

dfll_soc will not be restored by the time dfllCPU resume happens after=20
dfll_ref.

without dfll_soc, dfllCPU cannot be resumed either. So if we decide to=20
use parent we should use dfll_soc.

> Either way is good to me, given that DFLL will be disabled during
> suspend. Resetting DFLL on DFLL's driver resume using PM ops should be
> good. And then it also will be better to error out if DFLL is active
> during suspend on the DFLL's driver suspend.

Doing in dfll-fcpu pm_ops is much better as it happens right after all=20
clocks are restored and unlike other clock enables, dfll need dfll=20
controller programming as well and is actually registered in dfll-fcpu=20
driver.

With this, below is the sequence:

CPUFreq suspend switches CPU to PLLP and disables dfll

Will add dfll_suspend/resume in dfll-fcpu driver and in dfll suspend=20
will check for dfll active and will error out suspend.

dfll resume does dfll reinit.

CPUFreq resume enables dfll and switches CPU to dfll.


Will go with doing in dfll-fcpu pm_ops rather than parenting dfllCPU_OUT...

