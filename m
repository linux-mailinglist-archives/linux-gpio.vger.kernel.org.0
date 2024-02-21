Return-Path: <linux-gpio+bounces-3560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE4985DBCC
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 14:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5935E2851CC
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 13:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C95D79DBF;
	Wed, 21 Feb 2024 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KUyuvw68"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842E94D5B7
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708523122; cv=none; b=W8svGgcsANo1SnCppSSDmAmw5YDksvUcUJkYGu3KslPGiMtKrVnGEmdVdIEXn1/kMYzHrwojYx0mCECa0Y8qNxu8ZrYZ3ZW82Pi4yQ5A14o+/yKbgi90oH+KaOac3aB+g9OzXktRDuWxt/8GRpK4gNwdv77W28CpHDQa2xjnRPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708523122; c=relaxed/simple;
	bh=uko49LY5PDi6sJGCc3e37qoxszoEEaGB98cU8E8eW+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKeacJjvCaV9bWs1izaAJZjOW/cLSyoASKJNOxh4omES3EGjkxRb/JTkav1CGs7uQGdDxy8wQ8X6SN2mYlRV0rmerC8K4BJOKW8PlfCokUbGyajaqvWykVfAHg6+I0kX9AeNuFyIrCDB+wufyu7KYycTw5DtykE31h/ZUOBkkmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KUyuvw68; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso693144276.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 05:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708523119; x=1709127919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLd0dJHTNtVDHjhS0Xex16qn1DWjQskUbDg6XGDd1Bk=;
        b=KUyuvw68RXeyNuMRTTY83+f468Q7iU2AeJan6dROpwKidGcuOCUI2yKWvLDpLhOAZP
         IS2cmHzaKbs8h5aPGcGGuxuZp4VDGTFY+AbcudSXYBCnnSnhjnpB/GuF6DNUWJWSbtNB
         jpbL5s+Z6T2r12j/iWh6QGm+XYdHNIOOBvUoHF2gPVb721yvzDFUxM58RMD91nth7Cg7
         KHL8sc9Y5Pah7GxZ3mVKOLxJxMPOrEY9+8ovwjNyNrfqFwKS3ZjiTNw4ZwG5/BKHC3Sh
         fL3HmeUYhvqk+ZRss1YLvjKHp0eVytglqTbMpf3PW7MeaEetlTSWVBGwpqnC09NZ0gVB
         vsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708523119; x=1709127919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLd0dJHTNtVDHjhS0Xex16qn1DWjQskUbDg6XGDd1Bk=;
        b=X+QR8FmJc/cxvHGVWXMm/uUnZB4+HpWjysl/9da1PYz+69AILXvGUFKDukV1tQtBPJ
         Mmon3SF8Tfffb67fr+znODOdzkAEtYfufn58irPqlOdt73oitLesGdtddGHUDmkJv16S
         0rOXim12PzFBuV9lS7BwIlbrD0K4SAu60e95Wq7b9vs1GJB2NohEEt++z+72JPSkAxYm
         TLuetFvoCi0qJ+z0M4Eo0NoVPS+SpB7r2aEEZLHpQHEH2kHF0o04xM4PRDirG74rvR3P
         bJnyjeW+P6gNaD7DR/s1VLjqXareq+DZk0YFl72U0nUfAhCPcINvzMX6K8b8se5LhA19
         BotQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6Noa6uJkS+9K2dO0y6ddH4U4N2d7abNr0pSUDOext+B9pFGMF9noSfYfCGIyKwDNNciX3Uw0EHMtpIsPOWUdPRnj2fossmeR8og==
X-Gm-Message-State: AOJu0YzI0oj1sjN8XETtimiEoZZpmFVxic1NDgLfkQaV7RvBb0bBSGAG
	wz3q9ZY6fFZ6Mlt3QzZFPl1m/tBK5E/msG9ZUlhFOwQRWQ1DMk9NEmd3t8uyeBQH7lMyd3y9RZK
	3aBk8wxLr6O2MK3bjY0beit2E00kK7EW60RRvXw==
X-Google-Smtp-Source: AGHT+IGFBZLHG4YEWBicAng577AS9VIS0KD8vWVWha8/tAFMiKzC1C1Hv2xo8F+45n6/9msqO0M9ChNKgr/xdK8THek=
X-Received: by 2002:a25:e0d2:0:b0:dc7:5c37:5420 with SMTP id
 x201-20020a25e0d2000000b00dc75c375420mr15835997ybg.60.1708523119618; Wed, 21
 Feb 2024 05:45:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-18-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-18-f88c0ccf372b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 14:45:08 +0100
Message-ID: <CACRpkdYb4V5EouMBYRRrZvLT1v6zKEtjHGPAs5orDKoo6dz6nA@mail.gmail.com>
Subject: Re: [PATCH 18/23] gpio: nomadik: support mobileye,eyeq5-gpio
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Theo,

thanks for your patch!

On Wed, Feb 14, 2024 at 5:24=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> We create a custom compatible for the STA2X11 IP block as integrated
> into the Mobileye EyeQ5 platform. Its wake and alternate functions have
> been disabled, we want to avoid touching those registers.
>
> We both do: (1) early return in functions that do not support the
> platform, but with warnings, and (2) avoid calling those functions in
> the first place.
>
> We ensure that pinctrl-nomadik is not used with this STA2X11 variant.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
(...)
>+       bool quirk_mbly;

Compulsive abbreviation? I would just rename it:

bool is_mobileye_soc;

Nevermind the long name, it makes it crystal clear for readers
what is going on. (Rusty Russell's API naming guidelines.)

With that changed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

