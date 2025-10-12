Return-Path: <linux-gpio+bounces-26996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFDCBD037C
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Oct 2025 16:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3A423BD8E8
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Oct 2025 14:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455EF284B36;
	Sun, 12 Oct 2025 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQG8gDDi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEA8273D67;
	Sun, 12 Oct 2025 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760278977; cv=none; b=AYpZvgaW+h1EZouqOJz8FXDC9oUQV42s1CrDJ1aQoh8PvHGAhLiX/YIZTkhp0CQ8nSEsJa0zuYGR5Ez+VVArB3ipQ4RCJA1b78vz9aF0lU32PhXPtS5nj+fpPn/SZHe+n4GHY0fdUxSE+QMpfEKyIdqCrKktR2hOm2hjwNTvcFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760278977; c=relaxed/simple;
	bh=HmnRAkQ+zRAK8S84K74JOIRe6qz5Ds0mGnszGt6B6gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=duTw6av3mlprklisci4kFGau3wjkHqrew3ugFmzicOyIaA9OHV5adASJLbCdXkrNxx5uOF2g5PChil6OvIM4viBozOsIj52ojitvseutu4aRoU+95f2Z4UkdhvBqpYuUJIFqY5R/hkDp7T9G6Zud9GjV6XllRRtpieua7j7eOQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQG8gDDi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C20C4CEE7;
	Sun, 12 Oct 2025 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760278976;
	bh=HmnRAkQ+zRAK8S84K74JOIRe6qz5Ds0mGnszGt6B6gY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FQG8gDDi0hhwl5Z0eDe0GFYszZe3053O8EQAQhDPwQJgjdW5r9vC+0rd4Yxqn+Gq+
	 UTEqguq9/zsBcuymiPfrJw7cEa/YCnWYO56ysivHX9rRH9dCrYo4qDZ1HIy5L3+P2p
	 ZRb3XCiUh7FW4mE6TnOrfu+3pHLrLHZDcnYVRbXBbnkX9gG/tzF57lw29j2TfcTTNX
	 1GxJ1QeHXh8yFzhQGinSTbz8M8RF99ssVUWTjmJWnKAc/z9re35P/XavFNtTLbVdwl
	 se91miZu9pzonr6xwVR0Xul2X6qWsLJDtoBvspMIpVafnlPIMcCarYcYMsutFZBmh7
	 b9HhFqdRoOg0Q==
From: William Breathitt Gray <wbg@kernel.org>
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andriy.shevchenko@linux.intel.com,
	mwalle@kernel.org,
	broonie@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: gpio: gpio-pci-idio-16 regression after LTS upgrade
Date: Sun, 12 Oct 2025 23:22:14 +0900
Message-ID: <20251012142216.72248-1-wbg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <9b0375fd-235f-4ee1-a7fa-daca296ef6bf@nutanix.com>
References: 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1460; i=wbg@kernel.org; h=from:subject; bh=HmnRAkQ+zRAK8S84K74JOIRe6qz5Ds0mGnszGt6B6gY=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDBmvd1ZY7Av5v/nhESPm23r8S//G5SvsSEjPYtxmJCjr8 jngG1tyRykLgxgXg6yYIkuv+dm7Dy6pavx4MX8bzBxWJpAhDFycAjCRc9sY/nBKGVw9kO1t8zG7 qXa61EXLfuETXjvSO78ZTO9k8/NeeY3hv8fHw3ofxOal9PVcct1dfyn9u+qa3n931+U9ZBUr+G+ /ihUA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit

On Mon, Oct 06, 2025 at 09:37:14AM +0100, Mark Cave-Ayland wrote:
> After some more debugging I was able to determine that the failure was
> due to the regmap cache failing initialisation in
> drivers/base/regmap/regcache-flat.c::regcache_flat_init() because
> max_register wasn't set on the regmap. I was able to fix that fairly
> easily with this:
> 
> 
> diff --git a/drivers/gpio/gpio-pci-idio-16.c
> b/drivers/gpio/gpio-pci-idio-16.c
> index 44c0a21b1d1d..55be571b5cca 100644
> --- a/drivers/gpio/gpio-pci-idio-16.c
> +++ b/drivers/gpio/gpio-pci-idio-16.c
> @@ -41,6 +41,7 @@ static const struct regmap_config
> idio_16_regmap_config = {
>          .reg_stride = 1,
>          .val_bits = 8,
>          .io_port = true,
> +  .max_register = 0x7,
>          .wr_table = &idio_16_wr_table,
>          .rd_table = &idio_16_rd_table,
>          .volatile_table = &idio_16_rd_table,

This particular failure is separate from the get_direction issue
discovered after. It would be good to have this fix as its own patch so
we can keep each solution dedicated to their respective failures and
streamline any necessary backports to the stable trees.

I have some travel scheduled in the next couple days, but I can
probably get a patch series addressing both issues ready by the end of
the week. I'll also CC the stable mailing list so we can get the fixes
picked up for the LTS kernel they are affecting.

William Breathitt Gray

