Return-Path: <linux-gpio+bounces-32369-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMcoIzVUpWnR9AUAu9opvQ
	(envelope-from <linux-gpio+bounces-32369-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:11:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF9C1D5555
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06CA43031AD1
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E244B38CFFE;
	Mon,  2 Mar 2026 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="T7n1/OJY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4BE3376A9
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442496; cv=none; b=rhVYm1tHpw1djY6BgxkpJL+wFAHZTulfmM4pexaPURFefJsHZpc8IAcRnwbs+UaHnSa0/SXXA8rCIpxIPgs7xvcjpaoDJVUER799w5hpE453i43PFIBDCZOwsFFpiCy1D+yLT4IM9jk39m5cW8AKc9G8EmkX88yq+v5W5liEqV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442496; c=relaxed/simple;
	bh=fxFHlAjnoPCo6VvjZDSdWL3uK5Vfnw8T/4D++TzpOqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=QjNsUH0IsZlsv/HV6XXijA4xtu/7P0NHXpq/5VZRyev/ev1qZzY2zbMkATSyo7dYckpGVuVDS+GiUQKzMpw8gvxxP6vuv7eg8pV1eAaTJVyob7SCfp0rPRV1vNrieogq4KuAvAGvMQSVpeos05rTQwRbRukEFYx38KeW1VC0wn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=T7n1/OJY; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260302090806euoutp02c4e22714297309c69203d297b1de35dc~Y_w0M0C0U2309823098euoutp02B
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 09:08:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260302090806euoutp02c4e22714297309c69203d297b1de35dc~Y_w0M0C0U2309823098euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1772442486;
	bh=Ai2dOvOVRVVKUuflEzxhN3/sTsEiQpOTLnNvNlY3510=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=T7n1/OJYDFt+AI0ihYeP0Wlxo0IAQi1pePkAhHzBiQgRil4XI/6vQLyGcytm7OpTW
	 ytBxDTBfxR2aer69NEO7bFKBBicb5mHxs6CNLt6iNvZ5oBgel6yVggl7rnce7umvdk
	 RzAWwDOxPPMXjnZ//TFKH7tsQrdB4UN28+WvZFNM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260302090806eucas1p15686744857ca873135b57febcc3843fa~Y_wz3YHiq2681326813eucas1p1e;
	Mon,  2 Mar 2026 09:08:06 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260302090806eusmtip2cef48814219a002b980f8498c00cbf1c~Y_wzkC9Ey1533915339eusmtip2Z;
	Mon,  2 Mar 2026 09:08:06 +0000 (GMT)
Message-ID: <caadf265-062e-47ff-a40e-ca4243f41157@samsung.com>
Date: Mon, 2 Mar 2026 10:08:05 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] gpio: Fix lockdep warnings in
 gpiolib_{cdev,sysfs}_register()
To: Tzung-Bi Shih <tzungbi@kernel.org>, Bartosz Golaszewski
	<brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260228131430.102388-1-tzungbi@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260302090806eucas1p15686744857ca873135b57febcc3843fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260228131459eucas1p1b5deb465c52d0990a6920b0d8981975f
X-EPHeader: CA
X-CMS-RootMailID: 20260228131459eucas1p1b5deb465c52d0990a6920b0d8981975f
References: <CGME20260228131459eucas1p1b5deb465c52d0990a6920b0d8981975f@eucas1p1.samsung.com>
	<20260228131430.102388-1-tzungbi@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32369-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,samsung.com:mid,samsung.com:dkim,samsung.com:email]
X-Rspamd-Queue-Id: 1EF9C1D5555
X-Rspamd-Action: no action

On 28.02.2026 14:14, Tzung-Bi Shih wrote:
> A lockdep warning is reported in gpiolib-cdev driver:
>
>    WARNING: drivers/gpio/gpiolib-cdev.c:2735 at
>    gpiolib_cdev_register+0x114/0x140, CPU#1: swapper/0/1
>    Modules linked in:
>    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
>    7.0.0-rc1-next-20260227-00065-g6af4b9cfeded #12259 PREEMPT
>    Hardware name: Samsung Exynos (Flattened Device Tree)
>    Call trace:
>      unwind_backtrace from show_stack+0x10/0x14
>      show_stack from dump_stack_lvl+0x68/0x88
>      dump_stack_lvl from __warn+0x94/0x210
>      __warn from warn_slowpath_fmt+0x1b0/0x1bc
>      warn_slowpath_fmt from gpiolib_cdev_register+0x114/0x140
>      gpiolib_cdev_register from gpiochip_setup_dev+0x4c/0xd0
>      gpiochip_setup_dev from gpiochip_add_data_with_key+0x960/0xad4
>      gpiochip_add_data_with_key from devm_gpiochip_add_data_with_key+0x20/0x5c
>
> This is because the SRCU wasn't held in gpiolib_cdev_register() when the
> caller is from gpiochip_add_data_with_key() instead of
> gpiochip_setup_devs().  gpiochip_sysfs_register() shares the similar
> concern.
>
> Given that both gpiolib_cdev_register() and gpiochip_sysfs_register()
> are only called from gpiolib but no external users.  Remove the lockdep
> checks to fix the warnings.
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/506ce9b3-d492-4fce-9d02-330e411911e2@samsung.com/
> Fixes: cf674f1a0c98 ("gpio: Ensure struct gpio_chip for gpiochip_setup_dev()")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   drivers/gpio/gpiolib-cdev.c  | 2 --
>   drivers/gpio/gpiolib-sysfs.c | 2 --
>   2 files changed, 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 7ebdb4993a74..f36b7c06996d 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2732,8 +2732,6 @@ int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
>   	struct gpio_device *gdev = gc->gpiodev;
>   	int ret;
>   
> -	lockdep_assert_held(&gdev->srcu);
> -
>   	cdev_init(&gdev->chrdev, &gpio_fileops);
>   	gdev->chrdev.owner = THIS_MODULE;
>   	gdev->dev.devt = MKDEV(MAJOR(devt), gdev->id);
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 748a3eb1bf35..fc06b0c2881b 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -990,8 +990,6 @@ int gpiochip_sysfs_register(struct gpio_chip *gc)
>   	struct device *parent;
>   	int err;
>   
> -	lockdep_assert_held(&gdev->srcu);
> -
>   	/*
>   	 * Many systems add gpio chips for SOC support very early,
>   	 * before driver model support is available.  In those cases we

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


