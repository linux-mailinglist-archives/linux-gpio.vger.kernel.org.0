Return-Path: <linux-gpio+bounces-16429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAF3A40CA3
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 04:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32560189A3CC
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 03:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BAD3A8F7;
	Sun, 23 Feb 2025 03:23:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD717D2;
	Sun, 23 Feb 2025 03:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740281000; cv=none; b=EDZLhfyK8p/+GQhSntO0caPgh79gnkfQG1EDLRfaESQkZpJ+K7NGCAKbBMyn8p9TS2qWjY4arKzdi4d0pHiNIIxD0iHcbxV0MKER+ktHxbuv0KJpRB/5VClA5TW2sq8jxJXSz3i8Lf4+cO2I40ruyEGYiG6YEhpR5YN5MT+g5A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740281000; c=relaxed/simple;
	bh=ybEuh9mXdFe2N3eI3z6GwXQG2B9Khh6pcNZq9U+xH/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmYuCAEEwp8iItAunCeek/wm9NvE/n9QQClTch3Idut5oedBcGbYD3wYQjXuTdBGSuoj/z5/rZ7RJ8Bom5Z1GO1TWMFErmyo0xsukHdAXad1PU12QJa+qO9xslbY2Wf2/hS6YFLBRnjZ4gLF3+xglr7uZq0ckC4DnTHEtUMi/Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CB1E0343208;
	Sun, 23 Feb 2025 03:23:17 +0000 (UTC)
Date: Sun, 23 Feb 2025 03:23:12 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH RTF 0/2] gpiolib: of: Handle threecell gpios
Message-ID: <20250223032312-GYB33864@gentoo>
References: <20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org>

Hi Linus Walleij:

On 11:28 Tue 18 Feb     , Linus Walleij wrote:
> This adds some code in the gpiolib OF core to deal with
> several gpio chip instances per OF node.
> 
> The change was prompted by the need of the Spacemit GPIO
> controller.
> 
this patch works for me, many thanks
I will send a patch v6 of spacemit's gpio on top of this 

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus Walleij (2):
>       gpiolib: of: Use local variables
>       gpiolib: of: Handle threecell GPIO chips
> 
>  drivers/gpio/gpiolib-of.c   | 126 ++++++++++++++++++++++++++++++++++++--------
>  include/linux/gpio/driver.h |  24 ++++++++-
>  2 files changed, 126 insertions(+), 24 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250217-gpio-ranges-fourcell-85888ad219da
> 
> Best regards,
> -- 
> Linus Walleij <linus.walleij@linaro.org>
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

