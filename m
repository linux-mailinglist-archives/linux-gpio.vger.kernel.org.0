Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4296789E
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2019 07:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbfGMFsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Jul 2019 01:48:33 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7981 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbfGMFsd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Jul 2019 01:48:33 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d2970b40002>; Fri, 12 Jul 2019 22:48:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 12 Jul 2019 22:48:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 12 Jul 2019 22:48:30 -0700
Received: from [10.2.168.186] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 13 Jul
 2019 05:48:29 +0000
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
 <a262cbb3-845c-3ad1-16cc-375a24b9f7e9@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <a4d02a2c-9ac3-57cd-4fbd-f47fabbc765f@nvidia.com>
Date:   Fri, 12 Jul 2019 22:48:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <a262cbb3-845c-3ad1-16cc-375a24b9f7e9@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562996916; bh=V5YSXRCDqJE1Lp26gLju5B4zeiq8tooctY2ofUX9yHk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=lh0EZF/EXutxhJHjbOnyiFdZQVa3y+6Hmv6X30h/cLCkgQvxYLkDoxZhcS8Xo7Wcg
         mZWe0bR93O7MxjKIrD4Ti3I4L0G7SYW4LuWfrdOR9ua5JaJBowk+TURP6hHZ8Pxxp3
         J413BHjoDl2u5Jghi/X05Gtg5f3KBhOC+rCYTs234Cqob53Gt5F20gmOIU9ZAJD+uG
         4lYsOV8hHtkPNqw+ILqf0EXg6hRFah/Z/ZswQEeI5bZE7nKa8Doi8S3t8LUTjONMxl
         84FCiO+IH5IPQUVeQD4FNo01eLumxzNZOEwXZS4mlfd8iopt5GKN00mNwwMfb6RZeG
         KpXF1CUL0ay6g==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/29/19 8:46 AM, Dmitry Osipenko wrote:
> 28.06.2019 5:12, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>
>> During suspend, context of all pinctrl registers are stored and
>> on resume they are all restored to have all the pinmux and pad
>> configuration for normal operation.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/pinctrl/tegra/pinctrl-tegra.c    | 52 ++++++++++++++++++++++++=
++++++++
>>   drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
>>   drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
>>   3 files changed, 56 insertions(+)
>>
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/teg=
ra/pinctrl-tegra.c
>> index 34596b246578..e7c0a1011cba 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>> @@ -621,6 +621,43 @@ static void tegra_pinctrl_clear_parked_bits(struct =
tegra_pmx *pmx)
>>   	}
>>   }
>>  =20
>> +static int tegra_pinctrl_suspend(struct device *dev)
>> +{
>> +	struct tegra_pmx *pmx =3D dev_get_drvdata(dev);
>> +	u32 *backup_regs =3D pmx->backup_regs;
>> +	u32 *regs;
>> +	unsigned int i, j;
>> +
>> +	for (i =3D 0; i < pmx->nbanks; i++) {
>> +		regs =3D pmx->regs[i];
>> +		for (j =3D 0; j < pmx->reg_bank_size[i] / 4; j++)
>> +			*backup_regs++ =3D readl(regs++);
>> +	}
>> +
>> +	return pinctrl_force_sleep(pmx->pctl);
>> +}
>> +
>> +static int tegra_pinctrl_resume(struct device *dev)
>> +{
>> +	struct tegra_pmx *pmx =3D dev_get_drvdata(dev);
>> +	u32 *backup_regs =3D pmx->backup_regs;
>> +	u32 *regs;
>> +	unsigned int i, j;
>> +
>> +	for (i =3D 0; i < pmx->nbanks; i++) {
>> +		regs =3D pmx->regs[i];
>> +		for (j =3D 0; j < pmx->reg_bank_size[i] / 4; j++)
>> +			writel(*backup_regs++, regs++);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +const struct dev_pm_ops tegra_pinctrl_pm =3D {
>> +	.suspend =3D &tegra_pinctrl_suspend,
>> +	.resume =3D &tegra_pinctrl_resume
>> +};
> Hm, so this are the generic platform-driver suspend-resume OPS here, whic=
h is very
> nice! But.. shouldn't pinctrl be resumed before the CLK driver (which is =
syscore_ops
> in this version of the series)? .. Given that "clock" function may need t=
o be
> selected for some of the pins.

selection of clock functions on some Tegra pins through corresponding=20
pinmux (like extperiph clks) can happen after clock driver resume as=20
well where clock source is restored to state during suspend before=20
selecting clock function on that pin.


