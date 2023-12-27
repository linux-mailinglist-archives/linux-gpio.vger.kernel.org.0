Return-Path: <linux-gpio+bounces-1871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A0781EF9F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Dec 2023 15:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C47E28376F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Dec 2023 14:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEA445954;
	Wed, 27 Dec 2023 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cg2mbWk2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A441545947
	for <linux-gpio@vger.kernel.org>; Wed, 27 Dec 2023 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4b72e63821eso1555017e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Dec 2023 06:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703689163; x=1704293963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwySJh/J4PGlkxiWlBxpZNUY6nu3Z/pDgnojJZIqxMM=;
        b=cg2mbWk240AAdxIpvAE9wQLiSlh5+1uyU1TmSGbkb5t9LLbBBn+uOUOhdMGYUGLqfs
         9gwJ4BvWhHkI4mPnFO3E8as7/SbSPYfli6Osz4a0kqMBJYz8AQFX6dGy36ARrgz0bk+8
         90rtfDxd7j9DQZn76biI2jAAzqY4kokmm8oz3p6isc89eoI4xJGz/igR+9E+BdNlkVKY
         WMkMepJW3CaQSJxOC13/y2fSAgKXzOdXhZUPYRbfAImHMiAAfEXjbxbRtw2cBNGIoTr/
         ThQggN7LoUh0AGX/rtHmezGJNciqhB6ADMENAwvhWFNBUS8TYHWXNccB7hj0FAfYUEbv
         5dXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703689163; x=1704293963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwySJh/J4PGlkxiWlBxpZNUY6nu3Z/pDgnojJZIqxMM=;
        b=PBR4/Jf8Klt2SiOesSYubRVm/JP/6HWJ+a5/+gq9nS81eZ6mLbBa/ldeRqaZsCFPhU
         iaKOOPNVSIo/Z/8ehb3SyoXVFF8YjHy0NkMLFt71w3Lf9KRExkU1xaF8foKjk39q/ofP
         3ZWYW1WukY9/9KmtzaMLVLFVeQ7gCxuBBHAu0GacRtqwjakPon2kBaIJlvN+dVJ32ZCQ
         QvkZPmxUJB9x9tRS2Tm/AkwkjPjRWiAl5Yw8pD9YxkpN0RqWiLztzuxlWpBmR4rWFb6L
         ZwAx2xg+qqF0XA9ys2Iy39wTzUEoH6EfaVu3zEd244CzhJuXi0FUMzSp6CfHoX263d/p
         0GWQ==
X-Gm-Message-State: AOJu0YyKZzCwxcO9RfogoqqTSrWmy2WnctvfzXwO3GTe2dpfqYo4MliR
	jqrtrHcgFfoal6gN1/2POfHdn6DzsA9cAQx3by2QyZK7JxOnTSMffIvBiOG3
X-Google-Smtp-Source: AGHT+IEWvgutdHrCNZKp261VtrNGk+PsDQZ2EnbxomLnNrlQYwldRvQHCWXLaSB/r7H8U14ilgmpGiXnpaCA35V3/VU=
X-Received: by 2002:a05:6122:3222:b0:4b7:1f17:55f0 with SMTP id
 ci34-20020a056122322200b004b71f1755f0mr4866948vkb.17.1703689163542; Wed, 27
 Dec 2023 06:59:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219201102.41639-1-brgl@bgdev.pl>
In-Reply-To: <20231219201102.41639-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Dec 2023 15:59:12 +0100
Message-ID: <CAMRc=MeS_eoYmvAcTknBZ-e3op4d+rjC4hBcTPhTPw2JpcyLKw@mail.gmail.com>
Subject: Re: [RFC PATCH] gpiolib: remove extra_checks
To: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 9:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> extra_checks is only used in a few places. It also depends on
> a non-standard DEBUG define one needs to add to the source file. The
> overhead of removing it should be minimal (we already use pure
> might_sleep() in the code anyway) so drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Patch applied.

Bart

