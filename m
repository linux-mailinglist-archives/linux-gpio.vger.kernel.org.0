Return-Path: <linux-gpio+bounces-26298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE73B80059
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 16:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC84C1B22075
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 09:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419822E8B7A;
	Wed, 17 Sep 2025 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKe5MBSV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E808E26B2DB;
	Wed, 17 Sep 2025 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758100813; cv=none; b=cV8NlTojlalOC+7vBnlxZjW9Jii6DOYkJyvttk5w2CSsaQ1CZ30EQzz3fMXZ3JIT1St/F0Z/HdMDrobnp+aHI00ndaa1xat2wcHy+fzR6C4k6sMXcLqsGPWpw/wjQ0rpCELmbrCOdgMzDC25VqssQIb9OprdE/O+Cq7cN2Fz5og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758100813; c=relaxed/simple;
	bh=StpFawo19worA0rs0jnoMKx2iOV9C2fa705i8857O34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lO+lv++traLORtBqUE0O3lOXNLqJATRpSx4N5E7VVFYhgv0QPfAxziO9vZmQd5PgUF55TNchJ8hfG6oHnyZn7qX9eo0mkr/C2Dj8lxjomppny/g8IIynfErZCjBZ67WTxNjkwKIonZ5x+gt9TnmK0GlOzCphD5iY10aU4EC4Qtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKe5MBSV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DF9C4CEF0;
	Wed, 17 Sep 2025 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758100812;
	bh=StpFawo19worA0rs0jnoMKx2iOV9C2fa705i8857O34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZKe5MBSVZJTvg/kPE+wl63bGOoWBIU9dsidqfP5sOi4Eqbcuw6V76OWnV/vzJDJia
	 rJ94dAK92ul1sRmg8xy+3SeYIJIrdK0DUdfXfTKmxvIYqhcQ7i8IPx3Mixbxs0VNia
	 mm4+IPH+7fNe08PZWGD7HtrhAiKN+bmdhU3DRiQt+1/4evpbTnDfTjB1SNB5d61zzR
	 Z2IetMWjKo09Hfxg3JGNkY1rJn05GQDC4CAH5Uan37XX9aoeocBaQZuE5vFoS3Kysx
	 aRbGKmAtcAzNWScXIV1684qBIulB40m/W+MJp4oop8eWDkdjru8Oj5kRrqT5exfAKd
	 hHomotwtsAG3Q==
Date: Wed, 17 Sep 2025 10:20:06 +0100
From: Lee Jones <lee@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 04/10] mfd: simple-mfd-i2c: add compatible string for
 LX2160ARDB
Message-ID: <20250917092006.GC3893363@google.com>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
 <20250917090422.870033-5-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917090422.870033-5-ioana.ciornei@nxp.com>

On Wed, 17 Sep 2025, Ioana Ciornei wrote:

> Extend the list of supported devices with the QIXIS FPGA found on the
> LX2160ARDB board.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v2:
> - none
> Changes in v3:
> - none
> 
>  drivers/mfd/simple-mfd-i2c.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 63ac26388860..6fbe85437d8d 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -115,6 +115,7 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
>  	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
>  	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
>  	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
> +	{ .compatible = "fsl,lx2160ardb-fpga" },
>  	{ .compatible = "fsl,lx2160aqds-fpga" },
>  	{ .compatible = "fsl,ls1028aqds-fpga" },
>  	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },

Please keep alphabetical.

-- 
Lee Jones [李琼斯]

