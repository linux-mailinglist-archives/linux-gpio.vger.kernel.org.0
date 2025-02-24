Return-Path: <linux-gpio+bounces-16486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FD1A41B88
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 11:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 848F87A447D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 10:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB20255E5E;
	Mon, 24 Feb 2025 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5/z7dv8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E854D194AD5
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740394011; cv=none; b=YN4TNxUSHCzZtoZgbvW0rMwuoNAPcUQkuTxLRCKA5dXLNeUblcY+ylClMufhfO/FBilsv0I6m8iHIvQopcxr6qZ1K9ncJeatNaKH2cxuUXjCyTy/5dhWBeAQIZflLNMrIPFcwzWKApgqWgPclOKCqj2TVB1v0PzlRDangF/kD6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740394011; c=relaxed/simple;
	bh=jdKD75sAUfvwkuog5Jfk0+OozKUBFk+Qyg7OlSdJQ94=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KsN4eGk+BDKdZlTPa5NHbHtLJfVpamZA/ZcQ2EgzCUF8Rld/vZWXQmyOQ5UNdL2yQbrH67fFSANXhhwnC6Vjn+Pvo9NnPsbEP8r9wKxnSX0iKXDWm8Q3mjHhsC/5dIJouCJiKJFodN0SAd094ungVEm9VIGKBAqVNHwBwKOVzoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5/z7dv8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f286b5281so2049722f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 02:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740394008; x=1740998808; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w5/GBx+kg3/mCJeQFrD087it3nq31yjKlpDJq3YU0tQ=;
        b=t5/z7dv8HlaBNVISV1qfJ0CsqhwXmS88cwXGxiqlQFFaNU2P4dXNlB8YX47rxxuHGe
         cxy5QivOySFhsO3Vbgu2O+8RdVUXEExrOhS/FzvG5og+aKuMU7DmKaBUkK6SBddYnlKK
         plnuqlxVBmJFT5S8edu8z2QV+JE/J/Q0LSkeDQUmV2ts9eKMSSxyoxx5tFwCo03TTlyl
         /2bIpl/8EBua1CQcvp86hrrpjh1iZ+xznvWdD5+RFZriXr/UAkuOxAy0rBndG0fFdZJk
         BVmJJZ00MijXajkNRncU5Rosn4fzxuEcC8v9LuCuW9wrN8vRr6okZvc7d/sNHkTrkL5i
         V8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394008; x=1740998808;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5/GBx+kg3/mCJeQFrD087it3nq31yjKlpDJq3YU0tQ=;
        b=RfCxzs8kJYvoIyFQ3flhRZHxtbY2ZpkXjRPqJnZHKgCwZsSoUDt7TDbUtJyF24NpyY
         cOezZv/ExWN+puUDLNKxnKoWA7XUU5k6qrc2qBaB2gqx/ItOnpSlEv8CHy1ebVBDuuVs
         d5AKsCtHTCufzmHXwiexJdpo91PA+RJzPdT8jhrxh1yufzqYb3R3jlkkhi/FvyKNNfly
         UqjXLEtW/tuLp07pQRRfF80eDQMCM6L2EhpdDg0sjN+AecP2G2StC2yGtqU2GQkQjS0I
         oHIS/9LWN20LkcP5Cow/1w75fzOC+i8zqUHfYH9bruJHE/QUhkP1sgVJ+IiEVd/0J9++
         L4Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVPRP2Y63duyhLM41JNsoWZHCxxc8V2FSsNCfvzvzwo4KnDBhzQ3l6FOxZqIFTwA1rsf5ZTvxpJCXN0@vger.kernel.org
X-Gm-Message-State: AOJu0YzBz+TrqfwG/Pi1QNUAVkqt7MHOgxhAKL/VFeM3VgP5iAKMy9S+
	xqli+PeQ2wLwvVZcXs7JjNfxJehSi+rsA6k6+rqV/PSLsopdl8DD3hFC6JjSJWQ=
