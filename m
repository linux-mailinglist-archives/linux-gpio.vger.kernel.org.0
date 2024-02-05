Return-Path: <linux-gpio+bounces-2999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF59D84A38C
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 20:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 401101F2125E
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 19:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA377C099;
	Mon,  5 Feb 2024 19:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yolxqp//"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CD87A702;
	Mon,  5 Feb 2024 19:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159801; cv=none; b=cVHNs1kav5uuHae52UpfMsDs8K7aG0263GPu8uNXiKVrCTYmTm04nqHDhP10xcmf6F4QHNSgbWvPu/vRjhpDetDOk5wACvbsXJdPB2aVvEJsvuykGX8IA393B5YMv6a9KH969pHcn9sPI7tNPGVV/53wwG0hl6GwTQ1xCR4Vd8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159801; c=relaxed/simple;
	bh=XOREM53K6Y8lg+gfOY8PATZMT6V5AF0JLY8nmGpzfj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Joq16WFUZIvjxrAbQ7jne8P9EefFBRMAG3/QZ0MoLzWgcT59ZkGqVrdFtUChNcc9h58AJ7fmmE32nhsfqt7aoUzQIJZlwP11Pw25m9+rl09Qv9FX+BAC0Z4T+huSDanTNsiCcqrt5UhzltNKLkT77QQmABFrrO6M//Guz6WIiR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yolxqp//; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419FEC43394;
	Mon,  5 Feb 2024 19:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159801;
	bh=XOREM53K6Y8lg+gfOY8PATZMT6V5AF0JLY8nmGpzfj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yolxqp//2GMwwDqc/WImdSIX0v7IjtjfhNhH3QFvMmemCpQhiKd6tAm5N/UArC3Kk
	 /cSE+2pJquDMq1A2jNCgEYQXHJQPGrlAXr8PfYZnmD0f/MeSGx3Zb6c8q+Uc2Qm5eO
	 FRKqQ+UIzvXhA7tL8mcK4FFzeEryIaIydhBFB2F0=
Date: Mon, 5 Feb 2024 04:47:37 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: gpiolib: make gpio_bus_type const
Message-ID: <2024020532-shrivel-phrase-c093@gregkh>
References: <20240204-bus_cleanup-gpio-v1-1-82d91b4ee1de@marliere.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204-bus_cleanup-gpio-v1-1-82d91b4ee1de@marliere.net>

On Sun, Feb 04, 2024 at 01:29:42PM -0300, Ricardo B. Marliere wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the gpio_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

