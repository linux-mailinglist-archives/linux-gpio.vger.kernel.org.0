Return-Path: <linux-gpio+bounces-24787-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F81B312DA
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 11:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D70441CE87C7
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 09:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381A32E3B00;
	Fri, 22 Aug 2025 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yramlMjx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE00D2E3B03
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854585; cv=none; b=aSAjljW/aOXW3y+5suvi8MOAdA7TiEKP/+qWP6AF+YtodEfQuJEOWGAJWsIp0/Wq7o8z9htLz4xzn0H+R7LQ/6Octa9V8BsNY+we0zJ9wXAYFav21W2nfU5FMgvQQpmw0SaZrPv2aiwiKu4xgdDyy/JaS7s7fS2CS405zrJlXIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854585; c=relaxed/simple;
	bh=A81kBoegl40q6quwOX0WX4yiOUHqnmUUvR3iJOA0a2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHK5+zhb2F66AoY4AlN7gY2yk3crM/uT/KdTDgVKJ9vc0aFUPqTts3sgedndAd+5SUtz0VR0xDESZgl9eOCvMpDFvNIiLphHAd5I3/G+G7Q2ZQcx5C/7Uw3eemjieupIc+P03HPQYkncSGDpdNQYOY6v+XC0rifrGqopD6Ldlf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yramlMjx; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-333f92cb94eso16493131fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 02:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854581; x=1756459381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rvb5BTFOBJCsAqheRi5OrrkHsnM2r6jQ+WuONy16iw=;
        b=yramlMjxo2HVLHr77caITJqmao78DQi+W03uRRGABVDoijpNsUeuSCdK1TmpiJ0hXi
         GdZ4vJX75/t4Q+Q9Da1aUSKfT/UUVQNzpkZVqBZd7/uWx4WotQs1xPHzUoD63hJlWajX
         VAj/Pdcsg4mCr3WWO+WVte+c9XTUg0bzLml3DfEek7dleo4tySjsDb9Wpf0pDxppHiIX
         cqiFdOvgyAqqOqrmV9U0qKwyk7iEiojvSM0EvAc8MvwykNTPCwxI3uYvlKRc6SgiCz4s
         AnguQxajQDLQ1IS+mXISkUlGcJXvmR9W+RpSLjxoi6fb6rmdb9bnmctZozyEhIt65U28
         HiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854581; x=1756459381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rvb5BTFOBJCsAqheRi5OrrkHsnM2r6jQ+WuONy16iw=;
        b=EpcKxaXlwT2PspHauyugpUQS08G36V57KQ0RlUSKN0YZL3f8S6imXKSc1EwZgpK/7F
         FZ+mFRfydkZ4xviY8fjC1eqXM7/NHM7e56llzkE6XqmGIiQZyMc6flft7g4T6fT0B9VO
         jV+0R3FebgG9ZcNFmK4TsOQ6LfSGuN1tXZzUj3O0DpIyMO1mruCbex3vkW6j0a+CjzCZ
         bDPiXajJApho0+0xV9+tXRcb4wput69hiQQSyeHQ2taBk2zozCoEnByYiou2cXILZLmg
         zC7M9fL8yVCCE9GzP1+T3LOCpTaJv5TD70xAxDEit07m5so4USt70RbKvU9IHsKXWnFK
         RZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvXn6Kzip55CVcqL2UikJCuWM3X1B0tzB94Nhd2mTI3Q9iKqkNJ1ZnEONa/wWCDkb5WPX6FMTl9vFu@vger.kernel.org
X-Gm-Message-State: AOJu0YwTQ6GEjxUb8FTkKjBPQxC+UGcwoemFtn7ewaWH78qPusOcSCfR
	WkncszsiccDCfkN4dUL1uMg3rb2stf1NdsCORMHBXb3p/qQ8Qa5sE48Dv1iH/HHu1kQM9GKMLz9
	lHo8eWynYScIRtemfJjb7Et9iYe4OBMMhcyB6pbjemg==
X-Gm-Gg: ASbGncsUFvtUBhWyeKuv40jCbsNRjih/DftC2IZWyGdhG2jZy/dLge5M/1UTFwwSGpk
	PSPnThOx/vjQTnRkU0M4o0XUZzjE+A3lJcVyoVjneLUA3vcW7Z67zayAw77oNYpEBQiJuFf5HHc
	MlmJtrky4Jy2Qk/t7voS+82a+IDwrqiuZ4gPA+QbLDsIMkWLFRbHtLySKunUhZgp0XyEXt8a917
	dlJWlk/7eVmnfuatw==
X-Google-Smtp-Source: AGHT+IGmS+5jZRiY3M87jYqtd1N1nFCNBKn5R2TEdrmd3+xxfd4PG/kXNNSVVgmhRVuloDKPRDouFdqjsq+r/vvoIgA=
X-Received: by 2002:a2e:8a86:0:b0:32b:5272:38eb with SMTP id
 38308e7fff4ca-33651002d61mr7071001fa.40.1755854580887; Fri, 22 Aug 2025
 02:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 11:22:49 +0200
X-Gm-Features: Ac12FXwu_A2fq6cbJB5U4ofkj6w0TKETQ4RpzZE3LHHotvIJu8LJQDJ8_-1dTpA
Message-ID: <CACRpkdbLKXx7GEOPemFGSTFy8oDG99TUFwC7sH7xkaoqe-cY8A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: Move embedded controllers to own directory
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tim Harvey <tharvey@gateworks.com>, 
	Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Mathew McBride <matt@traverse.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 9:57=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Move ChromeOS Embedded Controller, Gateworks System Controller and
> Kontron sl28cpld Board Management Controller to new subdirectory
> "embedded-controller" matching their purpose.  MFD is coming from Linux
> and does not really fit the actual purpose of this hardware.
>
> Rename Gateworks GSC filename to match compatible, as preferred for
> bindings.

Maybe add some definition of what we mean with "embedded controller"?

Something like:

"An embedded controller is a discrete component that contains a
microcontroller (i.e. a small CPU running a small firmware without
operating system) mounted into a larger computer system running
a fully fledged operating system that needs to utilize the embedded
controller as part of its operation."

> Acked-by: Michael Walle <mwalle@kernel.org> # for sl28cpld
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Overall this looks reasonable:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

