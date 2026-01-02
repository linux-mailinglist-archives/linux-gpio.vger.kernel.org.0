Return-Path: <linux-gpio+bounces-30087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1BCCEF6A9
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 23:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7B6F3016357
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 22:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58812D877E;
	Fri,  2 Jan 2026 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWZIKhNz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63514277037;
	Fri,  2 Jan 2026 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767392514; cv=none; b=EVm3/9oQmwdODy2w4zDjg0Iinxjx+1ZUsX9R226loxt6hFviK75kMm4jHSe+vK5Bcl3UNqdIiKeFYz4da+B4ZqG5ynSIdYt1hpKqkHI9XulwatKdDn1WQyaX68iTdnTEdJwd7zQIbFOpzVvNNnsin0jW3F4YtbYCX+gxic96Oz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767392514; c=relaxed/simple;
	bh=EuNLzlV8r8Dinon10Riipi7R88Xe9qFlOj4ZVceZa/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHyz0/UEen93yEttw8On6r+uDlGQ0Kd1TDgLNtlkWEoGuq1L76xJtLDoo22Clp+/6vtp6JDl7w2awUqmsXxAnFNinknNZIexu9iEx3m7hTbZAdBz43ddJGMq+xyoq8PrfUTsCxtXj5iMgdWZxqDPHaodE8ZlMVyJ18XB/f6fB0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWZIKhNz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5462C116B1;
	Fri,  2 Jan 2026 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767392513;
	bh=EuNLzlV8r8Dinon10Riipi7R88Xe9qFlOj4ZVceZa/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWZIKhNzEB80owCh/NWA4FrrPhPUfGz+puZjrw8cTOivwCmVTN7FiN1qN2uq3tGLD
	 BU+ZidiHrcuNI0SXFvSXTlaHrn3H7r6ulyI4j/xdxZ3bOQf6LVzB8AnzSLwMIyVsL/
	 deUWsv25lpeSkvqG+qAPpFMio3XMsSYZUXjp9C5Gyw0vdoaggt3Hmz3BiXJX0Sf+k3
	 L9lo3f95n4SO3vkg7iOITUpU9aENXWUHriiiJm0Tgnub1b9y4PQKO/D8dXUGXQ7j7Q
	 F9B3Btu6p87Jw4d8lMSVhSfXB3WFuNtJ64IkbUbq3SvD5c358O7KzYGYIpUlvVuj3P
	 5A/4M+uKOfrFg==
Date: Fri, 2 Jan 2026 16:21:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: sunxi: Allow pinmux
 sub-pattern with leading numbers
Message-ID: <176739251233.279904.10109675432814007356.robh@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225103616.3203473-3-wens@kernel.org>


On Thu, 25 Dec 2025 18:36:13 +0800, Chen-Yu Tsai wrote:
> The pattern for pinmux node names is typically the peripheral name and
> instance number, followed by pingroup name if there are multiple options.
> 
> Normally the instance number is directly appended to the peripheral
> name, like "mmc0" or "i2c2". But if the peripheral name ends with a
> number, then it becomes confusing.
> 
> On the A20, the PS2 interface controller has two instances. This
> produces pinmux node names like "ps2-0-pins". Make the sub-pattern
> "[0-9]-" valid to fit this pattern. Avoid having to confusing "ps20-pins"
> name.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


