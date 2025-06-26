Return-Path: <linux-gpio+bounces-22238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A9AE9399
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 03:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 390E96A3D19
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 01:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919A1191499;
	Thu, 26 Jun 2025 01:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="XqCIrPLS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353E318035;
	Thu, 26 Jun 2025 01:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750900352; cv=none; b=MtLOm2mJ5N282x+vkm7x0hQxCAFM1ch90tvIt0cYxwIZhiqy71TrpxitxLxD/oRTDoXbd1jacGEhmNHyevAuSjgWHr1xcriDZBbFaI2kE+AJI3cLDK0qbCkyIcDekoCbUiNNK/Q2Wi4xlpCo6zlKiRsWV+BAd7DLD5fP26PFFl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750900352; c=relaxed/simple;
	bh=H8XFOLm3w9x3qldoGQXykKndSSSvhlkE+OfO1aEGwm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nO9GnP/Cf1dhufFzkkx1ESZZCHgY4HeanpZGj23X75toSbQO4H2/vRpI6NV20bEzIiCqAmq+of39TlrMMRR2DbGYUQrfSgsssqHlliGjVFGPTSHys9AA6SwjArXaoyVYIyIqMwh4k/xFjDVgHX5qtVwHYMfHe6yZN/NXERc2a3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=XqCIrPLS; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750900341; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=XkNAUQZsgTOYyEpp6DFNDFEm1Y8rPk4V1hWAnUJpQCA=;
	b=XqCIrPLS8NVMkflbkLbfTqGHIGrbm0qsufim7MUZ9p+BNuyHzYt+SioGXkDCMGM7alSIvveeNU1ERrRFO0SE+jVv3+btRx6+g0CsnB4kiFM1jFfdHthB9kvVAAih6QDSdMwSWKNAwiC3nU59mRIWURkJ2UOQ5ps7Mus4yrQwy48=
Received: from 30.74.144.111(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wf4LWO5_1750900339 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Jun 2025 09:12:20 +0800
Message-ID: <4a7606bc-8ab3-4026-8bf8-eb875bdcb00c@linux.alibaba.com>
Date: Thu, 26 Jun 2025 09:12:18 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] gpio: sprd: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-7-bc110a3b52ff@linaro.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-7-bc110a3b52ff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/25 18:33, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

