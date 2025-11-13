Return-Path: <linux-gpio+bounces-28418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7E3C54E94
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 01:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 562A9346713
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 00:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE243B1BD;
	Thu, 13 Nov 2025 00:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A4bARZzk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B5218B0A;
	Thu, 13 Nov 2025 00:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762993963; cv=none; b=Wub0dCSXu62/jV3ViUwjNT0pKVBm8efgw7XAOY67YgcAPRtJt6kteh0DYyUckar07RWAQNlwgQCAVGDgvAKvfqc+Sl95QVn1w+3jkCx+u0vyyXyEOF2ASLy7kMWvaXHVgHJ4vhNAUWR7r9hSq5TELJRr6dYOEerAk/goY03tcvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762993963; c=relaxed/simple;
	bh=m/+r9aGxJvEn7xkVNj8FDtFlt7hWIeI90pRuJKP7cIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFCV1gEf76d4MiDQs+A4HblnNWkWjxlALQwkvdQ9B0g9pdX99gBZ0NOVDzNwvY5iWAP9bMbQvMzxSbwD+f76o8zGAHj2UJ8e68/iODKjW6LdZ5DHAp3aJDC1tiy218XcsxBItNXNta7/uRCDfOvFzteWIGw0RiIMXeGEixqFnYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=A4bARZzk; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3FeclHIMfmP0p5yi4YgVnpfMuDANY93EGTrbRzcQEog=; b=A4bARZzkjhEc4B94Bse4UFyY7e
	uBjBc+DcEEHJelPd7qEh+Py8k1o2/cbcuwfVtu6nLD8SXo3qAREz5jKZhMFlKOs92qM+W6TXrpf3U
	ojnFK0kFWGVzXiGrhHdqixnB1IPUnD0nzxLkqyWOzHUF7VuAml3PODvFAF7YD60aQk6BQIF5khvDA
	AKpk17AQ9wcb6QjvlbjAfUUfA/y5iYEIQ2F1JwbufqFgTWrMKtEig0TS6jfr7m0fl+WTl8ECocCGh
	QeyWteT/9oO500Oj/efpJDtzkb6N+hu9DZgt/C4s3NHfqw5t2T2zjuIesY/5s1NyzU7WWf191v6Zz
	NjZkB71A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJLGQ-00000009dUo-3ROc;
	Thu, 13 Nov 2025 00:32:38 +0000
Message-ID: <da641dee-0481-4392-aeb2-1573239d2fb3@infradead.org>
Date: Wed, 12 Nov 2025 16:32:38 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and
 feature list for PCA953x
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Levente_R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/12/25 2:48 PM, Andy Shevchenko wrote:
> From: Levente Révész <levente.revesz@eilabs.com>
> 
> I went through all the datasheets and created this note listing
> chip functions and register layouts.
> 
> Signed-off-by: Levente Révész <levente.revesz@eilabs.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> inline reply --> v1: made a formal patch, converted to reST format
> 
>  Documentation/driver-api/gpio/index.rst   |   1 +
>  Documentation/driver-api/gpio/pca953x.rst | 552 ++++++++++++++++++++++
>  2 files changed, 553 insertions(+)
>  create mode 100644 Documentation/driver-api/gpio/pca953x.rst

Wowsa. That's a lot of info.

Looks good. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

