Return-Path: <linux-gpio+bounces-12276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EFC9B40B0
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 03:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 751EBB21A07
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 02:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDAF1F4265;
	Tue, 29 Oct 2024 02:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="O9CBycMW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2017.outbound.protection.outlook.com [40.92.103.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE474400;
	Tue, 29 Oct 2024 02:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730170763; cv=fail; b=b9DihDOVKQJJ/BosKFgzAzbJqauU0H2LhpSfqzUDbTuoTa5R9NMMaOCp01xve6CFFk1dIg71olAqngIAkjqRCEVo9ib/K9k4XiQKyiW97xAm7YFWeyJlPzR7Ms1qhej9ExbRmt/XTF7gkl5OeCg/Y61LbjScVDGgEC9LJ5h+ebk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730170763; c=relaxed/simple;
	bh=dZtjuTJJwo99kRqkCKTnVJ5+uwnyJOx+FY26B3Xc6dg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BbW7YgPR2s4p3s0/4jxgwWq+hvfR7+jTR7vlRBQXGrDtKBAVsOKHcZyaP73EGjKUBOfE9EP9hmqiB6UB3YAaU7AQ4bq0ZeS6T8GaO4iYDS6wwW5sCO8zmLZCN+AOHQIMdXWsgHw2SFvXqkkDO+gPdM3IQMPBrtUkNwQ5dNh7mwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=O9CBycMW; arc=fail smtp.client-ip=40.92.103.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzhjJ6H6+mXz1tH0UZKmp9iMz6Rm2DyzikTCSwEFyUgp77kn9l7l7mUwaPwHlVEPYlOG568ALS0kyMiEaBR8HkKz1Qp0sm/zf/eF0/Jbj0UEt/lb1TzMuN3QyJLlFZzmyePbvuhYmzqu+KPo+PmLfJxGg7u+NGtggGWMtpIKtcHjv+G2xBXEIC1Qej8IZ13tcYySXfZieq4J/4hUg/6zBoXJZggSxZ+z9NAhr0gXvP60BvoPDakwcAh7dGwb+YT1+m2upKBZM4bEnjE1Wl+NUdUcWoofi9YFPZ0irCJ4penfTT+TNI3nB0xTBwACikpY3569NUBV59Ioaj1pwMfQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=an1J5DiTF7T9b7qZ6T5zKT5e2CRSd7gk73Iij3C284Y=;
 b=gtC66MJ/uA55J+1EpWrS8QYs+SWRbU2oFPYomSXYFaVrUU/KNcb2+OJv3ruq+Caha5HTf39EYXMWTQKQwh3JKtNj6+fi8Vi3YigCLLIkn4lVQ45Tdns8xPgkyx+y3bJriRVJRjh9HKDAWZTHy8anHxgvlZ7hNAKQllpAtYZRZ5tijTkMC/mDD7l3MnXJCC6OZHkGZ3oSTRuWrbjPVYBJEhwf3oiXcL3UeDGuy1+OWyJeCzo8OpmX5jx/Xsz32TwVVzA/imq+MMY/QwXDVcl2OmYZ1bw6fF3SJo6EVn+4Z2/nOY1DfoVEGhswz70xOxoanFbOiqcKdQKAqGFclo5leA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=an1J5DiTF7T9b7qZ6T5zKT5e2CRSd7gk73Iij3C284Y=;
 b=O9CBycMW5Smyrej4I8rwRjRsOUyhLPM1Z5D8rF/+Ldgvv3Xkq5RyP+iFUDtAybzKSANGXFqhWqkxLtccv+TqKLHPOLOqdiMPpOV9IMJAnN5/Ii8e1Q6quaPzFPAvsM+PkGGIcr/jRpYZnyVEmAyw0hGnHFC0/3ARt6SrZ6/5fhCBAM6Y1QtQZAjgxarUfwFUp3GE1XXBItZqa4utai3GCqP0Edth5JfEdaA+arAUmWTX2tZXyclcfAdZw8XrNXb1QyKIwKOhU9GcvyQwZ0u49cmz4rrgfQRTM9LcOtuFIM7a+2xWqOICLjTrT2TQUtTMaRbFYVRf9TcHEsuAKRt4ww==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB1378.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:189::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 02:59:13 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 02:59:13 +0000
Message-ID:
 <MA0P287MB28228810469B6A46D26CAF51FE4B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 29 Oct 2024 10:59:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: sophgo: add support for SG2042 SoC
To: Inochi Amaoto <inochiama@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20241024064356.865055-1-inochiama@gmail.com>
 <20241024064356.865055-3-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20241024064356.865055-3-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::9) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <5157ee00-52ef-438f-a50f-22a746c04e45@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB1378:EE_
