Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182D428AD7A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 07:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgJLFGh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 01:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725967AbgJLFGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 01:06:36 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0073C0613CE
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2020 22:06:36 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 144so12437819pfb.4
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2020 22:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JfnZseE44/VJaHDaIDHb7iTXzL4MBFhUtmodyI9eISk=;
        b=d09Cf2x+5VmfMhzLkcjIQ6N3xe/Khf8xHtrrd/UGENSGrgE+Ori8BNK2rhRdher+1P
         +14n8JYJzAtg8TtU7mxEOMe4Z3QyGsWevRz9Je8V0cbSHA6AHLkRtiw++kB04m8Xxczp
         DyTvDDZqpjrN9wQxqq1Ltl+oTSDBCQRlYhAmYE0lOShp8oSCtLlDxc8kxp9+/v5JEFke
         U3gj0Bcz4lMsYuxAcddg7tMXG/X1lUmbEuGf9hzMy4h6Y4ulh8kMonZDuMFRxZTa+pJj
         aP03YjmNzCggOCAyar2Shtvn/LuI/NZT5w0tz4fWIkD3oRD5eoYUWL00WWePvh9I9Lin
         HzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JfnZseE44/VJaHDaIDHb7iTXzL4MBFhUtmodyI9eISk=;
        b=M9aZSqMIJcNU9MXu5s5cV3CpPyhd4veAGoaLGt2wUfkrgfkCTM49+4S1xcx4Rw7VQp
         C04VjHLEnu3XQ4a51ee8zAV75DFjUsXxrvazjuAvZ+dUTqSAnsGZ4Cw7hRQkOuTf9hqK
         TZ67vxm+CvZcD6pkZiftidZoU+M3iI5abU2hOq9qeUgTnVhQhANIq9Jr8+prL2MewHul
         q7r3SQqHw6f9jQJYL45dYrCbELHelaoqHMbttuAoBqytRXOv/pKFoLj3XqEqSMt09hi4
         o+Z+GD/iGN7Ub8sKmw7Ee9Ty5tCkoHbkUwd88Fv6B+rFzkRXL4Jy4Kq2q6OdOTpZdUaG
         bNCw==
X-Gm-Message-State: AOAM5325jvuDnAVOJqu+bNAJYTDNZOuYn7l+FI8E8lPy95j9bhPEdO19
        BektW66dUZo/QPlCtaA6ya4xo9fDo/ZjLQ==
X-Google-Smtp-Source: ABdhPJy+B8Tqow/OmcK3F1/g44BryYk8Jk7WwHnLYDJLfjUokWA6XtFwq+c8XR4R/5QMg5PU/63M3g==
X-Received: by 2002:a17:90a:ab86:: with SMTP id n6mr4544846pjq.82.1602479196190;
        Sun, 11 Oct 2020 22:06:36 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id k9sm17375552pfc.96.2020.10.11.22.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 22:06:35 -0700 (PDT)
Date:   Mon, 12 Oct 2020 13:06:31 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Jack Winch <sunt.un.morcov@gmail.com>
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Subject: Re: Suggestion - Configurable Source Clock Type for Line Event
 Timestamping
Message-ID: <20201012050631.GA14076@sol>
References: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 11, 2020 at 03:15:01PM +0100, Jack Winch wrote:
> Hi Folks,
> 
> I recently noticed that in Linux 5.7, gpiolib was changed such that
> line events are now timestamped using the system 'monotonic' clock
> rather than the system realtime clock.  The rationale for this change
> appears to be due to the major use-case of the line event timestamp
> data in relation to the nature of the system realtime clock (which can
> jump backwards or forwards in time due to adjustments by third-parties
> - e.g., NTP or PTP clients, etc).
> 
> For most users of the line event timestamp value, the use of the
> realtime clock could be problematic due to the potential for
> chronological line events to receive timestamp values with a
> non-chronological progression (resulting from adjustments being made
> to the clock).  This could be the source of a number of bugs,
> functional limitations and frustrations which was solved easily enough
> by transitioning to the use of the system monotonic clock.  That being
> said, I know there are users of the line event timestamp who actively
> rely on that value being obtained from the system realtime clock.
> 
> My suggestion (which I would be happy to implement myself) is to allow
> users to select the clock to be used for line event timestamping on a
> per line handle basis.  The merit of this approach is that the
> appropriate clock type may be selected on a per line handle basis
> according to the needs of the user.  This of course has some
> implications which are not desirable without merit, but may be deemed
> acceptable in balance with the resultant functionality.  In summary,
> these are:
> 
> 1. Increase in processing overhead and latency of timestamp
> acquisition on line event interrupts.  Implementing the proposed
> change requires a function call to be made to the appropriate ktime
> accessor function, based on what the user has configured as the
> timestamp clock source.  In kernel versions from 5.7 to current, a
> call is made to the ktime_get_ns() function which is most likely
> inlined by the compiler.  This change will result in an actual jump
> having to be made, which will have processor and memory access
> overhead (potential I$ and D$ misses).  Then there is of course the
> overhead of resolving which function to call - either a switch
> statement or call by function pointer (probably the latter option).
> 
> 2. Additions required to the userspace ABI.  Additional IOCTLs will be
> required for line handles, allowing the source clock type for line
> event timestamping to be get or set.
> 
> 3. Additions required to libgpiod.  The existing API will have to be
> added to in order to provide an abstraction for this new
> functionality.  This requires changes to the core C library, as well
> as the provided C++ and Python bindings (and their test cases).
> Changes will also be required to the WiP libgpiod service and its
> d-bus interface.  This change will also affect the proposed future
> lightweight libgpiod service.
> 
> 4. Documentation for both the GPIO subsystem and libgpiod will require
> updating.  This should be done as part of the effort to implement this
> functionality (if agreed upon) for the target version of the kernel
> and libgpiod.
> 
> Such that applications now relying on the use of the 'monotonic'
> system clock for timestamping line events do not require modification
> after the implementation of this functionality (most applications), I
> propose the 'monotonic' system clock be the default source clock.  If
> the user wants to change this to another clock type, then they may do
> so via the proposed additional IOCTLs and / or the proposed changes to
> libgpiod.
> 
> I would be interested in hearing your thoughts on this suggestion / proposal.
> 

Hi Jack,

Adding Bart in - in case he hasn't noticed this one, as he is the
maintainer for the chardev and libgpiod.

Firstly, mapping from MONOTONIC to REALTIME is quite doable in
userspace, so I'd be more inclined to add a helper to libgpiod to do
that for you.

Secondly, an updated version of the uAPI, v2, is in line to be included
in Linux 5.10, so you should look at that.  Most of your points are
still valid as the MONOTONIC event timestamp is inherited from v1, but
there are more options available should we want to address this in kernel.
e.g. we could return BOTH timestamps in the event.

Also, assuming you were to implement this in kernel, it doesn't need a new
ioctl. It could be implemented by extending the flags field.

But I would want to rule out a userspace solution before entertaining a
kernel change.

Cheers,
Kent.
