Return-Path: <linux-gpio+bounces-26720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A107BB0527
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 14:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 966B2192329F
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 12:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE5E2DAFDD;
	Wed,  1 Oct 2025 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="In2mTV2h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E761327E048
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759321448; cv=none; b=fjW0GGzdJT9sQJo8SZVXoC4innFNE5HJGavp0UaKq2aeRSE23mE92RPQK2iAXRNzIW3+b3YJxlwR44p1UCg8mec8YMR1+znF5FJzOWZC7xx6o8xnHD/I3aSQTAikoqOk+ROR1BQAJ09lM4o1bO1/1OMGsKWnxK0YwwX0ZObkmvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759321448; c=relaxed/simple;
	bh=xTjfXAFrek/XXUnsjEVfipI6Qes9OAbqDDwKRnX52sw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQXrTobfU4YESuGLMFNHxe7Uhqn01CUO8Qav/lThMuRvGVk/hBK0Tjc+KY0hJu3XL3gkU6P3K/yk1MaOKCn1UEw86/gBebPjj9xNHTkCOtAklGVIeUcak8glJztDpNXOoXlOfEHSFmHyMw10qjRBjttraj2CaYQjsKG9anevIdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=In2mTV2h; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-36bf096b092so99641691fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 05:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759321443; x=1759926243; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nHasfUgFPRPVss8+o0xw6Yi8/GTt6o9Bplobnjw31bQ=;
        b=In2mTV2hOWtVPn+0PfPLmJC2Ufd2zUebM5ze2ZVLQsIWVteJpXLToMZD5Ezvrwd+Hw
         zUYy+3PCf8OTdHSyRw5QVyUgBQa480te9upf7SF/dqLyL30+gcSNu0HFFvymklYYf5NN
         Ywer/fwh5OlypdC2EVcOvPfFLlhJ0aUOL5gunN62i+iRRZl/NIW7Ux719XT3P50pp8rS
         A9Pw93jNAgYl35L9pdaIjSTc27LUBQ04LHmJkPBEn2sX5A+DIfLCHf0SxlXNMtVoIqi/
         1BNwF5DtK6Mu27sal/L+1ZJwkzV5eMHTwLCjI5YznF/AmFMs05UhHM6tZ9x9BlpWkVOa
         G5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759321443; x=1759926243;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHasfUgFPRPVss8+o0xw6Yi8/GTt6o9Bplobnjw31bQ=;
        b=mYJ26x3ImrNmgVJtcduTMjWEnyMEone4EOodkUVfoZskqZBJ4FP4qvyX9gwkeE1BTB
         J2ls7ZkH27bBVVx3f+APXO6P8d4rGA5fbrMDettafrfWriki0XJcVjRGynEvM+995YQE
         xP0IbGbdU+aKpjVKvdjGHAbsskWAdTdPFbU+eO01WbyPofHWnd2HW9L0v1Z9btuncFxm
         Gi4pFVv2MnwG1NMhvb6M/SR3Sjou9eCaeL+YktPzdmi56o5UJbSEkFs3bCE4z7IYcfpS
         fAmJboUyv5rFugy/jMWnv+Iuc9zcvodowi+MgVJ7NJPmLxpMQhGInEID59w44mLc/DAJ
         PxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlD9WG1K93wSjIT9T83/8vJRA8pQwm5f6XWFIki/2ZJ3fZrRE96c28WQa8jh4r9R6WLYRaQIbEciDo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3y0Piym00F2NS82CgHfdMGdk2Ms6BvVz2/dQZ6aVs/0IvZdYK
	Ivk7buBgGIAUlPUIT8edmJBjoon+J5hVJEbaDiJfZLMdWNDqJXxuazHoTMHCvLhak9cZNO3FTiC
	S6cGEsgwYvZJt1/U3ouzKwmY1OO6h1XiuWR2DacMNmw==
X-Gm-Gg: ASbGncssu/FAW6c/XuYmRcNWGHq4m4VpQPA99VO2Yhex4/WIHn08xrPCxuTh59ePlHo
	T0XEZ9qZLhplIb2EKNEpJgzx7J9atVnvYkQylb4noepHuFBmAAFAtTUI3TzC5uaN+Ci9S3zwdaM
	S4tZ/gex06wQY6qG2L0oYtRKVMpf23vuJ84//T+dDEUvok8FyDWvkjt5LeRUMCBA3fXcJ6ESmZr
	GIRKP2+UNYljz8a24LktczN0fCwh4Uk459fwePdYPKb7ad5GGGBQ/kec80eC+g=
