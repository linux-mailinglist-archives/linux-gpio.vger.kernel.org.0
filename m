Return-Path: <linux-gpio+bounces-10383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F90E97EBF2
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 15:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18A711F21DD8
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 13:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED181197A83;
	Mon, 23 Sep 2024 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O5xek6Sk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92A280C0C;
	Mon, 23 Sep 2024 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727096448; cv=none; b=aZybwpMgnjMGBM3V1HD8FKYPZVRqc8unmXgWpUE1E3VPDkgYvVaHZmxyyisp1SfU/waWOt4Prwo95WrusXD4pr3gdcv+hMGzhylHKyqFuVcz2KFODTiQS0EWLEa4yW0j3U0LusOhn+Moapr2yF0S+tylAKI/CIMU50bCEv/5Adk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727096448; c=relaxed/simple;
	bh=OAAO0QKtov+2i2m2QBnJxPzMxYe2LNN0TnzruG2ZI9M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sOFRHpaf8WiOpaKSxzj5QLlYz8UWGHfGZshk76mgH2QUL4P/1GQBf0bfXgkkfuFhiWtJ1vRr+GZGLBXBeWew20tV0p9mFJuxQ/fla5bbE7vvIGq+vv1J2R/wT001r7xwIoGfBsbLYyIq4vtgVLMiJOhNbi6cOc7qGDWyF20f1+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O5xek6Sk; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D92C820004;
	Mon, 23 Sep 2024 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727096438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6MVKQdIvtL8c35JA/PzdzFmtP3vDRIOaIzYJRLnHtIY=;
	b=O5xek6SkCP718XCbehSCuZU++STR3fGK9UYbRvvg568aB7Y6iKW9Er4KFBkus8NIgoDvAj
	OCWpzuKH8lIpvstJhIe4IpAjwDcQSf31tIDeWuf8ZsZnmIDGr1cLboin1QEdlVJ1HWHWbB
	biA77+f9w3OHe4BEhbMbZ9VQVqflhWX20AokQByTO5I2TRCm9gh5H6DeOaVFTIpVPYjEzY
	ZAA9OSq2CvrKx26udlz4LI5O2L8tEUWiNLVtWjWx0PH5gRCtQV7QGQdh+am9CGp2IVTHV9
	PESq4FE0UxzMCr1xBV3SHDD2CwG3NiJaaHnFUbl+izIjpyvugI3p1ZKR2D1Z7w==
Date: Mon, 23 Sep 2024 15:00:36 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2] gpio: free irqs that are still requested when the
 chip is being removed
Message-ID: <20240923150036.1ede7ca6@bootlin.com>
In-Reply-To: <20240919135104.3583-1-brgl@bgdev.pl>
References: <20240919135104.3583-1-brgl@bgdev.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Bartosz,

On Thu, 19 Sep 2024 15:51:04 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> If we remove a GPIO chip that is also an interrupt controller with users
> not having freed some interrupts, we'll end up leaking resources as
> indicated by the following warning:
> 
>   remove_proc_entry: removing non-empty directory 'irq/30', leaking at least 'gpio'
> 
> As there's no way of notifying interrupt users about the irqchip going
> away and the interrupt subsystem is not plugged into the driver model and
> so not all cases can be handled by devlinks, we need to make sure to free
> all interrupts before the complete the removal of the provider.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> v1 -> v2:
> - we should actually take the request_mutex to protect the irqaction from being
>   freed while we dereference it and keep the actual dereferencing under the lock
> - add some comments to explain what we're doing
> 
>  drivers/gpio/gpiolib.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)

Thanks for the patch.
Tested on my system and it fixes the issue.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Herve Codina <herve.codina@bootlin.com>

My old series [1] related to the topic is no more needed and can be thrown
away.

Best regards,
Hervé

[1] https://lore.kernel.org/all/20240227113426.253232-1-herve.codina@bootlin.com/

