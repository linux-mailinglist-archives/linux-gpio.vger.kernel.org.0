Return-Path: <linux-gpio+bounces-16216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72279A3B50F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 09:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDEDD179A9D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 08:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4981D1F75A9;
	Wed, 19 Feb 2025 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tkM/w88C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DB41F3BB7
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 08:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739954331; cv=none; b=fzqKa954ofWW5OUPTlXCMQ4X7kptXqSPKWYxk/EecjPZgRKsyR9/Jeg+Om6DeITaoij6w9tF7zT6do9YULGBfpDljyzAKdMzmm1P9S6rrlETVQMRuvvZFQA5gm/BxLzyo2QxjeH8lRDsYl1LL7lhQdhtYW1eLlUMl40fWJsmuuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739954331; c=relaxed/simple;
	bh=sSkJBdJIFGfc3oMTs08rgL6qZZ5qeZIovZ90HYpvPA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Nj5ifE02AAzfdhegnRiiRgDVZUcOQ6SvR8ud+uDSKGbLP7cqF6Ld9XeVUTl/MjLg1OeCadR2Il3MGxReuIB7lOEjN5Dm8VarC6hQ8ssU4PtEKMh0ZfhZKDwpK5yl0ppAuPZkqWfBS7ty7OjOQn+dV+hl8IBe4PjblrY5zRBoObY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tkM/w88C; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250219083836euoutp02101cba3870c860f086f8bf45c87dd230~ljzuKXBeR2080320803euoutp02x
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 08:38:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250219083836euoutp02101cba3870c860f086f8bf45c87dd230~ljzuKXBeR2080320803euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739954316;
	bh=6VHoY15Gd74cbqK2q1xU2So2fYHFema61iUif7A/vgQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=tkM/w88COXkKbniUZfISCQZVt0IsWY0RslgoqcRb3gQfLqnQ/IQfxBFqapnn5jc/w
	 nRCbUXK1WfpP+npHirqtbmgcN4peY4PhuY/uS/EUgYuYVuYQmGhmgFlGujT7+G/PB5
	 07iGjOJakEFTYnyQM01y66ZlnORr/QlLmYYAfte0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250219083836eucas1p26aa7fe037c01b0828959cd98380501ac~ljzt5nth91811318113eucas1p22;
	Wed, 19 Feb 2025 08:38:36 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 95.5C.20397.C8895B76; Wed, 19
	Feb 2025 08:38:36 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250219083836eucas1p1b7ecc6e5fdc34d66ef7565bfcf399254~ljztcuI5s0030500305eucas1p1g;
	Wed, 19 Feb 2025 08:38:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250219083836eusmtrp2e7cfb0cca1e4d13332514bb9df6e63e4~ljztcMyMQ2901929019eusmtrp2F;
	Wed, 19 Feb 2025 08:38:36 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-f6-67b5988cd40d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 3B.3E.19920.C8895B76; Wed, 19
	Feb 2025 08:38:36 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250219083835eusmtip13ff514541a0bb992c712835816369505~ljzsg7Vwc2399823998eusmtip1m;
	Wed, 19 Feb 2025 08:38:35 +0000 (GMT)
