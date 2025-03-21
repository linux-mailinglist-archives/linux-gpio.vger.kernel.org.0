Return-Path: <linux-gpio+bounces-17837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F61A6B30B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 03:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E82803AF457
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 02:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317EA1E32A0;
	Fri, 21 Mar 2025 02:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="kOqfawuj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE0918A6CF
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 02:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742524661; cv=none; b=byGW76p15maXO/j9wgprKks98Vzl4hXJMgXO7JRmgoPY8dM6LATsRzwaQvm836xFPDDrsnKVlLye4ZmCkCCNiTLktegwiii0THczzSuNCwrph3uhnTWB3LEXVbj9xpUyI+ICbcwZwPaw59t2AvP7jNR+kxMghOXpscjrTJs0RkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742524661; c=relaxed/simple;
	bh=NzL5MhoyxILoggYXwncLpBDKP6RUCP+scqKZXIhJJXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SK0yXqJwJYZOLVda0YpD5JMQ4s1zjCM1qQRRlOfXZELJ0iUSQlISvBWm/NMJv7PknAsKA1rMWUMAYGIhXMvNEUwo2h0In9ikQdQpE565jyhCN1xOPzHPDdFACZpuwyuN+xrigtkQ/2jWvdibQ2xxwxCE9c5/Df3qZWVrmOIyjL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=kOqfawuj; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 29FB83F2BD
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 02:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742524653;
	bh=/TiJpfdGOANNODirv3oI1N0gAlEn2jC9qPa08xzAIEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=kOqfawujIVX5EAil70LGoFJQlkHBigluq7zraY7wB3rNgfvCYo5lbqKsSUs1zxGGC
	 yU3fnw2fdjPMSZD5+ewde5ssKHWgsFkzmYMSJLWRgo1BxdoIJcSfsB5tG4zpjweWq4
	 OR8wzUAX5vVgs/Sj1bTDp/80UEwV9vKNSF7FpczbyGuSGVF9/OXhie6jKAhoSP+FQl
	 kArFgLqoCx/bMOnz2B/Io2hF6yDvsRW5XbbqM04AnW9Zn6x3YOW+05UWy11+BI29S0
	 3LoNyPl3KYThrYdX1Hf9WN2z6UCBueuaR9RmzL7qrEjDRDrHxejM1NJ0RutaYlcV9U
	 lhYgoTJ0p89LQ==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so3762062a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 19:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742524651; x=1743129451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TiJpfdGOANNODirv3oI1N0gAlEn2jC9qPa08xzAIEE=;
        b=hFabg+OgdbIY0Hck5N1ARn3GeeAPLCmA69VLZ502/PgclmolGqbu1e/Bl5D9DemU+Y
         Ulr8zDulF85C/irXRveP0lCnRk9NV7NhwvLSoYHhpmRLWZ5QQwvEWOD6tX2hvkM7hXv2
         O+3b0jKyo6Lwi/KJHPaTmSAwY8frVXZT1AkDMy6SZEEAKNkwp2kQU1zL0MdJTkCx6pAO
         YGClMMGKinHqIolM22uWkT9RZBelZO30mMKx7Oov03/boBcbYL/fcK0zBkTQyClDzT+Y
         l4fC3bSlnPBKqXtUg8IafQ35EJ74mHupEBm5YnO+iCt5cT/s5iVgaJ+h/iSXScZTHTXW
         Qo5Q==
X-Gm-Message-State: AOJu0YwOUAsYBtygrKrvaz2dajkHEXXaPURFk5o144uOFp2kR9kKVjEx
	DjAPvaOWPNThyx2jSNyhUrZyvKPixMPSOboBM95A1Pq5zlWMYe56W4p6oCeNz6yomNyxopFWzLF
	Z49Tg0B55tkz7VCniCnrBAnjDHbG8+wfjBkSUXizsRJenJXXHNkk/ZJW9KdVh24mXUMqjmioBCQ
	M=
