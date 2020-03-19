Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 792A618BD91
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 18:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbgCSRHZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 13:07:25 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13693 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgCSRHZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 13:07:25 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e73a6bf0000>; Thu, 19 Mar 2020 10:07:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 19 Mar 2020 10:07:24 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 19 Mar 2020 10:07:24 -0700
Received: from [10.25.77.145] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 17:07:22 +0000
Subject: Re: [PATCH 5/9] pinctrl: tegra: Fix "Scmitt" -> "Schmitt" typo
To:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Jon Hunter <jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-6-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <86a32802-709a-357a-9169-dc97112ae256@nvidia.com>
Date:   Thu, 19 Mar 2020 22:37:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319122737.3063291-6-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584637631; bh=oVFju5Og40ueo9MFP7eOx8xtH8mmjYJoORgQeUPUfyY=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=faPSIOrBSpPH8o8oQ2zKaOhKJqmg2GcGpryNQk0OlT60swwy082WNweH8zgd/8G3/
         yMiqbzCgQZkkYLoSwv5Jsd4p/6T0il+cNi55Nzpw6uBqc0RhhCgsdvBku8i35wjK+a
         Nbn04MULoUfFJzVIHWeoYWLcBEC3zvkALpKVu3p7yD/juax4r9l3UKncf0Bl9MLJrr
         A5gYqjKMYjYTNN7IfFfyomFe+iCWLjM7tKZxP/3mCX110Iux4TaSWC4PnQww+TbwNu
         R9MCrlEhsVBN5pgCbWPimNaMiSunFyeiXoIPVfNqnVT1l7yJ1YNZDZyhY1D3S3zq6k
         uy4vdrgojTcPQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/19/2020 5:57 PM, Thierry Reding wrote:
> External email: Use caution opening links or attachments
> 
> 
> From: Thierry Reding <treding@nvidia.com>
> 
> Properly spell "Schmitt" in the kerneldoc for pin group definitions.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
> index 0fc82eea9cf1..520865979d4a 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.h
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
> @@ -107,7 +107,7 @@ struct tegra_function {
>    *                     drvup, slwr, slwf, and drvtype parameters.
>    * @drv_bank:          Drive fields register bank.
>    * @hsm_bit:           High Speed Mode register bit.
> - * @schmitt_bit:       Scmitt register bit.
> + * @schmitt_bit:       Schmitt register bit.
>    * @lpmd_bit:          Low Power Mode register bit.
>    * @drvdn_bit:         Drive Down register bit.
>    * @drvdn_width:       Drive Down field width.
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas@nvidia.com>
