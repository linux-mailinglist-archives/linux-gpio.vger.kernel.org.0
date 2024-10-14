Return-Path: <linux-gpio+bounces-11254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A2099BDC5
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 04:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34832B226F2
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 02:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40E53B7A8;
	Mon, 14 Oct 2024 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHM5ke4e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5D13A1DA;
	Mon, 14 Oct 2024 02:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728872680; cv=none; b=IBOGDLR1sc8t1h4TZS2Pz1K/EgEsNaHaEJkYtfWP8QiVxUdP2VdcSw2avGmiyYmbEKhj1uJhOSKFz3ZTAvyNt1eC1euDCXj3Vmsmeqzogk1qOQKD28eN72NU9bpvgILi9IemIyQs6Lkb4xDUxBN7XW13tMmnsJmR8aBkS2IVwZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728872680; c=relaxed/simple;
	bh=7ad8UnAIf2GBSZNsj6k3XG6lrMKOjNDqFwz7ONtc3/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NahAjOoA5cdZFX50C6V5iTIN4vaHxjCrOQwWNExbQLrHZFNxn3CkLxbgvMeP6ADlfaDIjeIleTGc2TtKTFAP3gVc18wiSLdWZchZ0/Ck917Vq3OPrCUoAZK0lIXWfTG2xNFEw+S82f2Ii2SEbr+RGu0kMCkd1S967Erl1KIgcd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHM5ke4e; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ea8de14848so89078a12.2;
        Sun, 13 Oct 2024 19:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728872679; x=1729477479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=55NeQq8X14utGyhHdUqmU/aXJE4hZgeW7rh+JrL/Zlc=;
        b=cHM5ke4e7EIsTFd6pouHWCAZFYu+lNZIKuIx5MI5A1EKQYtjlujQe2uqIU4NpbK6aD
         7ueAbUZuioxeaaPNBAYlXZC1wiVFcp53o7H9ATNtBSOJkNztMVRermfGahsRNc1BvsN6
         SV0TtBCisQ/lLJPEM3aHR+6YLG+5iEVEN/tJpKUTfyNIPfTVjx6EGamtDCdscXLRn/tC
         xLNvZkP6LA8fa+XfNl5zjUESkQWiNJWbIrWRlM/mmpZXCl3ObSGcm3MC9j9iFRN6HeSS
         l5hOslj7RMLc+b0WBQ+nXoiYKiP3rGo8Q3VijG4bFho7EvpkfYO5543YtF9UBw6ItDNi
         g9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728872679; x=1729477479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55NeQq8X14utGyhHdUqmU/aXJE4hZgeW7rh+JrL/Zlc=;
        b=AdOe7KlyhpRsEfydFvkL4vsNZm6m/HsuV/r3CD+DXgIP5ctL6N9Km9ZSiZ7ebWSp1c
         uTTgyaaDNLX0XTfnLleLlXg+3R0cfrwmfO9jKxUCx8SX04YMA7vBicY3GSoakwKfZVhM
         ZRPLoE/wdL3YDPOQ0Ui4H00l6427Lt4v1/h6drapGHULtMI9YdrtrxuoswpOkLSmj/mS
         bLrqjlOUhvl/UJqEeCv6b+VXhAoPpujK0MeDBB2Uj6UN3VfM2HPul2hhEAe8FjMW4BZk
         Q2DGIR78JiPy6fQTbDQ2Kmxf0l2c+U5WHOwYkJPkX+pCVZ6f3C/gVBedsmQFmzPEVgms
         RERQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwD4BamrRaUGH+6ICs3BpSmkjlfEtZ53UghCtouW7VL7lXwdoeRsd4w/FgJR8//TAgyQaZpwRkYx/vYagu@vger.kernel.org, AJvYcCXFeNTwZBC4+CKwRHIlC59IY4ww+1sqVvnc2qG/rMCtgE2342o2qzFIR0MPZyKre16XjfmiJ0fBTHEa@vger.kernel.org
X-Gm-Message-State: AOJu0YzguIzCO4TYbUgMUrQl7+EqRD7w/n3NHcIsBDmrnqhCVFD2bUxl
	bPzGDhAaU5jzPhlBBh6OWnwIbr+oeS59MP0iyF2vJOt2lwIe3xwk
X-Google-Smtp-Source: AGHT+IF4l7V2lm/krqq25MkfmJtvFpIYxzhh/vfUfU5BCpEoB8fND3gO+s78yezlp051+65kr3aqAQ==
X-Received: by 2002:a05:6a21:460c:b0:1d8:51e6:f89a with SMTP id adf61e73a8af0-1d8bcf52dbbmr13822391637.27.1728872678500;
        Sun, 13 Oct 2024 19:24:38 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e6af68cdfsm309594b3a.173.2024.10.13.19.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 19:24:38 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:24:33 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 6/6] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241014022433.GD20620@rigel>
References: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
 <20241010-gpio-notify-in-kernel-events-v2-6-b560411f7c59@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-gpio-notify-in-kernel-events-v2-6-b560411f7c59@linaro.org>

On Thu, Oct 10, 2024 at 11:10:27AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We currently only notify user-space about line config changes that are
> made from user-space. Any kernel config changes are not signalled.
>
> Let's improve the situation by emitting the events closer to the source.
> To that end let's call the relevant notifier chain from the functions
> setting direction, gpiod_set_config(), gpiod_set_consumer_name() and
> gpiod_toggle_active_low(). This covers all the options that we can
> inform the user-space about. We ignore events which don't have
> corresponding flags exported to user-space on purpose - otherwise the
> user would see a config-changed event but the associated line-info would
> remain unchanged.
>
> gpiod_direction_output/input() can be called from any context.
> Fortunately, we now emit line state events using an atomic notifier
> chain, so it's no longer an issue.
>
> Let's also add non-notifying wrappers around the direction setters in
> order to not emit superfluous reconfigure events when requesting the
> lines as the initial config should be part of the request notification.
>

So lines requested from kernel space will result in a LINE_REQUESTED and
then a series of LINE_CHANGED_CONFIG?  Whereas for lines requested from
userspace those will be collapsed into the one LINE_REQUESTED event?
That's not ideal, but I realise making the rest of the kernel behave as
per cdev would be non-trivial, so ok - it all comes out in the wash.
And it is clearly better than nothing.

Cheers,
Kent.


