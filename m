Return-Path: <linux-gpio+bounces-29359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7BBCAC2D4
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 07:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 061903027737
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 06:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00DD31986C;
	Mon,  8 Dec 2025 06:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfKJHMPF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01C131A554;
	Mon,  8 Dec 2025 06:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765175197; cv=none; b=GLHtuWRxwKMMRVryw8UwKXe0STveZQOsCaQOLSYFUgKfshBOp/IoObqw9OpHRARscly75NVYc+LOuBr042c/6uKC1TYa/OHFOb18iPFe2eiFckrkpqQ0SNP0WYoO/vvAmyUqWT8v0aQHrAvKKmn+gvTS9VkwDHjKSohPEV8YQXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765175197; c=relaxed/simple;
	bh=VfRCSRSZyuEZiyiiHqC5815wiOeaBDWsPYTCQKLJ/0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0cMTlkhv4cBTI0D+CwbGTqlteZoYf+9aVQKQ1B6qdZDJ2KEEUWcTP+AYSGqR7Iy7TbUNjOP2YsPiRx12NxsF0XCJjLqgl0DcpoGbZGiYCfIqqg0nyvebuNGarRlz6LBJcdC/EjegXTuBHOIJAUT5a/KI1iFwLUeS8S849nkdkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfKJHMPF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE569C4CEF1;
	Mon,  8 Dec 2025 06:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765175197;
	bh=VfRCSRSZyuEZiyiiHqC5815wiOeaBDWsPYTCQKLJ/0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AfKJHMPFDsmEQcxLnriPrRfkvRcWTsG1BczsVXM8ICvi4aGxiaNpw4tN3WL7+yFQu
	 K5V5IOtf+QDgWJqOeTLCWCo3MgYXjjtQ3PSGH1qUDcjNIl2O+OQPMXICB79yhnmCyU
	 SzPSH63XGRbUBsTi/OXAgQ2VAdMbaNkTSrVhWcSR4lTeGPrlfq8RO+dDafpqBJgEvj
	 B4tfzH7Hl4tIyLRibD2M9bKgKQT8rPwoV9SAKiHxYNW3BWisSqIQX680lUM+lj3Axy
	 0nNnixe4CdOaI3hzqEnSrYH0aXCOYsh+gNK34b1426vXrIgH2XoAj5D6YEIXj/LWro
	 vr/8HBDasNohQ==
Date: Mon, 8 Dec 2025 07:26:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Add rk3506 pinctrl support
Message-ID: <20251208-invisible-ingenious-lori-b8aeb2@quoll>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
 <20251206050844.402958-2-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251206050844.402958-2-ye.zhang@rock-chips.com>

On Sat, Dec 06, 2025 at 01:08:37PM +0800, Ye Zhang wrote:
> Add the compatible string for the rk3506 SoC.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Squash it, it is really  just churn to deal with one patch per
compatible. Especially without any explanation in commit msg justyfing
it.

Best regards,
Krzysztof


