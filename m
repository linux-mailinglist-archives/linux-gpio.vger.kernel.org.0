Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8687E28B140
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 11:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbgJLJOu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 05:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgJLJOu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 05:14:50 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEC9C0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 02:14:50 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id h6so13649859pgk.4
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 02:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:re;
        bh=uQpHGFwEBqJ0+gULBrj7TU8OMYurT4DNJYOv78JFoHA=;
        b=UbMjSIo/WOsdjBDmHWYj8BZKoPAsVuOgxlSwaMPT0m9e7Svq3Udj0D6MVlygPKUuAE
         qKbMQr5gHoqZqfCpSE5VXAyFcEKVbelf0H2IlPEVU90PkHKrimXav1sNtfLD0fH7Xggt
         7K2EJOOJIPr0UOUwW1ShWfhZYMejTpHWaj+GGRgGr2a/k3U7q3heGaIc4e4ZybI7jFTO
         yOS3bOsJgEsUTz/uBiTQEnjzIpdy2dsSdhTYbFvorju+UViCzQJoCA5WQrwlE2rAct3K
         x1zTNsvuRl5+SB2ekBgPCyf5FDmFBWQLvpNhzWNgIKN2NO0ZbELjyhK7jpV7l17uMnsb
         oD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:re;
        bh=uQpHGFwEBqJ0+gULBrj7TU8OMYurT4DNJYOv78JFoHA=;
        b=gaDo8ozth7RWlZUoCbkd+hDbCZ3aHcOg4Z+EhS8HD1/9TfKuqP6awkOu29Jv0zgmV8
         4ixNu6l9QvoxpI/B/3G4S88lA0p0WhQbhBA2WDWNwIE8fJOd28hx0qDz66rU41pJzzNQ
         4Uul4QMoXc+qp9eQr7JXh7hRMN434rwVCn11Xyn5efyUM7pYiggm9efJt5AKqRP2uyLM
         DkyC0usxQuOwfoGMNIGzwsnTgnWUh74AVoDQN5t0YaWPdo2ON0jaFq5rzbY/np2rKbQn
         zp2yQJJkC43IEqwwXjTT4uW8JSYiu9xvQqANg+CWFBw+pvVBoVIO+WnoO8UQojML71cX
         oP5g==
X-Gm-Message-State: AOAM530z2fPfyH4KUTir+4W1/dqvzAdp+WkVNNtJOnP5tm8oDeYBepGL
        OTZfNTYLCqmGS+OQap8QlmM=
X-Google-Smtp-Source: ABdhPJxmt8I3GyB9DkHqvevbS7h+I4Tb3OyRN3/OnXKPd0GnaHw5Sa3VFTKIuwmOgbGemz0tU3ro1A==
X-Received: by 2002:a17:90a:c297:: with SMTP id f23mr16553621pjt.72.1602494089812;
        Mon, 12 Oct 2020 02:14:49 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id b4sm15793002pjz.51.2020.10.12.02.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 02:14:49 -0700 (PDT)
Date:   Mon, 12 Oct 2020 17:14:45 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Jack Winch <sunt.un.morcov@gmail.com>
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Subject: Re: Suggestion - Configurable Source Clock Type for Line Event
 Timestamping
Message-ID: <20201012091059.GA21099@sol>
References: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
 <20201012050631.GA14076@sol>
 <CAFhCfDZ1uuvq6eBiXXcFndMJnWEwSTsEPS9v7vnXfdkgutmFAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFhCfDZ1uuvq6eBiXXcFndMJnWEwSTsEPS9v7vnXfdkgutmFAQ@mail.gmail.com>
Re:     Suggestion - Configurable Source Clock Type for Line Event Timestamping
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 12, 2020 at 08:23:09AM +0100, Jack Winch wrote:
> Hi Kent,
> 
> Thanks for the quick response. It was originally my intention to CC
> the pair of you on my original email, but I wasn't sure if it was 'the
> done thing'.
> 

It probably couldn't hurt, as would prefixing your subject with
[libgpiod] if it is only relevant to the chardev and libgpiod.

And including the relevant sections of the mail you are replying to helps
as well.

> For most of the users I previously referred to, minimum timestamping
> latency (using the realtime clock as the source) is crucial. A
> userspace solution might be suitable for the others, but for these
> wall clock time sensitive applications the acquisition of a timestamp
> value from the system realtime clock is required within the interrupt
> handling code.
> 
> For context, these wall clock time sensitive users are running on
> systems which are PTPv2 clients, with their system realtime clock
> synchronised to that of a local PTP Grand Master clock.  In the past,
> I have used the TTL Pulse Per Second (PPS) output of the Grand Master
> to evaluate methods of timestamping line events with wall clock time
> and it was the kernel timestamping which was most suitable for our
> application.
> 

So a mapping from the MONOTONIC timestamp, taken in the ISR and returned
in the event, to the equivalent REALTIME timestamp is not reliable as
there is jitter between the two clocks?

Cheers,
Kent.

> Another way to skin the cat could be to create separate kernel modules
> for these applications, with them acting as a consumer to the GPIO
> subsystem.  That way, interrupts could be setup and handled for line
> events, with these application specific kernel modules undertaking the
> timestamping using the realtime system clock within the module ISRs.
> But that would have to be assessed.
> 
> I still believe adding this functionality to the chardev would be
> beneficial for users, although I understand your preference for other
> solutions first.
> 
> Regarding the extending of the flags field, you're absolutely right.
> One thing I'd have to go over is how changes to the use of that flag
> field could effect other parts of the subsystem.  I would expect that
> this change will only be utilised by the chardev in the first instance
> however.
> 
> I also have a couple of other queries regarding the current and future
> state of libgpiod, but I will submit those via a separate thread of
> discussion in order to keep each discussion appropriately partitioned.
> 
> Thanks,
> Jack
