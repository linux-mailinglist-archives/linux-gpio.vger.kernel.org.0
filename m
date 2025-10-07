Return-Path: <linux-gpio+bounces-26877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F69BC17AF
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 15:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 135C934F536
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 13:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084DF2E11C7;
	Tue,  7 Oct 2025 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DKBRTvtc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D6C255E27
	for <linux-gpio@vger.kernel.org>; Tue,  7 Oct 2025 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759843312; cv=none; b=fQ3jCJI61YmCQgyd7unombM8EP5RulEfiNB9Vtr7NLN/1bBXCLMyHR9Bn9QikJ+eidxdgNOAnnl0SAJ5Kg+1XYQ9kleESokdfbG8+2PY7fM7HxPDTJsYi+mAL97n4yBwRTXHK9PJcpTHfMBuH/pQ5qxs4A93NPO51AgWo716vMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759843312; c=relaxed/simple;
	bh=264X1qDN3aQAP8Oh7tuky79CRF6X9B+bbwWZ9c7oerg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHIQmlgTWmdSwyZZjRF/BuLKBjt11XpV1FY0L9vSQ11Tha2XOXd0lemXcuSsmUBMRhAKkQmimalgnbzc/i7zRJzP6v9/p5fEagIuLYC/jYwNM56w/AF1PI7wBtLjO7R8NHT2yPNa0RV62eZbLuouHqOQQ6RSWjrwIV0ViMaDLrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DKBRTvtc; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-373a56498b9so79773971fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Oct 2025 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759843309; x=1760448109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=264X1qDN3aQAP8Oh7tuky79CRF6X9B+bbwWZ9c7oerg=;
        b=DKBRTvtcDoAdupeGLvdKBjxsZOnuPORThx375SEX3c94jfX6Pffhx5xH3YCdcUktDk
         8RtUgM4um/ZK/GRKugStNQkcV3NNh6+H4BhAdOqnnQ7MhWjaMligFBl6ArCo5HL+tODJ
         LphZpd4ve9qyEq0Mo+b1iID54E/1c21MHj0Urpfj6/yjhpa0+RL401EJHDwmg8+/vn5E
         KI05vXBgHusbGxk4mg6mf3W1JfiPIYmeDiT/Gd0N7DLhtLB0G6M1PZFl2ORfAIClUN0H
         URVsOSBV6rAG17C9j5Z41C/vIw5+dJYPwpNtzBWy9i8KSLS2bZZbGo1LQdFPTzPDTR3+
         STEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843309; x=1760448109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=264X1qDN3aQAP8Oh7tuky79CRF6X9B+bbwWZ9c7oerg=;
        b=grJf1/lEP1ccS9Ed0Cy+QxFigBw8zYB/voUfyqB7K2nTk4+bjKrI8R5l2xZisoIgQY
         jBITc90MEkktPIfhUq4GiCpxcPP4lAG0+SYOxdF5qUn8xT0HlXRG60yW2JA/z5HJl2YE
         PBjfj+VN2ZvVxuLVruh2c2z6XTx5e6CQRFO5+FNW/Yo39SiqhMsB1vYPmEMnJ21iQO2M
         wLoKcCpSAY2AUldvX3iutHR2TUGNySIyxi7TG50X+RRCRpMWDmuLTLr/yGrUMQXvbEja
         OkQ3hfcjO6z9moNt/lU1pGHKr8CFLIUndS6yJ7ddT/K5xCWSrLn/X1+gtQDzSwGtkOd/
         HYeg==
X-Forwarded-Encrypted: i=1; AJvYcCXO8xoJmNK2aMcDyl+QONmv4IZngKXvtD0zB/3pyXQD8DytYIwJC7iqGlDP/QaCNia7Mrqc+bq5hKW1@vger.kernel.org
X-Gm-Message-State: AOJu0YyjHH9Mo67cEyMFrIn+oLS8CW33N7Fe9REQKhjEjjPjXm6vKg4l
	33psMEPEGb/Hp7VjHC2FBvTvaS/OhiJAxAxeGRbDzP8hWHHum0mqhVz1PMA45CizqtEaQo2FA5b
	DjO2bAlqcEDB6h4rpa6JmDmyJnfxwRLXv8BSXQDi2Nw==
X-Gm-Gg: ASbGncsZseQPWktuZqFNmCrb5soGd5iy+cFKA+5ZfQkme8TLr/ewu7BT8GupOyW2CZ0
	jXknnAXtIGNHo6oycxBMJANanbB6/sQiH8MM4NkExJ22JIDJ3s2ahyDxEIZbUFA8Stjj98LBrDy
	yIpmUYn/Yzah+hZXnxs2uQIWOwXMdhyknF80soVZQmGK3gY8QjG8TrrGXPzduyCm5BJZaJhmy9P
	cZ7iD+Kk21rOQ8c201K3XFb0NKbIbNPDQW8xRREQ9kifIN1Ab2Ax7+6UjZdKlY=
X-Google-Smtp-Source: AGHT+IE2+IZs52lFcgfooqKpv3k1qTzL2NCFC1USj9Z26FyDVKNO8SnLmrjpEF3qS87kcFqgJsuw+/Q2h1TIfSrcKYE=
X-Received: by 2002:a05:651c:1504:b0:364:c083:2fec with SMTP id
 38308e7fff4ca-375f516a094mr10405761fa.7.1759843309309; Tue, 07 Oct 2025
 06:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org> <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
 <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org> <CAMRc=McaZV=tUkzDGMYxXqkuEYw_KasKcv8QGdjw709UYZuGhg@mail.gmail.com>
 <a9a4f33f-b6c5-4c25-8321-7b08a2afb8a0@sirena.org.uk>
In-Reply-To: <a9a4f33f-b6c5-4c25-8321-7b08a2afb8a0@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 Oct 2025 15:21:37 +0200
X-Gm-Features: AS18NWAcsMukxeTYbTWMUg8zWpW3gx9qkOJvdBd4XuNGAXfy8hVOWJV-QYlmbI0
Message-ID: <CAMRc=Mey+iRyKY7Ou=0LM1268r6_WuQDzYmLOU5MZbVoU1yugg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 3:18=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Oct 07, 2025 at 03:13:29PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Oct 6, 2025 at 11:55=E2=80=AFPM Srinivas Kandagatla <srini@kern=
el.org> wrote:
>
> > > Yes, these codec drivers are due to be moved to use reset-gpios.
>
> ...
>
> > anything. And what about shared pins other than reset? 'dc-gpios' for
> > display, other 'powerdown' instances, 'enable-gpios', all kinds of
> > uncommon names like: `dlg,cs`, `wlf,ldo2ena`, `speaker-enable`,
> > `maxim,enable`? It's not likely we will create a separate abstraction
>
> Many of which, crucially, don't actually reset the device.

That's my point. While the function of a `reset-gpios` is quite clear,
these are not.

Bartosz

