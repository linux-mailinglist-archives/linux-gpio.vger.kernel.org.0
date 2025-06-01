Return-Path: <linux-gpio+bounces-20840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80867AC9DFC
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 09:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83FBE3B3647
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 07:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D490219DF5F;
	Sun,  1 Jun 2025 07:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ymSV42HN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684B017A30F;
	Sun,  1 Jun 2025 07:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763452; cv=none; b=ICyvoQoDCxx3NoSqcUOwoppZbFbw+vyw/pAvHUmAhteIfprxmsmfSmZkdJV/qg5IoIBSZuDUsFQRCDpYrKPfSyrzY/1HMcBiJT2060VBZwKAjjXO4fxKEnPRwf9+zcf5crBQAraiS5wHczBO+6iF7q3GEAQM26t/sclzIxHMXtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763452; c=relaxed/simple;
	bh=tyGsOVSDYorh9HaW+EfaNB/Fo+Bsp+pz+XBA+8J64Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNvbUKJ0GSJDlHj8D+g0QRORoJLq68FFOh1z1lmZbSn+mJRwWy3xvOxcEI/D24Q0wJFuLHUmHGGPIQVLR2HVfJ1CA1v4opxd4HOjF/LJmlHMhnjPj0nJL9XnSpqzl1ZKzLOXbLKYj63348hnxe+5NqlfJATx3p796zJyTaE8D9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ymSV42HN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487FCC4CEE7;
	Sun,  1 Jun 2025 07:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748763450;
	bh=tyGsOVSDYorh9HaW+EfaNB/Fo+Bsp+pz+XBA+8J64Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ymSV42HNxbQxqmaZXfZpjwNSu5HsUm4XwTm4xBmc+V5rmLm3OPUH8Kqx86fC2CoGn
	 qLyRAvBmsYKgxu7Se7n8VbrFXZ1aZO1YZ3kUdOkehgR5IU/jjH1q5FgUVFdkSAEYcm
	 f6pAsPXQxGN1WrLwwyHOKmTSOFvODJkIoOk6n92w=
Date: Sun, 1 Jun 2025 09:37:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v1 1/2] usb: gadget: pxa25x_udc: Switch to use
 devm_gpio_request_one()
Message-ID: <2025060110-smooth-flatten-590f@gregkh>
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
 <20250531212331.3635269-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531212331.3635269-2-andriy.shevchenko@linux.intel.com>

On Sun, Jun 01, 2025 at 12:21:38AM +0300, Andy Shevchenko wrote:
> devm_gpio_request() is going to be removed. This driver is only user of that
> API. Convert it to use different API.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/gadget/udc/pxa25x_udc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

