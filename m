Return-Path: <linux-gpio+bounces-14187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 466189FBA3A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 08:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D501160835
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 07:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C30D18D643;
	Tue, 24 Dec 2024 07:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="Gg7kEJc0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A7156F54
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735025194; cv=none; b=RYaSkdNBttqEhnzysh/d2O4KVPqiYh4R5jLBGpkdtOIvT4H49YPzBxoUtle3ll4Z7jwDTD83n6jwLFRpSHQqwXWEm3MEZCI+BpTPB/p01dkWknMF2kCSlpyXFzqBwdmb4769ukZrfH7S83KShAowvZmGHtM6nolsZAPqyJ1akec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735025194; c=relaxed/simple;
	bh=wFGWkFzM79MAaQbHcpCM4hwvurGNVg6e4xgWNYwCnXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIGRQRcfz6jhRBLK9Sm/PqfBl1zIkMvLPI5tBk4QTOauMgg8iMnVWMWcNZuC+1WaojKA+M1p68uzpN5R9N1kApgY0L63Jgmxrighntr0g582xx95iwt37/HclKbI1LIXfKxQWaJKBtdTMPTSYnYMUIb0JVzh9u4utvifK63h7YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=Gg7kEJc0; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id BA01A240103
	for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2024 08:26:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1735025182; bh=wFGWkFzM79MAaQbHcpCM4hwvurGNVg6e4xgWNYwCnXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=Gg7kEJc0Ld1gby6kH+oyYTQDjIoG/hS+LE7bu/H0TSRv0JevyAIFl9gkFz0YDb7zZ
	 8ifOEgVPVcNbw+ZnPnjdUfoQtgzsZ/iWL4ZHHfTnOEZkR7CSVCBYZ7vH3BKURo6IZx
	 Xt57c5y040J5PMdq3QRt2ECXr7Y/D/KV4RbSbTILmyq510Cv+UclEBVFf7WVhNmhxg
	 V264lFrOMugXVwiHiX4gA7wcVXSzHZ3vInMNErr4yEF9/SgF8iEinz/t4Z3qJ65Gsa
	 Ndt3uGnL3BdcyJdA655NOK8y2oWZQ3KOS2n4S0q/vvP9LDbXMdfCfGP3tNteukHveL
	 1m2ST/E2wNGmw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YHRJs4p0tz9rxD;
	Tue, 24 Dec 2024 08:26:21 +0100 (CET)
Date: Tue, 24 Dec 2024 07:26:21 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: j.ne@posteo.net, Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] gpio: 74x164: Add latch GPIO support
Message-ID: <Z2piHTP63SpaatHv@probook>
References: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net>
 <20241213-gpio74-v1-4-fa2c089caf41@posteo.net>
 <CACRpkdYibsJvnKazKaqQjLYyL4Hx1K1MpFpM2UPCRbDN3Gxh-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYibsJvnKazKaqQjLYyL4Hx1K1MpFpM2UPCRbDN3Gxh-w@mail.gmail.com>

On Sun, Dec 22, 2024 at 09:58:39AM +0100, Linus Walleij wrote:
> On Fri, Dec 13, 2024 at 6:32 PM J. Neuschäfer via B4 Relay
> <devnull+j.ne.posteo.net@kernel.org> wrote:
> 
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> >
> > The Fairchild MM74HC595 and other compatible parts have a latch clock
> > input (also known as storage register clock input), which must be
> > clocked once in order to apply any value that was serially shifted in.
> >
> > This patch adds driver support for using a GPIO that connects to the
> > latch clock.
> >
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> 
> This looks completely reasonable to me as far as 2/4 gets merged:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I think I prefer the other option, of documenting that the latch clock
pin pretty much behaves as a chip select.

Having a separately described latch clock would mean no CS for these
chips, and the SPI bindings and drivers don't expect devices without CS.



 -- jn

