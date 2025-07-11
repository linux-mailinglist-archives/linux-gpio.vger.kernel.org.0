Return-Path: <linux-gpio+bounces-23169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E721FB02317
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 19:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 264CE1CC1E75
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 17:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BAB2F2C69;
	Fri, 11 Jul 2025 17:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="uj9dfWnj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE142F1FEA;
	Fri, 11 Jul 2025 17:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255952; cv=none; b=rMMDoweITyxmGIUBKq7JMDKeqb5VELY9bH6rVO8BWPYyoXr+dl+hsnBKGN+OH4qnfucgHmjm4JXGkT5rchCQ3+avyzdtRscng8I9v1LvxOzKBFPF5rRv6dbB/z7k20shGFmWU4rUuWKe+KW4Mh4dex2Oc57ajIsKLMLHfdGoH7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255952; c=relaxed/simple;
	bh=gTtmzGAho0/kpLMq/rQ9GiAbaHXVkLQwGlLy9bJFCg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pX4YC7qq4/AjCWyB03kvZZPIPZUJumvMMXXikWOuTJlKuLT3qxF31qEmwM8p0XAd6EPzFgUlnmnqEYETEgqkO4EDYWASqxEreSU5tihWnPX9Z51pVXPj5CreGn6Q6P8jGS7JdNHg2rUwDNJAcxOtxLyvYRqr86n/jDQL+aUHlCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=uj9dfWnj; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ExkamNC7McGBH1hZ10p19CgCVaSCJSLnaf81SQJSzIk=; b=uj
	9dfWnjyR/w4hG/rdGRjwMdIleCeHoy/6FZH+ucO2J8OrlJBpQVGfx62VjfuKOZB6b+0ZVvuC9kubI
	INSGgJHMz6xNLFNqcl4CTieX9KZr8IoeCt+LAhOVsFj5A4aOJMsairdRTHfa8PmlQCiIA1yl/sPCU
	Jd34ctbyNym9sRA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uaHoi-001Fy5-2H; Fri, 11 Jul 2025 19:45:48 +0200
Date: Fri, 11 Jul 2025 19:45:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
Message-ID: <55e7aeb5-565f-4452-bc11-55968dcc0a9e@lunn.ch>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
 <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
 <CACRpkdYDTXA7+YN2zRCsQxu2AKEAwbDVq8-m27ah5XTw9iRNPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYDTXA7+YN2zRCsQxu2AKEAwbDVq8-m27ah5XTw9iRNPw@mail.gmail.com>

On Fri, Jul 11, 2025 at 07:43:13PM +0200, Linus Walleij wrote:
> On Wed, Jul 9, 2025 at 5:09 PM Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > This is not my area, so i will deffer to the GPIO
> > Maintainers. However, it is not clear to me what get_direction()
> > should return.
> 
> This callback should return the current direction as set up
> in the hardware.
> 
> A major usecase is that this is called when the gpiochip is
> registered to read out all the current directions of the GPIO
> lines, so the kernel has a clear idea of the state of the
> hardware.
> 
> Calling this should ideally result in a read of the status from
> a hardware register.

O.K, so completely different to what is proposed in this patch.

Maybe you can suggest a better name.

	Andrew