X-Gm-Gg: ASbGnctybdTGb7+5ZNczAUN6KS0CV3S+N3jlv3Gx8qS442lz4cRik56R6ll1Anlha3e
	X0/6K5B/Oamlkq+ovQ1ujDbfIp3y1BqcWOO8o1XqJ6xe73iyU132O4kD6AAf4roWXISQus+P3F1
	XzJutllGER8MvuE9qDv5rRAdt2rfUHqMkt89EQdeC6BeywVOueKOeUEfbAVGsTvDE0maegu15H6
	VOUVFaYQVsF3s9qSzt7CXmg70TdFb2xUE4xdWwqBnN8u7Nst2lLO1P2/kyhBSv+Gr4RTfjK8DpQ
	BVwEXi2yOBmC9vI1dR0DjbZAEfXtbg==
X-Google-Smtp-Source: AGHT+IHOmP2hx/rBkf4Acp+yVpSfNcuXRYdo4aGzHO0akGaVUvPF7o25mxQ1ki6jQ/embQ9fvsszIA==
X-Received: by 2002:a05:6000:154a:b0:38d:e3da:8b50 with SMTP id ffacd0b85a97d-38f7082821bmr11738921f8f.39.1740394008242;
        Mon, 24 Feb 2025 02:46:48 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5ee2sm30848118f8f.80.2025.02.24.02.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:46:47 -0800 (PST)
Message-ID: <d28ff689dae5a6a35fd408020b3260d6d0f18880.camel@linaro.org>
Subject: Re: [PATCH 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus
 Walleij	 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva"	 <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Date: Mon, 24 Feb 2025 10:46:46 +0000
In-Reply-To: <20250224-max77759-mfd-v1-5-2bff36f9d055@linaro.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
	 <20250224-max77759-mfd-v1-5-2bff36f9d055@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-24 at 10:28 +0000, Andr=C3=A9 Draszik wrote:
> [...]
>=20
> +#define MAX77759_GPIOx_TRIGGER(offs, val) (((val) & 1) << (offs))
> +#define MAX77759_GPIOx_TRIGGER_MASK(offs) MAX77759_GPIOx_TRIGGER(offs, ~=
0)
> +enum max77759_trigger_gpio_type {
> +	MAX77759_GPIO_TRIGGER_RISING =3D 0,
> +	MAX77759_GPIO_TRIGGER_FALLING =3D 1
> +};
> +
> +#define MAX77759_GPIOx_DIR(offs, dir) (((dir) & 1) << (2 + (3 * (offs)))=
)
> +#define MAX77759_GPIOx_DIR_MASK(offs) MAX77759_GPIOx_DIR(offs, ~0)
> +enum max77759_control_gpio_dir {
> +	MAX77759_GPIO_DIR_IN =3D 0,
> +	MAX77759_GPIO_DIR_OUT =3D 1
> +};
> +
> +#define MAX77759_GPIOx_OUTVAL(offs, val) (((val) & 1) << (3 + (3 * (offs=
))))
> +#define MAX77759_GPIOx_OUTVAL_MASK(offs) MAX77759_GPIOx_OUTVAL(offs, ~0)
> +
> +#define MAX77759_GPIOx_INVAL_MASK(offs) (BIT(4) << (3 * (offs)))
> +
> +[...]
>=20
> +static int
> +max77759_gpio_direction_from_control(int ctrl, unsigned int offset)
> +{
> +	return (((ctrl & MAX77759_GPIOx_DIR_MASK(offset))
> +		 =3D=3D MAX77759_GPIO_DIR_OUT)
> +		? GPIO_LINE_DIRECTION_OUT
> +		: GPIO_LINE_DIRECTION_IN);

Eek, I made a last minute change that I shouldn't have :-(
This should be something more like:

static int
max77759_gpio_direction_from_control(int ctrl, unsigned int offset)
{
	enum max77759_control_gpio_dir dir;

	dir =3D !!(ctrl & MAX77759_GPIOx_DIR_MASK(offset));
	return ((dir =3D=3D MAX77759_GPIO_DIR_OUT)
		? GPIO_LINE_DIRECTION_OUT
		: GPIO_LINE_DIRECTION_IN);
}

I'll fix that for v2.


A.


