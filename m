Return-Path: <linux-gpio+bounces-11440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E859A070C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 12:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2B1C1C21FDF
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 10:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D6B206962;
	Wed, 16 Oct 2024 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsWYHOvh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1778220605A;
	Wed, 16 Oct 2024 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074139; cv=none; b=XwdwGlvg/wGd0A3BMGwp/fcM7W3rdp7YExomBBDO0r1P3CtYoAuK4s6sezt05W7qXrP77AtOlmrw9Oap9ZuXci7TjL8yJxye4eS+4Mvyf274of3fyk1zxN7R7YRYf673gSh5sVDpGKb8UuH209sRB6HHQM4gigizCEOWO009q5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074139; c=relaxed/simple;
	bh=QKT/WXdyszfDZAuBiFpIgRfqqgYlxDV3xAF2UERO4b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNU7His/4o38Qe8M/zDL1fjeiIAurFpNtQ5/I24C+bDUTExZW82q6ECU4WynZ7ZqZFrnVVX9VZzGzqZ6h/bqsjKK2mHgNtE/rpZcTrmBS/RrEGN4Q5b80GaqCK6X/mo1VzESjpZ760mgzlB0rE+52mk49jU0G9hw/8dQLirY97Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsWYHOvh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20c805a0753so52243865ad.0;
        Wed, 16 Oct 2024 03:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729074137; x=1729678937; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7hVbtChpMQWzTvbStouuEBhs655kBL7SbqySCr+6uXg=;
        b=MsWYHOvhVM7L24ZaECYP8VUFz0mrwcxdbuBMKPvYJ4VEEJoVwhvrRElmVp0DkoJ0wx
         tzJatAYyZn4sl2Tscjglu6ZdBAxZVu2hXfrAuCzR8MBUwaPWF4GBBtkAz3mCb20P3PNp
         lHJF6M12pg7+EjpPJb5Q45xJLy6nrcpdxYSzDaQ45KaoKCTwTiDP+UzK50kA+bx7fhqy
         uGQnliv3uz+7rrxFM0eaw2srO2cJ7rnJqQ+x2DTdY0T4TVGOqdueksZRYG/GWXn961HG
         NSQH3JdB/Y+B4QXFvoU4sdnsV/T35lfcO6KYLUmvB3adyk6zIALtg42Qz/ckixFFNldc
         M1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729074137; x=1729678937;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hVbtChpMQWzTvbStouuEBhs655kBL7SbqySCr+6uXg=;
        b=EuHVajG/kwRDyqZ9eXXOVA8h6+PRWGWqg2e39UYMsnBpRqIzWjhuyK7FXBy87vAWc6
         Cw8qvHE05obJxQY+CWGAbn5ScKhBPVxSQzbM+uVO/Offn5MUlBVgI5mjh23WeIRVYZ0B
         V5gpuase5wH5g0NekCPvT5NXcoP85pcGHYRGYEW8CpOze615xatckXf2rQRSDDwpCWuI
         ux8pJWu2vHzvg5p/jjPItXVXrYVYQOUvhgGfT93oj+jiE3KK5gHuMyJGHEtQMWfwuzjJ
         +iD4nWV4qqik4tFUyQKKTrNh5km05haA78AtyP3NjNEyvCxHMz8p/ZtClavQMbz5BdVb
         8OlA==
X-Forwarded-Encrypted: i=1; AJvYcCUyAENaHIx3lK8NQqICzb9rXy6mfeLGOp7Hagx7io6dken7BQj0z3R4OqJxwdsygZVIMN5ZL364B/Wz+Abw@vger.kernel.org, AJvYcCVPUq61+K+Ag7vsRxz3y5Y3lm0PGbnc0gFJ0lRGtFijjz6ZVLNPZtUCDPsxvTvO8FAztsg6DtFel1AA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyri5Xugu81SB6wcCYir8qQUondMq4M/Kvt1T2vcqQEdP3+tCxj
	LJ/CJ8l+JhMMOWca/cZvKeY3RFHpY7aHj8yv6Q7kLf+Rbmn0d3uP
