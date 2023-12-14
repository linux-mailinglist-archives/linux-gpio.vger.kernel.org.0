Return-Path: <linux-gpio+bounces-1498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E5C8135EC
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 17:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FD881F2191D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0715F1D6;
	Thu, 14 Dec 2023 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYZ9yyGI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C27E8;
	Thu, 14 Dec 2023 08:14:46 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d37a6926f7so1843055ad.3;
        Thu, 14 Dec 2023 08:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702570486; x=1703175286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ren91EB9Lk+40jzwODpGvvvWMNi0QOKNAMntVYGkGks=;
        b=LYZ9yyGI5/O6134+RaTEfcY3rpurNmo9UWPTn1nf7ke3yaYVSA5m+eEGbcWLXIcHa+
         W8MuCnZMGxYnWZKrStjeL57XUA/LjdWQeaYbil9+ydNe0CqzY4aOuLRo/E9LBn104fUt
         CogVzlvsdmeqZ7cO/nWqYcvmx+kz7Pv92kTU7axozpOcX0AD67DJIK6FVCrGtvJaxM3o
         aiDUnnMgv1487V9S58D+tUv6ifrksWPWUKRSXaqFx2o7jLGkqow4B4A1aVMV/bCTUbR5
         Nv/N/yvJtc9cZeePOYqjr4bjb09tYZBGQfudlez5zLKfXiRiTmYGSY3ifMJv7gkBu0R9
         76wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702570486; x=1703175286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ren91EB9Lk+40jzwODpGvvvWMNi0QOKNAMntVYGkGks=;
        b=Be8+IRQYBSmj12WOJTHw1Ac0yWP84CUs92pT3xALWr7PPHW6aynjw6e605PTeAQvjH
         uLG2172lM3YmVGgcw1DGai4Mc6+OMm7766R53owJubjxCxJMQ8ed3UOUGMnBM0At7w8r
         j/9CLQwn4WjNs5qwyzrZ4ZbXO3omDO31vxHSkxmz17CLAgXMPYQDiR8+9CeKSFtL6exP
         HMpiiYcK57yLeC5FfEy+oa+TkvtdtaYHati8j5yf2JYd+ow3L1X48Ui+bSQEW0GzcsRk
         zzSKbCIZoecRUvp3Y6S95cqYr0+mhrxYNOf6vQWCPusA1SmFtSzcyaHLK2SQvnQLzABX
         8O/A==
X-Gm-Message-State: AOJu0Yzk7z2hnCMcgQt2v80FeuPEcDAEDYCetpqSiDAQaWf+qKZqsl1U
	BZMDIOSvEvpgxKnz2oAauwU=
X-Google-Smtp-Source: AGHT+IEEvjksM+ciHK7Jxy5B51QteYGpk+B4xz9dctLrrUi1I6oQB8FANtdvlyC47FWJUjvxUq2vZg==
X-Received: by 2002:a17:902:e54a:b0:1d0:6ffe:1e8b with SMTP id n10-20020a170902e54a00b001d06ffe1e8bmr6740695plf.110.1702570486156;
        Thu, 14 Dec 2023 08:14:46 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090a734800b0028ae9cb6ce0sm3444773pjs.6.2023.12.14.08.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:14:45 -0800 (PST)
Date: Fri, 15 Dec 2023 00:14:41 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 2/5] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
Message-ID: <ZXsp8QjxsUMPlZIR@rigel>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-3-warthog618@gmail.com>
 <ZXsZJ9z7iln8uMf8@smile.fi.intel.com>
 <ZXsajZoQRw7HgHl1@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXsajZoQRw7HgHl1@smile.fi.intel.com>

On Thu, Dec 14, 2023 at 05:09:01PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 14, 2023 at 05:03:03PM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 14, 2023 at 05:58:11PM +0800, Kent Gibson wrote:
>
> ...
>
> > > +/*
> > > + * Used to populate gpio_v2_line_info with cdev specific fields not contained
> > > + * in the struct gpio_desc.
> > > + * A line is determined to contain supplemental information by
> > > + * line_is_supplemental().
> > > + */
> > > +static struct {
> > > +	/* a rbtree of the struct lines containing the supplemental info */
> > > +	struct rb_root tree;
> > > +	/* covers tree */
> > > +	spinlock_t lock;
> > > +} supinfo;
>
> Hmm... If I read the kernel-doc script it should support anonymous structs
> and unions...
>
> ...
>
> > > +static void supinfo_init(void)
> > > +{
> > > +	supinfo.tree = RB_ROOT;
> > > +	spin_lock_init(&supinfo.lock);
> > > +}
> >
> > Can it be done statically?
> >
> > supinfo = {
> > 	.tree = RB_ROOT,
> > 	.lock = __SPIN_LOCK_UNLOCKED(supinfo.lock),
>
> I even checked the current tree, we have 32 users of this pattern in drivers/.
>

Ah, that is what you meant.  Yeah sure can - the supinfo_init() is
another hangover from when I was trying to create the supinfo per chip,
but now it is a global a static initialiser makes sense.

And I still haven't received the email you quote there.

Cheers,
Kent.


