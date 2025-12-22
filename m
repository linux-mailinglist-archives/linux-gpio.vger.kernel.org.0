Return-Path: <linux-gpio+bounces-29783-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCF4CD4AB2
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 04:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 948423007626
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 03:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC03C326935;
	Mon, 22 Dec 2025 03:52:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233DA1E1A17;
	Mon, 22 Dec 2025 03:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766375566; cv=none; b=FzknpOKlLcWCioGI8B5g8KdwhvCJcnNdQyIj+ncMLSIWaDfven//CEgV4DH1EXijDMXZkZeEp+Ci/ljD3k+m3NyUU41MCyClKnhuiwvlF5gZb8jPXgobeaZAnL9iH36nTzIOl8bTs/XduSV5oUMNwwmJRgc9oJMOiROwQBVpx7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766375566; c=relaxed/simple;
	bh=lNjcJZs99nj+n2wCzcKNElXGlj4aHIpj14jiEAzsOiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RktBamLNv5qBHOyd6+D2aO+iGq+KOnGqqdm+E0AjiMzRsFxkmdoXkXD26CdJ+gwny3SvEHEPxBtG87ScTDl545HnO3dlQZ/0+U21fjP3CLzx+prZWmibaysUn6RfUbXpHKh1ePqhUTBcYklxVT5yXJQ1IHbtEicau7Qw2XCUTWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 21C9F340F69;
	Mon, 22 Dec 2025 03:52:43 +0000 (UTC)
Date: Mon, 22 Dec 2025 11:52:39 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] pinctrl: spacemit: k3: adjust drive strength and
 schmitter trigger
Message-ID: <20251222035239-GYB1977180@gentoo.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-3-f6f4aea60abf@gentoo.org>
 <408BBF8CF676D97D+aUiy2w1iP1LJoUOW@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <408BBF8CF676D97D+aUiy2w1iP1LJoUOW@kernel.org>

Hi Troy,

On 10:54 Mon 22 Dec     , Troy Mitchell wrote:
> Hi Yixun,
> 
> On Sat, Dec 20, 2025 at 06:14:55PM +0800, Yixun Lan wrote:
> > K3 SoC expand drive strength to 4 bits which support even larger
> > settings table comparing to old SoC generation. Also schmitter trigger
> > setting is changed to 1 bit.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/pinctrl/spacemit/pinctrl-k1.c | 163 ++++++++++++++++++++++++----------
> >  1 file changed, 116 insertions(+), 47 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > index 441817f539e3..8ca247fb8ba0 100644
> > --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> > +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> [...]
> > -		val = spacemit_get_driver_strength(type, drv_strength);
> > +		val = spacemit_get_driver_strength(type, dconf, drv_strength);
> >  
> > -		v &= ~PAD_DRIVE;
> > -		v |= FIELD_PREP(PAD_DRIVE, val);
> > +		v &= ~dconf->drive_mask;
> > +		v |= (arg << __ffs(dconf->drive_mask)) & dconf->drive_mask;
>             ^^^^
> use val here.
 should be s/arg/val/, thanks for the catch!

-- 
Yixun Lan (dlan)

