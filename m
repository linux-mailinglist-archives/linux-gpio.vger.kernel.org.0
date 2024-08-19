Return-Path: <linux-gpio+bounces-8794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2090956AA7
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 14:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FA72282CFA
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 12:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC4616A949;
	Mon, 19 Aug 2024 12:22:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A95916A940;
	Mon, 19 Aug 2024 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724070135; cv=none; b=gbcnhLLquRfaTZn8cGDL8xC8nesIqnR+QzXtauIZcYQt40vdWnKU1nyfrH8Kayb6Drm9bYuglobXu/XSh0QCOQB1Y62CfWQ8c/OERFBnisHdE82hCk/SH+VhRwjiZFisvL1ZFvvpICcxx8b7zj9log49ZrgYDSM1Pk+2VPiTCmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724070135; c=relaxed/simple;
	bh=VnW/V/OWDr1zAW3V3CmmoDVOIxg6G1ZmT3OYyJCke5E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=uwd8x2wF9dIAuLwGJSwVWUXyMCvtuPEp2ibpG4xYuosv2uIvCCAdMcvH7iBYairjCXPI0YZ1IoAU2SntNR310Cak52J3M709wfTSYuOn9EOxqDV4sMdHvm74GLF0irzGie3hu83rakaCXnakIpinFfHit2kNuY1uvgdE5cTKkGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WnWn31CJyz1j6gn;
	Mon, 19 Aug 2024 20:17:11 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 7FF7614022E;
	Mon, 19 Aug 2024 20:22:09 +0800 (CST)
Received: from [10.67.108.52] (10.67.108.52) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 19 Aug
 2024 20:22:09 +0800
Message-ID: <4ffc2b2c-7d68-4a53-945f-e77c207445c9@huawei.com>
Date: Mon, 19 Aug 2024 20:22:09 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] pinctrl: pinctrl-zynq: fix module autoloading
Content-Language: en-US
From: "liaochen (A)" <liaochen4@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linus.walleij@linaro.org>,
	<michal.simek@amd.com>
References: <20240814030155.3876069-1-liaochen4@huawei.com>
In-Reply-To: <20240814030155.3876069-1-liaochen4@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500020.china.huawei.com (7.185.36.49)

On 2024/8/14 11:01, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Signed-off-by: Liao Chen <liaochen4@huawei.com>
> ---
>   drivers/pinctrl/pinctrl-zynq.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
> index 0e8de27d0de8..caa8a2ca3e68 100644
> --- a/drivers/pinctrl/pinctrl-zynq.c
> +++ b/drivers/pinctrl/pinctrl-zynq.c
> @@ -1202,6 +1202,7 @@ static const struct of_device_id zynq_pinctrl_of_match[] = {
>   	{ .compatible = "xlnx,pinctrl-zynq" },
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(of, zynq_pinctrl_of_match);
>   
>   static struct platform_driver zynq_pinctrl_driver = {
>   	.driver = {
Gentle ping

Thanks,
Chen

