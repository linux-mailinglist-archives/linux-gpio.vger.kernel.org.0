Return-Path: <linux-gpio+bounces-16546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53253A43B2B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 11:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2276C163790
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 10:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CE1263895;
	Tue, 25 Feb 2025 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uUcArU5m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8963525743A
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478425; cv=none; b=rwtFufWUZzY0jHId1/GpgY0yAdcPCDbJxL0LNMjOuzxpBc6CHbYLgbIbcVbgHL7qiYGWGM3BYFmfofP9CFYmStDGY5cKzFmW1+fXI3+dx7BUpcPSU9iptE/J4wJAEUfXXVVGkMawBi7XQh+2fhhmYdmmgUbUIN0lwJQgcambRZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478425; c=relaxed/simple;
	bh=EK2z1/mY11k+Yb49rOAUKqHQhZiWMwS9lP8bNojUrdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=UZuJhB4uOa4ZJa3ZuiIg3P1bu8xsJh3XAek7rhYGVuDTFg2D3KeXxmZxHZU40z82bVTgP1BiuJ2TDbsA0n1akQ7B/lwwV5go3eo33OhgegrDLDabK/H8klIgb3AKmPWbBt6XW7aM3Us3ytN4pDSmJYkZTxPvtx+svyx7EXVkbz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uUcArU5m; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250225101340euoutp0118d9725be44c2891e516e726b8815c22~na_byb-zH0408704087euoutp01X
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 10:13:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250225101340euoutp0118d9725be44c2891e516e726b8815c22~na_byb-zH0408704087euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740478420;
	bh=e4LoxeP+NNcsDPVZ19HjPLj+ANosetEFcVUdRrnEUHk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=uUcArU5mgRaynZ7gI0Za9HkSBPmwQz7W4TXg/UNMkJ2PA9OFICiEqPlUIETM6D6QU
	 MbHXzX3aRtx7LRNGWvsTRVii2d0QlGjtcuJ6ZZVw4dtYGRdZxILS7V22JB2YKs3+er
	 NMTsFTDCcsvy5CvRNSoqfU269nFQzSMatNg5Udlw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250225101340eucas1p24e6b1dcf0b1c21cc4f14ae4f5bce2cb8~na_boJNfM2612526125eucas1p23;
	Tue, 25 Feb 2025 10:13:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 9A.A4.20397.4D79DB76; Tue, 25
	Feb 2025 10:13:40 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250225101340eucas1p13c0c9cbc62ee7c9bfe964941c901bd1b~na_bW4vV30133801338eucas1p1V;
	Tue, 25 Feb 2025 10:13:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250225101340eusmtrp2a4228c2859af6cb4c14eadbe9858fe3a~na_bWYsNm1504215042eusmtrp2P;
	Tue, 25 Feb 2025 10:13:40 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-dd-67bd97d4b2ce
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 81.2D.19654.4D79DB76; Tue, 25
	Feb 2025 10:13:40 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250225101339eusmtip28791148859bb831304eea6c9258be84e~na_a8IrGO2867128671eusmtip2y;
	Tue, 25 Feb 2025 10:13:39 +0000 (GMT)
