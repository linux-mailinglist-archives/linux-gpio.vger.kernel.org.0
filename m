Return-Path: <linux-gpio+bounces-9029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E1095C695
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 09:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 842F0B22166
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 07:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C95F13B7BC;
	Fri, 23 Aug 2024 07:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNCEbbOO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1913BC2F;
	Fri, 23 Aug 2024 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398530; cv=none; b=nkiVXqUVujkM6O4pjJpziP+8ckqZpEKcJqgRwARksEgk+SwPmt9qiVV4Fb74WhLTAZKQr3eDY7KgDSQS8+h77SWjt+ddVlgfBaZ/81892Cu1Mv7Y1wXT5OJ94y88TjAqzqWyyfSinLQOHApGpaksut8TvMJVI6ZqJXW1ztkW5lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398530; c=relaxed/simple;
	bh=31BzUJaUWOeYiOCtZiE1g2D7WGT7TmHDMKeTPn/GCnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTHWb/E+HnIvjsrhELV6ZtQJC04d+cSLys72ibRMBpM3Xu3xndSqvNtNWtZrtANnaegLW+yjkInBMHnIJIwRo0lgCEOvjGL6RMpaVqHTq/7UbI9Q0WOJCVmy/ZbioNy1lWvyLNwp+g9QhmZtGKBGQmDRCoNF7HyEjz9wvJ72ILY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNCEbbOO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78381C4AF0B;
	Fri, 23 Aug 2024 07:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724398529;
	bh=31BzUJaUWOeYiOCtZiE1g2D7WGT7TmHDMKeTPn/GCnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNCEbbOOoeVLJ1Drg2L1X13c1P83VH65FS9OE9Aj61YcAp0bRJneicrxjGhsHb/bK
	 EvmRvaKXgpgPeCB0ovQekYAn8uaDbcgOQj2T9i4JeckbUQdUBNNNqguqEfxs+gvPyj
	 Fm6CFz2guFUbx9HlPkyWkEl7xWPlBA987qn9sJxNPztMYTWzT7WyoE8vn2IC3RsMs6
	 S3K8lnmXNjlNxBpkXqt5w8LCbUuk1MOqZBPds2o+L3txnipuWdMPdUigzVhgvVAEmZ
	 lSUoaImTp3Vf+8ud3+NqsHRxCs+W3dOXy91HC1V7JRWmHMMLuGKexNgqFneF4JmDGL
	 +9RbuTm81MzhA==
Date: Fri, 23 Aug 2024 09:35:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shresth Prasad <shresthprasad7@gmail.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 3/4] dt-bindings: pinctrl: Add rk3576 pinctrl support
Message-ID: <bsaurbgipklfm5gaa3iem4xp5iuck6hv2lnl4zohqktk3k56kl@3qfuxoiv77f2>
References: <20240822195706.920567-1-detlev.casanova@collabora.com>
 <20240822195706.920567-4-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822195706.920567-4-detlev.casanova@collabora.com>

On Thu, Aug 22, 2024 at 03:53:38PM -0400, Detlev Casanova wrote:
> Add the compatible string for the rk3576 SoC.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


