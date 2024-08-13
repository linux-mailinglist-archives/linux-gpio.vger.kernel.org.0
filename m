Return-Path: <linux-gpio+bounces-8732-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 775A9950B9C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 19:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3924D285E44
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 17:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9A71BC5C;
	Tue, 13 Aug 2024 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fm8zsAME"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C7519D8AD;
	Tue, 13 Aug 2024 17:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723571312; cv=none; b=m4DbtJeXDyzUrveMTAlx3dG7inWNd7ZR3wRn+/geKgddh4wWzpSwJlqWd+TS6QXtWMgk3n5tSpuEEfI6QJ7ZWxm+0NRob5NfoRnzGZsWe5ewR4KcdwARiKnzw6kV3+NDkASNMzMPfPvtJY6sYGBf2qCwh4y8e1/0FYLR2s4TrWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723571312; c=relaxed/simple;
	bh=Ms4ihaFoQrIYM8rQJm4z8JFVE6jNIZ6YA5jzR+bj8j0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbeNJukZ66+Uv94Mnv4W0mvtu5o+GcOzoiF26z0C8aSa1DjteZ7H1LeEIZd+DFMNNtR8OdhrI3HXan6QOzJXfBu1kore0ucrn+YpwzO8IK5gFyTN7rKUUnJm9PM9zkGZYudIu7lI7PRqsc/dQEYNtvam+B5wQdZWe33R8ejGt+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fm8zsAME; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF1AC32782;
	Tue, 13 Aug 2024 17:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723571312;
	bh=Ms4ihaFoQrIYM8rQJm4z8JFVE6jNIZ6YA5jzR+bj8j0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fm8zsAMEhSvUUsADRWCbEq1WK8UvD+OkrPwBL4elTiyQSmPH5Vq3MmlGZmNdM821X
	 fZKh0K88gkRG8FyRwqhTUUAyRab3qEkcSsLOqZPXE2WfAzAotMYs1N+oyfGcdfTE9Q
	 ZkGNMACI/iUbqdtFjIrISHRRHe8cJvGUrUkxVuN+LNLdonWU9MER+ukK5EYGgAjlfr
	 a4+cTxNVpvw8FuSSD97+g+8R0srvgB4M6N5Znsm6+WxRis/sSz+yMG5H33TSIMIwwv
	 CSFF130+ZayE69nXjQXEfF8REM3SxQ/V8l+2iccQPf3oSaNiJfhC3kBm+AInI405R3
	 yH24pSpZKVn2A==
Date: Tue, 13 Aug 2024 11:48:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-gpio@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M2
Message-ID: <172357130985.1410466.6907563284792299033.robh@kernel.org>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
 <20240807090858.356366-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807090858.356366-2-ivo.ivanov.ivanov1@gmail.com>


On Wed, 07 Aug 2024 12:08:49 +0300, Ivaylo Ivanov wrote:
> Add a compatible for the Samsung Mongoose M2, found in exynos8895.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


