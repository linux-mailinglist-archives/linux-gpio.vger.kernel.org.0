Return-Path: <linux-gpio+bounces-24812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB7DB31BDC
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 16:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47A0D1D04854
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 14:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145A7322A0C;
	Fri, 22 Aug 2025 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hky698M3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5047308F17;
	Fri, 22 Aug 2025 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872686; cv=none; b=ptz/k46hOTgPHGqzJs+UHpMYr2CRWQmQfe9LoShGKfIsYXBaZKO3wgCILzPMoM7Jz2chWT+VM/+JjmuL7SN81kyQn8kXWOo2kEiYPlyBnFbfcNtuQx8EmlXqewmuo+9OE44yWumX4Hh7jfl3o1t+JaeGhsCRtlYtEa6GhjfiYeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872686; c=relaxed/simple;
	bh=HFVpnX0R7jrpMF7KCx0+/Ci75McUnVWl8/IVi/u3Vok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzqjuSFFH+bArqK38UWc3kNqgt/GmYlPvMyaOzOxoKzzdnslOg36AJfoDIGiIlWhBDxGcKCi/O9bAGOB+F0SJgoH1MhQocHmw3ZehH/g9DuME1ggIcI61zKFXQ8NJL9LdGlo1E0HUOYBLGHJS0qPS0qdEsSy4GosKNSgk6RpPFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hky698M3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88552C4CEED;
	Fri, 22 Aug 2025 14:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755872686;
	bh=HFVpnX0R7jrpMF7KCx0+/Ci75McUnVWl8/IVi/u3Vok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hky698M3w3Jo60RFCZPhfHN5G7DcSjv84XvseS6cb9Xa0Jz4dBjalvr1xn9BQutiy
	 xVEdtZEzKaWTTIMG04jzqk72ASR/FjgoC+9c+ZohIC38I/k/zOQFMbLBW79c9AX733
	 fQUbEhQUyHeCEvaow195GZe5PVlql0QZv10ni0WlmV3pZEAh45MLOcXf5K8qT2L5B5
	 mATIGBkKKIyuBGjjV7axtXPVirB6+DocVA7kT/4XuzAJXC9LLZ9qlv4aLBhX9QAd5A
	 vm20Gt+ONBuJjZHo8E2AhLt410c2f70af5NHvd1K1YBv/UDLE5jjkC4tSoIFTg6SVc
	 1Yg5L8osXhbQg==
Date: Fri, 22 Aug 2025 09:24:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: gpio-mmio: Support hogs
Message-ID: <175587268530.3633026.8738384877552624323.robh@kernel.org>
References: <20250820-ixp4xx-eb-mmio-gpio-v1-0-0e167398c8ac@linaro.org>
 <20250820-ixp4xx-eb-mmio-gpio-v1-1-0e167398c8ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-ixp4xx-eb-mmio-gpio-v1-1-0e167398c8ac@linaro.org>


On Wed, 20 Aug 2025 12:59:43 +0200, Linus Walleij wrote:
> We use hogs on some MMIO GPIO controllers so make sure the
> bindings support this using a pattern property.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


