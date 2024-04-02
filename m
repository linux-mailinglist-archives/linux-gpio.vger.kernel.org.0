Return-Path: <linux-gpio+bounces-5010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FCA89565E
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 16:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B87E7B227F6
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 14:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A8F86256;
	Tue,  2 Apr 2024 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDOFGort"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B886253
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 14:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712067098; cv=none; b=gxxM+cVCf4fgGoHsmZymGz4ecc0Eeh+atQb9GSf4yNY+ey56U9yPI+kRBdja6hS/3Sy3B3691pxONdS4FGOpQP4ev1ncL2n/PwskF+FBz+WDMQZhYOKhLsn5oqQAcr/qyCxVQeJEst0Dlv/tzqPTMkCBUNJtax1/RNOGbxSXrjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712067098; c=relaxed/simple;
	bh=WCDRnY/oJd/DONLSqBRLIktLGw9RKMQ5gh8bjDiLz/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhIC3MxODFs5IGIBsE1TLSH0rZbd04tKacfJF8guAPl58jZMhPsOIiMUYFFrlcDx52jjZHmQ6Y+dzCf6++O6mMgvJVoFH5q0pXQjsyBJ2gCjOYmQ7Y/MNXYpzGoRy9eQN9Imyv1MsfmfB47+cKs013FcqlBsrIu0JseITYeqhWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDOFGort; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso4569387276.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712067095; x=1712671895; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MfAyyaKhDHVtWK5o5tUmbDJTiRRfvCRYxpLagrGb6Sc=;
        b=DDOFGortmwEJvjM6jvCUVmqK2YAf91oZqQK2Id7XgCxDwZ8iiLxwRf/M2+AbMAn1YT
         klCNnNet9Rmi9HJtppBAXrQZkPstaP5f9Tf6ly2l56Uyc/NFPnPewo6Zygln3ezXOOfa
         dXXUtRg1z17QTMazZamIbkGrlvs/DGtGIc1oKLCyOhqA5PMNigmGz7ScJvg+m73t7Tgh
         SV3yEGwHMmk/omFlM+PJVcABSeDUw5/eABUHpZrezaC4DxPHn4BD2to9UWT1bLIGaCoQ
         AqzDYKGkhkEIKLCxDMHdX35pZ/ppg/QxP3iBDLil+d8oBRCAB7nmAvobxsY2TKLotVzH
         CgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712067095; x=1712671895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfAyyaKhDHVtWK5o5tUmbDJTiRRfvCRYxpLagrGb6Sc=;
        b=T2El3jAceYsU/UJi2i7TgHXcI7Il2jKkpuWnMOGxFa0S/VsikI1JAkMfdt+925p3DS
         JsIvjqRrL1fLwey+ilphNWaDafOzR2fnsMnoTyRVshO1zY7ut2tb7LTFw/LyTY5pyQpQ
         P3Gx7QLTRFG+IMGoZNieeIBatTnU6Gx0NhclrWeiU+FtU+C2EobpC5UrwVdJlWxWpBOA
         7h6p6CNXMQi2XGXM7nFuhcAu4tjf9ajYS7gRUS678Nax3RPYXqB8SY/I6WGGBUViRHqt
         CiZP8+YivUafNAd3W3p839J/x4eroKrfcck3nH1uagc4fyjK0GDiHoAzEPwhLnRrOn2E
         1QNw==
X-Forwarded-Encrypted: i=1; AJvYcCXJaCGRQPpe8IerLnj4eY3EsWN4YsjwgM/VDwqomx+JGT+fjH9pZpJjEFaNZ86xINw/+UdZZzbyYeUTWybNecshhmGXrCHjNLTllw==
X-Gm-Message-State: AOJu0YwsMPXlxqWEJCAA1eaDOUfu35le1AeSPIWfLd2hXCqNusZ8kqIC
	fa5Daj2KC7SSVCEA4y9N7wS7aZdULlWr3R3nvlnQ+kkQlBaWVt6kqY7FTuNRzVRq1/54PCXl0ot
	RQpXN1GqWW+FjmzWHiG1kQKlQw6zOkJfqi/1gMw==
