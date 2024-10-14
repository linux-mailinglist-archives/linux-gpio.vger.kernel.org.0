Return-Path: <linux-gpio+bounces-11300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F499C684
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 11:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66D1528158B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5E01581E0;
	Mon, 14 Oct 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQvptYQ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503EE154C0F;
	Mon, 14 Oct 2024 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899721; cv=none; b=qtNqVRuDHyGlR8vRqpXdZT/GH0x96ai+jk3c9pct3LDjgWJG07zBo7D+2d1QBZYhhY0/Bcc72E/M4EEWRt9dsmXvqbceqy+DituYAbjyPbXhBCQZ6OJIga+5R/bqNOpuWm5nlK8aScdEsCbVMI40yQc5DLeCQoNgPbjyo2KR2RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899721; c=relaxed/simple;
	bh=KkCgrXa/oWzpa1J49FBXQbDXSgo51TcBPgiKaXroLRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGlwu6houoIU8bxUQM9clNXoMDr8uplUtgwNM8qJxPA3LIdkrPhHifafvslh1JJqzU+9Xr5yXiBTC5TL7ieECsEfuVxa2xYUOa8iJJ9JTOnlbC2JXM3eBHJB4/UI37C1RVIjLdwsxOf2WZITlE3oTpyBrxSZfizMYF+/2jpXUvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQvptYQ1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cf3e36a76so5287125ad.0;
        Mon, 14 Oct 2024 02:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728899719; x=1729504519; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Mz2sCEaEzIupDZZTt3zxlE0NPq21fGwhAHBJ+u8CMY=;
        b=AQvptYQ1hrcaMhG+TZD2cVaKL0Zdo89HuMMmCdGN/lTk1GBXnL1DgDlheUmZn2LU4Q
         bKKegNOQPloPESA8NjI23MoawWFKg9l1i6crZ+nnjaxjQnFk5KGxxYEJbMV/r7HWSlrr
         j+0letdgluaTETc8JL3VtCZ8jLOGOjb3Klh2qG6HgRNsYUeu/EPRDFMJzKH64Pi7UB9B
         8aQJQxhoS1yioEA8Rew2/zIUnNDYHccPmFT/PZfYe2z+WX2gXbTlROf6VwecByHRdEEa
         Kgt7NwXKr5KAf5vCyKcMR72+PMNY28iBOv6ZkH/8uF5SfNi5MCee2EgP2jeiC43Emsty
         1Arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728899719; x=1729504519;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Mz2sCEaEzIupDZZTt3zxlE0NPq21fGwhAHBJ+u8CMY=;
        b=nywwygspjVE4NzBr+Aui40qwfXmOj0cM5GxStNmSyhG72hcM6Wyhko4TxiD7V5KX/r
         gp5V06j4ianzfuXbNsP5qSoYwbwNQQKuZC1/p+W70XpeCBa9Nxvi9nL2r7Idm2EuzGvw
         kDaW7SO+xMdqoHkiOjznCFjUbLH5iJeg35zg+L7SPW1tDctFXrsd9THQShXPW0UPw8K7
         GQkDVYueXlbgJPpAbZoUW8ytokdcZhsDyzqrMjqp0sxpgTiGtWUjobmGxtNk2UNMbLmy
         pcoTstLtxBWKJnYHt7HDEowag0YmkfFnvkTEo9W0nux/AVGzFiSPoR9syCTseFzE+LZC
         2K3w==
X-Forwarded-Encrypted: i=1; AJvYcCUjK8kzWOhX1kZX2KZKrk+FBwT/pHkIkF55Hrspk79MPwuAbD/lujxq5gu2k4sg3Ghr7qlBCWDOL3MgBNeN@vger.kernel.org, AJvYcCW3+g7F6WNbKXeIzLHpRMPaGAJ377ED6LWk67d57z7IF5eThTUlOWrWx3/RhHh5Ac52YiHIKUFNnDzu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqh1b2vqckChJFupPKxlmmOJ6VKuZpLOJeTYgPS5vKpN3kE+Xp
	Jyu4IiSagt3nBnJFOEpW8ReofHBEgeElgO6xIOR0nxu35xuBcNODHGEMoOq+
