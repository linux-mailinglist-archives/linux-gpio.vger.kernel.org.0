Return-Path: <linux-gpio+bounces-8699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBB94DE47
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2024 21:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167E11F21BAD
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2024 19:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8272C13B2B4;
	Sat, 10 Aug 2024 19:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1QLcL/nX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0704644E
	for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2024 19:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723318543; cv=none; b=MPRG4NQkjixtloIzEoCMv3wJ3KoTdCle7Xl86l+b9B0MYqM6pykQLqwuYYFSu/o6fNeRKVNPnuBjzxsnh4PiFEOIyP1jPQs/wem5tAnBrLiAVxHkZXmYUpWxpE0rOYAQxBTlOpKqtDhAuC/39I7YK870BJcUl8rzQC/o7kXcM5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723318543; c=relaxed/simple;
	bh=P99EvfG2Gti3Tqt8aUGOub2Cne21c5913ro7sv4VNEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bVmG+d17MTBJTM3G5nxFuUvSNUxspW7NO3zCSRR4e4q3vszoF6Wfelaft29RHR6LgsFqDxmm5N8kIdSTR9J1ZNCYhF9w6uK6lA5a8k+uaYQn1y1/7ai2oUU6M8DlFsL8SINbv5zOQeTQw9bkF7ZYJDRiPDTuNZtvWxw1xUm58aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1QLcL/nX; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef32fea28dso33764261fa.2
        for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2024 12:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723318539; x=1723923339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcM9KP51+NQ54xXwe+NqL/uqeCefCQoq9jCSvoxmi+c=;
        b=1QLcL/nXWR04jXgTDNHha2PvCcloeuZjnhUQRLh8IX7La2JFj0pcpJoKTSy7/yUIha
         7PXj1+DHjlpwZj/bfJ/h8xkdZBl6ae4cvV5R8T1ceMMlWoLx9bfImLxlI9vetHHMfJTX
         +yvG+4wfAq69F3UVXs4gDffen+E0aWOx3c4zqo0FUPKA0fXuyy0nClAHuFvBT+L8JZui
         fbuw3maOV+nvo6m7ggPekMck5jubEMJV4gS84um9/MSXuu1AB/8slNYkFcUsfhoy2IA5
         2+wS7QNeVnYc2ARuVvbL5m6LsZSVE3HheVO2fM9C04BHfJrXGPlNn2C0skObIPTAXHIC
         idUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723318539; x=1723923339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcM9KP51+NQ54xXwe+NqL/uqeCefCQoq9jCSvoxmi+c=;
        b=IR86INrCTtB/T9wQdiYwmULbgwsaP+cZUt3EnEWsdUx7kGp+5OvNold+Obg2dm6UUI
         esa4rFY6y72XkcVzJ9DfPAJaXWqCEP22uqDD1EMenHSBoS5oMjLc33FaRpnz8qap9mnx
         yj3lg7FrXnfYCJIvk8FNcKHEv56aMVRgc5PyoaMTYt7wZUU3R4qa0GK77t3uyqkcOYso
         yJAc1dWJJL3gj++1z8GMnKOTcamNFy4zFLEGbouBNUhAnoXasDq/ECVgdjhk91bGQ0am
         9+NL+6f356rIqfHdqKrADNZ/T4MNjLuRCA8HRWC9A88d2UghyHNGAYsUdBm8nw6sIeO8
         D23Q==
X-Forwarded-Encrypted: i=1; AJvYcCV48/p6zIKw2mmcKuIPyYIHUAZOi/RA5Dy2nSx2TGs9hAA1EOqmORusxSvZOZxiTvrc7N1XMjkAzK6ZVoNNTzkMjfEZBjSdF1+XgQ==
X-Gm-Message-State: AOJu0YxOZxeBzo/hIoUi3DtNxcCeU6Crg/fpVCXmx46dARl/hRn9Ir+n
	2G4N2ZfdF+WEuqSHDvGq6NlW0ap0/48ejG8lmletbRhd7pZhRZ4Xo2sBk/mPWUM=
X-Google-Smtp-Source: AGHT+IEk4zhHRhRdo8ZrC2H78wGM6S4SdN66QMnGas/4XcMnx3vAxC1AGmQMGW2luZeVWV6xQtM1DQ==
X-Received: by 2002:a2e:b8c1:0:b0:2f0:3cff:30ce with SMTP id 38308e7fff4ca-2f1a6c3892dmr38268151fa.0.1723318538639;
        Sat, 10 Aug 2024 12:35:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2a08:ed5c:1f55:659c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c72d60bsm128355765e9.1.2024.08.10.12.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 12:35:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: andy.shevchenko@gmail.com,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Asmaa Mnebhi <asmaa@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	David Thompson <davthompson@nvidia.com>
Subject: Re: [PATCH v2 1/1] gpio: mlxbf3: Support shutdown() function
Date: Sat, 10 Aug 2024 21:35:37 +0200
Message-ID: <172331853306.5379.13441317995081534992.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611171509.22151-1-asmaa@nvidia.com>
References: <20240611171509.22151-1-asmaa@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 11 Jun 2024 13:15:09 -0400, Asmaa Mnebhi wrote:
> During Linux graceful reboot, the GPIO interrupts are not disabled.
> Since the drivers are not removed during graceful reboot,
> the logic to call mlxbf3_gpio_irq_disable() is not triggered.
> Interrupts that remain enabled can cause issues on subsequent boots.
> 
> For example, the mlxbf-gige driver contains PHY logic to bring up the link.
> If the gpio-mlxbf3 driver loads first, the mlxbf-gige driver
> will use a GPIO interrupt to bring up the link.
> Otherwise, it will use polling.
> The next time Linux boots and loads the drivers in this order, we encounter the issue:
> - mlxbf-gige loads first and uses polling while the GPIO10
>   interrupt is still enabled from the previous boot. So if
>   the interrupt triggers, there is nothing to clear it.
> - gpio-mlxbf3 loads.
> - i2c-mlxbf loads. The interrupt doesn't trigger for I2C
>   because it is shared with the GPIO interrupt line which
>   was not cleared.
> 
> [...]

Applied, thanks!

[1/1] gpio: mlxbf3: Support shutdown() function
      commit: aad41832326723627ad8ac9ee8a543b6dca4454d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