X-Google-Smtp-Source: AGHT+IHtJx+kBMaX8BpuA0YA7KnAAQyaJsPxHeu2fo45Gx0F5VaYXK6jNX2qhgMuRzBxoSq5A3qMV2Nb0evHRXeU1LA=
X-Received: by 2002:a25:6ac1:0:b0:dd0:702:577a with SMTP id
 f184-20020a256ac1000000b00dd00702577amr10226940ybc.35.1712067095531; Tue, 02
 Apr 2024 07:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org>
 <CAMRc=MdM0hNf73jVVd7kSchUVVBXmtQqSwmhNXus4TVovBSeHQ@mail.gmail.com>
 <634bbfb6-a5a4-40ae-b89f-5fc50db43d4f@redhat.com> <ZgwOIKSRcK5X9-vu@smile.fi.intel.com>
In-Reply-To: <ZgwOIKSRcK5X9-vu@smile.fi.intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 2 Apr 2024 16:11:24 +0200
Message-ID: <CACMJSeub8aTbRCwEpW=V5A_aoE4iY+eoa4tnV_XfnumaEmJGDw@mail.gmail.com>
Subject: Re: [6.9 gpiolib regression] gpiolib: triggers: kobject: 'gpiochipX'
 is not, initialized, yet kobject_get() errors
To: Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Hans de Goede <hans@hansg.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 15:54, Andy Shevchenko <andy@kernel.org> wrote:
>
> On Tue, Apr 02, 2024 at 03:41:00PM +0200, Hans de Goede wrote:
> > On 3/29/24 4:16 PM, Bartosz Golaszewski wrote:
> > > On Fri, 29 Mar 2024 15:11:21 +0100, Hans de Goede <hans@hansg.org> said:
>
> ...
>
> > > Thanks for the report. I hope I'm not being naive here but would the following
> > > one-liner work?
> > >
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index ce94e37bcbee..69f365ccbfd8 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -1179,7 +1179,7 @@ struct gpio_device *gpio_device_find(const void *data,
> > >
> > >             gc = srcu_dereference(gdev->chip, &gdev->srcu);
> > >
> > > -           if (gc && match(gc, data))
> > > +           if (device_is_registered(&gdev->dev) && gc && match(gc, data))
> > >                     return gpio_device_get(gdev);
> > >     }
> > >
> > > This would make gpio_device_find() ignore any GPIO device that's not yet
> > > registered on the GPIO bus which is almost the last step of the registration
> > > process right before creating the sysfs attributes.
> >
> > Yes that should work and it has the added advantage that it also waits
> > for things like the irqchip to be setup before gpio_device_find() will
> > find the gpio-device.
> >
> > I cannot trigger the race every boot, but I do hit it quite regularly
> > and with this change I've done 10 successful consecutive boots, so
> > I believe that this indeed fixes the race.
> >
> > I've prepared a patch with this fix now which I'll send out shortly.
> >
> > As for Andy's suggestion I'm not all that familiar with the RCU stuff,
> > but I think that if we were to go that route then the device_is_registered()
> > check should be moved up to above the "guard(srcu)(&gdev->srcu);"
> > line rather then above the "gc = srcu_deref..." line, since in that
> > case we are not using the gdev->chip pointer at all if we bail ?
>
> I believe you are right and we need to move this check out of SRCU scope.
> (FWIW, I also thought the very same way after I had sent the message and
>  was hesitating to reply with that.)
>

Yes, there's no reason to have it inside the SRCU read lock section.
It doesn't protect the kobject internals. The variable checked in
device_is_registered() is a single bit. Once we see it as set, we can
assume the device is registered with its subsystem.

Bart

