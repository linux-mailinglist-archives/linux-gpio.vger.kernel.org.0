Return-Path: <linux-gpio+bounces-20101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8FFAB5CA1
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 20:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E111188DD8E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 18:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B57628FA80;
	Tue, 13 May 2025 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="nFjfmaiB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BF520E032;
	Tue, 13 May 2025 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747162034; cv=none; b=h0aYiQ7mRdeJRCqM8JmpIDWZg+KXco/lr5YGw5pj+nOyhmoRg3a3A6scC475YJQlq4HcNGKyttJYQsg1+f28SSpYvm47hfWtehQCSsPgOPvaOarZIia1cBYtmVf41M4BUFoPUIGm77oNiz8WfAAWJFUquA9/gEHe+6z1KgDds9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747162034; c=relaxed/simple;
	bh=RogUgGwR0FOP6KYfV+t2DS4AvPTOIL+mE8+yVO+7w0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLndxyVn/WLkKKlu8ryvCYSHPPmJ+HxZrN1G8KxK5q95EW7+d4OX+VslicM4mBNHDepKHgrF0p60/QwGf2Z250lfOaiw2JnCgdCNsYFZXqfiJPiYG9PvvI/4xwQBW0btyexUh5glVxIzjs+JSTdwZqv/4w1gzMBtvWFfoMp3IY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=nFjfmaiB; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=L61EUFuE+Uq6nCLl8f3dUo/UmLoSS1/cO7xG1BCxA+c=; b=nF
	jfmaiBN+QXzHcGAxI2akzGtdEYv8hNnwN5bDkrKU2qOZkD3thr9CvnhfbCh9Sws/nn88v0oDli/Yw
	LghD3qJnTInrgopOeQRV3Dp1XSP7Inlufs+3/c3btAMq4FEM+LMov4OghGMahsKm5qU/X3M3paV7F
	iOCO059MV0q/rTU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEueZ-00CULZ-Gk; Tue, 13 May 2025 20:46:59 +0200
Date: Tue, 13 May 2025 20:46:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 0/7] pinctrl: armada-37xx: a couple of small fixes
Message-ID: <f638f5ca-a479-4ab2-a8ae-6300bbe0cb08@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <60ef3803-4f8b-4d9b-bef8-6cf3708af057@lunn.ch>
 <CACRpkdbqPLaBheEv1=ky1gUJ-qSsPRjR0J-UXEuhXf2Oix_EzQ@mail.gmail.com>
 <aefa5ed3-1085-4e88-b3ec-4cf9958e7e2a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aefa5ed3-1085-4e88-b3ec-4cf9958e7e2a@gmail.com>

On Tue, May 13, 2025 at 06:51:35PM +0200, Gabor Juhos wrote:
> 2025. 05. 13. 15:36 keltezéssel, Linus Walleij írta:
> > On Mon, May 12, 2025 at 11:33 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >> On Mon, May 12, 2025 at 04:22:36PM +0200, Gabor Juhos wrote:
> >>> The series contains several small patches to fix various
> >>> issues in the pinctrl driver for Armada 3700.
> >>
> >> I'm not sure all these should be for stable. Some are clear bugs, but
> >> not propagating the errors has not bothered anybody so far, a
> >> requirement for stable.
> > 
> > So we are at -rc6 so I'm not sending these as fixes to Torvalds
> > right now unless they are super-critical.
> > 
> > I will merge this for v6.16 (-rc1) and then the stable maintainers
> > will have to decide from the point it enters mainline.
> > 
> > Gabor: can you look over the tags? Once you have decided
> > on stable/non-stable tags I will merge the series.
> 
> Sure, I will send a v2. Just a question, shall I also remove the 'Fixes' tags
> along with the 'stable' ones? If I keep those, they might land up in stable
> trees anyway.

For the return values patches, i would drop the Fixes. It is just
really continuing development work for the driver.

	Andrew

