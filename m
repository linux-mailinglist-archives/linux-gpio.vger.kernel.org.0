Return-Path: <linux-gpio+bounces-15100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F786A23170
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 17:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96D751887B44
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 16:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B3A1E9B33;
	Thu, 30 Jan 2025 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="XO1D3qeI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE0484D34
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738253079; cv=none; b=kemq76LquZbU67s8jJa/nWzR0ODIXSfwQVcUxppdlfWSb89dcIgmtLQiAkcjvYKMfqe5o17+VXT5tNRHlYWk6z/4TTgT2JnmNd2IHVtt4vw5KZz5Bj3le2EPPfJ0LFZwV21EpDrd9M9dgOHIbO4jBjmwl/Rt/LR9CceEyLvP888=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738253079; c=relaxed/simple;
	bh=1RV6NlImWMNVSEpClVD7MX8BT7kXytBO1h9bFukv/3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISOtD2m/y747oFCMUdxiPTA5I6dGuBllUPRxdjeCnqMDrUydaZHKNJkkrk1GQ+gAwI4AhxU/NF67h0lKqfGsV7QKrZlURDFirOAampo8w7hy2a0Rckso+vVlJ/9Jf7aI71cBWTFSicr64uomJXDDvWKwgiybVsHeryAL/e4j5Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=XO1D3qeI; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2A1A63F220
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 16:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738253068;
	bh=DdStTEajIelfR7AL4b2VtQBKKCsYPbVQwJ/gEBmQAGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=XO1D3qeIDQdgRB60Ev5Y3AwQJoGKHcx/wDBDAmekrfZ2o8iQQxQyrbJj58U3XWYMc
	 XWiJwU0HHcl8YSYqyNQ7yMR1SOrLr6S9eNMslza6gkmDitQI6XXAum1SgXlHQ3C+fA
	 cdbusQabOkWo0MH30QlMADp4gAaSHI3YZWBPJKutaPn8fwSEnOoeo+v0NW5wYPflUz
	 hXF+x+z2J+zeQk5PrPDBDZOVzoYpG4WqY4y4uuyms9Zh0gtNi9JtLI+mI7ZXksBi+u
	 e53C7SxLXHX3eNlDyA4GNhdwyhsS7P0qeTjKqDvQqH81rSDaNm5ppaXwNkrfm9lMnC
	 oDjFqMVpeZDeg==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f5538a2356so1827938a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 08:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738253067; x=1738857867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DdStTEajIelfR7AL4b2VtQBKKCsYPbVQwJ/gEBmQAGE=;
        b=G8rYGycvzNvWbZMQ/mdwgFbbd74dvsFpAgAfr1558GFDs2p1ndYl0kIYIKrSfZ2HXX
         xEe6rAGEFzlr9CmxujYf3uLrxXp8fad7WaFurVRND4azwxYRLokANBWwumSN+iPE29Im
         ez6/X356DYXjRYzRL/pMRJ7H3wQNB3SNJbHBTv8G/STTrZrues+krOIPyaFi8Y3nhHrZ
         xasJDpL3I9EL6JwB5qt0m8UbtLo76POX9wN4wpVTGfe4toXTgsRYNjdMEhSEAqYGVnOu
         E0gBaK2wm7GM2ywWazjo+0sKJCTBD9E3BPtIwvfuIP65P3FFKaKElr7pPEXpoWm4wgyS
         FDng==
X-Gm-Message-State: AOJu0YxGi6Z8Gck2G+MSuyu6lILrPxol8GUV1RI2SOQ3ddCOX/beIecf
	8sYZow+9qf6Tg80793L40cJu0tkrl3OxEVGVDoWC/+wmbZRkUsuwnxrhoZlnw1CX0SC65yjmr1/
	+gXRNIkZh7zLnywDibsIdJlKpHhsieBaMffrPw+ks1uI+X9BVUKiuevgnrkR04MWH/ve1Z5sNTS
	w=
X-Gm-Gg: ASbGncvhHxWM0pGaFtd1mdJKtv3MEkeXMJ9ZoNodqU7BP4Cw04Z08NXrxXf0Dk5MMKK
	gBc3a+ndFVge1zyBy9o59GXBWISeJlWIRKex1hQIm1A1x9U66jZn0HJP/JrIsqof7x5eQEFauYe
	UaIYnGgeTdz7clC3u4L/nQLIoyAPkUVjXeX+vDfyjo6qWRxx5MURDeoUMNhS2IkYxndODImpMB+
	66cchNpzMkHk7EMPbdmtl8GtjzuycFqelitZ2cNIoc0LDqnHYdD5nnMOQF7Ez3SvOlatrOJtdfl
	T0LlbLw=
X-Received: by 2002:a05:6a00:2d1b:b0:727:64c8:2c44 with SMTP id d2e1a72fcca58-72fd0c67aa6mr10535775b3a.19.1738253066604;
        Thu, 30 Jan 2025 08:04:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/bczYSaqBe4gXfLSbdQfEUz5lhItOwc8MfpIsCWFahaGB/80iN04rCDIpbMBqoYSLzekpbw==
