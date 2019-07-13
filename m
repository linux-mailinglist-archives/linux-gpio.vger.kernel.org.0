Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 303F167898
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2019 07:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbfGMFb2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Jul 2019 01:31:28 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7452 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfGMFb2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Jul 2019 01:31:28 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d296ca70000>; Fri, 12 Jul 2019 22:31:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 12 Jul 2019 22:31:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 12 Jul 2019 22:31:27 -0700
Received: from [10.2.168.186] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 13 Jul
 2019 05:31:21 +0000
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
To:     Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stefan Agner <stefan@agner.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, "Joseph Lo" <josephl@nvidia.com>,
        <talho@nvidia.com>, <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Mikko Perttunen" <mperttunen@nvidia.com>, <spatra@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
 <a262cbb3-845c-3ad1-16cc-375a24b9f7e9@gmail.com>
 <822867d6-4a4d-5f68-9b21-84a20d73c589@gmail.com>
 <CACRpkdYdCmT0ErTuewYbv7bPkjoFLrK9KSVuKVMkAXNQYAGV7g@mail.gmail.com>
 <66b5e81b-d468-e2aa-7336-3d4854c234ab@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <db7ac8e6-bfad-bc60-b46e-d886025872e4@nvidia.com>
Date:   Fri, 12 Jul 2019 22:31:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <66b5e81b-d468-e2aa-7336-3d4854c234ab@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562995882; bh=rRFTBuUzg0mfGSt6+Tv2/mNCICucMseIncizpc4RLL4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=gIHIXdZcs4rvgy2XqMV5dCxYR5tEIVWmVqCmheHdNeO5/GnYfRdQSgHi2aL4q0xD6
         G8Hsg5IKO7hrYRJIEhFA65Ei769BO4vZEVDz7v7C7taLaLo/jyI/BTi1qZUpzwe6YQ
         JCvGD0RbiR4UkoLaTNCYAFdhVTrqTtByLyr/iiWnWz25q3eKiboTL7WMGRxO531PeP
         fJeTI9IBC5SJSVybTJG2SnR1xkXIf8asmWPOmMGhn3f32nQnUld8hLOYVjTSb37woa
         jRCoXCuXi8WM/h2KH6TdbWK1/ISUcQxpHSh6ifzgBqsuNDRxj0efptLRO3VQ6ZC9Lw
         +HwzW8Eaqnl9g==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/4/19 3:40 AM, Dmitry Osipenko wrote:
> 04.07.2019 10:31, Linus Walleij =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On Sat, Jun 29, 2019 at 5:58 PM Dmitry Osipenko <digetx@gmail.com> wrote=
:
>>
>>> Oh, also what about GPIO-pinctrl suspend resume ordering .. is it okay =
that pinctrl
>>> will be resumed after GPIO? Shouldn't a proper pin-muxing be selected a=
t first?
>> Thierry sent some initial patches about this I think. We need to use
>> device links for this to work properly so he adds support for
>> linking the pinctrl and GPIO devices through the ranges.
>>
>> For links between pin control handles and their consumers, see also:
>> 036f394dd77f pinctrl: Enable device link creation for pin control
>> c6045b4e3cad pinctrl: stmfx: enable links creations
>> 489b64d66325 pinctrl: stm32: Add links to consumers
>>
>> I am using STM32 as guinea pig for this, consider adding links also
>> from the Tegra pinctrl. I might simply make these pinctrl consumer
>> to producer links default because I think it makes a lot sense.
> IIUC, currently the plan is to resume pinctrl *after* GPIO for Tegra210 [=
1]. But this
> contradicts to what was traditionally done for older Tegras where pinctrl=
 was always
> resumed first and apparently it won't work well for the GPIO ranges as we=
ll. I think this
> and the other patchsets related to suspend-resume still need some more th=
ought.
>
> [1] https://patchwork.kernel.org/patch/11012077/

Park bit was introduced from Tegra210 onwards and during suspend/resume,=20
requirement of gpio restore prior to pinctrl restore is not required for=20
prior Tegra210.

Also currently pinctrl suspend/resume implementation for prior Tegra210=20
is not yet upstreamed but having gpio restore prior to pinmux during=20
suspend/resume should not cause any issue for prior tegra's as well as=20
gpio resume restores pins back to same gpio config as they were during=20
suspend entry.

