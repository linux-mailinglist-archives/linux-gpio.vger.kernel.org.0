Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFFBD801DD
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 22:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394827AbfHBUkB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 16:40:01 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:10429 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728669AbfHBUkB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 16:40:01 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d449fa90003>; Fri, 02 Aug 2019 13:40:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 02 Aug 2019 13:40:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 02 Aug 2019 13:40:00 -0700
Received: from [10.2.165.119] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 20:39:58 +0000
Subject: Re: [PATCH V6 14/21] clk: tegra210: Add suspend and resume support
To:     Stephen Boyd <sboyd@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>, <jason@lakedaemon.net>,
        <jonathanh@nvidia.com>, <linus.walleij@linaro.org>,
        <marc.zyngier@arm.com>, <mark.rutland@arm.com>, <stefan@agner.ch>,
        <tglx@linutronix.de>, <thierry.reding@gmail.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-15-git-send-email-skomatineni@nvidia.com>
 <e683b417-66fb-38dc-c16b-dab616583a88@gmail.com>
 <88da46d2-b90d-f57e-7611-b8653b56bdf6@nvidia.com>
 <ceedb802-7561-488f-3a89-67bee19f2fea@gmail.com>
 <e2d0e8cc-b4ea-1148-4af1-fee6bb266cca@nvidia.com>
 <5054f178-db27-9286-d123-3e2b2a885717@gmail.com>
 <8c259511-d8ea-51b2-0b1d-c85b964bc44c@gmail.com>
 <20190802175119.1E401217F5@mail.kernel.org>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <641727e6-4796-f982-3b58-4c8d666de1a2@nvidia.com>
Date:   Fri, 2 Aug 2019 13:39:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190802175119.1E401217F5@mail.kernel.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564778409; bh=PN3wrARX7WvoqUyRiXWcsdgFtMDkdP5KnHn+Q2UhiUU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=W7yms/BVhINNuKUlMyW/8kt1KzZEb/YQ5FrTqlt4Zm9z3JHVYkvYzLii99fnHYe+a
         9Pt/LNoTMZnHCvDb37gdCKuE3SQR/1iNHTLiwRt9Gf1z537lukTStq6FrncIlkoYeN
         OGfxM1JFkbA/29spRoWTeFdIhNIJwwKX8pVLPZL4Ezes/nwEU5TTeC5gWDny0eIvP+
         jgHZudyv2czB30Bn1CnaM676GpYx4lPU6mRDK7NqqRq+8dqFIpVoCuyjGCnmaAr4Y1
         SYn/HQiJTNdLtbegZw0jCxMnOQnu1pdS96Trgi812L+AprM48Hk7S2m+d/0/EQuEp1
         EX3tpMXBBGwxw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/2/19 10:51 AM, Stephen Boyd wrote:
> Quoting Dmitry Osipenko (2019-07-22 00:12:17)
>> 22.07.2019 10:09, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 22.07.2019 9:52, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 7/21/19 11:10 PM, Dmitry Osipenko wrote:
>>>>> 22.07.2019 1:45, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> On 7/21/19 2:38 PM, Dmitry Osipenko wrote:
>>>>>>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>> @@ -2853,9 +2859,8 @@ static int tegra210_enable_pllu(void)
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg |=3D PLL_ENABLE;
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel(reg, clk_base + PLLU_=
BASE);
>>>>>>>>  =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 readl_relaxed_poll_timeout_atomi=
c(clk_base + PLLU_BASE, reg,
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg & PLL_B=
ASE_LOCK, 2, 1000);
>>>>>>>> -=C2=A0=C2=A0=C2=A0 if (!(reg & PLL_BASE_LOCK)) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D tegra210_wait_for_mask(&pllu, PLLU_BAS=
E, PLL_BASE_LOCK);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>>>>>>> Why this is needed? Was there a bug?
>>>>>>>
>>>>>> during resume pllu init is needed and to use same terga210_init_pllu=
,
>>>>>> poll_timeout_atomic can't be used as its ony for atomic context.
>>>>>>
>>>>>> So changed to use wait_for_mask which should work in both cases.
>>>>> Atomic variant could be used from any context, not sure what do you
>>>>> mean. The 'atomic' part only means that function won't cause scheduli=
ng
>>>>> and that's it.
>>>> Sorry, replied incorrect. readx_poll_timeout_atomic uses ktime_get() a=
nd
>>>> during resume timekeeping suspend/resume happens later than clock
>>>> suspend/resume. So using tegra210_wait_for_mask.
>>>>
>>>> both timekeeping and clk-tegra210 drivers are registered as syscore bu=
t
>>>> not ordered.
>>> Okay, thank you for the clarification.
>>>
>>> [snip]
>>>
>> You should remove the 'iopoll.h' then, since it's not used anymore.
> And also add a comment to this location in the code because it's
> non-obvious that we can't use iopoll here.
>
Actually added comment during function usage instead of during include=20
as iopoll.h is removed.

Will add additional comment in include section as well highlighting=20
reason for removal of iopoll.h