X-Google-Smtp-Source: AGHT+IH+1J2mT4B/lFeNOQC/Gv5JAeQi7w/ttWN+mBOfl4P7khQFSIb8+z9MxUEzpZDw703s8LxAeA==
X-Received: by 2002:a05:6a21:e8d:b0:1cc:e409:7d0c with SMTP id adf61e73a8af0-1d8bcf3bcd6mr15783694637.25.1728899719438;
        Mon, 14 Oct 2024 02:55:19 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5df1128sm8486210a91.16.2024.10.14.02.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 02:55:19 -0700 (PDT)
Date: Mon, 14 Oct 2024 17:55:14 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 5/6] gpiolib: switch the line state notifier to atomic
Message-ID: <20241014095514.GA108314@rigel>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-5-b560411f7c59@linaro.org>
 <20241014021140.GC20620@rigel>
 <CAMRc=MeoSnr-z=fmfRoTU-vdL_BAkTAE+0HiBaVUWmFG-bOTPw@mail.gmail.com>
 <20241014092450.GA101913@rigel>
 <CAMRc=Mdf8CLQDPL8RMyWPyx8362xS3jEBe4zM=JL_dzRgF5wow@mail.gmail.com>
 <20241014092955.GA105498@rigel>
 <CAMRc=MchnY==2vLFUaOEJSTqaLvimkyNSixNpqbPkNyzSGew9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MchnY==2vLFUaOEJSTqaLvimkyNSixNpqbPkNyzSGew9g@mail.gmail.com>

On Mon, Oct 14, 2024 at 11:32:24AM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 14, 2024 at 11:30 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Oct 14, 2024 at 11:27:05AM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Oct 14, 2024 at 11:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Mon, Oct 14, 2024 at 09:48:16AM +0200, Bartosz Golaszewski wrote:
> > > > > On Mon, Oct 14, 2024 at 4:11 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > > >
> > > > > > > +     /*
> > > > > > > +      * This is called from atomic context (with a spinlock taken by the
> > > > > > > +      * atomic notifier chain). Any sleeping calls must be done outside of
> > > > > > > +      * this function in process context of the dedicated workqueue.
> > > > > > > +      *
> > > > > > > +      * Let's gather as much info as possible from the descriptor and
> > > > > > > +      * postpone just the call to pinctrl_gpio_can_use_line() until the work
> > > > > > > +      * is executed.
> > > > > > > +      */
> > > > > > > +
> > > > > >
> > > > > > Should be in patch 4?  You aren't otherwise changing that function here.
> > > > > >
> > > > >
> > > > > Until this patch, the comment isn't really true, so I figured it makes
> > > > > more sense here.
> > > > >
> > > >
> > > > So the validity of the comment depends on how the function is being called?
> > > > Then perhaps you should reword it as well.
> > > >
> > >
> > > The validity of the comment depends on the type of the notifier used.
> > > As long as it's a blocking notifier, it's called with a mutex taken -
> > > it's process context. When we switch to the atomic notifier, this
> > > function is now called with a spinlock taken, so it's considered
> > > atomic.
> > >
> >
> > Indeed - so the comment is brittle.
> >
>
> I'm not sure what you're saying. We know it's an atomic notifier, we
> assign this callback to the block and register by calling
> atomic_notifier_chain_register(). I fail to see why you consider it
> "brittle".
>


I realise that - I'm not sure how to rephrase.
The comment is describing changes in behaviour that were added in a previous
patch.  The comment should describe the change in behaviour there and in a
generic way that is independent of the notifier chain type.  Tying it to the
notifier chain type is what makes it brittle - if that is changed in the
future then the comment becomes confusing or invalid.

I'm not sure that adds anything to what I've already said.
It isn't a deal breaker - just seems like poor form to me.

Cheers,
Kent.

