Return-Path: <linux-gpio+bounces-579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2BF7FBC20
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 15:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 068561C20C12
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 14:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0723B59B7E;
	Tue, 28 Nov 2023 14:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uaU2MYcs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97800E4
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 06:04:19 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5c85e8fdd2dso52018767b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 06:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701180259; x=1701785059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyTIAD88uiTFC+Ckur3HZ5JKDTkHFJddsUZ7zO5rxZY=;
        b=uaU2MYcs/ZKaUckeClW/vh2SEpE4ILPsYdkSj1sPbE4DocOTEITSB+z6NsTcEEn0st
         KdPS2DAHcaXVoTIzgF0Lr1o6fSilwkXDxSvflCbp0nM2KY6a3SdGjDS91qXTDo8GaSEP
         u3HcFUTaw3O7CSYO5K91hIjoWBlwuMAKD8bNS0fcTqgM+rfCMTZHWcTjUxNw9+j+NyM7
         lGSPw7E0oTChuSniyXBZTvtgPuFhyQ1LfBljs2asCwJBuFP1WqMMNtbsf8gv7drUCLY1
         KQpu0rvhNeX2PhftNtr24mCXufQbK4Vw133IRHZtbu7tmHOi9GgoL1bQ3xOLbWS6QwjR
         IF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701180259; x=1701785059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PyTIAD88uiTFC+Ckur3HZ5JKDTkHFJddsUZ7zO5rxZY=;
        b=v2sgEZ/XKuYYkKYvEOmATnU+DqTGY345WrtCeIqPkbK/MHivNDh/stslMiWS9syVg0
         Sz9uX5s6AhKiocxq3qfyyIL7RYX3AmhVUMFmvYvrkYFBvwI3iy6ksAA0mRFDDxJAWLCa
         wOsduWmvuzlzWVsIKH55zyx856zbjwpMAGaYGHcFpvUcU+pLAPf4OqnU/1iUh18xWdak
         M5gwgpye/ijATxz0z/Q8xq7bdjF3+zoa17qHJRPHr8hxs7+xa+RzK+Op82VRmYcf6dl8
         8RHA2LITdgQrz2067zs1+gjFqmyxEMh6wG+yy6r0xwGtts1LPz0FUomJPNxAV0xuSLzJ
         Ni/Q==
X-Gm-Message-State: AOJu0YwU1U0UH/ypccUD5Qk0YetoxIgquYjZfXoe5fZ0Cw1/maKoH0U0
	DVD7UQJ3oZdVQKCzOvVTya9hvocMz1pn/QH6yFoGNA==
X-Google-Smtp-Source: AGHT+IEAhaxY7VXrsKyapb49YDVLidKEv2PVueicNtrV/zkkM1Fw6vnoicZOv1OP8hqYM6AKpWp8/dsN2BJz/2mmQrA=
X-Received: by 2002:a05:690c:c09:b0:5ce:7ac9:d10c with SMTP id
 cl9-20020a05690c0c0900b005ce7ac9d10cmr14223522ywb.32.1701180258562; Tue, 28
 Nov 2023 06:04:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127193716.63143-1-brgl@bgdev.pl>
In-Reply-To: <20231127193716.63143-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Nov 2023 15:04:06 +0100
Message-ID: <CACRpkdaMCdMaqPrmBJgTKHLGsW8YJmq=KkuzRToiF2EYk1apeg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: sysfs: fix forward declaration of struct gpio_device
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 8:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The forward declaration for struct gpio_device should be provided for
> both branches of the #ifdef.
>
> Fixes: 08a149c40bdb ("gpiolib: Clean up headers")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

