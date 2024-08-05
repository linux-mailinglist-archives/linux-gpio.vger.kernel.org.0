Return-Path: <linux-gpio+bounces-8568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2199475E9
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 09:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6677EB214B8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 07:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AA01487EA;
	Mon,  5 Aug 2024 07:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+0t+A2N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5BD1411E6
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 07:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722842495; cv=none; b=nePxz1aHBVLSGytLe58DVRiWHOyF9Xn00CKmJsxFuxI/ppsReDPF5Id24zLpL4dcNWoF33Qjn24hnzbKMWu0Pxu3sSSSeTe/Dimpw1PQUxkol3TueXMdAmIdlwYlwXGTgvLd0HFz1vNYBhl2icyHGAv6dxcyWkn+tsL8BnaE6DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722842495; c=relaxed/simple;
	bh=tS2g0BDeznlfL8i/Fq7iBg8VhJey/mK8KgkqhdVLk2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSgxFtZBroGX4Q/QEMfolc1JDQHrDdD+277kQWM3IrrWdO5bOCnsNsp/VS6SsfjEBb9ZxepET/JoEzPssn3Lb584XCmsd4fYlsWXEKXWEOKW0k5t+EWWSoMDKTu5G5kQx8fHbtaz103VSS09wmPcwDrOYaPST9JwLGnxvLIe9rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+0t+A2N; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f1798eaee6so11746621fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2024 00:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722842492; x=1723447292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tS2g0BDeznlfL8i/Fq7iBg8VhJey/mK8KgkqhdVLk2c=;
        b=e+0t+A2NIk5zsbEqAWM7+vrJkL47Dy+/rWFsDsBAu0Ynqd3JK4FkeqEAMODYe8/GVC
         +2zEORPcV0XS056TyRh6pF2ZTb5RGuWSQMTXVFBqdmH5zeoEzeO9SobYRXliMt2WvH+0
         W5H7/Sxdv6tdpkTz96fl2faas1RhE//IMmbgI51nyxfnGuaq9NDdAcKSqGjnz7R+B67v
         oSapx9+lcf59M7/xDb2NwdNq8ruXcMT/UtNAkL/Fl4gGWDPRmUGSxktENG38OUPyV1CJ
         ZA+TuBMeAST5g8lIggrAjIZqaR5KpMwknTUhKZhBeIN66FvXJBk4C7uMpgE7M86RutVf
         ktTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722842492; x=1723447292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tS2g0BDeznlfL8i/Fq7iBg8VhJey/mK8KgkqhdVLk2c=;
        b=lDC1GQ6yqHzy2owVIHGpw5pNx9Yc+J2zjbRGM/suAFICh8dPR9OYoNmp6Y9IJpAVvg
         aLZGKA3RkYhOEO/vo2PpBlGqrUIHMPxzaw36gz7rM2vBhykH4BAT+jfYbZCKxymiE9b7
         d2ClLw//g1FaezNxk471u8PPjRHjiUzTwzI8cBAlwKThCAJ5mGZyO/FrVXyssiYEqOiA
         mV3Tjev01+lI0nRa876hfde8fXzhtIW51di4WRNrWgHlg8SbJenGvZpagtFw+d8GaHj/
         x+5/HC8457EyhwgWGNwSE0u8Ua7bTB1q4RN8LcNhbbcwTpzhaoaZq2MevEVPRMrbelRk
         PFTg==
X-Forwarded-Encrypted: i=1; AJvYcCXRmW3lLKQpzzUbZI12q0KZ6I7D5ZEmDNFMJxy0pzx1tslEehtGn4Nggmngo86iAB+0vfocER+niCaX9p+z3jIIDj37AhVYYNBq0A==
X-Gm-Message-State: AOJu0YyugpIl8PH62ufhUi5rwCZC6IGHpZw+Ea/w2IZ2/iwte2Rj0WNf
	aJKxiObqqpV+T3K6s809PWOBtuMcx/2OSxmcbLfgG/tQLRVpQ4d+/UjCY637LW8kHyas3EIDM9w
	AD2eeye9ApJiQT4cjz9oa/pkuS+HjzzgN9DH9jg==
X-Google-Smtp-Source: AGHT+IGaH2vxgMDkGFZUdIcxkBf0Ibf+rUGckbmfezHuVu51UfosuHDJtepAGGc5a9SNngpjBAKhdPsQUb6JWRvtMyQ=
X-Received: by 2002:a2e:9794:0:b0:2ef:29f3:c9ee with SMTP id
 38308e7fff4ca-2f15aafdcdamr67657951fa.35.1722842492103; Mon, 05 Aug 2024
 00:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709092354.191643-1-manikandan.m@microchip.com>
 <20240709092354.191643-5-manikandan.m@microchip.com> <172052434347.27822.16864713604407945517.b4-ty@linaro.org>
 <20240709155410.GA3589336-robh@kernel.org> <CAMRc=McwTgOjQrNtSVORWFS92tJA_G=26x-8E6U+=4qW0d6OWQ@mail.gmail.com>
In-Reply-To: <CAMRc=McwTgOjQrNtSVORWFS92tJA_G=26x-8E6U+=4qW0d6OWQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:21:21 +0200
Message-ID: <CACRpkdaCb+GOG8W4gEqPYifXdAU9pxyOs1rPz9Gbpee+DUV-_g@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, arnd@arndb.de, durai.manickamkr@microchip.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 6:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> > Patch 5 depends on this one.
> >
> > Rob
>
> Oops. Linus, I see you already acked it. Do you mind me taking it via
> the GPIO tree to avoid rebasing the tree?

Too late response from me, go ahead now or I can merge it if
that is better.

Linus Walleij

