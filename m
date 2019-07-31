Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE4A67CF5F
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 23:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729861AbfGaVIk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 17:08:40 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:10353 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfGaVIk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 17:08:40 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d4203570002>; Wed, 31 Jul 2019 14:08:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 31 Jul 2019 14:08:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 31 Jul 2019 14:08:39 -0700
Received: from [10.110.102.167] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 21:08:38 +0000
Subject: Re: [PATCH v7 16/20] arm64: tegra: Enable wake from deep sleep on RTC
 alarm
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-17-git-send-email-skomatineni@nvidia.com>
 <1233ad49-22eb-a90a-d7cf-5fe133ded177@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <d4709085-f705-2608-08a8-65b238ae8844@nvidia.com>
Date:   Wed, 31 Jul 2019 14:08:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1233ad49-22eb-a90a-d7cf-5fe133ded177@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564607319; bh=XlHpdHbtbxW+pGHBpUV41umA2n21IWFw4wGwv1QIPi0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=UenDJ17yUxeK7zkDG7Pkq2W+yM57LLyemW5S81Fdy6R8p1oyT8DorQkbzRjPJ+VA3
         kKqSdsHynICnxC9SZFU/RdKJ2+k1jt6h9n6o5u6++a8qBAt/CREyG2MPWJk0bAb+tI
         VYK9AhlG1WWjcSqm4R3MwvZIsZujMkJ4GJJoGq6AMxb6KJQtBge9+wtn3i4PVVIIf7
         EqsGODGKqpsIEQ/Z7xC6x5E5eN1ityGNdtlNxIUJlXtGBRfyUvYDs5pHAKB9FdtD/o
         nZToRjbS8WQjxumSeWJ6w2iiWEO2vv/bggrSyR1n3KmP9s3+e3F6kcOvS4BcyNWrd9
         ub4d3Q9hL4vAg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/31/19 4:04 AM, Dmitry Osipenko wrote:
> 31.07.2019 3:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch updates device tree for RTC and PMC to allow system wake
>> from deep sleep on RTC alarm.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/=
dts/nvidia/tegra210.dtsi
>> index 659753118e96..30a7c48385a2 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> @@ -768,7 +768,8 @@
>>   	rtc@7000e000 {
>>   		compatible =3D "nvidia,tegra210-rtc", "nvidia,tegra20-rtc";
>>   		reg =3D <0x0 0x7000e000 0x0 0x100>;
>> -		interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupts =3D <16 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-parent =3D <&pmc>;
>>   		clocks =3D <&tegra_car TEGRA210_CLK_RTC>;
>>   		clock-names =3D "rtc";
>>   	};
>> @@ -778,6 +779,8 @@
>>   		reg =3D <0x0 0x7000e400 0x0 0x400>;
>>   		clocks =3D <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
>>   		clock-names =3D "pclk", "clk32k_in";
>> +		#interrupt-cells =3D <2>;
>> +		interrupt-controller;
>>  =20
>>   		powergates {
>>   			pd_audio: aud {
>>
> Is this a backwards-compatible change? Or it's not really worth to care
> about the compatibility with older kernel versions, I'm not sure about
> overall state of T210 in the upstream kernel.
I don't think its required to be backwards-compatible as SC7 entry/exit=20
implementation for T210 is with this patch series onwards..
