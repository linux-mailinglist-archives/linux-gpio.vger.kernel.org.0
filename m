Return-Path: <linux-gpio+bounces-6949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DC98D4B5A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 14:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 582FBB215A4
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 12:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F423E1822D5;
	Thu, 30 May 2024 12:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="D7KoizyL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92BF15B979;
	Thu, 30 May 2024 12:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717071216; cv=none; b=ETfkEwg4Tv6gW3Kd3Ptqqh/WQaZr6hjIicGiQasSoYzAjJW3/7fLfp49CqUOaWlXniN/638wffAChbBJvxsQ7i7aLSQN6H8tJQK9QCOXXd7hQrDIOIKeloxbscxPTe2kKh2yWmnVL9xHwii9auiATn0mxVemTQ736K0g9imt++Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717071216; c=relaxed/simple;
	bh=FhjFGspdyvHbjBhX6O/1GSnPkUuNlBcQYSFV7ga+EmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SctyLYxBKZ0W3YQwDjC52dpqUVC/C71G0Js+p7DCHt0C0GN5Y6Q13KIHgGz3yvEbkaRaOtBa1PNzpW1QiNz3U1i6zPZHzBAQ4KGIGKj1Qh5XWBogaB7FFghCOfY58B3SapbEi030WKUrn368I5jUkj+ExcU0iBksuFACx1NexdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=D7KoizyL; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kagvJUvLZ8HGDcrz3C6I73rh/WuqRfvQQKO8Bga9nvc=; b=D7KoizyLmXhOvLhPvQLB47tnmt
	Zr7Pd9pHd/ysaLl6n7GeXaPSdDk2z7vg5VhRqYs6ddABQVhoeXQ+WRtot71Rosxc23CbHHoQTRKSZ
	vz9vCxx/l25jRuu5orIiWdRWGThqmq/a++iZI8Bk2VlKmUbr6W13iCHu7M/yR6FD7wJ4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sCeer-00GLNR-4M; Thu, 30 May 2024 14:13:25 +0200
Date: Thu, 30 May 2024 14:13:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com
Subject: Re: [PATCH 8/8] gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH
 interrupt type
Message-ID: <df1ba591-fb7f-49c3-bad6-78390f0f2317@lunn.ch>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
 <2c265b6bcfcde7d2327b94c4f6e3ad6d4f1e2de7.1716967982.git.matthias.schiffer@ew.tq-group.com>
 <8689fbcd-3fa3-410b-8fc9-7a699bf163b8@moroto.mountain>
 <0e971f0b885bd360e33ef472d96e3d9e0ab56405.camel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e971f0b885bd360e33ef472d96e3d9e0ab56405.camel@ew.tq-group.com>

> Currently, the driver only supports COM Express modules, where IRQs 0-3 correspond to GPIOs 4-7,
> while GPIOs 0-3 don't have interrupt support. We will soon be mainlining support for our SMARC
> modules, which have up to 14 GPIOs, and (on some families) IRQ support for all GPIOs (IRQs 0-13
> correspond to GPIOs 0-13).
> 
> New interrupt config and status registers have been introduced to support more IRQs - up to 4 config
> registers (2 bits for each IRQ) and 3 status registers (IRQs 0-3 in the first one, 4-11 in the
> second one, 12-13 in the third one... so this part is a bit more convoluted than just "hwirq % 4") 

Depending on how different it is, you could consider a second driver,
rather than make this driver more complex.

	Andrew

