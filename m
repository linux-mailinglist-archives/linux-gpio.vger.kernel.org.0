Return-Path: <linux-gpio+bounces-25652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F3DB450EA
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 10:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4350E7A2AED
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 08:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B032FD7A5;
	Fri,  5 Sep 2025 08:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bn5TQY4F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C722FAC12
	for <linux-gpio@vger.kernel.org>; Fri,  5 Sep 2025 08:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059831; cv=none; b=Pp2cmVBJDc63RtJBZrBWISlX//ZsRnVOEpiZjjCYCEkim54xxGwZu44vd3oy0poIMJdLFORulOElnifmgYt6irNk391n6mNNl7lhSqi3ldB3BQGkjPAqKJh44Jeh2yoOwSu2Pga37yP1+8c2co8J9SE2N56vBuNq30YP2T8Jsto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059831; c=relaxed/simple;
	bh=BtGTpK92RV2Z6TkeFuzCre6Mq/G4NqRshn0AGkTNf4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3wvip/zdSSjCiFEgKebBdE3pKCx4+Iq/ymytFCyuoL5byfhH1l5jD3Ls3DsiMoOIeGOSEHAslnLDY6DPSyCgCm2zxwA7ehYi5l+byTkPPxGuCNAjR942N4YlrD90q/0g7SaP4NrSVdWQJGmK3RTyoVK+p6Apbgm8BkjyhqUIxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bn5TQY4F; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-336dc57f562so17020571fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2025 01:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757059828; x=1757664628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtGTpK92RV2Z6TkeFuzCre6Mq/G4NqRshn0AGkTNf4M=;
        b=Bn5TQY4FBlGSlUcjEP+x3Di67lMAFi5yaMEi5qM+uA2mKdG79IcWxmnuhjx6zlGJws
         87CUAK4UH4zuWowgtNdTjNQfE6BX/p8oT93qCOZhSx2ygm2iRd+xnNRiqfHIY3edK4wp
         hrytwv8oKbIwmIYNPJmOhNraz05bJUQgJPdVu5AakjpJnhyv/PeXjVgQl/iCzRRf8nAZ
         Vc4To6kk/LcIngsy/Ryr9EMmlvw52hHfFHMNd7tXueiX3Jb8rTXTZyfPD/jFm05PpaxP
         x/MCZcK3qYafQ2wr1/qimNT8iv1hsopNK7dmAq5MuUJ3AD15BbYDtCX06sGg3M0quAjC
         ogeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757059828; x=1757664628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtGTpK92RV2Z6TkeFuzCre6Mq/G4NqRshn0AGkTNf4M=;
        b=PfPT4q5T2aUeyXy7hR3tE5CoA3x28zWprVngb4BzghuuoDlulRWO+oanc/IU9Kxp4i
         GAjY4Yw/GeO0U5sEw8UElzzmZGXshUWHvvgldcEmr537y0pfZ8VBhhxq+8LjJ93zmFTe
         PQ+oZhxfevsePsVq9FP5W6ZopDrVUv4YVgrLwI0MP8xDvRGXtHdWsvlnKTthCVTJf83P
         t7JrhkdpXNiv5jBdF+meRNYV9I6obZm5TYen+9F5Cm8SIsW9Z4FCQuGZK9sOTpotfSDk
         iN+Hy5ajSnXDFYdaMpLRqt6F8C/uwB5r/glTSNh7WWujf2VeNsKLXr4NmkEtqWAGo234
         4wWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW93taBVSDddca55PoL261mRU4A4KvWiGY3jOH/+oHv4UcHfaqTpuab84oqOec2KPD2946b440Cm3D@vger.kernel.org
X-Gm-Message-State: AOJu0YzgnCBfHs4ATiGvYjMRbd9aid9KoX8WfSYI5Etp6GmncXu+l/oD
	wTdy5y06r4V2JXHgjG0sYz0lFqkVllRQ/YOqT2zUF/9v8liXb9XlmjNrIFGJug61AU0fRqhJ3/A
	nCAndCAQ+Ga+Oxwh5i4YDG88FjeMHfAApHTUgjzPzzQ==
X-Gm-Gg: ASbGnctA+UgNb4AWbW8k/6ncYi9zVEEtZXHIExmAYwHl8GfJhmHlAGkgZj3kvlLctHh
	mELbJcrFLwQD/daTJAaki0KvFU1QcbdiWfluTTlpbzQQtwsBNAP6mc1IZSVrM3LalueoYMKeETn
	bH1x1orn3PE+azAbYbEwp+VchspSSsBmEq7ldymQlrCM4wXUUnjAD2m8C089P68pQh7af3jMNn2
	aZV1+Y=
X-Google-Smtp-Source: AGHT+IHGuueojXvcDw+IxXf2H0yV1IZv2l/On0WYvOmWs3UEZEA+8rzZONaAnBMOjzPj+g4/KV47tq/0JIxyMnlIPRA=
X-Received: by 2002:a05:651c:989:b0:337:f40b:ceff with SMTP id
 38308e7fff4ca-3381e2bd8bfmr6337601fa.0.1757059828213; Fri, 05 Sep 2025
 01:10:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1757053456.git.mazziesaccount@gmail.com> <fc3cffa3b75d1fcd19df0ff794e6ad75c8c87373.1757053456.git.mazziesaccount@gmail.com>
In-Reply-To: <fc3cffa3b75d1fcd19df0ff794e6ad75c8c87373.1757053456.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 10:10:16 +0200
X-Gm-Features: Ac12FXwzrJgD4cqNVEMDwjcqLjGCJuYfaMNmrTkon9AkUOYZTyb9cMdwIMQNW6c
Message-ID: <CACRpkdaY3P7uj8dQfDbauvyJ_sSYPeUC7kK+DTMrkfT+BcLjCw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: adc: ROHM BD79112 ADC/GPIO
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Tobias Sperling <tobias.sperling@softing.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Esteban Blanc <eblanc@baylibre.com>, 
	Ramona Alexandra Nechita <ramona.nechita@analog.com>, Hans de Goede <hansg@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Alisa-Dariana Roman <alisadariana@gmail.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 8:42=E2=80=AFAM Matti Vaittinen <mazziesaccount@gmai=
l.com> wrote:

> The ROHM BD79112 is an ADC/GPIO with 32 channels. The channel inputs can
> be used as ADC or GPIO. Using the GPIOs as IRQ sources isn't supported.
>
> The ADC is 12-bit, supporting input voltages up to 5.7V, and separate I/O
> voltage supply. Maximum SPI clock rate is 20 MHz (10 MHz with
> daisy-chain configuration) and maximum sampling rate is 1MSPS.
>
> Add a device tree binding document for the ROHM BD79112.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Looking good!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

