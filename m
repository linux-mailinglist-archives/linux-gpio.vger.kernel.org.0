Return-Path: <linux-gpio+bounces-28896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72EC73F72
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 13:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 107264E76D3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 12:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF343346B4;
	Thu, 20 Nov 2025 12:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PHji6EP2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A68932C33A
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 12:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763641692; cv=none; b=sVshaqCrcVnWpx5j4A351sQSSm90nKkx8RGo4+LsGAYHWlXXj95PA5/d7Jtk+zwo9p1QlYDUX71qJb27cNJpcxebwycc+rJDmV39rCva4qCMa1+U99+X/ikacldOJT6Q1DPZVYlnWnNXv3OTjbWvnCiOM0eMNq4b74M2X5hDM4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763641692; c=relaxed/simple;
	bh=P9H2efPbk/0jv8cNM4Qf1i7HtYICf5C2snOcL0Djqe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCzHXS2+z4oHge0Vk2yWkCNXpqgaHiv+Epn38b6LiOYyWb51/q2XqtLDMYN8I0fnXe7ibUTnDMObJ9iz07v1omfdXRbKPigX6v8VGJaKhiv3EZDURkKYb9JizB5S17sqcG+kFHaOKuzul40hWDhh2paY6DseTfHyUl7nLZe92Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PHji6EP2; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5958931c9c7so867374e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 04:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763641688; x=1764246488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bL2FhXRLpT1HcsZuSiUDRIw4ZCNtNP1rJvajASfpfw=;
        b=PHji6EP2eSKiSJrDzL1V6ikL+YK5mDLAjrdl6LdKN0yflJj+sgHOo4G74/dQAcQhZS
         4htzhqv86DTBJu0jTCSAexGNOVQ4UYcZtNde4TAUGvHY9TUCXApd4TNKwgRTa7HhXD4s
         04c3ewxGaVUgEr3vU/8xe1qyUK0ApkpFcCamxWqfu/OXBvnH3ASn8c7DTk+bEFmRfDjD
         OdKuI4kKqbQFdJKfpWk2IyIv6JijiWuu+wXpkehsGjTDFNiFweEVqjzRBJc7nDDdYJWQ
         uEmXyU1BK82UZ38Q4czGOeiRww4YvssB4/3wKqlZ1WkhJV7isPuz7+0IWWv1WCLTX2Re
         hmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763641688; x=1764246488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5bL2FhXRLpT1HcsZuSiUDRIw4ZCNtNP1rJvajASfpfw=;
        b=mhvOfug7xt8RAaROVIHIgYLYehfvfJex3ebAiOd50DOexYmz6u8sngEit29CPoGtL2
         hhIYmig2Uep081+MozQusainLiXCHlfldyA+ZIv/8RcZA3+kTAZ24KIdOcEDNCKlvJMy
         Xh5WNQhBeGKHEKwxpw/+YBF/yu+rlN3sF+Pymm/Yn5FwZkJb3P4TFMVcNk/LDrtYbaD8
         KnZpVOlpKDlAbLY258pLRzazo1LEjGU56F3nJzfOvK7nHyF1zn9umsxsZu9w3nH00cKc
         owoLuVTKSpG6ddXEANpddXXVo5nsnc/2KYu+kP5rn9zBQMjJlAd9y9x+gJ3kvLndsm9j
         XRhA==
X-Forwarded-Encrypted: i=1; AJvYcCWLZuDmWV4m5W/zg+FvdmOi1XgLR08kCcsLvetj5K3/RPbTH0MyNCTMC8Tqlf3WCeDJTukhqLxlTUsv@vger.kernel.org
X-Gm-Message-State: AOJu0YzLScf/LExCCmIifKF3gmJt/AfXWZ1gwulA3C032RxBXyXIf+tU
	ksOfqZ3IyagFmW9TFUbhURWh9vFNFXLG7Hrmr6eWoVZpu4qvA7ZK77xcJpJ/b8P0tN+2AggjrsH
	4UkPafI2hwHDivopJXW3z2hglwW36gnXjnrD7YLslXs64ZdCcjw09CZzsdRKO
