Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636487CF54
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 23:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbfGaVFv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 17:05:51 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:10225 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfGaVFv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 17:05:51 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d4202ae0002>; Wed, 31 Jul 2019 14:05:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 31 Jul 2019 14:05:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 31 Jul 2019 14:05:49 -0700
Received: from [10.110.102.167] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 21:05:48 +0000
Subject: Re: [PATCH v7 11/20] cpufreq: tegra124: Add suspend and resume
 support
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
 <1564532424-10449-12-git-send-email-skomatineni@nvidia.com>
 <98aae4b7-d95a-90ba-0d55-7512b3712f54@gmail.com>
 <505bbdc0-c48a-8583-3838-ec5c128f375f@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <99c76e3a-6f7b-ef9a-2fd7-03744da650c4@nvidia.com>
Date:   Wed, 31 Jul 2019 14:05:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <505bbdc0-c48a-8583-3838-ec5c128f375f@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564607150; bh=4ss5BdcQAOvitxtbxBPqIK9JEL2xO0nwN7rV6ddprU4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=M6YnSuUhW47djEmIyUpR2avcGF2cq37se9MZVvgDVA/FRCa2RNJgbkEixUa+xTtSx
         mfBpVJVioCM7QeHaDsiLTdNLPhzV0PFb8RdtqnpZgSwRVRgYfDJRtUShX4q9lZluSs
         T1DeZ+zvbIhDbBy+rtbfuo6TBUlMhpy/tRDOP/AYOd2m8qSNZdRBfLts3WaYOYNj+F
         /34RuaUsJa8y7Ig1z5quQLsL1fjTRHHvbSZgT66OY4CFDH0i02GnzXy+FVjYM3kRX0
         M9A9NhbrLiCKq1Asj3Cm6wrLsRJnFNexm06TRHwYRMeGy4U6ldUkxXn1cTyNw88UFU
         Y9ej8g/Hu7nMA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/31/19 4:14 AM, Dmitry Osipenko wrote:
> 31.07.2019 13:23, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 31.07.2019 3:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> This patch adds suspend and resume pm ops for cpufreq driver.
>>>
>>> PLLP is the safe clock source for CPU during system suspend and
>>> resume as PLLP rate is below the CPU Fmax at Vmin.
>>>
>>> CPUFreq driver suspend switches the CPU clock source to PLLP and
>>> disables the DFLL clock.
>>>
>>> During system resume, warmboot code powers up the CPU with PLLP
>>> clock source. So CPUFreq driver resume enabled DFLL clock and
>>> switches CPU back to DFLL clock source.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/cpufreq/tegra124-cpufreq.c | 60 +++++++++++++++++++++++++++++=
+++++++++
>>>   1 file changed, 60 insertions(+)
>>>
>>> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra=
124-cpufreq.c
>>> index 4f0c637b3b49..e979a3370988 100644
>>> --- a/drivers/cpufreq/tegra124-cpufreq.c
>>> +++ b/drivers/cpufreq/tegra124-cpufreq.c
>>> @@ -6,6 +6,7 @@
>>>   #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
>>>  =20
>>>   #include <linux/clk.h>
>>> +#include <linux/cpufreq.h>
>>>   #include <linux/err.h>
>>>   #include <linux/init.h>
>>>   #include <linux/kernel.h>
>>> @@ -128,8 +129,67 @@ static int tegra124_cpufreq_probe(struct platform_=
device *pdev)
>>>   	return ret;
>>>   }
>>>  =20
>>> +static int __maybe_unused tegra124_cpufreq_suspend(struct device *dev)
>>> +{
>>> +	struct tegra124_cpufreq_priv *priv =3D dev_get_drvdata(dev);
>>> +	int err;
>>> +
>>> +	/*
>>> +	 * PLLP rate 408Mhz is below the CPU Fmax at Vmin and is safe to
>>> +	 * use during suspend and resume. So, switch the CPU clock source
>>> +	 * to PLLP and disable DFLL.
>>> +	 */
>>> +	err =3D clk_set_parent(priv->cpu_clk, priv->pllp_clk);
>>> +	if (err < 0) {
>>> +		dev_err(dev, "failed to reparent to PLLP: %d\n", err);
>>> +		return err;
>>> +	}
>>> +
>>> +	/* disable DFLL clock */
>>> +	clk_disable_unprepare(priv->dfll_clk);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int __maybe_unused tegra124_cpufreq_resume(struct device *dev)
>>> +{
>>> +	struct tegra124_cpufreq_priv *priv =3D dev_get_drvdata(dev);
>>> +	int err;
>>> +
>>> +	/*
>>> +	 * Warmboot code powers up the CPU with PLLP clock source.
>>> +	 * Enable DFLL clock and switch CPU clock source back to DFLL.
>>> +	 */
>>> +	err =3D clk_prepare_enable(priv->dfll_clk);
>>> +	if (err < 0) {
>>> +		dev_err(dev, "failed to enable DFLL clock for CPU: %d\n", err);
>>> +		goto disable_cpufreq;
>>> +	}
>>> +
>>> +	err =3D clk_set_parent(priv->cpu_clk, priv->dfll_clk);
>>> +	if (err < 0) {
>>> +		dev_err(dev, "failed to reparent to DFLL clock: %d\n", err);
>>> +		goto disable_dfll;
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +disable_dfll:
>>> +	clk_disable_unprepare(priv->dfll_clk);
>>> +disable_cpufreq:
>>> +	disable_cpufreq();
>>> +
>>> +	return err;
>>> +}
>>> +
>>> +static const struct dev_pm_ops tegra124_cpufreq_pm_ops =3D {
>>> +	SET_SYSTEM_SLEEP_PM_OPS(tegra124_cpufreq_suspend,
>>> +				tegra124_cpufreq_resume)
>>> +};
>>> +
>>>   static struct platform_driver tegra124_cpufreq_platdrv =3D {
>>>   	.driver.name	=3D "cpufreq-tegra124",
>>> +	.driver.pm	=3D &tegra124_cpufreq_pm_ops,
>>>   	.probe		=3D tegra124_cpufreq_probe,
>>>   };
>>>  =20
>>>
>> Looks good,
>>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>
> BTW, you should also CC the CPUFreq maintainers because this patch can't
> be applied without theirs ACK.
MIssed them. Will resend v7 series with CPUFreq maintainers...
