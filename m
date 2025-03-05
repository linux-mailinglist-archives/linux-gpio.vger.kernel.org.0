Return-Path: <linux-gpio+bounces-17080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EABA4F798
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A82FF3A8285
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 07:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568031E5B74;
	Wed,  5 Mar 2025 07:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVdVi2jt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046081624F4;
	Wed,  5 Mar 2025 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741158262; cv=none; b=bukbC2uwZZJpd6LyynbrXvhKDy8zjpTir5OcUCoFTuk4bSDXsNkGcM3ZpAVDj1RhrGb1tuyWtXnW3rKlep2BjB/gp/eWyQaz8BH1ckRMsDZddSyFEWzGrmFJ8TPKx1DXtoTUipQF2E+9JnWpMFoQkcaQ2ellrVKbealp6BG9FNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741158262; c=relaxed/simple;
	bh=XGC0dLZLwTxRFkwxOLHKqAW98Wa91YbNgSissAusMMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlhrsKPv0S21n6+wmgHyF1Oc5qu1+zEu8mnyICKpjufytDyihuPij47tr+j4UBYan1Z9azb1OLav94HscccswW7e3LKCcoOmLikaNs0qNVd8FNddLCEqGqTYx6ZVDDj5UWyT7uSCQwrk2PFZUgHISMrngjj03nouNg1VKyJDrXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVdVi2jt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969C6C4CEE2;
	Wed,  5 Mar 2025 07:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741158261;
	bh=XGC0dLZLwTxRFkwxOLHKqAW98Wa91YbNgSissAusMMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVdVi2jtwDcmZNSYwn7e8mGb2YvU3AThuvTSVCOCaz/pxwaoHbESIC8DOv3Q/Ikey
	 fzPkFhJ+gM8jMZaLKLUPHlxhJc9+Gg0ojw2CPvqsJlnSkn4Zj5Hk7XfGkH015iCDWQ
	 zan6YGHT4PEYcki8kfhq7weZM2xeFWPmmgFSbsSLMIVYCE/SgJ0ebeXkZjHkLqu2p8
	 oIyANlYrzdovbSH62/Z1TzENcFPLEft9pVnB7y7E1YeKNZEdClR+rFE3tQdfAO3Dd2
	 SwvQxsns95BQ2u245BsZcyQyWH7NNvdRKfO7iaJOgz2mElGc88RxCZXlXgxV37kqzF
	 XzXTYk0nnxznA==
Date: Wed, 5 Mar 2025 08:04:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Alexander Aring <alex.aring@gmail.com>, 
	Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH net-next v3 3/3] ieee802154: ca8210: Switch to using
 gpiod API
Message-ID: <20250305-rebel-mysterious-falcon-de1f7d@krzk-bin>
References: <20250304112418.1774869-1-andriy.shevchenko@linux.intel.com>
 <20250304112418.1774869-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304112418.1774869-4-andriy.shevchenko@linux.intel.com>

On Tue, Mar 04, 2025 at 01:22:34PM +0200, Andy Shevchenko wrote:
> This updates the driver to gpiod API, and removes yet another use of
> of_get_named_gpio().
> 
> With this, invert the logic of the reset pin which is active low
> and add a quirk for the legacy and incorrect device tree descriptions.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  .../bindings/net/ieee802154/ca8210.txt        |  2 +-

Bindings are always separate patches.

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

Best regards,
Krzysztof


