Return-Path: <linux-gpio+bounces-19820-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568FAB0C8D
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 10:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBF59176FFF
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 08:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950A9270EAD;
	Fri,  9 May 2025 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3JH/LaB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E6826A1DA
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777925; cv=none; b=YnWeoWfTZCUm9jUlnRIxTlYaSr+uFAlyxywKjWn8s6SDLPh6ebzGKe7QRq5AvdcE5P0yUylGmPAJAnVuR1owizXBAHqJEQ0vVcF9ddqsCXiNNLg/7jJq0aUIGZ6f6yAt13yVnxs2mvlZMVRn5U+rdwjWRzwVm7y8VOjNN+saerI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777925; c=relaxed/simple;
	bh=DkNK4V4s8P1105G9M2GaM/bKTLtt9JfO/Y81L6C+ekY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWZGeGK14pROvnwE9yD1Oy6NV30ZjN+kbf0coYNenaEDEksCgjEgPYxdjg9ykK/r6Ko1ulJjvmSQAgXFtcZHovJq/nwEXpF/ORLPdVEWJ7cAt5TVKRqUyLih8nnYt9RhI6/iio0gJROJ4YIhxmRMPd2iE+fSOWZlqg1netIiZGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3JH/LaB; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b166fa41bso2220520e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2025 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746777922; x=1747382722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkNK4V4s8P1105G9M2GaM/bKTLtt9JfO/Y81L6C+ekY=;
        b=s3JH/LaBOmiDNvpbxFIFQLtt1a64gWoyPEGGXaF448cfHxXWcQ3jsE3VaW2gFYg3Uq
         ahmtOJb+vl3OHm8kN+yZ+YZDIRSkeafnb28xNZZKNdqPwj0U9IxHaPBGGAgfovkqLDsZ
         PZHMjf4WLfjn/r5BY1jyAU+JlVu/J93ATXoXiOcLflMQCrDekZUJlIuzMsUxwl6Bz/HZ
         /c4ZOywCKZYSAZNfjW1JWSePkOl2pzD7wnB+jp6JIlCotCQXmSsf2Knmv6MlD2MnQAER
         elMAkX9s4m3GXoXNlxVhdN9GwdYJvuF30+/cMtgfQdNuxL4y9y/RxUnaHkJsRKFJFr6U
         jA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746777922; x=1747382722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkNK4V4s8P1105G9M2GaM/bKTLtt9JfO/Y81L6C+ekY=;
        b=Io6/vImkqLdXQ3kXSMC8GHWFMUx8ibj72oHpW2HnGrQsRDpNvELbRezBqnJaOnVp7Z
         xPabg96CaD4XqZZbW+fs4vkayZ+xYeAkhcKxFVmp2+11rj7eG4X3rhW2RTOUn/1kToRu
         zP3soOnA3OK7x34hyNtcG9OvTqxDiNHiBNQvy86KBhqvZJSVGLBs2COWjQGlwgMJ1Fvz
         j2c1J4SCNjxQzxxc7kdD3/SfAQTnHQQjfR/UJGSYxdQp/snGo+CDrWXig++Lgq6E4FsV
         6ivrbRoPne0xOR+CezcmjnUqWjUiKZ+hDFzyGVCmMcX13naYVKfV3MWWMCRSij7sDM/g
         H7kg==
X-Forwarded-Encrypted: i=1; AJvYcCW5hU7Z7WWRll/zfGVLH33S1W61xmrce2fbbzDlbEm0Uo07Z758PJKV8YnskxswdljD/aqcI9QfxfQr@vger.kernel.org
X-Gm-Message-State: AOJu0YzluBhYE6BsqVR9Bpg5uyYLm2PA+1uPMF3+X9ZsIhiDUktHUTjo
	nW74VM1z73lITUa02Ry6jQngM9TOAyRpFBl70qkM5hN+tQ1TlsUpwCj/fYTOrCZE9dVkRjxDvG0
	JbjGxYo/trsZcrLA8LPdgzKBW+VrLmChL3107vg==
X-Gm-Gg: ASbGncuWmod3Gc57oDbJKsgWCRHoiGc8Ogtg9zHfvwOyGlAW5NwzhXCjPkjryEKzAgB
	vG556mPbhWhVbUMOQwf/v9tEbYZn0xm0F1Ug6tO7FZ9FD2PyrY8o2sAafXQek2dd4m1JZ7RvCpb
	Ah3UAXKHqxJkWrizH/R0T4/A==
X-Google-Smtp-Source: AGHT+IHygTOWySTUQ1JX00eO97lqc6HJQVUyB58fvB2NipEYZeQL68WbWlijYDIMb2+wa1Msnq90mTMLlhAfQvVGkBw=
X-Received: by 2002:a05:6512:6802:b0:54c:a49:d3f4 with SMTP id
 2adb3069b0e04-54fc67602f6mr649569e87.0.1746777921621; Fri, 09 May 2025
 01:05:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 May 2025 10:05:10 +0200
X-Gm-Features: ATxdqUHooQ8Ld9mj2dz6cfM7sdUGr8k9BsEqfTdMAuQ6XUXjp9g6npbLz8jBOxY
Message-ID: <CACRpkdat91GuhtkYw8mzzt2fgufktWCy4fnA5Dkos2=pWfWftw@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: mediatek: convert GPIO chips to using new
 value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 11:01=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the mediatek pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All 5 patches applied!

Yours,
Linus Walleij

