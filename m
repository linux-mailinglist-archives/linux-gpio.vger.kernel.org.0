Return-Path: <linux-gpio+bounces-17045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF88A4E029
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 15:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7AC03A4EF1
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 14:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3B5204F6F;
	Tue,  4 Mar 2025 14:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXwWU10Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352AA42A9E;
	Tue,  4 Mar 2025 14:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096948; cv=none; b=TVexM5nBv3tEuBxmyGIrFuC3JrBA2YvRdBc0zQ1GuW+Fxn2YZ40eGenYEIACC2Th7GE+8MZ+xFOwj1ea+TvUn489YUPWMPZdmyeyHqwb7UcJHBxl2JXRNZIJdezH7kw9lj9PMkbHeubHx/k3qtFMIo3/FcLtie+xpZED19P9uLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096948; c=relaxed/simple;
	bh=eQZKk95b5WPL13CMB19MPEXFzwQxauyC3cepDZM5T0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXBggrqxOkF//lepmmLP7qPmeO91/p3gz9uJXhEralIHJnFMFZQbuUZi+7rjHVC0FQ8SqFdUMbGaBGqdSH+u/klqW0cuduYJ2y6fCIyLAkVZ29OhOabwA3jSKK722lccNtLL7Bz87CmURzoUAQS8G+UXEEaIsEwQCSoJ2mUck+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXwWU10Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7362AC4CEE5;
	Tue,  4 Mar 2025 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741096947;
	bh=eQZKk95b5WPL13CMB19MPEXFzwQxauyC3cepDZM5T0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXwWU10Z/5kwkQ2U9e9n43/YfZLRv/ZsbKx8iai1tKZINb6WxQf/uZUemaHwWLAOJ
	 Po7bB9ep20IGSLEH26kpKgnPp7u54iC6vIdYAnOYQ7AIfzDNSqA4XIM1qEVwnvzz+B
	 JkjweF22Z16wPYo4EU9LSND4inWiI3juy0xMqkkJfOW2r0XoNVS3EJqRdxBJ7AuKIv
	 zC5JFos8274sBl4nphT0OV6L9ciyO1nVWBr1k9p4saKhCliesb1tJ271kZqGKeDmFH
	 atgGkIAM9KBWQME3PSHdEwDM3kr+5SdZF26pD7yzYRrh6CgzAz2o/HRXMWnxverd0W
	 AzlgK/Ze9dLOQ==
Date: Tue, 4 Mar 2025 08:02:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-arm-kernel@lists.infradead.org,
	Scott Branden <sbranden@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: pinctrl: Add bindings for BCM21664
 pin controller
Message-ID: <174109694544.2517876.17977367715126492989.robh@kernel.org>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
 <20250303-bcm21664-pinctrl-v3-1-5f8b80e4ab51@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-bcm21664-pinctrl-v3-1-5f8b80e4ab51@gmail.com>


On Mon, 03 Mar 2025 21:54:46 +0100, Artur Weber wrote:
> Add device tree bindings for the pin controller included in the
> BCM21664 chip. The bindings are based off brcm,bcm11351-pinctrl.yaml;
> both chips use the same driver, but have different pins, and the
> BCM21664 has 6 alt modes instead of 4.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v3:
> - Fix example for I2C pins
> - Specify bias-pull-up/bias-pull-down as a boolean
> - Add gpio16/gpio17 to list of I2C pins in slew-rate description
> - Use additionalProperties: false on pin group and specify valid
>   properties for more strict checking
> 
> Changes in v2:
> - Drop "property: true" declarations which had no effect with
>   "unevaluatedProperties: false"
> - Define property limits for I2C pins only instead of standard pins,
>   making the pin-specific "if" condition significantly smaller
> ---
>  .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 152 +++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


