Return-Path: <linux-gpio+bounces-28671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 00412C6A28E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 15:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A0E2B364A4E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 14:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6554361DCC;
	Tue, 18 Nov 2025 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chf9JOcf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC7835A953;
	Tue, 18 Nov 2025 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477961; cv=none; b=dWXIoml52ueItvgiihd4v8BUmC4Y0yz+fbTIBBeOj2ZpZbZMKILPxG2SWZWl4+dKQtTLieC6T/tBnBj6No1DBBlMjXjHUwdi/YAKDi3ur1sQh4JqaXdYW1kRKUQz/uNN/jTRX6KzsbZkNWJG/V58rJMjuNhItA30CYmkIu98VLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477961; c=relaxed/simple;
	bh=cvaG2NcuNp4cgJu+QhpO0a8xl2rTVFfjhvsMJs0NBn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQLuKSDRnTId/oojBPtqDnkN/u4wriJBpgyNHJ+Nas0a8dm0OIiX+mUR7nNPhv+U1T0KZOK0QxVMvmd7hOjyg/9DJnvMi2tHwpRK3QPyQbD9qpqgZqavil1tJH+1ZVJbxMPN08h14w9+A9y4zRdKj1umlDl2f7Kt5TyMv3p/TrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chf9JOcf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0578C19422;
	Tue, 18 Nov 2025 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763477961;
	bh=cvaG2NcuNp4cgJu+QhpO0a8xl2rTVFfjhvsMJs0NBn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chf9JOcfDefoPZfCP9Ft/XP3bqu2QPSB3IMsRGfId2ucgE+Acy8Fcp7FFJ8+uOAWB
	 YLyX3Ty5yKelImR738KHQw7ufHRQZBtUvzuqQcfa9GOR6qGif6qPe72a+bf+XydTip
	 OgHTqfIgOmmZQicrJ79+vmhhRZlqPzDuDFYq5ZIImOojdPO/t9yX1ackoyNNTevYFK
	 KHSyOvIq/8/jG3tVRtVIotbuPk9nJfl2hls0M5rwcnm3ouYlktmMMV2VtVPbGgvgx5
	 8frv18iuJ4wdQhud3W4+YOKczZXgmhxiaf7fntfYbD9Z300MRwBEYa5dgHM/72c2uH
	 PQpvvNQigWl2A==
Date: Tue, 18 Nov 2025 08:59:19 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sander Vanheule <sander@svanheule.net>
Cc: Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v7 2/6] dt-bindings: mfd: Binding for RTL8231
Message-ID: <176347795875.3234818.11267586700595154713.robh@kernel.org>
References: <20251117215138.4353-1-sander@svanheule.net>
 <20251117215138.4353-3-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117215138.4353-3-sander@svanheule.net>


On Mon, 17 Nov 2025 22:51:32 +0100, Sander Vanheule wrote:
> Add a binding description for the Realtek RTL8231, a GPIO and LED
> expander chip commonly used in ethernet switches based on a Realtek
> switch SoC. These chips can be addressed via an MDIO or SMI bus, or used
> as a plain 36-bit shift register.
> 
> This binding only describes the feature set provided by the MDIO/SMI
> configuration, and covers the GPIO, PWM, and pin control properties. The
> LED properties are defined in a separate binding.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
> Changes since v6:
> - Relax description formatting
> - Use absolute paths for schema references
> - Add pinctrl properties to led-controller node in example
> ---
>  .../bindings/mfd/realtek,rtl8231.yaml         | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