Message-ID: <81f890fc-6688-42f0-9756-567efc8bb97a@samsung.com>
Date: Tue, 25 Feb 2025 11:13:39 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] gpiolib: sanitize the return value of
 gpio_chip::get_direction()
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz
	Golaszewski <bartosz.golaszewski@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-8-12ea88506cb2@linaro.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZduznOd0r0/emG7z7LGmx4tsaJotdD7ax
	WUz5s5zJYvP8P4wWl3fNYXNg9Vh87Tarx51re9g8Pm+SC2CO4rJJSc3JLEst0rdL4Mp43beM
	teCkdsX25QdZGxh3qXQxcnJICJhI3H03h7WLkYtDSGAFo0T3uQ4mCOcLo0T/+2YmkCohgc+M
	Eid+18N0PO99wgZRtJxRYtuaJ8wQzkdGiS8v1jKCVPEK2Ekc3LOIDcRmEVCVWLPrOAtEXFDi
	5MwnYLaogLzE/Vsz2EFsYYFoiQ87/jKD2CICwRJfnt4A62UWKJH4/n8bI4QtLnHryXywi9gE
	DCW63naB1XAKeEl03f7IClEjL9G8dTbYQRICOzgkVmybwwpxtovE9PProGxhiVfHt7BD2DIS
	/3fOZ4JoaGeUWPD7PpQzgVGi4fktRogqa4k7534BreMAWqEpsX6XPogpIeAo8aOzEMLkk7jx
	VhDiBj6JSdumM0OEeSU62oQgZqhJzDq+Dm7rwQuXmCcwKs1CCpVZSL6cheSbWQhrFzCyrGIU
	Ty0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMLaf/Hf+6g3HFq496hxiZOBgPMUpwMCuJ8HJm
	7kkX4k1JrKxKLcqPLyrNSS0+xCjNwaIkzrtof2u6kEB6YklqdmpqQWoRTJaJg1OqgWnWPpf3
	F/5feC4psF/3YoaWk2XPjLNF++w2pPyOOcz46uNdMxNVQyl2j+eCPEpfbZuNFu2N96tTf33a
	Vf3Pwq7nLCoX/ohMTT4119FBW2Pu89mXCttKq5IdjvOFPrnId2Tq1lsezQfye79eMbWfIcEn
	2S2xidc6M4Wra6fnVaPrr/KeBGomZtV0PYtzNXppOqut79Xm/xFsTh3XtuZsT8iytDwebb/8
	u7FkbNnP+fUBm63yovzmhu+OOe4jdOT2+5lv5jqvfxxptsS590jlJpmqzg+2Ricea609OMlm
	s5jSu/hfO5NVT65TNNjz6cjCCL9u1k//jM0u3hW/IZmxxn7D9kZO7kBGztezJx45dkSJpTgj
	0VCLuag4EQDvJI/UnAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsVy+t/xe7pXpu9NN7i2mcNixbc1TBa7Hmxj
	s5jyZzmTxeb5fxgtLu+aw+bA6rH42m1WjzvX9rB5fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhh
	pGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJfxum8Za8FJ7Yrtyw+yNjDuUuli5OSQ
	EDCReN77hK2LkYtDSGApo8SrjXcYIRIyEienNbBC2MISf651QRW9Z5RoX3GeGSTBK2AncXDP
	IjYQm0VAVWLNruMsEHFBiZMzn4DZogLyEvdvzWAHsYUFoiU+7PgL1isiECyx6G4n2DJmgRKJ
	SQ//Qy3oZJQ4cOMZK0RCXOLWk/lMIDabgKFE19susGWcAl4SXbc/QtWYSXRt7YIaJC/RvHU2
	8wRGoVlI7piFZNQsJC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERhP24793LKD
	ceWrj3qHGJk4GA8xSnAwK4nwcmbuSRfiTUmsrEotyo8vKs1JLT7EaAoMjInMUqLJ+cCIziuJ
	NzQzMDU0MbM0MLU0M1YS52W7cj5NSCA9sSQ1OzW1ILUIpo+Jg1Oqgan7T/kptcNqU1flilyw
	uGG3Iup4vk71v6vKLkdCy1LcZi0OjNnw74+1nZqFprvJSg5Bs0kb+5ak71Tc+tRw1vukrkXX
	PbvePj4TWLvkzJdJxSmnWtxmiZjc8J9apXhFOLSee25QLvOWt4Vumb84dxy8/FeohvFAh5Pd
	5rsKjBIv+Yseuiwqs1UPCVNZ6vRHO/3qBznlZV9yCz5yVsUf0p83cZOBxZq3F6tPpCxi+e0a
	Wmr/unLqvlNl9rWO268tTYxpfbH9mmuHsMOhdfEh/ZYztTxDvnoI514oDOJVUXzxt0ci8vNj
	168xHck7n88Wu2iq28odLqzY72gZWFLffq7uTLV20ySVScuWLJpmpsRSnJFoqMVcVJwIANdT
	0tcwAwAA
X-CMS-MailID: 20250225101340eucas1p13c0c9cbc62ee7c9bfe964941c901bd1b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250225101340eucas1p13c0c9cbc62ee7c9bfe964941c901bd1b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250225101340eucas1p13c0c9cbc62ee7c9bfe964941c901bd1b
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
	<20250210-gpio-sanitize-retvals-v1-8-12ea88506cb2@linaro.org>
	<CGME20250225101340eucas1p13c0c9cbc62ee7c9bfe964941c901bd1b@eucas1p1.samsung.com>

On 10.02.2025 11:52, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As per the API contract, the get_direction() callback can only
> return 0, 1 or a negative error number. Add a wrapper around the callback
> calls that filters out anything else.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This patch landed in today's linux-next as commit e623c4303ed11 
("gpiolib: sanitize the return value of gpio_chip::get_direction()"). It 
introduced a lockdep warning from the gpiochip_get_direction() function. 
IMHO it looks that gpiochip_add_data_with_key() lacks proper srcu 
locking/annotation for the newly created gpio chip. Here is the log:

gpio gpiochip1: Static allocation of GPIO base is deprecated, use 
dynamic allocation.
------------[ cut here ]------------
WARNING: CPU: 2 PID: 35 at drivers/gpio/gpiolib.c:349 
gpiochip_get_direction+0x48/0x66
Modules linked in: cdns_usb_common roles cdns3_starfive 
snd_soc_simple_card snd_soc_simple_card_utils phy_jh7110_dphy_rx 
clk_starfive_jh7110_vout pcie_starfive(+) clk_starfive_jh7110_isp 
jh7110_trng sfctemp dwmac_starfive stmmac_platform 
spi_cadence_quadspi(+) clk_starfive_jh7110_stg stmmac 
clk_starfive_jh7110_aon jh7110_pwmdac pcs_xpcs phy_jh7110_usb spi_pl022 
phy_jh7110_pcie snd_soc_spdif_tx i2c_dev drm 
drm_panel_orientation_quirks backlight dm_mod configfs ip_tables x_tables
CPU: 2 UID: 0 PID: 35 Comm: kworker/u18:0 Tainted: G W          
6.14.0-rc4-next-20250225 #1054
Tainted: [W]=WARN
Hardware name: StarFive VisionFive 2 v1.2A (DT)
Workqueue: events_unbound deferred_probe_work_func
epc : gpiochip_get_direction+0x48/0x66
  ra : gpiochip_get_direction+0x46/0x66
