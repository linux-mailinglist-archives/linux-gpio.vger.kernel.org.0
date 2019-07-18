Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F106D3ED
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 20:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbfGRS3u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 14:29:50 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:2283 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfGRS3u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 14:29:50 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d30ba9c0001>; Thu, 18 Jul 2019 11:29:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 18 Jul 2019 11:29:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 18 Jul 2019 11:29:48 -0700
Received: from [10.110.103.56] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jul
 2019 18:29:47 +0000
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     Peter De Schrijver <pdeschrijver@nvidia.com>,
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
References: <a5e1a6df-dff7-9e0c-9551-f78103a5462f@gmail.com>
 <d7892bfc-2cbf-27af-518d-dc7e243815b8@nvidia.com>
 <71272e9a-0f2a-c20d-6532-7e9057ad985c@gmail.com>
 <78fd19b9-b652-8ac3-1f57-3b4adadee03f@nvidia.com>
 <351a07d4-ba90-4793-129b-b1a733f95531@nvidia.com>
 <e3e9beaf-b195-305e-4010-66e824813472@gmail.com>
 <9271ae75-5663-e26e-df26-57cba94dab75@nvidia.com>
 <7ae3df9a-c0e9-cf71-8e90-4284db8df82f@nvidia.com>
 <b01e37aa-f14e-e628-ceef-b25a845c6359@gmail.com>
 <46b55527-da5d-c0b7-1c14-43b5c6d49dfa@nvidia.com>
 <2de9a608-cf38-f56c-b192-7ffed65092f8@nvidia.com>
 <bff3e9c0-727d-9aef-a0e2-583e53c39afd@gmail.com>
 <5eedd224-77b0-1fc9-4e5e-d884b41a64ed@nvidia.com>
 <89f23878-d4b2-2305-03e5-8a3e781c2b02@gmail.com>
 <c759d71b-1549-2562-f0cf-db5f9e51329e@nvidia.com>
 <ef7928ad-239d-eca8-41bf-f76e72a9841d@nvidia.com>
 <4141181d-7162-0321-71b6-33abf11f631c@gmail.com>
 <ab8f2441-8f4b-3a2b-5bcd-1a889555176a@nvidia.com>
 <419e1b16-683e-1b56-7334-50d87368c1b9@nvidia.com>
Message-ID: <8bca130c-c95c-591e-2f6e-f02538f8f8b8@nvidia.com>
Date:   Thu, 18 Jul 2019 11:29:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <419e1b16-683e-1b56-7334-50d87368c1b9@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563474588; bh=i3Oaw/zJYmyMDaTErQQO9laWRZuzKHet24JKhzQl30U=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=REPsE/AzW9dwpLPseqO2F/2SwD16D6xCQzAI3HE/Sjut6+u3vcrpP+dfBiNILmhYx
         tchCq/774DXajcuRy88LAmm9RsROylQAq8I9SCgfktslZoWNY+j7L0bP7sA5DZ1OF0
         vlVkvsL3B04q8URpQKbt5oHFZnWs+n8rAu6wfP9UiRtl8RzMKNAmBQjjUVEURRMGzK
         TYzzPwrp+h9TTk2zymfxnLLqg8mCYcTxe9zck0ZmcKRTXhPV7bLQekeEswZabEtkwJ
         bfafpN1COqJorbCpNImdEE7Dusdqen8uD2V9+7mfvrSrQ7/V527ERnTfrPR+sXRDF3
         o19LNRLOkFSuw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/18/19 10:41 AM, Sowjanya Komatineni wrote:
>
> On 7/18/19 10:22 AM, Sowjanya Komatineni wrote:
>>
>> On 7/18/19 9:34 AM, Dmitry Osipenko wrote:
>>> 18.07.2019 4:15, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>
>>> [snip]
>>>
>>>>>> Please try to fix all missing dependencies and orderings.
>>>>> Peter,
>>>>>
>>>>> dfllCPU_OUT is the first one to go thru restore when
>>>>> clk_restore_context traverses thru the list.
>>>>>
>>>>> dfllCPU_OUT has dependency on DFLL_ref and DFLL_SOC but this
>>>>> dependency is unknown to clock-tree.
>>>>>
>>>>> We can add DFLL_REF and DFLL_SOC as parents to dfllCPU_OUT during
>>>>> register so dfllCPU_OUT save/restore happens after their parents are
>>>>> restored.
>>>>>
>>>>> But DFLL needs both of these to be restored before DFLLCPU_Out and as
>>>>> DFLL_SOC restore always happens after the REF, thinking to add
>>>>> DFLL_SOC as parent to dfllCPU_OUT so save/restore follows after their
>>>>> dependencies.
>>>>>
>>>>> Please comment.
>>>>>
>>>> Did quick try and I see by adding dfll-soc as parent to=20
>>>> dfllCPU_OUT, its
>>>> in proper order after all its dependencies.
>>>>
>>>> Can now add dfll save/restore to do dfll reinit during restore..
>>>>
>>> If dfllCPU_OUT can work properly with dfll-soc being disabled, then=20
>>> this
>>> kind of dependency isn't very correct and just papers over the real
>>> problem, which is that there should be a way for CCF to specify=20
>>> multiple
>>> dependencies for the clock or the reverse ordering should be used for
>>> the restoring.
>>
>> dfll will not work without dfll-soc enabled.
>>
>> CLDVFS control logic is split into 2 clock domains. dvfs_ref_clk and=20
>> dvfs_soc_clk.
>>
>> Majority of the control logic is clocked from dvfs_soc_clk for=20
>> interfacing control registers.
>>
> Note on reverse ordering for restore. Currently restore order goes=20
> thru clock list and for each root goes thru parent -> child restore.
>
> this order is correct and also all clocks are parented properly so=20
> they follow proper order.
>
> dfllCPU is the only one where current driver doesn't take care of=20
> dependency in dfll_soc which gets enabled only after dfll_ref.
>
>
> Based on dfllCPU control logic module design, dfll_ref and dfll_soc=20
> should be enabled prior to dfll init/enable.
>
> So parenting dfll_soc to dfllCPU keeps proper order.
>

1. With dfllCPU parenting to dfll_soc, its keeps it in expected order=20
and we don't define any parent clk_ops anyway for this, so should be OK?

OR

2. Any suggestion on how to define/specify dependencies for clock other=20
than parenting to follow proper order in clock tree as clk_save_context=20
and clk_restore_context strictly goes thru clock tree order and all=20
other clocks are parented properly except for dfllCPU where there is no=20
parent. Techinically dfll_ref & dfll_soc are not parents but they need=20
to be configured prior to dfll reinit.

OR

3. I don't see way to override clk_save_context/clk_restore_context APIs=20
to change the way of traversal so I can modify to traverse in expected=20
order without dfllCPU parenting.

OR

4. dfll re-init can be done in dfll-fcpu driver pm_ops which actually=20
registers dfll or at the end of tegra210_clock resume

