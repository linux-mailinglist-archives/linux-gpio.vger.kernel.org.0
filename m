Return-Path: <linux-gpio+bounces-19849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B57D2AB1467
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 15:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133521C26D4C
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 13:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0FA29116A;
	Fri,  9 May 2025 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="TJVNqrXp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E025722A4D6
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796159; cv=none; b=JuJzOqEC8NEwCHLUeqh7fHH9n4C4jgvCZDj83whJ/AHyc2Md5xyNs7VVKLDxQm/XnpFu0Clc/yRc8jye6ZWE4uerzikvnTx9HwZ+VBE0SGy5PfxHjoJltoTHwJm/VcJ8vPeSZ4nu1dMOSd00w8nLgLCKNn121a0lrkiWcCycVS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796159; c=relaxed/simple;
	bh=uHfF6hjmj3jvH60F8Rl73M4A6GYGGSofRouVWb9b68E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSrFG7FvWcWMduLnI5rXkRzk8fUqr03zqU5onBFgNBzbz/7I7Hff2Obppdx5pXPj0NaxGMtv8tqyz1j/StdUl5Pw5fUfVekoxXUXETscfu52Y2mcwHpHIgXMYq8EE37BhiwJjAm4OFTzu/YmpELIfX50Nd2kLktBsp00PVRCsfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=TJVNqrXp; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Date: Fri, 9 May 2025 09:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746796144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFKvoeUux8HoPiW0pGkCvuUeRg/1wy8FP9H83SjDrJc=;
	b=TJVNqrXprhXeKjlasx3T+nT9Z+MfWMUC6C20fIi/NWSL5hEPmm4ocdmsUVMc0GtmVr/QH0
	eg7hZxodAb8PCG4569eZd1J+8MiNcG+XNO3Mpf4+5gD+MiFib2WD6sKQfvSKCV5tUrFRFi
	wjxZ58ltIcdQNsoPyUTCwGqnwYbyVqDEj17wu3wjYVjJ76jZ/uY2XSqjDFxCzSRZaLt63M
	A85GHOO6Oyd5wD3pvlxdIWQa+TPCnquoa3FH9iZatwtRImN9gFcPw/YHzH5RgqLR/p9wM9
	CiYe5lVzxZeHT/SaCmawrPwukF8n/zpFyuHzI3t/JJSHbvQnX8Vsjmlj56b8VQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 4/9] mfd: Add Apple Silicon System Management
 Controller
Message-ID: <aB3-bIOJsvlAfKRM@blossom>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
 <20250503-smc-6-15-v4-4-500b9b6546fc@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-smc-6-15-v4-4-500b9b6546fc@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT

> +struct apple_smc_key_info {
> +	u8 size;
> +	u32 type_code;
> +	u8 flags;
> +};

Dunno if it matters, but can we put type_code first to avoid extra padding?