Message-ID: <dfe03f88-407e-4ef1-ad30-42db53bbd4e4@samsung.com>
Date: Wed, 19 Feb 2025 09:38:34 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] gpiolib: check the return value of
 gpio_chip::get_direction()
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz
	Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-1-12ea88506cb2@linaro.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djP87o9M7amG5x9rWKx4tsaJotdD7ax
	WUz5s5zJYvP8P4wWl3fNYbNYsPERowObx+Jrt1k97lzbw+bxeZNcAHMUl01Kak5mWWqRvl0C
	V0bPvH7mgl7tihcrWpgaGB8odTFyckgImEhM2nuTvYuRi0NIYAWjxLRbjxkhnC+MEufeHGWC
	cD4zSrx+8ZMFpqXhQCszRGI5o0TfjL9QLR8ZJXY9mM4EUsUrYCfxfssWMJtFQFXi3OZ3bBBx
	QYmTM5+ATRIVkJe4f2sG0HIODmGBCIn7rfUgYRGBYIkvT2+wgcxkFuhhlLjz4zErSIJZQFzi
	1pP5YDPZBAwlut52gc3kFPCSeHVsDhNEjbxE89bZYNdJCJzgkLj6ZSc7xNkuEk/X9jNB2MIS
	r45vgYrLSPzfOZ8JoqGdUWLB7/tQzgRGiYbntxghqqwl7pz7xQZyKrOApsT6XfoQYUeJmys+
	MoOEJQT4JG68FYQ4gk9i0rbpUGFeiY42IYhqNYlZx9fBrT144RLzBEalWUjBMgvJm7OQvDML
	Ye8CRpZVjOKppcW56anFxnmp5XrFibnFpXnpesn5uZsYgYnm9L/jX3cwrnj1Ue8QIxMH4yFG
	CQ5mJRHetvot6UK8KYmVValF+fFFpTmpxYcYpTlYlMR5F+1vTRcSSE8sSc1OTS1ILYLJMnFw
	SjUwSSju5ly2+zeD2Nf3z9T95/w8N8uz7yxPxWaJO14Bvow1L1+wr3sQonnugKPgJ7187d+B
	r2O9z/8/LJ1Slb+89Pltrd+ZTYcYl1qpHnrXfsFw5+fqRT7zuq/UyfxzvW757oj6nLr7phOl
	Z/sIM+5/WNR+/ZyDqqetGot2OYtux1rzHN0nJdoNmY8OKvzJnvS369+duYFuD1vdu9J/RT/Z
	1nXeWVBqj87P48Vfk9jtWZ0d9Ra/ThVa8pO58LiH7oMlX4L4jIqZr9yYvefFWVEVBu47Pxfn
	3794frrt2sC64vAWS74FKgb3g77aFWi839J0+8m91aGSPdttnnn/Z/qiq3AjJaF2LX/YLYHG
	OO6fSizFGYmGWsxFxYkA/eY1OqMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xu7o9M7amG6zYwm6x4tsaJotdD7ax
	WUz5s5zJYvP8P4wWl3fNYbNYsPERowObx+Jrt1k97lzbw+bxeZNcAHOUnk1RfmlJqkJGfnGJ
	rVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXkbPvH7mgl7tihcrWpgaGB8o
	dTFyckgImEg0HGhl7mLk4hASWMoosbrnFAtEQkbi5LQGVghbWOLPtS42iKL3jBKdj/6xgSR4
	Bewk3m/ZwgRiswioSpzb/A4qLihxcuYTsEGiAvIS92/NYO9i5OAQFoiQuN9aDxIWEQiWWHS3
	kxHEZhboYZQ4/d4cYn4no8TSn19ZIBLiEreezAebzyZgKNH1tgtsPqeAl8SrY3OYIGrMJLq2
	dkENkpdo3jqbeQKj0CwkZ8xCMmoWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93E
	CIyrbcd+bt7BOO/VR71DjEwcjIcYJTiYlUR42+q3pAvxpiRWVqUW5ccXleakFh9iNAWGxURm
	KdHkfGBk55XEG5oZmBqamFkamFqaGSuJ87pdPp8mJJCeWJKanZpakFoE08fEwSnVwOSlGr39
	1m7O/1GbK1X3njCSLUi76rl4vv6KsN51qZrlsZ/zvjLYtUSWLhbb1yl0QP7E/H2nbLz2+Kv1
	SDz8daSf+ee9gw3bT0RufrtU03zh5G3/OAsd/yblue7bE9lsUhxzdpaeej+Ht0v2tm3+Rv69
	NU/k1rwR1t6mveRvWAv76b+8vzaxas3R/Fl+WE/m37ma2TvM5SPM2uzve8yZfMCxacOlgtCf
	j0Xm7PJrfqzmPfviX08W3txzX3UeR58R8P/KsTFDdtLd5NJI8XdzTgWICU759IS1WPZ68I2N
	F3ZNzmrtslY/FxC1i5HXzOrN7FNudafabjFO8nvys7x1+yyjNKdX1m5ZB2O73X6eN1JiKc5I
	NNRiLipOBAAH3wAGNAMAAA==
X-CMS-MailID: 20250219083836eucas1p1b7ecc6e5fdc34d66ef7565bfcf399254
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219083836eucas1p1b7ecc6e5fdc34d66ef7565bfcf399254
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219083836eucas1p1b7ecc6e5fdc34d66ef7565bfcf399254
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
	<20250210-gpio-sanitize-retvals-v1-1-12ea88506cb2@linaro.org>
	<CGME20250219083836eucas1p1b7ecc6e5fdc34d66ef7565bfcf399254@eucas1p1.samsung.com>

Hi Bartosz,

