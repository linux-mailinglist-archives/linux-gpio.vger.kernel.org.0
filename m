Return-Path: <linux-gpio+bounces-8962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0FE95A7A8
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 00:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D8E61C211BE
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 22:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948D817BB05;
	Wed, 21 Aug 2024 22:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MTklpD/j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279E413B297;
	Wed, 21 Aug 2024 22:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724278566; cv=none; b=b+pauNW+vMK1A38w92eUbUSZQTaqu47xIA/YblbWWc6Dm39Xj6LZErI3eAfzidvzmMWP8Kc/uqGhFxRUi7Cxd6AETFNzvNnNc/6YwxwuejYfkt4XqNnT0WILMV49SICAkttGbsi3DRQvZMC5W5Npun4VrxlICqhlLaY1D/89knE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724278566; c=relaxed/simple;
	bh=wTXjUI+iyePnK5zTtz2JfrslMN0r7IoujZ3NVj0xpi0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qq53DjtW4M/uD411R9dM686S8ywvDzqmZEUYUzFW7uZxF2sukcrsB/mhOco9450VPOrf2GU6tYXHJ0y4XuyyinPwgPfEq4tGS1WmmsbRuqX9U3lG1ZApyBYrWyFGVDRC40xiLriJwgQVpASMMSiPLBcvWmzpJjWVfOsXnUGQ4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MTklpD/j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CCCC32781;
	Wed, 21 Aug 2024 22:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1724278565;
	bh=wTXjUI+iyePnK5zTtz2JfrslMN0r7IoujZ3NVj0xpi0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MTklpD/jbTK2RUbXeeiNsGd/xmxANxyt8Q/JFcQBFjX3YpfJ76JRFZr8XYxz0Co5F
	 X7ATJcQmyoMavPA14NVjM5jBmLLU+MHufHMhHQ/b+suBmW6Zq7KhuZ7eZBZtIXJ6CT
	 JxlUylADRhlXguYsHFS1dd1XK84lgoJxY6ElYx30=
Date: Wed, 21 Aug 2024 15:16:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: tony@atomide.com, haojian.zhuang@linaro.org, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH RESEND] pinctrl: single: fix potential NULL dereference
 in pcs_get_function()
Message-Id: <20240821151604.7fbb834fa1503d11b373212b@linux-foundation.org>
In-Reply-To: <20240821062132.1407444-1-make24@iscas.ac.cn>
References: <20240821062132.1407444-1-make24@iscas.ac.cn>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Aug 2024 14:21:32 +0800 Ma Ke <make24@iscas.ac.cn> wrote:

> pinmux_generic_get_function() can return NULL and the pointer 'function'
> was dereferenced without checking against NULL. Add checking of pointer
> 'function' in pcs_get_function().
> 
> Found by code review.
> 
> ...
>
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -345,6 +345,8 @@ static int pcs_get_function(struct pinctrl_dev *pctldev, unsigned pin,
>  		return -ENOTSUPP;
>  	fselector = setting->func;
>  	function = pinmux_generic_get_function(pctldev, fselector);
> +	if (!function)
> +		return -EINVAL;
>  	*func = function->data;
>  	if (!(*func)) {
>  		dev_err(pcs->dev, "%s could not find function%i\n",

Maybe.  Or maybe pinmux_generic_get_function() must always return a
valid pointer, in which case

	BUG_ON(!function);

is an appropriate thing.  But a null-pointer deref gives us the same
info, so no change is needed.

btw, pinmux_generic_get_function() is funny:

	if (!function)
		return NULL;

	return function;



