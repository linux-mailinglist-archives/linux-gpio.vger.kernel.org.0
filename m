Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8B3456EB3
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 18:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbfFZQ2e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 12:28:34 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9428 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfFZQ2e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 12:28:34 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d139d300001>; Wed, 26 Jun 2019 09:28:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 26 Jun 2019 09:28:33 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 26 Jun 2019 09:28:33 -0700
Received: from [10.2.169.244] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Jun
 2019 16:28:30 +0000
Subject: Re: [PATCH V4 18/18] arm64: dts: tegra210-p2180: Jetson TX1 SC7
 timings
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pdeschrijver@nvidia.com>,
        <pgaikwad@nvidia.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <digetx@gmail.com>, <devicetree@vger.kernel.org>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-19-git-send-email-skomatineni@nvidia.com>
 <20190626102824.GG6362@ulmo>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <908eb03e-3b08-4e48-e64e-56cf6e66b5f2@nvidia.com>
Date:   Wed, 26 Jun 2019 09:28:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190626102824.GG6362@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561566512; bh=Ks04MbI5FEcRhxVamqMYukNzlx6rUh4PyXjSXplcqd0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=P+xba7G+GO7cWamMT0lspBGjwvv0pgmp2SHgytizdpSEqDOzAWu61q6v0NXCzmVHT
         X/5nXTxuRtQuGjsPwjeJ4LjhdcyIW2ys7lqW9RDlUn99FT5G1ns/aNC9ck4t6dV6Au
         8hN4CAUwjrQBTeApYwJkOH7A+ockMVjtQpsLIZwW8ime17v2ZArOMi7NF/BA6338KR
         O7A6+ehbY9Pi3N70YBbL1Pvnvthz0q7Cw7UX5udfuEP8LrQEeltiRIIf1k6mjv7M/M
         pRLXThbXwSOXLvt/21RDtUuVibndQqRfBQ33PDxU/oAiXOk/wZNsoE90fyYszaBMTI
         bObroxuPNW1wQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/26/19 3:28 AM, Thierry Reding wrote:
> On Sun, Jun 23, 2019 at 08:02:59PM -0700, Sowjanya Komatineni wrote:
>> This patch has Jetson TX1 platform specific SC7 timing configuration
>> in device tree.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
> Can you provide a similar patch for Jetson Nano (p3450-0000)? It'd be
> great if we can make new features like this available across all boards.
>
> Thierry
>
Will add patch for Nano in V5...
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
>> index 27723829d033..cb58f79deb48 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
>> @@ -279,6 +279,13 @@
>>   
>>   	pmc@7000e400 {
>>   		nvidia,invert-interrupt;
>> +		nvidia,suspend-mode = <0>;
>> +		nvidia,cpu-pwr-good-time = <0>;
>> +		nvidia,cpu-pwr-off-time = <0>;
>> +		nvidia,core-pwr-good-time = <4587 3876>;
>> +		nvidia,core-pwr-off-time = <39065>;
>> +		nvidia,core-power-req-active-high;
>> +		nvidia,sys-clock-req-active-high;
>>   	};
>>   
>>   	/* eMMC */
>> -- 
>> 2.7.4
>>
