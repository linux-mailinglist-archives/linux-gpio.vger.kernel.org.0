Return-Path: <linux-gpio+bounces-28349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBBCC4D266
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 11:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE31D4F247C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 10:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79ECD34F461;
	Tue, 11 Nov 2025 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BsBzDYgd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A08C34EF15
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857699; cv=none; b=tw10owmQzsjwN7zPYQL/0PG9EaBq9CcHIkO2Rn8rwTgtJbfTWweqzl1bqDQQWdPufDHT5m/0WHs8qBYbBlGEJAnIlkKQbv4wKxdfd29JsRvjBz2y6N/ecBS37+eSiazz0LeGpYSrcUaBewXLhXT9Aiq5O5t+vAxuvrlsuQV2s1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857699; c=relaxed/simple;
	bh=0cCxQ4zVWtY3CYLsY1wEHVW86S85uWrXzNYWN3lThqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8W6rcCgCqbJv05OHy6+pzi4B4WhCsGeM3FJKCHtMU+Yd4NsIowSHo1bc/xgK8c5ZALkTwqw+3e22INtL9MCBPDIr+yStGAZEOvyxd3xgP3TbCx/AfZFZEui61BWYp8jIMz/oJweeI7wstHbz0JWpzQE8IgqyozsFxly5PNaJZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BsBzDYgd; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71d71bcac45so37212797b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 02:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857695; x=1763462495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cCxQ4zVWtY3CYLsY1wEHVW86S85uWrXzNYWN3lThqE=;
        b=BsBzDYgdLq5JYwIPqSNeLozEHIi9qdflkd/j+ui5ZkmusTeSLTraVh0m1pdGS7gOCV
         64pTgt6ji6t0/RlTTav+AJBDlWDXohuCpjSaYCqbZZMCQXwfYjDLgsAje2blEWsbDPza
         ZLkyEtyiLklNhaHYyqwFdzZrtH+Zp4Bbqerbkrwr7weYuMQmI1CQUNcfE9lrJSBzCuRy
         Sk6lKnxRtyVwNdW8vfFhBIVU71FHD+tbM4GY6sacppRZUjIG2NJuiwAkbcSiml8mD1ah
         eSJXv/ko8om9hSU1bk0k35hMHNajUUhmz8o8BDZozzGF1fXDgHO5xFoiTGcSjcqgd5Q4
         Lz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857695; x=1763462495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0cCxQ4zVWtY3CYLsY1wEHVW86S85uWrXzNYWN3lThqE=;
        b=s++6kbZpk8WTrMPWOkHtbGhMHw6ImHlrj/oorGKdQ8AhAJH2DhL2V0D95srXC7JfZR
         ip8wvD6GxsyJnywKxyqKY4gMEVDP1tJKmVKJwsgzql7VQM0aZuBJKXuDYBs36Lda9abg
         m35pkGWl9eDgylq6opAciTIW9ojVmaUNSBliWAr8Lj30qeSganjJiZTkoEjEviL10OPS
         DG9J8ShUjDNTBk8xNsm/bNy1rPet4Wehefb2oPSya0sYwcQFy6sI31qIKTfe7k3elDuZ
         3r3ftmYq8jBQSfwjSfNnm0JmNESeeZx2XcHVX8jnLEOzyux0crowRe6WjuAvqrqONb1s
         FCrw==
X-Forwarded-Encrypted: i=1; AJvYcCXxPdwCZksgYpHh6/3VhQchyqlwsZjbv4VdzJHavc1BrJFFsDsr794SO5jNDBjAl9Z6JlNsuDo7ztzw@vger.kernel.org
X-Gm-Message-State: AOJu0YxpHt3qcCmgaxxE9jYJSzCd6pf3Y5/mU8W2k7/QCLmDEaUdzM6a
	BEGS816duxca9Tr0SQntKywO9GcQhGHH9psMxEkEKz2m8y6UeGlcdCDtcjQ7uX5U60OGUdyfo4u
	dacVk4cLApoP1zgu5NDum3ZQ7r7QRaNytad4/5dW3Sg==
X-Gm-Gg: ASbGncsrhfsVETG4QCmwEA23LoviwsvLksYiOwSA9gk/5LScFNhd8Hp+shhzP2Dq5hv
	ejvEGqI0IVLcxY1E2C70z2+x3OicRXltMG5fdZ8ctNDc5G2mzypUnpiuZJBbyZj6QWL5hfbCE1c
	MjTjI+bCU4NYE4XKJqlG79MaZWIXZm/P0np2FkGS8V9jDFIbD7VMyBAlJAdqj9135HR0d0qAZ5T
	jpftVUDfK3l3AlZIs+s8+HK33WdEnwGwxEgR6QDng2AHrQYElFFlTW30Z/V
X-Google-Smtp-Source: AGHT+IHoTEqTIMeK7JCIYihCqYCVhAe4gzTa4C+3j+k47suT30AzzIQmG9wEWL0FkhepDKD6CvXqSafZZ1SR1+atEmQ=
X-Received: by 2002:a05:690c:8687:10b0:787:cab5:79a1 with SMTP id
 00721157ae682-787d543ce2dmr101353817b3.32.1762857694963; Tue, 11 Nov 2025
 02:41:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:41:17 +0100
X-Gm-Features: AWmQ_bn0WFQEeQmuj7iPjvAHMQKL1gkynLIxqjiJlR4NSYtZ2qnuSvoaANZDav4
Message-ID: <CACRpkdZwO8mXvjwS7xgVvHmcpF+_pgKYsj3c3QRUcYWPdCt5ng@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] gpiolib: implement low-level, shared GPIO support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This module scans the device tree (for now only OF nodes are supported
> but care is taken to make other fwnode implementations easy to
> integrate) and determines which GPIO lines are shared by multiple users.
> It stores that information in memory. When the GPIO chip exposing shared
> lines is registered, the shared GPIO descriptors it exposes are marked
> as shared and virtual "proxy" devices that mediate access to the shared
> lines are created. When a consumer of a shared GPIO looks it up, its
> fwnode lookup is redirected to a just-in-time machine lookup that points
> to this proxy device.
>
> This code can be compiled out on platforms which don't use shared GPIOs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The concept is sound and we have to begin somewhere, optimizations
for code reuse and cleanups can be done in-tree.

So:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

