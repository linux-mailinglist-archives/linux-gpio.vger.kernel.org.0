Return-Path: <linux-gpio+bounces-11944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7162F9AE416
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 13:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F5E51F2386C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 11:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370A51CFEA2;
	Thu, 24 Oct 2024 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fuGNBr8N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEED1AC8B8
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 11:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729770323; cv=none; b=aUrHEk4gknmDkD4HcQtmz01N62uV1dfSGgsDGUKxp9DM0wJBYL9rjvJhpoORyuCXRVJyXJonNj/cMvR1A404AlmhTOoYzIi3hbJPAtIdfi51wIoPJ9suMwUfHt2hVsUrzGzAYlC3wZwqRUKQ0UhqkrfS5JM/KuoIRihlNjCbxc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729770323; c=relaxed/simple;
	bh=q3Im/x9816GQZIgTnDjRdF+oBg90Pj/N/S23Rklropk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIm0MecDEg8/G2qvYsUvE7ssy2kwuxhBEJReux4iQL/j45knDf4Cxhgk0/K3T3nf/2+WdEUKWJ6dgGWPUdiEfixobEAwkU//4wRVwhjgFh9Wm5gwa6qzuKW7VVI1sYu1vxqc0zjKNE1yZPjZbnVFlZxHZL+AXuSaGBxgZIMlTdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fuGNBr8N; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539fbbadf83so1117749e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 04:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729770319; x=1730375119; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eqMwQS9Wvwm9V5Q3IwKqnZIPpc6vrtzT0nsbOwiorlg=;
        b=fuGNBr8N/wBRvRQOkNjJRE9fv68R0b49HJHTZSMfLn8jtLWymW5uiKHafupIMc9tkz
         GUxPJEYrthmsJA8j/0x77wevkzvWidRDSMJJ8t89DQULcroKybE6aMKCBFiNYhb7LjUb
         MJY1QfTB+iqtBsvcERjfvt9LahIO98SXagQATItUp73OUVJJL7OfJ4iGvuYfbSNWLLnR
         aQ0oBGg3pOG4+TII+hJcGX/6BWXZeLQCAk6Hjhk8rX7HFQjylXTrcMtJKQesLxnH0d41
         QvsnA3WHvrE/2fwdTbW/K6Pnm6X9qXG645/AClfjx0tPsuIlb8vgPIWrRb7I4In24mX4
         ZE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729770319; x=1730375119;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqMwQS9Wvwm9V5Q3IwKqnZIPpc6vrtzT0nsbOwiorlg=;
        b=gp0SnW35H29rSnf3OZ2IYvqfxFjBnNZzBK0YiLRtYZXGtDFglam7Oags28EiG2NcfP
         CA7JzNO5e5tSfb1kfCcVgJ4bT5Ajyjbjfv8bFNc+WQqHk57/vG2wUFDT0TWwr4Qdh6Tz
         DeeWQ/fygsPXHYsmHuawn35gvhp5uSC1LJFnb11rXIy1m5+mxkP08jbZeq/PKdplAYSn
         nKgfuNHV5SqNMN9kndKkuzAkN3781MbYua1+BRy3X4w5jvOf1iF9YDpkyWyptRTXUYTm
         Lq3e30oVcSjD+P2DDl19WjoxG+hp/8V6PHNbq3zFgo+2ZlG3G0erDrjairlViHibVxQ2
         0YcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXemIyf4WaDh81Z938aMRDrq+nxiiRDb3c45JIrAMAyNwFBuSKqSOYSKDQA0vWGIYyoDj0LQuff3KoA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4StMQymvLdY8W8+WX/Yr5pmtZPA0rgG0cKvQBqK0mw+iDSNlR
	1DiOxLvIe+LQxfQQn4hcnGuDMmgC08V7+BMAXflmm2OulwwRWTFrSaUr+XC3t42KseYGlkUfFUx
	1ffONNck/jDe/EPDmVwRFzpY5zm2N0AjSiideDA==
X-Google-Smtp-Source: AGHT+IFJmvrvkGYF0E5vgP08XJoYOlSg7NtoiwbFsYyNOk80nltuHDkj2KW3wXbU+k71zAFNjZc2Bmo9SZI+XtVWC94=
X-Received: by 2002:a05:6512:1293:b0:536:55a9:4b6c with SMTP id
 2adb3069b0e04-53b1a307d85mr3808241e87.13.1729770318940; Thu, 24 Oct 2024
 04:45:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Oct 2024 04:45:18 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <bf16af3b-d00e-4084-aa29-6e4c1955ed88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
 <20241018-gpio-notify-in-kernel-events-v5-8-c79135e58a1c@linaro.org>
 <d6601a31-7685-4b21-9271-1b76116cc483@sirena.org.uk> <CAMRc=MfW9n+y8Dehe_g9b8_=he1YuFr3CEGG3iQEfjYwFiWA_g@mail.gmail.com>
 <CAMRc=MdER_JNcvPMRuzbDFpAUqarC9K8KRP+i5SFTW3H7Mkg=w@mail.gmail.com> <bf16af3b-d00e-4084-aa29-6e4c1955ed88@gmail.com>
Date: Thu, 24 Oct 2024 04:45:18 -0700
Message-ID: <CAMRc=McUpRJ=EN3DB7gsgsNKZHhJym6vfURmX9+mXnYuXjNwMA@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] gpiolib: notify user-space about in-kernel line
 state changes
To: Klara Modin <klarasmodin@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Oct 2024 13:34:11 +0200, Klara Modin <klarasmodin@gmail.com> said:
>
> I think I hit the same, or a similar bug, on my Edgerouter 6P (Cavium
> Octeon III):
>
> CPU 3 Unable to handle kernel paging request at virtual address
> 0000000000000000, epc == ffffffff817a40c8, ra == ffffffff817a40a4
> Oops[#1]:
> CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.12.0-rc4-next-20241023-00032-g01c8e35f8d89 #84
> ...
> Call Trace:
> gpiod_direction_output (drivers/gpio/gpiolib.c:4164
> drivers/gpio/gpiolib.c:2700 drivers/gpio/gpiolib.c:2694)
> i2c_register_adapter (drivers/i2c/i2c-core-base.c:396
> drivers/i2c/i2c-core-base.c:422 drivers/i2c/i2c-core-base.c:434
> drivers/i2c/i2c-core-base.c:1574)
> octeon_i2c_probe (drivers/i2c/busses/i2c-octeon-platdrv.c:247)
>
> (the complete log is attached)
>
> Unfortunately the oops remains after applying the diff and the call
> trace looks to be the same.
>
> Please let me know if there's anything else you need.
>

Hmm so it's desc->gdev that is NULL... Could you try the following:

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ae758ba6dc3d..c95c79ea2b49 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1026,6 +1026,9 @@ int gpiochip_add_data_with_key(struct gpio_chip
*gc, void *data,
 		}
 	}

+	for (desc_index = 0; desc_index < gc->ngpio; desc_index++)
+		gdev->descs[desc_index].gdev = gdev;
+
 	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
 	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);

@@ -1055,8 +1058,6 @@ int gpiochip_add_data_with_key(struct gpio_chip
*gc, void *data,
 	for (desc_index = 0; desc_index < gc->ngpio; desc_index++) {
 		struct gpio_desc *desc = &gdev->descs[desc_index];

-		desc->gdev = gdev;
-
 		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
 			assign_bit(FLAG_IS_OUT,
 				   &desc->flags, !gc->get_direction(gc, desc_index));

I'm wondering if this is not an earlier commit.

Bart

