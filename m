Return-Path: <linux-gpio+bounces-19742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F2FAAE2B8
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 16:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9A0C3A388C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 14:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C57028A404;
	Wed,  7 May 2025 14:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LtT0ylzm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA5F42A89
	for <linux-gpio@vger.kernel.org>; Wed,  7 May 2025 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627202; cv=none; b=eUGJEDZnFEWycZRtg51xn8R3X7P2nii2NRjPqo6v66d7pvLvJ1EY+ni+W/eDPQhhlCGFSXkN1cvF+Nr5Lzdywclf/icp+qutDMPWiL899ZYm5dq4cxFsEjZDu9qY3lsvBtUYKcZ3QzgDR8hSszpPLTzXYkbDlgJavJLSpv17gRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627202; c=relaxed/simple;
	bh=eXOONkfVY9iiUi1gt/PCl2fNqtt2ZQN4P5+cb3Bcn+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/NlDM0rWqXf/5SA0qQMDCTwmNletOpaYHIe7IBvvClm3xY4zdiyQ2+Zb4RvY5C1VdjtWUI4y9CEyyaXut86xObIeqc54Zn3v4MwBvexJBVn0QFAWEzBzaW1n+7ry2lfcR/lSwxYhohzU2sEI6JPS4H9E79f7W68vzBtWbnqut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LtT0ylzm; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54e816aeca6so9138729e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 May 2025 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746627198; x=1747231998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XKwR69PLxxy85KWouRANyfmgCyvHOTmvcG/jK1yua4=;
        b=LtT0ylzmDO4XJGxdYMDWNQ4Zcxtr6FlQxIOQEnXDNevgtLtQYaA6fXkKn0+SYCWUSY
         gsCGowvoLCqA/PTRZi86e5GJXoM1HjJeOZ6H51V0aJS5m89b61XLZBQCI2ZdgBOyzVXN
         zt+3smG2DVBDdwVbaM7sow+QY5gyd6nQ5zBPX7ONmdgE97l0gUCRD5bBHk/HDELXTioL
         3ayCDDEWjLh052svgNiAXSZNQNG7B2vuQwdnu2EuWPwwe9YFb1GEIGwan9/I1KYJNxSs
         dM7Rf1w+J9PwruB4posLjeD1LAFaSKJ90SkEq3UQbdbTPpoHI1bg2fcO/Q+tsNTyXxpm
         WwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627198; x=1747231998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XKwR69PLxxy85KWouRANyfmgCyvHOTmvcG/jK1yua4=;
        b=twAn4hYoGjDXylr/dLhv4uytC7ilQ1/DF+xrwP+Pp48Nh8qnL38Yfige2ThVkwn3Iz
         vrsspZWgWX6iCw7BHKzapyBwbsHXszJSDOrIuagRnHj3CHX0dbr4luWGCrrbjilkwJeM
         Lf/Ctr2wV/zOdWV+Gsmi+TlbrM75yJYNbHo+PFeiDHPPgWmbrhfOCnl2X0OdgQP8QoF9
         V5kgnf5aABv3+KRTNUqILOjEKw3vOJBV6NrsnNWhfhSawi0pUtGM3oAZpSkv+gXS17NC
         zs95d2zy+dXZ3UG4SoqkIFwGYemI5NpVQkRylsfQz9UqPufHyOUdNFEApYolESK0b583
         e73w==
X-Gm-Message-State: AOJu0Yx1NZFRus9/gcoZo0jxxlMRlo/HF+KejqXSqH7vAuXlxGig6b7e
	VTwpZbgSLQ5JaDZR3UVRjhy5bMF/IanTzzTCi4P2fn/vPdxel95pqpMblNt1CAndaWYbAqA+v0O
	VGSWzmYRNKcbJE7Ca3FgVaN/Pu7MHhZpC2OE36Q==
X-Gm-Gg: ASbGncuVpRAyiU7FNwpUqQgmO0n0TM4HUUNh5V2Wff6seYmmiLD20jxFVRXxAMVQMmT
	MBELFX02xxGp2sOaTW3kihQFqiSRnbqBC7D7qe3erqhhtOsljrYdf+7/Qpp21wKNCr0UbpaP7iJ
	IrgU46t6BMfOVrF4k/EqZa65aepAE2nwDMIcJY/q6iBbhF2OV68hbnBKPEId8P3kxt
X-Google-Smtp-Source: AGHT+IF+13vH/Tucy6FJc2tpu4ONu7h+cxvpO55vMEqjd0zmlBV2H5HARIILcufF+MpkR2WYpDhimLvao4XJprqEy8I=
X-Received: by 2002:ac2:4bce:0:b0:549:8e5e:9d8e with SMTP id
 2adb3069b0e04-54fb9241b25mr1617333e87.0.1746627198587; Wed, 07 May 2025
 07:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1d00c056-3d61-4c22-bedd-3bae0bf1ddc4@pengutronix.de>
In-Reply-To: <1d00c056-3d61-4c22-bedd-3bae0bf1ddc4@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 7 May 2025 16:13:07 +0200
X-Gm-Features: ATxdqUFYChlfm2buzigbVf4BUVqPRkb82fOcIeyCaDTbI87U8XuidCIMw05XLeg
Message-ID: <CAMRc=MejoUX=ZWe-BvwnRnu7-k5=g+y6hVcsLFzEp5CY8eyHRQ@mail.gmail.com>
Subject: Re: AT91 GPIO driver reading back struct gpio_chip::base
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 3:15=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix.d=
e> wrote:
>
> Hi,
>
> just stumbled upon this comment in drivers/gpio/gpiolib.c:
>
>   /*
>    * TODO: it should not be necessary to reflect the
>    * assigned base outside of the GPIO subsystem. Go over
>    * drivers and see if anyone makes use of this, else
>    * drop this and assign a poison instead.
>    */
>   gc->base =3D base;
>
> and thought to mention that there are drivers that indeed rely on the
> base, e.g. drivers/pinctrl/pinctrl-at91.c uses struct gpio_chip::base
> to find out which bit to set in a register:
>
>   dev_dbg(npct->dev, "enable pin %u as GPIO\n", offset);
>
>   mask =3D 1 << (offset - chip->base);
>
> This needs to be fixed of course, but I don't have time for that right
> now. Thus settling instead for writing this heads up. Maybe someone is
> motivated to fix this and then do the equivalent of
>
> https://lore.kernel.org/all/20250507-b4-imx-gpio-base-warning-v2-1-d43d09=
e2c6bf@pengutronix.de/
>
> for AT91 as well, given that the driver is DT-only. :-)
>
> Cheers,
> Ahmad
>
> --
> Pengutronix e.K.                  |                             |
> Steuerwalder Str. 21              | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |
>
>

Thanks! Would you mind adding a task to the TODO list under drivers/gpio/?

Bart

