Return-Path: <linux-gpio+bounces-4522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28742886949
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 10:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D18A81F243FC
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Mar 2024 09:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF84520309;
	Fri, 22 Mar 2024 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="woCsGRhj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC836208D6
	for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 09:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711099905; cv=none; b=VipLz1zyW6VoQtKowRHgvDRYXVKgKaHCHKnJYNmFEznSiPrJSwvuz5ZC8kRGwZ6HFbnaweUg6ed9b3jPAzaMsGzp3WUm+1XnEkE0aC3xmiPxDTfiI3+3ibf6FzUR3+fFXYwdp0tION6YrN81jZWBhYUqwPYVIFnNvpJtluY7++E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711099905; c=relaxed/simple;
	bh=gADTjc2dxeesohFGmu4WtjCwknaJ3Fafeo6D42wFGkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSxMAJqrOS+/RZK7E4UPzYmf6ddZBSbE5SiT3iAH9nLqyyHQIC6XxWi26TlZtMYmg6g5mIODVSrwvXv3P9bj69VKDU8m+cF2jIYauEIYfqdmsro+qggH0qzVxlrn7vjHM00gpMdTA9HP2jdKxExmtpNplfwmB1OzewnqxpCVk+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=woCsGRhj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4147e3e4d3cso404295e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Mar 2024 02:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711099902; x=1711704702; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7E+eUGe/hdcugl2ZZv/ZnjrSpu6srn2v/HM636IHEis=;
        b=woCsGRhjq1IoiIsXs8xnssttIN6SQ5LULuMKNhVUAjAz9vj6og0B/XOdcgPxJbySBR
         65rqEkw25Aj81QFZYmx8/NLiBu3/A+La1/hLJj66xGyTW+K5pDWKdfeOwtMiUrYQLaDv
         c2usZaoQX/RfBytugCiXzUjyPxOqw4YsouhQ77753UVBk4JJSi2y9L90dkXFPFQreiO2
         Ju3jBYlT01o7PNUu9ZiNOBHYzfwGyj5xHBBkIRhH0CTGQiaJeCoHhuBTikgH1rQ93e6S
         rPG9EMjRIR7KLM2/czG7LxOUGhB5XI8S+RZRnVw8xHOJW5BIlpaNDLIV3FrWrIft8k/d
         cukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711099902; x=1711704702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7E+eUGe/hdcugl2ZZv/ZnjrSpu6srn2v/HM636IHEis=;
        b=gTQtBcwXme3wvDu/3LsJNVyw+DVoX7V+qeRBveWoX5oK4fe0TrZelKxVMuURddXzst
         M5k/vClHr5N23yiS4YQzSX0O2Ac5BNdQQUGTY/pDjGkZwsFYGsu6N3vVWu3Bf1+hZ6jy
         soUPijqn335m1L91qYL7jcAFz4j5znw+xsIK+vnVc28MgsxDRfokD2ecYtQdraoyH6u+
         93OYV2f2aaWgEGLqgqfykKgzT5CaX33PzLpsc2f5UEQGPGHIKOpjHTkyCqkBhKySATBW
         ML4N1Oq75oZuzyhrbQdDm2VcEB3u1e+d/aqXkyVPzKqS/Fq4Ef4pNevOcdRfJ/ET2a0U
         2PNA==
X-Forwarded-Encrypted: i=1; AJvYcCUl+o6od5Jj6RxsJU0bAGuc+zLdu9H6y41f8LGZ6LE9Flk6xA1YpTewapNQFl1k8ZyJfWQqkhPzFsIGuUev8U/59Zq9EfHOfpnHcw==
X-Gm-Message-State: AOJu0YzAA7zFS/qN1KP7nveKVjoRrSgUN/1Ok8wdv2lmvXSzf6Vtxiuo
	oSaymfuzADLLRs5GsAJX0Or811Al/Cgmqisl72lAfqWkWy4F2cm+f+52Q5IcF8U=
X-Google-Smtp-Source: AGHT+IEx9+6Qw0hrRUZxzQ7LLuPG4KUN4sIHa+qcrOs3KA2kgTDh+sJcM3kgVXFOcm3zkWzxm860gA==
X-Received: by 2002:a5d:6583:0:b0:341:ba2d:bddd with SMTP id q3-20020a5d6583000000b00341ba2dbdddmr369781wru.1.1711099901869;
        Fri, 22 Mar 2024 02:31:41 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id df10-20020a5d5b8a000000b0033e756ed840sm1641939wrb.47.2024.03.22.02.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 02:31:40 -0700 (PDT)
Date: Fri, 22 Mar 2024 12:31:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH] gpio: cdev: sanitize the label before requesting the
 interrupt
Message-ID: <f529d746-f8c5-466b-860b-e2bfaeb2cc27@moroto.mountain>
References: <20240320125945.16985-1-brgl@bgdev.pl>
 <20240322013034.GA4572@rigel>
 <CAMRc=MfQnZQU_t9-uDPp18vFikz_9eP6LtnWJYG0+KFgWjBcEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfQnZQU_t9-uDPp18vFikz_9eP6LtnWJYG0+KFgWjBcEg@mail.gmail.com>

On Fri, Mar 22, 2024 at 08:46:50AM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 22, 2024 at 2:30 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Mar 20, 2024 at 01:59:44PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Let's replace all "/" with "-".
> > >
> >
> > I actually prefer the ":" you originally suggested, as it more clearly
> > indicates a tier separation, whereas a hyphen is commonly used for
> > multi-word names. And as the hyphen is more commonly used the sanitized
> > name is more likely to conflict.
> >
> 
> Sounds good, will do.
> > >
> > > +     label = make_irq_label(le->label);
> > > +     if (!label)
> > > +             goto out_free_le;
> > > +
> >
> > Need to set ret = -ENOMEM before the goto, else you will return 0.
> >
> 
> Eek, right, thanks.

Smatch has a warning about this, btw.
drivers/gpio/gpiolib-cdev.c:2221 lineevent_create() warn: missing error code 'ret'

The other warning here is:
drivers/gpio/gpiolib-cdev.c:2269 lineevent_create() warn: 'irq' from request_threaded_irq() not released on lines: 2258.

regards,
dan carpenter


