Return-Path: <linux-gpio+bounces-25162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B590B3ABD1
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 22:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25ED17BC27D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 20:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EEF2980A8;
	Thu, 28 Aug 2025 20:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NcLlezA0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5802A256C88
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 20:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756413602; cv=none; b=jCkbOocLnfZAZrZr+1ve9OMeyATtf02dSc1auJ4UzVn5VF0Dok35DsNvy0CFAbV7RsEvyFKwa69aHEN2XVfkyg8aDYBqCO3h+wCrLOuwU/+h8L4egdq92GSCUYmpddgEVWeV8H3re0Q8+e9Xhd0wSQ3/L4BVQ6QCY0MyWtkrDiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756413602; c=relaxed/simple;
	bh=uMbygbPZ6lp27UzGsQQZR6ABSzimBNrHU3kdVj894r0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlcK/JWuLWJjFVAckNVL50Di26LDvDfrqeAU+KXjFaNuOJhAZEr5MHzOoCruTVpKt5jPTGb1Wr11wxIdKl34gmWXs0m5ZMZnVDvjfRXXaONUfYouxDSu0XKHv86Vr9HEi4LOHsoUSo2Ns8EJ1bZNPvzz4Eem3H0SHZYwoxlb9Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NcLlezA0; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-336b071e7e5so5823741fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 13:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756413598; x=1757018398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMbygbPZ6lp27UzGsQQZR6ABSzimBNrHU3kdVj894r0=;
        b=NcLlezA0C/RKlvpmTFfuTKj2oVT7oabLqVO1bvl4XzZepWbF5LipnuAimHWJzYbRCp
         Dy3J229Ii90/ShZ4rJe0VrJYKhdaZoHER+zW+ZDl5vxb+n+WA1uJddXYf1ho3w2Pjp52
         Qal3wsSsT/AmvxWC/yMCiC0+INM9MO8g8LREg/xsz+YWpWNN4KdbgYW08vb58tWOuJYt
         fWGJFvT1x4lCliEO/N1/60SkNufd2sLZc+m6swz0acRkDdC1T3q6RCKXGBOGEU2eewfM
         bYOYGeQ5xjyc8UyWqkPSuNYCyJvM7b5/wzDaidsg957X71LM5UVkscvcdh4w0HTH4qA9
         qn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756413598; x=1757018398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMbygbPZ6lp27UzGsQQZR6ABSzimBNrHU3kdVj894r0=;
        b=IhxdWjTVvbwK1S6iWahHKzXkqVyP/SkQPHhQz/bu8ElHdcARGA6lg/FRNDv7w3VsQH
         v31V83zrYfPDGe/YK3550QdHn/dRF2uwnyj3X3QdzeFLaPhx3dpKIXcCAtR75GhyM9JH
         ktxd3w+oZ1ctJX0j8Z1slq8bqYgUvV/s2Qvoe3yyGFFzh6Fy/RdZhKJ2oBd6hqWFrZOz
         JoKQ5XnqiOxh7ka7YMEqxQhAGgQcPFVFlrVjtarxsAcckiwTGrNnt5zW+Ck8ZxfpwCoT
         zBiIcqMc2Mo5T/11d7rZ3PdTqIISEBsqNyqhpXGOB9WfoUbcoDImLfUte/tMh7HGguDh
         0N7A==
X-Forwarded-Encrypted: i=1; AJvYcCUTK1FhPuHyVIL9zy58680Toc37atmJqS470TCvlO/EAL/e37xvnQUSepk+t83d9Zz0FMyDjet6Bokm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl1m/mAckN5tp2aj4ZDXxMu70/V9LkaubGIn+Gn8rho9eHHXde
	m5ZQMZ2c1s/wEbZkq23sSZwB9m5EkjXdG/CzTvKZJjY0lE7ryAEN6gXKXoaL28jPzh7ATxihKw1
	zxZLeAmDFI04fygxVoafPnn0Q45FOVEP/YDdLNVbHEQ==
X-Gm-Gg: ASbGncteMc5PtMGoHjo1joCOq0K3yi7c99kK3tUu6aku6uleQmzm3rlLu6SMeP+MtF0
	jkdssk1nzgE1HM90a+eNZZhvN8O1ae2P4XLeX3UAkOKWiwjV/U2gtuosDqaQpxqK/WbeFSdp8YJ
	+Zu05WHf/sNDC4csQaQfZ+2wUnqY7+fWkPLp+HBOaawJQROy83aBdPxOcH6wD9g33T7JdWQN8eb
	eWXBkbo5YjALi+LdA==
X-Google-Smtp-Source: AGHT+IFyEWOuQG1fDf1ksdaTJASZAGtsBlaDN9tGze2bxNvZnscAfatszOqEDWcWQi8cu6lP0CXjxEkjw09XegfiPKU=
X-Received: by 2002:a2e:bea0:0:b0:336:af88:ce61 with SMTP id
 38308e7fff4ca-336af88d0efmr5543851fa.40.1756413598261; Thu, 28 Aug 2025
 13:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:39:44 +0200
X-Gm-Features: Ac12FXzQsryYs9cHpNdLp9yIX0je4QdVRt-NW8EFXmMKnqh-BUifcsfX0FEg61k
Message-ID: <CACRpkdYBZTLpEGS+7m_B8MrFtUvh+0yaS0bsen4jkUcf0C8gjw@mail.gmail.com>
Subject: Re: [PATCH 0/6] gpio: remove references to gpio_chip::base from
 debugfs callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-pwm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> We've stopped displaying the global GPIO numbers from core GPIOLIB
> debugfs callbacks. Start dropping it from drivers too.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series looks good!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

