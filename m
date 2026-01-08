Return-Path: <linux-gpio+bounces-30263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB68D040D8
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 16:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AE1932E13FF
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 15:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6EC4B7136;
	Thu,  8 Jan 2026 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Uw1Fklrf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1494B7129
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868281; cv=none; b=KHfvwR03K86X9ArPzDVJVHg8y3ZpuBVFm/rfS8+5XiY/IDtGNbx6px13sXr+tsMzt9eOLYafFQVzVDGUgiUH5UhU5+O8HhljV4zYNdy/e42nqPTqsOqt7TAno/bQ1IkZxe2KmuzKfKQlWwfj11P7zCa8OFf2quwC0IkNA3NNQ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868281; c=relaxed/simple;
	bh=WjMDQIKpg7jBcOgP8J+2SBS55drFnxG2/PUWLE0iuP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ZDAQOqcaHb4z15scE6CTMuxumITbHSiXbqffzvAWd9uLr/FDIInoysHb9KQJPC1gG2P3wiAvNh2cumVeXDRzUnm5twT4HeXXBU5Yod3gkUKMKDRTWQEfdqzCLXFHzIkY2gThNlv6Uep9lmzNL4AXFAElVwaJwMRlpvbMrgA3h0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Uw1Fklrf; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260108103115euoutp015fb57a6bd51100e5851b0f6141b560bb~IutR6OMdz2855228552euoutp01b
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 10:31:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260108103115euoutp015fb57a6bd51100e5851b0f6141b560bb~IutR6OMdz2855228552euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767868275;
	bh=a1HTLMyM51weT/4dHbcu49LXEtAtqKJ/YTI6ZBmnq3U=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Uw1FklrfnxL4ic0skDwsKqyz5ad0cPhIy3PwKOCQTK7YXtastNJKIkCalUGDy+w6B
	 mN/mRUApKfXAnM/fmPpRvVW2oY9rOgUUGbiDgRBILY+w5OegnNkbz2A7t03MnBnVEt
	 uQBfZ8SYTBTkt47j3p++q/ZEUpMO1cKhPVPvB6dM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260108103114eucas1p21eaaa1f177aad2539b3b0740aff1b6dd~IutRYkdfQ2114221142eucas1p2J;
	Thu,  8 Jan 2026 10:31:14 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260108103114eusmtip19c06b9724a2eeedf50fe73284487a3d0~IutRER2943042730427eusmtip1r;
	Thu,  8 Jan 2026 10:31:14 +0000 (GMT)
Message-ID: <b03f3d6f-cb29-4f14-878b-c3a060c0745d@samsung.com>
Date: Thu, 8 Jan 2026 11:31:13 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] gpiolib: fix lookup table matching
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus
	Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Konrad
	Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260108102314.18816-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260108103114eucas1p21eaaa1f177aad2539b3b0740aff1b6dd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260108102327eucas1p1441a46ec3d1be1e9eaee611959014de3
X-EPHeader: CA
X-CMS-RootMailID: 20260108102327eucas1p1441a46ec3d1be1e9eaee611959014de3
References: <CGME20260108102327eucas1p1441a46ec3d1be1e9eaee611959014de3@eucas1p1.samsung.com>
	<20260108102314.18816-1-bartosz.golaszewski@oss.qualcomm.com>

On 08.01.2026 11:23, Bartosz Golaszewski wrote:
> If on any iteration in gpiod_find(), gpio_desc_table_match() returns
> NULL (which is normal and expected), we never reinitialize desc back to
> ERR_PTR(-ENOENT) and if we don't find a match later on, we will return
> NULL causing a NULL-pointer dereference in users not expecting it. Don't
> initialize desc, but return ERR_PTR(-ENOENT) explicitly at the end of
> the function.
>
> Fixes: 9700b0fccf38 ("gpiolib: allow multiple lookup tables per consumer")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/gpio/gpiolib.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index fc382f43f9fc..0a14085f3871 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4602,8 +4602,8 @@ static struct gpio_desc *gpio_desc_table_match(struct device *dev, const char *c
>   static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
>   				    unsigned int idx, unsigned long *flags)
>   {
> -	struct gpio_desc *desc = ERR_PTR(-ENOENT);
>   	struct gpiod_lookup_table *table;
> +	struct gpio_desc *desc;
>   
>   	guard(mutex)(&gpio_lookup_lock);
>   
> @@ -4619,7 +4619,7 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
>   		return desc;
>   	}
>   
> -	return desc;
> +	return ERR_PTR(-ENOENT);
>   }
>   
>   static int platform_gpio_count(struct device *dev, const char *con_id)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


