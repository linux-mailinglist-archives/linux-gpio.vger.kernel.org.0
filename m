Return-Path: <linux-gpio+bounces-13853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C606B9F07A1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 10:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D6431883E58
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 09:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426391AE00E;
	Fri, 13 Dec 2024 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqLxO4sz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A021AF0BA;
	Fri, 13 Dec 2024 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734081624; cv=none; b=dLS/5uvdcDUf8e7FzpxS/HBworawpxFYfXldWeZS4depYNIaH5x9LpuM74WYSAg3Zts3f0KRPOz0r3ZUomKnUJXHEssoXu42Mseifs73wYhrID8QYNyaJhUvugF7AwjjdrbdNBTmlKxpHAbBXAokXXVfL18BAw03WktWOPQBZis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734081624; c=relaxed/simple;
	bh=ZrfHL5HK6XFy4TpWd82potK2Py8Ecz/VGgykKzhsFKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lG/kCdfcacA4wBe6r17dTwfyoaie5wtYy65wniWr43Cxs9c0/V/l72ULc3SKQLzO5U2MEjzG5bGHr313xYJ7ew2oS3wjfdh7LUsm3RUDhajbeT4dc6cXrhknm5R/HbKh3bJUKusic3fWotKHCTpa2K3yUTbt1YOeytSjO/wbw2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqLxO4sz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361ACC4CED0;
	Fri, 13 Dec 2024 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734081623;
	bh=ZrfHL5HK6XFy4TpWd82potK2Py8Ecz/VGgykKzhsFKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqLxO4szVs6ix1PWHfB67O1rL4ZdPrzP79AuhYQpNz5FnwfN4Cop3mwTx+5VYWf43
	 2FuRKi8gX4DFF+Eo524VWdvb9EFA47aVXOsDG0TQCdORFy5BmvIVk/iCkLa1Prj1tx
	 2PXdn4GdweXr9skLN/sJnu6rXvxbASfZyjQvTzqpCt56ehl6a7L5LkuEmMO9TEkjRB
	 5upyrcbO3g51Oduq511RIbZzQE96ExFZ6BN5mmHzMGhEs5mlsy2/bxxf6Vvmgh+WEA
	 8UmXuTtSbR/OC9bwUKLupW/kxRTWR4F9bDxQSBq8SLdLXBkncKL6KX2d3rhflOHvKB
	 5Rk2yl8+kv1BA==
Date: Fri, 13 Dec 2024 10:20:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
Message-ID: <n2ib4ofkijx36hak54i2vv5y5gh6pycsicnvjx4bzinsfoxr4l@ipefwfyxrpqa>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-4-44a7f3390331@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-4-44a7f3390331@raspberrypi.com>

On Thu, Dec 12, 2024 at 06:36:31PM +0000, Dave Stevenson wrote:
> Since commit 88bbe85dcd37 ("irqchip: bcm2836: Move SMP startup code to
> arch/arm (v2)") the bcm2836-l1-intc block on bcm2711 is only used as a
> base address for the smp_boot_secondary hook on 32 bit kernels. It is
> not used as an interrupt controller.
> 
> Drop the binding requirement for interrupt-controller and interrupt-cells
> to satisfy validation on this platform.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml  | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


