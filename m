Return-Path: <linux-gpio+bounces-2499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C8383A74B
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 11:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B79BB2B011
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 10:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4041A27D;
	Wed, 24 Jan 2024 10:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmtfVIbw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB0C199C7
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706093671; cv=none; b=VPIj+H+EgULgiF92U7IHcgVjHvJdFRNVWvXUL2GAmwIGBFoD9NOrm8Jp6H2T0xLK2TluFWbhc07aw8WWGT3BRDkUOSSyKZRxSDFYFMGrECkOoqLLXgDG39V2U1SH/COw2Vm37kt0Pa60PUdbljF7A1D+1pYzyADycjME/EcAvAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706093671; c=relaxed/simple;
	bh=5K6QVAl3GyWpRQWiXWlsRT6LyMhnui0HlsZk85OW18I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huOf1uoU024sT6IMNO88hg5+opyWjHSZ2mpggChoQIB4OxskByf07jRXf/sxuoCXaFLzh1GFdrQ5WlkyAmPYH+i/PjwKVgojKBIY2yH8DAHKRjbYXqw5Ev1m9b+p4V1/Jzprc7O5HxEEIazVKYfQ4FaLxvn65m81OltsnDBDP8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmtfVIbw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d7354ba334so31955365ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 02:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706093669; x=1706698469; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nDFGXE4VQ0x8pD+F2S/z//I6CtxWYA7WlGRASXDQvBc=;
        b=bmtfVIbwcosFdmL1dgWm94QaceHO4hHZUNqo8pFv8U+UUlMdtpCuQN4Sd7iNdyVwDj
         okByevE9ffQVnVVf/44p/d5jkaaC+Cy8/BllL1Xyhj903fF2ohf1+ohqWqoWEvRQiHwj
         RSctpZUVknN3Ttp9pCS5sVGKmDN4uBIpGEm8I/jmeK8BOS+bcs4lndK1aluX6KalKlQy
         PKU/FByK/41lSXr8n8kc6ou0qN2oki2/rvc1E4Ali+DODDu+I63RxaF/uRG/xfq16tiW
         gfXb7l71EzB1jox4C+t7EzP1GTE4hGW7CkWXqZq+yPlGj3fq6XqyH4KdV9F3r68hQc2Y
         Yb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706093669; x=1706698469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDFGXE4VQ0x8pD+F2S/z//I6CtxWYA7WlGRASXDQvBc=;
        b=YEb7eiZ7jTKaDlbDVC81o47K6GWnSP/MIhG3ozGOOxTvjvEJs9sz1zzJTkJaNSdd0w
         m4imNeEFoMmgHoI/+Qli4SJJ7CVZnZHdziYjh7SIpgRShXaW6yYGpTVTWo82uQ2HTheG
         6JNm+/MtFG4UIwPJjB0Qw18Ka+diaaMT/KYfhVLnNTpaS7E/X95H+9h6AQOY61DsKynP
         2YrBlGzIcvebhp1aWS7EAE3dK1jqpSYo/vGzKEEOu7VCHF2wKbZjTdBf8mGdBgDRzaoU
         KZ7D8vOtPVvjmQyFUISTe/gfxUuM5MHDpczujFrBXOqlQPWEk+cHOhG4P8F0ncb+tmuq
         GAZg==
X-Gm-Message-State: AOJu0Yyusz4wm3NZSfmh8+jDeyfi3tG52uJiClLd5yPZE1xnh/IwH6wO
	IZoIL905+qNzJGRumwr1DpaqZKe2KlkV/KH50OITppTyc5NnlGsT
X-Google-Smtp-Source: AGHT+IH72YQOh1BXRP8g0ffe8fwQ0PcD84lCvcjDbuZj8+a6V3ZXgvBM8/egs5KLWTWfd4YN3hy+FA==
X-Received: by 2002:a17:902:d2d1:b0:1d7:194b:2d41 with SMTP id n17-20020a170902d2d100b001d7194b2d41mr929676plc.38.1706093669490;
        Wed, 24 Jan 2024 02:54:29 -0800 (PST)
Received: from rigel ([220.235.35.85])
        by smtp.gmail.com with ESMTPSA id i10-20020a17090320ca00b001d737d51411sm6229246plb.227.2024.01.24.02.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 02:54:29 -0800 (PST)
Date: Wed, 24 Jan 2024 18:54:24 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Phil Howard <phil@gadgetoid.com>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	=?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <joseguilhermebh@hotmail.com>
Subject: Re: [libgpiod][PATCH] core: ignore positive values returned by the
 GPIO_V2_GET_LINE ioctl()
Message-ID: <20240124105424.GA66219@rigel>
References: <20240124103929.66545-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240124103929.66545-1-brgl@bgdev.pl>

On Wed, Jan 24, 2024 at 11:39:29AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> If the kernel GPIO driver (erroneously) returns a positive value from one
> of its callbacks, it may end up being propagated to user space as
> a positive value returned by the call to ioctl(). Let's treat all
> non-zero values as errors as GPIO uAPI ioctl()s are not expected to ever
> return positive values. This should be addressed in the kernel but will
> remain a problem on older or unpatched versions so we need to sanitize it
> in user-space too.
>
> Reported-by: José Guilherme de Castro Rodrigues <joseguilhermebh@hotmail.com>
> Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  lib/chip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/chip.c b/lib/chip.c
> index 7c05e53..7bf40c6 100644
> --- a/lib/chip.c
> +++ b/lib/chip.c
> @@ -239,7 +239,7 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
>  		return NULL;
>
>  	ret = ioctl(chip->fd, GPIO_V2_GET_LINE_IOCTL, &uapi_req);
> -	if (ret < 0)
> +	if (ret)
>  		return NULL;
>

What is errno going to be here?
Is errno set if the ioctl returns positive?

Cheers,
Kent.


