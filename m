Return-Path: <linux-gpio+bounces-1711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2B7819E33
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 12:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8FB289CA9
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 11:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CFF219FE;
	Wed, 20 Dec 2023 11:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uJdZiz2Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1233B2137C
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbd73620c82so1107039276.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 03:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703072142; x=1703676942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NamHnT73jUJNImDK5rKe/+cirCI0RyTQ89t6M3BsshU=;
        b=uJdZiz2Z3cBrfdAR78dzaz/pmMmgFkky6ljRBqB5HCOyiE7t3nGMNPAPZnA9sFtvKe
         qXcDvoUv1EwMeXKRbklGKMW2Kg2feTFUIdAzRZjxs7LI5G1P5m72NjvJ9hoLfjTxGUS2
         HHk9CVQGUwqH1HC5HT1GdI8eEebf731KvpUScqdrJv1kcIGZ20VLg+v+NWtWXEBW3mt9
         usGU47SmEAqJp/jeeBoH+InimP1/CrmKNk6cfFBteHtvM5vvXgVG1u+Be4IEUTb7w/uO
         S741CCsk78IYGrvtaja0ijv7h5fC2Z5ESs1jdtD3ahi7jqNPMZudtE3shBbJ1HdekUBC
         HMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703072142; x=1703676942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NamHnT73jUJNImDK5rKe/+cirCI0RyTQ89t6M3BsshU=;
        b=VeGoZLDsp8LpgLiL/eu+MYvSg9vmJaCvKrpEHl4vsHUYhNagJaZJxFaDpJHE6frbjR
         uA+wpnkbffAomAhYz/K2D8BBcVFVTYM5uWkFaURm74x3tV7ecrCEBpAgcqxy0rzmb5I9
         Uo1P+Ke8Z69tmEVBK9m7xXNrROU+k3Qtvh6iudueIMIGFtROY3DEoBqmoEszQD2+fPxz
         g9eq7QutvY0LI6a+wLSuuMt9iaBp9ZOenD4PRZ3rduU6V/Jb1NiK8Xxy4HKxf/eAeIQx
         HhWsmm2b03pfomiCEQUk/nSE1m0Cp9woWLmdkslfnArMdLH/jBThghMQtYsoq14aPDnP
         SceQ==
X-Gm-Message-State: AOJu0YwELgbv2Gg5I48WUelIX7Hl8k54lvB4d7zrvHL1OacS36Ty78hk
	6QhZgdzVr4kHgizOPEkR2FJYzhWD2bI74a4skwm6vv10kU3Q0W+E
X-Google-Smtp-Source: AGHT+IHhZGNaq/ykMCVlsxZIoP0nT75ImyBpYvveH4wnPNiv7CYjde8jYs5CQxRD1ieGxTVBWFi5UTqJ9IacEiNfp2k=
X-Received: by 2002:a5b:712:0:b0:dbd:5536:33f3 with SMTP id
 g18-20020a5b0712000000b00dbd553633f3mr1538189ybq.39.1703072141977; Wed, 20
 Dec 2023 03:35:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219201102.41639-1-brgl@bgdev.pl>
In-Reply-To: <20231219201102.41639-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 12:35:30 +0100
Message-ID: <CACRpkdZ7BO455gN1QBVdSqe3VupYaEnnDbGty031nj_uPXgHfg@mail.gmail.com>
Subject: Re: [RFC PATCH] gpiolib: remove extra_checks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 9:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> extra_checks is only used in a few places. It also depends on
> a non-standard DEBUG define one needs to add to the source file. The
> overhead of removing it should be minimal (we already use pure
> might_sleep() in the code anyway) so drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I see you pinged me to fix this and I didn't get around to look into it
even, but you fixed it just as fine yourself :D
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

