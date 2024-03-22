Return-Path: <linux-gpio+bounces-4527-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDD1886C79
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 13:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93BB91C21E1F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 12:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C97D4502D;
	Fri, 22 Mar 2024 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dec6TVH1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E6744C8F
	for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711112323; cv=none; b=AJ5kwAvQb267wiGjb+eqvjyEKv199tDwRpjc6EfTLZR9cO+cU5FpzC+ckHYoBMuIEQ5DoHpvbvlzKcQatt1I/dQJd4bk1sxSvc6nYcjqPn44uBVAdwsw01UzwQmKzeTV7P4Uqvvy/wvB4gHJxBSNUuJNioHDMMxLU/Cnm8mH0Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711112323; c=relaxed/simple;
	bh=aAswaIdmxvMSh25JKNEAx3mUmnA1VZ5cxwrrtABNFHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjboT5RJgGfDd2KlcVZaVKBlFH04pmw2cU4iZZRUtMIRACLUCVCz7yDrjbmMGiaWceQJ1szeHVySo2BotG1ML6/BuaQ9QKXiYeR/FPoJj6BC4OACk8lF5CL+m6ac17hNw0TylYKZGKOzdZtadD+2AZyAg0YNqac4wvWyNszmI1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dec6TVH1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-414783a9edcso8759845e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711112320; x=1711717120; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YVyQMm8QpPiBgdk2MOVcgSZWNA9sQoBQ3kat6aE3a4Y=;
        b=dec6TVH1QCd0syB9pQyIjgfQ5o/fe+Hp8Rr2Vs8zzEWcOLHoeesPOGYay4ploOqCTn
         gUreVIakymig0abdCDHy2TL4EiUh2n/yn0jt5iP6gXVkfv3q8pQkUHpGXynP9TLhZXOY
         8steE5dsAUFtH0BXC1nBIGb+RwsVJWk2ULqOVsUPO16foYqmu8gd+KE+TTKe2NvLWPkb
         uAF+vkf4BV6ZjUqpmpydrCqr8t86FLFMTZxWJJRpdiZvp9cuLMTBsxvRFptvPST9m6ZU
         2BAmvbvO9iAHbt0qUZMQYUm5wVul4imVuUir+pDvF6o8tfnO6w1gLRW0Tv9L4CAXd2uu
         wjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711112320; x=1711717120;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVyQMm8QpPiBgdk2MOVcgSZWNA9sQoBQ3kat6aE3a4Y=;
        b=jZUDCt4fbmfnfiC0SGGdZq8x/qZbYi3jS0qgTXna3QRUyIyWRxIypXXQ7DFUzMp1+k
         1HRtSSZhSrWu+LzPyMAbTu/QpRTPjLp625RALgCh/A5q3kF4ek2hZ72yJNF9P5Evwn4i
         msZlVnKWgoMNJLi/YDLf+iAViFLqiemOJOEkXV7eK52t1KCfCgys0WMTtDGkQJsTWrgy
         0lECsNhvfyCYVVck+k9cp6Bj49Eh9DDYXkb+16Xo7+teI393dmJNOCvWPlwG2oXbSPXO
         bY8PhjTBo+BhptaE6Caj66RDb08c2thwTJkNkrLMPYpitgGALFGZOpdgyKlOE9Kmd07p
         ZWAA==
X-Forwarded-Encrypted: i=1; AJvYcCUgYUrAsTSzpthD73Awo5Kv0Ys0G4N3HiIdaGZM91gAiNuNi6ynkuFsXU+qj/WzJSajP7DxhYPH7PkF3sxazNfkrrKo/qGWjlK8lg==
X-Gm-Message-State: AOJu0YxTSgUrpgW229QalYxa6egJcSTpTwWDmyeJPV/Izs6NOp/5nDIP
	awZdbjh14s3lNr1wnp7PVfB6He+F/1YIU2zjjdXRPA0LE3e+kTI+ZjyCbvhSrFY=
X-Google-Smtp-Source: AGHT+IG1GXctvtc4AxO2wqsU81mOuUDYP4sQmFJKt4ISmtt46MX1aXQtv1ghCvfyet00WW8tsT0mCQ==
X-Received: by 2002:a05:600c:3417:b0:414:b14:5654 with SMTP id y23-20020a05600c341700b004140b145654mr1663621wmp.21.1711112319599;
        Fri, 22 Mar 2024 05:58:39 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id iv13-20020a05600c548d00b0041463334822sm3023218wmb.26.2024.03.22.05.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 05:58:39 -0700 (PDT)
Date: Fri, 22 Mar 2024 15:58:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH] gpio: cdev: sanitize the label before requesting the
 interrupt
Message-ID: <9d435e66-bb58-409e-aa30-9b89cb18dd9c@moroto.mountain>
References: <20240320125945.16985-1-brgl@bgdev.pl>
 <20240322013034.GA4572@rigel>
 <CAMRc=MfQnZQU_t9-uDPp18vFikz_9eP6LtnWJYG0+KFgWjBcEg@mail.gmail.com>
 <f529d746-f8c5-466b-860b-e2bfaeb2cc27@moroto.mountain>
 <20240322115419.GA31273@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240322115419.GA31273@rigel>

On Fri, Mar 22, 2024 at 07:54:19PM +0800, Kent Gibson wrote:
> On Fri, Mar 22, 2024 at 12:31:36PM +0300, Dan Carpenter wrote:
> > On Fri, Mar 22, 2024 at 08:46:50AM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Mar 22, 2024 at 2:30 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Wed, Mar 20, 2024 at 01:59:44PM +0100, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > Let's replace all "/" with "-".
> > > > >
> > > >
> > > > I actually prefer the ":" you originally suggested, as it more clearly
> > > > indicates a tier separation, whereas a hyphen is commonly used for
> > > > multi-word names. And as the hyphen is more commonly used the sanitized
> > > > name is more likely to conflict.
> > > >
> > >
> > > Sounds good, will do.
> > > > >
> > > > > +     label = make_irq_label(le->label);
> > > > > +     if (!label)
> > > > > +             goto out_free_le;
> > > > > +
> > > >
> > > > Need to set ret = -ENOMEM before the goto, else you will return 0.
> > > >
> > >
> > > Eek, right, thanks.
> >
> > Smatch has a warning about this, btw.
> > drivers/gpio/gpiolib-cdev.c:2221 lineevent_create() warn: missing error code 'ret'
> >
> 
> And that triggered a "what the hell does that mean" warning in my
> wetware error parser ;-).
> 
> That could be better worded - it isn't "missing", it hasn't been
> appropriately set. So maybe "unset error code"?
> 

It's kind of a pain to change the warning message after the fact because
then they show up as new warnings for everyone...  I maybe should poll
people to see if they care about the hassel of it.

> > The other warning here is:
> > drivers/gpio/gpiolib-cdev.c:2269 lineevent_create() warn: 'irq' from request_threaded_irq() not released on lines: 2258.
> >
> 
> Looks like a false positive to me - as per the comment in the code, that path
> (2258) results in lineevent_release() being called and that releases the irq.

Ah right.  Thanks!

regards,
dan carpenter

