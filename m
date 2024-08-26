Return-Path: <linux-gpio+bounces-9174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ACB95F384
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 16:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E8B11F21FF8
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 14:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D62318661B;
	Mon, 26 Aug 2024 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="YS8eh5ZL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E102A17C985;
	Mon, 26 Aug 2024 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724681183; cv=none; b=DsGNrrGmKasZYns/LDSw2wHqbRepX3tD0pV+K+2zBcvqXPybV5mcP0puvV91V2icbvOOhJwuaHKEnRaucjcjtHyoOyOWH8uh4sXIVcbL2akc2hP7rfrxCPN5WX6c/iv06eFAGU+dfqQgOaYxIS5Km2V1OZROquL5GQg5ZyOOKNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724681183; c=relaxed/simple;
	bh=nAAVfa7mSkXdmo3jBmgCqJilsC6QcXimOq312imTzjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rrvuin5XqvdwELGiUoordESvZAW7l+kXfzr17TzSal92x325Q7J5Px4KpLUidoqbQPEaervW9MXws7UneK+LqgmjLyetC6EgT9BtQGaUpTKjLY6uHalLIDz4w1ZCuGRgJPuLCQHG6lbjvDw+uapI+oMqPLu86IFboWJaBsb4BN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=YS8eh5ZL; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gGnGeY9k2zZfUreWZoSXEECewK8gyUkmlB9Momxm5dk=; b=YS8eh5ZLhlziCaNOUXOLiI/Irr
	jTrZnkIwcL+nK3rql1heJR9kSccH44GmMxJW+jgmpwispn606cnQ5Q7uQnV83gj9WopBBy7kopsrW
	7H3aVl7MpcDvo19CuJ5P1DNAKxFHNsl/+7Y0qMy3riOvQzbrHofGEOsSvQpsiYFeEiA4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1siaMI-005iLm-N9; Mon, 26 Aug 2024 16:06:14 +0200
Date: Mon, 26 Aug 2024 16:06:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
Message-ID: <ac1436fd-f80b-4571-b10b-171104273272@lunn.ch>
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
 <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>

> +static inline int siul2_get_gpio_pinspec(struct platform_device *pdev,
> +					 struct of_phandle_args *pinspec,
> +					 unsigned int range_index)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	return of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +						range_index, pinspec);
> +}

In general, inline should be avoided. The compiler is better at
deciding than humans.

	Andrew

