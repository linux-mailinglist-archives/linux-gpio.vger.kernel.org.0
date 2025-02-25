Return-Path: <linux-gpio+bounces-16560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C866AA440B8
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 14:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA526861AFA
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 13:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7589269891;
	Tue, 25 Feb 2025 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mXUnjh5L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EECD2690FB
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 13:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740489738; cv=none; b=OCIRtSlQTfFkHYzh27s/XWSc7TfaT+sOBT9fwe4GbnfYp/e7S1COdcuFYnvsN7v7wharMM87neV2bHgqAr6nZ6VToGG8JGbG94vFLUwLfeKFv/W1dM11kVZdTQFsHdH51E1UupxY0veCHcl3Hw7lvFRJcPosqFAXg92mGXha7wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740489738; c=relaxed/simple;
	bh=A1MKIRsT16qR5Oc7esZf/aQQCPRctrch2eyCn0kavg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ZScJ4itYyL5uprlYjIDg1Iz1ROxZK4n+5FEg3/98481z48Skg2njiND5nQEDgkZWttO392X21/aGFEtseo1Sx8WpuMhDotH2rfCP121FTkob60Goynal3+ytxsZGGauUrny4aYkudmSpmrAnqa7cq72tn18rfXFmE3zP2JzEHLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mXUnjh5L; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250225132213euoutp016c5aa4c5d9b8cf06d1f5b51ac8d6f6f7~ndjDrexYo2211922119euoutp015
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 13:22:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250225132213euoutp016c5aa4c5d9b8cf06d1f5b51ac8d6f6f7~ndjDrexYo2211922119euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740489733;
	bh=sj77nEotSWCrWW5AfrsnehFc3Rhlx8if506AIuvT6AU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=mXUnjh5LyeYEVmAiGc7MKMy5LzPd96kuikntYdJ8HA1k1Xj9Rin/cYwZqLhYUT1gh
	 SnXhpn4JObo07hfLNt8o+MTuRaaCCyWmW3wH9q7Y3gAZ1r3K7DaVuAd8Vnn/w5QxRZ
	 dN48oSe9sBzoXsKmXu+0KULMD4SRchj0zLW/hsJ0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250225132213eucas1p20e31b16f6482e6fa19cec164ffe03e91~ndjDjBBAA2789527895eucas1p29;
	Tue, 25 Feb 2025 13:22:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 2E.AC.20409.504CDB76; Tue, 25
	Feb 2025 13:22:13 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250225132213eucas1p1b56c16b80858e30af1abcc1a31321c34~ndjDPVSI_1312513125eucas1p1L;
	Tue, 25 Feb 2025 13:22:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250225132213eusmtrp256efbdaddea79d5adc1be59f866072a3~ndjDOxlXh2728727287eusmtrp2D;
	Tue, 25 Feb 2025 13:22:13 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-fd-67bdc40585d8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 23.7E.19654.404CDB76; Tue, 25
	Feb 2025 13:22:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250225132212eusmtip2d8a1c67c0d94bd1f1361b49351b6e1a3~ndjClBPxN0760707607eusmtip2V;
	Tue, 25 Feb 2025 13:22:12 +0000 (GMT)
