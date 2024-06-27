Return-Path: <linux-gpio+bounces-7758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2732F91A9C6
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 16:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B3421F21402
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 14:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AEF197A98;
	Thu, 27 Jun 2024 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9UaZSgT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2A2197A76;
	Thu, 27 Jun 2024 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719499799; cv=none; b=ioU9aK7haC6jVd3uwCGT6y9oFvXlCQftg0g2lnE72K7zoo7PjGvFqjbAuuuNdav/GnJSkzqLaVnRWnXsv9PcnNt6ebyVpU52HL9bZxEbzWkfeArNpz+6LEHQ8SB2xNoi+Hprlgant3yZ6sNNuv3e4SYOJiL1pmkVJNgH5PN2MKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719499799; c=relaxed/simple;
	bh=MSPWnBepnAe/PUefg7VV7OXpRhMPmlSxkOQzZRLAM/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewC0xyTA9akTFgrmiHKoVAjmGuRye3sR8d8JNPkszvVNAR4phnUpwVzS5029xACRH1BRJ0nvtlib7XSG8LvB4TolArl1w7nhA0CxhFi+RRrb4TXFnltbjOZmGZQdVo655KcDgGae0WejNgGAq/k2gw/kf7hsYR8W2S22pJ8B6vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9UaZSgT; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70698bcd19eso2432523b3a.0;
        Thu, 27 Jun 2024 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719499797; x=1720104597; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GwArrcoUCt4AMY/a6jxu0EcRR9rZ/1l8YumaA7fhjtc=;
        b=i9UaZSgTdzNoNa394d7UbTPGuqhF0WtODBTSRvDgsTLUWJpMdveeww5S4YZ0H0mFg9
         FR7BnDOjc4VBajNiUmq6TOdEVGLw6smmwaoVhzVGr1mrRsaplOi1BgUHifwPA+10Jvwp
         XihwpQB7TVc0i8zdoN9R/xQ87+vxcDDRUQpkugfBT4TeBtoGGGN4gv+7cdrWkpg8ztxU
         PrnwMAR5xcK8X17MtY05+e/1eAvSHJNwbntd9Y3iwmNOnxJ1mBtdLStc88WF0RQhblyB
         W0zwwj3qr9NSKPpVfVos0kj58JPhGqw5pn4jj/vWZtDUpoKAA8nQ7WNVu3XVgQ+aEX8S
         mOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499797; x=1720104597;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwArrcoUCt4AMY/a6jxu0EcRR9rZ/1l8YumaA7fhjtc=;
        b=nqfhqJmySvNI5Wh6Kz/C/dTjx9hRtQ1VJ2/BqVqyzIvcMgQfwqj+Hj7Ec6ILU5jL71
         /9qf4JmboZv1yzzh3v2JIP47pZ+nq/Z1IoaGi1JDTH8kzSci4X5No2eKkW5sg8A8ciIH
         YVw5U5VpddLkjeRdc31ULH8oeI8/dvZt7hkIBzalbwGiSnS1ThtTNK7AhzM93/W08U2b
         oRW17AdihQCDUgXbdNU5jcgUXBPi2ETJoxrh2hTmPBPd85s4EDe1E34kgbcgvCQR8UFs
         lYcJG2BfjVkmimDTgPkj7VPmgOqsrxhGH0HcBwG5UtBkYodusTV6jbE5fx/YKzoc8pmn
         hpwg==
X-Forwarded-Encrypted: i=1; AJvYcCVZqxdL7GHnm7M6jx/+b19X3Q6sNhb0p9hob6YZfI2rnFwuRlDMlp1JUw0ISMYnV5jANxQ5H77OZ2YCPnBasG8pbq5pL57b27s2Vw==
X-Gm-Message-State: AOJu0Yw3a45mcDkE/F33tyMH4bqq2zgVng9dAsJVMPKQxwGo4Xqpe0NY
	ydh8Y4T78XT82tpoFtrdKajQiZmO7F1uNke8WvZQzbiXL4FdQ+57JNIg2w==
X-Google-Smtp-Source: AGHT+IHsQpEkulKV0s/uq4j85FZoxxExQxrxSWQHBrXp7jUigL3AqdqNKxH0omWMI3xDPNhICp7irA==
X-Received: by 2002:a05:6a20:12c5:b0:1be:c5ab:7388 with SMTP id adf61e73a8af0-1bec5ab74ccmr5035245637.25.1719499796772;
        Thu, 27 Jun 2024 07:49:56 -0700 (PDT)