On 10.02.2025 11:51, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As per the API contract - gpio_chip::get_direction() may fail and return
> a negative error number. However, we treat it as if it always returned 0
> or 1. Check the return value of the callback and propagate the error
> number up the stack.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpiolib.c | 44 +++++++++++++++++++++++++++++---------------
>   1 file changed, 29 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 679ed764cb14..5d3774dc748b 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1057,8 +1057,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>   		desc->gdev = gdev;
>   
>   		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
> -			assign_bit(FLAG_IS_OUT,
> -				   &desc->flags, !gc->get_direction(gc, desc_index));
> +			ret = gc->get_direction(gc, desc_index);
> +			if (ret < 0)
> +				goto err_cleanup_desc_srcu;
> +
> +			assign_bit(FLAG_IS_OUT, &desc->flags, !ret);
>   		} else {
>   			assign_bit(FLAG_IS_OUT,
>   				   &desc->flags, !gc->direction_input);

This change breaks bcm2835 pincontrol/gpio driver (and probably others) 
in next-20250218. The problem is that some gpio lines are initially 
configured as alternate function (i.e. uart) and .get_direction returns 
-EINVAL for them, what in turn causes the whole gpio chip fail to 
register. Here is the log with WARN_ON() added to line 
drivers/pinctrl/bcm/pinctrl-bcm2835.c:350 from Raspberry Pi 4B:

  ------------[ cut here ]------------
  WARNING: CPU: 0 PID: 1 at drivers/pinctrl/bcm/pinctrl-bcm2835.c:350 
bcm2835_gpio_get_direction+0x80/0x98
  Modules linked in:
  CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
6.14.0-rc3-next-20250218-dirty #9817
  Hardware name: Raspberry Pi 4 Model B (DT)
  pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : bcm2835_gpio_get_direction+0x80/0x98
  lr : bcm2835_gpio_get_direction+0x18/0x98
  ...
  Call trace:
   bcm2835_gpio_get_direction+0x80/0x98 (P)
   gpiochip_add_data_with_key+0x874/0xef0
   bcm2835_pinctrl_probe+0x354/0x53c
   platform_probe+0x68/0xdc
   really_probe+0xbc/0x298
   __driver_probe_device+0x78/0x12c
   driver_probe_device+0xdc/0x164
   __driver_attach+0x9c/0x1ac
   bus_for_each_dev+0x74/0xd4
   driver_attach+0x24/0x30
   bus_add_driver+0xe4/0x208
   driver_register+0x60/0x128
   __platform_driver_register+0x24/0x30
   bcm2835_pinctrl_driver_init+0x20/0x2c
   do_one_initcall+0x64/0x308
   kernel_init_freeable+0x280/0x4e8
   kernel_init+0x20/0x1d8
   ret_from_fork+0x10/0x20
  irq event stamp: 100380
  hardirqs last  enabled at (100379): [<ffff8000812d7d5c>] 
_raw_spin_unlock_irqrestore+0x74/0x78
  hardirqs last disabled at (100380): [<ffff8000812c8918>] el1_dbg+0x24/0x8c
  softirqs last  enabled at (93674): [<ffff80008005ed4c>] 
handle_softirqs+0x4c4/0x4dc
  softirqs last disabled at (93669): [<ffff8000800105a0>] 
__do_softirq+0x14/0x20
  ---[ end trace 0000000000000000 ]---
  gpiochip_add_data_with_key: GPIOs 512..569 (pinctrl-bcm2711) failed to 
register, -22
  pinctrl-bcm2835 fe200000.gpio: could not add GPIO chip
  pinctrl-bcm2835 fe200000.gpio: probe with driver pinctrl-bcm2835 
failed with error -22


Any suggestions how to fix this issue? Should we add 
GPIO_LINE_DIRECTION_UNKNOWN?


> @@ -2728,13 +2731,18 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
>   	if (guard.gc->direction_input) {
>   		ret = guard.gc->direction_input(guard.gc,
>   						gpio_chip_hwgpio(desc));
> -	} else if (guard.gc->get_direction &&
> -		  (guard.gc->get_direction(guard.gc,
> -					   gpio_chip_hwgpio(desc)) != 1)) {
> -		gpiod_warn(desc,
> -			   "%s: missing direction_input() operation and line is output\n",
> -			   __func__);
> -		return -EIO;
> +	} else if (guard.gc->get_direction) {
> +		ret = guard.gc->get_direction(guard.gc,
> +					      gpio_chip_hwgpio(desc));
> +		if (ret < 0)
> +			return ret;
> +
> +		if (ret != GPIO_LINE_DIRECTION_IN) {
> +			gpiod_warn(desc,
> +				   "%s: missing direction_input() operation and line is output\n",
> +				    __func__);
> +			return -EIO;
> +		}
>   	}
>   	if (ret == 0) {
>   		clear_bit(FLAG_IS_OUT, &desc->flags);
> @@ -2771,12 +2779,18 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
>   						 gpio_chip_hwgpio(desc), val);
>   	} else {
>   		/* Check that we are in output mode if we can */
> -		if (guard.gc->get_direction &&
> -		    guard.gc->get_direction(guard.gc, gpio_chip_hwgpio(desc))) {
> -			gpiod_warn(desc,
> -				"%s: missing direction_output() operation\n",
> -				__func__);
> -			return -EIO;
> +		if (guard.gc->get_direction) {
> +			ret = guard.gc->get_direction(guard.gc,
> +						      gpio_chip_hwgpio(desc));
> +			if (ret < 0)
> +				return ret;
> +
> +			if (ret != GPIO_LINE_DIRECTION_OUT) {
> +				gpiod_warn(desc,
> +					   "%s: missing direction_output() operation\n",
> +					   __func__);
> +				return -EIO;
> +			}
>   		}
>   		/*
>   		 * If we can't actively set the direction, we are some
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


