Return-Path: <linux-gpio+bounces-27322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1EBF3A24
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 590C54848CD
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0082E7637;
	Mon, 20 Oct 2025 21:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDaHMmNH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4284D240611;
	Mon, 20 Oct 2025 21:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760994113; cv=none; b=U1D2wUf73ia1bOWY0UDTm7Lembn8evldFh7vNi+uesKwZ0CgzPpVdfbHFCX0HtB19gx5ZfY+4MvTpvkT9Q7yh+WJ2XvjAvkwtM5N5J36Mg7Kv31xmQFAfW/rB0uR2+NL02qPu0KLJ/r/vCA0dCoPeeoMwTJo4hZQ+7y5COnS41E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760994113; c=relaxed/simple;
	bh=88JGFP/B5Ncgyb7uwzXa0jRVFELTUL2aRbVKpTxgqRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EV114x4y/apEFxL0RhJZ7UwF38UStiHH6Bj6WLDeaudlKj3rTxWhD5HnaDnEtspQCQ4t/njDiYMmtQKTuvdtrBa3CXtayiygbARcElgPKL3H0g3TI+WzLN1QgJE9O3aL+aNY0QBm7dbho26iZV4aPpWYidgNLQLSsP1v25HFu/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDaHMmNH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E066C113D0;
	Mon, 20 Oct 2025 21:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760994112;
	bh=88JGFP/B5Ncgyb7uwzXa0jRVFELTUL2aRbVKpTxgqRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDaHMmNHLKJ43/8fFmoN9cOjkq6LRRKed+bmNq9htZmmqo+n0feFWQOeehOoBTl1G
	 IUssnvPXZeyI6D65zqkeyNGf1DgmCH63X3RdM+WbvURnL5eUM5vLVYni5KJK2ccB4s
	 +baaSAAI+FQ66pa3ozDrVHD9NrMRYkTvk1sDJEVjBdhYSQp8XA0hnLG+S6omKw21NO
	 4wzXVk+012ciJHvfVCXVZUBbtVnrUE8ZdCFptBYUYdbDADAMiH593s0DLoxt2J4pNL
	 ElUJXTCiB5/p1d3TlOzod/chN5+3fC24E6uZ4OUXiKSrAvwp+95VUatA0dCKht2Xnt
	 5lSkkO1XA4SNA==
Date: Mon, 20 Oct 2025 16:01:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Valentina.FernandezAlanis@microchip.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linus.walleij@linaro.org,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: pinctrl: document polarfire soc
 iomux0 pinmux
Message-ID: <176099411059.1819853.2443262969720536579.robh@kernel.org>
References: <20251014-retype-limit-e6cbe901aa07@spud>
 <20251014-ravioli-ramrod-84b478186bb7@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-ravioli-ramrod-84b478186bb7@spud>


On Tue, 14 Oct 2025 15:35:36 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Polarfire SoC, iomux0 is responsible for routing functions to either
> Multiprocessor Subsystem (MSS) IOs or to the FPGA fabric, where they
> can either interface with custom RTL or be routed to the FPGA fabric's
> IOs. Document it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip,mpfs-pinctrl-iomux0.yaml        | 88 +++++++++++++++++++
>  .../microchip,mpfs-mss-top-sysreg.yaml        | 13 ++-
>  2 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