Message-ID: <1eb26bfa-205b-480a-9515-df99add14a98@samsung.com>
Date: Tue, 25 Feb 2025 14:22:11 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] gpiolib: don't use gpiochip_get_direction() when
 registering a chip
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz
	Golaszewski <bartosz.golaszewski@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250225-retval-fixes-v1-1-078c4c98517a@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRT2t3vdvY5m12nskJE00N4uzWhlmGaFUa0iiEhSV16m5Kttlll/
	rCLNLSh6mWupZXlXWImm5VqEZkoPxXwVa6XmWiVZrYmvfOR2tfzvO9/5zvnO9+NHYoIL7rPJ
	xBQVrUiRJYm4PLyybqhxqXvtE/ky0+hMSV4xQ0gM/SUcibGzkiu5OMJwJOUFI0jSYtRzw7lR
	Re3v3aOKTN84UZZ2EzfKUTZ3O76HtyaeTko8RCvEYXG8hLZSKzet3Tuj86SRUCP7TA3yIIEK
	gSKNGnNiAWVA8L1bqEG8CdyHYHTIiLGFA8F4mwZNTdytMBBsg0Ggr/jMZQs7ArvWSjhVfCoM
	zuY2c5wYp/xhuOWaO8t7wYs8K+7Esyg/6DBfcem9qRjIvu/AnYt8qBMImnM+uYYxSgUD45WI
	xUIwWwtcPJcKAk2vZsKZJD2oCMhtCGIlfvCwV+86G6gmEkZyiwmnBqj10KPbwSbwhp76BwSL
	58B4lXOlU5+NoPBPx2RxDoH6i3kycyhYGoddZhi1EO4bxSwdAZ1X1Rx2vye86/Vib/CE85W5
	GEvz4XSWgFUHgK7+3j/b6qZm7BwS6aa9im5aSN20NLr/voUIv4OEdLoyWU4rg1Pow4FKWbIy
	PUUeuD81uQxN/JtXY/V9jxDTYw+sQRwS1SAgMZEP3yPRJBfw42VHMmlFaqwiPYlW1iBfEhcJ
	+TeenpILKLlMRR+g6TRaMdXlkB6z1ZzwH7inv4+vm9gnZAXz1nLTvO2bTSqVZ5UlNT6XtUbu
	tX3U7o4tvFur3dmNmUNMdS/x6uri+SVj/OAq5vGtvME/A4ZMffUZPtFVaLuMLYnoZ2wZ8X2P
	5uU017XFfjhuaV07bKVUdTvKY+Zrdkq9HFsUvrEbuvrWPd9k/7X1tVetMiHj59HrC17rIscO
	PpMmpFqlANaNK9+E+m5Q5e9d4L84P/xZjpARbF5eEVEiFgzKNl5gtGdmRBd9PdYwR13RGnrJ
	sLn//G9i1yG3syIHT5LhV7MqwE1a3FG6zxLwWxw51PNJ2J2o/RU3Gr/Jrh+MKQ20RodBMrV/
	3mmFcTVxW4QrE2RBizCFUvYXZQebW6YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xe7osR/amGxx9YmExc9lydosV39Yw
	Wex6sI3NYsqf5UwWm+f/YbS4vGsOmwObx+Jrt1k9Fu95yeRx59oeNo/Pm+QCWKL0bIryS0tS
	FTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mq5ueMJWcE244kHz
	LvYGxo/8XYycHBICJhJrt65g72Lk4hASWMoo8Wz6DjaIhIzEyWkNrBC2sMSfa11gcSGB94wS
	57p9QWxeATuJ/umXmEBsFgFViV+X57JCxAUlTs58wgJiiwrIS9y/NYMdxBYWiJNoX/+ZBWSZ
	iEALo8TqC/fBhjILlEhMevifDeKK04wS1xceYIJIiEvcejIfzGYTMJToegtyBQcHp4CjxPSz
	hhAlZhJdW7sYIWx5ie1v5zBPYBSaheSOWUgmzULSMgtJywJGllWMIqmlxbnpucVGesWJucWl
	eel6yfm5mxiBEbbt2M8tOxhXvvqod4iRiYPxEKMEB7OSCC9n5p50Id6UxMqq1KL8+KLSnNTi
	Q4ymwMCYyCwlmpwPjPG8knhDMwNTQxMzSwNTSzNjJXFetivn04QE0hNLUrNTUwtSi2D6mDg4
	pRqYpnE8+x5woH/zw3dljY3+jmuV1j84pOVQ5tBukzazotvB4JXZxc81M3V12Tdqds48/Taw
	4tN7lyv294qD+X6tdN/J4X/1DqPLGhmxp3Yd+b4m2iXue5qY/qdU37voKG59umfK+qz1wm+X
	WVpzqbO6OCwsPCKXnL+P6VEwn8uRNTuM73Ze8fSrjv/5rv74qbtFnxe/iL3zWsrcf+7kq+br
	jeebdxvtftTao3dlUwX3y5u9+yw187l2neNunrx8Vn50pkrF9ND4iImPCn46Wu/9XvPMrclh
	W776ui+uQRNr3T7PuHqT6/GFLwfXN8wWv+0mffr6zysKvEwlUws1OzirT4ZtYrn79d/VbTW1
	a+5VK7EUZyQaajEXFScCADlLNL05AwAA
X-CMS-MailID: 20250225132213eucas1p1b56c16b80858e30af1abcc1a31321c34
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250225115633eucas1p12d5b3bd5cf51d936b62edcd7323ddbcc
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250225115633eucas1p12d5b3bd5cf51d936b62edcd7323ddbcc
References: <20250225-retval-fixes-v1-0-078c4c98517a@linaro.org>
	<CGME20250225115633eucas1p12d5b3bd5cf51d936b62edcd7323ddbcc@eucas1p1.samsung.com>
	<20250225-retval-fixes-v1-1-078c4c98517a@linaro.org>

On 25.02.2025 12:56, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> During chip registration we should neither check the return value of
> gc->get_direction() nor hold the SRCU lock when calling it. The former
> is because pin controllers may have pins set to alternate functions and
> return errors from their get_direction() callbacks. That's alright - we
> should default to the safe INPUT state and not bail-out. The latter is
> not needed because we haven't registered the chip yet so there's nothing
> to protect against dynamic removal. In fact: we currently hit a lockdep
> splat. Revert to calling the gc->get_direction() callback directly not
> not checking its value.
>
> Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
> Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/81f890fc-6688-42f0-9756-567efc8bb97a@samsung.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpio/gpiolib.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e8678a6c82ea..31d400b10167 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1082,24 +1082,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>   
>   		desc->gdev = gdev;
>   
> -		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
> -			ret = gpiochip_get_direction(gc, desc_index);
> -			if (ret < 0)
> -				/*
> -				 * FIXME: Bail-out here once all GPIO drivers
> -				 * are updated to not return errors in
> -				 * situations that can be considered normal
> -				 * operation.
> -				 */
> -				dev_warn(&gdev->dev,
> -					 "%s: get_direction failed: %d\n",
> -					 __func__, ret);
> -
> -			assign_bit(FLAG_IS_OUT, &desc->flags, !ret);
> -		} else {
> +		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index))
> +			assign_bit(FLAG_IS_OUT, &desc->flags,
> +				   !gc->get_direction(gc, desc_index));
> +		else
>   			assign_bit(FLAG_IS_OUT,
>   				   &desc->flags, !gc->direction_input);
> -		}
>   	}
>   
>   	ret = of_gpiochip_add(gc);
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


