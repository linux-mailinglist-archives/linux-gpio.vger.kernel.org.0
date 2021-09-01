Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0B13FD3CE
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Sep 2021 08:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbhIAGaB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Sep 2021 02:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhIAGaA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Sep 2021 02:30:00 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAD6C061575
        for <linux-gpio@vger.kernel.org>; Tue, 31 Aug 2021 23:29:04 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id bg1so865096plb.13
        for <linux-gpio@vger.kernel.org>; Tue, 31 Aug 2021 23:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q77oa8nsfokyOaRZHa2TUglMmKdSfKF2o/StVOMIYSg=;
        b=lJgPWuUS/qJ6yhdCqW+5ERTcAvsRUJ4AE2ckifGqqLJzxYASrmYFLA2GNzkG/QekTL
         jRwDmyXWN1tW0vusi+zH0/yvRLIbmcrx8PJVwaV9t5DbQzM76heGBvA1+bud0uDA+PPx
         QYA6oAK/tRmbAG/XRV2Xy6oD5rtkwBryhLhj5uskR5U50EZS3J+ufxJzHkj9V8EV8yPi
         NYzHxQsrtYgNmxhBipzhyHytrhi4ND7ynYOlZnlVYm/i6+OsHESPBWxKJjQ8EKFWeXPA
         bBesA18D5SI3zEFSG/ikUix2f+3N56xg6WlFzTFEtcsPOTMJOsjvyOprt8VYcPfpivWY
         lXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q77oa8nsfokyOaRZHa2TUglMmKdSfKF2o/StVOMIYSg=;
        b=Ywkupusoc55w2SyNwzOtV6IyzUbjpEusE/QHRicUYjBSWbmC0WZ4F82KnnBrUAIUq7
         U7OcC6DMQJ9QQXkYiQXieroOIOiEViakPqujSrTyapRgI0+jGz1emA4DmxBKDidJLhQn
         4o4wxwsYquqem6tfL3TV6a/LJ48kyXP13w+5LQO6xerH3YDJHF6hmwODPfJBljHMjga+
         T6Ofhwb6Nh7t4LUz5QHo8JY1aT6yNxOU1y9Tris2qbMLTgk2JiyF3o2eU4sBVDe9yvDR
         liH5mPEV1MYyJGwIpVaM9/WFEqIhF6SOd/bWbyDuvRk/jH328R3uGXCEX6MNtrenanJV
         rsaQ==
X-Gm-Message-State: AOAM532ZgYV/16XxYqBOTp9Isy+uVlQk2L8UPiBgSv/ZRGSralcC5QSe
        ZRplNV9HqfB7Gm6lArnin+tFV6bhTZGQrw==
X-Google-Smtp-Source: ABdhPJzWBcjc76jwHPlEkZ61i7KcVO2bYbFYv4p+NQKIHa/sePP5XAnJnOeGgokfT61iYAQeEIt7Gw==
X-Received: by 2002:a17:90b:1c8e:: with SMTP id oo14mr10020156pjb.108.1630477743673;
        Tue, 31 Aug 2021 23:29:03 -0700 (PDT)
Received: from sol (106-69-191-134.dyn.iinet.net.au. [106.69.191.134])
        by smtp.gmail.com with ESMTPSA id 186sm20099476pfg.11.2021.08.31.23.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 23:29:02 -0700 (PDT)
Date:   Wed, 1 Sep 2021 14:28:58 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Riz <mdrizwan827@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: Regarding export of GPIOs
Message-ID: <20210901062858.GA30669@sol>
References: <CA+FSg4rJcDPhPoBbEYjsq_UOysLUdp6YnBh+3XeHL7UkH2cfdA@mail.gmail.com>
 <CAHp75Vct=K1Nh+UDS9tZgvgF1ju_c8417wzfHg9YCA2ay0jtCA@mail.gmail.com>
 <20210827022140.GA8509@sol>
 <CA+FSg4qxArwg67YCbpknJciOfraV-WxSUwsFrq1DmNLKHZHqLw@mail.gmail.com>
 <CA+FSg4rE8h0hdGa2UmvNyX1B2ChjJPfwobRdEsi_dSnyvT0p=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+FSg4rE8h0hdGa2UmvNyX1B2ChjJPfwobRdEsi_dSnyvT0p=Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 31, 2021 at 08:38:01PM +0530, Riz wrote:
> Sorry the kernel log was:
> [    0.251788] GPIO line <num> (name) hogged as output/low
> 

It is a bit of a worry that you are editing logs, rather than just
copying them verbatim.  That is just another source of error and
confusion.
The only info you would be leaking here are the num and name, and neither
are significant.
If you are still concerned you can always make the name in your dts
something anonymous but still more meaningful than "name".
Call it "foobar" or something.

> Regards.
> 
> On Tue, Aug 31, 2021 at 8:35 PM Riz <mdrizwan827@gmail.com> wrote:
> >
> > Hi Kent,
> > Thank you for your response.
> >
> > I am observing a strange thing here.
> >
> > The kernel logs for the hogged GPIO reports as:
> > [    0.251788] GPIO line <num> (name) hogged as output/high
> >
> > The corresponding dts changes are:
> > >
> > > pNum {
> > > gpio-hog;
> > > gpios = <num GPIO_ACTIVE_LOW>;
> > > output-low;
> > > line-name = "name";
> > > };
> >

Just to re-iterate Andy's response - if you intend to make active use of
the line then hogging is not the way to go - it is for statically
setting lines for which no driver exists.

And setting GPIO_ACTIVE_LOW makes no sense in this context.  That inverts
the polarity when mapping between logical and physical values, but for
hogs you are not actively using the line so the logical value is not
relevant.
The output-low sets the physical level to low, and an output-high would
set it high.  No logical value involved.

The remainder of the response assumes you just want to determine why the
kernel is not reporting what you expect on a hogged line.

> >
> > Based on the kernel log, I could say that it is hogging the GPIO as expected.
> >
> > But using the gpioinfo and lsgpio tools always show the direction as
> > "input" for the hogged GPIO.
> > gpioinfo <chipname>:
> > line  X:      "pX" "name"   input   active-low [used]
> >
> > lsgpio -n <chipname>:
> > line X: "pX" "name" [kernel active-low]
> >

So lsgpio agrees with gpioinfo in that FLAG_IS_OUT is not set, and the
problem you are seeing is almost certainly on the kernel side.

> > I tried following the kernel by adding some logs, it seems to set the
> > correct direction.

To absolutely confirm that you could add debugging to the kernel to
report the desc->flags after the line is hogged, so in gpiod_hog(), and
where the info is read in gpiolib-cdev lineinfo_get() or
lineinfo_get_v1(), as appropriate.

If those differ then I would add debugging to all the places the
FLAG_IS_OUT is cleared to see if they are somehow being called and
clearing the flag after it is set by gpiod_hog().

If that doesn't turn up anything then the last resort is using a debugger
to put a hardware breakpoint on the desc->flags to identify how it is
being changed.

Cheers,
Kent.

