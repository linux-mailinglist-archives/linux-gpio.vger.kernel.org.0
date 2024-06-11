Return-Path: <linux-gpio+bounces-7340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A76769032D9
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 08:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 310602899C9
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 06:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5FD171E4F;
	Tue, 11 Jun 2024 06:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NgeLaY/f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EE836D;
	Tue, 11 Jun 2024 06:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718087813; cv=none; b=BCnJDUKtm7Am3QoECGs9d7ZCKebmexDqt/cGmFHvCHG6VUS4TbDhlq4Xu2gQpe116H6LuIMqPZMwz0PtPZL1LTdW1pI7feH3ag88tzTc8P5Q0FFLk7yBRld5s6EZvVm5zcisymc10ibMJv2lMfcKZHVTLEyckecaOXFPhtFENFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718087813; c=relaxed/simple;
	bh=kEYmhqsKfZ6XItxvke50j6y6sh5Pq2ilsON6dHvMVT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uehRrLEAPNcgmayqn0EPdv8VvSEIj87YiSEhl1XZ559C6/vjS7kvLQkEvNuDRyREpP7jDOqfMb3jFgkb7bvH/KIs+AT0T76Y+k9HzZx0mlL7lgQdR5HVNmieOwiWsTHaWqk5+UmjtSb1gcUTCFD/B49NNZrbYnnY1YHdqhiWGMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NgeLaY/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDBAC2BD10;
	Tue, 11 Jun 2024 06:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718087813;
	bh=kEYmhqsKfZ6XItxvke50j6y6sh5Pq2ilsON6dHvMVT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgeLaY/ftYKC8OpraxqEzAj1ZftnM72wRvzEaPcRvaeQPTXDprbDqpACX2s3Ktu5w
	 iMhacsY79VZmC787SpYwZ3WZ1bGPFZ0yM0EJ5AaSYGmgxI09klxY9baUr7xcmaMX/m
	 bEbePZpbDgvA/3EAVenfyODU/IrRzD+HLQmli2OM=
Date: Tue, 11 Jun 2024 08:36:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrew Davis <afd@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [PATCH] gpiolib: Remove data-less gpiochip_add() function
Message-ID: <2024061143-petition-precision-ebc9@gregkh>
References: <20240610135313.142571-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610135313.142571-1-afd@ti.com>

On Mon, Jun 10, 2024 at 08:53:13AM -0500, Andrew Davis wrote:
> GPIO chips should be added with driver-private data associated with the
> chip. If none is needed, NULL can be used. All users already do this
> except one, fix that here. With no more users of the base gpiochip_add()
> we can drop this function so no more users show up later.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  Documentation/driver-api/gpio/driver.rst | 5 ++---
>  drivers/staging/greybus/gpio.c           | 2 +-
>  include/linux/gpio/driver.h              | 4 ----
>  3 files changed, 3 insertions(+), 8 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

