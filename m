Return-Path: <linux-gpio+bounces-16253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B1A3D461
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 10:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07F70189AE53
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 09:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1313F1B87EE;
	Thu, 20 Feb 2025 09:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="p0I3hHBs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32B5A944
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740043045; cv=none; b=NvBZDpeCCEnSQLkMIdoi/QIkRK+jPJitL2IqeNgFRNgWH7wfElqKqGqmhtkYf5DNy7A+v/xMY7aQ8O2k2oRAYI5P747oAo4lvXLpNvDCOnU9GkiL7c4VhwUk6nf/P+jTO7tfDFjU0IWE+8oBkZUJJhgKQ2LAuq4JL8kMB5qEkjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740043045; c=relaxed/simple;
	bh=2kMiQMwDmu+TpKqH3vJzl1TXaq0cOqosZpRyz3vb9I4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=sV6m+H6mh9Ui3dJ2FWP+N7JGtBcmm9rpCuEGeSuiHdR+xH+05g0x+FXoSO6zbqMyq1qOw9LSL9KOI4BegqkgNORK/JBkXD0hGdfOfsVEIUgel56nWmTi5z9PNgJrMeNI4Roi5L5R1QeTkZ1vICLdv56CxNmTbOjeXjaPIBeTH9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=p0I3hHBs; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250220091716euoutp024f68b46172852005e82a31985ec6eb49~l3_wq64ac2781927819euoutp02L
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 09:17:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250220091716euoutp024f68b46172852005e82a31985ec6eb49~l3_wq64ac2781927819euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740043036;
	bh=F1vpiZQoVlWORNPfr1nyX2VGjZ7zFarmF981B+AhjqU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=p0I3hHBs7TvOWPaoA2FTGOAvi7ZYS+YAhn/kAAoKYjJX9e1lnT2hX12ubYZ4IrxoZ
	 VXmLh8bRRwNenBHWiLf0SYFtQp9k4oscXDGpD6xWOIp/10wDLtM5ub2Y2iI44OjRf6
	 QKxlL1LBF4EtJ/E0Or52dmKORNNjh/DzjGwCqSZU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250220091715eucas1p20d323adea9b26a1b077c093c7731dedc~l3_wNIUL20453104531eucas1p2I;
	Thu, 20 Feb 2025 09:17:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 6D.65.20821.B13F6B76; Thu, 20
	Feb 2025 09:17:15 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250220091715eucas1p24b2c2cbea0b5b2bf9bd3fef1355da1fb~l3_v38T8J0240902409eucas1p2S;
	Thu, 20 Feb 2025 09:17:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250220091715eusmtrp21965f1890396e305e6f56475393cc266~l3_v3VYRm1444014440eusmtrp2O;
	Thu, 20 Feb 2025 09:17:15 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-6a-67b6f31b8cc9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 83.C7.19920.B13F6B76; Thu, 20
	Feb 2025 09:17:15 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250220091715eusmtip25b7a78ddd1028bab49f0cb9d5f0cff0d~l3_vYQ9MR0450704507eusmtip2N;
	Thu, 20 Feb 2025 09:17:15 +0000 (GMT)
