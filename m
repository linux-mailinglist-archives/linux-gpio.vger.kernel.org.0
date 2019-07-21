Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74C076F686
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 00:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbfGUWry (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 18:47:54 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12234 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfGUWrx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 18:47:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d34eb950004>; Sun, 21 Jul 2019 15:47:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 21 Jul 2019 15:47:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 21 Jul 2019 15:47:51 -0700
Received: from [10.2.164.85] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 22:47:49 +0000
Subject: Re: [PATCH V6 02/21] pinctrl: tegra: Add suspend and resume support
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-3-git-send-email-skomatineni@nvidia.com>
 <d837e4e0-947b-2b90-c680-ab913e70e587@gmail.com>
 <9c844d55-0bc0-471c-6c49-1febe799ebf2@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <ec373422-c1e0-6159-4f2d-4ced87bbb80e@nvidia.com>
Date:   Sun, 21 Jul 2019 15:48:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9c844d55-0bc0-471c-6c49-1febe799ebf2@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563749269; bh=uqhSXAGW16REJPbwODlXkGUNJ5zcz9X4UrKZdW2pPnM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=dkNlNG3HCVsG8MtfIHEusG2QYIc8Z8kJsFTOaWsV2XkQxgSXb32h7/wFGY+lmS7mE
         CB3VWB+/neDZ/aymm4doc6/bxuP39k3piNvmbESoDGHH4pyR/yUuzsVm31mfYRx2fG
         E0qM9coWW+brykJ6zFgxYQxtleLSuoCQEAzbESkLzqQPFkr3FIIucaxi/dOSQoKfb8
         W58Hvx0EPmd/gkQc3yfewpAxdFQzhu8GNng6rbNHDOTVlW9nYzf/pZfApaNBP0FtzD
         tHDq1ch+mJf0tDqRpsDkqN9gKUptyZjugXOX71Dia2g+jwbr6HRx0QjPaNR7ntqzFt
         aWFjIRm5uMV9Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/21/19 3:09 PM, Dmitry Osipenko wrote:
> 22.07.2019 1:03, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>>
>>> During suspend, context of all pinctrl registers are stored and
>>> on resume they are all restored to have all the pinmux and pad
>>> configuration for normal operation.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/pinctrl/tegra/pinctrl-tegra.c | 59 ++++++++++++++++++++++++++=
+++++++++
>>>   drivers/pinctrl/tegra/pinctrl-tegra.h |  3 ++
>>>   2 files changed, 62 insertions(+)
>>>
>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/te=
gra/pinctrl-tegra.c
>>> index 186ef98e7b2b..e3a237534281 100644
>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>> @@ -631,6 +631,58 @@ static void tegra_pinctrl_clear_parked_bits(struct=
 tegra_pmx *pmx)
>>>   	}
>>>   }
>>>  =20
>>> +static size_t tegra_pinctrl_get_bank_size(struct device *dev,
>>> +					  unsigned int bank_id)
>>> +{
>>> +	struct platform_device *pdev =3D to_platform_device(dev);
>>> +	struct resource *res;
>>> +
>>> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, bank_id);
>>> +
>>> +	return resource_size(res) / 4;
>>> +}
>>> +
>>> +static int tegra_pinctrl_suspend(struct device *dev)
>>> +{
>>> +	struct tegra_pmx *pmx =3D dev_get_drvdata(dev);
>>> +	u32 *backup_regs =3D pmx->backup_regs;
>>> +	u32 *regs;
>>> +	size_t bank_size;
>>> +	unsigned int i, k;
>>> +
>>> +	for (i =3D 0; i < pmx->nbanks; i++) {
>>> +		bank_size =3D tegra_pinctrl_get_bank_size(dev, i);
>>> +		regs =3D pmx->regs[i];
>>> +		for (k =3D 0; k < bank_size; k++)
>>> +			*backup_regs++ =3D readl_relaxed(regs++);
>>> +	}
>>> +
>>> +	return pinctrl_force_sleep(pmx->pctl);
>>> +}
>>> +
>>> +static int tegra_pinctrl_resume(struct device *dev)
>>> +{
>>> +	struct tegra_pmx *pmx =3D dev_get_drvdata(dev);
>>> +	u32 *backup_regs =3D pmx->backup_regs;
>>> +	u32 *regs;
>>> +	size_t bank_size;
>>> +	unsigned int i, k;
>>> +
>>> +	for (i =3D 0; i < pmx->nbanks; i++) {
>>> +		bank_size =3D tegra_pinctrl_get_bank_size(dev, i);
>>> +		regs =3D pmx->regs[i];
>>> +		for (k =3D 0; k < bank_size; k++)
>>> +			writel_relaxed(*backup_regs++, regs++);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +const struct dev_pm_ops tegra_pinctrl_pm =3D {
>>> +	.suspend =3D &tegra_pinctrl_suspend,
>>> +	.resume =3D &tegra_pinctrl_resume
>>> +};
>>> +
>>>   static bool gpio_node_has_range(const char *compatible)
>>>   {
>>>   	struct device_node *np;
>>> @@ -655,6 +707,7 @@ int tegra_pinctrl_probe(struct platform_device *pde=
v,
>>>   	int i;
>>>   	const char **group_pins;
>>>   	int fn, gn, gfn;
>>> +	unsigned long backup_regs_size =3D 0;
>>>  =20
>>>   	pmx =3D devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
>>>   	if (!pmx)
>>> @@ -707,6 +760,7 @@ int tegra_pinctrl_probe(struct platform_device *pde=
v,
>>>   		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
>>>   		if (!res)
>>>   			break;
>>> +		backup_regs_size +=3D resource_size(res);
>>>   	}
>>>   	pmx->nbanks =3D i;
>>>  =20
>>> @@ -715,6 +769,11 @@ int tegra_pinctrl_probe(struct platform_device *pd=
ev,
>>>   	if (!pmx->regs)
>>>   		return -ENOMEM;
>>>  =20
>>> +	pmx->backup_regs =3D devm_kzalloc(&pdev->dev, backup_regs_size,
>>> +					GFP_KERNEL);
>>> +	if (!pmx->backup_regs)
>>> +		return -ENOMEM;
>>> +
>>>   	for (i =3D 0; i < pmx->nbanks; i++) {
>>>   		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
>>>   		pmx->regs[i] =3D devm_ioremap_resource(&pdev->dev, res);
>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/te=
gra/pinctrl-tegra.h
>>> index 105309774079..0fc82eea9cf1 100644
>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
>>> @@ -17,6 +17,7 @@ struct tegra_pmx {
>>>  =20
>>>   	int nbanks;
>>>   	void __iomem **regs;
>>> +	u32 *backup_regs;
>>>   };
>>>  =20
>>>   enum tegra_pinconf_param {
>>> @@ -193,6 +194,8 @@ struct tegra_pinctrl_soc_data {
>>>   	bool drvtype_in_mux;
>>>   };
>>>  =20
>>> +extern const struct dev_pm_ops tegra_pinctrl_pm;
>>> +
>>>   int tegra_pinctrl_probe(struct platform_device *pdev,
>>>   			const struct tegra_pinctrl_soc_data *soc_data);
>>>   #endif
>>>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>
> BTW, you should remove Thierry's ACK from all patches that were modified
> if he didn't re-ACK the new version.
>
> Also, it looks to me that you're manually adding versioning to the
> patches because git usually uses lowercase for 'v'. You could use "git
> format-patch -v6 ..".


ok, Reg. version I am using git format-patch --subject-prefix=3D'PATCH V6'

will change to lower case v

