Return-Path: <linux-gpio+bounces-30441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CA5D117F4
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B23E3308A997
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 09:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B9934845D;
	Mon, 12 Jan 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NW1IWrUk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB23D329E76;
	Mon, 12 Jan 2026 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210012; cv=none; b=VOq2sRpxTEJ46YXP30ogAiNj2UD19N1oMLcdusCgsJd8zZnAZDcJ0I0ziFiDMc/ITWgOrzcCI7443wwlbr8h1/cQ5KM6h8h8pVTKkSL+r779QF/Brx+X5Fi3FzTBgU8nUIMNJHub3Xo+dKGM7FJpoTOx+24DYA4Tpp+jH1TdZ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210012; c=relaxed/simple;
	bh=jBazrOCw38rW6h1m2e0Cft5KuiYhVaHYsHaQV1DL5NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E699JfeGeaccs7e/X58BX/5XAt09jyv1q/kOHUsisqomYAB0AcQ4wQdqdzQxJM2TugSUQRYuooZMQqj0G7Hev/vGLuM3aRhteMuWjM5opmr/uNJiF/pxaW+SUAOR3V+R3REVDqlRwlhtO8n9gvT8OufWit0S8gLXm1Q/9vmN6gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NW1IWrUk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7924C116D0;
	Mon, 12 Jan 2026 09:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768210012;
	bh=jBazrOCw38rW6h1m2e0Cft5KuiYhVaHYsHaQV1DL5NY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NW1IWrUkmt3jwikhdyS4KdHgsvj+TX8VCgpkBOBQfmXyGcdnaCtoYboAiesaeHkc7
	 K4HycwM1hbCub5IcVC/TSiNK7FROs9mBiqrfANzJY9SYWFeaAD0r30x/Y53/8UVNH0
	 4/ek5l2zIcTIOdjjKKAsZgnow2S7V7nxeXIMXRJ02Pdti29MP3+ITuShMXNADJwnqv
	 POQTH/uO1MT9PIvMyN49sUxq/gCDkA5J3IjDHOfpBpCZ/BHFe/IgNLJMpeA7ilOv0g
	 kauja+EtmHhnITd1Z8Bvr71W63h/U25o8mhhn3ecztSDfdfmiRKz7Hg2nDMWgsNdJf
	 yi2MgVySehwBw==
Date: Mon, 12 Jan 2026 10:26:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guodong Xu <guodong@riscstar.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: spacemit: k3: fix drive-strength
 doc
Message-ID: <20260112-sloppy-careful-lobster-ca42cd@quoll>
References: <20260110-k3-pinctrl-io-doc-fix-v1-1-7872fe6efb80@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260110-k3-pinctrl-io-doc-fix-v1-1-7872fe6efb80@gentoo.org>

On Sat, Jan 10, 2026 at 08:20:59PM +0800, Yixun Lan wrote:
> Fix a typo in the documentation, it should be the 3.3V drive strength table.

This needs wrapping.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


