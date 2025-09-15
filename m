Return-Path: <linux-gpio+bounces-26187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F09B5860E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 22:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F4DC3AA2BD
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 20:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044C5296BB6;
	Mon, 15 Sep 2025 20:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAGklpnG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B224F2747B;
	Mon, 15 Sep 2025 20:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757968156; cv=none; b=qMrFBln39GL6x/cs7a/LWwzyMHgPQdTG+Z8MrRXeONrr8xS+L6oRhzrr/tWGzo5Lqa1VGg1g+Uq6PBYYV1F57q70v8juBv7iopgWH0kI61MxmMbeF0nUC00WXG6lesQVubpoNFZ6UvyduLe3tUJKcR+/QaVH5PJJWa26bNQf2po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757968156; c=relaxed/simple;
	bh=EQpTo/RgoNKX0mXkKrafjmm1nM0eoEouMnKpfDPXiLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukwJ4v9ChoTOAuChvOkN55nFly368vf377rP832OtUASkmjP0i/GwI/BBB5fvRTjebUiXgqgFsYvvlqa777xeWdaV/DC4aYXLOxdb1dUFc27OGBUmJ7wleNSTEBfu9wcnSoMNDVtN6dYjLNNWzoCfpq/5H6i3z/5wZBFIaJGxPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAGklpnG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A117C4CEF1;
	Mon, 15 Sep 2025 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757968156;
	bh=EQpTo/RgoNKX0mXkKrafjmm1nM0eoEouMnKpfDPXiLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gAGklpnGWNP2a56z4dv4JQ6l99jWPRcvfNdLwJg6genX7OTzgF5JF5rXPrN7MHVUk
	 2lcS/iKj8jot5wQEPEJoUeCFAE551diZ5qE6n6JcaUKH8ryhU129S3vx9l5zoJGnin
	 u2t9A4SeeG2K8BgdfSmRXMztyvDMzoyuYgAO3TtGk8Fl5mKbHPj+qk28auvMl5Y3Dv
	 C87IBGjJgdXy0BYzTrwrEnvJyyH9aPwwWVaS1fMG2LZwMpJIdk1xkbBRC0DZPhrBNh
	 hry9bzRG1M3+izr6YM1CIOn2U1ZXSY6/V3l+sYKxoo/rJAN90Lzw0uyaztnOHoFQlo
	 rOdau0R/rjk/A==
Date: Mon, 15 Sep 2025 15:29:15 -0500
From: Rob Herring <robh@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: gpio: add QIXIS FPGA based GPIO
 controller
Message-ID: <20250915202915.GA3338804-robh@kernel.org>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-2-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915122354.217720-2-ioana.ciornei@nxp.com>

On Mon, Sep 15, 2025 at 03:23:46PM +0300, Ioana Ciornei wrote:
> Add a device tree binding for the QIXIS FPGA based GPIO controller.
> Depending on the board, the QIXIS FPGA exposes registers which act as a
> GPIO controller, each with 8 GPIO lines of fixed direction.
> 
> Since each QIXIS FPGA layout has its particularities, add a separate
> compatible string for each board/GPIO register combination supported.
> 
> Since these GPIO controllers are trivial, make use of the newly added
> trivial-gpio.yaml file instead of creating an entirely new one.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v2:
> - Used the newly added trivial-gpio.yaml file
> - Removed redundant "bindings" from commit title
> - Added only one compatible string for the gpio controllers on
>   LX2160ARDB since both registers have the same layout.
> 
>  Documentation/devicetree/bindings/gpio/trivial-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

