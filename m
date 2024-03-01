Return-Path: <linux-gpio+bounces-4023-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7C986DE8E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 10:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 536C3283A78
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 09:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8925D6A8A7;
	Fri,  1 Mar 2024 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="2PkzuQiV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D9C6A8B5
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709286500; cv=none; b=HuinbSwy1WBjdoQ9STsdo4ClDkJ9CD2zC4FPizMIf21aUf889cMgX0rbeV+h4b9Jk+aPgmNPU/N37ShSMJ6QHQLRHuN6HdMcT2KvOWdGvFr9o/M8h6Di31bfAd3i05VC4dC9TWgeIAa/Pf/CUAGsXjU7lCtX1qlcY+ff36YWNP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709286500; c=relaxed/simple;
	bh=+80vNOLMDKRVmpQMdBh5/8bGOioHugjXyZ1PP3Zrvws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHQa+s5tjHk4xTFBT0JCJr2Jm9R3Nst2/szuB4Fbjj3k1iiIKeEnw5YkKOhNCz91dQM9yI3VyOn6Rg6aXSUy2vB6bcLd3deBWgch6Et64K58uoOXumXf5Osx5n7bRmNCOFdutFNU6wuPGOsClU+H/UNHqnnieQEH3oVbM8euj1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=2PkzuQiV; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709286496;
	bh=+80vNOLMDKRVmpQMdBh5/8bGOioHugjXyZ1PP3Zrvws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2PkzuQiV67k38oPZVXz3uPdGz2GdyamlCpWJNb5s6tc5TxNtzHvrTIhYyZ7VCcs6/
	 aeZ4pEltFITDpIQeasrBww4gge8fXfD9OwtBtoocd+RjuOdJBHAv12tU8JCvpdvUDb
	 R6JgypJ1gs/6RaWZHVsAOpg0JIc8rTnX1oUWQts+5U30ppJvMtBVwouGFIT9HovBe/
	 PbzYNtqXxbMR6qOp1qODe8Q+A8XhqFaNcb9uP+m3eTPTEmZa5H5S5pFtQxbuE1m4ms
	 ExLyMi2LDAgM0jB2vNSR+FKSM32DjDm9jSM0rWUlPw48ftQpRuXFii81HeKZJbvjC7
	 pXoxo3GLKwLpQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 711AA37820C2;
	Fri,  1 Mar 2024 09:48:16 +0000 (UTC)
Message-ID: <ee1828ed-47c3-4e4c-8864-445522414c16@collabora.com>
Date: Fri, 1 Mar 2024 10:48:15 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] pinctrl: Add driver for Awinic AW9523/B I2C GPIO
 Expander
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 David Bauer <mail@david-bauer.net>
Cc: linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20240229-awinic-aw9523-v7-1-b62d0d2963d2@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240229-awinic-aw9523-v7-1-b62d0d2963d2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/02/24 23:52, Linus Walleij ha scritto:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> The Awinic AW9523(B) is a multi-function I2C gpio expander in a
> TQFN-24L package, featuring PWM (max 37mA per pin, or total max
> power 3.2Watts) for LED driving capability.
> 
> It has two ports with 8 pins per port (for a total of 16 pins),
> configurable as either PWM with 1/256 stepping or GPIO input/output,
> 1.8V logic input; each GPIO can be configured as input or output
> independently from each other.
> 
> This IC also has an internal interrupt controller, which is capable
> of generating an interrupt for each GPIO, depending on the
> configuration, and will raise an interrupt on the INTN pin to
> advertise this to an external interrupt controller.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: David Bauer <mail@david-bauer.net>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/r/20210624214458.68716-2-mail@david-bauer.net
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Resend and edit of David Bauers submission that is in use
> in OpenWrt. It was so close to being merged that we better
> just get it done.
> ---
> Changes from v6->v7:
> - Set default IRQ type to IRQ_TYPE_EDGE_BOTH
> - Convert to immutable irq_chip
> - Convert probe and remove to new signatures
> - Drop some unused headers
> - Rename some variables as I like them
> ---
>   drivers/pinctrl/Kconfig          |   18 +
>   drivers/pinctrl/Makefile         |    1 +
>   drivers/pinctrl/pinctrl-aw9523.c | 1119 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 1138 insertions(+)
> 

..snip..

> +
> +static const struct of_device_id of_aw9523_i2c_match[] = {
> +	{ .compatible = "awinic,aw9523-pinctrl", },
> +};
> +MODULE_DEVICE_TABLE(of, of_aw9523_i2c_match);
> +
> +static struct i2c_driver aw9523_driver = {
> +	.driver = {
> +		.name = "aw9523-pinctrl",
> +		.of_match_table = of_aw9523_i2c_match,
> +	},
> +	.probe = aw9523_probe,
> +	.remove = aw9523_remove,
> +	.id_table = aw9523_i2c_id_table,
> +};
> +module_i2c_driver(aw9523_driver);
> +
> +MODULE_DESCRIPTION("Awinic AW9523 I2C GPIO Expander driver");
> +MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:aw9523");

As pointed by Krzysztof, MODULE_ALIAS is actually unneeded...
...but the rest looks good.

Since it's signed off by .. me, and the author is still, well, me... it would
look weird if I gave you a R-b.

So...

After removing MODULE_ALIAS (and of course picking the bindings),

"R-b myself" :-)

Cheers,
Angelo

