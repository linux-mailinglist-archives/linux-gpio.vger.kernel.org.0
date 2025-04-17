Return-Path: <linux-gpio+bounces-19048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DED1A92E64
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 01:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80C7D7A4AD2
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 23:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E4A221563;
	Thu, 17 Apr 2025 23:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="thYIlQJ7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD5A20896E;
	Thu, 17 Apr 2025 23:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744932795; cv=none; b=FFbVxoNu9zQoXYJBxO3ExR4jTEPs5AnLwF1o+jkIfWPxm69N8jrvPbrhqQiF+g0c78cizScpvD4rjLC0DBMTWiOz1cV8e90c1vhHdtXJtr0bkFcGA36FnJX/yHPIjdDHV9K86fHMD6TwHgKXaHvgXAA7+FnsNqQoUaqL7LG2zWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744932795; c=relaxed/simple;
	bh=erZofjZhCWmZmRiwoxBvNBUbwiHNIsVy4EpyGf6PUVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QyeJAP1qUrPI6ANXEJcGlpYKxAi5AD2sCk45gZXwVnwFbFZ+hlPb5IiFnvOGLlEq3+xet2/PL3GrVH4dt4Qhr4gCZUjM2WOm2ejgrsYpaU0Zqu4X7FWGQP5yVm41aSucMt7lJ+v3BH0lGzf7B8yAR8Dv8LQFnr5tr8eMra3HzoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=thYIlQJ7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=tGvXsJp/LowZicDO/bSfzJCHWFfJAHzlFFxjaLMPbDQ=; b=thYIlQJ7VkCBcw8BfHqh/4KjzR
	TWN2oAUvkZ9h8rSC0mZgEOQ9jZ8LzhZNj9dc5ZbRHLrEU4aDaxgUti4rkUbxf8tGYfZfj8Q5ANn8u
	x5q7SDFesLmNOD2qhDylDrEimxtTetBL/q4cVQcqUL4h6rvt0eUnaP/0/H7LVtgow5tLFFThfftk1
	9xC3EinUBJeqtvojeIMoDRWwxbp7Qlv9xnIgBdnMcNWzZMu3zckKobPXSgnifhOwPImSIn8eCkIH8
	Cmeh/xAy4tCIcjYob2XR/F+Obzc9HD5zg1x5cInLZF/Xq3ktKE6DWUMluEQkhkyCfKsmpXDo7U9tx
	87ltfq+w==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YeK-0000000Bpcf-1whY;
	Thu, 17 Apr 2025 23:28:06 +0000
Message-ID: <b0450e23-2556-489f-8f4e-cca7aed9d975@infradead.org>
Date: Thu, 17 Apr 2025 16:28:01 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 17 (drivers/pinctrl/pinctrl-sx150x.o)
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
CONFIG_PINCTRL_SX150X=y
CONFIG_I2C=m
CONFIG_COMPILE_TEST=y


ld: drivers/pinctrl/pinctrl-sx150x.o: in function `sx150x_regmap_reg_read':
/home/rdunlap/lnx/next/linux-next-20250417/X64/drivers/pinctrl/pinctrl-sx150x.c:1061:(.text+0xff2): undefined reference to `i2c_smbus_read_byte_data'
ld: drivers/pinctrl/pinctrl-sx150x.o: in function `sx150x_probe':
/home/rdunlap/lnx/next/linux-next-20250417/X64/drivers/pinctrl/pinctrl-sx150x.c:1138:(.text+0x12ce): undefined reference to `i2c_get_match_data'
ld: drivers/pinctrl/pinctrl-sx150x.o: in function `sx150x_regmap_reg_write':
/home/rdunlap/lnx/next/linux-next-20250417/X64/drivers/pinctrl/pinctrl-sx150x.c:1087:(.text+0x22cf): undefined reference to `i2c_smbus_write_byte_data'
ld: drivers/pinctrl/pinctrl-sx150x.o: in function `sx150x_init':
/home/rdunlap/lnx/next/linux-next-20250417/X64/drivers/pinctrl/pinctrl-sx150x.c:1266:(.init.text+0xa): undefined reference to `i2c_register_driver'



-- 
~Randy


