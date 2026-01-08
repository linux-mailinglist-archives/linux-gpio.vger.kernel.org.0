Return-Path: <linux-gpio+bounces-30300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33608D068DD
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 00:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02AF1301E998
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 23:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A6F335542;
	Thu,  8 Jan 2026 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEQauQcj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C3D221FB6;
	Thu,  8 Jan 2026 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767915499; cv=none; b=GtF29kzjRStdkLPJI+KPN7gTHWl9SqyqHwBD69FrVLrc4Fb/D25nm84D+CS37PUMqkIa/6Uicb0kagjZv2Q2iJIePSYBP2y1MVPcWJCVdqBMyzFU1J1xqlf5wema0KfhW2p9KW1RfO4fuN5pX9gBr/MIgY6u/T29yuMEjZvBAXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767915499; c=relaxed/simple;
	bh=yRZyKLmO7Lol22sNkcGpZCT9fMwtjVUEdeGzIuxRZHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQ4zqsCF/SfksC0c3mNZ7w2jvI4XT6TIAmgEdsyp4EG4L2E9rEO1DynHx4uM4X48S/8ImO/nzXg6lgl2eiQWlKePmA5Ego8nCqP5ulvTYNiwXWnsru3cgS961iAVBXIvuli/Xb5lRFMA6h/4ue22RdstBhMMg+IZkgq28FVwBc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEQauQcj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B17C116C6;
	Thu,  8 Jan 2026 23:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767915499;
	bh=yRZyKLmO7Lol22sNkcGpZCT9fMwtjVUEdeGzIuxRZHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEQauQcjj9DR8eS5xBh1f+QJSPEmbPc5gryyOJTg+wzKnG+MQztHAyb79Fb5vlEA2
	 k3KjN85YH3EvJ+HQXkL0CG322HSgnGPSBh6lE08QSrqvDsS7I6+Ao26t+xa1LDmbkl
	 fxQ5Uf2kQC4d4292F1t34I7BMVweVD+MOv5SprWxIzmbiy4ijYlcNwlko62rOoC5+W
	 EVK5EzDtjCi3CM2uvgX0paets5ArMbqDjUs+TKp8tIjPfaOZulfbrcv1oO26I1hgm5
	 0Dhzh6R2Avdwy6XI6taTz7U2GGfNOTopBzU6j7muHcrN9tkCIwsANy6JQ2kk+lrZd3
	 CYddXdT34TRXQ==
Date: Thu, 8 Jan 2026 17:38:18 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@thingy.jp>
Cc: linusw@kernel.org, brgl@kernel.org, saravanak@kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] of: Add a variant of of_device_is_compatible()
 that can be build time culled
Message-ID: <20260108233818.GA1466897-robh@kernel.org>
References: <20260107030731.1838823-1-daniel@thingy.jp>
 <20260107030731.1838823-2-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107030731.1838823-2-daniel@thingy.jp>

On Wed, Jan 07, 2026 at 12:07:30PM +0900, Daniel Palmer wrote:
> In a lot of places we are using of_device_is_compatible() to check for quirks

I'm assuming 'a lot' is not just 3 places? Got a rough estimate?

This seems fine to me assuming there are more.

> etc that are simply not possible on some targets, i.e. a piece of hardware
> that needs special handling is only on one specific ARM machine and your
> target isn't even ARM.
> 
> Add of_device_is_possible_and_compatible() that also takes a Kconfig
> symbol and checks if that is enabled before calling of_device_is_compatible().
> 
> The Kconfig symbol is build time constant and the compiler should
> remove the call to of_device_is_compatible() if it is unneeded and also
> remove the data for the compatible string.
> 
> Another merit of this is that in places were we are checking for quirks
> outside of drivers themselves, i.e. in the gpio and spi subsystems where
> some legacy devicetree handling is being handled for specific devices
> is in the core code, when the drivers that need the quirks are removed
> their Kconfig symbol should also be removed and it'll be easier to spot
> that the quirk handling can also go.
> 
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>  include/linux/of.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 9bbdcf25a2b4..70be20b0be22 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -358,6 +358,8 @@ extern int of_property_read_string_helper(const struct device_node *np,
>  					      const char **out_strs, size_t sz, int index);
>  extern int of_device_is_compatible(const struct device_node *device,
>  				   const char *);
> +#define of_device_is_possible_and_compatible(symbol, device, string) \
> +	(IS_ENABLED(symbol) && of_device_is_compatible(device, string))
>  extern int of_device_compatible_match(const struct device_node *device,
>  				      const char *const *compat);
>  extern bool of_device_is_available(const struct device_node *device);
> -- 
> 2.51.0
> 

