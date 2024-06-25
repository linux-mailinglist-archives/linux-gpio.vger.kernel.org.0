Return-Path: <linux-gpio+bounces-7679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C861C9169F9
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 16:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82B45286380
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 14:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFEA149E05;
	Tue, 25 Jun 2024 14:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6I4TT89"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3FB39FD6;
	Tue, 25 Jun 2024 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719324974; cv=none; b=lWyEl6q8VnhzU85YMGDt2+AEN2r45Sc9KHwM7Z4PGTgQVNvbaNQzkiFlywgLrCCKFecYUKtBRZ5xBKebgBnU/2Z3cyXwe3jr4tVTAiyAZFDqS3KelXpGmpyxDHEjqJ1f6M7+hVmf55oASuug/gneGwWiD+GKFGYOCUIf/AKGlWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719324974; c=relaxed/simple;
	bh=z1UzPtvslhBpVxo5WSG7nm/GYB6eBaY5tYPAElx7+jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSSLhwrCj28PFoktI/QkoJKLyMDGkeCJSZpH6vy5dwXmanVon1mIDNoVC+PvxerwWka9Mb/P3lzqWROy0ri4j4G1+ajgl85NFGt+8bT8FUssB7crp7qL5RQx2DPC0e9o4sDWgXLBAwz3fmEeBUceYSYWrU0s0kSDjtayAZWtV7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6I4TT89; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c85ca2dc5cso1850558a91.0;
        Tue, 25 Jun 2024 07:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719324972; x=1719929772; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D36Db5Y4m8FIowfP6/u5lOf2LPz4KaZVqsBszQTJ+Qc=;
        b=l6I4TT89NFVDT7j9CE3+CPkTX4nddvJ1bOEM9BOSwreXAOBdP07MGaHh+bHsHv3h1K
         MVz2B2wydLLiV8029rIPKdikM7KkLASNJgOcsxbw9OZzdWx323fFOgRFsQVF9dDZvihA
         5JvmtFOXwpS0eUelH3basidBWTDKtQwDyiQq9hIUc4QJ3JJQM6VFSEzvk5iElxRhCrVi
         nFgy5Bkk7M4MBIBFZr+N7sz0W/N0Gq4m+KseNTxjJFy/LJTdiuQoudYzja+eT3j5zyv/
         62c5IOcgeG/MMs76yoq3/chmCbz8SIOZevtEMU48yrxorIWYS/Phkocp28MWQCbSJCkL
         M92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719324972; x=1719929772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D36Db5Y4m8FIowfP6/u5lOf2LPz4KaZVqsBszQTJ+Qc=;
        b=u17mXGp0iiWgHLM5PDOnNW5IHYjXp2cH7OSt4ixZpZ1W2X9sJxBF29A//oKlDflwXo
         i98cMEEI2vKCP7Uu4Hb6zi2Ip0fPsllPO39mzgiUoYq0BF+PsAdn5gimXdcBIHPbaTm7
         HxrucHx5uqF0K5qxaLkEUvmZxNSxLq6tKuoq8sgsEgR5syY8hYjWJEQPOoA4WyipOrNo
         Bv+2YKd2sf9n1iFRmD9AvwKMVCBbGjaowMcDzJ/0bb3V10jeoGAEpdrZfftmsTX5KSDs
         41bQPR1qD4Rnew/jh0Cq4idkOwninHth5RyeyngsW7c9OKrqlc8DICdYz89Y6s6p1FyT
         LmkA==
X-Forwarded-Encrypted: i=1; AJvYcCWsmPlyjvvXNnYdmWKLl7Qey9vEDf5qGs2vJmUxBVM+8dQNG837FfKYJbMx37Cj8LdEM6x73/OD+gfvq0B6JHcrT0VShaKMX+XrRYPN
X-Gm-Message-State: AOJu0YzyIcJYK2ZxUIcNe0CW26lLTykTiFcLQJHm7GiiiBa6dl/gMmXo
	2mUA0eEL6Mic61yI6CXR/hd1Ufk1BWr7w9wPuaEif3HhzoeCUK0my2KOGj6Wydnkaml+hsecpf3
	Q1dRRNbtfXub99TvujTn/IJqLPlE=
X-Google-Smtp-Source: AGHT+IH5DEVfJgmMc19bVNyOA8LEJHSKR4JLkDQJij/6Jbf/sVBB2fFjrm82j5ImwwK+HJLrJMJvEJaNb7Lr/hRz1ww=
X-Received: by 2002:a17:90b:1288:b0:2c8:3c59:263 with SMTP id
 98e67ed59e1d1-2c8a237a727mr5659409a91.12.1719324972423; Tue, 25 Jun 2024
 07:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCP286MB08958A751BD29BB5B04485D9BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYCP286MB08958A751BD29BB5B04485D9BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 25 Jun 2024 16:16:01 +0200
Message-ID: <CAOiHx==oBMZiVaZ_ra0ren-sea+D4znXQA8wq-dA+5sC0dav5w@mail.gmail.com>
Subject: Re: [PATCH] gpio: ath79: convert to dynamic GPIO base allocation
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-gpio@vger.kernel.org, Alban Bedel <albeu@free.fr>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 25 Jun 2024 at 03:09, Shiji Yang <yangshiji66@outlook.com> wrote:
>
> ath79 target has already been converted to device tree based
> platform. Using dynamic GPIO numberspace base to suppress the
> warning:
>
> gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
>
> Tested on Atheros AR7241 and AR9344.
>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>  drivers/gpio/gpio-ath79.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
> index f0c0c0f77eb0..d986424a661e 100644
> --- a/drivers/gpio/gpio-ath79.c
> +++ b/drivers/gpio/gpio-ath79.c
> @@ -273,8 +273,8 @@ static int ath79_gpio_probe(struct platform_device *pdev)
>                 dev_err(dev, "bgpio_init failed\n");
>                 return err;
>         }
> -       /* Use base 0 to stay compatible with legacy platforms */
> -       ctrl->gc.base = 0;
> +       /* Dynamic allocation */
> +       ctrl->gc.base = -1;

bgpip_init() will already have set gc.base to -1, so you can just drop
the assignment.

Best Regards,
Jonas

