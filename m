Return-Path: <linux-gpio+bounces-28481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5FFC5C800
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 11:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E2D042423F
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 10:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B2330C612;
	Fri, 14 Nov 2025 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1Vo1cqfH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDC230AAC4
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763115095; cv=none; b=PfZQD9MAun8hTggPDuQwb/cwXxG+ugIkSDbnBp/lGgkDMZYQOFoEfChIprTf+KxhsSsBk6amld3j4Pp1YNbF5wreyP0JGttCTCclSjaJ/bBMEnudHREnyPRgQLmzTlmFiBlHSUTyGYa5uSySpztlLShpFAVUW/Z6AcJBcGerGO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763115095; c=relaxed/simple;
	bh=Om0kL4+EsH4fOQcR9rTHaV/cNGgoCp+koRu6tuqT5HE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFMfwa4pfsSRFozux0GvuPHncx8i47/wZ4rFfoGrv0FSonbf35VsnKHHYA2iT4n7DHiz6Gg8/ev1LZkirEHdTZ0il8dgKizRagCHFIIbAYXLA7y16ESm4cEvHWoIceLoOCVH9Z66XFfW7TYLhInwmPH8Gfrd4QkyzZT1w95yNHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1Vo1cqfH; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-595819064cdso2137112e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 02:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763115091; x=1763719891; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0GXckFZ6/zCVpjXO6e9Us9OTyDhPjOxSx72B5kdOZcs=;
        b=1Vo1cqfHeUBqi/OUgRax1irfb+LM/Ez8jjUBJ9MiRFyablA/HAnIxRc7BtE/pj9zXO
         PLtVVgIy2MiyobgeEpZRzaUjpgZMkcdn0cYOw0pZUcR17IeDU/zBsKTWY0bgOZVPOhFW
         8hcUldADA9asLLr/+kQ2DDkHDhsunntSE7Dt6pZWuyFBd8vniDTrFWHOZidmVBzIdGp0
         +ADqwTO1DcS6CASVwWy2x/T5TNawqXlrnL2PW+YhgokEUsR5/tKIfyk/3y052Z3iNRgl
         1kKRxb79aob3K6LpAgZjI7q2gl0sg5Oav4FU7dILo5NTRJUC72JHzpwoE0MdvES+sVNb
         xgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763115091; x=1763719891;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GXckFZ6/zCVpjXO6e9Us9OTyDhPjOxSx72B5kdOZcs=;
        b=tyJZMNMxiZAPD9wOgCdIRW76P6f7dQfntgnbBee0YtM8iYeLhUM9bFa0zQQ1aCHJax
         dInZe2q7N4OFKMR2qFy6WnKpwbeVvcCEYbs0wYLEt4REmSIlHVaMhRPeCi8O1P9Ojyld
         pcbD9KjJRjzpufWv6s+w928rvNxiFOYBwFRwDJfYIFvZ3DN64dmyG/hIn1o+yXbEcr/W
         Ycuz38DRcrjHp5ORO6w2zXx++aDxYHbuEu7AZbwU6wxAYGXt8Utz06R8FdXaDZQT+qVF
         uQOIFJLzMX3fU/jOTQWvsuXOU9KrYEPzYnhoRe0+WfzKL5Q7va4VlF0vTCAkBzrJKZPK
         YFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqHtX8XsBfvH3NgAOCGG7ZeF055kunwT7WQlTecGvyi7csPECr6NhSwQiGLMzdB8Z+97L83TI4SKax@vger.kernel.org
X-Gm-Message-State: AOJu0YyoICpu/md6xau89fQDONw+yotc75B9FkNa+JUjBuNQDZfRkO8Q
	MrBB/xIiI+p6CEHTK66an4oMPnkallv0IThjadRZaGDkJq8kX+eOKJsk2nXObOw8XmAWnRD2E/K
	XxQ/SJkMUEiPjnWpii2jxh1ohb9SCVgoGnUVGMY3BoUG8Hpvoen1MlBlhaA==
X-Gm-Gg: ASbGnctRud1aLlxfbTt5qgwLfdt5TSj8rdxlcov1c4WMbJXI1hbdN8lEYsmgXLFD0B/
	tlBthxXBzTwsZQ3UmPEu37ME6sS9XjPe5LE1ZRcD0YRO5/DiwPXsLu7qGVciXlm9Y3vIYt90YeL
	stoS0ki6JuZi+t6dIpCy9M1h5cSvIICB908VnzZx9O1lJMXQpcKFK7sBu94nyt/gVJaWHztW4yS
	ldCcNzNbkY7sJL7gQSwPNeJta2rhihBI+tHu4AfjS8yeLJ/AoUaI6ieMdwSNigCfK6WQaNeDa7A
	59f6+Dr/uRLE6Do7ZbTd6xa2bL4k6S4ggXrDkw==