X-Gm-Gg: ASbGncuIi40ijrr5nL9Lm4MeshIPAz54PjxRtHqAweOwGqxfIMS2Dw4WIbeHDL7SP1O
	+7hAl0vNEacYhli8fPZ9gjoTaDJmIhlG2Zhl2O2yd/jWqDXwx4c3CInyNcUBRjP4ae+VHeGT86I
	nSGgSMyYKccpKOKcQqfCcbao00t9FIeBL6KudpsCB2P+YRVmyIi8RVamIV/RGLl8fAw/bTv9nWs
	PuSMB9YXD7VwrqXKnsmdE2j/OfyXPADo7EI0VyVv7FSgRTB5EPL3KXWztOf1T6I7j0O2iQ0hcR6
	8uKzr80da2YvxAg+wA==
X-Received: by 2002:a05:6a21:6e43:b0:1ee:e24d:8fe3 with SMTP id adf61e73a8af0-1fe42f358d7mr2755646637.10.1742524651649;
        Thu, 20 Mar 2025 19:37:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvh8o1abtTk5AEN91MvJywHrX4XvpZuDt/ZutsnhnUVS0aKDkLwlwV0igeqbDfx4zZcjJy2w==
X-Received: by 2002:a05:6a21:6e43:b0:1ee:e24d:8fe3 with SMTP id adf61e73a8af0-1fe42f358d7mr2755616637.10.1742524651297;
        Thu, 20 Mar 2025 19:37:31 -0700 (PDT)
Received: from localhost ([240f:74:7be:1:2dba:1af7:27b6:24fd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390617fa4bsm612699b3a.157.2025.03.20.19.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 19:37:30 -0700 (PDT)
Date: Fri, 21 Mar 2025 11:37:29 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/9] gpio: aggregator: add aggr_alloc()/aggr_free()
Message-ID: <llbybv6dpkfrtir75dveqnphrj6nuephvkoyywy6tx6vfbunl2@ft5io3thby6v>
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
 <20250315164123.1855142-4-koichiro.den@canonical.com>
 <CAMRc=Md8nB1U--qcZxpcKVzxTcON2hi-pmsUKFn+aBEqHuBzcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md8nB1U--qcZxpcKVzxTcON2hi-pmsUKFn+aBEqHuBzcQ@mail.gmail.com>

On Thu, Mar 20, 2025 at 04:51:04PM GMT, Bartosz Golaszewski wrote:
> On Sat, Mar 15, 2025 at 5:41 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > Prepare for the upcoming configfs interface. These functions will be
> > used by both the existing sysfs interface and the new configfs
> > interface, reducing code duplication.
> >
> > No functional change.
> >
> > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > ---
> >  drivers/gpio/gpio-aggregator.c | 58 +++++++++++++++++++++-------------
> >  1 file changed, 36 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
> > index e026deb4ac64..2692a31e01ac 100644
> > --- a/drivers/gpio/gpio-aggregator.c
> > +++ b/drivers/gpio/gpio-aggregator.c
> > @@ -36,12 +36,41 @@
> >  struct gpio_aggregator {
> >         struct gpiod_lookup_table *lookups;
> >         struct platform_device *pdev;
> > +       int id;
> >         char args[];
> >  };
> >
> >  static DEFINE_MUTEX(gpio_aggregator_lock);     /* protects idr */
> >  static DEFINE_IDR(gpio_aggregator_idr);
> >
> > +static int aggr_alloc(struct gpio_aggregator **aggr, size_t arg_size)
> > +{
> > +       struct gpio_aggregator *new __free(kfree) = NULL;
> > +       int ret;
> > +
> > +       new = kzalloc(sizeof(*new) + arg_size, GFP_KERNEL);
> 
> Please prefer declaring the auto variable and initializing it at the
> same time. Should be:
> 
> struct gpio_aggregator *new __free(kfree) = kzalloc(...);

Thanks for the review. Should I send v7 for this change?

Koichiro

> 
> > +       if (!new)
> > +               return -ENOMEM;
> > +
> > +       mutex_lock(&gpio_aggregator_lock);
> 
> If adding new code, please use lock guards.
> 
> Bart

