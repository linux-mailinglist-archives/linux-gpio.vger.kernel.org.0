Return-Path: <linux-gpio+bounces-13852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 207289F079B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 10:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 576231883E9E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 09:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130001AF0CE;
	Fri, 13 Dec 2024 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vF+KM5OU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB5E1AF0BA;
	Fri, 13 Dec 2024 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734081602; cv=none; b=NLn0kgK5kRTg+fAXTWB5hwkU2KArBQG/7ZUqQ7r10iOMg0DupuDfJT+2JPIOFypkehew0hirD0BMHXrcDHZ19hyrmUWoSRmdZkDMVUwlX1XJSJAzKxBmqT0R9AH2bhpXTC+wp+wqC6cYYJqCZRjLHl5NbyJ0lGck8rTOAXt95SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734081602; c=relaxed/simple;
	bh=LZTssH/ZHKTvEutuJtTjkmecZUTVtynRxVs9i48YWr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qbq0RKMfkYkU4SCNty6cm/rLOr1th/pZoO2e3QJJ73xJdsCA9wyYkDYnSbf5f3vPJLzYZFPvxCvGxKGP0FJBkdgP9tTo/wEtYxtKd0F9r9o//lY7h8l20dN4UDzsCTW9rSexDjwAFFP6C+H7v2IZ2yLm5XSDDgMMzsgtWy9SUeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vF+KM5OU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B2CC4CED0;
	Fri, 13 Dec 2024 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734081602;
	bh=LZTssH/ZHKTvEutuJtTjkmecZUTVtynRxVs9i48YWr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vF+KM5OUjhNimxXTCodSJDmpIOrab7qO73ZSbulEhwBCbF8TMZrYRmOk6ulg3UuHK
	 luhGa9Er4B64KWPwj1HpaVm7nnx2vyJbQ/H1VZnS4g44lK9BOcgKTk0LK+ViAGUaDD
	 HDIPLfLWRHyMT1pIC78q2I2I2VJlTQJ5sn61oFK2pSOfpcmN2u/zV4Z2Le7rTb2C3P
	 2lMs6SI3ZcmZg6bjW298otZ/kzlh8PmgIPJv/wFrE9fc5zgSFwBUdXGwoWyLrqXhjk
	 7DAC5HWztrvL4udgF0nZpR1dJyLAboDD7K+zw0q2nj3KUmq5z1KbVDOKWL329g+GlC
	 it3rFPbfTRQ6Q==
Date: Fri, 13 Dec 2024 10:19:59 +0100
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
Subject: Re: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit
 gpio-line-names property
Message-ID: <atzraxqm7z7trpagw2kj4xraghb323zry5cztwadqsowfafkmm@gejykzp4hjoo>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>

On Thu, Dec 12, 2024 at 06:36:30PM +0000, Dave Stevenson wrote:
> gpio-line-names is a generic property that can be supported by any
> GPIO controller, so permit it through the binding.
> 
> It is permitted to have a variable number of GPIOs per node based
> on brcm,gpio-bank-widths, so define an arbitrary maximum number of
> items based on current users.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


