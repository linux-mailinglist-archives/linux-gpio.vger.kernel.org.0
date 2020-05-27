Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E931E3417
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 02:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgE0AfP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 20:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726835AbgE0AfP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 20:35:15 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AC3C061A0F;
        Tue, 26 May 2020 17:35:15 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 185so2668856pgb.10;
        Tue, 26 May 2020 17:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=NbLwGpRXN+x1Po6XCiN+i0tEPW5kURnpgHBXzY97LRY=;
        b=n8knze2OUmHWz3XNrfjgVRi4h6emSpsN0zZQuh13TAlcnGrsEwlkMo3L9L8jTLg7Fv
         zGIe6yAyLE/zEsypQDFRQwxQpvviZKIO6vwtYfR6LOQdOK1Tf6hk91l0jCr8jO7iN4NU
         Cs/cFYjAjxwmO0NgSWklvUfkjCyqqi6dmJoUcZ+e2IoktbfO/ncjidXAwzWqGM7AXdxB
         KZxYe9DlIvBw3X7D9oQX5gs5DmV11R5509PyCFC8UtQeIs8Z8aAPPmwHLLcIxwJLPbIb
         TIGt4DPAUK6cvZvwp8rr77yfIKMoG0cGhhhdRCLSbMKNlEYEvoXQXvhAJGcjb0Uq0Q6h
         n+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=NbLwGpRXN+x1Po6XCiN+i0tEPW5kURnpgHBXzY97LRY=;
        b=OvQis321TlHsKj/LaYKLt+32wMP6kixlLVR463/3789z2n6/3+bqZNR9NByvegoBrp
         CiOJ/B1C6n6x8mT1gahV7Jy3SKzIRAXavPOWvn7NMgTlA3Q6yvV5zbyS8iWS8jHLJIzt
         ryaJseXh7MkBmpLJtVfeoQhCIY4iVpvQnYZjiHj+KiU29Fa+4egXSlUn0250xaN0j5Mh
         NFvV5Ux8LU0jVIaLQeEJJsoljcT2vi08zLx9wpy8PiZx5RHEhvqKhlmxlQB4GM4oKEPb
         /CtuGiwVdatwNWdn0+be71GK63nhNuX0PKWUunxc96esp8AyGEn/3lNvTxKMx2N7MOuq
         gI5A==
X-Gm-Message-State: AOAM531a4iu+0U2nw8VJMPWeScLP/x07lzfkq4CiNm7YIr3NKZIPL+Qj
        GY4KixNFD+zTum5L6jKzP0SgnDJMUB4=
X-Google-Smtp-Source: ABdhPJxj4r3Sq+QbuiYd4E3lg192kPfvPJagvsEQoc+pslDJr2dYm/3YXDcEwaOQG0fCtTJ5mqIB4A==
X-Received: by 2002:a62:1e84:: with SMTP id e126mr1379483pfe.67.1590539714525;
        Tue, 26 May 2020 17:35:14 -0700 (PDT)
Received: from sol (220-235-68-201.dyn.iinet.net.au. [220.235.68.201])
        by smtp.gmail.com with ESMTPSA id k4sm622454pgg.88.2020.05.26.17.35.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 17:35:13 -0700 (PDT)
Date:   Wed, 27 May 2020 08:35:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] gpio: uapi: v2 proposal
Message-ID: <20200527003508.GA9040@sol>
References: <20200516064507.19058-1-warthog618@gmail.com>
 <CAMpxmJX51PNHucOUnZ3GbA+RxmZto9NXruBmjUYoFHz5D1Nbqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJX51PNHucOUnZ3GbA+RxmZto9NXruBmjUYoFHz5D1Nbqw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 06:24:04PM +0200, Bartosz Golaszewski wrote:
> sob., 16 maj 2020 o 08:45 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Add a new version of the uAPI to address existing 32/64bit alignment
> > issues, add support for debounce, and provide some future proofing by
> > adding padding reserved for future use.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> >
> > ---
> >
> > This patch is a proposal to replace the majority of the uAPI, so some
> > background and justification is in order.
> >
> > The alignment issue relates to the gpioevent_data, which packs to different
> > sizes on 32bit and 64bit platforms. That creates problems for 32bit apps
> > running on 64bit kernels.  The patch addresses that particular issue, and
> > the problem more generally, by adding pad fields that explicitly pad
> > structs out to 64bit boundaries, so they will pack to the same size now,
> > and even if some of the reserved padding is used for __u64 fields in the
> > future.
> >
> > The lack of future proofing in v1 makes it impossible to, for example,
> > add the debounce feature that is included in v2.
> > The future proofing is addressed by providing reserved padding in all
> > structs for future features.  Specifically, the line request,
> > config and info structs get updated versions and ioctls.
> >
> > I haven't added any padding to gpiochip_info, as I haven't seen any calls
> > for new features for the corresponding ioctl, but I'm open to updating that
> > as well.
> >
> > As the majority of the structs and ioctls were being replaced, it seemed
> > opportune to rework some of the other aspects of the uAPI.
> >
> > Firstly, I've reworked the flags field throughout.  v1 has three different
> > flags fields, each with their own separate bit definitions.  In v2 that is
> > collapsed to one.  Further, the bits of the v2 flags field are used
> > as feature enable flags, with any other necessary configuration fields encoded
> > separately.  This is simpler and clearer, while also providing a foundation
> > for adding features in the future.
> >
> > I've also merged the handle and event requests into a single request, the
> > line request, as the two requests where mostly the same, other than the
> > edge detection provided by event requests.  As a byproduct, the v2 uAPI
> > allows for multiple lines producing edge events on the same line handle.
> > This is a new capability as v1 only supports a single line in an event request.
> >
> > This means there are now only two types of file handle to be concerned with,
> > the chip and the line, and it is clearer which ioctls apply to which type
> > of handle.
> >
> > There is also some minor renaming of fields for consistency compared to their
> > v1 counterparts, e.g. offset rather than lineoffset or line_offset, and
> > consumer rather than consumer_label.
> >
> > And v1 GPIOHANDLES_MAX and gpiohandle_data become GPIOLINES_MAX and
> > gpioline_values for v2 - the only change being the renaming for clarity.
> >
> > The v2 uAPI is mostly just a reorganisation of v1, so userspace code,
> > particularly libgpiod, should easily port to it.
> >
> > This patch is obviously only one patch in a much bigger series that
> > will actually implement it, but I would appreciate a review and any feedback,
> > as it is foundational to the rest of that series.
> >
> > Thanks,
> > Kent.
> >
> 
> Hi Kent,
> 
> Thanks for posting this. I like the general direction a lot. I'll
> review this in detail later this week.
> 
> Seeing the speed at which you make progress I think I won't be
> implementing support for the v1 of the watch ioctl() in libgpiod after
> all. Once the v2 is live I will probably bump the API version in
> libgpiod to v2.0.0 and make some non-compatible changes anyway.
> 

Yeah, libgpiod has similar problems to the v1 uAPI - there is no
easy way to extend it without causing breakage.

I've got a patch that ports libgpiod to the v2 uAPI, though it only goes
as far as v1 parity.  That is passing all existing tests.  The patch
doesn't address debounce as that will require libgpiod API changes.  Nor
does it make use of the bulk event capability, as that would change
behaviour and break some of the tests - the wait_multiple test was the
sticking point there.  Those are probably best combined with the v2.0.0
changes you are planning.

I've also got a couple of patches for minor things that I noticed while I
was in there.  I'll post them shortly.

Cheers,
Kent.
