Return-Path: <linux-gpio+bounces-23564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E69B0BDBF
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3302C168FA0
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C73283FEA;
	Mon, 21 Jul 2025 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EsG1Er7O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF113C463
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083355; cv=none; b=uCogtbMSd8ZHXYtxAJEsDtg3WJZ4YNyPhT8Pk3n2Pf0x24BWzxGkKBnozvOEVYw4GT6rwal7X+dcolEJv4dx5rmyqvhkxFlwBun2NII6U5x91fNvobQjUzrbbusEyd2gTBbq7DGOhPO3sPsIwcjYwcc1vWk2Eb1Eh3QcjfUc/2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083355; c=relaxed/simple;
	bh=JlEVGvJBHtlHNTDtO0w8jJyxUVu3Z22NNLdplU+xc/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkFiqtx6ZfhV9itSEBlRo83Ba8Qcnlhe/4UoHtDxKecxdUk/YvgM81jImGJK+N9CnsaXpGpaoXTxwnul6eZITgfZFjA151Yb8FgXRu0R0igrQftnMyCO0GOZs+1r5PgLXhCbdXrCzzl+cu7POsWW6uJpIhDubx/191zNnYlBQOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EsG1Er7O; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so3351668a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753083353; x=1753688153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=opejQY6aEiVoVxbjy6U9B6Te37ExtyGUXjhZ6UU9RtI=;
        b=EsG1Er7O/TvfXRjYwY25rKm7yCwt3qyTZgPZYlvD8CbG57tTJuveVzAHwzY348uhV1
         37Yd/SUMoj8vBTbfDsPxFBkfBeUhbifKk4kj7NTfK7iQJNXwFGA6eDE/dikBvBDCzhss
         g+QxQzfIcg56LtVGfp8YLRW38654jIFErmw4YyAtX3Wk64sOehxzIRKIUKw+hwFzntzq
         ymrRIPLCadQJzHuJczo9ZBddEE3Rp5c+lrp+qodaCBHSN2wO1FFMsqD/LQZmj3Gv51/Z
         tfwLJNhgfekRAd/128sRrF7DNlCYh9PzpRbcqdIpo+NC1/bVSENGdbY4QmzwaR0VtKKO
         c98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753083353; x=1753688153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opejQY6aEiVoVxbjy6U9B6Te37ExtyGUXjhZ6UU9RtI=;
        b=evOH5R4XF4rNf1ySDT6vfRmOIHvKKCutBflpvqyfsxFv7oqpBWG4VsHNTGpAg/6a8H
         GMvVvN/ie5Mf/3AGh5QG9k+Othoe6J1Zm1Et1A+vRtkFslyqwkk9YoXOKn5QbUcHQkuR
         bQH4ArOoVnFS4NK4Ee2YzFxwun/6WojIfD+Fv5a4x0JLG3DcVaDiwiZ8GjKwMb/YE8Pt
         YhmWVvwO2dHrPtvbKDpAZJ+ajJSVrKDSQM4VK3jdcuS8mdvab3ZqzwzEN0syAcL2Kz/N
         niT+j2tN2to9KqWltJJ1KyPASIvHjzx6+vHqQlKb7YpceZGqFByGOmXFCeuzT3lRaJ+E
         0rog==
X-Forwarded-Encrypted: i=1; AJvYcCUo2OSHKhry+szXQRV3o0HwgQ2izjEtzsx0oFZH+Cu5rjLz/NvbPXuT5gpvSIPIjHM5oL/84aa0Pr9A@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgun7Q78z7wNUnYcN6XpFLJ+xAEWIHkCq+tuJ6X4MLvvK/EnOD
	d4Oxk3E9kyPrA1SGUaHkonzuPL/LPYZ+EhduSc/vzUGR7WTAFoLIch7DIRhpjQEkSqY=
X-Gm-Gg: ASbGncskzO8XfiA/R83zndxV46GeRIop8/7xAvM9m84uuEGcYNHY2d+GEpVAjZO1BrG
	isTQsl5ZeXFDh+RjCMMke85eynE3ISYOAUIjScIxBNwu532XpcRaDLiUnSZGLySgOirirawVjOo
	lyY4c0n0mQD4UCqXROFdD4mhRxdx6NS7PTRj8ll6XpmbbAKwG0hehyPxhFYj3RQW4OdMjYwJ+mN
	5kIDvROT1OUTXxdCxsUw8hxb8CyiAE5oDPNlt13bm7ySLVTJTq/l2Pnp5yK8w/GZDf/dXdkw+Rz
	a29Gh42xYJinSeWghfal65T0rn4F1bZjfMgcTNstjxNQJWtwyfIOVqwAUBDUhwsq048XuutPCXY
	w4MdYvHoiQG1i3AijlaedRJy9DyI+23svXQ==
X-Google-Smtp-Source: AGHT+IGK+6HzSNcmFSThyhCNQrAKtbibXLnXPY44UCPOueKCYjgbvGzpUGfg57u47w+lHphH593XZA==
X-Received: by 2002:a17:90b:548e:b0:31c:8e24:dfc3 with SMTP id 98e67ed59e1d1-31cc03c0048mr18979556a91.2.1753083353128;
        Mon, 21 Jul 2025 00:35:53 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29ddcbsm9465067a91.36.2025.07.21.00.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:35:52 -0700 (PDT)
Date: Mon, 21 Jul 2025 13:05:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Erik Schilling <erik@riscstar.com>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod] bindings: rust: make
 Settings:new_with_settings() crate-private
Message-ID: <20250721073550.u6evy7ccehnrgyit@vireshk-i7>
References: <20250720-new-with-settings-crate-v1-1-a51392bd5b13@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-new-with-settings-crate-v1-1-a51392bd5b13@linaro.org>

On 20-07-25, 08:16, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This function takes a libgpiod raw pointer as argument, is not
> documented and should not be part of the public API. Make it visible
> only within the libgpiod crate.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/rust/libgpiod/src/line_settings.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
> index 4ba20d4556e1d6a017910eb3961927437b157b3a..7f271c3b7397c81d4d2e15fc8050582306ad2b5b 100644
> --- a/bindings/rust/libgpiod/src/line_settings.rs
> +++ b/bindings/rust/libgpiod/src/line_settings.rs
> @@ -46,7 +46,7 @@ impl Settings {
>          Ok(Self { settings })
>      }
>  
> -    pub fn new_with_settings(settings: *mut gpiod::gpiod_line_settings) -> Self {
> +    pub(crate) fn new_with_settings(settings: *mut gpiod::gpiod_line_settings) -> Self {
>          Self { settings }
>      }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

