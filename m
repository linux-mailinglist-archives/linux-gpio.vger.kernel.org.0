Return-Path: <linux-gpio+bounces-16709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DBAA47E71
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 14:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ABF41889362
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 13:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145DB22DFB0;
	Thu, 27 Feb 2025 13:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxxeGOBQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE17B1662EF;
	Thu, 27 Feb 2025 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740661267; cv=none; b=SOShBZ0fNPjbYAexURfFR0m58R/tMlOgqc2SLavSK5FXUdCgBql4jtvASrEkbeeXd4B2RwpLa6YL4sReIxmYC6U+pfuKd4CFXP06e4QeLEEVddd5MPweoEbDg/dcsJtoRgHSsKktblOSZm2kcF/e9jfnPBAVt6AhnWIB6Id8wCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740661267; c=relaxed/simple;
	bh=z3pintefSsyMkJnMeutqAQeGN0565pFuBIHnnkujcy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2pHVRYdfwj66VTqRuLHFKUzfTBcvF5ycbL/L9KmQNEBl/DAwTffTb5jsidQDPRocSzYzueSbj9FFJ+rA6/Dj1chQgFrUaYfYkKsyGirymDyELzRdDkgIWOctU2uww2w6+XkNoei4Xo/YMUhzUg43Ll8oP6RxXOfn+u29G7yc/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxxeGOBQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE29C4CEDD;
	Thu, 27 Feb 2025 13:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740661267;
	bh=z3pintefSsyMkJnMeutqAQeGN0565pFuBIHnnkujcy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SxxeGOBQmK/Y9Kq7U7tKvhyyWjftGn0Bg1abgzVLRSOacxVxMqhw+81PX6sf2wR6p
	 eU4dfmmOw06WTOIHDMiz/2NXuqPlDgjvpF5t/ShIYgwKo4cYG+X+UMVa7vh66zrN3C
	 HpYGB/5AQjfAMwkA6P+mzyEaWx+9iuUVuRB8Mdxxjxk9A9WeXKXsqeIUqJY+6mrBmG
	 VZy13hApBt/SwUW1FWGl/+1gyABkw2bIw879y/AqC3kSILlTBwLcEAuFWcF+cKdOoO
	 L02i4z0Rp/WPHtkbqozzjO7ietU0QBuW2iGBKn21X/KR6f59oRBOi/kNmECN2f9Vv/
	 OqaaVEWRDDeLg==
Date: Thu, 27 Feb 2025 07:01:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>, kernel-team@android.com,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-hardening@vger.kernel.org, Lee Jones <lee@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Will McVicker <willmcvicker@google.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: gpio: add max77759 binding
Message-ID: <174066126476.1782541.10525442176806771329.robh@kernel.org>
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
 <20250226-max77759-mfd-v2-1-a65ebe2bc0a9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226-max77759-mfd-v2-1-a65ebe2bc0a9@linaro.org>


On Wed, 26 Feb 2025 17:51:20 +0000, André Draszik wrote:
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This describes its GPIO module.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> v2:
> * drop 'interrupts' property and sort properties alphabetically
> ---
>  .../bindings/gpio/maxim,max77759-gpio.yaml         | 44 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 50 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


