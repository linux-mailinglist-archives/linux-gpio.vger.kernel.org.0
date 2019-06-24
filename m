Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE5B5199B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 19:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732493AbfFXReP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 13:34:15 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13975 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731032AbfFXReP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 13:34:15 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1109970001>; Mon, 24 Jun 2019 10:34:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 24 Jun 2019 10:34:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 24 Jun 2019 10:34:12 -0700
Received: from [10.110.103.70] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Jun
 2019 17:34:12 +0000
Subject: Re: [PATCH V4 02/18] pinctrl: tegra: add suspend and resume support
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
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-3-git-send-email-skomatineni@nvidia.com>
 <a03ce644-5efd-e721-fb06-16de097171bb@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <896de0f3-78b0-c5fc-9b74-fee442ab116c@nvidia.com>
Date:   Mon, 24 Jun 2019 10:34:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a03ce644-5efd-e721-fb06-16de097171bb@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561397655; bh=NzR/wiwTNPCcINgNHsCVZEHZMVxCY29TCrZerR9QRUg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=Q9j9IBGNeI+g8G/tmUEY8cIhD5DVdPRB7f001esMoAO0hpgulln/fBM2fT/wGSprP
         jLFHAh3j8tptctGrM4a2k8qQ++h/ufDa/gRbRAkmYrY5H9rYDmkH4F2sRu1g16klfp
         5vRfTbztrD3jqqKgpt/ehyDPASwzePTTOuvD2iD8jzeC+uPkY1oRwb6zRJo+EU4tsh
         Ig07euNsRugFmWu7ROXq/MZZGtKnna6Hijbfa52tDolPRrCIjSk6/04gMYsMclWN3A
         HRqYX+KxHTAHbiKHGuRJYPTH6IfH0bPsyQEqw9grqVEanPUw2mYqWrlt4Qm8sERjnM
         Uqor3FN4ST5TQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/24/19 2:46 AM, Dmitry Osipenko wrote:
> 24.06.2019 6:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>
>> During suspend, context of all pinctrl registers are stored and
>> on resume they are all restored to have all the pinmux and pad
>> configuration for normal operation.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/pinctrl/tegra/pinctrl-tegra.c    | 47 ++++++++++++++++++++++++=
++++++++
>>   drivers/pinctrl/tegra/pinctrl-tegra.h    |  4 +++
>>   drivers/pinctrl/tegra/pinctrl-tegra210.c |  6 ++++
>>   3 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/teg=
ra/pinctrl-tegra.c
>> index b03c465917b8..c0ba6fa63ad1 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>> @@ -631,6 +631,38 @@ static void tegra_pinctrl_clear_parked_bits(struct =
tegra_pmx *pmx)
>>   	}
>>   }
>>  =20
>> +int __maybe_unused tegra_pinctrl_suspend(struct device *dev)
> The "maybe_unused" attribute isn't needed for global functions because
> compiler always assumes that such functions are used somewhere outside.
Will fix this in V5
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
>> +int __maybe_unused tegra_pinctrl_resume(struct device *dev)
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
>>   static bool gpio_node_has_range(const char *compatible)
>>   {
>>   	struct device_node *np;
>> @@ -655,6 +687,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev=
,
>>   	int i;
>>   	const char **group_pins;
>>   	int fn, gn, gfn;
>> +	unsigned long backup_regs_size =3D 0;
>>  =20
>>   	pmx =3D devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
>>   	if (!pmx)
>> @@ -707,6 +740,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev=
,
>>   		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
>>   		if (!res)
>>   			break;
>> +		backup_regs_size +=3D resource_size(res);
>>   	}
>>   	pmx->nbanks =3D i;
>>  =20
>> @@ -715,11 +749,24 @@ int tegra_pinctrl_probe(struct platform_device *pd=
ev,
>>   	if (!pmx->regs)
>>   		return -ENOMEM;
>>  =20
>> +	pmx->reg_bank_size =3D devm_kcalloc(&pdev->dev, pmx->nbanks,
>> +					  sizeof(*pmx->reg_bank_size),
>> +					  GFP_KERNEL);
>> +	if (!pmx->reg_bank_size)
>> +		return -ENOMEM;
>> +
>> +	pmx->backup_regs =3D devm_kzalloc(&pdev->dev, backup_regs_size,
>> +					GFP_KERNEL);
>> +	if (!pmx->backup_regs)
>> +		return -ENOMEM;
>> +
>>   	for (i =3D 0; i < pmx->nbanks; i++) {
>>   		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
>>   		pmx->regs[i] =3D devm_ioremap_resource(&pdev->dev, res);
>>   		if (IS_ERR(pmx->regs[i]))
>>   			return PTR_ERR(pmx->regs[i]);
>> +
>> +		pmx->reg_bank_size[i] =3D resource_size(res);
>>   	}
>>  =20
>>   	pmx->pctl =3D devm_pinctrl_register(&pdev->dev, &tegra_pinctrl_desc, =
pmx);
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/teg=
ra/pinctrl-tegra.h
>> index 32642af3f871..65fcbf8c7579 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
>> @@ -17,6 +17,8 @@ struct tegra_pmx {
>>  =20
>>   	int nbanks;
>>   	void __iomem **regs;
>> +	size_t *reg_bank_size;
>> +	u32 *backup_regs;
>>   };
>>  =20
>>   enum tegra_pinconf_param {
>> @@ -195,4 +197,6 @@ struct tegra_pinctrl_soc_data {
>>  =20
>>   int tegra_pinctrl_probe(struct platform_device *pdev,
>>   			const struct tegra_pinctrl_soc_data *soc_data);
>> +int __maybe_unused tegra_pinctrl_suspend(struct device *dev);
>> +int __maybe_unused tegra_pinctrl_resume(struct device *dev);
>>   #endif
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/=
tegra/pinctrl-tegra210.c
>> index 617ad963f5ad..4616bbc2efba 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
>> @@ -1562,6 +1562,11 @@ static int tegra210_pinctrl_probe(struct platform=
_device *pdev)
>>   	return tegra_pinctrl_probe(pdev, &tegra210_pinctrl);
>>   }
>>  =20
>> +static const struct dev_pm_ops tegra_pinctrl_pm =3D {
>> +	.suspend =3D &tegra_pinctrl_suspend,
>> +	.resume =3D &tegra_pinctrl_resume
>> +};
> What about to move tegra_pinctrl_pm out into pinctrl-tegra.c to make it
> common for all of the drivers?
OK, Will do that in V5
