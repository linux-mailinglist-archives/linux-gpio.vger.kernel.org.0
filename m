Return-Path: <linux-gpio+bounces-10366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB72497E8E9
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 11:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07C361C211BE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 09:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F0719538A;
	Mon, 23 Sep 2024 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="js9dQvA0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD52194ACF;
	Mon, 23 Sep 2024 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727084439; cv=none; b=OKvVvOfqrmzyPlritUYUHQGwlPsumveCV1LO/o5UMOiurY+BV51fZIx2ya5KMRx6DO6wyAWEnlVHEf2u3EYsn2ZdbZCw7B0RMhzlQvyN0rjXIDwSOm7gMCDXiZIcTHHEj32QQ6jzHX5rGbBYRRCHBQv7ExZZY9g5ksD7RJOeGdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727084439; c=relaxed/simple;
	bh=E/gsmqOjoVPVa8WGzv0WJ61S2WKDROzRfE09bTLPij8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j392KE423+PjZ5gPJB5WGO247JIk3K+QH775rIK3xWMp62qKuVWnpSzkNJf8VtaYq7sGmd64g118Q3DMw6MbpyWZNXPlmqKtXCyDas+98OBZCJdprGQ7KerVqd9cmgKVpZddQ8pkjIf8NkjsBW5YKx3jlMcpTXL6OS/aG1t9Z8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=js9dQvA0; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7CE9D1FBE3;
	Mon, 23 Sep 2024 11:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1727084433;
	bh=zaP3Uo3n4OZ6NzL/Ea1OjTTd80bogQ3TTVKEJkWIqfs=; h=From:To:Subject;
	b=js9dQvA0WEInrEutEkwyOEfyfqtCjn9u2F/53EkJv9fjGLTa6Bx6g8IqpQzNms5Jv
	 vD9Voy4I3grWjfUlSA015zqKswBJREFq1QEK3j7VpS9a3FEJv0OBHbhWeb6B+yfLdx
	 TyI/Cz9NGHhodLfZ7Hrg61SCBSWG2ED0Dj+4SxG6TLmybGZ4TvNltbUPu3B5U6/XCM
	 06x2ZWqRC3SKJ7CAhnDyWgoCL9EH+IjiqBmx+RB/ULjk9rp7yFrYg6O/JHjVSneKU+
	 fih8wkJUCeJ/v9fjG0OoHWaJlOn/0oDrTBzkW3x6hf/ZzjaV5R7S2HisxaMldGsO9K
	 CCqeRTi7co2rQ==
Date: Mon, 23 Sep 2024 11:40:29 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Keerthy <j-keerthy@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Parth Pancholi <parth105105@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Parth Pancholi <parth.pancholi@toradex.com>, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: davinci: fix lazy disable
Message-ID: <20240923094029.GA124572@francesco-nb>
References: <20240828133207.493961-1-parth105105@gmail.com>
 <CAMRc=MdyNFzNy_GndBDOUL23Rv0WxGG8mRd5DRD28pE=XuhfmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdyNFzNy_GndBDOUL23Rv0WxGG8mRd5DRD28pE=XuhfmQ@mail.gmail.com>

Hello Keerthy,

On Mon, Sep 02, 2024 at 02:08:30PM +0200, Bartosz Golaszewski wrote:
> On Wed, Aug 28, 2024 at 3:32 PM Parth Pancholi <parth105105@gmail.com> wrote:
> >
> > From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> >
> > On a few platforms such as TI's AM69 device, disable_irq()
> > fails to keep track of the interrupts that happen between
> > disable_irq() and enable_irq() and those interrupts are missed.
> > Use the ->irq_unmask() and ->irq_mask() methods instead
> > of ->irq_enable() and ->irq_disable() to correctly keep track of
> > edges when disable_irq is called.
> > This solves the issue of disable_irq() not working as expected
> > on such platforms.
> >
> > Fixes: 23265442b02b ("ARM: davinci: irq_data conversion.")
> > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
> > Cc: stable@vger.kernel.org
> > ---
> 
> It looks good to me but I'd like to have an Ack from Keerthy on this.

Keerthy, just a gentle ping on this, can you help?

Francesco


