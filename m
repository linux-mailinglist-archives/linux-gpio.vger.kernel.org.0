Return-Path: <linux-gpio+bounces-10548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 735B6989C03
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 09:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 198EDB22D4D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 07:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E0616A92E;
	Mon, 30 Sep 2024 07:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsqyNcuZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C5C208D0;
	Mon, 30 Sep 2024 07:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727682950; cv=none; b=EKaT2hXUB6s3qX43BSdt0kTyMWCnRwxQqayARoQ3jjinrWZu0xZEu07DukAzxnwN6RYE50u3Rh6t9+zZUlSTtohulPmIxeNbFNnRQ8XRmorgTfYjFZstaFGRyBoySfgbhXMypLb6PbBI9IKsHIW8b8h0dGn9w29R/XjROW5FdiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727682950; c=relaxed/simple;
	bh=WqiiMn3TOK8qkHGyl30poW6uvLfsNKOs+I8IDx0MaPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCGqODT7iTTEODxF3QNPrkY+js39dsV7mPKf17Mcwxotz8NM3QRzLqQPe98wftwkkgeUrIWXzIC1sgKCSUNUYFRRfOj/0sf5oak/P7PYd3GFPlwz4bNum7ESePPMt9bg+hEagOkK41nrxYSXCvg2kO/TdSYK0bVOGQZxh4Nh6TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsqyNcuZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20b01da232aso28473525ad.1;
        Mon, 30 Sep 2024 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727682948; x=1728287748; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zii7toS4u8fqK8e7iEXrwK+8PuQ8KNxa6JHJJXvxdRs=;
        b=nsqyNcuZDs/qx3iJBz9iCv0FXeWuLJuA2Whkh7FpJ6/64lBHRPHRpL+R8MC1w5RkgI
         HufMAJmyZlmSpSQNnWAgfwXukGv5jv941rBXGWaqKf3dlZH2HgCgTfeIUtViJ2QK4XM+
         gqXoMGFU4a1jL+DzRjv2vyW6tdMKjVyOnKQMWoYNSPxuKCjMpbtmvs9p5ztmtHSYaesF
         hWrqOIXiNQQPssDcJ5Gzoxlvc3hGc80MXMTp/DwslECW4yn5CBBvdzGKxSNWaDFBz7jR
         WbXppE7G7/s8aunzubQIiYeF3f305AJq1hePFuYCaN0llZC7w3k8+0eXT+yne70Lltvz
         L+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727682948; x=1728287748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zii7toS4u8fqK8e7iEXrwK+8PuQ8KNxa6JHJJXvxdRs=;
        b=Y/aFLxdKwqwuDi+FyBWlm/LY1Kj0eaeaIVR+oeArosHEEC/ZZuEFdUSLgrj3lkTOes
         VUe2WGzd34yg3cyoNPcmfcwzj8i4eY6moe+L0BnYRArVuiEgATab+K9ipEzq4zz92zHK
         Cw+dO8uCUpoq/n6mxMGGx+gW1m/eczuppahuNXejdczjdj4+DnutgROcMIDpboGdfuKS
         Cyt1RxdOCH717MC6aHI5YhtgWBBZju0U8sagXbyQq8R2/LF+SJRc7vncoiil49JXPE/3
         gd3HFxTG7wlfUq6WQRC4XMtRLYwRsQbMepwp8aCk+e0oKY5+TmbprNpMuys3JfovcRAb
         x6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCViinI9SwXhfzoXhpMotBQfG4BYUtGC1HKf/IVmb5LAhCj1kPuBAbS+RTGLpSiVvJTVsc9NxPzRREB13v0I@vger.kernel.org, AJvYcCWrq/bd11k49HCXLMqP4z7WDgBx+UE08rBcfPUUs3Ny2tAWidsPF0l4dpk4UYyVZkbOZF38lxsOlnZi@vger.kernel.org
X-Gm-Message-State: AOJu0YzLRR9bZhoKchiowKw1SGdR5exj8Lu/XDF+03QrFV/xBGaZp830
	pypX+JJxTwD6EJJyYiUh6jQBvrdbtqKvYDD7qm8EE4zZ62xE48E8
X-Google-Smtp-Source: AGHT+IFxOMc0d4tCPAQmw7OpnEdG5eybS/WJhfQZ4V9BtWh7rZBQN7P2cPW6Jv34yoG6Xb9/KU8emw==
X-Received: by 2002:a17:902:c40f:b0:205:7998:3deb with SMTP id d9443c01a7336-20b19c9af59mr221231995ad.19.1727682948163;
        Mon, 30 Sep 2024 00:55:48 -0700 (PDT)
Received: from rigel (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0d519sm49524575ad.172.2024.09.30.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 00:55:47 -0700 (PDT)
Date: Mon, 30 Sep 2024 15:55:43 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [RFC PATCH] gpio: sysfs: make the sysfs export behavior
 consistent
Message-ID: <20240930075543.GB57004@rigel>
References: <20240927074221.9985-1-brgl@bgdev.pl>
 <20240930010334.GA6286@rigel>
 <CAMRc=Mdt8+ATGVU19E+pRrMhKZTcO49HTPdboHLLeN_Omd6LoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdt8+ATGVU19E+pRrMhKZTcO49HTPdboHLLeN_Omd6LoQ@mail.gmail.com>

On Mon, Sep 30, 2024 at 09:20:48AM +0200, Bartosz Golaszewski wrote:
> On Mon, Sep 30, 2024 at 3:03 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > > I decided to write a sysfs-to-libgpiod compatibility layer based on
> > > FUSE. Since Rust is hard, I started prototyping the thing in python
> > > first to at least have the logic nailed down before I tackle the rust
> > > part.
> > >
> >
> > Something along these lines[1]?
> >
> > Cheers,
> > Kent.
> >
> > [1]https://dev.to/krjakbrjak/simulating-gpio-sysfs-interface-with-fuse-and-c-30ga
> >
>
> Well, this doesn't really do anything. I'm thinking about something
> consuming the libgpiod rust bindings to actually be a useful
> replacement for kernel sysfs.
>

I haven't actually looked at that - but when you mentioned a sysfs fuse
interface that rang a bell.

> The master plan is: provide a drop-in user-space replacement for
> sysfs, make users convert to using it instead of the real thing,
> eventually remove sysfs from the kernel and then some time after
> remove the compatibility layer from existence forcing everybody to now
> move to pure libgpiod. :)
>

Ironically a lot of users would probably be happier with that than with
the D-bus daemon.  And for that reason I don't think that last step will
ever happen.  But that is ok too - as long as we can finally remove the
sysfs interface from the kernel.

Cheers,
Kent.


