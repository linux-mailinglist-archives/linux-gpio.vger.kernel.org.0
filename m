Return-Path: <linux-gpio+bounces-11289-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA899C3C2
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13AB51F23F0A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B0A154439;
	Mon, 14 Oct 2024 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MggKFUaA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B3D1494C3;
	Mon, 14 Oct 2024 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895379; cv=none; b=k7enWInHSJSBot9ruPAe8Om23j/xQ1og+yAASw8qBHBgrnNtzpQN739lil8NdVn+CbSTNH0pvAffOlZeba9YlVhUyZXbOJVj7JSf3dU0kxC3O/XLJxjBJPLm2Y+L0pgU36fTqMi0eg7jRzj99u0qbO0LzR3IO1Afo+lxrROmSas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895379; c=relaxed/simple;
	bh=WSkDReICKC6VPCPeO8dqT5Tl8DyyIkXcdPtQIt9xG/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPGHGyfklQ7lu+oz+0khw0loGk0Eqbxu1Jiu76bfsqwqbgWU8xysbMUkSSA//nv9p6QDEM0WK7zZAwIxySTUVMdV0/5gvhB79qIHZBrOCxpfJKPItrF0bjbbRx4XdS74dd3T4+Js13Papu+PDaI66uX6hlVkivYuhWskpnUMjHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MggKFUaA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c70abba48so25289255ad.0;
        Mon, 14 Oct 2024 01:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728895378; x=1729500178; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mc1xjH8jda9+Ou+CdWyvRTeIYF2yxLMZaS+DypzEeCo=;
        b=MggKFUaAryFPNz7YqHXdtibC0oeQ8nUtsV1GsKmA3GbH+XsO7QMxWc9+IKj1oiijqO
         VJhureF+6MHLQpyr7YpLhsVNRYXnr5sle6VH1DQQ0GF3WAwgp5Q0dmxfTTwmBuB9bawd
         U3TcEbMBFEi9sC15WvbKzNOUZ79+UAQxALvpeGNcxxVyK0qbnRbONl2aAGgdx8UV5+Vy
         zoRE7z+h5QNCzFJexHFn6OB880CAu3+IRWg7DwB5IJ0MEhfsnzgGPjt0X597hJIE3OPj
         fN3Vsyp2Vx85ciGgXZKMligxDtkcPURhNxUi2UbTAi6A7DnQzpiGURX/h9bTj08CpdrS
         dvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728895378; x=1729500178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mc1xjH8jda9+Ou+CdWyvRTeIYF2yxLMZaS+DypzEeCo=;
        b=F1c9D9hg4OMRTqpk+kWtd73q4V5Br7fxeLqQxXejHRViLq8EdHkVMe0HS4DRrs2C89
         CGRlgpORtM+ij0k79rmo4njbpB8WOxTprhg+eiZPhkJThp76jJCCqDtOgfP+8/FANLMr
         y41dn5AzS3KNIeYEjAUr2R2UnIIPtRcKk5HC5gn1h5hHGGpragzAmE6gLJul0MGuelOo
         U6J5Osmr0TN7t1AHebW4NDO49TCnPFGI3Qo/wGrobTID+JlgktBjdsNM74UbwInxfkq7
         om1TynRx3WeQVcw81PGN3I+Dh6tUhQ7OG7b1sUrD/Cx05RsAMqC5avtDdSb3TRXlxc4U
         yRHg==
X-Forwarded-Encrypted: i=1; AJvYcCUQh2rMrX139cTcOwyxLF5x/b2mIm7vI00BML6bLLuhNf6jNplRq0Qa7CwM71TiR1MSY1hF803bIAgrVO76@vger.kernel.org, AJvYcCWMIkNrqtfTEAyefGV5fQLlxpLPfQlyOON94WhdDfqui7O8Ck7kYUGW48kgiTCjCl00o5/Ka20EXoFu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfz+CDX2W71RFo2li6apdiVExgB5CeO0vJMTYJEucm6gGx7TNf
	wG/20JMbqSISMCmTo+8dUVaLFpDRJm5g2cz9dhmAut5U8kAqPtypgEhBRxix
X-Google-Smtp-Source: AGHT+IEW8nQM4PJ5E89ft0mnASqcYSQQN+ouyaTKQTd0sWtCeSmz+wWGOeBnSPq+WZEBZjg1QXhe4A==
X-Received: by 2002:a17:902:f552:b0:20c:8c51:f9f with SMTP id d9443c01a7336-20cbb24087emr123645205ad.44.1728895377051;
        Mon, 14 Oct 2024 01:42:57 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c0e74d6sm61771355ad.166.2024.10.14.01.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:42:56 -0700 (PDT)
Date: Mon, 14 Oct 2024 16:42:52 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 6/6] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241014084252.GB76995@rigel>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-6-b560411f7c59@linaro.org>
 <20241014022433.GD20620@rigel>
 <CAMRc=MddUUx-iDUWY53nStzt9nutRzB=EkGyaHa+e37Wm+10+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MddUUx-iDUWY53nStzt9nutRzB=EkGyaHa+e37Wm+10+A@mail.gmail.com>

On Mon, Oct 14, 2024 at 10:13:59AM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 14, 2024 at 4:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Oct 10, 2024 at 11:10:27AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > We currently only notify user-space about line config changes that are
> > > made from user-space. Any kernel config changes are not signalled.
> > >
> > > Let's improve the situation by emitting the events closer to the source.
> > > To that end let's call the relevant notifier chain from the functions
> > > setting direction, gpiod_set_config(), gpiod_set_consumer_name() and
> > > gpiod_toggle_active_low(). This covers all the options that we can
> > > inform the user-space about. We ignore events which don't have
> > > corresponding flags exported to user-space on purpose - otherwise the
> > > user would see a config-changed event but the associated line-info would
> > > remain unchanged.
> > >
> > > gpiod_direction_output/input() can be called from any context.
> > > Fortunately, we now emit line state events using an atomic notifier
> > > chain, so it's no longer an issue.
> > >
> > > Let's also add non-notifying wrappers around the direction setters in
> > > order to not emit superfluous reconfigure events when requesting the
> > > lines as the initial config should be part of the request notification.
> > >
> >
> > So lines requested from kernel space will result in a LINE_REQUESTED and
> > then a series of LINE_CHANGED_CONFIG?  Whereas for lines requested from
> > userspace those will be collapsed into the one LINE_REQUESTED event?
>
> No, why? I added the notification about the request to
> gpiod_find_and_request() which is called by all the kernel getters and
> it already configures all the flags without emitting events and calls
> the non-notify variant of the direction setter. When a kernel driver
> requests a GPIO, I only see a single event UNLESS after the
> gpiod_get() call returns, it sets direction or changes config - just
> like user-space.
>

Oh, ok, I was assuming there could be others using gpiolib the same way
cdev does.  So cdev is the only one that takes the gpiod_request(),
gpiod_direction_output() etc path?  All good then.

Cheers,
Kent.


