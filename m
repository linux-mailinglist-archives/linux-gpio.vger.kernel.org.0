Return-Path: <linux-gpio+bounces-26495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF92B91F65
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 17:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 482AD427A0A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596552E9721;
	Mon, 22 Sep 2025 15:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EbcZ8RqS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310402E92B3
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 15:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555219; cv=none; b=a6yJqb16OqNJltS7HJSJnXN39aZvbmtzMGhPKyLvXDVI7AO8OEHqBLxQJ2akdBbtlQtcKGTvBHpW5psgxr+FfmFg21sdqpslnYNdaYlJfA2LJAHsjTBbT0teBANT/Tf5Ow+NkuCYaOB/mBq/38EMgKm3p7xvHIAQThP6Ys/DH4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555219; c=relaxed/simple;
	bh=9GDSk+7eMD2m4olz8yNUDHsfzJO5iPrhK7AiGouP2SQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1f04txMb22nPZ0N0Sn8p46Rxa4JSXbwLos5weDZ8uKqtdNRNO1pLXeLskq80jcoSY6gzpBAKHiy3NcXBJmK5SfKV4YPR1hupHQdsTpJVCrWmMYSaYHiB4CbPFKeHfzSu4Oud8Qj4uSmb13jTpZNS04xD2/AZ1Dvch4Bjpm3vXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EbcZ8RqS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so1509737e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 08:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758555215; x=1759160015; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GDSk+7eMD2m4olz8yNUDHsfzJO5iPrhK7AiGouP2SQ=;
        b=EbcZ8RqS4mvV5MmSP0RIRTEncBjwbZHP744uU278APuleIi9lH8l/VbXf+kqOevmgM
         SHzScm36ygXeXwUT11qNhOeXs6KR+Ugfegk7vO2eSCUzSd9WAwSEgHXGrtwyeeAojEaZ
         dEkjj5GImdttddn7cX6K7yZxi2MBkN2M+ht1N7M1qh3I37jt7FaIPCtsdYqnS+IyMNQ7
         973Ir883NnIApSuoAYxUsmJ0FLrm2fRP69vDPz6LKdAihXiuVoMTByn7skf1VqU4wdqt
         cwyTeqQVSzis4elHj9vFijnySwYUIgvHqESIgC7Cgl8zSA+QOS8jHCx0lxEQWuFjwalZ
         FPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758555215; x=1759160015;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9GDSk+7eMD2m4olz8yNUDHsfzJO5iPrhK7AiGouP2SQ=;
        b=r3NZMo89Vv8hTUvrXJ4SJigWaaT6v9C/osf7yzODZ2ZYnS4UQA8ItyfKNUOUBSu4vv
         RH3sGoUcDy8BqfTt6jYBbQsvid0jhhA5Z/SPH4eRNVSsVksfgZQpdlWZCutztp4Y6TG/
         s45KB6L1LkBOkt0e57F1QRvh4w2PM6RTlfjAtw6YxM5Ck3IasIvV68RdyZ6rMzuUhVqs
         YclJYaCA2I/WkjuSnZH5BCIOjQTWlA3nlpSxsB8+Ti2/i1HOogCJEd1BqO+JcS7DC42Y
         DJR4OX/HMejCWIXV4KMslTkF3a+KR3rVwWxO3MAtawl2zkDexT2rbsVMjqCFk6pnIoa7
         wnHg==
X-Forwarded-Encrypted: i=1; AJvYcCUhpvncFoLTusGu39GEzRgNKYVlPBDmmmKjRkVo9BiYGEUSRzTlnFxOE1yZcNayOFU0vpbMbTuOkLXt@vger.kernel.org
X-Gm-Message-State: AOJu0YwwCAXRHkvnfHulLYLpysDRwac201uMBFhN9pIxWcvwzG/U0L7n
	jnqX7kvtofDkfELpt1FN8nhsK/j5FSIFp2O8k7oGa/ULR3U1Ct2yaAf2tHYBCZSlipu+E/nf7JO
	PfOzhAelBWKvfnGj5zquNsKq6S8755vBdIkm8oNe1Wg==
X-Gm-Gg: ASbGnctxf0Bm013Uwl11MTm9AnJGIyxDjQFwSiXfS0rPX6sqwoFRsBLE/VStVqgH9/q
	LvLpV8BSkqYD0UW8VbZUTX7rsvkcIwJI2JaN+b6t7ja/dKA13lWq+32vilMjseY/fzI2focN1yZ
	+BJiugg1wyA9by63OltUdYCQ8sNKeJXI12JIOZ3XfOBFU6GJ295LNZ9sfXlQmkG1avpp/hz7/P8
	kn2pU1ObYcxg7C6M6rKU3XmBiW3iLYFSZIJ/g==
X-Google-Smtp-Source: AGHT+IGlZY4kCJWeN5dqXhMVz0wVth63k88LkQRY0NMxqg5N9plQEniHvw0FL0I709EW4Ka6RI0ByvFRASCxDMR0/MQ=
X-Received: by 2002:a05:6512:799:b0:55f:49ab:884a with SMTP id
 2adb3069b0e04-579e1f43c06mr3621448e87.21.1758555215241; Mon, 22 Sep 2025
 08:33:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 18:33:33 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 18:33:33 +0300
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250922152640.154092-9-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922152640.154092-1-herve.codina@bootlin.com> <20250922152640.154092-9-herve.codina@bootlin.com>
Date: Mon, 22 Sep 2025 18:33:33 +0300
X-Gm-Features: AS18NWCFatxNFArvnh5SmkTj0DfmC7GBtzmB19TRGxTfynwgSMsjCS139sdcpWc
Message-ID: <CAMRc=Mfh_6kfreC6WNFvFE2X5RZmuHfuVQK+GQ2q6Df-4kJXCQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] ARM: dts: r9a06g032: Add support for GPIO interrupts
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sep 2025 17:26:39 +0200, "Herve Codina (Schneider
Electric)" <herve.codina@bootlin.com> said:
> In the RZ/N1 SoC, the GPIO interrupts are multiplexed using the GPIO
> Interrupt Multiplexer.
>
> Add the multiplexer node and connect GPIO interrupt lines to the
> multiplexer.
>
> The interrupt-map available in the multiplexer node has to be updated in
> dts files depending on the GPIO usage. Indeed, the usage of an interrupt
> for a GPIO is board dependent.
>
> Up to 8 GPIOs can be used as an interrupt line (one per multiplexer
> output interrupt).
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

