Return-Path: <linux-gpio+bounces-1811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E9781CA58
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 13:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 533DDB21F2E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 12:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22411864D;
	Fri, 22 Dec 2023 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlU11bx0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772B118C20;
	Fri, 22 Dec 2023 12:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d422c9f894so3198365ad.3;
        Fri, 22 Dec 2023 04:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703249812; x=1703854612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZesGLqsg0Mup8BizWmbcf46waNTPQG/aVlm/0mdvhUE=;
        b=PlU11bx03gbIyW+XNdmjpoChm+oO3LJgwe0dIols3AUZ2baEjwhXZ5fD3XTR8Fityi
         rzh4222THCLvIbn43dzgD0EHvJFKVnahaEILgwjTmI2dQgfzAhSuE5znsLOjqOwEGHlV
         pGfgkUVIHAg0X2ioROQLP/ts/nJo0fzE2gWFsWKUo8FDQp1TtzkmrQDNXwCDX6H6ypL1
         Z6KuVkIWPlpqeo8dfgRU7ZXUsRcHYTmSE3Yzqz+0Ze1ID+WC6jVogJiOgBrXPhcvmWHL
         OmMrlsv8/876HEkosvPwURydHsW2a/buGtGAIy/nu+3kWzmsLrO0+5OfAkb5dTJicAxW
         cXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703249812; x=1703854612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZesGLqsg0Mup8BizWmbcf46waNTPQG/aVlm/0mdvhUE=;
        b=SyCcuvUP1MuVCTzz0T9BEHDQ8i5YnSRNv9Co/bmG7Bz4EVn0yKAV0XUwotvJE72+XA
         mCgs4K4afOCggLeeG7TfxdfN1jG7zBAwhUAJSCXqxoRs6pjBoAD9BOp0c0+RJa7DysTG
         BShFQWbszGYQaAE92tzJTsHLdOOwu7CyrpsnzSCH0OhjEwpZg4pkJ7CtdJDQWHT5lgoF
         omfSNL8phteWb69aqKGh6vrgMifHC1jWtOhVX6TWdf2TbXo1ZR2r7QQHEO7QuneGECFs
         c1oQmDZbJMzt0QgcujZZJMR6hIl3c3iqUZCerB7KKpNk5iwXGI+oVld+Rcp+4XO+ZWDc
         yJrQ==
X-Gm-Message-State: AOJu0YyV0x2JGui93dvZJrfWfIzvGyByVVpIJYW6uCmh/bNKRHM0uU8Q
	EdQxleevv6Q4WmW5+ymkhXk=
X-Google-Smtp-Source: AGHT+IHWIyot6GnsOhwZVS68Y2Z/KfzA4Mi75nlSQVmIWAMUJTZVi4tReINh1yTVSGM+Cz/U5ke2Vg==
X-Received: by 2002:a17:902:d4cb:b0:1d3:8032:ccc1 with SMTP id o11-20020a170902d4cb00b001d38032ccc1mr1345752plg.113.1703249811462;
        Fri, 22 Dec 2023 04:56:51 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902ce8a00b001d347a98e7asm3351248plg.260.2023.12.22.04.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 04:56:51 -0800 (PST)
Date: Fri, 22 Dec 2023 20:56:46 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/1] gpiolib: cdev: Split line_get_debounce_period()
 and use
Message-ID: <ZYWHjq_7PnwO27ro@rigel>
References: <20231221175527.2814506-1-andriy.shevchenko@linux.intel.com>
 <ZYTihbWMcHMHSkC_@rigel>
 <ZYWDij-J1YruTIM7@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZYWDij-J1YruTIM7@smile.fi.intel.com>

On Fri, Dec 22, 2023 at 02:39:38PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 22, 2023 at 09:12:37AM +0800, Kent Gibson wrote:
> > On Thu, Dec 21, 2023 at 07:55:27PM +0200, Andy Shevchenko wrote:
> > > Instead of repeating the same code and reduce possible miss
> > > of READ_ONCE(), split line_get_debounce_period() heler out
> > > and use in the existing cases.
> > >
> >
> > helper
> >
> > Not a fan of this change.
> >
> > So using READ_ONCE() is repeating code??
>
> Yes. Because one may forget about it.

Just as one may forget to use your wrapper.
This argument is a NULL - so I'll just forget about it.

>
> > Doesn't providing a wrapper around READ_ONCE() just rename that repitition?
> > What of all the other uses of READ_ONCE() in cdev (and there are a lot) -
> > why pick on debounce_period?
>
> Because you have a setter, but getter. Inconsistency.
>

But then "for consistency" ALL the struct line fields require accessors
and mutators.  That path is insanity.

The setter is there as setting the value now has side effects - none of
which are visible to the caller, hence the usage of the standard
setter name.
You are siggesting every function name describe everything the function
does?

And, in case you've forgotten, YOU REVIEWED THIS.

> > The line_set_debounce_period() is necessary as the set is now a
> > multi-step process as it can impact whether the line is contained
> > in the supinfo_tree.  The get is just a get.
> >
> > And you could've included me in the Cc so I didn't just find it by
> > accident.
>
> Maybe it's time to add you to the MAINTAINERS for this file as a designated
> reviewer?
>

You are patching my recent change that you yourself reviewed only days
ago. I would think that you would Cc me whether I were a maintainer or
not as I'm very likely to have relevant feedback.

Cheers,
Kent.

