Return-Path: <linux-gpio+bounces-2498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E7B83A735
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 11:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF70E287BD7
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 10:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA51199D9;
	Wed, 24 Jan 2024 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ar9IaweC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F19A199BA
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706093482; cv=none; b=Yx11S8FP/Zs+Mi83Jyb7T88K9eHYFGyC/P0ZMKspzzaTkN5OSdWiK0SK9F2bOWwFzuRSIFx5wnrJD8KrjFuTCXjXIRVWp9xrW/sJ37DABP2AuhdFbeVlnTEu27ZjlSTh0eUsJVkGiMI9FQD73AZLFkyRAP6DE+CoMPYhXbFChzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706093482; c=relaxed/simple;
	bh=y2mKgCBO/IasKUf12gCdlm3RmJfsATRiGLH9QuUpX74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t23Z2ogsAB6c/ATuUCH2j+JMA7GPE9xL9ACSM0+ecVzVR1MiG4LlT1frhsfDtGXX+IhmlFAeKKDB5DnxprqpFr3ZchYoi/dQsuBZlphrpOBCZaKANFMRtD45W/xxdW64KwIFC2hsA1lmWBnOwg23ub8RYLcP6xQYwpDRKkRPlYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ar9IaweC; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5cf2d73a183so4438791a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 02:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706093481; x=1706698281; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B/YrDVtlopTHbb+7k4lJBjqdzisG/MvwFJRJKCqq/yY=;
        b=ar9IaweCF1SRKEWskneigTt/EoBW9aua+bx/HOH9HdBi5qCmTf/PUJlzefGW+DmJgu
         sqeND1AHfYKIe/Tje2ehh0Cn2R/hO5i7WbPRUF/jp1CQEWX3nbTA1qm957Kw7Pkd5yzm
         UbZ18HPo/FRbFpOqBgNMFwsXw34WqK65VlGMpWFkyx63bunUeuGgUdg6SaoLFhpabX0Q
         b5Icu/Kogu8Ue+YAB58wYJlEDRzC68aTl5Ssqpm100PX2nfecfSNNbAt8NPFYs6lLp17
         GPqXtIdPKx4B8sk1/ezonE2132XeApWxAZEuk6n0cZAVDXscncFFhC49/uVwWq+5DOVS
         j1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706093481; x=1706698281;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/YrDVtlopTHbb+7k4lJBjqdzisG/MvwFJRJKCqq/yY=;
        b=ib3TAiPuObJKd2fllILyk7Pfn9f19YrichMqilXumCz0JG0wf+rm4W6+3oFdPeHzh3
         GMSiguMhmYQRNVW9ctDDjrVF1zxI1VRssjepG3TfuNWBNhzSFN3mGGuO2/TL2lydILMF
         1ha9aGPzHtYxQYCC4sZwZrNdHur2p6B1ronJqCZM48roDdM+c5kk1vRhz18YzkvtUlq0
         Bp7auY1oaXFJkDoQbeTGu3Udtpq9kbtiFLdBj2fMN1CJrsrRG1Lcqo7xt2P/Euo37Lip
         h4rC/SxKDelSY2YBEOxehzM1kefRzCCKWpRjS2syzFjXgSty3XoaohVu3hWARjtCLpdJ
         QX7w==
X-Gm-Message-State: AOJu0YzqBBX2dwrlRv97CTxeYzolsUit1IuGrr958xL9bGDVzq4JX6B1
	MRv0aXJ4O0fcC5FlLsuF9IQI0fNnaq2w1HhLYVTeKbtermBvcVSI
X-Google-Smtp-Source: AGHT+IFw4s5Q1vJRMSJB0lI/4fravjGV4IpkI9XKe01Gvblx8BL+uaHzFtLrlsW+P74dsYRP/o8AtQ==
X-Received: by 2002:a17:90a:c48:b0:290:331a:dc0 with SMTP id u8-20020a17090a0c4800b00290331a0dc0mr1458022pje.17.1706093480571;
        Wed, 24 Jan 2024 02:51:20 -0800 (PST)
Received: from rigel ([220.235.35.85])
        by smtp.gmail.com with ESMTPSA id ee6-20020a17090afc4600b002868abc0e6dsm13402306pjb.11.2024.01.24.02.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 02:51:20 -0800 (PST)
Date: Wed, 24 Jan 2024 18:51:15 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	=?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <joseguilhermebh@hotmail.com>
Subject: Re: [PATCH] gpio: improve the API contract for setting direction
Message-ID: <20240124105115.GB63670@rigel>
References: <20240124101803.23580-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240124101803.23580-1-brgl@bgdev.pl>

On Wed, Jan 24, 2024 at 11:18:03AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> If a GPIO driver returns a positive integer from one of the direction
> setter callbacks, we'll end up propagating it to user-space. Whether we
> should sanitize the values returned by callbacks is a different question
> but let's first improve the documentation and fortify the contract with
> GPIO providers.
>
> Reported-by: José Guilherme de Castro Rodrigues <joseguilhermebh@hotmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  include/linux/gpio/driver.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 9a5c6c76e653..c1c516b8a880 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -335,10 +335,12 @@ struct gpio_irq_chip {
>   *	(same as GPIO_LINE_DIRECTION_OUT / GPIO_LINE_DIRECTION_IN),
>   *	or negative error. It is recommended to always implement this
>   *	function, even on input-only or output-only gpio chips.
> - * @direction_input: configures signal "offset" as input, or returns error
> - *	This can be omitted on input-only or output-only gpio chips.
> - * @direction_output: configures signal "offset" as output, or returns error
> - *	This can be omitted on input-only or output-only gpio chips.
> + * @direction_input: configures signal "offset" as input, or returns a negative
> + *	error number. This can be omitted on input-only or output-only gpio
> + *	chips.
> + * @direction_output: configures signal "offset" as output, or returns
> + *	a negative error number. This can be omitted on input-only or
> + *	output-only gpio chips.
>   * @get: returns value for signal "offset", 0=low, 1=high, or negative error
>   * @get_multiple: reads values for multiple signals defined by "mask" and
>   *	stores them in "bits", returns 0 on success or negative error

Also specify 0 on success, as per @get_multiple?

It would be good to revise the documentation for all the ops, but this
is a start.

Cheers,
Kent.

