Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C67A4A3C94
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Jan 2022 03:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236291AbiAaCaJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Jan 2022 21:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236210AbiAaCaI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Jan 2022 21:30:08 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54F2C061714
        for <linux-gpio@vger.kernel.org>; Sun, 30 Jan 2022 18:30:08 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id s2-20020a17090ad48200b001b501977b23so16918436pju.2
        for <linux-gpio@vger.kernel.org>; Sun, 30 Jan 2022 18:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w7jJWZe+uSnOeyLb4i1kuP6M3tYmVGwjx53IF++ro6k=;
        b=exEtj7HdcMgAWQ67UEQsPMewBXga/P8PmdmJpyDNmU6POLoRPzp7i6omL6cWkMdDcj
         2cqMHxTf5VD3Pzxv/V8HB0LFut1jY0YLrA0SNPy38kTUhPeNL6DZu/KlBQ/SjwpYyr+b
         vwGqxtj3IbPdT2VU7XWH4O7g2Waj0/yjXfYspVgzI9ih/Cn1O7EhrSU5uG74mtXX+0Tp
         oYmzxr4DVQIGkch0fcpksM+SuJ7o2i/v2qPF8/RoxyfbqXKwSgw3rBcxqIZpY8jV5qM0
         I56i1Wamgv7MrcvPqC5qPxpQ4Mzfy512OXE1abZ6i1Di4bAZjv6s80mqbrv9DmQZGKOc
         3NvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w7jJWZe+uSnOeyLb4i1kuP6M3tYmVGwjx53IF++ro6k=;
        b=iHa6UhLjBko0WXMPyZFccOICjlHcbeoFjvUaBEM02ADzZytcb0XcE0u6rOStQjCGk9
         jXHygs0HRA5PpN57LlKJ0t9c1UyjpOSEUlJWVnQ3o5BdzFrrWWyDEOja2BwOMMNY4H/C
         0ZGXVg5YE264i9Hir4km/iPcTKa3d9Y27lMT4kcb+9nWK7c6OMGvsx9Xp0ogKchJr/0n
         cnSTmWIuNjD4KKtid5J0gciGTk8cWkxlbSSgw4wAVPTaAxbGt6QtZn19WVu9lr93MQ8G
         AwR1Rx8+LPTfi3wBw2F4ONnK5A30jrHKrFl0pvSUIbx6tJsqeVZpW4i9bq0rhX9pH6kj
         IVWg==
X-Gm-Message-State: AOAM530z+wTv66oe+36DNk0yftOv04z0q8/dxBkNnZ+eJU9uJ5/O0dQG
        bFR7Hzo/SGTR7CI54BZl45Xr8djiBxA5Lw==
X-Google-Smtp-Source: ABdhPJx4qJ5H1Hg9RojA4d4gtxDBFu4L81vGZt1WgRNa5V5JjXhLY8CgAQOiOPoTG/Ffe3D9TvHxIQ==
X-Received: by 2002:a17:902:ed8c:: with SMTP id e12mr3895082plj.17.1643596208146;
        Sun, 30 Jan 2022 18:30:08 -0800 (PST)
Received: from sol (123-243-144-88.static.tpgi.com.au. [123.243.144.88])
        by smtp.gmail.com with ESMTPSA id s6sm27285327pgk.44.2022.01.30.18.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 18:30:07 -0800 (PST)
Date:   Mon, 31 Jan 2022 10:30:02 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gasai Maple <gasaimaple@gmail.com>
Cc:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        brgl@bgdev.pl
Subject: Re: A problem with gpios on my sunxi board.
Message-ID: <20220131023002.GA19962@sol>
References: <CAA=7Zrk43M3Q_cRnRwoJyyBk-C-3ACqvLg6toMou6eobsua7Uw@mail.gmail.com>
 <20220131005924.GA11753@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131005924.GA11753@sol>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 31, 2022 at 08:59:24AM +0800, Kent Gibson wrote:
> On Fri, Jan 28, 2022 at 10:12:13PM +0800, Gasai Maple wrote:
> > I posted a question on stackoverflow, it's basically about me having
> > problems operating gpio with libgpiod, and a user advised me to drop a
> > message, the link is here
> > https://stackoverflow.com/questions/70863283/libgpiod-tests-fails-on-pcduino3-nano
> 
> It would be helpful to restate your question rather than providing the
> link.  But anyway...
> 
> My best guess is that your kernel is built with only v2 of the GPIO CDEV ABI.
> libgpiod support for v2 is a WIP, and 1.6.3 only supports ABI v1.
> The CHIP_INFO ioctl is common to both, so will still work.
> But all the line request ioctls changed so they wont.
> So libgpiod is probably making ioctl calls that your kernel doesn't
> support.
> 

On re-reading your issue I realise it is the LINE_INFO ioctl that is
working for you, not CHIP_INFO.  That indicates ABI v1 is present in
your kernel, so the above is wrong.

That brings me back to using strace to see what is happening in the
ioctl calls.

And what does gpioget return?

Cheers,
Kent.
