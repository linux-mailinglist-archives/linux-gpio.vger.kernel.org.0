Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7FB6D4B5
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 21:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391074AbfGRTY6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 15:24:58 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:19996 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfGRTY6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 15:24:58 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d30c7870000>; Thu, 18 Jul 2019 12:24:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 18 Jul 2019 12:24:56 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 18 Jul 2019 12:24:56 -0700
Received: from [10.110.103.56] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jul
 2019 19:24:55 +0000
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     Joseph Lo <josephl@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pgaikwad@nvidia.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190716083701.225f0fd9@dimatab>
 <21266e4f-16b1-4c87-067a-16c07c803b6e@nvidia.com>
 <c5853e1a-d812-2dbd-3bec-0a9b0b0f6f3e@nvidia.com>
 <20190716080610.GE12715@pdeschrijver-desktop.Nvidia.com>
 <d908d3a2-3013-7f92-0852-115f428d1c5f@gmail.com>
 <72b5df8c-8acb-d0d0-ebcf-b406e8404973@nvidia.com>
 <2b701832-5548-7c83-7c17-05cc2f1470c8@nvidia.com>
 <76e341be-6f38-2bc1-048e-1aa6883f9b88@gmail.com>
 <0706576a-ce61-1cf3-bed1-05f54a1e2489@nvidia.com>
 <5b2945c5-fcb2-2ac0-2bf2-df869dc9c713@gmail.com>
 <20190718191820.GG12715@pdeschrijver-desktop.Nvidia.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <2274fccb-59d3-824c-cb97-55c23a4eaa75@nvidia.com>
Date:   Thu, 18 Jul 2019 12:24:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190718191820.GG12715@pdeschrijver-desktop.Nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563477895; bh=QNGvJWOKd17q3hkWjlMUnLhnXwrfiVTE5oXpYZzb6j4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=e3GwJvbeSaAl32z4z2Ko/Vjr5lHjeVhbjrpuM04TICuDizbrhGPT3LHHwyX3Hf8Al
         f8vvMT2BSPkRmaRuif+RBSQMMxHsrfAO99III/AbZfW28qUsTGd9wFDyHHfmQ5TPsR
         Be3ugaNxtrphgYd/wuEW3UY1/0e8Eta3nSvsPPTFuhLZNvYx36LtUF2+T101IoC5d8
         o42tFXDoV6m6l6yKqEHtKS3sUq3BH+Cm3EYF/Cgrk4cUZoG3oAJUp4xE1J1Isf8qeh
         4BwzJuaGpmOa4cFh8Pg8iJFAiuM0kNe9s75JrHVJ+UzhhNJmKh1L11O9X/wPS0P1Ms
         4nqCEexUX+4Jg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/18/19 12:18 PM, Peter De Schrijver wrote:
> On Tue, Jul 16, 2019 at 09:43:16PM +0300, Dmitry Osipenko wrote:
>>> CPU parents are PLL_X, PLL_P, and dfll. PLL_X always runs at higher rate
>>> so switching to PLL_P during CPUFreq probe prior to dfll clock enable
>>> should be safe.
>> AFAIK, PLLX could run at ~200MHz. There is also a divided output of PLLP
>> which CCLKG supports, the PLLP_OUT4.
>>
>> Probably, realistically, CPU is always running off a fast PLLX during
>> boot, but I'm wondering what may happen on KEXEC. I guess ideally
>> CPUFreq driver should also have a 'shutdown' callback to teardown DFLL
>> on a reboot, but likely that there are other clock-related problems as
>> well that may break KEXEC and thus it is not very important at the moment.
>>
> If you turn off the DFLL, you have to be aware that the voltage margins
> for DFLL use are lower than for PLL use. So you either need to be sure
> to switch to a frequency below fmax @ Vmin or you program the boot
> voltage and then you can use PLLX as setup by the bootloader. For OVR
> regulators you can't program a voltage without the DFLL, so you have to
> tristate the PWM output which will give you a hardwired boot voltage.
>
> Peter.

Yes, we switch CPU to PLLP and then disable DFLL during suspend.


