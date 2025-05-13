Return-Path: <linux-gpio+bounces-20017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC143AB4F97
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90A4C4A198B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6359221A42B;
	Tue, 13 May 2025 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxy+1epp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2616F2153C1
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 09:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128068; cv=none; b=Vz+y9D4kWrZOnePlvC1tNpRt4/wITmUqrnaHMaPeAJpdLUTn3bocLPfpaCO9RR1kkQnFhhI1cgF+V78OqK2syB1INeJNp3Ndt+V+cvJO9unyQUPQjl+n0nt5pPQ6hDoQ8wFI4VYlUPJkPS4177rfHaWORtcG2a2gHzR8QsE7nXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128068; c=relaxed/simple;
	bh=jAG6UOMOffV3gCVoCmbgmLMxOpZlx9u8Ad39RHvZ1TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0+Ng3A282gbeidTxShIKSHxEz6vxBT/WsDWMbqm8YLaNzl47rjYeGDvB/TmfUaslYwsyEUlqbt8rIu6TdnnUSEOLazVjHNpoynsJXDLSyp40Y/N/3Gt7x9Gfx6fRc3dajqWTgs4hmUWv/qEvK9Pe5hG9x/v5oPb6bhQ+ttTAKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxy+1epp; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b166fa41bso6979281e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 02:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128064; x=1747732864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAG6UOMOffV3gCVoCmbgmLMxOpZlx9u8Ad39RHvZ1TI=;
        b=zxy+1eppz0AOm1YjT6rvKlsa5iMWWAkQC3+DLhyvnNkmS5KdD+kIjB7uDdODpZoBPO
         MTttUZ5XI9A0q9ACZ43hFuXk5aU7I9Fr6gVn9WvjDbi0p4Hp5ht+6vtgvWJ2nhwnHFTJ
         VNkmbpN5Y1Um747b7nCwGKbjz+/mzN/A2b8gxSjh+g86/iz+aWgrdGoihG04Ks9g6AON
         bwWF3mI57wxnODdicxu8jx3SWtApeVvgvaKbSSOniRlJAGVhNn1G0bi2PEkDdrJDsH08
         zju4mwRXBPHAtigQ7RlYRAr2veYMcd8TUJ0qkzlJ0P+cGor00OjKAXE5u7CYcjxkGiDQ
         +7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128064; x=1747732864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAG6UOMOffV3gCVoCmbgmLMxOpZlx9u8Ad39RHvZ1TI=;
        b=f1sMRF5PJU/d8XdHrodgZuoxF7x2R5fUX51eB8vAjKFi/HlQHeq3tQ4e7IYvpAtkz/
         j1tzvMDIVeFa6ykG4x2arUyoClu2r9ErMnSA/QYEL52gjc6KW/2ze955tdumOrlpJLxJ
         J0n+aAyYgdAkqylu5V6I2AdXR4hmHIsNkrnzk5g5fn/gueRv67jKj9+iQtOc8z2OUjkX
         8wr8vSK1hFrxLUYHmCn288gDDQpFPfj/jxu5Y4Oc3XBzOgwWafCEvPFk+6dxlfD1J0Ec
         xXDczDKwamX8hxQVnp4ROH/UDUtbJP/rA2dW2TOD/lEcXLz9vEUuBC4fBfwDG72eHz6i
         P6bg==
X-Forwarded-Encrypted: i=1; AJvYcCXN42Mimhy2qHmJwuDv+McpU8gHfjLsxArUPwIE4iNOy0EJ+d/5xGMUYnTKXZDZRJI3BFOC/LfB1WKr@vger.kernel.org
X-Gm-Message-State: AOJu0YwrmYOZeHmfHeYYRRtzzw3WFG+77AEpLuZozA+z7tlLA922prKm
	kW5v0M0Sf1L1fLWm4s8cX83neDFdu9au37QQfEDCs4ku+8tQKzP9I5iErk6nXTWH7PSqiy8TRCj
	I1224K3l8vD9wmR+8bjcRD6T+h71wo1wnEN5Few==
X-Gm-Gg: ASbGncsok1ZGEjfhvyFBImX4DnFRJ4JclzBsx6KNRPL/yvVRUpLdpiZlEL86ieujGpK
	E981Px4eLkV5zZPX3+Ac7KFo6ccVeFVZCHZQdbqoFBpiFlwKVGaDZkeSIy3R0VYBJEzkldBTB+g
	ArszBNYhm/EECCyZ0mhEIn3KSNlukcwF3z
X-Google-Smtp-Source: AGHT+IGKvl0a9PYMoR7pe3tZ5kyPbARxdNFLenyjWORpsYZx6Qr+/V56jGkku8jVsQAW4x2zH8hvY9ZJIUWfZ8j8uTg=
X-Received: by 2002:a05:6512:6408:b0:545:f1d:6f2c with SMTP id
 2adb3069b0e04-54fc67c37b8mr5182580e87.18.1747128064206; Tue, 13 May 2025
 02:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org> <20250430-max77759-mfd-v9-5-639763e23598@linaro.org>
In-Reply-To: <20250430-max77759-mfd-v9-5-639763e23598@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:20:53 +0200
X-Gm-Features: AX0GCFux1HtYoXX3UiKQeMd3kDVZuoIvGECfOVBviXvO98OxIVsjOGF-W-k86hk
Message-ID: <CACRpkdY15L5PpV9ah_0R3ZPZVMh18OR+Dg2qXiBG=8Kq79-rjA@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 11:03=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:

> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
>
> This driver supports the GPIO functions using the platform device
> registered by the core MFD driver.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

