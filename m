Return-Path: <linux-gpio+bounces-20512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 767EDAC1BC7
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 07:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7AE81B660A2
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 05:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB572222C4;
	Fri, 23 May 2025 05:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="AP50QTXo";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="AP50QTXo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4132DCBE6;
	Fri, 23 May 2025 05:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747977809; cv=none; b=n6f+tyoWw/QsIryH0odZqraxiuAXDMMc/gBU3WiP17jtm/pdgijNeBZfHtTbCc38hCCJNez8JsflvzFTho/+hAU/gp/q4RSxmZVZfxMbfdz72/tMpSKw+J7R13Nf5eWkMArDlki1xjEDdsSVv3IrYNJ3MEqGP5aC7na6jRfuiBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747977809; c=relaxed/simple;
	bh=80uw1jtsGwj/gVLOr/qpryNr7XC5WgtbEKNJMb6eUdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/6lchw7170u+bynBxzf4LbCCtX9d1mACcsjZe//WD3BXT5fd6egRVIEGImJ3mwTidk9qAxp0pr+nR5EL9qwD/o1mzru+ZtB9ahHzDw1A6AnBRNYbJvU6MXRG7W7ZLXEaBnngjc892Z2T+Yofy8rAi3zet9WubB2i0/YBEwkJBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=AP50QTXo; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=AP50QTXo; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1747977798; bh=80uw1jtsGwj/gVLOr/qpryNr7XC5WgtbEKNJMb6eUdA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AP50QTXomI2u5Pop2hS2ZUPAfeqqkxe6DqgFo7B0yUSQ2pC7zaUh1KAnq4an2K3s3
	 CaqhkbP5WuK5qAS2YZB72wo/z+5u7CKf8+RhNAOcm2Rk1M7dtmxXd/zDbzTSIc8U+2
	 Oyp0nPVrB267Ch6rxr/5bwzf5dUaLRVeaDc1zvpl/2VFd8Ty+F09lGE4qxJqL4xLBR
	 4hE90LeGHk4Jg/2edUdkd6IO4jzd8VHT/PDGWa5hhBUHV/4m37eUuxrS0htjPMswBI
	 MDCiZRu4uiFi/1bI4X9RySUaUtGO798TXnUjEwJjvShnQn3Ni49G3yHdxKYc0aeSyH
	 YFxClyECtcvyA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id BC61E3BC59C;
	Fri, 23 May 2025 05:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1747977798; bh=80uw1jtsGwj/gVLOr/qpryNr7XC5WgtbEKNJMb6eUdA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AP50QTXomI2u5Pop2hS2ZUPAfeqqkxe6DqgFo7B0yUSQ2pC7zaUh1KAnq4an2K3s3
	 CaqhkbP5WuK5qAS2YZB72wo/z+5u7CKf8+RhNAOcm2Rk1M7dtmxXd/zDbzTSIc8U+2
	 Oyp0nPVrB267Ch6rxr/5bwzf5dUaLRVeaDc1zvpl/2VFd8Ty+F09lGE4qxJqL4xLBR
	 4hE90LeGHk4Jg/2edUdkd6IO4jzd8VHT/PDGWa5hhBUHV/4m37eUuxrS0htjPMswBI
	 MDCiZRu4uiFi/1bI4X9RySUaUtGO798TXnUjEwJjvShnQn3Ni49G3yHdxKYc0aeSyH
	 YFxClyECtcvyA==
Message-ID: <13217ada-43e0-449b-b623-98f7adde75a2@mleia.com>
Date: Fri, 23 May 2025 08:23:17 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] gpio: lpc18xx: select GPIOLIB_IRQCHIP
Content-Language: ru-RU
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
 <20250522-gpio-fix-v1-3-98ceae7c4c3c@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250522-gpio-fix-v1-3-98ceae7c4c3c@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250523_052318_785453_CD22CDA5 
X-CRM114-Status: UNSURE (   4.82  )
X-CRM114-Notice: Please train this message. 

On 5/22/25 10:11, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
> are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.
> 
> Fixes: 289e42df1358 ("gpio: lpc18xx: Make irq_chip immutable")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