X-Gm-Gg: ASbGncu8uiAtTkLqmFmPBINSURlApmJSfXpnaEYNSIAmtKvVbe8k9fmHMx95u4qM/qi
	6ChpSZV+qfPd7drvc+Vw2YdTMpJAW3hHgwqYlF2Vj6OAvSpiJopkAeq8R3pQAjlRW9wvoUGGdu4
	8fwU6S6ycjs6sxoH4QXV0wld5O0s9fXpetL51vh1G16intb0oT2BxCL12wLzQHYQssVoNe/roS+
	N+86pQtEcKz70vBO249gxHA0k8R1oOlCig6khdfPfZCBRg1maB3S/ehOZQ8ENwwl01t1L9Gz75O
	huEcNeyS8e1uUC7Eg8soIOcTkQ==
X-Google-Smtp-Source: AGHT+IHFiFeZ/wg9cdVAeRgWCSZ2ZNOQSff6PDeSQvaK6oPJEJIrZO4Vdj8XkbntIz0Y4rPDws3qGLiEr0Yvxl+9NZY=
X-Received: by 2002:a05:6512:a8c:b0:592:f40a:25f3 with SMTP id
 2adb3069b0e04-5969e2f430amr1099865e87.27.1763641687051; Thu, 20 Nov 2025
 04:28:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120105907.1373797-1-ckeepax@opensource.cirrus.com> <3beb841e99f62767547054c4344f2c60eae4ed9b.camel@pengutronix.de>
In-Reply-To: <3beb841e99f62767547054c4344f2c60eae4ed9b.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Nov 2025 13:27:55 +0100
X-Gm-Features: AWmQ_bllvrDTigtL4OXlTYgl2RQDEQpq52mz6b94Dl7uiW46iGJLK_UCbVTevPg
Message-ID: <CAMRc=MdJp8T2gZ=ExWCOKSaVqZqo4Dc2qAX0hXkx98ShUx3mjw@mail.gmail.com>
Subject: Re: [PATCH v2] spi: cs42l43: Use actual ACPI firmware node for chip selects
To: Philipp Zabel <p.zabel@pengutronix.de>, broonie@kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, linus.walleij@linaro.org, 
	andy@kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	bartosz.golaszewski@linaro.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 12:21=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix=
.de> wrote:
>
> On Do, 2025-11-20 at 10:59 +0000, Charles Keepax wrote:
> > On some systems the cs42l43 has amplifiers attached to its SPI
> > controller that are not properly defined in ACPI. Currently
> > software nodes are added to support this case, however, the chip
> > selects for these devices are specified using a hack. A software
> > node is added with the same name as the pinctrl driver, as the
> > look up was name based, this allowed the GPIO look up to return
> > the pinctrl driver even though the swnode was not owned by it.
> > This was necessary as the swnodes did not support directly
> > linking to real firmware nodes.
> >
> > Since commit e5d527be7e69 ("gpio: swnode: don't use the swnode's
> > name as the key for GPIO lookup") changed the lookup to be
> > fwnode based this hack will no longer find the pinctrl driver,
> > resulting in the driver not probing. There is no pinctrl driver
> > attached to the swnode itself. But other patches did add support
> > for linking a swnode to a real fwnode node [1]. As such the hack
> > is no longer needed, so switch over to just passing the real
> > fwnode for the pinctrl property to avoid any issues.
> >
> > Link: https://lore.kernel.org/linux-gpio/20251106-reset-gpios-swnodes-v=
6-0-69aa852de9e4@linaro.org/ [1]
> > Fixes: 439fbc97502a ("spi: cs42l43: Add bridged cs35l56 amplifiers")
> > Fixes: e5d527be7e69 ("gpio: swnode: don't use the swnode's name as the =
key for GPIO lookup")
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >
> > IMPORTANT NOTE: This depends both functionally and build wise on the
> > linked series from Bart, it probably makes sense for him to pull the
> > patch into his series.
>
> When included in the reset-gpios-swnodes series, will this need either
> a noautosel or prerequisite marker to avoid it being picked up into
> stable without the reset of the series?
>

Good point. Also: the  Fixes: e5d527be7e69 ("gpio: swnode: don't use
the swnode's name as the key for GPIO lookup") tag needs to be removed
as this will go before this patch.

In any case, looks good to me now:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Mark: can you Ack it and Philipp will include it in the immutable
branch with the swnode series[1] I will resend?

Bart

[1] https://lore.kernel.org/all/20251106-reset-gpios-swnodes-v6-0-69aa852de=
9e4@linaro.org/

