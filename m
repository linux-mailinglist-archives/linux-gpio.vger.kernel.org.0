Return-Path: <linux-gpio+bounces-9028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C595C690
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 09:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55C832857D5
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 07:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01FF13C3F6;
	Fri, 23 Aug 2024 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7LgLcZF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FBB49658;
	Fri, 23 Aug 2024 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398504; cv=none; b=N1rSHVjWSTRYOw0Y7wtttIDkg5Z/3f1tO/ZDqypogus/la6iMsRcvXgJ0bZpTzDFEgFQpJuJKDozKOz055slk0T+HZcfKATzXu2aHBLJMOBRjw7MvzEGqDhR8vlsnI8uMgfefMLAEv+UnT93LW7VxBzWuhrDMZZjiO15NHeYEIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398504; c=relaxed/simple;
	bh=xm/Zy8RPb/4qtOGQsXzDj/I3iSozFPibaFGaA1E0fuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSQe/F02r2YvL8SlLStw+buCHKhfhQXr+K8j0Yx58VursvkCs1VZxzOSUPXlHsyCodnVAkVe9oP6Q/fY6xu8zv29k3YOfOVvqGXpVp/nMme7j89uJAbsw0+u0zaFuK3XcK/6U+nKnMQA9mYAuhxxIYDjObJzaAj4/ku3SXNG+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7LgLcZF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41B5C32786;
	Fri, 23 Aug 2024 07:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724398504;
	bh=xm/Zy8RPb/4qtOGQsXzDj/I3iSozFPibaFGaA1E0fuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7LgLcZFBStjr9MkjKbCyCmQVX/G2x+oTxqr67hEYzE/1MOhbvSgMfHxYkg9IXITV
	 L992gVPykZ/x3bW6PzeHcGREanTR1gHPQpaBn4oxwiRHB0oHzkA3QDe/6ov5lGU8xD
	 TYyOtMPiJGB1dE0GjTLNbBi8EwUDhLNFF1pE3e5OCgVgqZZM395yqRZxWVlhZFcts7
	 rSwJSfYb47uA/nqnOg9JV01gOOvLNC8jzoxTmFlGl40TxLftMlKGwBtHixJZbC88cp
	 F3tjqXmCiPOpuYWfTIDeGJulvzQuTKFy/41dxPNoapnUqKN0AnyGksk2YcoU3QDQt0
	 VnYW0c9Pb9VXw==
Date: Fri, 23 Aug 2024 09:34:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shresth Prasad <shresthprasad7@gmail.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 1/4] dt-bindings: soc: rockchip: Add rk3576 syscon
 compatibles
Message-ID: <6o6mzsaldua2wvc6swxs7yz5sy7bkus34xtpojkli6fonhczaw@bxe6f5dwb35u>
References: <20240822195706.920567-1-detlev.casanova@collabora.com>
 <20240822195706.920567-2-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822195706.920567-2-detlev.casanova@collabora.com>

On Thu, Aug 22, 2024 at 03:53:36PM -0400, Detlev Casanova wrote:
> Add all syscon compatibles for RK3576.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


