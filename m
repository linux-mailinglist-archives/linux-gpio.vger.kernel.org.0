Return-Path: <linux-gpio+bounces-14131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 499439FA4E5
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 09:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82B16188594D
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 08:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAA31885A0;
	Sun, 22 Dec 2024 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CFTzOMtM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC9A80B
	for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734857934; cv=none; b=n2Hug3HjJ4s2ytiYCZ+fLBrhQoOSNEFwk5PP7tjmoUoQZZu6947MhoS5IEUJAF2fB/kzsEuVsxir1tYCypw+hRBQ05hMy39rvsJY5n2llQ27PNw3z2iF05rDt1lo8akfdwf1BMXC1xlSTnhtuYw22qVn15TcVGoP53xRwFMOMjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734857934; c=relaxed/simple;
	bh=ydHFUbiWI2donZz3OfQDBbHRjDLFHb07jQfC4ZBZ7B0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blECl5focwc/zQZkBDFWDWZEcCjoD9UFy4i/t4S+jBFPSxy8V3RvhvveINBbo34NofwSzmI7Ch8jG1/TJDKV2H+X6Tg75tFDsvOPjNMj9mWWDzd+acQKos0LJft3dL4kGgcr09hgRvIpmmaXiDyPv70vODhss1cp50+5msCfkGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CFTzOMtM; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e384e3481so2994123e87.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 00:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734857931; x=1735462731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydHFUbiWI2donZz3OfQDBbHRjDLFHb07jQfC4ZBZ7B0=;
        b=CFTzOMtMV4uODjsiT1BiO2cr/UtATlnQUBaS258cAg+MXjSUtk/sM6bC58qQLcQpHt
         R/UsxjDz24Z+IpfY+jxP9+xC5cA2qZcFo/47oidVMCPOBzVkcUXsFjkbjZYgdlMafB+B
         rcyU4b/Zmq2Hfp9OINH6p16sqRHe+WZkFDuIHeW9MzIxb5Tjbi+mPgoSPbbzuiOYx/7H
         yKZNTNMztOlMYUGTprMORCbd6P8t66BS9PjCp7j8yqzm6A0lEJxc2VvR0FKy+j5f01NS
         +CUtYHNdNFox27xQuo603L1u87PrBQBtrnj9a4UUHruAnTTJA9kNE/zOLBK0nNrdl9kt
         GU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734857931; x=1735462731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydHFUbiWI2donZz3OfQDBbHRjDLFHb07jQfC4ZBZ7B0=;
        b=gUxt1rrVtW4mS3E8ANFVQZBxGXv11OrNVIjxJ9pWxxVQMxby3e8cwPgc8zndZCqoh/
         dtYsVER8dQzPM+OJpFcCgax4Bvtw9d6p2tc8Mhh7yav1zCOQrkF0wyemUq+aaCGwuHg/
         n++N6b8+AUAyPRmQwx51zkAOm5oHkSws0gcmrub9h0BYr6XysLIdm2U9XBx91jxfSagN
         W0e3BbDbiiPGRm9K7atcvaGf/EXMOFmbaPJ89k7uq++53RatQqsMFDx82rbLAqIzg7GS
         /FfMCr+ao7jVtSE2HLaXMSCmoouUOnjxJBBtxyYvMrCz3IWpJf2qf9SZmL/nfSvnCP0W
         ya2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7b7mX/QXL1kVIWXGEOMsJS2UjRbRPw3LuIQcAilxqlcMC64HaIZbkrEAAPUZvFUoHgh00kGY7L0XT@vger.kernel.org
X-Gm-Message-State: AOJu0YwjmZASeAbHQXa/6+T9ffUeqmKBlDpl4KUgXTpWFft+R1asA4RX
	t+jNAnkxSUTLLzj41Fb9fcuWN5YOe1Xg0HIMFiiv9d4KZtoodzXChwARrqvLMi3nL6VE2+S5Wpm
	60xW5npkTu+tBDN1PSV+FbfDJhw2yKsCy+Ahtmg==
X-Gm-Gg: ASbGncvRnM6i7yY5fw9n+sAVvUZ6xTMBeJ1rRYNL5bk8KjEMVjdi/57yCJNoi4RB8G3
	2vIhO0cXDLSQNmwi7gSEzAt6qEoraWJLoe3yI
X-Google-Smtp-Source: AGHT+IF7qlESqqycmwiipzJ3ql72D1nNts6ClqeFtGCJ+61DYyayeljU8sIdBxu4QXjOvTVP/Ruoj4H2b41K46y60Qw=
X-Received: by 2002:a05:6512:1592:b0:542:28e3:2156 with SMTP id
 2adb3069b0e04-5422953feccmr2187706e87.25.1734857930624; Sun, 22 Dec 2024
 00:58:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net> <20241213-gpio74-v1-4-fa2c089caf41@posteo.net>
In-Reply-To: <20241213-gpio74-v1-4-fa2c089caf41@posteo.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 22 Dec 2024 09:58:39 +0100
Message-ID: <CACRpkdYibsJvnKazKaqQjLYyL4Hx1K1MpFpM2UPCRbDN3Gxh-w@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpio: 74x164: Add latch GPIO support
To: j.ne@posteo.net
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 6:32=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:

> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> The Fairchild MM74HC595 and other compatible parts have a latch clock
> input (also known as storage register clock input), which must be
> clocked once in order to apply any value that was serially shifted in.
>
> This patch adds driver support for using a GPIO that connects to the
> latch clock.
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>

This looks completely reasonable to me as far as 2/4 gets merged:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