X-Google-Smtp-Source: AGHT+IGwbEg2OVpmhjJFB/PceC4hTOBxNneYztJDXoHfuTwJ9C1n3PKfJvERipSCSvzynbZY4SvWmQ==
X-Received: by 2002:a17:903:22cb:b0:20c:ccb7:df84 with SMTP id d9443c01a7336-20d27f0cf28mr42417215ad.42.1729074137311;
        Wed, 16 Oct 2024 03:22:17 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c715fa0sm2976588a12.78.2024.10.16.03.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:22:16 -0700 (PDT)
Date: Wed, 16 Oct 2024 18:22:12 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241016102212.GA236073@rigel>
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
 <20241016051944.GA42100@rigel>
 <20241016072730.GA120095@rigel>
 <20241016083747.GB120095@rigel>
 <CAMRc=McR_eMizF6r30NqbgK4mE5ErzR=wbkD4O-Czn=+Oj4AXQ@mail.gmail.com>
 <20241016091714.GA207325@rigel>
 <CAMRc=MdoeyXwKuLmrmJ8zRCtVDNzEd34zgZ5Autye0TNv_OLhg@mail.gmail.com>
 <20241016094311.GA210746@rigel>
 <CAMRc=Mefz=EBd6us-eK8kqk8zL0=LsEWUkP3JB7a0M7xcT8z8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mefz=EBd6us-eK8kqk8zL0=LsEWUkP3JB7a0M7xcT8z8Q@mail.gmail.com>

On Wed, Oct 16, 2024 at 12:12:10PM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 16, 2024 at 11:43 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Oct 16, 2024 at 11:22:07AM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Oct 16, 2024 at 11:17 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > > >
> > > > >
> > > > > You mean, you get a CHANGED_CONFIG event but the debounce value is not
> > > > > in the associated line info?
> > > > >
> > > >
> > > > Correct.
> > > >
> > >
> > > Ok, let me see.
> > >
> >
> > When setting from userspace the issue is that linereq_set_config() setting the
> > direction will emit, quite possibly before the debounce has been set.  The
> > edge_detector_setup() that does set it can also emit, though only if the
> > hardware supports debounce.  And then there could be a race between the
> > notifier being called and the period being set in the supinfo.
> > (the set will probably win that one)
> >
> > Debounce set from the kernel side is going to be an issue as cdev
> > catches and stores the value from userspace to report in the supinfo - that
> > isn't the case for kernel calls to gpiod_set_config().
> >
> > Seems moving the debounce value out of the desc and into cdev, which seemed a
> > good idea at the time, might come back and bite now if it is no longer
> > restricted to being cdev specific.  Now there is an actual reason to
> > store it in the desc :(.
> >
>
> I'm seeing commit:
>
> commit 9344e34e7992fec95ce6210d95ac01437dd327ab
> Author: Kent Gibson <warthog618@gmail.com>
> Date:   Tue Dec 19 08:41:54 2023 +0800
>
>     gpiolib: cdev: relocate debounce_period_us from struct gpio_desc
>
>     Store the debounce period for a requested line locally, rather than in
>     the debounce_period_us field in the gpiolib struct gpio_desc.
>
>     Add a global tree of lines containing supplemental line information
>     to make the debounce period available to be reported by the
>     GPIO_V2_GET_LINEINFO_IOCTL and the line change notifier.
>
>     Signed-off-by: Kent Gibson <warthog618@gmail.com>
>     Reviewed-by: Andy Shevchenko <andy@kernel.org>
>     Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> But it doesn't explain *why* we did this and I don't remember the
> story behind this change.
>
> How bad would it be to go back to storing the debounce setting in the
> descriptor?
>

At the time it was only being used in cdev, and moving it into cdev was
just about not exporting cdev specific stuff to the rest of the kernel.
So it was just tidying up.
But if cdev is now reporting the configuration of the line independent
of whether it was set from userspace or the kernel then it actually
makes more sense for that state to be stored in the desc.

I don't have any objections to that commit being reverted.

Cheers,
Kent.



