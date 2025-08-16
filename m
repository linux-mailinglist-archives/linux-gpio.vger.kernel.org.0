Return-Path: <linux-gpio+bounces-24463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9CEB290DD
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 00:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B06665A70A2
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 22:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4707A22FF35;
	Sat, 16 Aug 2025 22:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jX2O/3Yd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC941F37D3;
	Sat, 16 Aug 2025 22:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755382909; cv=none; b=Ucpus5TGLJPmPeY+qWu1+zwsVpNr/QYDjnFebpoWZaq0M6FIvUyIsJcwFHPAV8OotL7R0MCcZPemJXxQmI3KPTyBTJqw7GH1TmC4pPXLdAmrzrUEQ1re43pRTeSGSoFrRKt1p+XCZr25/Lrto+F8rxOHjGinK6LQaipm/mOkmgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755382909; c=relaxed/simple;
	bh=POZiiRoW0Q95mTqicGqW7rCGIZPQgbxHRe6//YklMyI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pznMfA9EfgPltPFX57ucj7Ed+r33WTRN0EmWkEgw5MQopSMpKyXeaoaMA1kv5f4p7h3ktZcoY7g498PAjT0fx6cFF2MJZUPvHvwkrvzE9lS6suv+ry5t5CpOVi/B84rtKuDfaFuJuCWNATn8Y171hcrCncxon1zelrujDKJz8NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jX2O/3Yd; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=a3h+69WsCBuWOsitu6hH7djSGpiTv/oInvE97Mi8riA=; b=jX2O/3YdRSnE4idaXPusOKGsO9
	mPoGLxzHBGGgrZ/c7xEA5AO7K0bCg6YZxLCYi0ij+PVbvITKJwureKzp7M0CUKkrck9vRP08Pf+Jm
	ltoblZV1+mDLTdc1YaPl4AdTQVI/LCeE1fBUyWZfcG7aukPoKi/oH9V6wPqVYcDWcwoHWsOZod+Ir
	NLxcCZAhjl/hoonev6kFIsBJr61lgLkip6j0XjRIIgGz4E4iVKS9wW6ftSL8+2cR3FdbhduT1rAoQ
	Ft+AyJBvBYUKU9652ZnEPh3Cm+U07r/jLECxJjspydQdEeM930TpYwf0IKA42ecAB2FFZIpiT2idw
	P6hSxFcQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unPHV-00000005CAZ-0q6V;
	Sat, 16 Aug 2025 22:21:46 +0000
Message-ID: <f93c26c6-c390-46d4-bdd1-4d2f0e03e63d@infradead.org>
Date: Sat, 16 Aug 2025 15:21:44 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: gpio: add documentation about using
 software nodes
From: Randy Dunlap <rdunlap@infradead.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ce4pjordujfvaujjgxruszba7ivoywex32rfwzeiil2zcdlgl5@lt4vvv4yalzm>
 <8bdf668d-c120-4ed5-a0f4-fe8c0876c8d2@infradead.org>
Content-Language: en-US
In-Reply-To: <8bdf668d-c120-4ed5-a0f4-fe8c0876c8d2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/16/25 3:08 PM, Randy Dunlap wrote:
> Hi,
> 
> I have a few more nits...
> 
> 
> On 8/15/25 10:30 AM, Dmitry Torokhov wrote:
>> Introduce documentation regarding use of software nodes to describe
>> GPIOs on legacy boards that have not been converted to device tree.
>>
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> ---
>>
>> v2: Addressed Randy's comments.
>>
>>  Documentation/driver-api/gpio/board.rst       |  65 ++++
>>  Documentation/driver-api/gpio/index.rst       |   1 +
>>  .../driver-api/gpio/legacy-boards.rst         | 298 ++++++++++++++++++
>>  3 files changed, 364 insertions(+)
>>


> Overall, this looks good. Thanks.
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

I also tested the docs build and it looks good.

Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

