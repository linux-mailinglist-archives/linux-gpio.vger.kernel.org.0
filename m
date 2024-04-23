Return-Path: <linux-gpio+bounces-5745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CDA8AE4C1
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 13:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC6CF1F21C15
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 11:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35471422D6;
	Tue, 23 Apr 2024 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jUNa/QHf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173D086253
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 11:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713872468; cv=none; b=IEWkYjlPUJ/1iaoQMSwgtylI+SBVhJR2tPcB3cGZsG7HPv871U5QCg004k7wfW4HCUwhKo3vWNLXmVUtw/NFpYKTObcksQJGGf5ZAFpqfHWKytDgt/CnzeJ3mkg5mEEmww+EP0ZqkfEXcJC/j8bvZmjb157KiWpA19mDNfVRs54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713872468; c=relaxed/simple;
	bh=jGSxB/aKBQrvQZyFP9ugxKa9qzrbfWhqVhGn/ZIkYAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXffdyLg/85Y2ggSWwi7gSaBaJbCUBxTClFVSw8HvAtmoAT2jHyf5PB3f/Redx/vE79GiXo1LDUfDPQiYTa353syk0RB87+EiVBEZV3X/nLoYVLM45akm9WZxgz6tSaZ+8RVTKVmIjmw4wpUBnTZVnDJ6ghqDJaYlEH0B+khTZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jUNa/QHf; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de4640ec49fso5686446276.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 04:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713872466; x=1714477266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHww8guo9joHfM40pOxCx1WuFD69gCMICsgCV/kfVdI=;
        b=jUNa/QHf+h7rYfkyPkjek9PKWLdqhYn8cYkiC0ZAa62e0AthIsdqVaYno2Psgu54Tw
         uGB5D8REfnmWsukIeVHj6PGddpntyXFlHNKuiTAHQ2UG44fKPlmLzBdQrn656KyFViXv
         36GuWW834TeQTyRaWp4QxurOJ6mxzmpSdThL4pbt8jFxflYLIE+TPUQoiMQqW7O1E6Ss
         PNMyVuXkYz0rU7Flh/7J2Sr1heGl+7Mae6Pw+gHCQJNuYwKw9U7X5KJRXRWCjSDd64ca
         +XqNq1ZFw+EAjP62mGVaLWygdTyauWXRSzDvP7nvO7Jta9NClP4bKUdaGAMRihp0Ouqb
         4qKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713872466; x=1714477266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHww8guo9joHfM40pOxCx1WuFD69gCMICsgCV/kfVdI=;
        b=KBh8wcrrecKoaxK0ZpIYQ6g5Zk2n0dv4PosSb+nOEMDazIslBxLZqZvGDQxgyj2R1L
         NYChFvGfEaYFk6aNBzmV1Va1Pfc1ryHU9uUOtMdMtVZad4rH/A57Xq6HNRbATBkseCt5
         kerPTQmqyMozAcSn3hBXY6cBSdOuKgjbh54piZRvvqcsMQo+RAANWyf2A9AA2x0Wzywj
         O2ZxBnYADdpKHmftz6DXOoV/DFDtvZSCD+D8pDtYoWAekksiRXXClZ6T8eN8gFtuBW5r
         0zOj/b9yQViUu9QgMP8188bij80aCLOWkmNKJxDYdYCIIW8jn5Dj57G70XGC3RhvBleN
         AN0g==
X-Forwarded-Encrypted: i=1; AJvYcCVA0vXc7qTEJfpo+3SKq936R2Sk2k2ar2lqxK6s/zo1iHn1ZJDKUOb8/la9V/7ck7gJGTZtQezZqnLgT2t0TvbqNcbAgj5kpnO7Pw==
X-Gm-Message-State: AOJu0YwyBnMv3IVVsaa4sEeKLoFPaN8DMVMNbk2guz2NySrtYrFqp77r
	vvnR8/ckM09TU+0Iv7OFhNDypeRnxozIjWwQtFF3L8VclMFol49GJiN0tGNt5bxe22wzaXq1jkb
	zV6li5/N7MBAEL47Bq1EIA1K5JdmQRdRmBCbj9w==
X-Google-Smtp-Source: AGHT+IG0zUJ0k+vOuaZckaNvNj9KvErNxit8stDC2Lri93dfWftA1haaHyaI6RFYiG/AC23vxxVy2y/4BpkWBRxblqM=
X-Received: by 2002:a25:bc45:0:b0:de5:5084:715d with SMTP id
 d5-20020a25bc45000000b00de55084715dmr1506637ybk.53.1713872466081; Tue, 23 Apr
 2024 04:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423022814.3951048-1-haibo.chen@nxp.com>
In-Reply-To: <20240423022814.3951048-1-haibo.chen@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 13:40:55 +0200
Message-ID: <CACRpkdaRxoEZT1_KyJ3QMDgBcciw1XUXKr=cEiPxbcwSnpmyiA@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: always set GPIO to input mode when used as
 interrupt source
To: haibo.chen@nxp.com
Cc: brgl@bgdev.pl, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 4:28=E2=80=AFAM <haibo.chen@nxp.com> wrote:

> From: Haibo Chen <haibo.chen@nxp.com>
>
> Though the default pin configuration is INPUT, but if the prior stage doe=
s
> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
> INPUT.
>
> e.g. When use one pin as interrupt source, and set as low level trigger,
> if prior stage already set this pin as OUTPUT low, then will meet interru=
pt
> storm.
>
> So always set GPIO to input mode when used as interrupt source to fix abo=
ve
> case.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/gpio/gpio-vf610.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 07e5e6323e86..305b0bcdee6f 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -214,7 +214,7 @@ static int vf610_gpio_irq_set_type(struct irq_data *d=
, u32 type)
>         else
>                 irq_set_handler_locked(d, handle_edge_irq);
>
> -       return 0;
> +       return port->gc.direction_input(&port->gc, d->hwirq);

Just call vf610_gpio_direction_input() instead of indirecting through
gc->direction_input(), no need to jump through the vtable and as
Bartosz says: it just makes that struct vulnerable.

Second:

In this patch also implement gc->get_direction() which is currently
unimplemented. If you are going to change the direction of a
GPIO randomly at runtime then the framework really likes to
have a chance to know the current direction for obvious reasons.

Yours,
Linus Walleij

