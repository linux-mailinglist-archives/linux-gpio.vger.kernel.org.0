Return-Path: <linux-gpio+bounces-12561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C999BCCAE
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 13:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A9031F2206D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 12:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5EF1D54E3;
	Tue,  5 Nov 2024 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HPEAw8tb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BDF1C3025;
	Tue,  5 Nov 2024 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730809584; cv=none; b=lUO80Di0LxS6g1OJiMIXzk7DxfooO6QCoIHUq5hst3rs6vtlFBsMYvHGlUt1DWIlsVm7X1lEKQrWoZ+L2sWvt1EnZuKdFJuqpmWcK+zfjFgCK7iRuifl6A5wMKZYm6az8rsPBsDjP1fZHa3RM+Zrwg4KXihDVDtEt9auJXdMow0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730809584; c=relaxed/simple;
	bh=p65u6pEVwp+z2uFB3EoaOxjkU6wS+vHhM8fSdafSUcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTzq7laC/ll9ln6hViDZIKyLGCAn5NgVIJyCrcFL8HbmrkFDo2cDPa776P7sNjXnmP0g5zK2nqfd95cKPBznPhbbx5Zo6yyNu2oyFmFlbhpICpFOECmIGXEFyyBdYySbSEqRL6FLgi0lSfaJqw3JenTnBsCqzmscrygn2MDOzc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HPEAw8tb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6F4C4CECF;
	Tue,  5 Nov 2024 12:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730809584;
	bh=p65u6pEVwp+z2uFB3EoaOxjkU6wS+vHhM8fSdafSUcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPEAw8tbyg8+of3RFA7tiW95xAAbHOS7PFiyoR3ug25sCT/DcLHCug/TtYomZWPCO
	 VLwre+c5q+re3y/VKB9ntfxpiMLpDfXoMaKAPa5SYD6bmIE5iMA07r2VJEbPpM+xU+
	 qlZFEs1eryFUC9WvpBKAlA6MxMW2f7GUCZkvbVd8=
Date: Tue, 5 Nov 2024 13:26:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v1 5/6] USB: gadget: pxa27x_udc: Avoid using
 GPIOF_ACTIVE_LOW
Message-ID: <2024110557-reenter-unruffled-f88a@gregkh>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104093609.156059-6-andriy.shevchenko@linux.intel.com>

On Mon, Nov 04, 2024 at 11:34:23AM +0200, Andy Shevchenko wrote:
> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/gadget/udc/pxa27x_udc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

