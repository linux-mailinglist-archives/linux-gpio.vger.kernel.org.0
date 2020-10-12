Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5893428AFF4
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 10:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgJLITs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 04:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgJLITr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 04:19:47 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DB4C0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 01:19:47 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id e23so9368716wme.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 01:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4A80VRclDF5wRFxnat0XzWCkHTHFmDFlc7AYtFV7UlE=;
        b=VJfQISoHfCDI/g0MEt3vvTnG8R/jMkwlKvIg6TcGvyLoHSbq3lUvBJN3guASWcrz3T
         P33WVMwT2mEnUV+sRVM+WITBIzq+lkSJ/iRoiyMw6pIoEwEzDGDvvkKNQ5EjLrNMf2PH
         S0wyCSRbxu0A6bkaRD/mSRRvBkDuzneoR1zwwrj0yQFpFroe7riSKTXbx88D4zfY+TTf
         pOCk0RQ9zMQ9TZKBl0a/lWCOGK9Ng90gfRFBDU1SaqkheFWAm+i6x8qOIENJ7iSvTYk0
         L1mqMstALULGvlDDfXSMi5uLDYFwC/wUQkPaubLAZgx0mseW2ufxaf1pG21NZwr7vrYo
         3Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4A80VRclDF5wRFxnat0XzWCkHTHFmDFlc7AYtFV7UlE=;
        b=T8sVhRUTSlJ+6hHG8wZLu8SRrudSyqwqxo9WPEGdjyWPaR2sOoGjWrGv8/Bx6WvCgw
         iqjCRZYI2QsHqBRz4mpKpBx6LIxEyr4p4Qe/OrLPZxpgq2iaJXqZ9zWqPv45LZzOILvu
         5X3vadpx0B1aSn8AV8tkJDBUMxnnOkpWk0L1asHEKnNYcgP4Bj5WYIfUm5MudH3BgcWr
         1H2Jf5JHBy6pmxf9JhfocnFQt9d+uK0P1JvnGT+XtTqbmB3el+qqQhbXEvsZqgKZV0Gv
         oRSqmiZetqjjNQAzYoCxmcuQjm3ppvuPJ8w+XGQ6sEyePs2Uu4f5khvdkfWmtWzXPPpr
         dMJg==
X-Gm-Message-State: AOAM533tjgkXH7PLRGSMynuRhBq7QU2+5wbr+toyb2QoMA0YqE7WBG38
        YsGqgMT542VXEjVK1FTG7Eve7I7y4KuZ6xCdzOs=
X-Google-Smtp-Source: ABdhPJzqM3/aym4RlN/SgxkJMqSGO1AamZaGecejplI+Hhpmkla3zuEJAysaTcVNStraCZHpJ3NjmX/oO+VRgShg0qc=
X-Received: by 2002:a1c:b6d5:: with SMTP id g204mr9691416wmf.65.1602490785906;
 Mon, 12 Oct 2020 01:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
 <20201012050631.GA14076@sol>
In-Reply-To: <20201012050631.GA14076@sol>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Mon, 12 Oct 2020 08:23:09 +0100
Message-ID: <CAFhCfDZ1uuvq6eBiXXcFndMJnWEwSTsEPS9v7vnXfdkgutmFAQ@mail.gmail.com>
Subject: Re: Suggestion - Configurable Source Clock Type for Line Event Timestamping
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Kent,

Thanks for the quick response. It was originally my intention to CC
the pair of you on my original email, but I wasn't sure if it was 'the
done thing'.

For most of the users I previously referred to, minimum timestamping
latency (using the realtime clock as the source) is crucial. A
userspace solution might be suitable for the others, but for these
wall clock time sensitive applications the acquisition of a timestamp
value from the system realtime clock is required within the interrupt
handling code.

For context, these wall clock time sensitive users are running on
systems which are PTPv2 clients, with their system realtime clock
synchronised to that of a local PTP Grand Master clock.  In the past,
I have used the TTL Pulse Per Second (PPS) output of the Grand Master
to evaluate methods of timestamping line events with wall clock time
and it was the kernel timestamping which was most suitable for our
application.

Another way to skin the cat could be to create separate kernel modules
for these applications, with them acting as a consumer to the GPIO
subsystem.  That way, interrupts could be setup and handled for line
events, with these application specific kernel modules undertaking the
timestamping using the realtime system clock within the module ISRs.
But that would have to be assessed.

I still believe adding this functionality to the chardev would be
beneficial for users, although I understand your preference for other
solutions first.

Regarding the extending of the flags field, you're absolutely right.
One thing I'd have to go over is how changes to the use of that flag
field could effect other parts of the subsystem.  I would expect that
this change will only be utilised by the chardev in the first instance
however.

I also have a couple of other queries regarding the current and future
state of libgpiod, but I will submit those via a separate thread of
discussion in order to keep each discussion appropriately partitioned.

Thanks,
Jack
