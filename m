Return-Path: <linux-gpio+bounces-20025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE08AB4FED
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4361F3AA7BD
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D8F238C21;
	Tue, 13 May 2025 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYa9oQPu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCEB21CC47;
	Tue, 13 May 2025 09:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128861; cv=none; b=lopT4k+eVl4KwyZD1Bb2Lp/77/iOUf1uVZgeE+uQssGx7wNwVj+hjMFUH87lSOlwfchjdod0cjA78d/E8nw9Ie1jGrglTTgb8UIvtRFtUBSM7icG8mhmtr4FIX/x+IgbMPXyRz9je+/9yyR5NLb0jFdSCuQbXR4AhVBB9WNGClo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128861; c=relaxed/simple;
	bh=ELecQyKBxDFktbvYzfDQ/lAHxFrA2AjoKxxQsIZKSf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rg6I4aOCm/TLUmo9LB21DBG3TXii8zwbXnwcs812ULWmpy4jD6aFZbs5+RHVs3Ab3TLU3WNT5B9p8a5nJ5iTNZK7q+y+RyJqVzCFSaOBAU3msA9LaASJPgfZ7Vn3AC4vAu6mVOAX5Ul8c7wROrksqn3KgQaBMB0FBRJR8SiyWmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYa9oQPu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B544C4CEE4;
	Tue, 13 May 2025 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747128860;
	bh=ELecQyKBxDFktbvYzfDQ/lAHxFrA2AjoKxxQsIZKSf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYa9oQPuMWW9WhDbZurLD53n3crOVXcCS5kVCDEAssOIfA5JATc8vJEwWOwIe+60D
	 XWGw9cBH10/kOqMfL2IpcygGHV+x7q/65mHTw13QkOjq7XuoM2OZeBNKIMbaImgxM3
	 IXRnlNiXBojHupmnRIVuYQtiMoCUJlbnmC5Nj1XQUXMAng1u85P/bHwDIc8ruFMcEL
	 ygGjKptGiUy7fhf9hC66xAE3PRLMIyZN2CfSdU9VShHpFmPSqOy/LZCTEaJR8siLi0
	 tA/TpQguUbASjoIJL+uxRZsbdJ0rNcmhMapZD2+E9uz7LN/WmUR2YijJLLlKdplztM
	 +Fwzy5XqqZnBg==
Date: Tue, 13 May 2025 10:34:14 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v9 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
Message-ID: <20250513093414.GE2936510@google.com>
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
 <20250430-max77759-mfd-v9-5-639763e23598@linaro.org>
 <CACRpkdY15L5PpV9ah_0R3ZPZVMh18OR+Dg2qXiBG=8Kq79-rjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdY15L5PpV9ah_0R3ZPZVMh18OR+Dg2qXiBG=8Kq79-rjA@mail.gmail.com>

On Tue, 13 May 2025, Linus Walleij wrote:

> On Wed, Apr 30, 2025 at 11:03 AM André Draszik <andre.draszik@linaro.org> wrote:
> 
> > The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> > includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> > Port Controller (TCPC), NVMEM, and a GPIO expander.
> >
> > This driver supports the GPIO functions using the platform device
> > registered by the core MFD driver.
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

You're only 2 versions behind mate!  =;-)

-- 
Lee Jones [李琼斯]