X-Google-Smtp-Source: AGHT+IETgmlQwgRVB4kjKBrplZYaFXpYWAbqY67i5qg+/hIr9ivMJCSUtyYG/2O4sh809lnRtRlVblZvG5zJRU7AiNM=
X-Received: by 2002:a05:6512:39ce:b0:595:83e7:c74e with SMTP id
 2adb3069b0e04-59583e7c77amr947735e87.13.1763115091195; Fri, 14 Nov 2025
 02:11:31 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Nov 2025 02:11:29 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Nov 2025 02:11:29 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20d48bba465d3e03d2dd5e57c4d2d15765356b7e.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
	 <20241018-gpio-notify-in-kernel-events-v5-6-c79135e58a1c@linaro.org>
	 <5d605f7fc99456804911403102a4fe999a14cc85.camel@siemens.com>
	 <CAMRc=McswuxryKqh7-zSc+oKTubu-bKoV40mUMh1tUbTofHA5A@mail.gmail.com> <20d48bba465d3e03d2dd5e57c4d2d15765356b7e.camel@siemens.com>
Date: Fri, 14 Nov 2025 02:11:29 -0800
X-Gm-Features: AWmQ_blyTJIsPSKjAL0jAcV48QOsI0m26cmg3gRPp-KEQZmITK5AeGcmIl9KiBM
Message-ID: <CAMRc=McTRNeyYXoy75VOsk5YNb5udBbin2TbCmX8DzQXhGUAVQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] gpio: cdev: put emitting the line state events on
 a workqueue
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>, 
	"warthog618@gmail.com" <warthog618@gmail.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 10:04:11 +0100, "Sverdlin, Alexander"
<alexander.sverdlin@siemens.com> said:
> Hi Bartosz,
>
> On Fri, 2025-11-14 at 09:21 +0100, Bartosz Golaszewski wrote:
>> > > In order to allow line state notifications to be emitted from atomic
>> > > context (for instance: from gpiod_direction_input/output()), we must
>> > > stop calling any sleeping functions in lineinfo_changed_notify(). To
>> > > that end let's use the new workqueue.
>> > >
>> > > Let's atomically allocate small structures containing the required data
>> > > and fill it with information immediately upon being notified about the
>> > > change except for the pinctrl state which will be retrieved later from
>> > > process context. We can pretty reliably do this as pin functions are
>> > > typically set once per boot.
>> > >
>> > > Let's make sure to bump the reference count of GPIO device and the GPIO
>> > > character device file descriptor to keep both alive until the event was
>> > > queued.
>> > >
>> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >
>> > starting from this patch up to the current linux-next (v6.18-rcX)
>> > I see the following refcnt warnings + KASAN UAF reports on either reboot
>> > (when gpio-manager is being stopped) or
>> > `systemctl kill --signal=SIGKILL gpio-manager` (if some GPIOs are being
>> > requested from (owned by) gpio-manager prior to kill):
>
> []
>
>> Thanks for the bug report. I confirm it's reproducible on my side too.
>> It never occurred to me to try and SIGKILL gpio-manager. On normal
>> exit, nothing bad happens. Let me look into it.
>
> In my case it happens also on every reboot/shutdown, however if I
> `systemctl stop gpio-manager`, I don't see the issue... not sure yet,
> what is the difference... and I'm not telling SIGKILL is how one
> should stop gpio-manager, but I'm happy SIGKILL now allows you to
> reproduce the issue in the kernel code!
>

When the process is killed, it seems the character device's file struct is no
longer valid even though chrdev_release() was not yet called - it's called
after we try to send out this notification. I think it's best to just check
if the file is active and not do anything if it isn't.

Can you test the following change before I submit a formal patch?

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e6a289fa0f8f..0f1103a679b5 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2548,10 +2548,17 @@ static int lineinfo_changed_notify(struct
notifier_block *nb,
 		container_of(nb, struct gpio_chardev_data, lineinfo_changed_nb);
 	struct lineinfo_changed_ctx *ctx;
 	struct gpio_desc *desc = data;
+	struct file *fp;

 	if (!test_bit(gpio_chip_hwgpio(desc), cdev->watched_lines))
 		return NOTIFY_DONE;

+	/* Keep the file descriptor alive for the duration of the notification. */
+	fp = get_file_active(&cdev->fp);
+	if (!fp)
+		/* Chardev file descriptor was already released. */
+		return NOTIFY_DONE;
+
 	/*
 	 * If this is called from atomic context (for instance: with a spinlock
 	 * taken by the atomic notifier chain), any sleeping calls must be done
@@ -2575,8 +2582,6 @@ static int lineinfo_changed_notify(struct
notifier_block *nb,
 	/* Keep the GPIO device alive until we emit the event. */
 	ctx->gdev = gpio_device_get(desc->gdev);
 	ctx->cdev = cdev;
-	/* Keep the file descriptor alive too. */
-	get_file(ctx->cdev->fp);

 	INIT_WORK(&ctx->work, lineinfo_changed_func);
 	queue_work(ctx->gdev->line_state_wq, &ctx->work);

>> Do you also go by ccpalex on github? I want to give you credit for
>> reporting the other bug in gpio-manager as well.
>
> That's me! I didn't know where to report an issue with user-space libgpiod,
> that's why I went with github ;-)
>

You can use this mailing list but github is fine too. Thanks.

Bartosz

