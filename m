Return-Path: <linux-gpio+bounces-11907-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D22E9ADED6
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 10:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DE18B23549
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 08:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648221B6D1B;
	Thu, 24 Oct 2024 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3BncTnso"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753701B6CFB
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 08:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757737; cv=none; b=txUmV9SfLf6WGXtznYZO1fdqHLCB14mHG7erMb6tswTu/syO6r0zh1L3FGazEHWNM8NdZlHBCmiWxpJuj+QYp+72ORwgeaV3DAi1aqW0iaR3qbXWfN3s3IYAE57sLqhvgwFuajwAbOgJk3ncfmD57yfRUFpnvbtib7ae7nQ96b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757737; c=relaxed/simple;
	bh=MRwG3odtQu89vSf8lgEZE9QhB3xMwWUXM8lipK6UeZ0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmIjjmOiF9IBXRsf++c8R/OuwTEvD5XXey3ZmNrG58rdFeDdgTmYsjWAbA4Flz+mEie1r5HY66T7SfU+GMdu7JYh05KnSo8djcbCQtOLu/au1w+uTMyfOXMwelmFPa7zFsN4Wkvw81y3FLXg2tu5811KWGyJdQkPxeXCwOTI39U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3BncTnso; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so557926e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 01:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729757732; x=1730362532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRlyjjh+J3BYa6u9Ab4okpW35rR0Ls3OYpmQGi3eLLg=;
        b=3BncTnsox4DE3mqvn9gmX805onHxr7XZnqv//0puVQwuYsyL5t/ids+GACfJ/FX4FG
         xHOGxqx4TntmBRPO0JdUimngYL3JgigCSv96Oo64VOb1XRpvgPSQqI6e3PaHCi4GEr2F
         vxOBTxEWeA0/d6Hwv80IaOu3RDJ/JAK02LJ5MDd4uzp/OMJblUydSSDiYs1zQo2h8X2p
         qqKNU6koAZ5fII/VkDiwn3GESpSa+sZ/p9nxt5b8v+n8EmU7wgGzgrOfEUNyGU6b24IM
         kEreASpa4Q7nGLJknhTvk2ka0Muy+VkfxmzZHQxw5HhpJuDhA8bZPue8KlWICuA6NYdc
         3jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729757732; x=1730362532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hRlyjjh+J3BYa6u9Ab4okpW35rR0Ls3OYpmQGi3eLLg=;
        b=cldXn2PnWpMojhg7aof1n9CDI+pRJqd/V/zKV+xI4CM8kRTrTrZ94rTEmxdgVws8Rl
         fb/jXEURf0MJa/+xPKMMeZN/PfTLA4z0yV60trDVhvBhiKyyfNh8ZgUVvjAHlezpN2Ua
         KtcblHB+7Wawwn1+v2a3IB7gvo4idVfH9ys95wUeQayFGEbJckY39rB/5pFnZsu0Hq/U
         5R4p7K6Xztr4edPH52RRQ+gQ6Fo2mZmWV/mSG7k3cVuDV9VTKx1XjwINnQqYxKN66GD8
         Jhbf/VNXGFqa7ZQSTxrWay1aOP0iDe5gRQdi73kg0lyAGfz5inTHC12/Sq2JJ4FJ4Ikj
         O13A==
X-Forwarded-Encrypted: i=1; AJvYcCU6TRXJ9bupCmLwLlpX8V/jMGgCA6+xUy5S4SpdvRbmxR5b39QZJ3Yy0WMGpg26f0PM0n5EZ4QO5WRR@vger.kernel.org
X-Gm-Message-State: AOJu0YyuwLqiTRVJAeRoyoU3IREIgoUDcVShGDIjcL9xcKcKAFWeuUck
	J9sTrcxK3UpaqrKDzD9KwabPtY0g24cpqPN9tYFd5p4Ij2Uub0xmpVJ5KEZZ47ajWF3du3ayH2c
	No/q/yPtPULYIJCuA0kg6fJllbHOEYoL7eRMnEA==
X-Google-Smtp-Source: AGHT+IG7ZgOiNDXq2HQrZzFbIiYpB2lvLNIuelZFjdVwgaYR+PrwWBfLAJ0B9JqsrCAbKdpEUnA/pn2aDwqXnJ4R/k0=
X-Received: by 2002:a05:6512:6cc:b0:539:fd20:c41f with SMTP id
 2adb3069b0e04-53b23dcb1efmr700779e87.3.1729757732267; Thu, 24 Oct 2024
 01:15:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Oct 2024 08:15:31 +0000
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CAMRc=MfW9n+y8Dehe_g9b8_=he1YuFr3CEGG3iQEfjYwFiWA_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
 <20241018-gpio-notify-in-kernel-events-v5-8-c79135e58a1c@linaro.org>
 <d6601a31-7685-4b21-9271-1b76116cc483@sirena.org.uk> <CAMRc=MfW9n+y8Dehe_g9b8_=he1YuFr3CEGG3iQEfjYwFiWA_g@mail.gmail.com>
