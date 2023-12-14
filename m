Return-Path: <linux-gpio+bounces-1495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 056DB8135A9
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 17:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 372C81C20C37
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A8E5EE86;
	Thu, 14 Dec 2023 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqO4XEIp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D8110F;
	Thu, 14 Dec 2023 08:05:31 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso3405822a12.0;
        Thu, 14 Dec 2023 08:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702569931; x=1703174731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+pSA4tfgqLwZZDsdzvywAZIXpKtEO31/z/D4LSeqZJw=;
        b=iqO4XEIp8Ci+uYegRHlOcNFlMR0HphiC+76/xqad/2VY5Up6AmLozPYmpZnLwnNR74
         EhVizv1Ba8UbBZzrftqnTNJF6/YSMgGh8r+GXh5s4g2nngekfMoB8BoH+Ah9ijVrg0cD
         675AIPw6Iphh/+qozEhMHI3koAOq9GlOrUOmUZd8gvM4+bZSrVXhKIj4DJkNjlISfzR+
         xJoRjOJ8L9GcEyrOtbG/n103hcs2InUM+S+BZeJw3q1KnZZw8SxBzFv4xP4MIcDQCBGo
         n7te4sre57jKSwYpiuBmFRAw3OX35lQU5JKfbcpvjC/hivOE/HNx2aSXgpLfhLmXwauS
         1wuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569931; x=1703174731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pSA4tfgqLwZZDsdzvywAZIXpKtEO31/z/D4LSeqZJw=;
        b=Bu9+/OLjxSAbhZhtezYWOAJBrA7MnwuE9TklmPwrTfiZvsDbd0nwVYkzK+oTvgLse0
         zL852ao6ZqFuBgEmPk7hwk0EMbN7b1Cw99cVUC5qCb7cE0j5O4OMjUEF6aIGuQlohjpN
         SQLyFHYE5FA2+7jyfFuYd3z64TQziVB+OfaOx/XJpZHQ3S+4roB19MhamRL44ZgLGcKy
         HshhPYqInvqUmVG67jB1ERmvg80+xZVglJUFIRK0Vd37K0/jo8tQJhEaGiuNmO0vPx1T
         fWq1zThQvMJ0yU+VmNBbByqdQ/E1d3n+0f9EFTPj1+BOUq6OINRnLdXR4HmPkeJtCTSs
         3h+w==
X-Gm-Message-State: AOJu0YwSBRB8Z2FPeDkWShprtxXFxXmTny5pYy0HhWk+1Y9I8h7lLfTa
	xNz9vfqZyvgRhF5pmX3r1Ju1KarNv+g=
X-Google-Smtp-Source: AGHT+IEWi/2nRQOnuaaGq/li77uqACPUjaUxj0vNWkGHSHSB34gMKP3DCzWbFwU/XSJOOXDLXH6QCQ==
X-Received: by 2002:a17:90b:38c8:b0:286:da6d:c41 with SMTP id nn8-20020a17090b38c800b00286da6d0c41mr7592458pjb.70.1702569931356;
        Thu, 14 Dec 2023 08:05:31 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a19c800b0028b0848f0edsm1818455pjj.9.2023.12.14.08.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:05:30 -0800 (PST)
Date: Fri, 15 Dec 2023 00:05:26 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 4/5] gpiolib: cdev: reduce locking in
 gpio_desc_to_lineinfo()
Message-ID: <ZXsnxqBt0vk-gd4-@rigel>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-5-warthog618@gmail.com>
 <ZXsa39xneH6Rh7Gd@smile.fi.intel.com>
 <ZXsc5T1G5Y28lVqw@rigel>
 <ZXse4UDKGlVqzsyD@smile.fi.intel.com>
 <ZXsglIJtK50XYCIV@rigel>
 <ZXskOKAyEtXTLMRt@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXskOKAyEtXTLMRt@smile.fi.intel.com>

On Thu, Dec 14, 2023 at 05:50:16PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 14, 2023 at 11:34:44PM +0800, Kent Gibson wrote:
> > On Thu, Dec 14, 2023 at 05:27:29PM +0200, Andy Shevchenko wrote:
> > > On Thu, Dec 14, 2023 at 11:19:01PM +0800, Kent Gibson wrote:
> > > > On Thu, Dec 14, 2023 at 05:10:23PM +0200, Andy Shevchenko wrote:
> > > > > On Thu, Dec 14, 2023 at 05:58:13PM +0800, Kent Gibson wrote:
>
> ...
>
> > > > > > -	spin_lock_irqsave(&gpio_lock, flags);
> > > > >
> > > > > Shouldn't this be covered by patch 1 (I mean conversion to scoped_guard()
> > > > > instead of spinlock)?
> > > >
> > > > Read the cover letter.
> > > > Doing that made the change larger, as flags gets removed then restored.
> > > > I had also thought the flag tests would get indented then unindented, but
> > > > if we use guard() the indentation should remain unchanged.
> > >
> > > I'm fine with that as I pointed out (have you received that mail? I had
> > > problems with my mail server) the dflags is better semantically, so restoration
> > > with _different_ name is fine.
> >
> > I have noted that some of your replies have been delayed, and I can't be sure
> > of what I might not've received. I can't say I've seen one that mentions the
> > dflags name being preferable.
> >
> > I prefer the plain flags name, if there is only one flag variable in the
> > function.
>
> I pointed out that lflags / dflags is kinda idiomatic internally to gpiolib*
> code base. Using flags might feel misleading and otherwise will hint about
> semantics of the variable. That said, I prefer it being named dflags.
>

Application of that idiom in gpiolib-cdev looks to be mixed, but I guess
it can't hurt to lean into it.

Cheers,
Kent.

