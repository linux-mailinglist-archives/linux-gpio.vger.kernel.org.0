Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D24FA5A755
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 01:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfF1XBd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 19:01:33 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6500 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfF1XBd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 19:01:33 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d169c4e0002>; Fri, 28 Jun 2019 16:01:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 28 Jun 2019 16:01:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 28 Jun 2019 16:01:32 -0700
Received: from [10.2.170.163] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 23:01:28 +0000
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
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
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
 <0409f478-e425-4e7f-5fff-8c3a94f47ee8@gmail.com>
 <ca8199af-43db-c878-a93f-66c275acf864@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <99403cb1-aaef-4dd4-68a0-67864ca7ce6c@nvidia.com>
Date:   Fri, 28 Jun 2019 16:00:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <ca8199af-43db-c878-a93f-66c275acf864@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561762895; bh=aZPjidkvt159Y1MlR25AZKLnSpkr1g2vQ76FONNdB1Q=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=TngsqlhbXI3lxjG0tIi7SiikP3nxfWP/IXevXHZU1hy4iGjkbLN9oHiHb9MRjlCi0
         u6U5nmerqTk5xHMj1PrOJfpyJi/nT9Oto8lvPQknQG3LiDc8audlyubqw9fv+PrayF
         JjZmAPKr7Rm7GtJsyqsad+nkhthHl7ahX1jPRJw57v6Hi4/3QtAQ0liR/zQs5ST7QZ
         yevuS/YS57bBnQ0/ubmFTaLxBe39ziLd3TVUK0y/L8AqSHOszp76x+1aZ/qSmFt+Ni
         VdoXyxwQlh3BNZijdmZucTKHRabf7WM52MZw9xMpYhEelcNDjFYrdTSfCYPyrxzcTY
         FF4tFxdRwy/hA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/28/19 5:05 AM, Dmitry Osipenko wrote:
> 28.06.2019 14:56, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 28.06.2019 5:12, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>>
>>> During suspend, context of all pinctrl registers are stored and
>>> on resume they are all restored to have all the pinmux and pad
>>> configuration for normal operation.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   int tegra_pinctrl_probe(struct platform_device *pdev,
>>>   			const struct tegra_pinctrl_soc_data *soc_data);
>>>   #endif
>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl=
/tegra/pinctrl-tegra210.c
>>> index 0b56ad5c9c1c..edd3f4606cdb 100644
>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
>>> @@ -1571,6 +1571,7 @@ static struct platform_driver tegra210_pinctrl_dr=
iver =3D {
>>>   	.driver =3D {
>>>   		.name =3D "tegra210-pinctrl",
>>>   		.of_match_table =3D tegra210_pinctrl_of_match,
>>> +		.pm =3D &tegra_pinctrl_pm,
>>>   	},
>>>   	.probe =3D tegra210_pinctrl_probe,
>>>   };
>>>
>> Could you please address my comments in the next revision if there will =
be one?
>>
> Also, what about adding ".pm' for other Tegras? I'm sure Jon could test t=
hem for you.

This series is for Tegra210 SC7 entry/exit along with clocks and pinctrl=20
suspend resume needed for Tegra210 basic sc7 entry and exit.

This includes pinctrl, pmc changes, clock-tegra210 driver changes all=20
w.r.t Tegra210 platforms specific.

Suspend/resume support for other Tegras will be in separate patch series.


thanks

Sowjanya

