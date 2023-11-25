Return-Path: <linux-gpio+bounces-508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 726677F87E1
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 03:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A9E81C20C59
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 02:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127D71873;
	Sat, 25 Nov 2023 02:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCW4awpt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5553D1990;
	Fri, 24 Nov 2023 18:40:44 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-58d205245feso1100401eaf.0;
        Fri, 24 Nov 2023 18:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700880043; x=1701484843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dc/0Sqt9JV0jUsEhdk3PHb97PcLJKpbUf0KfZf1VEGA=;
        b=mCW4awptkF5ZMmpHCdgJtAukI7e/VGpxj4gV9xdxebXdb085NQk/nATcWCeaveIySP
         kZ+ZdrhkxHI3sUzcQTtGlHHnE8BIy1gAV3hOmPtUU0ABrulgjoHgHLo84hpwyXNy/3NQ
         XKlclo1vhY0JIEjZot9jd3hXLjA/ROjTEm5HzomLBqw9TVegPhTuSQXGn/FKYOm+Ln/a
         f2LIFidrPQNYRvO9pvpagQkmQhjzW5K0BnMDsvbHry/5kq9MxYhOT+bWaLt5EIogwVW0
         2Fd5MOco+6wOlQEyEtjb/1b8wS7M9KU94I/9Knp3c8N+edXha7r9XIMw9Bg0hHqlBBXc
         SyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700880043; x=1701484843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc/0Sqt9JV0jUsEhdk3PHb97PcLJKpbUf0KfZf1VEGA=;
        b=F1PiuaUtkuoDzpO3o4nZNf3+kkfwgYL9IUhtoMsHXVO1OfRH1oGzMnCFqhsrorViwJ
         o4X/tOWYoKlM8/LXirQ5GwP8dNGj+3iLy5M3GOikC/jOLKSS3ibmggNjvulUdxXVn1b5
         8STZc3a4QhgpilOaeh5Q/miqKbIW7hSvSqvyY0ttXRap5MgtlFZODYCRbi2MrJhCUegj
         PHnbH/CBEVCWxTluwuF6MxxNeM9ThQorpAaZ61NXCCX1UNhShFK9brN0KHILwoZ6VBAa
         85dbnxwGbSqy8oSMudSxOklauNyJCUb4xUK5Ag/ytMVvbD12DoElc+k7vCcJNzJM1l9l
         DBSQ==
X-Gm-Message-State: AOJu0YyOkNwfWq0wh39Qm+cGWsYebbSDNapIJFpzk8Lj7/nyNfBcePku
	aD8yngZNQ+8v004dD92ENWqk27yiiSU=
X-Google-Smtp-Source: AGHT+IGYEITByIiIyI4lY4CRWP7/PXnR3kDlqhFr3vuUVmfIHb5d+JStjoGIKPenBhgLOHc4Cj7CCQ==
X-Received: by 2002:a05:6358:4406:b0:16e:12e:e232 with SMTP id z6-20020a056358440600b0016e012ee232mr5768616rwc.6.1700880043384;
        Fri, 24 Nov 2023 18:40:43 -0800 (PST)
Received: from rigel ([118.209.207.221])
        by smtp.gmail.com with ESMTPSA id o13-20020a635a0d000000b005a9b20408a7sm3726840pgb.23.2023.11.24.18.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 18:40:43 -0800 (PST)
Date: Sat, 25 Nov 2023 10:40:38 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Drop cargo-culted comment
Message-ID: <ZWFepm7ufLdl115j@rigel>
References: <20231125-dropcomment-v1-1-15800415aae0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125-dropcomment-v1-1-15800415aae0@linaro.org>

On Sat, Nov 25, 2023 at 12:25:47AM +0100, Linus Walleij wrote:
> This comment about the gpio_lock is just completely confusing and
> misleading. This refers to a gpio_desc that would in 2008 be used
> to hold the list of gpio_chips, but nowadays gpio_desc refers to
> descriptors of individual GPIO lines and this comment is completely
> unparseable. Delete it.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 95d2a7b2ea3e..1c47af866bf6 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -86,10 +86,6 @@ static struct bus_type gpio_bus_type = {
>   */
>  #define FASTPATH_NGPIO CONFIG_GPIOLIB_FASTPATH_LIMIT
>
> -/* gpio_lock prevents conflicts during gpio_desc[] table updates.
> - * While any GPIO is requested, its gpio_chip is not removable;
> - * each GPIO's "requested" flag serves as a lock and refcount.
> - */

Perhaps provide a comment as to what the gpio_lock DOES cover?

>  DEFINE_SPINLOCK(gpio_lock);
>
>  static DEFINE_MUTEX(gpio_lookup_lock);
>
> ---
> base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
> change-id: 20231125-dropcomment-89e5b7b4cc3f
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>

