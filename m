Return-Path: <linux-gpio+bounces-16602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 526EAA45587
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 07:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EE1217535C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 06:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93829266EF3;
	Wed, 26 Feb 2025 06:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="mB23+NoR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F451925A6
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 06:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740551168; cv=none; b=hIZYyABaSlmJwFlSkyZ8LY5p6UW27oY+rcdXPKWW5M8aP0nOvHQRBwaIPU3w8yRFTicqpK0Nz9jHDdgd7eHbQnel/icvzj9/R2RXzgY8WQRuoy8tq+LTSDQd7LFAnh3CgeVjSF09CFEMtXgU+NUK3C+SsyIYNFzrCKVHgcxRTk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740551168; c=relaxed/simple;
	bh=5WNIZySp/V6TQkBqYfphpwXWnPMox8YDnZHsop4KXV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZsZbjbOMBXRVI788ShAjVMMAT0ef99vuL96NEBrhd7OkmAG7Rp7S2SUZcAduCK03dLi5uxndqtP/9JAz0Pg1hQ95RFFO7gAq6m07SQ7OOjuaHwKPxXYZEHBpuyE+IIZ7HPGybfQGX76NFP/chOzp08V+u0+qGoYhVSrUakpy20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=mB23+NoR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22334203781so1595095ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 22:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1740551165; x=1741155965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGreOp4PElamjoD3W2aSIe8M7Z91tErWuXXcKL9KHkw=;
        b=mB23+NoR5czhLLAdwXVNPi58FUISW/clw4Yoih/9mAT/Ay9am6n/oaely9qiAdkcLI
         MR8aJL8hUfTD3ud+4svChb2KM8LpV0FsX20YnDYXCKirxDPk45Zx5JjkAzTfTPkxCHSI
         VfG2lKYEfYrcXN1MeZa8c6h/+VikEOBLTIZKvkjZxgFS63R6uJTJEupYKev4d7RxsNEB
         zzo34QNVjCoDyI/0u984N8NI3RDgd2ezVbuwtI1OUcW/HVrxnXXskwDdnSJvq9phcgYm
         rRwanhKQmRLLZdDgK/AoA2Z/m1N/2/Juyi7tQ/fzAlsn+fliFwU/vUDXSOk9C/JBY/Vm
         CC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740551165; x=1741155965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGreOp4PElamjoD3W2aSIe8M7Z91tErWuXXcKL9KHkw=;
        b=kyJWSVkmx6tszjNFrL9LoOb621jB468D60s3y/QcJ9mNBLBn2DTYn1ZdYD3mUC6edn
         V/EKgPAATOfTvcy9+PsW2Kxphf+cYS3WPt8pglF75vBRJ+tGO+8nlEtZbOlAaxHv3RR9
         1mw/G6MekHbN5PSD4wwmVZW5CKs2OWCXWZBHm9b0S3gBVLOO7d1jsPEd91EygND4FdCS
         xG4TyTaVzKbYtW+wOtWACqD+CNEMEDAb4x1S/cBBsPNg+BryLJEQcjH28TUTtWIPLu4R
         U5/Q05AYiMoSY+MpsmnQmsce2x1hk/SLyNn9JX4RTxWVMuNua2XXYuEKJebWYDt0oIVg
         d8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCU9NuEsvsEzkwDJPs1av74o6SpOUfiPdRm99nY2BlPnqx1bDvVppfTGLIvrMqQ9y4Z1qKOhmQGNfbty@vger.kernel.org
X-Gm-Message-State: AOJu0YzhIV1vf24VEfuHN4K4LnaGHUgMIAbZudHNWAjaRcJyYChuCrcp
	euWwfoQ8w4aboJNNpH5H/NW8+obgnvU0kPCR1m6w7CSuNrrlNpdk+N9ztmQDUpOrTgYmpvYw6XU
	=
X-Gm-Gg: ASbGncsevcI4ZlrZI2zbRy49gUgouSCuhLAj8MIzUGgzwnt1MQVih6soySxG0pXGXeb
	wC10TskoYCT0QXwdk/AA/8nnkrTvVzkL624IqOtHmyk5KZSsbCTB5rOpxFLCGXHYmLWL7lQu1vw
	4YspGA+BJ84g5ub2oTVE2uD7vgVjPBBAUnWNOCktZvhScOYwJ+2aJJQZbFLuY/YFrrx2ZaDAUgP
	/isrUQth1mW9N6q/49tlX2mDu8MIw9aqgBgtb/An602d/eaFJ+drpI4P1vkHMCNioC5dntllm4q
	I+huQw5MCBSRv9k24Rx7UwDbLpFBYiOwRQ==
X-Google-Smtp-Source: AGHT+IHngpceDEuazp39/vkQXaNvFGawu11j3gjWJYcTczcy5si8OGZ0XGoXiweX075LH537Vh+MMg==
X-Received: by 2002:a17:902:d4cf:b0:21f:6546:9adc with SMTP id d9443c01a7336-2218c3f4333mr396597595ad.13.1740551165261;
        Tue, 25 Feb 2025 22:26:05 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825ed0b0sm671891a91.39.2025.02.25.22.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 22:26:04 -0800 (PST)
