Return-Path: <linux-gpio+bounces-23069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC7DAFFE64
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 11:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C8C84A6F72
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 09:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2242D3EE5;
	Thu, 10 Jul 2025 09:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0XhsrQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D841E4A11;
	Thu, 10 Jul 2025 09:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752140860; cv=none; b=hy6+Qxk+MIyzs43nhScwu543g+lPVxHHNjsrL/uFDJsT5SZ7bjBOvxC0SEDxarVLmku3J2V+byGjExZx9hZkoOZq1Le8sWUXpYLKfOjgR3iBGkuSjAluMQxiiSCHUmMq49jv5Sf/r8CUjGQnmDH2b6dOxfDN8XQJ3rSrXmONNIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752140860; c=relaxed/simple;
	bh=/SH99nulsmsIPihSCZGmK0lFUhhNcG7Tobx27X0iTlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqX8zvqFSEmJnMkcaw0AmUbdnvQEYtJPTpX1577FXy102WP0dCo9SeFSxRmJY0aW17DHzWoZQIU3crlDWcPSJ7MAWGZIgJt1ix5LSUMMo5uYFBPqOvZaqnjwoo0mwp5EHbj6H10lbPhRUgip/pAGxZqEXHWKgyyfipUb/Y2Ge2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0XhsrQF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B28AC4CEE3;
	Thu, 10 Jul 2025 09:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752140859;
	bh=/SH99nulsmsIPihSCZGmK0lFUhhNcG7Tobx27X0iTlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0XhsrQFffw/cOHd+zvsUb1elpUAYde/VFsmNEHYSuuquGY0EdNldjyYpQqGu7HaX
	 McQoFU/yt0DGYazDg4O5keuiMNDmrVTNjHPuf2YO2Kt4v2t66+dBa2MPPhiHTsJlqA
	 1mpVnmDIvzwD7E6sw9nLlCVyS+s63wGvkm8orIWpbMncc761dJLHA3lOY6NJf7N+81
	 hJWfV6tS6X1MijScWsQQg36lI++iZ5yIasBWOf98YTzDl0oEtv3RpIHF0rZzkDVG0N
	 JJKttz4c4FkHi+sR4Qtf4Um/T/XBGjE9K+ClEgxfb4zkh4Ge2IbSyUpuu24xaFa7CX
	 XWPHzHJQr4ctQ==
Date: Thu, 10 Jul 2025 10:47:34 +0100
From: Lee Jones <lee@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Julien Panis <jpanis@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/7] mfd: tps6594: Add TI TPS652G1 support
Message-ID: <20250710094734.GF1431498@google.com>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250613114518.1772109-2-mwalle@kernel.org>
 <20250710090025.GD10134@google.com>
 <baa1eccc55fd406b3c42f6a5466b6be5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baa1eccc55fd406b3c42f6a5466b6be5@kernel.org>

On Thu, 10 Jul 2025, Michael Walle wrote:

> Hi Lee,
> 
> > > @@ -82,6 +87,7 @@ static const struct of_device_id
> > > tps6594_spi_of_match_table[] = {
> > >  	{ .compatible = "ti,tps6593-q1", .data = (void *)TPS6593, },
> > >  	{ .compatible = "ti,lp8764-q1",  .data = (void *)LP8764,  },
> > >  	{ .compatible = "ti,tps65224-q1", .data = (void *)TPS65224, },
> > > +	{ .compatible = "ti,tps652g1", .data = (void *)TPS652G1, },
> > 
> > I get warnings about this being undocumented.
> > 
> > Should it be added to:
> > 
> >   Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> 
> I've accidentally forgot the DT patch in v2 of this series. This series was
> superseeded by v3 which has the DT patch again.
> 
> https://lore.kernel.org/all/20250703113153.2447110-1-mwalle@kernel.org/

Spotted that now.  Thanks.

-- 
Lee Jones [李琼斯]

