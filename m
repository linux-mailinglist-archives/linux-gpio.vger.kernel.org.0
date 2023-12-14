Return-Path: <linux-gpio+bounces-1470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE2F813372
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6652A2830FC
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 14:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A9F5B1E4;
	Thu, 14 Dec 2023 14:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZ8Zs4fy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6548D91;
	Thu, 14 Dec 2023 06:45:23 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-28af2f9a0f6so1015417a91.0;
        Thu, 14 Dec 2023 06:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702565123; x=1703169923; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0OGUCjiWquGGsTrpvsPwR69C78xlzg3lziD6TLbqES8=;
        b=RZ8Zs4fy02E4KcM8ysZ3MCN0dhSQ34LVTlyv1f/WCBY3+b6GjRZgQt9wnb51rwNm2N
         Bje+Shd0RS5STqjPkfaG9p6yuxGYT3HlBl8pvzqW2U5/JncQyFWBFXpmOR1MT3A+UoWk
         /6TJBEM5nfmKoKuQMpTV1cgrnY+c6asTb4L0ATMFKBn0+m6ODcxU7A0/GtETemNEEGuv
         qSq2HkJWJLTQjX3lZTZ8luy4jpEYo5usbs6pkQNpgzDlFRHVxImL5SebUFT/b+Yj9tA4
         k6JgRcaxzXgGZn9Xe3mmOJpGeztW33bJFqUhMaAuJ/+ZPFJcLSSYdpVTqi13RVxC/YAB
         bVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702565123; x=1703169923;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OGUCjiWquGGsTrpvsPwR69C78xlzg3lziD6TLbqES8=;
        b=k9/bqfWw0bodtTytzGiM/5XLdfS6MftupSzwleull5BHsvXyPcMZEOnhcM3EagxEQu
         fH89JmvrDOBcCi4+xRDK0t1ve5aKyYlBHOSC18Q74s65ypP2daVcmXoC7YWGexnGsimu
         fgN1mC+rriM1mpno/lpWYPIwa3QoQqJsvkMInMxtoz37jCN3cE5j/RqxqhEaEARVA+nh
         ryJRUdhMoOJ8Ehgi7nNHq88ekb6r6hg6cK75VjjzuLJSb/up60fAR+WDcy7vZTH9V1AV
         YpHwblYKOrN63trTjgLSoGmLIY8m3EYjP//6E4tWeIkaNQmLNiSrtj5OOjqY06MvIR9N
         FIcw==
X-Gm-Message-State: AOJu0Yx3lpFvFAGMOdtAb+PHfWkd4qhJkU7Jainpl63H3OCgacnBu0sJ
	bVSeOyfpZ07gWLkp+EO8U/k=
X-Google-Smtp-Source: AGHT+IHlvDwW8/5QhXnoHYWgF0ufF5XpxbzlaA0e2gNQShtcPzR0gE3UtTlJOecqDkGfggAg8j5Qvw==
X-Received: by 2002:a17:90b:1d0d:b0:286:6cc1:2cc2 with SMTP id on13-20020a17090b1d0d00b002866cc12cc2mr4538662pjb.76.1702565122780;
        Thu, 14 Dec 2023 06:45:22 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id nb11-20020a17090b35cb00b0028017a2a8fasm13360780pjb.3.2023.12.14.06.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 06:45:22 -0800 (PST)
Date: Thu, 14 Dec 2023 22:45:17 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, andy@kernel.org
Subject: Re: [PATCH v2 2/5] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
Message-ID: <ZXsU_UN6g0Fdj4qx@rigel>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-3-warthog618@gmail.com>
 <CAMRc=MeoeOgZaz6xT+ScVjOemVovrEHvQDBvqsN1pD9U3haE_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeoeOgZaz6xT+ScVjOemVovrEHvQDBvqsN1pD9U3haE_A@mail.gmail.com>

On Thu, Dec 14, 2023 at 03:29:28PM +0100, Bartosz Golaszewski wrote:
> On Thu, Dec 14, 2023 at 10:58 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> >
> > +/*
> > + * Used to populate gpio_v2_line_info with cdev specific fields not contained
> > + * in the struct gpio_desc.
> > + * A line is determined to contain supplemental information by
> > + * line_is_supplemental().
> > + */
> > +static struct {
> > +       /* a rbtree of the struct lines containing the supplemental info */
> > +       struct rb_root tree;
> > +       /* covers tree */
> > +       spinlock_t lock;
>
> Looks like this is never taken from atomic context? Can this be a mutex instead?
>

Correct, only from thread context.

Can be a mutex, but it only covers tree lookups which should be quick
as the tree is kept minimal, and I wouldn't expect it to ever get to the
mutex slowpath, so a spinlock seemed more appropriate.

Cheers,
Kent.

