Return-Path: <linux-gpio+bounces-3502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A4585BADA
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 12:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9DE52823DF
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 11:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C3267A10;
	Tue, 20 Feb 2024 11:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w9zBvjLd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D83664DB
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429532; cv=none; b=Up/HxV+o+STufKSfl90wHABrCLI57eXEFKItjZtjPNWH1M63Fu1xlXQvGTiOwcci2Y8kRaBZWccE11UZx8KN89PEJDN+yuYj5op7GIHBXAO3cu7sAzd4ez/lmg2oMzXuMsPg1U0+XExkCvt52VfWt4klQOKZDB3VbSWGXNfPHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429532; c=relaxed/simple;
	bh=eHyHwdqq4qmDCrQ3gBpk/xUeJQ1JyLhjNoqeSTnbZ1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZxNpKkGhzA7H0ackbasj1eGgBt65Pn22EmLmFKyqfKAsN9ROae8UfABu684J69caXQaffeelq6QDCJIOO2VqgtWIEWBQNE7y4Ipn5gVOq+Km3WPshvB8/3e6n545pTu2fpz6+4qtrk6Az3F9W02XgPwZZ9tC4tG6HRyar6O/U3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w9zBvjLd; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4705e4d10a4so269083137.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 03:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708429530; x=1709034330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZP/OsX6csKOn+qHwmoP7d0TQBW2e9ptZfhQLBIc+154=;
        b=w9zBvjLdnSvtnGx2ysp72VwmENfZXKg3yziMyLPxzYX9UUvcUup0DhBHnmvufienT3
         vazaLKhO81k4y+KR0/wH8aoNp74dzvAe1eqH66Z76qk9vAMS7p/qcUA+KQom9DqwdeAn
         wvCNA7J/1LtGjbI8qBsBcHyDGakOYRXGz9iRyps+6Hh55ECpNnbQ3f1Ht8jeya8QaVio
         HBljPa71hmFeGWvzV2hRHVVCWxQc9wXRawNcnvvZc7Uyr6uio/PnmF6UBs2zGv7cO9WH
         J8+vJPGi2yBEznfPy0pZJiqUvKYn+i0FJYUSBROTFH1zh8pN08PBoRNCSP57iB3iI5qV
         PiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708429530; x=1709034330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZP/OsX6csKOn+qHwmoP7d0TQBW2e9ptZfhQLBIc+154=;
        b=eyjTQeRtVBfdTV6KYZPChMqvJ674x2wSTTf2yKwXKuSrICM2uCIR+BU1H9/Qr0iBr6
         bv8lOL1fy8pb7DUBwd7OCZgbDqIzkMKpNtg3OQMTmtu6QVOeaCdfQ8OU673GZ9znRjjU
         LHIyv2uZZjz5dUEtdGfo2rDwdOiZJVrGAeUCETYaOgG7SyZc/aL5nxx/nkBncR0+wOLZ
         tF7ktauoKCcwLTnvC9CuXDwEAbzpsFRPthh8saOxCyo+V/zCV1Q5ui2EgFxqAY9sWjxd
         nFIK1ifwgj0Nc2vr1fMf8CFUh/U/bCGWtyUu3NFYNNVghFgMLXs/1CbWIUSMXOx0igT6
         zYxg==
X-Forwarded-Encrypted: i=1; AJvYcCUJl8dxgVQShfcf5rCc38lEwRD/9cA9xSi8JALhRhjGq3GsVD8ZwL3PDsvUivMX8fI4XdqpZXKIgxizyAoN7l4j5G90WtsfENpxdA==
X-Gm-Message-State: AOJu0YyhnTF64nSBA2nz0QDOeNtA7gX27Zipzve3jw3culxzX92J2VMg
	crmgEzcHGf8Djgs0j23HbHqwNFHBWI22i/FitaItI4qwi5nCsfYOIn4MZ8zIUrxOBsXbT7YpX18
	0qHjbjgoVvuocGB752dNilDtj7wou35Bl6yky0w==
X-Google-Smtp-Source: AGHT+IHfdMavD1XY1shqpDJOCSyqYt2hMBT6PG4ZgllB1fsARcbFyAucEE4CiRfjV6Xw/RaySV9fCqqWdND5JJsF+gw=
X-Received: by 2002:a05:6102:50a7:b0:470:5df7:f9e1 with SMTP id
 bl39-20020a05610250a700b004705df7f9e1mr4857259vsb.34.1708429530410; Tue, 20
 Feb 2024 03:45:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220072602.36111-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240220072602.36111-1-krzysztof.kozlowski@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 12:45:19 +0100
Message-ID: <CAMRc=Mdt_iJ3rbPiBkLY6=PBPVdtbnX66xOnfXT8FjFQfC2UNg@mail.gmail.com>
Subject: Re: [PATCH] gpio: constify of_phandle_args in of_find_gpio_device_by_xlate()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 8:26=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Pointer to the struct of_phandle_args can be made const after
> gpio_device_find() arguments got constified.  This should be part of
> commit 4a92857d6e83 ("gpio: constify opaque pointer "data" in
> gpio_device_find()").
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> I mixed up chunks of patches, because this should be in previous commit
> 4a92857d6e83 ("gpio: constify opaque pointer "data" in"). Sorry for
> that.
> ---
>  drivers/gpio/gpiolib-of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 523b047a2803..e35a9c7da4ee 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -129,7 +129,7 @@ static int of_gpiochip_match_node_and_xlate(struct gp=
io_chip *chip,
>  }
>
>  static struct gpio_device *
> -of_find_gpio_device_by_xlate(struct of_phandle_args *gpiospec)
> +of_find_gpio_device_by_xlate(const struct of_phandle_args *gpiospec)
>  {
>         return gpio_device_find(gpiospec, of_gpiochip_match_node_and_xlat=
e);
>  }
> --
> 2.34.1
>

Applied, thanks!

Bart

