Return-Path: <linux-gpio+bounces-4156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 139C1872A50
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 23:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5336EB2986E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 22:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F48B45976;
	Tue,  5 Mar 2024 22:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E0nIBbga"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7984D2563
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 22:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709678303; cv=none; b=foAmesXX3h4x6FjieP0/vx1KtfRfi/sovFHdVg9X+C2wU2xP0WNraiu5QoPXepITp+v87q/wspUAk2CnI7FF5GsMUujRzhykFcmOFuQ5aRjVGjQW+AaBh/CD2sxnQFVWqXrfGzehViU0cimxY9LahF0n2J5T6Q5OQCOWyz9uoAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709678303; c=relaxed/simple;
	bh=tr8cuN8eiNyeTHF8XhEZZz5dVgyQvmFFJHCxPWNCgNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4m3yzsCkqzLXlxHxI8N+XDt867wrS4RVHrHuhKqO4MUlC7bBCltmCyOQrp+GLGhgw0oP1Cc4ruXpqee9l1RkgCEBAzZ7Qd5wtu0S1N4N/uxEJQy8MmXqT0gJmhBiHHEy6NtxTC81gymAzUuAr2p2fAVf1tolNe06tYJjIJjGAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E0nIBbga; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-607e54b6cf5so2355977b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 14:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709678300; x=1710283100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsIpNJ0fOSsx2VEPy7OeOZJN1NnIFInF2AMVJtSc1RI=;
        b=E0nIBbgaA5PFfAh19RBC7CNVL1HHeBD8uHlQANQSmADdPX2UOevYaUIf2kT6XK/BOe
         yDmN/gDKA4NsrRB9gE1tsZT4h9ZzcAuSi+OeDi3xd1hwEQJsMrknhCoCIFKIc8P/QbJJ
         ua0fcGbXJK0s084mbtmfcHCp3qInuvo/Z/ruQ0PK/DtlG2cF60bSliGM5yHDmlxqDCY9
         1ZKGq9gxMXrgqg/dTnUG7/u04gFlk/0U7QTfv5TdFo4aButMkZVo7bbgJ56FjHmZRLrH
         mbRbWinPkkjuh2vADAF0pnhFmAW2Qy/w9skR9myy+D/2LQY+0NEi1r44RRN2amA92EH0
         TPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709678300; x=1710283100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsIpNJ0fOSsx2VEPy7OeOZJN1NnIFInF2AMVJtSc1RI=;
        b=wP5ApiwIWN1BV4YqoIOaqGIr9zyTuNz1wW3el20VzUKtiMy0By/x43rfq9amTlwd/i
         +7BD2Ko1wIDfGrt+gtPNeiV09ChiDajpR7G0cynVPsWXAFHnaOix5GXm6N9QSkxA3Jtv
         0KZVPtru1PUDrSKzojey5ElKXx1LjwFbKScPJAklxzuMNfraeG40IiHQoskzXAakrKFV
         NDs6+27a+ntfb1JuhTcw95CKHYN2/rX6eEbZ/eryDfqqTPvs84qqRE8sAdCz30WSHtOq
         OhCcCA359SCbKvYMQn8Cx4hFuDjfMPXxf5Aq+5K2i9HFSGmSGORGf5VH0oJFXOylYbNR
         yPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV+kcsRTl9txUJfAJY150uurdvh3EpoZgOKmlgylqslLYgYPKLInEyWO12Th5Fkq5QhqPomadtg0cQQyMkUpomAVBYLQ/R3tjCwg==
X-Gm-Message-State: AOJu0Yx56uMtlCGueH7UR6zmQLKScWOb5hnX61UfZPWLAy/VPJIo+OFr
	nF80AQPwq/mifIVHUeMZYEKabIO39PDIEzEra12yQ6YN+L7J+FZ6KJHfwkYEqU7odJd6e5K6Rst
	UeJGeKpT7DadxnQ9mjiEXnzIj2BXLehMV1iNAjQ==
X-Google-Smtp-Source: AGHT+IGlMUaJmKqYb+CumU3CqP+xt1j7u87xkcMoS4ZwA9fnFpyww9U38W0GHDSgcd7vceuu+QntQXXje1CKFU8m7Cg=
X-Received: by 2002:a0d:eb4c:0:b0:608:d153:3d41 with SMTP id
 u73-20020a0deb4c000000b00608d1533d41mr3028919ywe.24.1709678300410; Tue, 05
 Mar 2024 14:38:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240303140137.157522-1-wahrenst@gmx.net> <20240303140137.157522-2-wahrenst@gmx.net>
 <CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com>
In-Reply-To: <CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Mar 2024 23:38:09 +0100
Message-ID: <CACRpkdZX2WHCggT2hvS86eLUq3pH6jYYpEFLbY4WwN6_Ya+mQw@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
To: wens@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 3, 2024 at 3:19=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrote=
:

> Hi Linus,
(...)
> I'd like to take this opportunity to ask about INPUT_ENABLE and
> OUTPUT_ENABLE.
>
> AFAICT from existing comments in include/linux/pinctrl/pinconf-generic.h =
,
> these two options refer to input and output buffers or connections within
> the general electric path, i.e. it allows the signal to pass through in
> a certain direction. It does not refer to the current selected direction
> of the GPIO function, which is covered by the PIN_CONFIG_OUTPUT option,
> and by gpiolib, if and only if the pin has been allocated for gpiolib
> use. But it seems multiple existing drivers do this.
>
> What's the correct thing to do here?

It's really up to the driver author: the text in pinconf-generic.h does its=
 best
to describe the intended semantics, but sometimes hardware will not fully
match what is said in the documentation.

I guess in this case the PIN_CONFIG_OUTPUT_ENABLE and
PIN_CONFIG_OUTPUT is not two distinctly different things for this
hardware so a reasonable semantic is to implement both in the same
case and do the same for both of them.

+       case PIN_CONFIG_OUTPUT_ENABLE:
+       case PIN_CONFIG_OUTPUT:
+               if (fsel !=3D BCM2835_FSEL_GPIO_OUT)
+                       return -EINVAL;
+
+               val =3D bcm2835_gpio_get_bit(pc, GPLEV0, pin);
+               *config =3D pinconf_to_config_packed(param, val);
+               break;

Does it seem reasonable?

Yours,
Linus Walleij

