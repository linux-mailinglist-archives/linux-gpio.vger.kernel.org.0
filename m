Return-Path: <linux-gpio+bounces-4636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2AA88C156
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 12:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D46D2E4D8E
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 11:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0816F060;
	Tue, 26 Mar 2024 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PEZXVVHe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3CD6CDCC
	for <linux-gpio@vger.kernel.org>; Tue, 26 Mar 2024 11:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711454335; cv=none; b=avBuqzBGuenn1s2FTVQIA470z4+jnjP330jrxVloPaZak/tMc5RCiwGLLokmE7hCOjRGXEmeBvLYJiqOPBYBw0eNT1t+o/YZXSjLovRuJ3ip+ve+77fDk7boukSf+tkPEohhfkqlWsNOZb3Aq7tjbvEHWRso+j9w7OUCZvJfPQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711454335; c=relaxed/simple;
	bh=mSuJQzY/x4nFRGAWr6w24/5X9mMqGb6qSo7jdxE2Vfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3CLyaP5vKT59utpjmftOSEJml5gIg4uK7d3m6yZ7YTIHikt3w57d3hilgt4Ur2OGiRbPXIbwNOGYCsiCizGn6GxCnTs0qOSgVFID0By7D7Ox4dsDW3My5Cffg7IPVZbIfgWEYwqVIPBWwwmT0RekyxT0bV6xsv9g127m22q5yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PEZXVVHe; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d41d1bedc9so101220591fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Mar 2024 04:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711454331; x=1712059131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zL/jmxxtIm5wkejRdpCLJvo91BH250kAbxPb/fDHf7E=;
        b=PEZXVVHeSd2FtVWuReIHQGluKEAhwSGNTMy3bIHvL9ZgJ3ub6nK8r5XSqfuBxIbAHO
         vvYOvVyi6iJN+pKzzO7Fe+kkK7l2T76OpJPNNEQ+TDKQUDaP8YvAkSrlcookVc+5thfG
         PlNNeoy5IeJDc9qSF2wGnGrFU+tHnpSLoP3GFySSDhKdEs4vPqGE/vaZ8DTP4NPAYv4o
         VPNF5JGnGwDoqiz5664WRwFtNGg5ZF1imCcAy3rHb5xnsXDy0VRmS4hqwfbZkoY55dUf
         Q7Zp0/BUeog4FN+ELlflCQdLzXC0lUQiBn6+Ruv7/i87jOCK4s/h78LvsMQym70UffJq
         BcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711454331; x=1712059131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zL/jmxxtIm5wkejRdpCLJvo91BH250kAbxPb/fDHf7E=;
        b=qO0WQkmMdawaueGihcQvzy8+GindLVCc8nV/dtb+ltWcex227Nkt5HBUwDzo5FbjJQ
         1vpNdAdTk2e2HSqzxOvqeJlFo74o9pMrgUA0Y04snGmtVg3S7tg24MDHWcuANS23VqSw
         TNUrjRBK6cSMi8Ickste4BobzILPdxtTEexuxUo4Q4IQRPfj7iM0XUk+DouHYY3sson2
         is5MedMBF2SqzqaVf8WGribSOMwKKwhYf6i6XfO+uTDOlrc/hiGCUCK+DT171FK8JoTo
         cOMGA29HyHyN0UCA9sV/g3d9Y14apYdd7D6aK9SM7DeJ4302U+pQCeNZ5clfnw5QqzTt
         Zo2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAEaZoCe1h4uULBi7y2afVYPdvbybxff9tIlJFBlQTkImFQhqx5KTsebiJpE31u5trGUuVlmKqTY7YncXbsz4XFw/cnBq0cgoiEQ==
X-Gm-Message-State: AOJu0Yyg++5niM49zlD5xwjhAVpAfGZ8ZcxV71IsZxZsYdQZd6rb//TH
	yeqOVk3SG4Qfs49A19cPfKvcVWjiFj/r78E4zCRADVb5v9Zy+XncBLNO8keOrasaMB0YIPPvjOQ
	UdVTzMQMXlBidliVjmWM+ximCbbz8QionH0dAU0ICk1NBMLh/
X-Google-Smtp-Source: AGHT+IE/wUOqdcPxZFJQNNGXgXfUkl7+qojfXRZVcxjVlMA+00ZQ+LEJXyyGYTRHAzgyIuUAeJ7COMQDg6fwlTUM2JE=
X-Received: by 2002:a2e:b90d:0:b0:2d6:ba1e:a54a with SMTP id
 b13-20020a2eb90d000000b002d6ba1ea54amr6581217ljb.51.1711454331513; Tue, 26
 Mar 2024 04:58:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325171804.3375280-1-andriy.shevchenko@linux.intel.com> <20240325171804.3375280-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240325171804.3375280-2-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Mar 2024 12:58:40 +0100
Message-ID: <CAMRc=Mcf0b0HwAcT=ZQ31rdsuWSDJkg=r9Z6Ni1Tcrg-KCsXsQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpiolib: Fix debug messaging in gpiod_find_and_request()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Ferry Toth <ftoth@exalondelft.nl>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 6:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> When consolidating GPIO lookups in ACPI code, the debug messaging
> had been reworked that the user may see
>
>   [   13.401147] (NULL device *): using ACPI '\_SB.LEDS.led-0' for '(null=
)' GPIO lookup
>   [   13.401378] gpio gpiochip0: Persistence not supported for GPIO 40
>   [   13.401402] gpio-40 (?): no flags found for (null)
>
> instead of
>
>   [   14.182962] gpio gpiochip0: Persistence not supported for GPIO 40
>   [   14.182994] gpio-40 (?): no flags found for gpios
>
> The '(null)' parts are less informative and likely scare the users.
> Replace them by '(default)' which can point out to the default connection
> IDs, such as 'gpios'.
>
> While at it, amend other places where con_id is used in the messages.
>
> Reported-by: Ferry Toth <ftoth@exalondelft.nl>
> Fixes: 8eb1f71e7acc ("gpiolib: consolidate GPIO lookups")
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Tested-by: Ferry Toth <ftoth@exalondelft.nl>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

I queued this one for fixes. I will take patch 2/2 through the
for-next tree as it's not really a fix.

Bart

