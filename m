Return-Path: <linux-gpio+bounces-18330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86191A7DB45
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 12:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 447EA7A4103
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 10:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25681227BAD;
	Mon,  7 Apr 2025 10:33:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A528D227B8C;
	Mon,  7 Apr 2025 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744022007; cv=none; b=Te1FbhnK5fgZWBQloLUQ9VzrmPCUbuvMv03czLJbwpCU1mEpEeQLPdB4gjmhm9vn/GvcN3IOl39D2vlDQBt7uYirvfnkSvBggwsI0cYSaiXFBahUwLNV2I1Jo/Dk+xgqCpvjLvEseWI+bJZ0ZSPKiEhZZ6E2btjxb6IbvHBPOSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744022007; c=relaxed/simple;
	bh=kCG4XKWjQBp+LMHAupprGAOdDDB1x/O4mkI4fpQ9XDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYt2T0BXjYTfjJ8yDG/psVBCL4bTupURUFw93sNLLkqxNVaE8x4Z/zzt6rIrGH7OEMCKd65qy5bJ05rvrHFN41Fo4arudmQKmBMP29RqAcGuZ2SS94anUp6/QnyFM7NiffBoPjP680geqJslEJmDwDVs5MyxKqlRHPbiSAjwl5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 80C5F3430B1;
	Mon, 07 Apr 2025 10:33:24 +0000 (UTC)
Date: Mon, 7 Apr 2025 10:33:20 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
Message-ID: <20250407103320-GYA13974@gentoo>
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>

Hi Linus Walleij:

On 06:06 Wed 26 Mar     , Yixun Lan wrote:
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
> 
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/gpiolib-of.c |  8 ++++++++
>  drivers/gpio/gpiolib-of.h |  6 ++++++
>  drivers/gpio/gpiolib.c    | 22 ++++++++++++++++++----
>  3 files changed, 32 insertions(+), 4 deletions(-)
> 

  I'd assume this patch [2/2] will go via pinctrl's tree?
as patch [1/2] has been accepted by Thomas into tip tree [1]..
  Additonally need to pull that commit first? since it's a dependency

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/core&id=0a02e1f4a54ace747304687ced3b76d159e58914

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