X-MS-Office365-Filtering-Correlation-Id: e539112b-0638-4e93-3bc9-08dcf7c5ab22
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|19110799003|15080799006|7092599003|6090799003|8060799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	kJQHdZcSPnwYWWG33iJ5mXt8Vp+sluj7gcIkxq0eSKlHe2ordQCUN/ro/fSUbrV/9176xs0xRPY8owe6K6ayLLvdIKolXLuulBLordrthploN0PgZTMFYg4FjdD7pFHDyMvfwpNSuDUE7LoevFWu6u+xAwXweWYUEFe1/aVWrCAPOlJk20X+XgUa8dI40q5dBNTPA5FtAHB2+bpMPyWNiqOGyZ9NzTdk44E1BmhZdj4zIMcEAg5oQpgmrui34A+7pGaBwLW/vTkUSGcevNHkEAaoNOOhWjg3bxboxsEXVMILaYng4XZTyXlALS/cBcjl/SqVAp+obHH05QGV3XQN8sVqZxjiux/5vOgvp7QvWqQ+B81mmuKUNLxvgqCMTc9zKBVAuNN6U7A9YpMG/LutFmqOWfuQmcfxqmklWspuVoTGk1Je2hXRIgqd8vnfPcc684rPpbLLAXQiY5g3pTf01CzA/Dkt8hHmZreG3or1KOy4oY9pJYxkO+hwb+NxHWmE06c91/KtLP5rjzqK+hHpj/EBALNYUrh2gZZXjmW5WUxn4nrfWTtLlfxFDKX8K0oo3K/VHNg+3RUj05hhlWuuKoe/RWSTjRFPes3lQAGtA7aLdiKHXhPPhEi2iuORMBmxzDDgsfwInpeJnt1pEZoqck9ZVlz2NZ+6535w7sFp19uUUWd6x7YPZoFw3EBOIPrRAvpk3r9yTcl/wjJbmgOaANHSYYaisP9P5Unms2BZ/HnmA5KZyNgAm/Y2sC2bJ+p7k+79ium7+5fw9ATBO1Stlg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2VXUXVyaVpHb2NnckNsblBaNlFoYTZ2UmJBSDB6ckhKbnJVemo5U1lHSFN2?=
 =?utf-8?B?T3czUmtvNmJnUEJBYUdqZ3lrVWlPZjcvUjlkWnE1MmY0Sld6UFlMYThNVzdE?=
 =?utf-8?B?S2pEZ2lnWjAvZHJrYnNvOUdnNWdUbjBpaW5wKytETkJLZnl3RFVlUklQZEVn?=
 =?utf-8?B?Sm9tNXRzTEpvelJESkJzZStMNUY5eWl5UDI3RFR5VlhheWx5OENsRDhYVHVo?=
 =?utf-8?B?WVlLbytLWEkvS3ZYcFF1UGYvVXA5MFR5TDJpS012aUhnYmx0Z0NYRVg0S3k3?=
 =?utf-8?B?aEZnazBGR3JmQzlMTW40czg5QU5TZzk4VVFWdE5aQm9BOUZqZkVESjVUSDFr?=
 =?utf-8?B?aW11cUJmVEkxeWo1WlRIOWt2OWRIaGFYUzY0K3lGQmxsZWs4Tmt4ZEp3WGxR?=
 =?utf-8?B?Q001dERaT0crZnRURUlaWXI3RHdMdlpmd0xtNEwrZFpMV21NZmdITHVNRThP?=
 =?utf-8?B?U1VLSUNxaWtTVTl3TWVGdzNVMW1KZ2hIY3RYOFRHTkRESnVDaEw0aWU1T21M?=
 =?utf-8?B?R3k0WFRtNVRxVGEwMTNjODhwYU40bkRLQXFLK3NyOVl5SGYvV0tyZjNTam9T?=
 =?utf-8?B?ZjNaaXdzdGtqS3NpemphejRLUVE1YTQ1NGhNYVJMV29XK0lGcWxHb1VMWmxH?=
 =?utf-8?B?eVRqeUZFTFNDWWRmdGdWekFaQlVGMisvbGh4YlV4QWhKMGk0UjkyZDV3dmdm?=
 =?utf-8?B?c2FRamxPQW9ZbTBhRUQzdDJRWnBOWEZZc2VrQ21LbUZLcmJBZXZ4NFlBdzZW?=
 =?utf-8?B?RE1LaE5XOUR5KzdnZWMrWlNNbTFaSE9VVGUrRlplcUpKRitUTzUvMVdTWmYr?=
 =?utf-8?B?ZTI0RTVCUzdwTmYxMGhSU1F3OEZvRFFjOGNJV1FHMUZtcWlvZmwwSVQyY2xz?=
 =?utf-8?B?RHdHL01xRnVrcTZxVi9tU0FZazVYZDFmV3FaVHNzcDVCby9ndlVZd0JMQlB5?=
 =?utf-8?B?N0NlT01LZzFzWGFXL04zMnVYWTJoQWpxMWdYRHpQdzgxeEQ4bWx1aUV6OVpF?=
 =?utf-8?B?NmhjMzJwbmJLdHR6Z1ByMmN4NS83MXRZeVRJVGRNOEJhQmhhVE9mZVVubkQy?=
 =?utf-8?B?MDd5eTY0dGl4KzhuU21qbHFmN3VXNW1pNVZCMTY1bU9tSUlRL1R4dUVvTjl1?=
 =?utf-8?B?QThsaGE2VTVNaEtZRnFLSWNEaEdjM040dmZRQ3hMUDBRb2lXaHVwQVlFZmpl?=
 =?utf-8?B?aGtvNm5DMDF5aVNPejlkcGFYcUVOQno5ZitFckxTNE51WUR6TFdYb0o4aVZV?=
 =?utf-8?B?RncrYmhMaDZMTzA0Tm1hZ0ZkK3lXazh3dDZrUjFJbmNwRXdxOG01N1g5dElp?=
 =?utf-8?B?SDlKZkxRcUF5TFBaTXU1RG4zODhyUFlxTWs1MjdsOVBuRmdNVnZSZ1pwVm45?=
 =?utf-8?B?RTY5R1IvM3hBN044N09VNW1icmp5ZG9wMTZMaC8vNXlxZkR2bFA2NFBqUG9j?=
 =?utf-8?B?bXdBb3Jralh5NkpuV1c4cTFRTFkyaER2ZDAzZlNnaUc3Nk1WRHVCQmVZRCtB?=
 =?utf-8?B?MGh4TmxteDg1UHdRWW1leHBwR01URGpsRytPMW9yVDhrREhHKzQyTnhtYy9p?=
 =?utf-8?B?a2h5L21uNDBrM0tScCttM1VWUk9zZndnRDVTMlh3UlN2TGFoMkhMbTFSbnpY?=
 =?utf-8?B?MmZOaXFYWW5VeDVDTXgwa1RvSDhkWlYxZUQ4WHdpbmZHRG8xUmJwQk5EWCtV?=
 =?utf-8?Q?qqZYWiyKoTktzbK01WvM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e539112b-0638-4e93-3bc9-08dcf7c5ab22
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 02:59:13.4140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1378


