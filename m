Return-Path: <linux-gpio+bounces-22222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 829E0AE8E0E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 21:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3909165344
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 19:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8342C285C9F;
	Wed, 25 Jun 2025 19:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/vTAuvU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360DB1F4CB2;
	Wed, 25 Jun 2025 19:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878520; cv=none; b=kZ0JRsmb8AaIxNsKsL5d2dGHvhUxv9WPxDoloOFs3FbOhybs8Mo0o+he+VzZUXleeEJxXtAYdj8zrqEbhf0FeD4DSZo7HDXwlqOn3q4jSNXrflCUhkCwdsBFxF+z7hJtCga8Y0zzBFr2prJ08jM+m12YnlceMEXvz+CJoKyPH/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878520; c=relaxed/simple;
	bh=z1gAPx6OY/jnhOzLuEXFWO6EY4yZIbfg2MNyRqOx1gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=muptMqLdmy/b5iP94ILjkAXwnn6ku7GK32IjHbKHwCTdYZG6ay2e7L3GkU2Hov4eS0oVlwr/wd0eLqqo47oN26bcduZ8gxISwC/ZXXjObVyoL9ZWzklEePOzg2a+OeudnUpzTd9Zgo/yY2U4zFisU7nxKzsRmjSYZCkLXmV8j6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/vTAuvU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E8BC4CEEA;
	Wed, 25 Jun 2025 19:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750878519;
	bh=z1gAPx6OY/jnhOzLuEXFWO6EY4yZIbfg2MNyRqOx1gM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/vTAuvUGg/KVt0IJdr0wIXFd/t8bkhpVODu6rIOR28WRkw6V+0OGpCxlT3IMYRUq
	 f7B90yIqOEG/rtEiW1chW8G/7nmsdLKZy8nYRR/tWIgNZKtIisfMgLWER+eMfBf5+H
	 6fx04ngDGVbDlU0Ble9/LyyVU9MjFMIrUtWzNOpD5+M8OWiW+zsNAF2+alr5ZZhapN
	 fHHbY7Ot3y0p9GocrEGPTvgxLk0CY7WJKirZ2PzHhTtsAXvz/Yj+aBLilEHpcabtxn
	 XvZtVHXtaTHAjCZ/KlJlsZ7awvmfhn5Nbt5In4DVomA1EJUpPJaLtPoaajWQ7q4jZs
	 kTdlJoEE+b+Qg==
Date: Wed, 25 Jun 2025 14:08:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: pinctrl: convert nxp,lpc1850-scu.txt
 to yaml format
Message-ID: <175087851837.2053063.15257795513103591902.robh@kernel.org>
References: <20250606160359.1356555-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606160359.1356555-1-Frank.Li@nxp.com>


On Fri, 06 Jun 2025 12:03:58 -0400, Frank Li wrote:
> Convert nxp,lpc1850-scu.txt to yaml format.
> 
> Additional changes:
> - keep child name *_cfg to align legancy very old platform dts file.
> - remove label in examples.
> - just keep one examples.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - drop generic pin list at top description
> - fix subject miss n at vendor prefix
> ---
>  .../bindings/pinctrl/nxp,lpc1850-scu.txt      | 71 -----------------
>  .../bindings/pinctrl/nxp,lpc1850-scu.yaml     | 79 +++++++++++++++++++
>  2 files changed, 79 insertions(+), 71 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