Received: from rigel ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac9a7522sm14094895ad.246.2024.06.27.07.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:49:56 -0700 (PDT)
Date: Thu, 27 Jun 2024 22:49:52 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org
Subject: Re: [PATCH 2/4] gpiolib: cdev: Ignore reconfiguration without
 direction
Message-ID: <20240627144952.GA433043@rigel>
References: <20240626052925.174272-1-warthog618@gmail.com>
 <20240626052925.174272-3-warthog618@gmail.com>
 <CAMRc=Me1_4xjbt51j+gFVzR71VUwMSAm+dT=UtgOY-1xYoAF5g@mail.gmail.com>
 <20240627142248.GA414403@rigel>
 <CAMRc=McA2rY=-k83Pkz-P5yu=bT2nE8JhNMiEAP2zFbf95SQqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McA2rY=-k83Pkz-P5yu=bT2nE8JhNMiEAP2zFbf95SQqw@mail.gmail.com>

On Thu, Jun 27, 2024 at 04:44:02PM +0200, Bartosz Golaszewski wrote:
> On Thu, Jun 27, 2024 at 4:22 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Jun 27, 2024 at 04:06:21PM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Jun 26, 2024 at 7:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > linereq_set_config() behaves badly when direction is not set.
> > > > The configuration validation is borrowed from linereq_create(), where,
> > > > to verify the intent of the user, the direction must be set to in order to
> > > > effect a change to the electrical configuration of a line. But, when
> > > > applied to reconfiguration, that validation does not allow for the unset
> > > > direction case, making it possible to clear flags set previously without
> > > > specifying the line direction.
> > > >
> > > > Adding to the inconsistency, those changes are not immediately applied by
> > > > linereq_set_config(), but will take effect when the line value is next get
> > > > or set.
> > > >
> > > > For example, by requesting a configuration with no flags set, an output
> > > > line with GPIO_V2_LINE_FLAG_ACTIVE_LOW and GPIO_V2_LINE_FLAG_OPEN_DRAIN
> > > > set could have those flags cleared, inverting the sense of the line and
> > > > changing the line drive to push-pull on the next line value set.
> > > >
> > > > Skip the reconfiguration of lines for which the direction is not set, and
> > > > only reconfigure the lines for which direction is set.
> > > >
> > > > Fixes: a54756cb24ea ("gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL")
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > ---
> > > >  drivers/gpio/gpiolib-cdev.c | 12 +++++++-----
> > > >  1 file changed, 7 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > > > index f7a129d67b7d..ef08b23a56e2 100644
> > > > --- a/drivers/gpio/gpiolib-cdev.c
> > > > +++ b/drivers/gpio/gpiolib-cdev.c
> > > > @@ -1534,12 +1534,14 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
> > > >                 line = &lr->lines[i];
> > > >                 desc = lr->lines[i].desc;
> > > >                 flags = gpio_v2_line_config_flags(&lc, i);
> > > > +               /*
> > > > +                * Lines not explicitly reconfigured as input or output
> > > > +                * are left unchanged.
> > > > +                */
> > > > +               if (!(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
> > > > +                       continue;
> > >
> > > Series looks good, thanks. I'd say that this bit here calls for at
> > > least a debug-level message since we don't return an error unlike v1.
> > > What do you think?
> > >
> >
> > The change to the libgpiod Python bindings makes use of this to support
> > reconfiguration of subsets, so on its own it isn't an abnormal path and
> > I'm not sure it warrants even a debug.
> >
> > OTOH, I did consider if there should be a check that at least one line
> > in the reconfig has a direction, returning an error if there are none, but
> > was on the fence about it and left it out as it added complexity.
> >
> > Would that make more sense?
> > Or do you have a problem with reconfiguring subsets?
> >
> > Cheers,
> > Kent.
>
> I see. Ok, I'll take it as is interpreting it as a feature.
>

I'm totally ok with adding a check that direction is set at least once,
if you would like that. Can be done with a reasonably minor change to
gpio_v2_line_config_validate().  Though that would probably still double
the size of this patch.

Cheers,
Kent.


