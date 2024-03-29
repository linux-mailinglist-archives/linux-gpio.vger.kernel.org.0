Return-Path: <linux-gpio+bounces-4915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D480689277F
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Mar 2024 00:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124801C21288
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 23:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DE113E6D0;
	Fri, 29 Mar 2024 23:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pe9BIhi6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD63513E88C
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 23:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711753443; cv=none; b=Z0hvCLMHGi9/rkXhGH6dlaB6HapsF59wOL9JtPYhmEzEscYxiTC8wUw1oSvOdKdGQfs9+UvbSrf+2YJeBYGIsYni5FG67PeaoY5zswJEDuRQsVPuqoYbuzorh3ADUzoL5ARUwnuzdXrWpt3p74wZmop06YShLrupdDTBso/Yzuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711753443; c=relaxed/simple;
	bh=ElBPjDIZnQxhX8OMQsnhNQHvpAXQI/SVRBZi1UXufCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUR5y3wDeAXaLQVDT+S9wiUO6RpgJ2XICyG17As/hAbsbHbJHHFCYo4cJbLcZ3wkGX5THY30+frXj8BgE6Oz9meDG80BDpoCSvC8vHyeOUYrPod+0E3iAXVisJEjfhS9KRuxKa0oQyJcVkvpjB2mPy0jdXjv9Z64MxhOka9+Jdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pe9BIhi6; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-696925248deso13950776d6.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 16:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711753440; x=1712358240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElBPjDIZnQxhX8OMQsnhNQHvpAXQI/SVRBZi1UXufCM=;
        b=Pe9BIhi6wVmFE/tDN7PvIW+xx1fkS5qJ8BQ87PXx2ib9ZbsUwUL3IieQIbzopBnNSl
         nNa7uwuQP71R5DH07M+zMXKJ+oYtkwCm+zu/nojbXB3OMFkidtFdBKail2L+MZT+RzPx
         PHopoUVHHYELKSJfa9m2GY8jnZ0EZ4RXciTDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711753440; x=1712358240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElBPjDIZnQxhX8OMQsnhNQHvpAXQI/SVRBZi1UXufCM=;
        b=JkuewnHy+Ef9j2W6M+ZHMmcPUyM6p98GaXUqJYwpasrXxn1xWsqMe+Qn9MZ8emf8n9
         e5UILQsVySOIElnWYkgoo4+0LO42aNE09RPqidw1tUTHy9Wsk1Brd+Gwc9Xfv7ywO+NF
         59ea86ComaulXrKbKXCrqCfmRZHdcUczOrbI2j4aPRiDVnvQRefbT5UCqpbqUDFuBl1f
         lQPuOntMNw5xRX9lmSFNTz+LjOQaFWTeH++4HeExJIchM4mE7Vsv0TwLGq97DNn56nQm
         zfNLcc22mxfOU1qwG8fk4q2RStnNjBf5ALJdJ6yxp4b+P5xRw8rDFNulxZu28A/46H3F
         lxiw==
X-Forwarded-Encrypted: i=1; AJvYcCU11k53GBnbLE7y7vOS+0pV3GnJyp2/Y8jV4Bdf53t1HEUr2SUTcFAuaDr4N9ztxYPPpfU6AOoW6pWQ0l1TG5Jzj21BXvedGGnrCw==
X-Gm-Message-State: AOJu0Yy6Aw9AENpgkxWzHVZtGkWbd3dBXIatFgFKGjBwjO4SSekQ/qaw
	KoSDnZvoCQnHb9isrSUp/5Wcnm/aPdU6AP+38wlXlZmNs8BFCTJYcwGyXhF+wjz0D3iWavGFIFC
	yD3E6a2479ez8JNgAl74xAXhHZjLrhwRh5XZG35pjw8fAajg=
X-Google-Smtp-Source: AGHT+IF+mqQ03gYx7d0d7DYJJ7rVBmyQcQsToUoGLPiRc+Fc5LU2ayUB7rH83oD5qBV9wXHQ8tTdvtFZhUqkRt2CKmo=
X-Received: by 2002:a05:6214:1905:b0:690:d952:f17a with SMTP id
 er5-20020a056214190500b00690d952f17amr1755577qvb.31.1711753440726; Fri, 29
 Mar 2024 16:04:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240329075630.2069474-1-tzungbi@kernel.org> <20240329075630.2069474-6-tzungbi@kernel.org>
In-Reply-To: <20240329075630.2069474-6-tzungbi@kernel.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 29 Mar 2024 16:03:49 -0700
Message-ID: <CACeCKadpks=55-bfi2qOX0VdB5Fc0394OBEdKBoRBCsS6MNwAQ@mail.gmail.com>
Subject: Re: [PATCH 05/18] power: supply: cros_usbpd: provide ID table for
 avoiding fallback match
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, sre@kernel.org, 
	alexandre.belloni@bootlin.com, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 12:57=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Prashant Malani <pmalani@chromium.org>