Message-ID: <22224aa7-3af6-46f3-8d45-ddb8e5829fc5@samsung.com>
Date: Thu, 20 Feb 2025 10:17:14 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: don't bail out if get_direction() fails in
 gpiochip_add_data()
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz
	Golaszewski <bartosz.golaszewski@linaro.org>, Mark Brown
	<broonie@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250219144356.258635-1-brgl@bgdev.pl>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87rSn7elG3xfZW6x4tsaJotdD7ax
	WUx9+ITNYsqf5UwWm+f/YbS4vGsOmwObx+Jrt1k9Nq3qZPO4c20Pm8fnTXIBLFFcNimpOZll
	qUX6dglcGRu/b2YpuCFQ0b0lqYHxLG8XIyeHhICJxJ63F1m7GLk4hARWMEps/9jNDOF8YZRo
	u/qOHcL5zChxvOEMO0zLiy/voaqWM0qc2fqHBcL5yCjRcfwoWBWvgJ3E9j3vmEBsFgFViWdL
	brFBxAUlTs58wgJiiwrIS9y/NQOsXlggTmLijV1gcRGBYIkvT2+wgQxlFpjOKNHQeYYZJMEs
	IC5x68l8sKFsAoYSXW+7wIZyAp10uP80VI28xPa3c5ghTr3AIbFjXgaE7SLx+2EHC4QtLPHq
	+Baod2Qk/u8EmckFZLczSiz4fR/KmQC0+fktRogqa4k7534BbeMA2qApsX6XPkTYUeLs/g1M
	IGEJAT6JG28FIW7gk5i0bTozRJhXoqNNCKJaTWLW8XVwaw9euMQ8gVFpFlKwzELy5Swk38xC
	2LuAkWUVo3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYMI5/e/4px2Mc1991DvEyMTBeIhR
	goNZSYS3rX5LuhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeRftb04UE0hNLUrNTUwtSi2CyTByc
	Ug1MoocTCzLVkmX47zDv6Jpy0+hRwlzjZbF2LEfqNRbM0JRYGPT6yYo4FYlzHLnei07Ffeg/
	7LIwK9Hcdkq9Hqt5kcGHHU/Pps9+Pkn3b4/c11VLHQ4q+Vb6Gx3vUlx9tiPnWd2uHYpsqcKL
	99k8Lor4fLddrWt+Ztfhff1Cyhp/otTLC8VWHX4p0rMg3+HEqZoFuzeqLan1bN/sses//5bT
	wWEBaoccv2Q6HvHLa47/knnrJ9/68CcrSs2/ln+vsCxJDD3ONE91agrDhVt7g9bneRdtu33y
	x5sVKaKbQ/58EPSIZhNTlbs8YaXX7in/fyx7X5ajWyjy+n5IWWBjyzl1tpVrizRY44PmNiw/
	42+uxFKckWioxVxUnAgAqNt7M6cDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xe7rSn7elG/xeL2+x4tsaJotdD7ax
	WUx9+ITNYsqf5UwWm+f/YbS4vGsOmwObx+Jrt1k9Nq3qZPO4c20Pm8fnTXIBLFF6NkX5pSWp
	Chn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GRu/b2YpuCFQ0b0l
	qYHxLG8XIyeHhICJxIsv75m7GLk4hASWMkr8P7qdFSIhI3FyWgOULSzx51oXG0TRe0aJ1b9v
	s4AkeAXsJLbveccEYrMIqEo8W3KLDSIuKHFy5hOwGlEBeYn7t2awg9jCAnESE2/sAouLCARL
	LLrbyQgylFlgOqPExWWTWCE2tDNK9LX8ZASpYhYQl7j1ZD7YBjYBQ4mut11gGziB7j7cf5oZ
	osZMomtrF1S9vMT2t3OYJzAKzUJyyCwko2YhaZmFpGUBI8sqRpHU0uLc9NxiQ73ixNzi0rx0
	veT83E2MwBjbduzn5h2M81591DvEyMTBeIhRgoNZSYS3rX5LuhBvSmJlVWpRfnxRaU5q8SFG
	U2BoTGSWEk3OB0Z5Xkm8oZmBqaGJmaWBqaWZsZI4r9vl82lCAumJJanZqakFqUUwfUwcnFIN
	TIsmxjHoPeCL/+z2onCvuW3Ny1PWG0rka/ftu8fMWbsn9WN94Zezb9/M3f34T/tvq88s4XpM
	umkG4i2s6u1nC7l61n2PmyHj3cy9572j4MNTx1avZGf1qJxhJaWw4aby0Yf7X6ZNWrg+mfnq
	s+LSNZZaDfKn/Q9fUU74E6i/ao7AxmqfmS+TjvFFPP2+XODavDcT+BU71ytM/K+ddM3sx4Xr
	RayPmILSDv06HeXvdyaFnXN60OaChvt8a9SYyhk6/Gy/tC+bdoxRVWvdwcffGjackJ3n83pn
	17P1081M84UuBqfNadfaXW3h+67kVRrr1G85ods2ta2J1vRpP7l1pdCfIoPPuYkZQYuDgsom
	CSmxFGckGmoxFxUnAgBu3Rx6OgMAAA==
X-CMS-MailID: 20250220091715eucas1p24b2c2cbea0b5b2bf9bd3fef1355da1fb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219144407eucas1p239a17ed94ec6c6467a2b00bab8abb7b8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219144407eucas1p239a17ed94ec6c6467a2b00bab8abb7b8
References: <CGME20250219144407eucas1p239a17ed94ec6c6467a2b00bab8abb7b8@eucas1p2.samsung.com>
	<20250219144356.258635-1-brgl@bgdev.pl>

On 19.02.2025 15:43, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Since commit 9d846b1aebbe ("gpiolib: check the return value of
> gpio_chip::get_direction()") we check the return value of the
> get_direction() callback as per its API contract. Some drivers have been
> observed to fail to register now as they may call get_direction() in
> gpiochip_add_data() in contexts where it has always silently failed.
> Until we audit all drivers, replace the bail-out to a kernel log
> warning.
>
> Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/all/Z7VFB1nST6lbmBIo@finisterre.sirena.org.uk/
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/dfe03f88-407e-4ef1-ad30-42db53bbd4e4@samsung.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

This fixes the issue observed on RPi boards without any changes to 
gpio/pinctrl driver.

> ---
>   drivers/gpio/gpiolib.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 704452fd94bb..48cf1bb23e24 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1060,7 +1060,15 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>   		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
>   			ret = gc->get_direction(gc, desc_index);
>   			if (ret < 0)
> -				goto err_cleanup_desc_srcu;
> +				/*
> +				 * FIXME: Bail-out here once all GPIO drivers
> +				 * are updated to not return errors in
> +				 * situations that can be considered normal
> +				 * operation.
> +				 */
> +				dev_warn(&gdev->dev,
> +					 "%s: get_direction failed: %d\n",
> +					 __func__, ret);
>   
>   			assign_bit(FLAG_IS_OUT, &desc->flags, !ret);
>   		} else {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


