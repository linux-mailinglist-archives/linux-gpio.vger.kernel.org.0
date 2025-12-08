Return-Path: <linux-gpio+bounces-29360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E6DCAC2E0
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 07:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 003B1301CD23
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 06:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C37B31A041;
	Mon,  8 Dec 2025 06:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nykfMKXW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464EB26ED5A;
	Mon,  8 Dec 2025 06:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765175256; cv=none; b=HGEpy6aAIAPaFmOFMrGQz0dmJjdgm8OUBkAd0EI3hPKeGI8ALigCoxzODTMFrYIR+Bxm7W09fYp+lEFcb8EhidNnlHhKx0iL58TqsEK8vdiRWAy0BnCuyZZdhfo+LlZlKOJtPtGR/M6hjUb0+d4XNnPeAqfC6maOzxDb41APRV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765175256; c=relaxed/simple;
	bh=Hp23V7WQ4hdq4eaq36/CtuzG1kKtK540egqenungytg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZwxd+uncjvRsY9QO8Pa4xtcOnIcbp36XlYMb8vzTZrVeLGxIfXZxf3iWsE56MplzzbqWP6++sK5b5mWzYaWEcDiQHSLUjpzHvcZPqnSbok8LvC8C5ssN2MJ6Ew8zAxSVEy+oYm5SCTE9OgM9aQ/WJnUCqF/xb8n8xtCx5mNmfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nykfMKXW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD61C4CEF1;
	Mon,  8 Dec 2025 06:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765175255;
	bh=Hp23V7WQ4hdq4eaq36/CtuzG1kKtK540egqenungytg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nykfMKXWENpqvv3ZSD1vtRCbv8AL8AqALnHbNHdY9QXmGE0xzTAY+O4s9Q6wcposC
	 RlBcBTLn8ATXQb/7TS+VUk9SamoHGAWpfsFI+Bcav6pFB7mWorClk0Mb4nNO+QDZnt
	 0dM4qEtYluoep4VYN0ZMsQhCIJnsviW7KIVFzuNlZp4evDzXVo1c8Yq0Ue9S5tUnmW
	 MJDsMOWgL5hN1qlDVywn6QSCJjVeLo9lIDg33i/geih5laKv3SvgyZWRngipq13LVi
	 cuHaVnB8Z2ApTWb+pzaZIcQxaBdt2o04Yge8u/barMZXqOMCc5nqssQNScNftnGYMT
	 CAO2dLntaI09A==
Date: Mon, 8 Dec 2025 07:27:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Subject: Re: [PATCH v2 6/8] dt-bindings: pinctrl: Add header for Rockchip
 RK3506 RMIO
Message-ID: <20251208-tidy-kiwi-of-calibration-c9a8e4@quoll>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
 <20251206050844.402958-7-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251206050844.402958-7-ye.zhang@rock-chips.com>

On Sat, Dec 06, 2025 at 01:08:42PM +0800, Ye Zhang wrote:
> Add header file with constants for RMIO pin and function IDs for the
> Rockchip RK3506 SoC.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  .../pinctrl/rockchip,rk3506-rmio.h            | 143 ++++++++++++++++++

That's not a separate commit. Don't inflate the patchset you just make
it more work to deal with it, this belongs to the binding.


>  1 file changed, 143 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
> 
> diff --git a/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h
> new file mode 100644
> index 000000000000..5d39690a0b28
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h

What is the compatible?

Best regards,
Krzysztof


