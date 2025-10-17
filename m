Return-Path: <linux-gpio+bounces-27233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A28CBE6B9C
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 08:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49A3E626294
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 06:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D71730DEBF;
	Fri, 17 Oct 2025 06:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Dk4+OInX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF424225A23;
	Fri, 17 Oct 2025 06:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760682669; cv=none; b=ADNBaz0AAMfoyFuuio+LX+rDU+De4iU/ZIutuRSHSVVLWKKqvbZFAm2kKjQiwSSF61jCF+vqkFHNY1+Xb5ZQOvgtsPyPSKISbGPTl7+/o4zKg6NmCwn4FwWMboUobSSOKOfc6EOtBPf3MldFqJ129qOSivpw+yniJTjccDI478c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760682669; c=relaxed/simple;
	bh=R2shE/vXKGK6XxDN3EEo6pLrsf8hO3g7K+H5vR1Pf/s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lWiCqWVNTvruQJaB4D/hX2L+KVY06OoxP3CPVZOou2qg3rkLX//jvf8X9euzkiD4M3Dmz2oYrOiYmyOExgXKtISJzwE+4N6FO5LFuM9I1js1CScWmBfSB0aZO+KjowOUEB78mh7vNkBIzyy35rWzTjKDtinI118PiXlkxg1sd5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Dk4+OInX; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760682665;
	bh=R2shE/vXKGK6XxDN3EEo6pLrsf8hO3g7K+H5vR1Pf/s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Dk4+OInXAebpYC/bzwaUKlZrUu+oraR1IiDv+GhH4Mik82X6l/EHqwhdYdFxD9lS0
	 H+TA+9KK7XG+lWKRHkOfhbhccYhMO/vlmRMGoyECB2cZnr7tHhtXeomcWBWbtuiOzd
	 /I8OiuN/Z/11Xuf4ieP6u3hLXesAtSBQNlYnTerFZxB5pU+gzmRa+x4m8Fii+4QyRk
	 CQGqhD5RtxSG1+dRp0BsXlTX/4hTFZmONsvz2dL/xTMMaVAzPpwQyTDuU7RxSDWoGo
	 L/xyI0U5DRd/uGP52+/BEBWYYTl1v8B+K0pRZfy+HO+O9cCdGeayhbVpTu4QXDnu/9
	 xLwecaSHHTRLA==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 26EAE77272;
	Fri, 17 Oct 2025 14:31:05 +0800 (AWST)
Message-ID: <b63b53521d44c1b765cccd3f9f03d7f778b7984c.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] gpio: aspeed: remove the "gpiolib.h" include
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	 <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Kent Gibson
	 <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@linaro.org>
Date: Fri, 17 Oct 2025 17:01:04 +1030
In-Reply-To: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
References: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-10-16 at 11:09 +0200, Bartosz Golaszewski wrote:
> gpiolib.h is a header internal to the GPIO core. Drivers should not
> include them. gpio-aspeed only needs to be able to determine the
> hardware offset of the GPIO given the descriptor. Expose the relevant
> symbol in the consumer header which allows us to stop pulling in the
> private one.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For the series:

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

