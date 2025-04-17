Return-Path: <linux-gpio+bounces-19049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B006BA92E68
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 01:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1387A3BD5BA
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 23:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974EC221F3C;
	Thu, 17 Apr 2025 23:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ENi+ZJFo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BDE20E02A;
	Thu, 17 Apr 2025 23:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744932925; cv=none; b=n4wpmb6FHBGTGAaiWzlsxrXGsFqQvQYumc2wtKQ8ngT7GYjT+fLjOvMZHevQk0UxjVeAvR8ES3CHdaKM4hEMBMJcj9Vtj1l2R0W+ygkmqoa44SRgi4338otajczS4KY4KGWDS6t7AWhADgROLb2abrMzHjleNR0ek7CnWWlnu1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744932925; c=relaxed/simple;
	bh=yu2WcPkCWpEqJHnu1d9EYDYNiCIkHjWg5qJnAT3Azjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBhNx6EPCPaK+N572ZpVsyYdB0wnT/KwH91tQ/cg2qYFMEJGlJUwLGS82J7Ev852cgGR7p6VzNU+vXtuZOV4egtynLZwrzK1x2L65pGb6/1gDfw2/VlSzRMIViCbqTvk9D2GQniroQWu4a5tAeXAbWCC66Gvir6H5FAghTGXgd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ENi+ZJFo; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=VtcMdF8gxbTHk/LC9eEXRqRUlIXdlnuF5wPcur50ThA=; b=ENi+ZJFovvBk9ijcoUMTl8T6+L
	aDHjxRpFn4mFZL11kE1KSgP0zZo2r6g1GJpdR/0aDJvfRTYfKghw23fZzvQ5TUkS3MlUoil72W/7I
	0NX9q1E0aUXNgzFUDmVtz4jyQTD61P7RCyWtivfwpkCTdX0x3z0VhQ4sRMDM0seimfU0AoQS340T0
	Bwem1X7/2GULo0J+gd8GaCPJVDYoauibYzN7fTsN7iSNewtChihAMMIvxK8nuyk3W/swpUuyoIMde
	vI2Xe5J3+EkPm7npx1WNaJ4NMjr7V1DrcqA28d5KNyDodYGNEaHsqwmjsBkVHSXvyCjFr+h830WeK
	hmK5yfhg==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YlL-0000000Bq5Q-2OdL;
	Thu, 17 Apr 2025 23:35:21 +0000
Message-ID: <17c0d17c-bcff-4b40-b0ae-f863ee91655f@infradead.org>
Date: Thu, 17 Apr 2025 16:35:14 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 17 (drivers/gpio/Kconfig)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250417174117.014a23d2@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250417174117.014a23d2@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/17/25 12:41 AM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next releases tomorrow or Monday, next
> Friday.
> 
> Changes since 20250416:
> 

on x86_64:

WARNING: unmet direct dependencies detected for OF_GPIO
  Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
  Selected by [y]:
  - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])

WARNING: unmet direct dependencies detected for GPIO_SYSCON
  Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
  Selected by [y]:
  - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])


COMPILE_TEST=y
OF=n


-- 
~Randy


