Return-Path: <linux-gpio+bounces-13529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E87369E4D30
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 06:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C36AF169129
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 05:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CF1194123;
	Thu,  5 Dec 2024 05:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="SstSwugA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAA718FC74;
	Thu,  5 Dec 2024 05:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733375597; cv=none; b=KYNHNxXhfbOtPJTy45UmavSPAclvtRdmFBqfRZH2lnZS25HN233+Z4hlKJS+XNbBUxzdG16SyFN6QY0mWnYMhw3Fv+6/A4WrVOcBfTMF9ZAigUDmTZZ/O8b7LXsiVZkREJ7bhBQvJVyYCI4tedYTP1oJ296JM1Gp4JStDwNvKcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733375597; c=relaxed/simple;
	bh=UylYSkE1r0VlZu5Ykn39oGaMw7xL4h7+hpDU5jx3o0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKAWJxyknEH03eEh5KZFCkQBAY2heXUsUaoD/LQsTeIyw2HVsNhhHnOorLXisAOfjVdkE1dDP/g+NHIvCQr6RrJbqNOFsly2/KFvleVi1DK6t2ircL4Izw/outjTk4Uqmx3/iccFpbG1nahrhPBntHeMpQNX8rQr5eEVcIB3vuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=SstSwugA; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E6F8C88EDD;
	Thu,  5 Dec 2024 06:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1733375588;
	bh=dWyo9Bu5l9XOsB4Q8M1dSJaLQtxfsxiyf7xxvykE+sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SstSwugAf14DWGV0olpYo99gQMHuNa+3siS4StFcJh/xEgnrORDiQssMO2Li27VH3
	 401H97eV0rRm0NbmB6ei5GhU/JrlUrBdG/6OCb+8Aeykufm/pJCiLP6rmXOKCOhjBf
	 fuuE8RIqUFBGgJOcNyVQS/oaImdI8HeOPC8/PG2AM1jvK1EehTfMpmGy8Rfi9KHDB1
	 fB18rdFu5bJaMxU7TA0XkCCrt4YUklofs56efQjO/8v1qfBuHoxzFycT/jI+Tk1COJ
	 trpyNocUyirAsChlZITCNZw6jj/uONDppuWKyAyN9JQNOvl6We6A3A23w+RnQ6XOkn
	 0dbwhMVeE69Vw==
Message-ID: <3c809cae-991b-4b13-8d8b-bd6cbcc9a9b9@denx.de>
Date: Thu, 5 Dec 2024 06:07:51 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>, linus.walleij@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, make24@iscas.ac.cn,
 peng.fan@nxp.com, fabien.dessenne@foss.st.com
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241205045942.2441430-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241205045942.2441430-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 12/5/24 5:59 AM, Mingwei Zheng wrote:
> Add check for the return value of clk_enable() to catch the potential
> error. Add a cleanup loop to disable clocks already enabled in case
> of an error during clock enabling for subsequent banks.
> 
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 5b7fa77c1184..eb7b2f864d88 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1738,10 +1738,16 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
>   {
>   	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
>   	struct stm32_pinctrl_group *g = pctl->groups;
> -	int i;
> +	int i, j, ret;
>   
> -	for (i = 0; i < pctl->nbanks; i++)
> -		clk_enable(pctl->banks[i].clk);
> +	for (i = 0; i < pctl->nbanks; i++) {
> +		ret = clk_enable(pctl->banks[i].clk);
> +		if (ret) {
> +			for (j = 0; j < i; j++)

Instead of this open-coded loop, can you please convert the driver to 
clk_bulk*() API and then do simple clk_bulk_enable()/clk_bulk_disable() 
here and everywhere ?

Thank you

