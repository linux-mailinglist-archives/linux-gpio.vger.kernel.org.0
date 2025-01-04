Return-Path: <linux-gpio+bounces-14508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD13BA0159D
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 16:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B7101881477
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 15:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD841CDA19;
	Sat,  4 Jan 2025 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGbp3s53"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B0F1487E9;
	Sat,  4 Jan 2025 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736005510; cv=none; b=tpsJJyT12qhIc9m5h6BUnbajbkyZui7reR1WNhNnM6E2JfsR+XGQVGWdkPGPl7U6ac/MqCa+VMU7JanD/QgaCS/tp1wqHsdtq4lT8hesDrTPr9Wx+OHeBxbNAha5PRd2WF+QWp3moz26N8HmaqAb5nN7ZC++bZLclv/tBHlKL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736005510; c=relaxed/simple;
	bh=9K4DoA4/eNp8pTk7iODtQSs3B/9Q7iO/42kwKf2Gk6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUm4qXEmWNb/eGv4DV88gx5BeRoZjObRIhva/pzQ8o57dCSCG9sAz7kAtDudedPPTIIHBDT4U+w6QARoFOw7jqLUii3J89mWMwLrXSAFbrh4um/snpTnn0j77j/IvMCmeJvBwGSgA77c0uMxNC9/sL2uR9Xp+C2ChseqyI5SGF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGbp3s53; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso14916269a91.1;
        Sat, 04 Jan 2025 07:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736005508; x=1736610308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9K4DoA4/eNp8pTk7iODtQSs3B/9Q7iO/42kwKf2Gk6M=;
        b=LGbp3s53W5kT7yVwKFQLSJYX4R544WjkiFew2tZq9ivJFRRGu4RpXTAzyQu10Ebr22
         Rt52PJhFNoJeIYSXXFDXXjptN5+RL7tn9uMWilFfxpG9scrB1u9udBXX97vUSzwxd1h5
         l0lXJzG83CYBphsfe3EIwy+8iDJl/TolMoD6yOUsjcpvFCk3oB6LM35Ip7orMRBurUFd
         92oJre3JauRQkCGK893hsMYFRR+BS6SLnjbMKxmxqziROMveWP1MFcqAKXbK9q7SXCgI
         fsB+hRH0ZZmsDnLotRg+KJiDS+c3sGmTfa1xhol/jzfVf9BKnP/T0liYoB+LFvMlOLH0
         FTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736005508; x=1736610308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9K4DoA4/eNp8pTk7iODtQSs3B/9Q7iO/42kwKf2Gk6M=;
        b=E+JXrS0SMB7GQBn9T62o1ofva3Oobc+ctCKtTZizsV0U9mDszUpiGcUAjlq2/tmrzS
         sBsSSFkQwL6rHs81AKZXgMZquCqJj81HpQ7NavOynP4p2e780QtWwZtNs43t9FLMLkRY
         2Wrcg34wNhLdTR4j5rkyz4nlfwMKxIca1M83jMqxW1G0z3lulTeslp42pT7DbQo2nvtB
         2XkTllC+8QRT8wJsj4MYliEdRegetQCc9g/08i/zOcEoBTTtPEXp1ot2IGwR1ToNS/Ex
         i32SfPqXjnUoCej+7Cfm8m5HbkwGLD0kQUQ5QuWifGfyhq5JXR1GHpVKjkNd3GNKie9r
         53LA==
X-Forwarded-Encrypted: i=1; AJvYcCUtZhfoy8RbP75MBl+6drNQ9UOMmO8YKwBflaZBU114+u1H4yBlQKETOjoItE5ojwkT9smpxHfdg013M5RF@vger.kernel.org, AJvYcCWrU4yabCLUppuNQyCERPe0CLTtnsKw5iHatliAWB1fK2NdEDWN9rYUtUsoJMjmSGQKeUNo3ghe22xf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ljfc0A9FK9yp4xD4j1ukXyDFuYZw3jdmdWupiYgonMbS4Kti
	WtN1R6nx7TT6+zrcaNsaL/7CD0EywIgb17gf8/5mPvPfskLXZ8y5CIFkT06dy1Ws9HEoYVK94IQ
	gDocQxG40tcW1jAtVSeLTEB210k4=
X-Gm-Gg: ASbGncsojf6FppO7qA47UncW+6p3vZ5oi8jl9Mt/OcM+jnHdM8ZDHv4YE9rR5OCGTU4
	AEYwIDgA5KL183g7BWygK2Ke/ZOtqb06FLw4RIyE=
X-Google-Smtp-Source: AGHT+IGHuAsjJFky8YE/Q4ytPMpZgiAd7l0PVMXKnjIBR6qe5MY2JkbOUmyQdtdddfecriOUwB/W523m7e86gUNaGd4=
X-Received: by 2002:a17:90b:534e:b0:2ee:7a4f:9265 with SMTP id
 98e67ed59e1d1-2f452e22c53mr85072579a91.15.1736005508135; Sat, 04 Jan 2025
 07:45:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207223335.17535-1-kylehendrydev@gmail.com>
 <20241224103645.1709996-1-noltari@gmail.com> <CAOiHx=kvsCx0cd5C8eza-V7H+ML2ff5zB=vjM6zDmb0A7d16+A@mail.gmail.com>
 <07a21d3f-539e-4609-bc60-ff320935db8a@gmail.com>
In-Reply-To: <07a21d3f-539e-4609-bc60-ff320935db8a@gmail.com>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Sat, 4 Jan 2025 16:44:31 +0100
Message-ID: <CAKR-sGesWUbxQY6SmeW4mGM_89=SkNMbL=TJJQtAiDKMjC6y+g@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: bcm63268: add gpio function
To: Kyle Hendry <kylehendrydev@gmail.com>
Cc: Jonas Gorski <jonas.gorski@gmail.com>, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El vie, 3 ene 2025 a las 4:04, Kyle Hendry (<kylehendrydev@gmail.com>) escr=
ibi=C3=B3:
>
> On 2024-12-30 08:42, Jonas Gorski wrote:
> > Hi,
> >
> > On Tue, Dec 24, 2024 at 11:41=E2=80=AFAM =C3=81lvaro Fern=C3=A1ndez Roj=
as
> > <noltari@gmail.com> wrote:
> >> From: Kyle Hendry <kylehendrydev@gmail.com>
> >>
> >> There is no guarantee that the bootloader will leave the pin configura=
tion
> >> in a known default state, so pinctrl needs to be explicitly set in som=
e
> >> cases. This patch adds a gpio function for drivers that need it, i.e.
> >> gpio-leds.
> >>
> >> Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
> >> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >
> > bcm63268-pinctrl implements pinmux_ops::gpio_request_enable(), which
> > should automatically set any requested GPIO pin to the GPIO function,
> > so explicitly requesting the gpio function for a pin should not be
> > needed. Is this not enough?
> >
> > Best Regards,
> > Jonas
> >
> >
> I assumed that as well, but nothing I tried worked with gpio-leds.
> gpiochip_generic_request() does call gpio_request_enable(), but gpio-leds
> uses devm_fwnode_gpiod_get() which looks like a different code path. The
> only place it seems to be configuring the gpio is in create_gpio_led()
> where it needs a pinctl node in the device tree. That's just my reading
> of the code, though. I haven't set up a ftrace to verify it.
>
> Best Regards,
> Kyle

As Kyle pointed out it's not enough and gpio_request_enable() doesn't
get called from gpio-leds.
I will try to investigate this and report back.

Best regards,
=C3=81lvaro.