On 2024/10/24 14:43, Inochi Amaoto wrote:
[......]
> diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c b/drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
> new file mode 100644
> index 000000000000..f1c33b166d01
> --- /dev/null
> +++ b/drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
> @@ -0,0 +1,583 @@
[......]
> +int sg2042_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sg2042_pinctrl *pctrl;
> +	const struct sg2042_pinctrl_data *pctrl_data;
> +	int ret;
> +
> +	pctrl_data = device_get_match_data(dev);
> +	if (!pctrl_data)
> +		return -ENODEV;
> +
> +	if (pctrl_data->npins == 0)
> +		return dev_err_probe(dev, -EINVAL, "invalid pin data\n");
> +
> +	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
> +	if (!pctrl)
> +		return -ENOMEM;
> +
> +	pctrl->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pctrl->regs))
> +		return PTR_ERR(pctrl->regs);
> +
> +	pctrl->pdesc.name = dev_name(dev);
> +	pctrl->pdesc.pins = pctrl_data->pins;
> +	pctrl->pdesc.npins = pctrl_data->npins;
> +	pctrl->pdesc.pctlops = &sg2042_pctrl_ops;
> +	pctrl->pdesc.pmxops = &sg2042_pmx_ops;
> +	pctrl->pdesc.confops = &sg2042_pconf_ops;
> +	pctrl->pdesc.owner = THIS_MODULE;
> +
> +	pctrl->data = pctrl_data;
> +	pctrl->dev = dev;
> +	raw_spin_lock_init(&pctrl->lock);
> +	mutex_init(&pctrl->mutex);
> +
> +	platform_set_drvdata(pdev, pctrl);
> +
> +	ret = devm_pinctrl_register_and_init(dev, &pctrl->pdesc,
> +					     pctrl, &pctrl->pctl_dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "fail to register pinctrl driver\n");
> +
> +	return pinctrl_enable(pctrl->pctl_dev);
> +}
> +EXPORT_SYMBOL_GPL(sg2042_pinctrl_probe);
Why EXPORT_SYMBOL_GPL? sg2042_pinctrl_probe looks like just a global 
function should be enough.
> +
> +MODULE_DESCRIPTION("Pinctrl OPs for the SG2042 SoC");
> +MODULE_LICENSE("GPL");

pinctrl-sg2042-ops.c is just a common file built together with 
pinctrl-sg2042.c, right? Why you declare it as a module?

> diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.c b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
> new file mode 100644
> index 000000000000..81411670f855
> --- /dev/null
> +++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.c
> @@ -0,0 +1,642 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Sophgo SG2042 SoC pinctrl driver.
> + *
> + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>

Sort in alphabetic.

[......]



