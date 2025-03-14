Return-Path: <linux-gpio+bounces-17602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F1BA60EA3
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FB727A9986
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043A01F30BB;
	Fri, 14 Mar 2025 10:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9zQ3ft0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0460A1E5B8E
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947718; cv=none; b=jdXDXrmAWaKqqUs1ZarBfF8bRvsJ+Mo4RIVeRY4WZ7c14L0TQ7UTZVNX/R2Gu9cufNGtDB9snwyF+BE9iCQFIcjTSFATv7LTbz0w1gNbsaqOYRqXxPeQnJ1+MzYyX2yZXoSgiKiFojgIWetk3qwKadMugNw0hJH5XILokn7mOfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947718; c=relaxed/simple;
	bh=xTpZTX6AMxu3+qazJFqKIwM9kTorD9hdWCEh54oD/yY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVSzmxo8KOu1Z9XM1Zbva4p3JrRl6oGwDZ2BpIxyl7nW7mwgZRBitHPGI/k0emffcDi1vK8TRuElMfF4wPgolwGxLJHPVWAzJZNIEKpjhu5l8ghMc3IFesA/WLQa29GJeOA6pNP7520C9+UljeuMXCjdDbksixgJISu57SF3Oyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p9zQ3ft0; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-548430564d9so2167083e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741947715; x=1742552515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTpZTX6AMxu3+qazJFqKIwM9kTorD9hdWCEh54oD/yY=;
        b=p9zQ3ft0WTocuto3kxkJdZvK8WPT9p0aKQQAxmKEeEhxOfmQMgVSf0WYouq2RNtnDZ
         nz+yP1Epw6b136sAePYsDMbo7ZfBWCV898YfqtD4tmE3Guhtz0zr6avLivv9OGMGOzch
         nFG7Eo0X3COKdmeFB3I2JCqiPxnx69KlVzg4uCEN8pALQplNC3dfBeLdCE+PAusxtQMD
         v/kMktGMAMG0YKXNuafxPmdDNq0y4kMzgIZ0s9hMg9tWhou/fo12OEHnGVzq9AzbvlYS
         hELu1wvIyxLtFtNgSphQnXx0ozfRY2z2xBKSS0M+yfRlmTT1mtp+Vrz9w48Fd/YNIh15
         Adow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947715; x=1742552515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTpZTX6AMxu3+qazJFqKIwM9kTorD9hdWCEh54oD/yY=;
        b=GjIp8AvPzt5docUWYymr+VdwEwISrzvI33M8dwp3ys8dUSjGKKZO2CHc6Dzca/YwSN
         fB5yUeTJGC5pIXrQPXD3OVoYoX0N2GZk6mfPzPx1fzkTUKjHztWcDKAsK+xrgWNrEYsb
         hltpC87D6d3ibG+63IWTZlIB9ZhLxt6D6IGxeFrqZ0adxPmqqxMqVdE0IDpujC3tNBSZ
         pKC24vRWCGwHmZckiuCF2pAXWdguLsI03KGljxLXBSbneZXcVarA97WQrMjQIxOrm0A0
         4tFF4/T0usW2ktXiQ+Brq1GlVkdCtRFoms02z2lOfcKa/YTzYcK4As7GxAJxIJ/8Navd
         26sA==
X-Forwarded-Encrypted: i=1; AJvYcCXbsjDYspvaNp5oB0XQTTNJXb9Pf8p8RrqKTUtG7evyi13hRRTJRDbYAdUMKIXTu5dZncroIYioMKly@vger.kernel.org
X-Gm-Message-State: AOJu0YySVNTntlBD1foHzbVjXYPYxWaO8b+1xcc8rJeQ4pFLphqAjgwD
	iJMB+49t4sRfEhoElxtIe+gZpN0YASCQxyJQ4Vs02ZaotwPkxVmuw61SO+Awi5maV+Ikpamwoz6
	5cMl7GFww4EIKm4+bZ7TM+lp0PJlwRt4Xf/kQ/w==
X-Gm-Gg: ASbGncv5uEoDujCOPZHm5m/R8UmIFpg4MEIiyCA2SKB1u/xg+PfGw1kjcVUy2MseURc
	Ewg4nOIxlwJVo61RseMsrqF3e84zvVIbFWnYLHPKZ4WBw84DrhWNPk9fuW/8YHP/9c5P7tN8czj
	Ows/2ExH7VqXsq+iLwc/SvoJUjOlh7NMnwDQ==
X-Google-Smtp-Source: AGHT+IEUDgH4hKI/VlqsNxuCaInPD1IYUYUxnK5o+/fyx5ELv/o0sS9qDolaum2DK5go96TmMf3VW3HeNPG9uPpiEA8=
X-Received: by 2002:a05:6512:b94:b0:545:c1e:65fb with SMTP id
 2adb3069b0e04-549c38fbccdmr686124e87.18.1741947715080; Fri, 14 Mar 2025
 03:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307124841.23777-1-darren.ye@mediatek.com> <20250307124841.23777-7-darren.ye@mediatek.com>
In-Reply-To: <20250307124841.23777-7-darren.ye@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:21:44 +0100
X-Gm-Features: AQ5f1JoRI9uPFODrP-kekoqBVTf1T6TLHgkeo343GHaQMulDksI11fRwjUXLOnA
Message-ID: <CACRpkdZ=a0mbir=D3dCSPns1TC_OVWMMTXJKcTYOJeNy7aQ7NQ@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8196: support audio GPIO control
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Darren,

thanks for your patch!

On Fri, Mar 7, 2025 at 1:49=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:

> From: Darren Ye <darren.ye@mediatek.com>
>
> Implement mode switching for audio GPIO.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>

> +#include <linux/gpio.h>

Please don't include this legacy header. I don't think you even need it,
you are not using any gpio_ symbols at all.

> +#include <linux/pinctrl/consumer.h>

You don't seem to use anything from this include either.

Find more specific headers if you need the code to compile.

I think you should drop both, the name "GPIO" in this file is a bit confusi=
ng
because it's not very generic but dealing with audio IO routing. But I gues=
s
it is what Mediatek calls it.

Yours,
Linus Walleij