Message-ID: <961cdedc-af40-4053-ba9d-88d9f84d9904@beagleboard.org>
Date: Wed, 26 Feb 2025 11:55:59 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Linus Walleij <linus.walleij@linaro.org>
Cc: geert@linux-m68k.org, a.fatoum@pengutronix.de, brgl@bgdev.pl,
 jlu@pengutronix.de, linux-gpio@vger.kernel.org, marex@denx.de,
 warthog618@gmail.com
References: <CAMuHMdVxZab5X4HyKj2d_21WohKfpFrsnRYYjx9X1ys22xCvLA@mail.gmail.com>
 <6c53bc06-34d1-4ac3-be12-f29d4e5031f8@gmail.com>
 <CACRpkdZOYz6do2r+HNTJu0Zzs+3KqEgJ7SRM0Q0TQKH8fs8VRQ@mail.gmail.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <CACRpkdZOYz6do2r+HNTJu0Zzs+3KqEgJ7SRM0Q0TQKH8fs8VRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/26/25 01:50, Linus Walleij wrote:

> On Tue, Feb 25, 2025 at 7:25 PM Ayush Singh <ayushsingh1325@gmail.com> wrote:
>
>> One of the reasons of the prevalence of userspace drivers (and probably
>> the reason why kernel drivers for stuff like motors are not attractive)
>> is the lack of upstream solution for runtime devicetree overlays.
> Given how long device tree overlays have been talked about
> and hypothesized I am of the opinion that they are never
> going to fly.
>
> My main complaints being that they are just too complex and hard
> on users: special tools needed, compile files, files relate to other
> existing dts(i) files that you also need to have at your disposal etc.

Well, devicetree overlays also have some benefits. Particularly that it

is an open standard, and can be shared with ZephyrRTOS, if done properly.

The syntax itself is not particularly hard, and it isn't difficult to

create tools to make creating device trees easier.


The current compiler errors are not great to be honest, but that is

mostly due to the fact the barrier to entry for end users is quite

high (go u-boot route or modify the current device tree) instead of

sysfs APIs which other tools can interact with to generate overlays

on the fly. In short, if the kernel provides a userspace API, the

development on compiler and other userspace tools side can make

the process much simpler.

I don't think many people will directly write devicetree overlays,

but generating them is not difficult since it is a defined standard.

> It's harder to use than BPF, which is already really hard to use.
>
> I don't think the ACPI situation is any better for the matter, and
> a solution using DT overlays will not play nice with ACPI systems
> so we just leave that part of the world out.


Can't really comment on ACPI since have not interacted with that much.

>> It is
>> simply not attractive to have tutorials or examples that will require a
>> reboot to work. And since a lot of people will start with those examples,
>> they will continue using userspace drivers for their future projects.
> I agree.
>
> I have an idea about this.
>
> If we want to use an existing kernel drivers for dynamic devices,
> something in-kernel and Linux-specific that is easy to use is
> needed. I would rather look into something that enables
> creation of some devices using the Linux-specific software nodes,
> because *those* we can control how we configure, preferably
> from configfs I suppose, but Bartosz already burnt himself trying
> to use configfs once so I don't know about that specific.
>
> Consider for example, if we have a sysfs like I suggested:
>
> /sys/bus/gpio/gpiochip0
> /sys/bus/gpio/gpiochip0/gpio0
> /sys/bus/gpio/gpiochip0/gpio0/
> userspace
> /sys/bus/gpio/gpiochip0/gpio0/value
> /sys/bus/gpio/gpiochip0/gpio1
> /sys/bus/gpio/gpiochip0/gpio1/userspace
> /sys/bus/gpio/gpiochip0/gpio1/value
>
> With software nodes we can:
>
> cd /sys/bus/gpio
> cat available_gpio_drivers
> i2c-gpio leds-gpio
> echo leds-gpio > gpio_drivers
>
> [/sys/bus/gpio/drivers/leds-gpio.0 appears in sysfs]
>
> ln -s gpiochip0/gpio4 drivers/leds-gpio.0/gpios
>
> [ probe of leds-gpio driver happens using that gpio line
>    now that its GPIO resources are provided]
>
> I easily see this working for any of the drivers in
> Documentation/driver-api/gpio/drivers-on-gpio.rst
>
> Yes, it is not a solution to everything no matter how
> complex a user may attach to their system, which is
> the ambition of device tree overlays.
>
> It solves the issue of dynamically probing devices
> *only* using GPIO lines.
>
> Yes: it will drive a truck through any kind of kernel integrity
> and security, it provides a userspace footgun to shoot
> oneself in the foot. But users want it, so hey. We point it
> out. We put it as an expert option. Whatever of those.

Well, any solution we come up with, has to be for endusers

and not just a developer interface. I have suggested

maybe locking down the dt overlays to some specific

nodes which need to be declared in devicetree [0], but I am

not the maintainer of the subsystem, so many people need

to agree there, but let's see.


Btw, I do agree that there should be a sysfs based API for GPIO.

It's quite a pain when you want to not have external dependencies.

I have used the `ioctl` based API directly, but even then you end

up depending on libc (and ioctl signature is different between musl

and glibc). Additionally, all the structures and error handling just

builds up.

> However these devices *will* be performant as they are
> regular kernel drivers, and they *will* be able to use
> interrupts in a proper way.
>
> Yours,
> Linus Walleij


[0]: 
https://lore.kernel.org/all/d5bed265-1dbd-44d1-8287-8ca993624b79@beagleboard.org/

Best Regards,

Ayush Singh


