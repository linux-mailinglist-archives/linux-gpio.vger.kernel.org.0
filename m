Return-Path: <linux-gpio+bounces-18945-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D90A3A8B777
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 13:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6061C189D77E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 11:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DFE23C376;
	Wed, 16 Apr 2025 11:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TdtVb3i2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C631322A1E4
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801844; cv=none; b=Su37WvzGVX2fzXcRbkMwHcRZT4hCmRjBukAp98coCwicPlHEretbLUzLyqMSOkekbLaJz5urhKaC3u6bstNejp8gF35xns8wg+1CL1hwJFPNIVIDN78ASPsDX0IxAPlgsfFZorgZRkpUgv+s7YP7u4XEBXHS4jF8WVVJxeVZQ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801844; c=relaxed/simple;
	bh=aIHTdtXrovcQwqqIHpPrWRuVUu+VYl3tEmr74h/OJDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NaP42cC5hitpFwZ+Xm3n0zvzhKMHB/l2at60aiZPg71VIaUiyRPIHsf78SalMRXFjizK1u7KlmtTmuoF5g286Wol9mRPYWtBfwRZVQXin6G37L5NAKAqP4wiaxKf4OZZ3y3p1zzAS2XZtQ6pVA4iu/8o90+FxGWry1dj6mxsZ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TdtVb3i2; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5499659e669so7862523e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744801840; x=1745406640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekNF6eeVab4Uo0LrcCIVuatvZVAJ2+LsoOg7fzFPhHA=;
        b=TdtVb3i2kezEQWYm72XkS0pnKxjHHukzDgnNE3yAzEHlefjZ/yxRqpbw1KBWggS8KR
         77ooKGfnEMwy7p+4aAEOObGr7ID+SRsNV+k+OmfrpqWs28mh3O7R9YpT7QBAZsCd7nd2
         PNmuG+7asaXaZxDZ+77jNm9laLuL3H9Y0eCB+wTWkdukGc8XhlbxmfBR1TxVVfqlYjBB
         m3uVsl+M4BKmycoHtEqNaEWLyQ2snCvedBlTWRdJuFSgM696ILxQeBQ2b1/h3EbBj3/g
         QYoRFMgebgNsS3/vGJwFq5kP3nEykWVONlHTqT0fIYJK64Wy+58Zpq1aQ/Ja4LNuaemb
         A6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801840; x=1745406640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekNF6eeVab4Uo0LrcCIVuatvZVAJ2+LsoOg7fzFPhHA=;
        b=RrUll1y6aNVSnVvSC4H6Fi6XiMYO5J8c1yd+0fiw7aVOEEQpNb+eTbNmWAFxafdVM3
         ha5ZAzV9CHpvhLv1WeJ5RTgPErFGMGL/9AIF2c0+402Y+0D1SF3f8U/wFQlCybmuG6C4
         CbzM2cx4S4l2EfW+VZJIrPJ4d3LjN8ZW/ODGgmGFYmcg2i7vKO2y9MAlYIgOj+WzC5UT
         SVxPtna0yydmR7FLRFeI+YkY3wWhonKg+oikZnBVzlhHre4Suo+c4ddzgvIXMBZOzYf1
         GHk9KWtQlwQEUdiAhOVHOxT7eIrKXyEHKvGOH3dGQI/RTa63Kg1wCbJ9Hx3CnFGAYvJQ
         iQOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTtQwWhZ2BsQQZUbM2aZi6jCUxsPM4omBNBFjDeoNmcqzD0jp8J/XNPgvyzkMqJ7A3TTM5zDYkbE3x@vger.kernel.org
X-Gm-Message-State: AOJu0YxnR2dEfeUuB/vTLtjxnDOE8L/+7rQ6dUwj5TW7VFCRvpCw18LQ
	nafKScYZyfaEeYonSq/hKwFAOyKs1uQbrzRfcZwsiKIgsB4HVRlDzOJ8mNvatHWlDrcI/MDOdd4
	O0aKx/zI3dhHuXlImvHCmCAhWctrvRkY2BC4RJw==
X-Gm-Gg: ASbGncvwEwTbLGo0zWim8lVI/3y+Q4CZLtwASJZj+MjWNOUUWL9TN1rnENHlPtIv7im
	8fzpWhp6fU4HqDVPl2XLcq1GrPWqtlwRZ2Eln6quHbVYwMbF79Hd/z7VazZQsSMAOO+bte1ivIi
	2cfdMZddHyZTir7moj0n7U6w==
X-Google-Smtp-Source: AGHT+IFJxSGtlbphu0zzm/tLIgAsfjlfNPskCyQgArKiIETLbKMVULJO8nK1Awrz+YF4keJ5Rt5CFlu2O1VWaiFfeZ0=
X-Received: by 2002:a05:6512:3b10:b0:549:8cbb:5443 with SMTP id
 2adb3069b0e04-54d64af1131mr475421e87.47.1744801839803; Wed, 16 Apr 2025
 04:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com> <20250408-asoc-gpio-v1-2-c0db9d3fd6e9@nxp.com>
 <5004055.31r3eYUQgx@steina-w>
In-Reply-To: <5004055.31r3eYUQgx@steina-w>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 13:10:28 +0200
X-Gm-Features: ATxdqUGTg2yfx-ZdJ4mEnvtRKlUs-ZPmnmkn-6jlvjsqFPdpAqa_pDHyEOa8HsI
Message-ID: <CACRpkdYvEsxaP=iqXurBz43M_GPKkYRpOp0pOHQqAWx6UPEEiA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
	Peng Fan <peng.fan@nxp.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 3:53=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> > +     /* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIV=
E_LOW */
>
> As stated above this comment shouldn't be necessary, it might be even
> confusing if there is some external inverter to the GPIO.

I have added comments like this to many patches due to spurious comments
from developers who were not aware that gpiolib handles polarity inversion
and are confused when we set the value to "1" to reset an active low reset
line.

At some point I wanted to define something like

#define GPIO_ASSERTED 1
#define GPIO_UNASSERTED 0

And use these defines to make it absolutely clear what is going on...
But I didn't get around to.

Yours,
Linus Walleij

