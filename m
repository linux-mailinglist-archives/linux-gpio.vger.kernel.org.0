Return-Path: <linux-gpio+bounces-19000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C3EA91582
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 09:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496973BEBB6
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 07:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE34021ABB3;
	Thu, 17 Apr 2025 07:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wnap2H9g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07684219A8C
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 07:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875749; cv=none; b=FokcJwBV9J9RxeoIbg1eq7/jhRnGPyDUKSu/mtWhlc3VbfVT8cj33X8h3yOGPfh7ABYWmCL6Rofh2c5TX/K+ZtcL4FhNa+qQfMZOHGDVtLtI+9exKfKz4l444dxBZTRJoEPQhvnOhEQ5V7TDSIY+zoICX5Ssr4zzs0ZpxNgj+AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875749; c=relaxed/simple;
	bh=l9yxI+Mba9CUaTNrgCthTIf1TjoMCLU0SYdNd1ClZ+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGY48czjQmBm2cshBAvk+zG4tZ7XlUA/w+kGqPSE0epiWBLUYe2BXr0/f+jUEc30MkR/Iil9RFyEafpwrnJxlNaKJTq7h9VQytj0jpPV51NZdhw/SChU02DafRJX+uBdzDtY/ndAtHMe5DYtIfuSxtLBJaXtGuZf8+5eszMdi5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wnap2H9g; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so4321621fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744875746; x=1745480546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9yxI+Mba9CUaTNrgCthTIf1TjoMCLU0SYdNd1ClZ+0=;
        b=wnap2H9gAK9NNteg++8ryeSQa13UjKbjK5x1IyIbpzWmN40rnBiVOp2GN9au7vocBE
         By+9iQFOxEbx6q1caCk+cyaO69oBPvp22y0bwwnhQXReJa7VmYkQ+rMeE8zyenLb7owJ
         b7Src8UWf/7rdM+cr3+YYKSpXBMu/hzBOCMCQdSCunqSYp40qzb463awgut7wzrhabyS
         i+NbP4bX61SXTx/RxmLupBwL/h1qXj20BOuw0B0w0DYANCEYTTpl2LbMvwTM6eVN9NAY
         xQY7qkMhxkPP2RHT+T34uWBhE9hHDD2Imyg52dgx12GxBMAyp+/48pzbraNZ26amMv0v
         I4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875746; x=1745480546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9yxI+Mba9CUaTNrgCthTIf1TjoMCLU0SYdNd1ClZ+0=;
        b=UhabgeO8+9I7Ix1YA5/LDFIoAuNBpByFK1dwTUdUFgZNu7mBc0lbBYzQb4cZPPmQTw
         pLN+JFjUBgZWDavdg740jCqlCIlkW2PC9Gjg1cSxPqCRaT/qyMCaZ+TWcS4Um2ItF+S3
         g5q2B9+jDqxV19jxl2d3Pmui8zDiu42wEY4lK+DHE6CbLvt3uDhrzPS2+ppSmCODpIf9
         tcyaKKwkohzForfHB0TKbK5rpqr2SEQJDuRG6VQ2uPEouTQ1EvnmdQl+YEazwzOR4ZnM
         LKUiGdWFkJSPZmNWh8I4NgeAerLi9cjNIDXh3i2PzDS/qCuN5yEMVM1CpFqptAUma815
         vfaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHVTslwtYYKXF2DAcgppoU5SLuBEpwesJLVJrhyGbi64sVluS4CiL3ZLtogaw1w43om6A++nWn8eOl@vger.kernel.org
X-Gm-Message-State: AOJu0YxC6QkXmZQhTnf6ZXWaLflSJJgsXsBtjvvo25me4OJ9Q2nNCiXO
	FfeUawp/4hOFd9OHSosQCxzHm6D0i+YSeZP+ubiCMiiD9j+qPeo4UdoogSOdoA97ZQh9LAb630O
	LnpSZ82HCdYSnHiHyP5YzixZxubsPOzAF8giBhA==
X-Gm-Gg: ASbGncvGmJeMRYVLbKe/2JxVPH5Jw9fwdpNCxuYZ7o/MJ/63PuMlmxzoxs+mhZW/Gj7
	RayvhCy+HbceegTVmptwriJtIEQflCYB5dTHw69w/bUSkbtlZaTauW1fh0sjEQyiN7uRvh0E5+c
	VSMQvwVM5tzOfzCzEebaumZA==
X-Google-Smtp-Source: AGHT+IGS1IRdJZGaZOGBt2o7TAzE4ajC3kXe2lrY8hS5Zx1+HVIOORQPGpXWTLFIUHBjt1Qe5pOZPC9xWwoJZ+1T0rQ=
X-Received: by 2002:a2e:ab19:0:b0:30b:a20b:eccc with SMTP id
 38308e7fff4ca-3107f6bde0emr19717881fa.11.1744875746101; Thu, 17 Apr 2025
 00:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
 <20250416223706.GA3230303@ax162> <CACMJSevPHdo9ZGaOyGV8rrhJHTN4+-0UB0+sz=Z5jc_eZybjcA@mail.gmail.com>
In-Reply-To: <CACMJSevPHdo9ZGaOyGV8rrhJHTN4+-0UB0+sz=Z5jc_eZybjcA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:42:14 +0200
X-Gm-Features: ATxdqUEL04h0FlK145WkXx_Q9dTs068nZ1YOBn95bqrfuRW3dCGJeGM7IpJjU74
Message-ID: <CACRpkdY5KJzCk1sfznG6DFMmX9T=pu=im_a6jTeAT68pO9SBAQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] pinctrl: sx150x: enable building modules with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 8:42=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:

> Makes sense. Linus: Can you just drop this or do you prefer a formal reve=
rt?

I just dropped it, no problem.

I'm amazed there was not more fallout from the patches
so all is good!

Yours,
Linus Walleij

