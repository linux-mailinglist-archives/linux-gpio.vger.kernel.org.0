Return-Path: <linux-gpio+bounces-3285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB6854A61
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 14:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B60728E776
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 13:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E0054BFC;
	Wed, 14 Feb 2024 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pRFGKv/B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8CA54BE7
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 13:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707916951; cv=none; b=aHSAOi+E6j/QOdri/TsTwZytryxZjQxFsbLwzonPMS4yV+e4tzurANDZ8duHhqnn5A3Hx7OF7JTjL1fV4UWUi3qaebe6A+ronk0u+ZyJTOYD4phfBzXf9sP8fUrv/dcfWR50gbti+GSsI1SazCIU6dDL+kN7Vit9Q67kyHNPn3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707916951; c=relaxed/simple;
	bh=JIIHujTmuNmPvcv5WrQT88yXfMgmxMBanVLER3dOT8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ja/+fZANUAI8n3Fkwy+7LEJG5tlEpSrnTyjKBdGxl2+9q9BgR4LJVZtlXKkX/sRjwnU+O7JBApyAqyBqCAkO4r2XSTun3xjCn+JkHrlvkvpQQSGL1LLaXCkk1IgTgu4URO6nwMircu73UtWbBCcnPOrSqN72IGkFfEoGgqN58xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pRFGKv/B; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7d5fce59261so3134434241.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 05:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707916949; x=1708521749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjBEKrgeEwXWHoh08s3OWJBUnSrSJdPA6Ijs0tf9KrU=;
        b=pRFGKv/BYk4sEjL78sHr60Or1CfUcbg0xhbn62q8GDSEr/v5O5ZzrfODmKMrX+AZTi
         eSnh51HSjSjAEmRNO1rKVFgtIQZ8a7DS9NWWx7FQDPrvLt2DFs2C01RFtQjkf2I4BDug
         ttT5pjY/F04llJnUs55u2b+qEdHZui+cBqZEv4yKfMbzsRxC+HLJBBpADQIXGjLVw/P8
         //VYoW3IMmQDgphY049e+RiiIpaEKkqMHZV3vFS6U7yBET+c3Nu1D+pooWMYXkJpmwC6
         h7MWM5nncT0hC/4qrPO3IU9q0YONuuCvrtvH51BO1r3kBNTlCTsvm3HVQB9AUWkxsSgH
         DMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707916949; x=1708521749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjBEKrgeEwXWHoh08s3OWJBUnSrSJdPA6Ijs0tf9KrU=;
        b=Rzh1ptBxq9F9dpX0gAzPnc4bJ+JgX/RMucOFnOhRxBpitYUiBXBgjjPlA+1SmQTVwW
         Pw7cgQw63Y246J2YlH7HXFkT5Np4IBOgu6gFQHovaDWazZUBJfdqA1q8DvPt2OnSstjy
         Jn2gcTIRX3TJxLzHVbMqxTqJz5uwXb1a7RCxTetXFFnN6l/L8le3NEgWlIjHBkr20q2u
         NBCcRTNyK4hlVggJ7gCZ2fW9bOBxrmh9UDHOVjNba9yIWgSSb9um2deZh7tlVqFTkyw0
         wC6d3uAqQ2yl9U/PhMjJid9Ilihjokh2ecR53u8aY524jcjD31zSyrUC5dnOhvo5BRMF
         MvNA==
X-Forwarded-Encrypted: i=1; AJvYcCVZuzRTKoZDS5kODPOcMx5m8iJNMysQpZWQJktBOxNdZspPe1fwSLtVfyjLi0NkElO3ne0BfH/kqtbWKV+BngkZ74QLoJIY+DxJNA==
X-Gm-Message-State: AOJu0YzWnDoXaehTD/sWy+jyXTiJ3QnfOgeeXdZ09Hdathx5GkGlA6Q9
	Ctf4YPEoWl38jxLjpAAWBr8eNwbdi/S0AJ1NgxtQrc5fUnrN4INyPUX8WKVB55eNY6M5ztsajYV
	4M78Um94leofXom3gJp+JZD0wVwBsojaXQyODHw==
X-Google-Smtp-Source: AGHT+IEFGq1RRcXIagmX2nBK9C31e7Sglnc1k31By4l7faAODo93O6gnyZPFsYIDmKxmovbracfFaZpE2jFQTyt49iE=
X-Received: by 2002:a67:f61a:0:b0:46e:d8b5:a186 with SMTP id
 k26-20020a67f61a000000b0046ed8b5a186mr2554485vso.11.1707916948940; Wed, 14
 Feb 2024 05:22:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214084419.6194-1-brgl@bgdev.pl> <4c629a0b-95ff-4ad6-af04-61b25d437f89@sirena.org.uk>
In-Reply-To: <4c629a0b-95ff-4ad6-af04-61b25d437f89@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Feb 2024 14:22:17 +0100
Message-ID: <CAMRc=MejLVegawqZWiG5bhEA5pusvbW-OOrT-ij9h4GZDMgf2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: fix SRCU bugs
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa@the-dreams.de>, Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 2:17=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Feb 14, 2024 at 09:44:15AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Here are four fixes to some bugs in recent SRCU changes. The first one =
fixes
> > an actual race condition. The other three just make lockdep happy.
>
> This doesn't fix the issue I reported yesterday when applied on top of
> today's next:
>
>    https://lava.sirena.org.uk/scheduler/job/585469
>
> [    1.995518] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000078
>
> ...
>
> [    2.176162] Call trace:
> [    2.178610]  check_init_srcu_struct+0x1c/0xa0
> [    2.182974]  synchronize_srcu+0x1c/0x100
> [    2.186904]  gpiod_request_commit+0xec/0x1e0
> [    2.191183]  gpiochip_request_own_desc+0x58/0x124
> [    2.195894]  gpiod_hog+0x114/0x1b4
> [    2.199305]  of_gpiochip_add+0x208/0x370
> [    2.203232]  gpiochip_add_data_with_key+0x71c/0xf10
> [    2.208117]  devm_gpiochip_add_data_with_key+0x30/0x7c
> [    2.213261]  mxc_gpio_probe+0x208/0x4b0

No, the fix for this issue is in my tree as commit ba5c5effe02c
("gpio: initialize descriptor SRCU structure before adding OF-based
chips"). These are mostly fixes for lockdep warnings.

Bart

