Return-Path: <linux-gpio+bounces-11315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1421B99DDDA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 908FDB21FCC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 06:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFF017C9BB;
	Tue, 15 Oct 2024 05:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLR5p9h+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04512173357;
	Tue, 15 Oct 2024 05:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728971995; cv=none; b=S1xmazmnelwslQrkR/EF0/j/ojLBDhe00yYTmP/3BAoo7T0TeBFEVQ/ysHMyvOh/YBw1eIQ5l/YOVRhRyB62zb6LD2Bt/Le3KuJDBcxL0kyad2r+Uaq+lWyTYuufRnAD1w0NAK+K+plK9y7e76wmVM+mwwKJNu5DotA4PRF22M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728971995; c=relaxed/simple;
	bh=0Ra8CCMbg3ZRBIPWHy4Ub9PO/HhTwfF7f9lE/56wZQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVMKMaffb5dEvA3P8RdAL3FnduR/rA4HrEX15lVz+uXk+1PaEDcktYX8Pbd7Q+7RCURDjshFhvijX/mIhUf4GC7Z2glRnjAZ+UaqGzXRdn11Qe2HKzqrFaVGm3wIHrdjnbd+rRharsnWlcBr4UdDnW2NjpBc2F0qGvFH7JepSdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLR5p9h+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42377C4CEC7;
	Tue, 15 Oct 2024 05:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728971994;
	bh=0Ra8CCMbg3ZRBIPWHy4Ub9PO/HhTwfF7f9lE/56wZQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLR5p9h+4z4+In8S1EerfKLedkQPAGen1+dqrGPyppIFDaCAqM7jVOhUQifwHk/Go
	 X7XVdbrjV2fMdLVXpJNX68E9YHJVlHPuAHbMGMx7lcwEQo7/iPoim0g3fORWY5ziz6
	 5WGqwBYNa5b1lG18pQ+JbqZtvovQWHbzKZYwgOlnONrgONewD4U3kCkORJJqVV87ac
	 A4vilIEX1pW3sB+hN0/BbxpsWiKiQGO7rJR7+DSuODAYvd1JY8nP5oEezmuWLn9apZ
	 jrjSSX7+xzunrYjejByq1qvUPHB1WWiUY0q2gRPEm8RyBuQ+TIcj+sygcyocdDecLr
	 50heymx4iTvuw==
Date: Tue, 15 Oct 2024 07:59:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
Message-ID: <u4afxqc3ludsic4n3hs3r3drg3ftmsbcwfjltic2mb66foo47x@xe57gltl77hq>
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
 <20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com>

On Mon, Oct 14, 2024 at 05:05:51PM +0800, Xianwei Zhao wrote:
> Add the new compatible name for Amlogic A4 pin controller, and add
> a new dt-binding header file which document the detail pin names.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---

...

> +++ b/include/dt-bindings/gpio/amlogic-a4-gpio.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_A4_GPIO_H
> +#define _DT_BINDINGS_AMLOGIC_A4_GPIO_H
> +
> +/* Standard port */
> +#define GPIOB_START	0
> +#define GPIOB_NUM	14
> +
> +#define GPIOD_START	(GPIOB_START + GPIOB_NUM)
> +#define GPIOD_NUM	16
> +
> +#define GPIOE_START	(GPIOD_START + GPIOD_NUM)
> +#define GPIOE_NUM	2
> +
> +#define GPIOT_START	(GPIOE_START + GPIOE_NUM)
> +#define GPIOT_NUM	23
> +
> +#define GPIOX_START	(GPIOT_START + GPIOT_NUM)
> +#define GPIOX_NUM	18
> +
> +#define PERIPHS_PIN_NUM	(GPIOX_START + GPIOX_NUM)
> +
> +/* Aobus port */
> +#define GPIOAO_START	0
> +#define GPIOAO_NUM	7
> +
> +/* It's a special definition, put at the end, just 1 num */
> +#define	GPIO_TEST_N	(GPIOAO_START +  GPIOAO_NUM)
> +#define	AOBUS_PIN_NUM	(GPIO_TEST_N + 1)
> +
> +#define AMLOGIC_GPIO(port, offset)	(port##_START + (offset))

I do not think you implemented previous feedback. None of above are
bindings. Drop.

> +
> +#endif /* _DT_BINDINGS_AMLOGIC_A4_GPIO_H */
> 
> -- 
> 2.37.1
> 

