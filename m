Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3191E1291
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 18:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730364AbgEYQYQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 12:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729338AbgEYQYQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 12:24:16 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3575C05BD43
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 09:24:15 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id l1so14083199qtp.6
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KS0a12ZGAlis5FGjzq3oVpbX/YM5oeodYRXZXqWm+i8=;
        b=RlvVOG4oquelW/QHisprTnJ5+AE3nog67eWlbiiRX9LiPSKxC/6WMrf4vBwM2ErSEA
         uGKS5APVknW5P/Eg7MNjU54ZkvnfNQuwclevWvDHkRjNzv894NaIgXAMlbKgPzA71l3c
         a6MuKd+gpTBCLRNLEkltvuJ1CT4jW5xM6g88pj36tRDQ4X2CsVs1yTVdtZ2XkFiq5WwK
         42M8ef7/aC02RxBECMt7j8ZDHCGmqRgSgOauDfgM3qr76a9cdAsOwTb/o2x8+ePIvCHd
         FAgs3MxfFbcrL5J3KwW7D3Xk2eBr1ydZzVVYI0K5LhnslAgzFRhFJTuy/gV+xQPG1Ib6
         zCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KS0a12ZGAlis5FGjzq3oVpbX/YM5oeodYRXZXqWm+i8=;
        b=dTD43QMzpdUSxTCOW9WNP4matGxYtgfg8Au5Mv0Fc7Jb/mhmHTs9jsbHRBu3ifZlPZ
         DP68h1/tR4w33d3DsF0UoS0afm1GMTxlWXE9ekUvHAtNa40hE/s5HVnpe6+VQ7FWhkkN
         J/EnN+8x9v9nyh+K+i/K3V0tUwS//NXnVmiW1qIUL7kzkuEguX4Y/bvNFcddrFl34Y+d
         +evVSzVpjcvFgOaP2DdXldIaF0hH5wF2533JgmySDf61RFv0i2973UlsRFRzaajz06Gz
         btrGDb3NRWeDtMZaOPgqgT7usQu474JnEHDRPXDjye1/SnNhziktka1eVmT3A4gwMidh
         8Q/g==
X-Gm-Message-State: AOAM530Ke5RCBRBfD4pb5lSScap8L9/94vBWmLmrXymkBVojc8auBQTK
        cXodUMAj76/liHAzrFE/SiHPsKS9FF79nGmCZJK4oQ==
X-Google-Smtp-Source: ABdhPJxYcTFzk+NnfbAyKyadYyHL8dD0oRsGhvmc+Ujfz5lo4N1zqIz3HC7BJfc99USbyutgzQiNmAf4feRkGvtv8CE=
X-Received: by 2002:ac8:2242:: with SMTP id p2mr19187641qtp.27.1590423855112;
 Mon, 25 May 2020 09:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200516064507.19058-1-warthog618@gmail.com>
In-Reply-To: <20200516064507.19058-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 25 May 2020 18:24:04 +0200
Message-ID: <CAMpxmJX51PNHucOUnZ3GbA+RxmZto9NXruBmjUYoFHz5D1Nbqw@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio: uapi: v2 proposal
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 16 maj 2020 o 08:45 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> Add a new version of the uAPI to address existing 32/64bit alignment
> issues, add support for debounce, and provide some future proofing by
> adding padding reserved for future use.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>
> ---
>
> This patch is a proposal to replace the majority of the uAPI, so some
> background and justification is in order.
>
> The alignment issue relates to the gpioevent_data, which packs to differe=
nt
> sizes on 32bit and 64bit platforms. That creates problems for 32bit apps
> running on 64bit kernels.  The patch addresses that particular issue, and
> the problem more generally, by adding pad fields that explicitly pad
> structs out to 64bit boundaries, so they will pack to the same size now,
> and even if some of the reserved padding is used for __u64 fields in the
> future.
>
> The lack of future proofing in v1 makes it impossible to, for example,
> add the debounce feature that is included in v2.
> The future proofing is addressed by providing reserved padding in all
> structs for future features.  Specifically, the line request,
> config and info structs get updated versions and ioctls.
>
> I haven't added any padding to gpiochip_info, as I haven't seen any calls
> for new features for the corresponding ioctl, but I'm open to updating th=
at
> as well.
>
> As the majority of the structs and ioctls were being replaced, it seemed
> opportune to rework some of the other aspects of the uAPI.
>
> Firstly, I've reworked the flags field throughout.  v1 has three differen=
t
> flags fields, each with their own separate bit definitions.  In v2 that i=
s
> collapsed to one.  Further, the bits of the v2 flags field are used
> as feature enable flags, with any other necessary configuration fields en=
coded
> separately.  This is simpler and clearer, while also providing a foundati=
on
> for adding features in the future.
>
> I've also merged the handle and event requests into a single request, the
> line request, as the two requests where mostly the same, other than the
> edge detection provided by event requests.  As a byproduct, the v2 uAPI
> allows for multiple lines producing edge events on the same line handle.
> This is a new capability as v1 only supports a single line in an event re=
quest.
>
> This means there are now only two types of file handle to be concerned wi=
th,
> the chip and the line, and it is clearer which ioctls apply to which type
> of handle.
>
> There is also some minor renaming of fields for consistency compared to t=
heir
> v1 counterparts, e.g. offset rather than lineoffset or line_offset, and
> consumer rather than consumer_label.
>
> And v1 GPIOHANDLES_MAX and gpiohandle_data become GPIOLINES_MAX and
> gpioline_values for v2 - the only change being the renaming for clarity.
>
> The v2 uAPI is mostly just a reorganisation of v1, so userspace code,
> particularly libgpiod, should easily port to it.
>
> This patch is obviously only one patch in a much bigger series that
> will actually implement it, but I would appreciate a review and any feedb=
ack,
> as it is foundational to the rest of that series.
>
> Thanks,
> Kent.
>

Hi Kent,

Thanks for posting this. I like the general direction a lot. I'll
review this in detail later this week.

Seeing the speed at which you make progress I think I won't be
implementing support for the v1 of the watch ioctl() in libgpiod after
all. Once the v2 is live I will probably bump the API version in
libgpiod to v2.0.0 and make some non-compatible changes anyway.

Bart