...
[<ffffffff805fc72c>] gpiochip_get_direction+0x48/0x66
[<ffffffff80603a14>] gpiochip_add_data_with_key+0x74a/0xde2
[<ffffffff806044e6>] devm_gpiochip_add_data_with_key+0x1e/0x5a
[<ffffffff805f8738>] jh7110_pinctrl_probe+0x298/0x3aa
[<ffffffff80731116>] platform_probe+0x4e/0x92
[<ffffffff8000c366>] really_probe+0x10a/0x2de
[<ffffffff8000c5e4>] __driver_probe_device.part.0+0xaa/0xe0
[<ffffffff8072ee34>] driver_probe_device+0x78/0xc4
[<ffffffff8072eee6>] __device_attach_driver+0x66/0xc6
[<ffffffff8072d0b0>] bus_for_each_drv+0x5c/0xb0
[<ffffffff8072f33e>] __device_attach+0x84/0x13c
[<ffffffff8072f55e>] device_initial_probe+0xe/0x16
[<ffffffff8072e002>] bus_probe_device+0x88/0x8a
[<ffffffff8072e516>] deferred_probe_work_func+0xd4/0xee
[<ffffffff80047b7e>] process_one_work+0x1d0/0x57a
[<ffffffff8004854e>] worker_thread+0x166/0x2cc
[<ffffffff80051568>] kthread+0xdc/0x1b4
[<ffffffff80bcb942>] ret_from_fork+0xe/0x18
irq event stamp: 17857
hardirqs last  enabled at (17857): [<ffffffff80bca986>] 
_raw_spin_unlock_irqrestore+0x4c/0x4e
hardirqs last disabled at (17856): [<ffffffff80bca73c>] 
_raw_spin_lock_irqsave+0x5e/0x64
softirqs last  enabled at (17322): [<ffffffff80adff1a>] 
inet6_fill_ifla6_attrs+0x3d0/0x420
softirqs last disabled at (17320): [<ffffffff80adfefe>] 
inet6_fill_ifla6_attrs+0x3b4/0x420
---[ end trace 0000000000000000 ]---


> ---
>   drivers/gpio/gpiolib.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 683a03d237c0..7f2aca9f81a1 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -341,6 +341,22 @@ static int gpiochip_find_base_unlocked(u16 ngpio)
>   	}
>   }
>   
> +static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&gc->gpiodev->srcu);
> +
> +	if (WARN_ON(!gc->get_direction))
> +		return -EOPNOTSUPP;
> +
> +	ret = gc->get_direction(gc, offset);
> +	if (ret > 1)
> +		ret = -EBADE;
> +
> +	return ret;
> +}
> +
>   /**
>    * gpiod_get_direction - return the current direction of a GPIO
>    * @desc:	GPIO to get the direction of
> @@ -381,7 +397,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
>   	if (!guard.gc->get_direction)
>   		return -ENOTSUPP;
>   
> -	ret = guard.gc->get_direction(guard.gc, offset);
> +	ret = gpiochip_get_direction(guard.gc, offset);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -1057,7 +1073,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>   		desc->gdev = gdev;
>   
>   		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
> -			ret = gc->get_direction(gc, desc_index);
> +			ret = gpiochip_get_direction(gc, desc_index);
>   			if (ret < 0)
>   				goto err_cleanup_desc_srcu;
>   
> @@ -2770,8 +2786,7 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
>   		ret = gpiochip_direction_input(guard.gc,
>   					       gpio_chip_hwgpio(desc));
>   	} else if (guard.gc->get_direction) {
> -		ret = guard.gc->get_direction(guard.gc,
> -					      gpio_chip_hwgpio(desc));
> +		ret = gpiochip_get_direction(guard.gc, gpio_chip_hwgpio(desc));
>   		if (ret < 0)
>   			return ret;
>   
> @@ -2818,8 +2833,8 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
>   	} else {
>   		/* Check that we are in output mode if we can */
>   		if (guard.gc->get_direction) {
> -			ret = guard.gc->get_direction(guard.gc,
> -						      gpio_chip_hwgpio(desc));
> +			ret = gpiochip_get_direction(guard.gc,
> +						     gpio_chip_hwgpio(desc));
>   			if (ret < 0)
>   				return ret;
>   
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