Date: Thu, 24 Oct 2024 08:15:31 +0000
Message-ID: <CAMRc=MdER_JNcvPMRuzbDFpAUqarC9K8KRP+i5SFTW3H7Mkg=w@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] gpiolib: notify user-space about in-kernel line
 state changes
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Oct 2024 08:49:30 +0200, Bartosz Golaszewski <brgl@bgdev.pl> sai=
d:
> On Wed, Oct 23, 2024 at 11:05=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:
>>
>> On Fri, Oct 18, 2024 at 11:10:16AM +0200, Bartosz Golaszewski wrote:
>> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >
>> > We currently only notify user-space about line config changes that are
>> > made from user-space. Any kernel config changes are not signalled.
>> >
>> > Let's improve the situation by emitting the events closer to the sourc=
e.
>> > To that end let's call the relevant notifier chain from the functions
>> > setting direction, gpiod_set_config(), gpiod_set_consumer_name() and
>> > gpiod_toggle_active_low(). This covers all the options that we can
>> > inform the user-space about. We ignore events which don't have
>> > corresponding flags exported to user-space on purpose - otherwise the
>> > user would see a config-changed event but the associated line-info wou=
ld
>> > remain unchanged.
>>
>> Today's -next is not booting on several of my platforms, including
>> beaglebone-black, i.MX8MP-EVK and pine64plus.  Bisects are pointing at
>> this commit, and i.MX8MP-EVK is actually giving some console output:
>>
>> [    2.502208] Unable to handle kernel NULL pointer dereference at virtu=
al address 0000000000000000
>> [    2.511036] Mem abort info:
>>
>> ...
>>
>> [    2.679934] Call trace:
>> [    2.682379]  gpiod_direction_output+0x34/0x5c
>> [    2.686745]  i2c_register_adapter+0x59c/0x670
>> [    2.691111]  __i2c_add_numbered_adapter+0x58/0xa8
>> [    2.695822]  i2c_add_adapter+0xa0/0xd0
>> [    2.699578]  i2c_add_numbered_adapter+0x2c/0x38
>> [    2.704117]  i2c_imx_probe+0x2d0/0x640
>>
>> which looks plausible given the change.
>>
>> Full boot log for i.MX8MP-EVK:
>>
>>    https://lava.sirena.org.uk/scheduler/job/887083
>>
>> Bisect log for that, the others look similar (the long run of good/bad
>> tags at the start for random commits is my automation pulling test
>> results it already knows about in the affected range to try to speed up
>> the bisect):
>>
>
> Hi Mark!
>
> Any chance you could post the output of
>
>     scripts/faddr2line drivers/gpio/gpiolib.o gpiod_direction_output+0x34=
/0x5c
>
> for that build?
>
> Bart
>

While I can't really reproduce it, I've looked at what could be wrong and
figured that the NULL-pointer in question can possibly be the
line_state_notifier.

I realized that for some historical reasons we add the GPIO device to the
global list before it's fully set up - including initializing the notifier.
In some corner cases (devlinks borked?) this could lead to consumers reques=
ting
GPIOs before their provider is ready.

Mark: could you try the following diff and let me know if it works?

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ae758ba6dc3d..4258acac0162 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -987,45 +987,6 @@ int gpiochip_add_data_with_key(struct gpio_chip
*gc, void *data,

 	gdev->ngpio =3D gc->ngpio;
 	gdev->can_sleep =3D gc->can_sleep;
-
-	scoped_guard(mutex, &gpio_devices_lock) {
-		/*
-		 * TODO: this allocates a Linux GPIO number base in the global
-		 * GPIO numberspace for this chip. In the long run we want to
-		 * get *rid* of this numberspace and use only descriptors, but
-		 * it may be a pipe dream. It will not happen before we get rid
-		 * of the sysfs interface anyways.
-		 */
-		base =3D gc->base;
-		if (base < 0) {
-			base =3D gpiochip_find_base_unlocked(gc->ngpio);
-			if (base < 0) {
-				ret =3D base;
-				base =3D 0;
-				goto err_free_label;
-			}
-
-			/*
-			 * TODO: it should not be necessary to reflect the
-			 * assigned base outside of the GPIO subsystem. Go over
-			 * drivers and see if anyone makes use of this, else
-			 * drop this and assign a poison instead.
-			 */
-			gc->base =3D base;
-		} else {
-			dev_warn(&gdev->dev,
-				 "Static allocation of GPIO base is deprecated, use dynamic
allocation.\n");
-		}
-
-		gdev->base =3D base;
-
-		ret =3D gpiodev_add_to_list_unlocked(gdev);
-		if (ret) {
-			chip_err(gc, "GPIO integer space overlap, cannot add chip\n");
-			goto err_free_label;
-		}
-	}
-
 	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
 	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);

@@ -1103,6 +1064,45 @@ int gpiochip_add_data_with_key(struct gpio_chip
*gc, void *data,
 		if (ret)
 			goto err_remove_irqchip;
 	}
+
+	scoped_guard(mutex, &gpio_devices_lock) {
+		/*
+		 * TODO: this allocates a Linux GPIO number base in the global
+		 * GPIO numberspace for this chip. In the long run we want to
+		 * get *rid* of this numberspace and use only descriptors, but
+		 * it may be a pipe dream. It will not happen before we get rid
+		 * of the sysfs interface anyways.
+		 */
+		base =3D gc->base;
+		if (base < 0) {
+			base =3D gpiochip_find_base_unlocked(gc->ngpio);
+			if (base < 0) {
+				ret =3D base;
+				base =3D 0;
+				goto err_free_label;
+			}
+
+			/*
+			 * TODO: it should not be necessary to reflect the
+			 * assigned base outside of the GPIO subsystem. Go over
+			 * drivers and see if anyone makes use of this, else
+			 * drop this and assign a poison instead.
+			 */
+			gc->base =3D base;
+		} else {
+			dev_warn(&gdev->dev,
+				 "Static allocation of GPIO base is deprecated, use dynamic
allocation.\n");
+		}
+
+		gdev->base =3D base;
+
+		ret =3D gpiodev_add_to_list_unlocked(gdev);
+		if (ret) {
+			chip_err(gc, "GPIO integer space overlap, cannot add chip\n");
+			goto err_free_label;
+		}
+	}
+
 	return 0;

 err_remove_irqchip:

Thanks
Bartosz