X-Google-Smtp-Source: AGHT+IHYDvz+/lX0zw33U1sA1C/ApuLBMw7cIJb8q2ZQaXY2PqYI3Fr9XztWv7wcN1npXhu1OJHUkbTWI4erCk3oI0Y=
X-Received: by 2002:a05:651c:995:b0:350:b715:51f1 with SMTP id
 38308e7fff4ca-373a743b493mr8860711fa.39.1759321442897; Wed, 01 Oct 2025
 05:24:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Oct 2025 05:24:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Oct 2025 05:24:01 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250928054019.1189591-1-alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250928054019.1189591-1-alex.t.tran@gmail.com>
Date: Wed, 1 Oct 2025 05:24:01 -0700
X-Gm-Features: AS18NWCbuecsNUF0WwA3VSRra7deKgyL5_0cxGflB2HftoyExk_e4_2bD_8kO9Y
Message-ID: <CAMRc=Mcj3YpHqFqdGPF7YXRHz=56J73TV2oPm70SHUmgXRAy=A@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: gpio-grgpio: call request_irq after incrementing
 the reference count
To: Alex Tran <alex.t.tran@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Sep 2025 07:40:19 +0200, Alex Tran <alex.t.tran@gmail.com> said:
> Remove extraneous dropping of the lock just to call 'request_irq'
> and locking again afterwards. Increment reference count
> before calling 'request_irq'. Rollback reference count if
> 'request_irq' fails.
>
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> ---
>  drivers/gpio/gpio-grgpio.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
> index 0c0f97fa14fc..18d972fddfac 100644
> --- a/drivers/gpio/gpio-grgpio.c
> +++ b/drivers/gpio/gpio-grgpio.c
> @@ -227,6 +227,7 @@ static int grgpio_irq_map(struct irq_domain *d, unsigned int irq,
>  	struct grgpio_priv *priv = d->host_data;
>  	struct grgpio_lirq *lirq;
>  	struct grgpio_uirq *uirq;
> +	bool needs_req = false;
>  	unsigned long flags;
>  	int offset = hwirq;
>  	int ret = 0;
> @@ -242,30 +243,28 @@ static int grgpio_irq_map(struct irq_domain *d, unsigned int irq,
>  		irq, offset);
>
>  	gpio_generic_chip_lock_irqsave(&priv->chip, flags);
> -
> -	/* Request underlying irq if not already requested */
>  	lirq->irq = irq;
>  	uirq = &priv->uirqs[lirq->index];
> -	if (uirq->refcnt == 0) {
> -		/*
> -		 * FIXME: This is not how locking works at all, you can't just
> -		 * release the lock for a moment to do something that can't
> -		 * sleep...
> -		 */
> -		gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
> +	needs_req = (uirq->refcnt == 0);
> +	uirq->refcnt++;

Any chance this could be made to use atomic_t instead?

Like:

if (atomic_fetch_add(1, &priv->uirqs) == 0) {
	request_irq()
	...
}

?

Bart

> +	gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
> +
> +	/* Request underlying irq if not already requested */
> +	if (needs_req) {
>  		ret = request_irq(uirq->uirq, grgpio_irq_handler, 0,
>  				  dev_name(priv->dev), priv);
>  		if (ret) {
>  			dev_err(priv->dev,
>  				"Could not request underlying irq %d\n",
>  				uirq->uirq);
> +
> +			// rollback
> +			gpio_generic_chip_lock_irqsave(&priv->chip, flags);
> +			uirq->refcnt--;
> +			gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
>  			return ret;
>  		}
> -		gpio_generic_chip_lock_irqsave(&priv->chip, flags);
>  	}
> -	uirq->refcnt++;
> -
> -	gpio_generic_chip_unlock_irqrestore(&priv->chip, flags);
>
>  	/* Setup irq  */
>  	irq_set_chip_data(irq, priv);
> --
> 2.51.0
>
>

