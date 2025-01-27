Return-Path: <linux-gpio+bounces-15064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCEBA1D3FD
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 11:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A1051887012
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 10:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CA11FF1B7;
	Mon, 27 Jan 2025 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j/tCbRpb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2D11FECCA
	for <linux-gpio@vger.kernel.org>; Mon, 27 Jan 2025 09:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737971975; cv=none; b=IVQJAQDHi/dkkj+3/I4hmnMTiqMnRY/a/lvNyduNecb+qFmLYltVZFUoPg402pzwjXuPeGazd84KDUvWp8GmdGKC7ytzMzkKJl4BwfeKzR5TKYmfoITxzbnfF69WpIDOycJUTHIOGdq64xKkyfX9egWGFvqvoNrNZmmQfpoVxrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737971975; c=relaxed/simple;
	bh=PDGrwIQK0S12LPOVvghHC4bvwNPOk/8FesbYnKkyLFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TtNXz7cmwQNHMHtMMYfKfedsuIEJByRkgKbhEZEpjI/kkDwmBBvWr5ZwPXaxIywjbDzXtm9TN0X6LlDD5XdWuNUKfuR6t0ezDscoqN5seiEJWQIY1ygH74azKLCgJYZrbwPiFSo8qpoM6OCDmxqSUbtI/adAEPWBRQ38D6t/ViE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j/tCbRpb; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so42353581fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jan 2025 01:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737971970; x=1738576770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqS8yiFvPoQH42365EOQ4XQDK7lHJ8Wg2V08GdiylrY=;
        b=j/tCbRpbOWjj3W6eCQ07jg1/Y6DahG3Vo2w3+zAzPI0LVs1i//cporX1LdU/hMqQ/c
         7aANN0pfMXNvpfbkgZkptiOp2s4BtttZAyD6Ir5b9de64DdbrSesPExv0IlFuYWVSyzc
         fuICJP2QNW4GGVxpv77tcBkpugjXpNCiMbpFKguw+jApZwnEUgiar1HB04i4xxcQDwjs
         H+KFJ+rLVVOXfGajG73HlteeUO549uHcgC8tE2qnMiZYI5KPYNfClD73kSu5zMrf+fsv
         HYShxoTgu6klPtYt9+TT0S4gA0ZmQg2iXW8A/6+qhXb4DBpaH/ZnZBPhjwkC19+Xjf4z
         e50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971970; x=1738576770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqS8yiFvPoQH42365EOQ4XQDK7lHJ8Wg2V08GdiylrY=;
        b=oR2klOYHpYoQw2ZGSZ0LMhs3VWBAnYSExV67znfIg4Py1TjuOX3NzrQMviqAY6qehj
         jgi38iD3+9MExmDSgDkUVGO/ZBKcVnX+HkRecBDfQtjQCJUSwXJ4Fx5TAW6MuB6MEGpO
         bDBMEC6ZhvhHyaCYwrzBYN4J/LbhIYkK68DLgAFFeQRF5m1lYmy67yg8hISu2orPGv/2
         SRe5bJFnxrJvcv2Yrt5Rw7WLT/52pKpbubJqw1urMoMwaBl6gMF1NO5N9b/yGCQELEvD
         rMXyFuP76BO3j8R/wdnltaJmRPQEWUWLS7fFQO8kzw3aex78E/y8VQJlyZmjZ9F6grvy
         E25g==
X-Forwarded-Encrypted: i=1; AJvYcCUdSNu0XpYZdy4/2Nvrb9GFOuyufavvOGDNiNgf8XyOLVL39f29J9jCIHY5Xe4ocahG/wD5Azl14hU2@vger.kernel.org
X-Gm-Message-State: AOJu0YxXUl890HlzoURsHqLrWVJ+3c8fF5DLTaC4M0qBqVrXM5WjXFNt
	7FGMONLxV+NUAqmrVtipJfjGlASbiH6aIqkcmMS7UQNiral1dbwauzkRYDCMsvx+bGkdKwWB1lu
	lKhTBNIpLkb6HHIQoEY5GduqVoSdkmOF/SYnm+Q==
X-Gm-Gg: ASbGncsubYK8uZZ0QYjY8L26qDboHyzC+kOirENl5FCRWvIQE1YFEuRQSj/M4zJbuS9
	rNsiV/2i4VWMS3CaJunk0yg9uN2WXq/EG5B80JjZ0bi+nZGqfUyBMPc+0RHL8
X-Google-Smtp-Source: AGHT+IHqpm1ys9+lwbd/QxujcbzJL4i0yKhhKzjeujkw2d5Z1I5Id1mRs2qKI/MXH9CQY+F8hE4OzkVsIK/ZHQmuZJE=
X-Received: by 2002:a05:6512:1312:b0:542:234b:9a6a with SMTP id
 2adb3069b0e04-5439c281f9amr15646461e87.33.1737971970154; Mon, 27 Jan 2025
 01:59:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com> <20250122-amlogic-pinctrl-v4-3-4677b2e18ff1@amlogic.com>
In-Reply-To: <20250122-amlogic-pinctrl-v4-3-4677b2e18ff1@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Jan 2025 10:59:19 +0100
X-Gm-Features: AWEUYZlw3ilYGs0ATdzTHL2yQh4eIVQWc6_6OrIXQyU_MtlIHFv72pFxPtpk8xc
Message-ID: <CACRpkdZRbpd0Kw9V=aYX5P0vJLtErNR+aBzPagSwf=AZh6QERA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] pinctrl: Add driver support for Amlogic SoCs
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xianwei,

thanks for your patch!

On Wed, Jan 22, 2025 at 4:26=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add a new pinctrl driver for Amlogic SoCs. All future Amlogic
> SoCs pinctrl drives use this, such A4, A5, S6, S7 etc. To support
> new Amlogic SoCs, only need to add the corresponding dts file.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/pinctrl/Kconfig           |   18 +
>  drivers/pinctrl/Makefile          |    1 +
>  drivers/pinctrl/pinctrl-amlogic.c | 1053 +++++++++++++++++++++++++++++++=
++++++

Please move this file into drivers/pinctrl/meson as I requested
earlier. We can rename "meson" to "amlogic" later if that placement
is confusing.

> +config PINCTRL_AMLOGIC

There is already PINCTRL_AMLOGIC_C3 and PINCTRL_AMLOGIC_T7
as will be very apparent when you move this driver.

What is a *proper* name for this family of SoCs?

> +MODULE_LICENSE("Dual BSD/GPL");

On the top of the file you have:
> +// SPDX-License-Identifier: GPL-2.0-only

So this does not add up. Fix one or the other.

Yours,
Linus Walleij

