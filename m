Return-Path: <linux-gpio+bounces-22048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 529E2AE5FB0
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 10:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 099403BC9FE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 08:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BD326A1D9;
	Tue, 24 Jun 2025 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EipKQb84"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C9A223DFA;
	Tue, 24 Jun 2025 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754536; cv=none; b=mBCMr0GJknYwsg/WKgLTmGweItpgxxrhk2nEZ2wkH8OjnjltFBiY6Y6AkNcnVEvWUIUDBfmc5HRNXCzOoylz39Mz6WHiLqEvEbKAs4lwoXuN3kod9y6KGYUEBt963jtTUZw7SBpXQQqMz/7zXSu9bJPyJmAE8+eySH0iD3PYZ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754536; c=relaxed/simple;
	bh=XQXISaxxdSM0YQGejcm+29YU7RBs4G6bK6BX2G2DI5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEwQq0bvbXHWLiB0aN2GR6VHFMY7VdCajhKcNILWWDgtLOudK23aS+dPiY2yzbEhsKt8389nX9SPMk33N13RHGkNqdvQtV2mtSIU2iSoHKl5Olre5vweZm+lKJIkLoGm7c6H05DOBn/23zwHcAo1IMeuw3FX5b/5dVCW2v52oiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EipKQb84; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EA6C4AF09;
	Tue, 24 Jun 2025 08:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750754535;
	bh=XQXISaxxdSM0YQGejcm+29YU7RBs4G6bK6BX2G2DI5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EipKQb84jORiV01NbhjTTqhSaSXN+yXhTmm7huCrMSqZCsmYexcgHlJA94O8K5/7k
	 HtxJTWOPsgYegfn/EyFKcb6SVx7Q4s+BBlZTV7NuFYyRoAfeI9D3C+i8uebevWuXwd
	 4lC68DlCHc/EbcvI5S5i3vmK4ASQaIh178VoXc/y/mrQYCtdt3P86jouUvnpqhMpJ9
	 Gk0o07iVPfm8hYmak5mQTw/eYCBtIwYbIvW6spHL96amiQBjCdpH+V6TRCCab0UN0Z
	 R4/Xz1CCgdNcS6Jdd7Du3leRPjri/uWQGEkeatmS8b239gRmDJs8z6MvVQZt1gzLPA
	 NXfulx+W8hW1A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uTzEK-000000005wQ-3JlL;
	Tue, 24 Jun 2025 10:42:13 +0200
Date: Tue, 24 Jun 2025 10:42:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/2] USB: serial: use new GPIO line value setter
 callbacks
Message-ID: <aFpk5P3YU4BW6pN-@hovoldconsulting.com>
References: <20250619-gpiochip-set-rv-usb-serial-v2-0-8c43e4a4c810@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-gpiochip-set-rv-usb-serial-v2-0-8c43e4a4c810@linaro.org>

On Thu, Jun 19, 2025 at 11:02:39AM +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips implemented under drivers/usb/serial/.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - reduce the number of changes in patch 2/2 by simply changing the
>   function prototype and returning a value without reshuffling the
>   implementation (Johan)
> - Link to v1: https://lore.kernel.org/r/20250610-gpiochip-set-rv-usb-serial-v1-0-a9343ca109e8@linaro.org

Thanks for respinning, now applied.

Johan