X-Received: by 2002:a05:6a00:2d1b:b0:727:64c8:2c44 with SMTP id d2e1a72fcca58-72fd0c67aa6mr10535700b3a.19.1738253065779;
        Thu, 30 Jan 2025 08:04:25 -0800 (PST)
Received: from localhost ([240f:74:7be:1:997b:dcb6:3fe7:2ab1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cdda2sm1614914b3a.128.2025.01.30.08.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:04:25 -0800 (PST)
Date: Fri, 31 Jan 2025 01:04:23 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for
 gpio-aggregator
Message-ID: <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv>
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>

On Thu, Jan 30, 2025 at 11:30:59AM GMT, Bartosz Golaszewski wrote:
> On Wed, Jan 29, 2025 at 4:56 PM Koichiro Den <koichiro.den@canonical.com> wrote:
> >
> > This RFC patch series proposes adding a configfs-based interface to
> > gpio-aggregator to address limitations in the existing 'new_device'
> > interface.
> >
> > The existing 'new_device' interface has several limitations:
> >
> >   #1. No way to determine when GPIO aggregator creation is complete.
> >   #2. No way to retrieve errors when creating a GPIO aggregator.
> >   #3. No way to trace a GPIO line of an aggregator back to its
> >       corresponding physical device.
> >   #4. The 'new_device' echo does not indicate which virtual gpiochip.<N>
> >       was created.
> >   #5. No way to assign names to GPIO lines exported through an aggregator.
> >
> > Although issues #1 to #3 could technically be resolved easily without
> > configfs, using configfs offers a streamlined, modern, and extensible
> > approach, especially since gpio-sim and gpio-virtuser already utilize
> > configfs.
> >
> > This RFC patch series includes two commits:
> >
> > * [PATCH 1/2] implements the configfs interface and resolves the above
> >   issues:
> >   - #1, Wait for probe completion using a platform bus notifier,
> >         in the same manner as gpio-virtuser.
> >   - #2, Introduce a 'live' attribute (like gpio-virtuser/gpio-sim),
> >         returning -ENXIO when probe fails.
> >   - #3, Structure configfs directories to clearly map virtual lines to
> >         physical ones.
> >   - #4, Add a read-only 'dev_name' attribute exposing the platform bus
> >         device name.
> >   - #5, Allow users to set custom line names via a 'name' attribute.
> >
> > * [PATCH 2/2] provides documentation on using the new interface.
> >
> >
> > Koichiro Den (2):
> >   gpio: aggregator: Introduce configfs interface
> >   Documentation: gpio: document configfs interface for gpio-aggregator
> >
> >  .../admin-guide/gpio/gpio-aggregator.rst      |  86 +++
> >  drivers/gpio/gpio-aggregator.c                | 673 +++++++++++++++++-
> >  2 files changed, 757 insertions(+), 2 deletions(-)
> >
> > --
> > 2.45.2
> >
> 
> Hi!

Hi, thank you for reviewing.

> 
> I love the idea! In fact I think I floated it in a discussion with
> Geert some time ago but never got around to working on it.
> 
> I just glanced at the code and it looks nice and clean. I'd love to
> see some more improvements like using a common prefix for all internal
> symbols but it can be addressed in a separate series.
> 
> I played a bit with the module and this is where I noticed some issues:
> 
> 1. The sysfs interface must keep on working. The same command that
> works with mainline, fails for me with your patch. There's no error
> propagated to user-space, write() returns success and I only see:
> 
> gpio-aggregator.0: probe with driver gpio-aggregator failed with error -12

It looks like the issue is caused by gpiochip_fwd_line_names(). I'll fix it.

> 
> in the kernel log.
> 
> 2. I couldn't verify that it's not the case already but the code does
> not suggest it: IMO devices created with sysfs should appear in
> configfs.

That makes sense, I'll add the implementation.

> 
> 3. I don't think the user should need to specify the number of lines
> to aggregate. That information should be automatically inferred from
> the number of lineX attributes they created instead. [...]

I agree that it's essentially unnecessary, but considering the current
state of gpio-sim's configfs, having the user set num_lines doesn't seem
too unnatural to me. What do you think?

> [...] Also: if I create
> a line attribute without setting num_lines, the driver just crashes.
> In fact it seems any discrepancy between the number of lines specified
> and the naming convention of the line attribute causes a crash.

My bad.. thanks for pointing it out.

> 
> 4. Writing 1 to live, when no lines to aggregate were specified, should fail.

Agreed, I'll address this.

> 
> There's probably more but I haven't had a lot of time.
> 
> In short: I'm very much in favor of adding this but it will require some work.
> 
> Thanks,
> Bartosz

I'd appreciate a response to one question above. I'll prepare v2 after.

Thanks again!

-Koichiro

