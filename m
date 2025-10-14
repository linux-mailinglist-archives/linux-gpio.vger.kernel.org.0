Return-Path: <linux-gpio+bounces-27083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3B4BD97C3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B6671927AC6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 12:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B745E313E26;
	Tue, 14 Oct 2025 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HD+nY9Ki"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55AC313E06
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760446726; cv=none; b=Wl0yiuxFqoW/Ptsfi3zN4qaAFOXnolKqJ816+yyxiguRAnIxsEFR0nOdkGs/f24kPqq0m9W2eWYLOOwCueeXQfCg3oE337lpdiN2nXSbi0X+swLyaD3Dzmb8Crr5gJXO/6pICFW1Q1AcCf0aQG5yJLHKsQf50lXgWAyeqEl75oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760446726; c=relaxed/simple;
	bh=ERKaxZi856JIVKreXO7sribpAgoWkWL8cPcVypMRmHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MenBvHJ5egod0jwoWBrNmUdHN/pLKarATQ5eNo5ImT5C8WdzrTT0+pmYukdgiacD0kDj6OgGNZTvWcD8M745lxHYW80ktQpJteLPCY78OJj5qTkZnCUFoOpP8lG5JHiTx9RmYj+A4bEVseUmypRdUNWCWEs6+3pS7PqUdX8moW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HD+nY9Ki; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-635c9db8a16so5042149d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 05:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760446723; x=1761051523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERKaxZi856JIVKreXO7sribpAgoWkWL8cPcVypMRmHo=;
        b=HD+nY9Ki9ZCU+ZBbai3sK4TlP+Gj4PeD5IBvNbVgmRwrXEMP1rH1Kq7Wd2U4DC9ql2
         mmbSs/sedO+Z+pqNh178iwTUljJhUPXdoP+VQFu2ruyAZTpafom4Dgb3i9C7kLT30HMb
         nugdcECozBZLP8w6AumLU59dnaaYGy11Vk23pFabxvZWzNmDF8nOoZlM5WedT3ES7DKS
         D/cB7mXIddWy/q7Wje43ITkR6khfIHEjDiCwmec977cTp60w5mWUdbX6XXjhJUkrWeWO
         j4ESkWjq0mWBEgaoWoQnKZzyhE+qXTM8zA+qwVIdhoT3qqyvhnb1qjF3AFb5czRRY0iT
         BJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760446723; x=1761051523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERKaxZi856JIVKreXO7sribpAgoWkWL8cPcVypMRmHo=;
        b=e9ks36uX8UW4xDE08FehNvruBp/2XT0HYUdNjPD//KU8xuHoJwQPgIgcuxK4uALrKA
         HAPZqaEgI1QeCgWmXDvR5m3eHOvsDA/j8rWSILEon8teSs6nQcifdfyLuHxl/7SDDxe2
         d9957L9qTZo8PgEZRat776pjtyFbRIZNL/UnkwEHhj+PS1J0RZNhoEFn9QQJNxM3Uiz6
         vV7DoBNOLw65J5+92345pPZRQNm9EPy3hD+jjqNhW5UXVryaRmPgm40NHJPHXZ9tCxwY
         PrQa1seOYOqjkq9wY9UEAKqigjM9cA+aYmTFaX44kOhcx9doS6kcJS0Tp2WhRcR1ZtGC
         svHA==
X-Forwarded-Encrypted: i=1; AJvYcCWezT3Os4IxFJ153+QxtBwpr3dUxWlNhFctNHed36fSD49krk1Otd/eFYHLmbGc2iPevpAyIYe2hLyp@vger.kernel.org
X-Gm-Message-State: AOJu0YxpCId5djTPCkR/2lHTmn3XW2Nj+eCT5g13kiCWYkCOyvxrQ+fQ
	4zqY621EDWIT9z0ruAi1FJStFstb/GqJR7FZHZ3nt/UuNH+s+UwT1/F/eL1qpAW1isy5+A4tjVg
	TkVOI66AaAL4W5Swy1Sr0KD2NyQuLAYIuuu4peGh0Xg==
X-Gm-Gg: ASbGncs7hhff4c5XVk9vXtkoYP7gMQPfLdCZPHBbyo+XE0Kbmuk7oQcoSAhi/XXRnlC
	9Yc6veWqmIg2OJ72datKoJ//19cya70LP3BZre5/yUH7uiU/zjiVC1x3Tve/uVThUNz6K0tBHMy
	s6C9Gx778l+NohBy0EWIBNs3lePJykIXCMgLGhA2lF7GytY+CaoMMDWOBZYxX/n1B9m8o2OcF1z
	bdGMgyiEMY3g7ZZYyDBKfo+xoQWKw==
X-Google-Smtp-Source: AGHT+IG7Kofwx6n9tYMDxUa5Z04wJalhfP6YJEHLa4yTiQQEa2UVqFp3ownpK3FKUhmGBn3Yg5tzw6HGtBhEHg9/vxk=
X-Received: by 2002:a53:ba8d:0:b0:63d:24f9:5332 with SMTP id
 956f58d0204a3-63d24f953d8mr775113d50.55.1760446723523; Tue, 14 Oct 2025
 05:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759824376.git.mazziesaccount@gmail.com>
 <fe1f4a0947c864496f4eeec8eef806afcf6094a4.1759824376.git.mazziesaccount@gmail.com>
 <CACRpkdZnoMvYBXN7b6dw+uPs=f1WXr9wX-0VF1c1qd-rq+17LQ@mail.gmail.com> <cac4222e-1f66-40e1-abf8-7d4661d43bbf@gmail.com>
In-Reply-To: <cac4222e-1f66-40e1-abf8-7d4661d43bbf@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 14:58:28 +0200
X-Gm-Features: AS18NWAzYGkVtZF2eWYQ8i62TI7iWUixyj6KHyQnG8bjFDuI6exLbunxibrSSZs
Message-ID: <CACRpkdbOKNPFxNJM-r+HdnfKYisWJrQXvG21EL9w4UQVP74D5A@mail.gmail.com>
Subject: Re: [RFC PATCH 04/13] dt-bindings: mfd: ROHM BD72720
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 2:11=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> > These are a bit idiomatic, not using the actual framework for such
> > things (pin control) BUT: they are on the other hand crystal
> > clear for an integrator working with this device tree, and only
> > four pins so why over-engineer it. I am fine
> > with them if the DT people are.
>
> I kind of like to emphasize the fact that this is not really a pin-mux
> in a traditional sense. We can't change the routing after OTP is
> written. As such, it more resembles "wiring" of the signal inside the
> PMIC, and this property is not a control but tells us how the signal is
> wired. But yeah, let's see what others think of it.

Just that the muxing is controlled by OTP and not by runtime
software doesn't make it not pinmux. It is, because it is
(one time) PROGRAMMED to a certain purpose. In a factory,
nevertheless.

But the pin control muxing subsystem is designed for muxing
that is controlled by software at runtime, and as such, indeed
not a good fit.

Let's go with this!

Yours,
Linus Walleij

