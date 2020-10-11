Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF6128A7EB
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Oct 2020 17:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730182AbgJKPLm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Oct 2020 11:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730174AbgJKPLm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Oct 2020 11:11:42 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2FFC0613CE
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2020 08:11:42 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e17so16009563wru.12
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2020 08:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=IQiAOpIicdDl63N9K5GYRrgI1FHgXBQgIn9VJVUpIkk=;
        b=q4HQ3N2acdhdGPU+aQyLyHGmmoK7FK70S1U8990iVPDKJPmygj44ADj3vsUH5J/GY3
         jLbH1RQAP0GVB0hiUaa5OTQK5D8UoLAINeAah5tgyvlfexIXt+2EYNeq+Cb1puZ3A+Rg
         fUaSGGAh/5B7gBvDqYqgJQu/wW/Xn9UUu5FHA2FZNSvmCZY+xO3eCCAIw3FECW7Jd9yQ
         utp9GqWEjZ+uvTxt6Mg1wzdMwejljksvtOknV7q8Hs/WUL/XWM0sNhXoF0j8Zg4o0KpT
         +eqYKzX2a8HEBUeej9SO8ZZ5gDgEOK2LZYhPG7vNASpv37EXuv+1UbJKy0JFa56jm6g/
         aCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IQiAOpIicdDl63N9K5GYRrgI1FHgXBQgIn9VJVUpIkk=;
        b=Tt9MQzOuW8bB/D78g59kPrqsHhBwvQcvV+MMw0d8pp84XkCiu8Xzu0Sbwag/9dOf/j
         t5G21sahl+5SFsdJIZYMzaAK5BvmPO9bITp8gD6JlQJDVuXXhqpdSRPoAU8F1CcJcwaz
         9N9lv0VbmHLxc8zbOSOcCFF1SbVzmcOfisgLXIljGyYWlvSfVFwW8HXRO3SxkY7h1ec2
         gunB1hUokMBUqssEJ5418xkfAiK9xY2gxSe/rjwYzjwcj7tMeU9ndu+PkRhbhwqKviyQ
         AVM2XjuRV8O5Sl3IvH8u/sAf+73sBZjOgXbuSsRHIfr432q+tgMaay+T4R2GJkIb2Rbk
         n/MA==
X-Gm-Message-State: AOAM532X735Ig8V4mkb4qj/lMSjxlB3zNE4pO5zcaRbFazk/UYSRAieL
        4SqyFFczI74vqkawfG+RHCEMDmtOhaEwL4izlwEIzONaMV8=
X-Google-Smtp-Source: ABdhPJwEmy5oHcm4r7spya7uZydkNNsnFfD98gk/wmrZh+z3W0T7wfkfDpqc0RZ3tt/5uwGtJ0jeZfJ7rb90sqFHLPE=
X-Received: by 2002:adf:e7c8:: with SMTP id e8mr26529860wrn.358.1602429099224;
 Sun, 11 Oct 2020 08:11:39 -0700 (PDT)
MIME-Version: 1.0
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Sun, 11 Oct 2020 15:15:01 +0100
Message-ID: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
Subject: Suggestion - Configurable Source Clock Type for Line Event Timestamping
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Folks,

I recently noticed that in Linux 5.7, gpiolib was changed such that
line events are now timestamped using the system 'monotonic' clock
rather than the system realtime clock.  The rationale for this change
appears to be due to the major use-case of the line event timestamp
data in relation to the nature of the system realtime clock (which can
jump backwards or forwards in time due to adjustments by third-parties
- e.g., NTP or PTP clients, etc).

For most users of the line event timestamp value, the use of the
realtime clock could be problematic due to the potential for
chronological line events to receive timestamp values with a
non-chronological progression (resulting from adjustments being made
to the clock).  This could be the source of a number of bugs,
functional limitations and frustrations which was solved easily enough
by transitioning to the use of the system monotonic clock.  That being
said, I know there are users of the line event timestamp who actively
rely on that value being obtained from the system realtime clock.

My suggestion (which I would be happy to implement myself) is to allow
users to select the clock to be used for line event timestamping on a
per line handle basis.  The merit of this approach is that the
appropriate clock type may be selected on a per line handle basis
according to the needs of the user.  This of course has some
implications which are not desirable without merit, but may be deemed
acceptable in balance with the resultant functionality.  In summary,
these are:

1. Increase in processing overhead and latency of timestamp
acquisition on line event interrupts.  Implementing the proposed
change requires a function call to be made to the appropriate ktime
accessor function, based on what the user has configured as the
timestamp clock source.  In kernel versions from 5.7 to current, a
call is made to the ktime_get_ns() function which is most likely
inlined by the compiler.  This change will result in an actual jump
having to be made, which will have processor and memory access
overhead (potential I$ and D$ misses).  Then there is of course the
overhead of resolving which function to call - either a switch
statement or call by function pointer (probably the latter option).

2. Additions required to the userspace ABI.  Additional IOCTLs will be
required for line handles, allowing the source clock type for line
event timestamping to be get or set.

3. Additions required to libgpiod.  The existing API will have to be
added to in order to provide an abstraction for this new
functionality.  This requires changes to the core C library, as well
as the provided C++ and Python bindings (and their test cases).
Changes will also be required to the WiP libgpiod service and its
d-bus interface.  This change will also affect the proposed future
lightweight libgpiod service.

4. Documentation for both the GPIO subsystem and libgpiod will require
updating.  This should be done as part of the effort to implement this
functionality (if agreed upon) for the target version of the kernel
and libgpiod.

Such that applications now relying on the use of the 'monotonic'
system clock for timestamping line events do not require modification
after the implementation of this functionality (most applications), I
propose the 'monotonic' system clock be the default source clock.  If
the user wants to change this to another clock type, then they may do
so via the proposed additional IOCTLs and / or the proposed changes to
libgpiod.

I would be interested in hearing your thoughts on this suggestion / proposal.

~ Jack
