Return-Path: <linux-gpio+bounces-9699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D56696A6AF
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 20:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E858B22012
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 18:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70761917E9;
	Tue,  3 Sep 2024 18:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eTevbHlO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1682018E027
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725388621; cv=none; b=ICZNmyM0OV8tgPo5B1i+9pJWe+E9BJKGboZou4NsoAxvf3DO0uuThQIDBRxUN7tgJrqOwSMhe82NKXw0wkxx3wSDWsczmNMx0smB7rWK9s7phoj5kAxkUnWfY3yU/JdcrK5stnCsm+paG88zbvfpWssxAw1xJfvwhbx7UxaV7Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725388621; c=relaxed/simple;
	bh=iF1ve7zUvFd6IQgMpiZkAA8RIOFoGavKDQT5WLJeZgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raMRk50U2SBPlBC2KjGFhJ9uBqwpRB0oUpFFfX6g+yBr9cXRQVn5t5MYRn+oT7RUkHazOJ5KO1r5qBFZnbuamiV/mCnz9EUyVv6BuH1bcpKiq9yJVBtBRUqIXWbM+BBqARVk5nFRw4tqvXJLYLgHzA/jhVDU4nb2rs9MJFe60Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eTevbHlO; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6db20e22c85so673777b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2024 11:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725388619; x=1725993419; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4PquCzpBQxckopb5g2wFn+ZyjJzmKndGiHDxxGCGscU=;
        b=eTevbHlOPA9eOr2FTY9Jk9rZOGWDA8tHrWCED05K+gQS+x3M0Wt/63RAcOvABuGOgk
         +My/TbAuxHtLe3hOMwPw3iFWwLvK7lQwR+dbuefMCf6z1QZH4JXEDzF24+UBB74Apr+h
         bosgExVsgWWZE+9PCqTgc7v0KHILSJLogvJQrCOv/xcLitGTwJp8XDxSsZ7csV/MvGiq
         vMBaqOjVc2jG8QYtKMP4L4A11Zmp1QB5AvB1ujLQHnrQL1OlcnV2wT0hjSrx4Y908Ew2
         EICTaa6/YiuF1ANqiy68YPsdn4T95ePf0fmHzfLeGpbVNxsyL4eFZh3Kyq1zelHA3XAY
         lbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725388619; x=1725993419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PquCzpBQxckopb5g2wFn+ZyjJzmKndGiHDxxGCGscU=;
        b=FrmDD8DLfbCUZOFZ/KznXKzPfCl+wEZDccbj4mUxyT8/D036TR8gyA2LzPtTHdi7SL
         Dw3N2ETNAtIkg6xE3vIxoFOpSagoOiK+HfiamS/vxW5QDyCPphHdAkkNOwMhgdrX+/9T
         52//dpT1bNO1uxpn3mmsnHYXFcpasuZiO6MjxG16Y1xaiSpfsQiVskaCeOp5kO/mQUgV
         dBv8Olx8XQ3NjgYzfAnxoN6bu0O80TOpXxNb76Cv8kHfrIxCar/0ETAGYTz+U1aTd1Bb
         wKY/Wk74ovHGNeKRfSikjoUPvaOrXI8MIYbZ2AEKkUPL6SHPWSfYzZMCJPdbGiVPjFG5
         UI4w==
X-Forwarded-Encrypted: i=1; AJvYcCU3XL75ZMEJcNPVCx4C96PweMBFNpwj9fl7rUYJONKWakZ37TY0UfFw44VKWsDXz8bBhpFHA4oFAAde@vger.kernel.org
X-Gm-Message-State: AOJu0YwVC0KscAfQnksHkAzNGGr69N+xxQZV2czTPy7a3hhxMD8dbrjt
	5xbF22MraXniHVLu8XES81fjdiQAro7cM32znOn8ySg7uQNQCh/P+JW9eZY3ThFhQTEblu+blFH
	TPe0PzNrOvUYReLxwGDWVwdyjidQ5j56EGWI2JMY5av7oNkcX
X-Google-Smtp-Source: AGHT+IGbjJtekEa3t2dYJC8Xj6XtuDHK1yJ2uZ2mG3+kcU+1x1vZT7qFDeeeDqgkzze6gPZN9sUdsue1YPAlOjLXO2o=
X-Received: by 2002:a05:690c:112:b0:63b:d055:6a7f with SMTP id
 00721157ae682-6d40fc15df7mr151478767b3.38.1725388619041; Tue, 03 Sep 2024
 11:36:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903154533.101258-1-brgl@bgdev.pl> <20240903154533.101258-2-brgl@bgdev.pl>
 <Ztc4A0rZE3G1oHo7@smile.fi.intel.com> <Ztc4f3AOpppiL4Dt@smile.fi.intel.com>
In-Reply-To: <Ztc4f3AOpppiL4Dt@smile.fi.intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 3 Sep 2024 20:36:48 +0200
Message-ID: <CACMJSeu+OsDc7ZiQxxN5gbKaq4DSYsMPC7S_A=9eesiWrQPaGw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: mpc8xxx: switch to using DEFINE_RUNTIME_DEV_PM_OPS()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Martyn Welch <martyn.welch@collabora.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Sept 2024 at 18:25, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 03, 2024 at 07:23:31PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 03, 2024 at 05:45:33PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > >  #include <linux/mod_devicetable.h>
> > >  #include <linux/of.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> >
> > You need pm.h as macros defined there.
>
> ...or both...
>

pm_runtime.h implies pm.h.

> > >  #include <linux/property.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/spinlock.h>
>
> ...
>
> > > +static DEFINE_RUNTIME_DEV_PM_OPS(mpc8xx_pm_ops, mpc8xxx_suspend,
> > > +                            mpc8xxx_resume, NULL);
>
> This one comes from pm_runtime.h, but pm*_ptr() ones from pm.h.
>
> And it seems you wanted pm_ptr().
>

Yeah, I'm not sure really. The suspend and resume callbacks for
platform devices are not documented but it looks like they're only
used for system sleep. Martyn: which one do we actually need?

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

