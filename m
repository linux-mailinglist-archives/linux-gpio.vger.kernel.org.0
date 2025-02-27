Return-Path: <linux-gpio+bounces-16696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6828CA47C21
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C15F27A63FF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 11:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E15215F45;
	Thu, 27 Feb 2025 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="s8qS3njr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A961022B8A6
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 11:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740655261; cv=none; b=e6kV8O2Lw4Yh8jfiEMOPuWvUeeLUPh/SGTFxNgDT0/Q5WMdWle2KHGYB8SQAQWcTy54wnJLTS0V2zF+UL7D53pvpSAlYPM6IO0eq6L/eOKGmmsVsK23cwI4LPMaqqmUZ7b/nsvND4U19YkJDJSXov+PSs0CJgSEf/f8zIA3DdHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740655261; c=relaxed/simple;
	bh=0DiUTlg4XJVDR7FikVfnCgFJglgJX/9DDnrGyb8B24s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=chJqEt5iApWR4NgX3JLvA0DyXKSJv6q/sk77K7+7i/ERNKBqV7xgusWoeBrPN7zSGuPXyQyaOfX76tELED1ABKtD8TB9N3GJwqi2jAeTRL8RLt5WJ+TL0N7PRLClZgHhjRjVVvrrMUG6XjVeN9H4zuZnavayAAiidPvIoS0XolY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=s8qS3njr; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e033c2f106so908596a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 03:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740655258; x=1741260058; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hoTMUaP3z5B26KxsVQ3DSL5qNPShMYOj00+HkjYilwc=;
        b=s8qS3njr3yEf6Dwg3jbXlMvnEigUALlJWvZIHdH4s7Zmkl3e/Idz9CIV9nyq86t7+S
         PtziCeebyvNJcewJ87TkfjFfiVkGt2CxX4vTYKYS/U2nur5DengSHcKsMWoPCJb0HHce
         X6d5ey5ii6cN3alHZnXp8pD/9R+tVZ3b6rUz/3fY2BqWN/KG5ymSgDOLvgqIdU7kXs9k
         xVT7kfohKps7zt5PgcNYMJ9QdDqlFwKi55Fr7H/fL1IdW7G9R1NvTyRFQAVBg+tFmZKc
         ftfy/wIhJSWP1GH0hyteu5n3LwybQwwBYRiGG1Vd8m2uyL8vWgP8CUxslnfoi3IkW8BT
         6GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740655258; x=1741260058;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hoTMUaP3z5B26KxsVQ3DSL5qNPShMYOj00+HkjYilwc=;
        b=HL5aMQuZuuXJubbputj3/H1ptdiMbI9Yt8xkakvkmulnTv9iUxuu7/5Dd1S/ED9ovq
         LpSccUksSPEOvhJ3PAvoZjKIe8NuceaNbEdiUh53Barg6nIwmzvFheljOe2rbebB/glO
         SLpIwaO3KvWl2XnAEtXm0ieBSDY9W/G7E4OA01hinxR0jtEifZxP0Z8jWeBhzIZg8fr/
         z1E4xpBFHvyyVJpMiY7Gxmt3jqu680N0H0YcwTQmBj3Fupw9vHtUsFK15FP4/xploOsA
         YcRly0EkdXruOx/kjNQKyWzPdgdmD7XrA6QaF2pFlls9O0RIn28RBGRk6rrusvNtSzDK
         9hjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm6yG7kDXKjedmV/8mJY+8/DygBYwaQ/n4/V/JuFqJvzPWzWg+vq0hratsJPjz3JBUDFJxgVctU46Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzxiOiq/EM29aG0DlPrNJlBKynXOvZt34gNjRxfQr2/aUnuFnEp
	6Ldl9l0j0WutJz5Qeh2wwp6aCmuL13cG+pRFR5W3EiHH4+MCRWSP6lgtwWZxLJ0gVBAJA6QetVW
	BvC3OqmWdEOeN+NBkVnp68g1jEn0v8Tp5WCge1Q==
X-Gm-Gg: ASbGncs2pVZFfRQVW/ZWLsGjk4v5ve7eVJsBIFqAmC/ga81RUdehl09NGL5w0DE6Mtd
	YB9Mwk2IZbD/EUWmmXw2EC02ryUaBIuoUfQG4l+EWXp0sT4c6+nzJytpRA/oJOG4rFGZToeGXYm
	H4so/7L6sf+6GNf3cYV1slopA/za6B6mgDFjN3JVA=
X-Google-Smtp-Source: AGHT+IEUGma5IjG1r/UX8g9q709BN4AO/vykF7NaRi1NU68c7CliJ54OpPPR7RvRTriAOWe0UDEJnIAF9/5frMgHLOs=
X-Received: by 2002:a05:6402:2813:b0:5e4:ce6e:388b with SMTP id
 4fb4d7f45d1cf-5e4ce6e3c8fmr2172198a12.6.1740655257907; Thu, 27 Feb 2025
 03:20:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 27 Feb 2025 11:20:48 +0000
X-Gm-Features: AQ5f1Jp1WGsCr7b9jm49DDD5LmPUb0TBjC4QOFwFIIaHedAM7-T4oXQotCPW6l0
Message-ID: <CAMEGJJ1T-at4YO5TfR6y38JOkYKdEwz-CSeejoig8CzxTeuj3w@mail.gmail.com>
Subject: New warning in gpiolib.c
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

While running the latest 6.14 release candidate I noticed lot of log
spam such as this:

[    1.315766] gpio gpiochip0: gpiochip_add_data_with_key:
get_direction failed: -22

It appears to have been added recently, with the intention that this
will eventually become a fatal error once all GPIO drivers have been
"fixed". However, I think the error return here can be appropriate and
useful.

The GPIO API is lacking a "none of the above" direction, for use with
pins which can be configured for alternate functions (UART, I2C, SPI,
etc.). Is it considered preferable to lie in such situations and say
that the pin is an input? If so, wouldn't that make it impossible to
detect the genuinely invalid (as far as the API is concerned) case of
querying the value of a pin without first making it an input?

Thanks,

Phil

