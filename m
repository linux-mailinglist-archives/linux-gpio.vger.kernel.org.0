Return-Path: <linux-gpio+bounces-17472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDEDA5D4A7
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 04:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1362189D768
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 03:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E26F198E8C;
	Wed, 12 Mar 2025 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQziWW9h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE08A258A;
	Wed, 12 Mar 2025 03:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741749203; cv=none; b=lqJZahvl1qjHCeGjYbRGSm/bmtJiWrjwFZcRIGD+DV+SQb/zyyXsTde5wRoCao50bIWuG/9pk1Xy3SYqbc2oQk+Pu1g/QsTGxsCmQlmJfkw1tCWLiTwz6JF3IBhK7UEbPp5yb76g4HJiJRFelRXoJSl9ER14tMWCPggtFTWmBJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741749203; c=relaxed/simple;
	bh=eCEY2KBT90EGh1s62uvKHnn50sUS5/RJyvOMBJw8myg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6/aRMr5TdJwsoo8JB+uM6lly5yYpuGYR/bm2g49wPGVDkfaC2fp9uFhBcsysydyHTu9WaOa8BuzU7ki8irTHCAoTXZYPaPe+BCleDe0voqgx4a6CkB2txRwZ3xw4CVpy2h9bWmWJJNd3UFmEvXHktB5fO1lvYVJ91oup1hasjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQziWW9h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E373C4CEE9;
	Wed, 12 Mar 2025 03:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741749203;
	bh=eCEY2KBT90EGh1s62uvKHnn50sUS5/RJyvOMBJw8myg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQziWW9hFs/i78WifxqGSCr2PHHwVY4BBeLkG/mNVFGz89nxeY/HGa1bnxCBrOvU2
	 pW58rl6pBOEIsSXd3tz1IK4d9/DdX399UdotbbHuwlWxpxVIkeSPpBkExYA2eaMuge
	 jAeLM3vGR10f1FVPuP7i8UaBfdjJDpfbBNvsf0bU5A6ATGJ1KrsGhVyrFVVvLlFbIJ
	 wQeAzUdLRBv/i97k2fXo+Qpe9s/sdNqy3tPKtHVGmWq2+zo6lveu84s3T53lTuAQjN
	 fIjBIZlVZCxG6I+4rSKzNEoNFLjMvQ1yGjAQNG10J54/Whr00HMMmmaWoldg+WxdV+
	 9CgZAd74mgLMw==
Date: Wed, 12 Mar 2025 03:13:18 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Michael Buesch <m@bues.ch>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Andy Shevchenko <andy@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 11/15] gpio: cros-ec: use new line value setter callbacks
Message-ID: <Z9D7zkSFYwfenmzM@google.com>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
 <20250310-gpiochip-set-conversion-v1-11-03798bb833eb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-gpiochip-set-conversion-v1-11-03798bb833eb@linaro.org>

On Mon, Mar 10, 2025 at 01:40:25PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

