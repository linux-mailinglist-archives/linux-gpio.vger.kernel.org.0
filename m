Return-Path: <linux-gpio+bounces-4879-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6A89207F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 16:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 522C4B388B1
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 15:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C477526293;
	Fri, 29 Mar 2024 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s9cFiy5l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85B321364
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711725407; cv=none; b=n3xNTkn8vLL3kfpeKoTcjh7EyRatg8am4sekg3k+HnGaflLlwVr24GQfjUflTy+32L3pBClX6r5y08i/2ltD7edOzxvBQjdyt5Dqctfky4z9IR88yJrnHeJBUhtoKsmkiJDEsIRL2DhpQOKYHYxWOwYlPuRVYiE48zkix0nua28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711725407; c=relaxed/simple;
	bh=bXqO9ldKgORkZ+8U29cEO9eCzS1Prl/TZB36JmaV/hs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYSG5Ylwjpwhpvhebxfr2T5mDyHIztbvKSWc31QrPrYEyGNlTRI036c7PGebYmtS69MHNNyFjtCEvGy0SSBzuIRiGsVYKE75VX98aMOaDOerEaXE7n4EB+AOfjPMrJ6PXWzz0Z6F5+8f1r013fMzFU3MNndIjkDwoQs6D43137g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=s9cFiy5l; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513cf9bacf1so2512249e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 08:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711725404; x=1712330204; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DqNwX/X38tayRDAW4Zlj0+695u0d2YomcEbZiHh9vxQ=;
        b=s9cFiy5lFTXh1NSbsmwU1ApVISQdcZ3CD+xGi+nSCIXBUsQDSAVGQYLhJhsbMEbBkv
         UuU8Yt/PyYeU4aFw3poNADsx3PCzuwKC2eQX+WYxCLji2+EycTv2Q25JWfqvDpFb3f+K
         DoOPGPj0CbK4M2O2VDc8oxyCj7LH1Zn+dnfj2xeJnSACb+okrFYOLI+BHGn4A72cGDJ9
         mbV3l819mhJB1C89Q4QthVTk6CfbsovR6hL3H0y2Ch+O03jzLHzHkUHJA2fLaPAmkOz5
         G5DYigp5+q5H2+/mc7dU9bK80RDXH9+Hx0sTT2x0phddFzaVuF2F/i3Bht16nLBdcQz1
         Zk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711725404; x=1712330204;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqNwX/X38tayRDAW4Zlj0+695u0d2YomcEbZiHh9vxQ=;
        b=I7hfJq3EWQ/DFCB7dNhpJ56Ual1+j1NBYVWwnEYvhBzdiCNih4s8pXphrVCVi/VcYU
         +dssg+lg7eIu23AkcSBjBjo3/p0QnoFN6Ruc9a8R39jh5NETSTNeLsvwIveKsKoxTM8r
         /6+ewoannEtaT5mE/FBLjdPmT3XJwFZ0vcmf3cWq46JrySfnIbY1gWEeqFAeA7bzRukk
         NO1+8JfdkkvjzFWyyLJcZY/HGXiPXLq/GJGKUwmVVtUcoxPMc7zWPwrJ8MJzwEXTQS5m
         MZs2OOezPDvASzmaunn2+xuf1ImbivF9yvpqxyPu4+4d9Z6Z4FfghQTl7TMPrAAJemMj
         ki+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdfPOEdRpOz9TmePoBKAeDQWUi2HGzbNIWx9/jda0Ku06RCPKFpPOzIh/ITfR5gsdD+OmKHNBIamaCHu6X9seVtyUWHZKOt3Itdw==
X-Gm-Message-State: AOJu0YyTwB2tzeW8OZCESq56AuriHtDtw5QbZ/xEE/C1bTdZAU5K8cun
	wuowoGvhJGEio5uhxmXG8OwDqWrFvpiX8c5MzplMRGL2GWkPRXgYRPN9t+CDiJiEq6/iXZsEdeY
	iiVjE2fagNjlIePZHRSVDp66aFumV/yRZwL4J/g==
X-Google-Smtp-Source: AGHT+IG21XPIIeej7UxBpa2cGsWVRF31o4EA+Zq7Y09z8tl5e0tGI8gOndkj1llDUytkKUy8+WDfp10/Oe2W/IeM0aY=
X-Received: by 2002:ac2:5d71:0:b0:513:c9ca:1333 with SMTP id
 h17-20020ac25d71000000b00513c9ca1333mr1655888lft.22.1711725403783; Fri, 29
 Mar 2024 08:16:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Mar 2024 08:16:43 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org>
Date: Fri, 29 Mar 2024 08:16:43 -0700
Message-ID: <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
Subject: Re: [6.9 gpiolib regression] gpiolib: triggers: kobject: 'gpiochipX'
 is not, initialized, yet kobject_get() errors
To: Hans de Goede <hans@hansg.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Andy Shevchenko <andy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2024 15:11:21 +0100, Hans de Goede <hans@hansg.org> said:
> Hi All,
>
> I've already tried to fix this, so let me just copy and paste my half finished patch
> to explain the problem.
>
> I was planning on submitting this as a RFC patch at least, but there are also some
> other new issues with 6.9 on this tablet and I'm not sure how this interacts
> with those issues and I don't have time to work on this any further this weekend.
>
> Anyways below is the patch / bug report.
>
> I'm wondering if a better fix would be to add a "ready" flag to gdev
> and may gpiochip_find ignore not yet ready chips (we need them on
> the list before they are ready to reserve the GPIO numbers) ?
>
> Regards,
>
> Hans
>

Hi Hans!

Thanks for the report. I hope I'm not being naive here but would the following
one-liner work?

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ce94e37bcbee..69f365ccbfd8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *data,

 		gc = srcu_dereference(gdev->chip, &gdev->srcu);

-		if (gc && match(gc, data))
+		if (device_is_registered(&gdev->dev) && gc && match(gc, data))
 			return gpio_device_get(gdev);
 	}

This would make gpio_device_find() ignore any GPIO device that's not yet
registered on the GPIO bus which is almost the last step of the registration
process right before creating the sysfs attributes.

Bartosz

