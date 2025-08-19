Return-Path: <linux-gpio+bounces-24547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D6EB2C2B6
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4FB1188D3F1
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30672FF16D;
	Tue, 19 Aug 2025 12:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HqtQGYmL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84A6322553
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 12:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605291; cv=none; b=uwMWopbwHIld1LGAybNSdgeFRIWAaUO89ukM3MRiJ0iV3jI2hRQXRNZEbXvN7hdXrYLOczfTpsFaS78nUT1f5wCi4nO3kDf+OJKPqSBW9yLf3gLfxAFE7b88yIWxTuWD8TF//gbg8+4nUDnzBZ+SY3Bms0wIKz++La1TzCBRGlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605291; c=relaxed/simple;
	bh=jvZ5D7tp1bVrkSUr45nSTmELa6yA2IKS5foYDag26Ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqHbXQzwL+cZOHAUvBZjHqu6CAZWsUtcXUEpY84RgqQtbsJIR6/IjKTl1Y58F0dvG5aigbnKC3BAVEnQbrxqzuP98iNZ+6nSib4PdUmzMP3A0M/I7nZr764VGSD5f0Fzo/e07cVrDDfIPrqpi90XP7RrchC6PUEGu1OlvR0y2S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HqtQGYmL; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-333f901b2d2so39003691fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 05:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605288; x=1756210088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvZ5D7tp1bVrkSUr45nSTmELa6yA2IKS5foYDag26Ss=;
        b=HqtQGYmLKfsGMRc0jArKSeCknNjfKDAphbDNjc+pJdQmhWPclMMbUQqnW9ypy+dtwX
         ucD3pKYlRFucYlWFdNdTGrtvIC5diDQuGEHRR4vFdtIf5XZOGV9DSqgOYVkjV42EEasF
         3gDInV/jXXFF8HR97OmVJTi/927z4dcjchdRNDWUbwLYYje/ExhoAk4yu/h2gjJzSb1U
         IpThk7soP7cbksjzaf73PiV4ZNDl56r3Jy4ZlPxIkT53sZ5LIMQfKL9oP6CUyTo+EoZ6
         pIOZ1KEVleP/008KlBrjOKUQmDWEWhwvajcWiaHoBLBxryFNcF4NXh3srK23yQ2pPX5u
         83Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605288; x=1756210088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvZ5D7tp1bVrkSUr45nSTmELa6yA2IKS5foYDag26Ss=;
        b=pTjuyJFSxr8qkwVnHRQMfRyfVAkaMFfaH8cEpT25AI8JYgVOiH8CaP/RX/040TAG40
         6M9U7wChtAzLxuOe4F1LHIhDoQVCn0vjoMkOROEhWdqqXU2gLkw0NP8oKtRmvmBSete3
         +RIAsmRvsjiTydVVpJStX6h9MPRvDfd8JqYCFA8P92m0Y6UKQAF4nqseQUTzzkLOeWHr
         YmHThkQn+t4AlcTn2vqEGIPGKJbsUah2T1Fx7s2Ter1QDQHOJGE03juqvK28zSbRPRfs
         04qgnDUys7vZq/7j+dw0gV/oCUfJlWiwtM0IW1oquu6r8YFHmkLOaSsK/3kZORFX3C40
         BlOg==
X-Forwarded-Encrypted: i=1; AJvYcCXBk/jhzYEBoiwNTxL/PpIwSBISRCXqWHKI+rCaTQbkozD3DnfPF5b6hV5o8j6kGyBaYS29Ic3HBmgq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+uxq/AS16K8VMfStHSPztm8WinD0hObIKkalQ1CfWf21g0Ko2
	ThcF40dSmbLkI5WLjzg/QuaacS+Iq7SXocf2dKy9JuPuSGdKZ0IMoW91cMmofUGRFbCKqFXOWq+
	sX8Tl2obIp5en+FC0mw+Lo790BISPuEwt4dAdOUpGlQ==
X-Gm-Gg: ASbGncsxteebg2BBQrE/4Yr4uGarBKk/a5I066+D6mHsQQy/Tv3a7hW5iW33yJJJejx
	rTU+Hh57ExjTiPVtuJgT5Cyb6g2Lo9gWa3ndr2oeixMWom3kvMjqn+vxRoK61Mm06uVZpuH7z9u
	LThTvGYmliNeCLFwQ9OY1VT31CtKIkA7yVwLsCZsjFOoJ7tLtQAtFZ6iCLF9TJQX8kgYFuc0L6E
	r5+ECM=
X-Google-Smtp-Source: AGHT+IE3dfVYJKWXUrGRuEJA3+o6pONVlCs6q8ohEH3Jv0GLPiiwaO39fGyN+yXgfnlDzLQo+oRUw/tQcalr7ak4IWY=
X-Received: by 2002:a05:651c:516:b0:32b:533a:f4d6 with SMTP id
 38308e7fff4ca-3353072e501mr6155041fa.34.1755605287796; Tue, 19 Aug 2025
 05:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com> <20250814-ltc4283-support-v1-5-88b2cef773f2@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-5-88b2cef773f2@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:07:56 +0200
X-Gm-Features: Ac12FXxaXh8IRrmO0qiQXEL9cXb2hqgOSqLusPCKGVI2Xon1ujnlah0xogXM2EI
Message-ID: <CACRpkda1E=2rCK+vt588FRJatrASx+dDss6HMX4NGoTrL=4mPQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-binbings: gpio: Add bindings for the LTC4283 Swap Controller
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nuno,

thanks for your patch!

On Thu, Aug 14, 2025 at 12:52=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> Document the bindings for the GPIO controller functions of the
> LTC4283 Hot Swap Controller.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

(...)> +title: GPIO LTC4283 Negative Voltage Hot Swap Controller

This is a weird title. What about

"Analog Devices LTC4283 Negative Voltage Hot Swap Controller GPIO"

So readers understand:
1. This is an Analog Devices component
2. It is GPIOs on the NVHSC not a GPIO with NVHSC

Yours,
Linus Walleij

