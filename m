Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA2F3118B34
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 15:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbfLJOjJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 09:39:09 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:41680 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727272AbfLJOjJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 09:39:09 -0500
Received: by mail-pj1-f65.google.com with SMTP id ca19so7488491pjb.8
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2019 06:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8hxYX1FUasv94+iur1d8+WKCOQ3pdaW5S1Aku0pI35Q=;
        b=EASQR2D05XiTsC0Q5FYEUwqcRST3VeT6b80CMpXCIHexWZ0esYt3oLKg9SI2WsuDXa
         jExyXpVgM17zJ9AvUxEDlzRG+nqmCOTGx07I6fsBGLKsCeTabgeUFguWlbnAxOzophU7
         AiYzBugi7rYbdpaSAjpurGXp4Kk+uWbO6FdsllXcTJASJTOdYZS3qjoPNzlj/jGlfusF
         KbR9CbgmNh2xMfDd/sFlDQercX4o5SGHOf1uaxVHb3I9/FHZw/iLS6Scs8WwT2s0yHib
         ZcjfB11YRfi4gUMH/llsmdsKsnEaKC10gAWy6MLk0kZhf1fY2vYzYCK3pJ3td3CdK2ho
         2vBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8hxYX1FUasv94+iur1d8+WKCOQ3pdaW5S1Aku0pI35Q=;
        b=kK8gQ+0JedmlMmXpqfkZM4YNtkW9tyrx/035iUCTmB58k68xBxYWdCwGjmR5keMc9O
         KFzu2oqiKsa79qciK43AA7CvueE3Bh/25uECSbFQS8wGi1IrX6eefz+BwGs77o/JqESI
         L1lvHM6222IUtV/lTCTulQwi5/v3RHcekjpEDxXPDg8DLxSwJZ9PM3Qod8H47PxolrPd
         RGqP8NkgvXdld4FQrA8fWoCsX5IIbO0V+IYSOxjqYj9YDCbgtgeaQi6Ojb2eK4i0yThk
         wH5KCFZL9khTa+/mGtieYNzgpUTlKQk1LwASSh1HMjUJOgpEKGDCByf5uSOpL24MxRky
         fghw==
X-Gm-Message-State: APjAAAWb362GR7EzcxT3GyL6ddFuWfOJK+TPrEGGXoov17XZxzG6ZVEE
        ZNUsYGjK/YuZwLfRZ4S0FFlPk5uLzm4=
X-Google-Smtp-Source: APXvYqx3CjyEQCPnT/Qm/9L+NUhOmZVANVl9NrgPyqGuwkZjcaNhwSDsQZwujznGZxp90Frha9zVFQ==
X-Received: by 2002:a17:902:b089:: with SMTP id p9mr36589718plr.154.1575988748626;
        Tue, 10 Dec 2019 06:39:08 -0800 (PST)
Received: from sol (220-235-124-2.dyn.iinet.net.au. [220.235.124.2])
        by smtp.gmail.com with ESMTPSA id 3sm3575669pfi.13.2019.12.10.06.39.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 06:39:07 -0800 (PST)
Date:   Tue, 10 Dec 2019 22:39:02 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in compatible
 mode
Message-ID: <20191210143902.GA3509@sol>
References: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mc88eiLtu7_0y51nGDzM0nRmwaOurLx9isf=qRB0uj7KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc88eiLtu7_0y51nGDzM0nRmwaOurLx9isf=qRB0uj7KA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 10, 2019 at 10:06:04AM +0100, Bartosz Golaszewski wrote:
> śr., 4 gru 2019 o 20:42 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
> >
> > The introduced line even handling ABI in the commit
> >
> >   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> >
> > missed the fact that 64-bit kernel may serve for 32-bit applications.
> > In such case the very first check in the lineevent_read() will fail
> > due to alignment differences.
> >
> > To workaround this we do several things here:
> > - put warning comment to UAPI header near to the structure description
> > - derive the size of the structure in the compatible mode from its members
> > - check for the size of this structure in the ->read() callback
> > - return only one event in the compatible mode at a time
> >
> > Above mitigation will work at least with libgpiod which does one event
> > at a time.
> >
> > Since the bug hasn't been reported earlier we assume that there is close
> > to zero actual users of the compatible mode to monitor GPIO events and thus
> > we might consider to rework this ABI in the future.
> >
> 
> How come this only affects the read operation but not the structures
> passed as arguments to ioctl() calls?
> 

For Go the structs are aligned based on the size of their components so
that arrays of struct are naturally aligned.  The struct is given a
hidden trailing pad so that a subsequent struct will be correctly aligned.
The sizeof the struct includes this hidden pad.
I'm pretty sure the same is true for gcc.

The gpioevent_data contains a __u64 which causes the whole struct to be
64 bit aligned on 64 bit, so it actually looks like this internally:

struct gpioevent_data {
	__u64 timestamp;
	__u32 id;
    __u32 pad; // hidden
};

so 16 bytes.

On 32 bit the struct is 32 bit aligned and the trailing pad is missing,
so 12 bytes. This causes grief for the read due to the size mismatch.
(I'm sorry to say I had to add the pad to my Go gpiod library to get it
to read event data - but forgot to go back later and work out why -
until now :-()

Your new info change struct has the same problem, as it also contains a
__u64 and ends up with an odd number of __u32s, so gets a trailing pad
on 64 bit.  Using __packed seems to inhibit the trailing pad.
Or you could explicitly add the pad so the struct will be 64bit aligned
even on 32bit.  Neither of those options are available for the
gpioevent_data, as that would break the ABI.

The ioctl structs only contain __u32s (or smaller) and so get aligned to
32 bit boundaries on both 32 and 64 bit. So just lucky.

It is also lucky that the event_data happens to have the __u64 at the
beginning of the struct or there could be padding inserted between
fields, not just at the end.  Similarly the byte array lengths in the
ioctl structs are all multiples of 4, so all the components happen to 
align to 32 bit boundaries.

Kent.
