Return-Path: <linux-gpio+bounces-17038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 459C4A4DDB1
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 13:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7FA33A60EC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 12:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453A4201116;
	Tue,  4 Mar 2025 12:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mUmEGZLJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF51FFC69
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741090795; cv=none; b=VR0FGw+aLsHM602F4PD41CItUaNnGoSAvzHcD5qSQASjn39cBh6iT2VJVYn6Ki+5OsgU4brYC/uF5pSQGXr84B08y9+lcgiyXt6SHMZqILQCNZz/pCVfJdjUQ4GNGAKZu6TM2hG9l2dyVxLUj8EJrhl0ZdAmm/wpfQ3BUuZvodE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741090795; c=relaxed/simple;
	bh=Fv8Rek+UuYwdZW3i4FBy7zfZCimtjlxs25N6M1Blkhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rv5hNDOuxRiw5Ms9+xiphZUblGw25wzQfpCUcK6egCUnMnN34mUzHpkv7+EuFm7CUVoSqfxEFs9CiDVhUiR6CylMoLBOllmDn5yAt/YzgK7OhGfgJ+vSZIaadqHivyqefSaWWCfM8yjXLvIp65tJMJ6RPCF0BaflO3slDNDbrIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mUmEGZLJ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54963160818so3042674e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 04:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741090790; x=1741695590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXh2mt1+51Iizx4GGl3f/xWLu8nQ3RKpG09yGRKQ5og=;
        b=mUmEGZLJJhgAoyUaUTu+97JmzbJB5BOABws0xMfW0XcraI9pp/9YWNztuSq0HLg80h
         9sRZLwBK9zcZT8D32J6eUc2VwmmQq3k8XhCxvfnVN3MFUhtXcX+xSYCZQ0l3ZKeho94M
         GCbGndxNrZgUI0wDzmVTm1YeWptfi6ECXXzo7ltOFYemF8SIPOAvGXyj7C4hzCTV4FB4
         Hl0eWai07sUAn1wHhx4jtboHyuFMl/Yk++CNoTsqbyja4WJEGiqkTZPFaw42I6ciKphG
         qa6oegD+SGa4J8vdaLomwNLRrYEUKm13xn7pgOt5SpjtRmHqqOeEX3HUz4SR40g5aqM2
         xvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090790; x=1741695590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXh2mt1+51Iizx4GGl3f/xWLu8nQ3RKpG09yGRKQ5og=;
        b=rvKyZJK9QXBVFJqIJzBkLppjU1LVLU4eoDSp0Px44sW41XcCOJcSNN6N37uZO9Bvw7
         NEfqjrP3OTmQ3593vMXOTy+Hi/DV0qaCaHVcrqtQ2eYgGi2dO1QHwithRp4xyAW/PjsO
         FpUvasZgasXuiRuoKMVWYfGsd08WwJhEzyAymeYpRg0xmDpSe+GHgneLd0DLKANZVuqV
         OyilvODC7e8axpvLpL+hvRAPXfMi/U1h8mLq8ZL1lRF5eZNO+YTKpScGrLJVowFjPxCR
         19IwsdnnXkeIwKcTL5FalMO7xNsb6tEjiJtMr4wkKtEFwzdxFNL+HTl56nqcDJLpQ1iu
         dy4w==
X-Gm-Message-State: AOJu0YxUL2zutRuSLhtjAJk4HOLkoQNtzgla5hj2rx28uCjt0XCw5IIe
	5UygAIGdzlP3CzRx2e7ZajOOCT5mrclrp0zywSunS5l8l/kKIW1EBGMpvegXqHeyzH2nmx8wDGu
	nAJh2QICSEO88go+dZcNr3qg0Ju1f+g/LUT15Fw==
X-Gm-Gg: ASbGncujU0/YtgIKFcfhONXjipVNkQOtbUQFKZ4jcneAOVKK+pU0506O4n/78HJwnhp
	8H+U+2ISBsXCDJf/mJdRSO8I6zcB9I/ywLs3jPZNwMM7GzGqivA/3rui1NvUsZ8pKrEV6UiYquV
	pKTB1BOoefPembf8qaI9BVDJb9321eXjl6drPZ5rfq/Dhnlz9f0CVfTgth8A==
X-Google-Smtp-Source: AGHT+IFq5tNiX4+sA+k/8DP0bPkZKFyB11zRAnNiXhvg2rUMrwwThmtzti3WlWnN1V9dZXtX4zQMI/vvg5ipxVlym0o=
X-Received: by 2002:ac2:4641:0:b0:549:54f7:e54 with SMTP id
 2adb3069b0e04-54954f70ecfmr5262461e87.50.1741090790542; Tue, 04 Mar 2025
 04:19:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-gpio-mmio-more-v1-0-0ea4ad43d304@linaro.org>
In-Reply-To: <20250227-gpio-mmio-more-v1-0-0ea4ad43d304@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 13:19:38 +0100
X-Gm-Features: AQ5f1JrhSLtlnnm9zfVGdIlnEVlNkYr8OEjXYNYNov5Jio8OX4tvgAIKCXGt2KE
Message-ID: <CAMRc=Me9Gioqd3uvF6j2gXvjjXWv-deCt=YR4d14jk5Q9U=hdQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: Use generic MMIO GPIO some more
To: Linus Walleij <linus.walleij@linaro.org>, Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 10:18=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> I found that the Altera driver is easy to convert to
> use GPIO MMIO.
>
> Only compile tested, I do not have this device.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus Walleij (3):
>       gpio: devres: Use devres parent if undefined
>       gpio: altera: User gc helper variable
>       gpio: altera: Use generic MMIO GPIO
>
>  drivers/gpio/Kconfig          |   1 +
>  drivers/gpio/gpio-altera.c    | 109 ++++++++++--------------------------=
------
>  drivers/gpio/gpiolib-devres.c |   7 +++
>  3 files changed, 34 insertions(+), 83 deletions(-)
> ---
> base-commit: 4d478accec99c9b23bd5deccb58996867bd0aa7a
> change-id: 20250227-gpio-mmio-more-990eb0d68d5b
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>

Mun: this is quite a big change - would you be able to test this
series and leave your tag here?

Bartosz

