Return-Path: <linux-gpio+bounces-16517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CB6A42A59
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 18:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEA581891EF1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 17:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053B1264624;
	Mon, 24 Feb 2025 17:52:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFC72747B;
	Mon, 24 Feb 2025 17:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740419526; cv=none; b=gYszYC7CNCrdpSFysZbPennm2U6OQRHdF/EyOTnKCcjbTel9rYqZ0q/hb4lg+GxzzQ8/cPsR/V1E09mvN4U3O9anZ/T6U700BOW+FHpGkBQSzxSfc22U1sWZ9/v44UOQw9Qbe1H/ts5tfTubFwOMety9xefpJhucvJFLvzkm/5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740419526; c=relaxed/simple;
	bh=7VMLRKHe1KUj4HIfeSAiBxtcoR3pZWGNmk4jKWpibAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UoVpNflrV/dmShkP/UaJ5Phrk19R4A8TiqCHxy+1rhBpgU8eJv3AHdUbp4xcSDZfpUMvRY6b//kWbZCCRArXrWIHn7B+4Q6Pc6iN8LxMlTtFcuVusG1wjmr5nN2hH8TrxeFS9f5nK+blGmZsf9o9LtR4gH52uZWoMXN25jvWo9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 642993430C5;
	Mon, 24 Feb 2025 17:52:04 +0000 (UTC)
Date: Mon, 24 Feb 2025 17:52:00 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH RTF 0/2] gpiolib: of: Handle threecell gpios
Message-ID: <20250224175200-GYA42001@gentoo>
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


On 11:28 Tue 18 Feb     , Linus Walleij wrote:
> This adds some code in the gpiolib OF core to deal with
> several gpio chip instances per OF node.
> 
> The change was prompted by the need of the Spacemit GPIO
> controller.
> 

Tested-by: Yixun Lan <dlan@gentoo.org>

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

