Return-Path: <linux-gpio+bounces-23412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE72B08F90
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 16:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC6CD4A4B79
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 14:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E022F6FAA;
	Thu, 17 Jul 2025 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y6z9l/ao"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD19014E2E2;
	Thu, 17 Jul 2025 14:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762860; cv=none; b=BZw6kXfBZI4dUqQPiaeMDEiUP1R3QZ+XwwYwGVYs+wFr94HBjm0nNBtvfaxwKdO2AB/FkC5k61kQRYiUPeLoX2yBYje9j2XAZ6l/Xs7ZRCBlSS9KYtBfG9yZCEGjJFJAQJBUd3YHrDZcE4ye5NVsu+5/Wm89cAFAaYqa3IaA2d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762860; c=relaxed/simple;
	bh=nYe7PKm1FTAIN1O0LeeId+EsO1pKsjAKzBLxBJUFHKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdypZb0af4iGzq0feuXqdzqu0gVd2xN6qGe8W1Mu3head/Bhs/DkuXtjZDqjhsrHiIaeU7recvAtv6RffuNywCeSoWWmqj5cWF8knKOaHFj0sOa003OMvGmxHrxo2HJ4j0deZFKGGk9MKuBUqGPNRUIu5OW0I/KMuDpeRjlfXf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y6z9l/ao; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A5DC4CEE3;
	Thu, 17 Jul 2025 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752762860;
	bh=nYe7PKm1FTAIN1O0LeeId+EsO1pKsjAKzBLxBJUFHKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6z9l/ao2akQ4Ayp97RWH/uW07m22eKN8kbw3ZeHDd+CWauUdumIkh3G4oA99E0H1
	 NRW35IAchzKvFrbD8ObTcqUapfZiwrMocNGKjn94hjm8B2/2oS6/7Hdmt/VpIkdAoy
	 D0UUve23zxGAux5dOb+QIDVjo7c2TuZZ0k7GN6tk=
Date: Thu, 17 Jul 2025 16:34:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] misc: ti-fpc202: use new GPIO line value setter
 callbacks
Message-ID: <2025071759-john-puzzling-b3af@gregkh>
References: <20250717130357.53491-1-brgl@bgdev.pl>
 <20250717130357.53491-2-brgl@bgdev.pl>
 <CAMRc=MeMyocMa6eCOw--uBic4Zk9OG9A=VKvMP+T6bnEuOttng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeMyocMa6eCOw--uBic4Zk9OG9A=VKvMP+T6bnEuOttng@mail.gmail.com>

On Thu, Jul 17, 2025 at 03:32:07PM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 17, 2025 at 3:04 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> 
> Greg: this patch comes in late into the cycle but the driver in
> question got merged for v6.16-rc1 despite the set() callback in struct
> gpio_chip being already deprecated and it went below my radar. This is
> one of the few remaining conversions and if we get it queued for
> v6.17, we'll be able to complete it next release and drop legacy
> callbacks. I know you're busy so if you could Ack it (and I hope I can
> get a review from Romain and Linus), I'm more than happy to take it
> through the GPIO tree to speed up the process.

No worries, please take it through your tree, now acked.

greg k-h

