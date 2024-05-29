Return-Path: <linux-gpio+bounces-6837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAAA8D368D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC725283190
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 12:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ECC17DE23;
	Wed, 29 May 2024 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fNJL9Pby"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32556181312;
	Wed, 29 May 2024 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716986276; cv=none; b=ZWhjWHCGlydodZkfbiUlmX2NE5hN/ruaVgT2176L/Xbr3Ltok68lfenoyxUci8Eq3zkwFug2GJksftsaRDDWf15VHtQzTWgGif2Z5PfTlmaKzVemEBFz+GTzKaAt+7l8kXjkDBnyIzEuuoO/2gU+Otxirr9+hhOAXdhdtAGmxg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716986276; c=relaxed/simple;
	bh=gU0p3Z6EN1jQ387TofAg5vU76es6ShzPxfqv4kSnJRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDZZ6FH33IlsrrzRB+VsBpU7uRlq/RA4fhk4BMQXc0N/Q8O1lg8KfCdHDb0kV1MVgg1gmSm4vUx7Y+W+QMl0X7uIW/kp+X1uuzEnxS7U0l+xoLtUQhQxy+QW4m89CV05rnZ1ZtkxyjWzZgpTepMn72v7Vr6qujg6QRg6apURk/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fNJL9Pby; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1K1m3c2TAHIh9xs1DYiPRGxAfBUiEiuL8RJFxcDCKqo=; b=fNJL9Pbyo6kERlU0JqaOmJxNfL
	Y9TdUYDgY/hxomR52pncSS27eFGTxwOfjhpYVG+a8fA2zt67v/eOCa+/KHww0mIH9AxNxD1AbDtJ0
	StXcAwZA/9KmznnkEpjaPye5GOvzD+Z7b97rDxt/iEyvyNWWmKEHIqRJ3Y8xVlumardc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sCIYv-00GFn5-W0; Wed, 29 May 2024 14:37:49 +0200
Date: Wed, 29 May 2024 14:37:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com
Subject: Re: [PATCH 8/8] gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH
 interrupt type
Message-ID: <9f8107e1-4a80-4f20-8862-f85aed578cc6@lunn.ch>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
 <2c265b6bcfcde7d2327b94c4f6e3ad6d4f1e2de7.1716967982.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c265b6bcfcde7d2327b94c4f6e3ad6d4f1e2de7.1716967982.git.matthias.schiffer@ew.tq-group.com>

On Wed, May 29, 2024 at 09:45:20AM +0200, Matthias Schiffer wrote:
> The TQMx86 GPIO controller only supports falling and rising edge
> triggers, but not both. Fix this by implementing a software both-edge
> mode that toggles the edge type after every interrupt.

Do you have a real use case for this, one that will handle lost
interrupts because it cannot swap edge quick enough?

I personally would not do this, because it is dangerous, it gives the
impression the device can do both, when in fact it cannot reliably.

For me, the correct fix is to return EOPNOTSUPP or EINVAL for BOTH.

	   Andrew

