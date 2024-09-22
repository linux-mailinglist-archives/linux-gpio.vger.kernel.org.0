Return-Path: <linux-gpio+bounces-10336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B6997E349
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 563361F211D3
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 20:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3035E093;
	Sun, 22 Sep 2024 20:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHQbSKsi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFF555898;
	Sun, 22 Sep 2024 20:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727037828; cv=none; b=WapioEpX5MiXExfj91KyRHJkX9/LI46VbwD2bGNiB7eXou++z4CGK8wxDDBtOrul1lDaTQ+D6/IvelJWMk62kjMaE3SeNxBwb+z6Xnn3qbdQ5pObdEd44sGXmfSjClM8cFa/HO//tjMvBZgwKzOfun9rT94pBItddQikqjvslYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727037828; c=relaxed/simple;
	bh=M4TF5ayIuFRvWwOsi5XVMxki7jlOEntStSvxNGBxNL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMjiiE+rzTOMXWrN6DFza5W08pmBLE06nmUqZsCQuo3qObIV/aQIIBzDygcRmmbpeg/4x70X1vLGXaCG2N5G6+dwDtYBTbvpkpPdaLy3+jte11llYa0Xh1XzbjX24bvyN77dEGNlPRzwmheHgjiuUkE0Ibg/oTI8J99S5T8d/mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHQbSKsi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52048C4CEC3;
	Sun, 22 Sep 2024 20:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037828;
	bh=M4TF5ayIuFRvWwOsi5XVMxki7jlOEntStSvxNGBxNL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHQbSKsi8PW6RN/qJntYotqc/YBS+PsVmGjJufBBnnUUuwR+qwRACId4ct8dhIjK1
	 hx1XTohgh+2ZWm9isbcDRzuJR1AMGF2+nKEBvpBPQ568OgQs+qdbMCaBAgRpDfklYr
	 FYYXyJuCQhSsNCu5MT09WpIw/tMxrkaSo3YzwX87ifEZ+eJpEA7rxrh2/TnMqk8FMI
	 Fc6mvSUq0wd11kP3oSzUkJOh8RCQptWAhTQmLDldIS5b3lykgtP+F7qI2aSGab8bm7
	 +va9Jth56cU39irEJORCLzp+d86PVR8ah/uV5KpHD8oeouPS5i1BcPoNFTObv4DHTf
	 QArRDI9Rix9dg==
Date: Sun, 22 Sep 2024 22:43:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, konradybcio@kernel.org, ivo.ivanov.ivanov1@gmail.com
Subject: Re: [PATCH v4 01/20] dt-bindings: arm: cpus: Add Apple A7-A11 CPU
 cores
Message-ID: <34fubbbf6jlqjs6q2f73oohkijhudvzni63dtillg4d4fxjm6i@e7oogteye2oe>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-2-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919161443.10340-2-towinchenmi@gmail.com>

On Fri, Sep 20, 2024 at 12:05:50AM +0800, Nick Chan wrote:
> Add the following CPU cores:
> 
> - apple,cyclone: A7 cores
> - apple,typhoon: A8 cores
> - apple,twister: A9 cores
> - apple,hurricane-zephyr: A10 logical cores
> - apple,monsoon: A11 performance cores
> - apple,mistral: A11 efficiency cores
> 
> In the Apple A10, there are physical performance-efficiency cores that
> forms logical cores to software depending on the current p-state, and
> only one type of core may be active at one time.
> 
> This follows the existing newest-first order.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


