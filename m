Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558A7343955
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 07:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhCVGT0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 02:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhCVGTU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 02:19:20 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E83F7C061574
        for <linux-gpio@vger.kernel.org>; Sun, 21 Mar 2021 23:19:19 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id n11so7933632pgm.12
        for <linux-gpio@vger.kernel.org>; Sun, 21 Mar 2021 23:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fvZZVXB/yfu1GYrf/tOAv4JFQD2GUEzz0dmjrobVYOI=;
        b=lhTPfg2EFqILKplFzgQbaIlfcNCti1xmP2SeVyZPpynpmysAuTxPp2TtctjcDsnRTG
         MW9VCidpBvDZGnVcNQF2oK6UT1kzpr/jkuQr84y5ZTUeROlwyMfXOTf//8kbZIVmoAgY
         ospB4AjRMRBlarItBYIX0GprleDFvms/m9Ojzs0OsXGzWZsMIQCAMzqjVoGaL9x+Mu5f
         GHRtqvsvpb3d+TfliKqhgo78p8+GW5DV49eeW3BmmfdC9xwEMf0MtTi1CZM9K6BFOGZ5
         XE3KCa3brQyJLYWLLBRDXAztuiqO82Ax1iSEbLlABGJazVBSoHumx7MjmBdTdrMS3egP
         k/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fvZZVXB/yfu1GYrf/tOAv4JFQD2GUEzz0dmjrobVYOI=;
        b=r7z5Fz4Zdi+Dkfotgxoi6RRyAJn+WGl2k0qy4R6LQgWNG1FUg3XQpMKzjUv8Q/O82C
         oxnvLaDbCQ98l5g6Q1TO9qzPFtyPRzxihAP7yJ2pRVGzu/KP+juYFfi0c3tLOVK/aAN6
         wX1lG+hYJTKOoIDK8lBL1aHQFRky10wa77xgjVev1UtE0aUrEbCwzsQu9/5P2T4m1+kX
         Y0IIWI+ikdLKMYFBJbRj6xMpSN3LeLNrYnTB2bVGFm824UP/YDO7FLdXhC4o+GHczNQC
         iTHKhRSa9NlnDIt9DItsZb9uRvKq8XGfB2eY4Q5f4BnKB7NxhWLidFVUFbyC4psFkI7u
         /V6g==
X-Gm-Message-State: AOAM533OACz0eL195HKdkRjcDdriSJC2fXTg1FUwN6LIY/2k3Z9QxWgJ
        E1xIZp2QbfzZwRwpdLN0EKYvHg==
X-Google-Smtp-Source: ABdhPJzKBs/G33qqj9/93cP8K0YKmxdjvmoYGsLH2O5rwutqx9AH+BdAhmSIo8hUI6/Q0TcwzEGwpQ==
X-Received: by 2002:a63:fd45:: with SMTP id m5mr5998130pgj.264.1616393959305;
        Sun, 21 Mar 2021 23:19:19 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:f583:1360:2cc8:3c30])
        by smtp.gmail.com with ESMTPSA id s76sm12779077pfc.110.2021.03.21.23.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 23:19:18 -0700 (PDT)
Date:   Sun, 21 Mar 2021 23:19:16 -0700
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>
Subject: Re: RFC for a GPIO input muxer
Message-ID: <20210322061916.GC392062@x1>
References: <545111184.50061.1615922388276@ichabod.co-bxl>
 <CAHp75VdhX1iC_JKyDigFrwzn7mUvvk0PGC-fgVUvJtYS+Dz6Hw@mail.gmail.com>
 <CAHp75Vd-OT7SVBKMjhZNbVdo24Ep5Jv6_xMY39JDRLTrB0pi-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd-OT7SVBKMjhZNbVdo24Ep5Jv6_xMY39JDRLTrB0pi-A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 02:30:50PM +0200, Andy Shevchenko wrote:
> +Cc: Drew, I believe he has some thoughts about.
> 
> On Wed, Mar 17, 2021 at 1:17 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> >
> >
> > On Tuesday, March 16, 2021, Mauri Sandberg <sandberg@mailfence.com> wrote:
> >>
> >> I am writing to you to ask for comments on the preferred way of implementing a 4-way GPIO multiplexer in the most generic way. The situation is that there is a dual 4-way multiplexer on my device and its select pins a controlled with GPIOs. The output pins of the multiplexer are connected to two other GPIOs. The datasheet of the multiplexer is here: https://assets.nexperia.com/documents/data-sheet/74HC_HCT153.pdf
> >>
> >> This is what I have been contemplating on but I am not aware if the same could be achieved with existing pinctrl or gpio driver or combination of those.
> >
> >
> > To me looks like a typical pinmux. Dunno if pinctrl supports pure pinmux and how it can handle that at runtime.

Regarding runtime pinmux, this patchset by myself was recently merged
and might be of interest [1].

> >
> >  That said, I would consider what has been done in pinctrl for that.
> >>
> >>
> >> The 'key-mux1' below implements a gpio-controller that drives the multiplexer and provides gpios for reading device key presses. At the moment it has to be polled as interrupts are not being generated by the key presses. I tried looking around but software interrupts did not give me any hits.
> >>
> >> I have omitted 'key-mux2' from this for clarity.
> >>
> >> mux: mux-controller {
> >>         compatible = "gpio-mux";
> >>         #mux-control-cells = <0>;
> >>
> >>         mux-gpios = <&gpio 9 GPIO_ACTIVE_HIGH>,         /* s0 */
> >>                     <&gpio 11 GPIO_ACTIVE_HIGH>;        /* s1 */
> >> };
> >>
> >> gpio2: key-mux1 {
> >>         compatible = "gpio-mux-input";
> >>         mux-controls = <&mux>;
> >>
> >>         gpio-controller;
> >>         #gpio-cells = <2>;
> >>
> >>         // GPIOs used by this node, mux pin
> >>         pin-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;        /* 1y */
> >> };

I don't see "gpio-mux-input" in mainline so I presume you wrote a driver
than uses this binding?  If so, could you share the code?

Thanks,
Drew

[1] https://lore.kernel.org/linux-gpio/20210302053059.1049035-1-drew@beagleboard.org/
