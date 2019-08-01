Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCFC7E180
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 19:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387912AbfHAR4K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 13:56:10 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15554 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727508AbfHAR4K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 13:56:10 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d4327c10006>; Thu, 01 Aug 2019 10:56:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 01 Aug 2019 10:56:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 01 Aug 2019 10:56:08 -0700
Received: from [10.110.103.107] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Aug
 2019 17:56:08 +0000
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
 <d4709085-f705-2608-08a8-65b238ae8844@nvidia.com>
 <4f8b9ee7-5402-6463-d6d2-7b00e274a185@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <1e2e6282-9d94-e322-c4ba-8a1f3b902860@nvidia.com>
Date:   Thu, 1 Aug 2019 10:56:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4f8b9ee7-5402-6463-d6d2-7b00e274a185@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564682177; bh=/Kr2pcx6vn1qS0Jigkctrs95b9IuEFAYE1YBU+q2XCg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=K9AGRONnigxKygMWocLYmOZXrX3wIFO0HdwQ3/k48eW2psz9ZuREUdtb63831xuRk
         GWKdweaw2ejdMgRpWhn/XB507/55eW3gi21NjZVxGDOLpte/eoyxFRWWcJfQRLKlCj
         cOnxrzz7VPOK2AvwxTGoj3e9I8lIQuufjkGwvzrvdRlV1U8CTfqCYyQH5tX1EDNspT
         GZyxDR3zHfL7qInPbxY4Ji1q8LNxHkk1LkqvYzn1ED3w9vqQMlkCLUvM0/mIoHtDCJ
         QeEwrVZYvVll4HaEHlCwRubIRkWv4s9cjhAsjtE0fILErvPqpcbemX3emnQheJsHMp
         xB3N9XYXicy2A==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/1/19 3:43 AM, Dmitry Osipenko wrote:
> 01.08.2019 0:08, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/31/19 4:04 AM, Dmitry Osipenko wrote:
>>> 31.07.2019 3:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> This patch updates device tree for RTC and PMC to allow system wake
>>>> from deep sleep on RTC alarm.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>  =C2=A0 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 ++++-
>>>>  =C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>> b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>> index 659753118e96..30a7c48385a2 100644
>>>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>>>> @@ -768,7 +768,8 @@
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rtc@7000e000 {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D=
 "nvidia,tegra210-rtc", "nvidia,tegra20-rtc";
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x0 0=
x7000e000 0x0 0x100>;
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <GIC_SPI 2 =
IRQ_TYPE_LEVEL_HIGH>;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <16 IRQ_TYP=
E_LEVEL_HIGH>;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-parent =3D <&pmc=
>;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&t=
egra_car TEGRA210_CLK_RTC>;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names =
=3D "rtc";
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>> @@ -778,6 +779,8 @@
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x0 0=
x7000e400 0x0 0x400>;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&t=
egra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names =
=3D "pclk", "clk32k_in";
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #interrupt-cells =3D <2>;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-controller;
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 powerga=
tes {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pd_audio: aud {
>>>>
>>> Is this a backwards-compatible change? Or it's not really worth to care
>>> about the compatibility with older kernel versions, I'm not sure about
>>> overall state of T210 in the upstream kernel.
>> I don't think its required to be backwards-compatible as SC7 entry/exit
>> implementation for T210 is with this patch series onwards..
> The new device tree binary should work with older kernel versions, AFAIK
> this is the upstream rule. But if kernel support isn't in a very good
> shape and not much people are using it, then obviously it is not very
> important.

Yes, my response to backwards-compatible was with respect to interrupt=20
parent change as this will not be backward compatible and also there is=20
no Tegra210 suspend/resume earlier. Other functionality wise, it is=20
backward compatible.


