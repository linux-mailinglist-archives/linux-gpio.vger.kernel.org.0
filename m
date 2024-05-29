Return-Path: <linux-gpio+bounces-6832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F74A8D3608
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B9CA287CAF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 12:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34AC180A8B;
	Wed, 29 May 2024 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZY/LpWNZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E282169385;
	Wed, 29 May 2024 12:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716984691; cv=none; b=TsHhUfLwQgS16cX9w+4QCRUnoK35Cz3lxufMrVufUA2tHc+CKWSB2dADUNjqeOjmUwj07HLOG4E+7MeVkC9Lkgs5oSpVJDG8vVXGwfQaUUOPNxWXrCV+oWq7vUtw46FQ0luVKsVHUVEytjjY1b06FipXdlMXpmIcCL5vnaxwSE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716984691; c=relaxed/simple;
	bh=zHynZzfWyKxvjDFzKY2juRFP0ZSe0Cdjp+o8ve6Txh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvUjQpkO2xfI7IhT1XSWJ90t9aYb57JtU+YntUNdjxXef0BEDWh+hb8HTOXa/dkDC/dKltXgU1kOUKe3zxaZLmIRxPjdOZ1S0RGMXoYHR6dj5nuxhVenngpOA9ApbZ6ZaIZFV+JX/TAFrsSZ7D4g5YmBq3HzErCtFua9WVoSExc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZY/LpWNZ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=QaUeLkv+IGLulmWDppONnVvHaXgaUzJE4SuWA4cP95k=; b=ZY
	/LpWNZtc0Nd5Odm0+b7Y6NfexXjOj0jSW3h2ilRIpUXRst8MYNYCSY30JPufaNgBuUOqozVjCDLQu
	D0h/l2hD/wxa/iJoIIEorKKF+BMqxnHOFGTulpjlyVLEa86ZXQqfnwaknibLzuvQjtXk82eox9r4U
	xfqZLc6jvJrNI10=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sCI9M-00GFcX-QD; Wed, 29 May 2024 14:11:24 +0200
Date: Wed, 29 May 2024 14:11:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com
Subject: Re: [PATCH 3/8] gpio: tqmx86: change tqmx86_gpio_write() order of
 arguments to match regmap API
Message-ID: <a83d2274-3b45-4206-891d-b1e5bbfd6e23@lunn.ch>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
 <56cb8a4f19ac0596318d740ed14091d6904d3f7f.1716967982.git.matthias.schiffer@ew.tq-group.com>
 <CAMRc=Me_JMjp55VYLFH_gX6+fdCR+3zpsWtds1W+hCmf+k70KQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me_JMjp55VYLFH_gX6+fdCR+3zpsWtds1W+hCmf+k70KQ@mail.gmail.com>

On Wed, May 29, 2024 at 02:03:35PM +0200, Bartosz Golaszewski wrote:
> On Wed, May 29, 2024 at 9:46 AM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> >
> > Conversion to actually use regmap does not seem useful for this driver,
> > as regmap can't properly represent separate read-only and write-only
> > registers at the same address, but we can at least match the API to make
> > the code clearer.
> >
> > No functional change intended.
> >
> > Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
> 
> This is not a fix.

Agreed.

I'm somewhat conflicted by this patch. It is a step towards using
regmap, but then says regmap does not make sense. So why make that
step?

Changing the order of parameters like this seems like it is will make
back porting bug fixes harder, unless all supported versions are
changed, which is why fixes make sense. Does the compiler at least
issue a warning if the parameters are used the wrong way around?

Overall, i'm leaning towards just dropping it.

	 Andrew

