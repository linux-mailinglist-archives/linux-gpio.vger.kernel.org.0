Return-Path: <linux-gpio+bounces-30239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A49D00F79
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 05:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8FA93015A9B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 04:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D44280A51;
	Thu,  8 Jan 2026 04:28:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8447494;
	Thu,  8 Jan 2026 04:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767846479; cv=none; b=ZUV28KNiJfYpBF0Hm0C9RyWqjZveA4lyxOAwdP1yvZwDYtsDMd31cURUNk647tKoWN/su+kauatTccnixFb94sfVpJcxZi7YJo57Ew4FJqsT0Wk5RSDgwOF3FR8LhsLDmEeW17AFpDK8YH4PnRTFIQFoWW7sayycMtnaiMMcW5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767846479; c=relaxed/simple;
	bh=zHZWIQePIvKiK5JQEBsXYdgWrN8v6sC165KGtecy9ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVD/slj57gE4LPTT53dCOs6yRfDdCQ1KRumWITrjEjgpChK9LhxvNjAlBygfXWkJd/c6yUW4ihDRvaNb9m5q+i5/tjkL+md0JrcPhOap8YBr0VXz3Ls2G5251lTmx5mv620NbqKf5KGhClr9+mPX0f+HHWrt3GUFLc9UrfxSAtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 76CDF341E9C;
	Thu, 08 Jan 2026 04:27:57 +0000 (UTC)
Date: Thu, 8 Jan 2026 12:27:53 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <20260108042753-GYA2796@gentoo.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
 <20251227-pastel-certain-orca-4b53cf@quoll>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-pastel-certain-orca-4b53cf@quoll>

Hi Troy, Krzysztof, 

On 14:00 Sat 27 Dec     , Krzysztof Kozlowski wrote:
> On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> > IO domain power control registers are used to configure the operating
> > voltage of dual-voltage GPIO banks. By default, these registers are
> > configured for 3.3V operation. As a result, even when a GPIO bank is
> > externally supplied with 1.8V, the internal logic continues to
> > operate in the 3.3V domain, which may lead to functional failures.
> > 
..
> > +	pctrl->io_pd_reg = devm_platform_ioremap_resource(pdev, 1);
> > +	if (IS_ERR(pctrl->io_pd_reg))
> > +		return PTR_ERR(pctrl->io_pd_reg);
> > +
> > +	pctrl->regmap_apbc =
> > +		syscon_regmap_lookup_by_phandle_args(np, "spacemit,apbc", 1,
> > +						     &pctrl->regmap_apbc_offset);
> > +
> > +	if (IS_ERR(pctrl->regmap_apbc))
> > +		return dev_err_probe(dev, PTR_ERR(pctrl->regmap_apbc),
> > +				     "failed to get syscon\n");
> 
> Actual ABI break.
> 
Indeed, there will be a ABI break.

so, how about not abort in probe() if no "spacemit,apbc" phandle found?
and then do it in a compatible way as old behevior

We may still need to drop this property from "required" section in DT

> Best regards,
> Krzysztof
> 
> 

-- 
Yixun Lan (dlan)

